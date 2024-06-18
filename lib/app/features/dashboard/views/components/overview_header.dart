part of dashboard;

class _OverviewHeader extends StatefulWidget {
  const _OverviewHeader({
    required this.onSelected,
    this.axis = Axis.horizontal,
    Key? key,
  }) : super(key: key);

  final Function(TaskType? task) onSelected;
  final Axis axis;

  @override
  State<_OverviewHeader> createState() => _OverviewHeaderState();
}

class _OverviewHeaderState extends State<_OverviewHeader> {
  TaskType? _selectedTask;

  @override
  Widget build(BuildContext context) {
    return (widget.axis == Axis.horizontal)
        ? Row(
      children: [
        const Text(
          "Task Overview",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        ..._listButton(
          task: _selectedTask,
          onSelected: (value) {
            setState(() {
              _selectedTask = value;
            });
            widget.onSelected(value);
          },
        )
      ],
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Task Overview",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: _listButton(
              task: _selectedTask,
              onSelected: (value) {
                setState(() {
                  _selectedTask = value;
                });
                widget.onSelected(value);
              },
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _listButton({
    required TaskType? task,
    required Function(TaskType? value) onSelected,
  }) {
    return [
      _button(
        selected: task == null,
        label: "All",
        onPressed: () {
          onSelected(null);
        },
      ),
      _button(
        selected: task == TaskType.todo,
        label: "To do",
        onPressed: () {
          onSelected(TaskType.todo);
        },
      ),
      _button(
        selected: task == TaskType.inProgress,
        label: "In progress",
        onPressed: () {
          onSelected(TaskType.inProgress);
        },
      ),
      _button(
        selected: task == TaskType.done,
        label: "Done",
        onPressed: () {
          onSelected(TaskType.done);
        },
      ),
    ];
  }

  Widget _button({
    required bool selected,
    required String label,
    required Function() onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor:
          selected ? kFontColorPallets[0] : kFontColorPallets[2],
          backgroundColor: selected
              ? Theme.of(context).cardColor
              : Theme.of(context).canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
