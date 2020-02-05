Content-Type: multipart/mixed; boundary="===============0576121612691288277=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [zen-kernel-zen-kernel:5.5/muqss 11/16] kernel/time/timer.c:2072:62: error: 'pm_freezing' undeclared; did you mean 'sg_free_fn'?
Date: Thu, 06 Feb 2020 01:35:17 +0800
Message-ID: <202002060121.bcda9lDI%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0576121612691288277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 5.5/muqss
head:   ac994d428ce6eaa4c05a2b4a2083a32fcc55c682
commit: 7b7af7a285eec9992478fa7c6bfae459d61814f7 [11/16] muqss: Reduce impa=
ct on non-MuQSS build
config: alpha-defconfig (attached as .config)
compiler: alpha-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 7b7af7a285eec9992478fa7c6bfae459d61814f7
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dalpha =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

Note: the zen-kernel-zen-kernel/5.5/muqss HEAD ac994d428ce6eaa4c05a2b4a2083=
a32fcc55c682 builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>):

   kernel/time/timer.c: In function 'schedule_timeout':
   kernel/time/timer.c:1920:1: warning: label 'out_timeout' defined but not=
 used [-Wunused-label]
    out_timeout:
    ^~~~~~~~~~~
   kernel/time/timer.c: In function 'msleep':
>> kernel/time/timer.c:2072:62: error: 'pm_freezing' undeclared (first use =
in this function); did you mean 'sg_free_fn'?
     if (jiffs < 5 && hrtimer_resolution < NSEC_PER_SEC / HZ && !pm_freezin=
g) {
                                                                 ^~~~~~~~~~~
                                                                 sg_free_fn
   kernel/time/timer.c:2072:62: note: each undeclared identifier is reporte=
d only once for each function it appears in
   kernel/time/timer.c: In function 'msleep_interruptible':
   kernel/time/timer.c:2094:62: error: 'pm_freezing' undeclared (first use =
in this function); did you mean 'sg_free_fn'?
     if (jiffs < 5 && hrtimer_resolution < NSEC_PER_SEC / HZ && !pm_freezin=
g) {
                                                                 ^~~~~~~~~~~
                                                                 sg_free_fn
--
   kernel/time/hrtimer.c:2217:14: error: redefinition of 'schedule_msec_hrt=
imeout'
    long __sched schedule_msec_hrtimeout(long timeout)
                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ratelimit.h:6:0,
                    from include/linux/device.h:25,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   include/linux/sched.h:233:20: note: previous definition of 'schedule_mse=
c_hrtimeout' was here
    static inline long schedule_msec_hrtimeout(long timeout)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: In function 'schedule_msec_hrtimeout':
>> kernel/time/hrtimer.c:2234:62: error: 'pm_freezing' undeclared (first us=
e in this function); did you mean 'freezing'?
     if (jiffs > 4 || hrtimer_resolution >=3D NSEC_PER_SEC / HZ || pm_freez=
ing)
                                                                 ^~~~~~~~~~~
                                                                 freezing
   kernel/time/hrtimer.c:2234:62: note: each undeclared identifier is repor=
ted only once for each function it appears in
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:2302:14: error: redefinition of 'schedule_min_hrti=
meout'
    long __sched schedule_min_hrtimeout(void)
                 ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ratelimit.h:6:0,
                    from include/linux/device.h:25,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   include/linux/sched.h:238:20: note: previous definition of 'schedule_min=
_hrtimeout' was here
    static inline long schedule_min_hrtimeout(void)
                       ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:2309:14: error: redefinition of 'schedule_msec_hrt=
imeout_interruptible'
    long __sched schedule_msec_hrtimeout_interruptible(long timeout)
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ratelimit.h:6:0,
                    from include/linux/device.h:25,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   include/linux/sched.h:243:20: note: previous definition of 'schedule_mse=
c_hrtimeout_interruptible' was here
    static inline long schedule_msec_hrtimeout_interruptible(long timeout)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:2316:14: error: redefinition of 'schedule_msec_hrt=
imeout_uninterruptible'
    long __sched schedule_msec_hrtimeout_uninterruptible(long timeout)
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ratelimit.h:6:0,
                    from include/linux/device.h:25,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   include/linux/sched.h:248:20: note: previous definition of 'schedule_mse=
c_hrtimeout_uninterruptible' was here
    static inline long schedule_msec_hrtimeout_uninterruptible(long timeout)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +2072 kernel/time/timer.c

^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
34  =

^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
35  /**
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
36   * schedule_timeout - sleep until timeout
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
37   * @timeout: timeout value in jiffies
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
38   *
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
39   * Make the current task sleep until @timeout jiffies have
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
40   * elapsed. The routine will return immediately unless
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
41   * the current task state has been set (see set_current_state()).
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
42   *
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
43   * You can set the task state as follows -
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
44   *
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
45   * %TASK_UNINTERRUPTIBLE - at least @timeout jiffies are guaranteed to
4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson          2016-10-21  18=
46   * pass before the routine returns unless the current task is explicitly
4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson          2016-10-21  18=
47   * woken up, (e.g. by wake_up_process())".
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
48   *
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
49   * %TASK_INTERRUPTIBLE - the routine may return early if a signal is
4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson          2016-10-21  18=
50   * delivered to the current task or the current task is explicitly woken
4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson          2016-10-21  18=
51   * up.
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
52   *
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
53   * The current task state is guaranteed to be TASK_RUNNING when this
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
54   * routine returns.
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
55   *
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
56   * Specifying a @timeout value of %MAX_SCHEDULE_TIMEOUT will schedule
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
57   * the CPU away without a bound on the timeout. In this case the return
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
58   * value will be %MAX_SCHEDULE_TIMEOUT.
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
59   *
4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson          2016-10-21  18=
60   * Returns 0 when the timer has expired otherwise the remaining time in
4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson          2016-10-21  18=
61   * jiffies will be returned.  In all cases the return value is guarante=
ed
4b7e9cf9c84b09 kernel/time/timer.c Douglas Anderson          2016-10-21  18=
62   * to be non-negative.
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
63   */
7ad5b3a505e68c kernel/timer.c      Harvey Harrison           2008-02-08  18=
64  signed long __sched schedule_timeout(signed long timeout)
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
65  {
58e1177b4cd10b kernel/time/timer.c Kees Cook                 2017-10-04  18=
66  	struct process_timer timer;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
67  	unsigned long expire;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
68  =

^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
69  	switch (timeout)
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
70  	{
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
71  	case MAX_SCHEDULE_TIMEOUT:
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
72  		/*
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
73  		 * These two special cases are useful to be comfortable
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
74  		 * in the caller. Nothing more. We could take
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
75  		 * MAX_SCHEDULE_TIMEOUT from one of the negative value
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
76  		 * but I' d like to return a valid offset (>=3D0) to allow
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
77  		 * the caller to do everything it want with the retval.
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
78  		 */
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
79  		schedule();
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
80  		goto out;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
81  	default:
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
82  		/*
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
83  		 * Another bit of PARANOID. Note that the retval will be
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
84  		 * 0 since no piece of kernel is supposed to do a check
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
85  		 * for a negative retval of schedule_timeout() (since it
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
86  		 * should never happens anyway). You just have the printk()
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
87  		 * that will tell you if something is gone wrong and where.
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
88  		 */
5b149bcc230e46 kernel/timer.c      Andrew Morton             2006-12-22  18=
89  		if (timeout < 0) {
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
90  			printk(KERN_ERR "schedule_timeout: wrong timeout "
5b149bcc230e46 kernel/timer.c      Andrew Morton             2006-12-22  18=
91  				"value %lx\n", timeout);
5b149bcc230e46 kernel/timer.c      Andrew Morton             2006-12-22  18=
92  			dump_stack();
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
93  			current->state =3D TASK_RUNNING;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
94  			goto out;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
95  		}
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
96  	}
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
97  =

^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
98  	expire =3D timeout + jiffies;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  18=
99  =

f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
00  #ifdef CONFIG_HIGH_RES_TIMERS
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
01  	if (timeout =3D=3D 1 && hrtimer_resolution < NSEC_PER_SEC / HZ) {
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
02  		/*
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
03  		 * Special case 1 as being a request for the minimum timeout
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
04  		 * and use highres timers to timeout after 1ms to workaround
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
05  		 * the granularity of low Hz tick timers.
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
06  		 */
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
07  		if (!schedule_min_hrtimeout())
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
08  			return 0;
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
09  		goto out_timeout;
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
10  	}
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05  19=
11  #endif
58e1177b4cd10b kernel/time/timer.c Kees Cook                 2017-10-04  19=
12  	timer.task =3D current;
58e1177b4cd10b kernel/time/timer.c Kees Cook                 2017-10-04  19=
13  	timer_setup_on_stack(&timer.timer, process_timeout, 0);
b24591e2fcf852 kernel/time/timer.c David Howells             2017-11-09  19=
14  	__mod_timer(&timer.timer, expire, 0);
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
15  	schedule();
58e1177b4cd10b kernel/time/timer.c Kees Cook                 2017-10-04  19=
16  	del_singleshot_timer_sync(&timer.timer);
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
17  =

c6f3a97f86a5c9 kernel/timer.c      Thomas Gleixner           2008-04-30  19=
18  	/* Remove the timer from the object tracker */
58e1177b4cd10b kernel/time/timer.c Kees Cook                 2017-10-04  19=
19  	destroy_timer_on_stack(&timer.timer);
f161180432027f kernel/time/timer.c Con Kolivas               2016-11-05 @19=
20  out_timeout:
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
21  	timeout =3D expire - jiffies;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
22  =

^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
23  out:
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
24  	return timeout < 0 ? 0 : timeout;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
25  }
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
26  EXPORT_SYMBOL(schedule_timeout);
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
27  =

8a1c17574a0155 kernel/timer.c      Andrew Morton             2005-09-13  19=
28  /*
8a1c17574a0155 kernel/timer.c      Andrew Morton             2005-09-13  19=
29   * We can use __set_current_state() here because schedule_timeout() cal=
ls
8a1c17574a0155 kernel/timer.c      Andrew Morton             2005-09-13  19=
30   * schedule() unconditionally.
8a1c17574a0155 kernel/timer.c      Andrew Morton             2005-09-13  19=
31   */
64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
32  signed long __sched schedule_timeout_interruptible(signed long timeout)
64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
33  {
8a1c17574a0155 kernel/timer.c      Andrew Morton             2005-09-13  19=
34  	__set_current_state(TASK_INTERRUPTIBLE);
64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
35  	return schedule_timeout(timeout);
64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
36  }
64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
37  EXPORT_SYMBOL(schedule_timeout_interruptible);
64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
38  =

294d5cc233d81e kernel/timer.c      Matthew Wilcox            2007-12-06  19=
39  signed long __sched schedule_timeout_killable(signed long timeout)
294d5cc233d81e kernel/timer.c      Matthew Wilcox            2007-12-06  19=
40  {
294d5cc233d81e kernel/timer.c      Matthew Wilcox            2007-12-06  19=
41  	__set_current_state(TASK_KILLABLE);
294d5cc233d81e kernel/timer.c      Matthew Wilcox            2007-12-06  19=
42  	return schedule_timeout(timeout);
294d5cc233d81e kernel/timer.c      Matthew Wilcox            2007-12-06  19=
43  }
294d5cc233d81e kernel/timer.c      Matthew Wilcox            2007-12-06  19=
44  EXPORT_SYMBOL(schedule_timeout_killable);
294d5cc233d81e kernel/timer.c      Matthew Wilcox            2007-12-06  19=
45  =

64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
46  signed long __sched schedule_timeout_uninterruptible(signed long timeou=
t)
64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
47  {
8a1c17574a0155 kernel/timer.c      Andrew Morton             2005-09-13  19=
48  	__set_current_state(TASK_UNINTERRUPTIBLE);
64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
49  	return schedule_timeout(timeout);
64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
50  }
64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
51  EXPORT_SYMBOL(schedule_timeout_uninterruptible);
64ed93a268bc18 kernel/timer.c      Nishanth Aravamudan       2005-09-10  19=
52  =

69b27baf00fa9b kernel/time/timer.c Andrew Morton             2016-03-25  19=
53  /*
69b27baf00fa9b kernel/time/timer.c Andrew Morton             2016-03-25  19=
54   * Like schedule_timeout_uninterruptible(), except this task will not c=
ontribute
69b27baf00fa9b kernel/time/timer.c Andrew Morton             2016-03-25  19=
55   * to load average.
69b27baf00fa9b kernel/time/timer.c Andrew Morton             2016-03-25  19=
56   */
69b27baf00fa9b kernel/time/timer.c Andrew Morton             2016-03-25  19=
57  signed long __sched schedule_timeout_idle(signed long timeout)
69b27baf00fa9b kernel/time/timer.c Andrew Morton             2016-03-25  19=
58  {
69b27baf00fa9b kernel/time/timer.c Andrew Morton             2016-03-25  19=
59  	__set_current_state(TASK_IDLE);
69b27baf00fa9b kernel/time/timer.c Andrew Morton             2016-03-25  19=
60  	return schedule_timeout(timeout);
69b27baf00fa9b kernel/time/timer.c Andrew Morton             2016-03-25  19=
61  }
69b27baf00fa9b kernel/time/timer.c Andrew Morton             2016-03-25  19=
62  EXPORT_SYMBOL(schedule_timeout_idle);
69b27baf00fa9b kernel/time/timer.c Andrew Morton             2016-03-25  19=
63  =

^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
64  #ifdef CONFIG_HOTPLUG_CPU
494af3ed7848de kernel/time/timer.c Thomas Gleixner           2016-07-04  19=
65  static void migrate_timer_list(struct timer_base *new_base, struct hlis=
t_head *head)
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
66  {
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
67  	struct timer_list *timer;
0eeda71bc30d74 kernel/time/timer.c Thomas Gleixner           2015-05-26  19=
68  	int cpu =3D new_base->cpu;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
69  =

1dabbcec2c0a36 kernel/time/timer.c Thomas Gleixner           2015-05-26  19=
70  	while (!hlist_empty(head)) {
1dabbcec2c0a36 kernel/time/timer.c Thomas Gleixner           2015-05-26  19=
71  		timer =3D hlist_entry(head->first, struct timer_list, entry);
ec44bc7acc3687 kernel/timer.c      Thomas Gleixner           2012-05-25  19=
72  		detach_timer(timer, false);
0eeda71bc30d74 kernel/time/timer.c Thomas Gleixner           2015-05-26  19=
73  		timer->flags =3D (timer->flags & ~TIMER_BASEMASK) | cpu;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
74  		internal_add_timer(new_base, timer);
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
75  	}
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
76  }
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
77  =

26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
78  int timers_prepare_cpu(unsigned int cpu)
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
79  {
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
80  	struct timer_base *base;
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
81  	int b;
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
82  =

26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
83  	for (b =3D 0; b < NR_BASES; b++) {
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
84  		base =3D per_cpu_ptr(&timer_bases[b], cpu);
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
85  		base->clk =3D jiffies;
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
86  		base->next_expiry =3D base->clk + NEXT_TIMER_MAX_DELTA;
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
87  		base->is_idle =3D false;
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
88  		base->must_forward_clk =3D true;
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
89  	}
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
90  	return 0;
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
91  }
26456f87aca715 kernel/time/timer.c Thomas Gleixner           2017-12-27  19=
92  =

24f73b99716a9c kernel/time/timer.c Richard Cochran           2016-07-13  19=
93  int timers_dead_cpu(unsigned int cpu)
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
94  {
494af3ed7848de kernel/time/timer.c Thomas Gleixner           2016-07-04  19=
95  	struct timer_base *old_base;
494af3ed7848de kernel/time/timer.c Thomas Gleixner           2016-07-04  19=
96  	struct timer_base *new_base;
500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  19=
97  	int b, i;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
98  =

^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  19=
99  	BUG_ON(cpu_online(cpu));
500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
00  =

500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
01  	for (b =3D 0; b < NR_BASES; b++) {
500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
02  		old_base =3D per_cpu_ptr(&timer_bases[b], cpu);
500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
03  		new_base =3D get_cpu_ptr(&timer_bases[b]);
d82f0b0f6f1a0a kernel/timer.c      Oleg Nesterov             2008-08-20  20=
04  		/*
d82f0b0f6f1a0a kernel/timer.c      Oleg Nesterov             2008-08-20  20=
05  		 * The caller is globally serialized and nobody else
d82f0b0f6f1a0a kernel/timer.c      Oleg Nesterov             2008-08-20  20=
06  		 * takes two locks@once, deadlock is not possible.
d82f0b0f6f1a0a kernel/timer.c      Oleg Nesterov             2008-08-20  20=
07  		 */
2287d8664fe734 kernel/time/timer.c Sebastian Andrzej Siewior 2017-06-27  20=
08  		raw_spin_lock_irq(&new_base->lock);
2287d8664fe734 kernel/time/timer.c Sebastian Andrzej Siewior 2017-06-27  20=
09  		raw_spin_lock_nested(&old_base->lock, SINGLE_DEPTH_NESTING);
3691c5199e8a4b kernel/timer.c      Oleg Nesterov             2006-03-31  20=
10  =

c52232a49e203a kernel/time/timer.c Lingutla Chandrasekhar    2018-01-18  20=
11  		/*
c52232a49e203a kernel/time/timer.c Lingutla Chandrasekhar    2018-01-18  20=
12  		 * The current CPUs base clock might be stale. Update it
c52232a49e203a kernel/time/timer.c Lingutla Chandrasekhar    2018-01-18  20=
13  		 * before moving the timers over.
c52232a49e203a kernel/time/timer.c Lingutla Chandrasekhar    2018-01-18  20=
14  		 */
c52232a49e203a kernel/time/timer.c Lingutla Chandrasekhar    2018-01-18  20=
15  		forward_timer_base(new_base);
c52232a49e203a kernel/time/timer.c Lingutla Chandrasekhar    2018-01-18  20=
16  =

3691c5199e8a4b kernel/timer.c      Oleg Nesterov             2006-03-31  20=
17  		BUG_ON(old_base->running_timer);
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
18  =

500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
19  		for (i =3D 0; i < WHEEL_SIZE; i++)
500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
20  			migrate_timer_list(new_base, old_base->vectors + i);
8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
21  =

2287d8664fe734 kernel/time/timer.c Sebastian Andrzej Siewior 2017-06-27  20=
22  		raw_spin_unlock(&old_base->lock);
2287d8664fe734 kernel/time/timer.c Sebastian Andrzej Siewior 2017-06-27  20=
23  		raw_spin_unlock_irq(&new_base->lock);
494af3ed7848de kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
24  		put_cpu_ptr(&timer_bases);
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
25  	}
24f73b99716a9c kernel/time/timer.c Richard Cochran           2016-07-13  20=
26  	return 0;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
27  }
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
28  =

3650b57fdf208b kernel/time/timer.c Peter Zijlstra            2015-03-31  20=
29  #endif /* CONFIG_HOTPLUG_CPU */
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
30  =

0eeda71bc30d74 kernel/time/timer.c Thomas Gleixner           2015-05-26  20=
31  static void __init init_timer_cpu(int cpu)
8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
32  {
500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
33  	struct timer_base *base;
500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
34  	int i;
3650b57fdf208b kernel/time/timer.c Peter Zijlstra            2015-03-31  20=
35  =

500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
36  	for (i =3D 0; i < NR_BASES; i++) {
500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
37  		base =3D per_cpu_ptr(&timer_bases[i], cpu);
8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
38  		base->cpu =3D cpu;
2287d8664fe734 kernel/time/timer.c Sebastian Andrzej Siewior 2017-06-27  20=
39  		raw_spin_lock_init(&base->lock);
494af3ed7848de kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
40  		base->clk =3D jiffies;
030dcdd197d773 kernel/time/timer.c Anna-Maria Gleixner       2019-07-26  20=
41  		timer_base_init_expiry_lock(base);
500462a9de657f kernel/time/timer.c Thomas Gleixner           2016-07-04  20=
42  	}
8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
43  }
8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
44  =

8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
45  static void __init init_timer_cpus(void)
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
46  {
8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
47  	int cpu;
07dccf3344010f kernel/timer.c      Akinobu Mita              2006-09-29  20=
48  =

0eeda71bc30d74 kernel/time/timer.c Thomas Gleixner           2015-05-26  20=
49  	for_each_possible_cpu(cpu)
0eeda71bc30d74 kernel/time/timer.c Thomas Gleixner           2015-05-26  20=
50  		init_timer_cpu(cpu);
8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
51  }
8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
52  =

8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
53  void __init init_timers(void)
8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
54  {
8def906044c02e kernel/time/timer.c Viresh Kumar              2015-03-31  20=
55  	init_timer_cpus();
962cf36c5bf6d2 kernel/timer.c      Carlos R. Mafra           2008-05-15  20=
56  	open_softirq(TIMER_SOFTIRQ, run_timer_softirq);
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
57  }
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
58  =

^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
59  /**
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
60   * msleep - sleep safely even with waitqueue interruptions
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
61   * @msecs: Time in milliseconds to sleep for
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
62   */
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
63  void msleep(unsigned int msecs)
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
64  {
7b36d80a31c58f kernel/time/timer.c Con Kolivas               2016-11-04  20=
65  	int jiffs =3D msecs_to_jiffies(msecs);
7b36d80a31c58f kernel/time/timer.c Con Kolivas               2016-11-04  20=
66  	unsigned long timeout;
7b36d80a31c58f kernel/time/timer.c Con Kolivas               2016-11-04  20=
67  =

7b36d80a31c58f kernel/time/timer.c Con Kolivas               2016-11-04  20=
68  	/*
7b36d80a31c58f kernel/time/timer.c Con Kolivas               2016-11-04  20=
69  	 * Use high resolution timers where the resolution of tick based
7b36d80a31c58f kernel/time/timer.c Con Kolivas               2016-11-04  20=
70  	 * timers is inadequate.
7b36d80a31c58f kernel/time/timer.c Con Kolivas               2016-11-04  20=
71  	 */
5f4147bbea544c kernel/time/timer.c Con Kolivas               2017-02-20 @20=
72  	if (jiffs < 5 && hrtimer_resolution < NSEC_PER_SEC / HZ && !pm_freezin=
g) {
7b36d80a31c58f kernel/time/timer.c Con Kolivas               2016-11-04  20=
73  		while (msecs)
7b36d80a31c58f kernel/time/timer.c Con Kolivas               2016-11-04  20=
74  			msecs =3D schedule_msec_hrtimeout_uninterruptible(msecs);
7b36d80a31c58f kernel/time/timer.c Con Kolivas               2016-11-04  20=
75  		return;
7b36d80a31c58f kernel/time/timer.c Con Kolivas               2016-11-04  20=
76  	}
5f4147bbea544c kernel/time/timer.c Con Kolivas               2017-02-20  20=
77  	timeout =3D jiffs + 1;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
78  =

75bcc8c5e1de78 kernel/timer.c      Nishanth Aravamudan       2005-09-10  20=
79  	while (timeout)
75bcc8c5e1de78 kernel/timer.c      Nishanth Aravamudan       2005-09-10  20=
80  		timeout =3D schedule_timeout_uninterruptible(timeout);
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
81  }
^1da177e4c3f41 kernel/timer.c      Linus Torvalds            2005-04-16  20=
82  =


:::::: The code@line 2072 was first introduced by commit
:::::: 5f4147bbea544c0e753f1c05ad76df4625496807 Don't use hrtimer overlay w=
hen pm_freezing since some drivers still don't correctly use freezable time=
outs.

:::::: TO: Con Kolivas <kernel@kolivas.org>
:::::: CC: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============0576121612691288277==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICHLsOl4AAy5jb25maWcAnFxZc+M2tn7Pr2AlVbeSqkkiy0u355YfQBCkMCIJGgC19AtLbbO7
VbEljyQn6X9/D8BFIAVQyq2aTJs4H7aDg7MB0E8//OSh98P2dXVYP61eXr57X8tNuVsdymfvy/ql
/F8vYF7KpEcCKn8DcLzevP/9++rl7dvKu/3t9reRNy13m/LFw9vNl/XXd6i63m5++OkH+N9PUPj6
Bq3s/u3pGr++qNq/fn168n6OMP7F+6BaACRmaUijAuOCigIoD9+bIvgoZoQLytKHD6Pb0ajFxiiN
WtLIaGKCRIFEUkRMsmNDBoGmMU3JCWmOeFokaOmTIk9pSiVFMf1EgiOQ8sdizvgUSvT0Is2rF29f
Ht7fqglXQIEnJCiS/FEIb733NtuDwjTN+JxNSVqwtBBJZrQOXRYknRWIR0VMEyofrsfHNjFLMhqT
QhIhLY3GDKO4YcePP9qKC5SbHPFzGgeFQLE08AEJUR7LYsKETFFCHn78ebPdlL+0ADFHxpjFUsxo
hk8K1L9YxsfyjAm6KJLHnOTEXnpSBXMmRJGQhPFlgaREeHIk5oLE1Ifvlj8oBxG1MGaCZgRYiicV
QvWC4rhZQlhSb//+ef99fyhfj5IYkZRwivWKZ5z5xphNkpiwuR5DuXn2tl96rfVrYFiMKZmRVIqm
e7l+LXd72wgmn4oMarGAYnOWKVMUGsTEnGqXbKVMaDQpOBGFpAmIQxdTD/9kNO06cUKSTELzet9U
op7lv8vV/g/vALW8FbSwP6wOe2/19LR93xzWm6/HyUiKpwVUKBDGLE8lTSNzUr4IFJcxgfUGhLRO
QCIxFRJJYaVmglqndMEo9Ww4zj1xugow0mUBNHO08FmQBSyOTdpEBTari6Z+PaRuV8d26bT6wzo/
Op0QFPQWrt3jajOHII00lA9XN8dVo6mcwg4PSR9zXc1aPH0rn99BQXtfytXhfVfudXE9UAu1pzKh
/avxR5M5OOIsz2yjVNpEZAgW2djFUhSp8a00h/5u24N9zqHI0l5Gg07dlMheXVDCeJoxGKQSfMm4
fc9UylrpRj12O2YpQgHKETYCRpIEVhAnMVpaKX48hcozreJ5YJkM8JNlsDPB3hQh42rrwz8JSjHp
zKgHE/CHTQh7mlSrwAyLbAotx0iqpg07kIVmH07RTsAuULUeHW0PbDmq1Lo4nKAUNFRfz1eaxyjV
8mkapOj4QeIQTB43G3FOAAlgR94ZQS7JovcJEmM0nzETL2iUojgMzK0LgzULtOI2C8QEbNPxE1HD
tlJW5LzScg05mFFBGl4ZXIBGfMQ5Nfk6VZBlIk5Lig6j21LNAiV/ks46EgOL2/RplUy1ntrih3aZ
hsGRICA2ma2kCqoXXZtWO4RZufuy3b2uNk+lR/4sN6B0EegVrNQuWBnTXTIasSrxC1tsBjZLqsYK
bWs6Iifi3Ied2JE05VghCV7Z1GSciJFv21rQgNkc8mEBeUQax6nfRBGC6YypABUEe4Ildu3SAU4Q
D8BjsK+HmORhCF5ghqBPWFRw70Cx2U0iZyEFTzey8rTru7ZSGmcTdJzf3Y1PpSGqiWHbWq8GvGSf
g1IEFoD+OwI+gbNQBAk6rUIF6hKySCIfZhXDusHeuG6Hozw27bw1wiW01Ww9bnPYTfMdp1ATUIwd
PKroC/veqIg+Y9OrATqaIXBowNgMYDDywZWLid2zqTBBNr67GaAT/+oM/e4mGx4GQO7OkO3mr6bT
iAyxMV4MjzBeposBcoI4rP4QgCKJBulTJIYAKRh5Gud2D7KGMOWnDLMxZZxKNLV7ExUkw8OsyMbT
ASpH8wkNhtrnoAUoSocQZxZDnKOrDTlEBzU1NAdgEOJDiyGBh0MTmEN0GlJu829AfximtlImBTLN
e6NpJnMQ2omhwuo9XUXgKoRLIKw4kmcRUqGv4XXoyDFBy8aJKsKgo2EghLdPQtULqIBPSSMw8hDa
n2HpHMIFm+MF4bsPYyoS7dAag+2UFxD3Xxnx3qfiemyPBD8VjpUHCrjzLtL49s4yOFVnNL4xWaKb
GY2s4AcFbj6B/XVE2Vo3xAl/PKZzBFd8mz28GlGJaQHatEWeJEuw5KlgcRuhNiZutXv6tj6UTyqE
+fW5fIOGwHnwtm8qVbU30k8ciUnP6dSrzipTakkCwOrrYLyQEw7xWa+eSjYlLKjTL6InVBqSJrQK
0HCSLfAk6mHmYFt0VJQhDivd5Hf6qSuIiyHS4UwSDN5Aj6m6nxnlsheBq0n0UDDYql+REUxDaiR2
gJTHRCiHUfvmytnsbkI/F91NyIKggF7Bt0ZYdobNVOKJRiKHftKgE+FUztj1GBwP7YNbpEiPMGVN
VsLgBswPygnoRkyVAxiGrVcaYTb79fNqXz57f1Tu5Ntu+2X9UuUpjm7RAKz1VuI8oqlOkWGscmcn
TtUZiWvlX0JQBZGJGRJrT14kys0f9Xhv8qkqUkEgVsE9sjnoNSZPFd1ZuSJbN70huy66akdw3GYY
HWFGg3RkN2qyWnyI1Ac7Uz7vHEy9EEqE26RCQZOMcUdyKE9BakHilonPYjtEcpo0uKkKqWx5W5W/
M1YKgnqBBYWt8JgTIbsUFe77opvmOhaDy3wmUSBJBF7GcDpBedj2lVMInAQqz12pDrvfpmBz3+6V
6ukBN1iGOmuqd0u22h3WSpg9+f2t7AZziINp18IQzFQCwyaaTIRHoKFkRMCEjUBC2ilud1x/IOYS
JI9gr2mb6WXHhJah9AFEWZUCCkCDd08GDOJ06esI/ZiRqwl++GgNsLr9HZP8ek1EBgpE7Tyw2+CF
mIcAmq6MSU0folnrzkFuiKuySaxra+6Qv8un98Pq80upz308HWgfDD75NA0TqVR/J0fTtZbqS9ni
rD1HUKaizlwa+6NqS2BOTfVd2UyWd4LoGquK7WJajyv5aA9tajooDGzLu8GA1XhNkXKxQvMpKV+3
u+9estqsvpavVjcijJHsZIZUAdilgKhcD/iS5vlJFoOdy6ReDjBf4uHmODSwhD27mdAIIu1OUTZZ
gtkNAl7Ifrjug6HHxupoH0AyZahNDk9FYuFMs4AJjBf6TXUfDzej+7tjwhWkPyNcm91p0rHiMYGd
j2B/WNck5OAUq4MkKxUn9rDhU8aY3bp88nO7GvykDSnDVqL223QeRXJwn04SJQ2DCVcTdB89RHlW
+CTFk+QkIqolyi00RvK6m8mG0ShLaEjK1C/IQpK0cSW1OKbl4a/t7g/wTk7lEKRnSjp7qSqBqARF
lhXPU2qkTNUX7NDOsuqyfu2jCY1tRnMRmqla9QUmPGLg0ZtFOq38emxLF4rcLzIWU2y3ghpT7Qi7
mFWNwLpRISm2nkkAN6ZkafZcF9kabjWpuVg0qxLjGIkOr6G8sX8FB+XlsMAAy1L7PtBikNEhYqTU
LUlye1pFDU137TjSSEHHsCkldrGuephJ6qSGLHewp0CT4wLrAvDSTC43ZQULQ6f7SashKEXo6kcJ
o2njoEjirCnutpQHmVt4NYKj+RmEogLHheTMLpSqd/gzGnJ+WgzOfTPEalRuQ3/48en98/rpx27r
SXDrcqNhuexGEIau7i2AP4dPlVQPAwZFB16wcZKspxSPUAiHpXli0Ra1E2/Pibe7UukpsKWHcndy
T+Sk/lHzmUOrifAXuDFT9ynxKVRfLrgQGzM7Y0+R4MDakerUKk21RXEB1FkstAMevAuhs+EOhVUP
ZFFhHl4rLi+0w7L3nravn9cbiF5ft8rz7HjmZuWiLwedVg6r3dfy4K4sEY9gN+AYQRgW2neCrYLF
RA6glYHWx3AX1zi/fkfsPxpKGv6TptPwEqE74pWh6d3qGcQD+nIszpJuRN1ZafBsIUgZEhOpbs6A
7yeX2QW9Vng/c+yOUyho94SkF8y9hmf5pdAAY6ftPMGSmfvw34YXl7dNsD3NbYOKi1udIDHRl8Qu
rmD3nS3IU5M7jOYojS4WjXgsL246Jmkk7ScxNvQ/4UaC7EGBFXqJoqixyhVUiahLK6ThBaasRTut
jgU6Ty9RnBV4wMu2oafynyiDx5w5ju0s4ItVYQ0nKLafqVvB+B9oGoEvF1ShLvZd3nITklxegbui
Uwv6VOMPons59iFs3j9Rai7ZDbl4nXhEOLgEpNmpkaLZvwc8R9NhqhZAOcD2ky3lU2WcLZaDkAAi
+SG6ctwQd0hFRR6qzsl/CD4d5JEFgKFZ69eZzAFKbYnt6tCEuOyNiZEydg6hdu1PBtA4K3oWgz2k
keOcswJAmDVABQafur/HrOqASBhJv6yahKsbp2ugRNS173ngODoAe2klIGlXTU4T6HMaRLaUQ3VU
qOJPffLdicKD7pWHmjKLUVp8HI2vHs2FPJYW0cwhyAYmcWECkDHHTo5jbD92RhLFdju6GN/am0KZ
/ZQkmzBX95QQogZ/69iFRFb3Pe3Two5TGVhJpM8zrGSWkXQm5lQ6bo3MKu3kVMk6oHTmHZLMcWRV
XXi1dzkRTttfVCN1Rp8qjLpW1yKU6h9Cpbh759og8YVKMi+L7iVL/zHu5S29Q7k/NCewRn3wMCKS
WhXASc0ewUyFGvxACUcBZdbJYMc9FMfBGAINtuCuPR8WU2zLp88pJ3Evr4HDSMlq53ZZxYqGsCnL
ZwjHt97nEuapQrZndR7hgfuqAcY5Vl2ivAsdHEDJQl8Qfhgde5xTKLVrt3BKHYe3akXuHbl6RO0e
KSaZ8sjt+ykN7czLBAJpd7ojBQ3ttHgu8zQlNpMGUR2Mpbpw2+JDRGM265oHzfeg/HP9VHrBbv1n
55BQ619Cu8pXfbt0dXXu2HSnz9k7Rf2PImAJouYVEVV4vFh9ZBGmRMUXfm69Ew9UJLKk04wusd1P
bWkZmxMuYNz2VenACpFnF4GPN9idwCJzWEg1+cSqXRTlMad8KnozqW71OlsTMnfYEiBSZtdyipZx
ewJc05CgdksyYVLdElGoEyFTZU/bzWG3fVFvK55bYatFcL/+upmvwKNWQO1ai/e3t+3uYN5TGYJV
KmT1XKqL0kAtje7U656Txs5j2+N2+9jbeZHN89t2vTl0LgQAp0ga6IcYVpXeqdg2tf9rfXj6ZudU
d2nntUmTBDvbd7dmNoYRdzztQBntmY/jFbP1U60xPNaewbU18+oq+oTEmcMfBRsrkyy07WfQ5WmA
4s51roxXLYaUJ3PESfWOrzGs4Xr3+peSipctLOrOOJWe62tCZs6eLCRHbTvVRaY+unqAMzD6I9J+
e6deg/64jvcx1XUedZmlcxTfsgb2dBFwOnPyTgPIjDtOsSqAejNZNwPxS8IcykvDkFimuAHrt382
s9Jcfs/yYpbH8IF8GlNJ61ta5n2wU/HQK+W/771nbW86j67MYsOcMrBv2HXTP0pdd6akXZxZaJlT
ddNVXZdt77pmEIyBsemeIfN+fquhpMbFBvioeZ+ASKCItEfW2W572D5tXwzzCoa0U7m+32S7O5Xm
caw+LP03EPONDg44S2ztKPMjRAAcotn1eGH3iRpwnhCbS9eQY8ay43GnWaovTuj7lg8fT5vFfJlJ
pnCDvQfcd1/y0jw5QxfTM/SF/c5vQ+fIbqU1c5WvjoOZvQeI+QrlaBXEkcZtuzgzBS66S1QFEbOE
dGxjny8zV2oLCEXfB23CCLPR6srPev/U2amNatF3jtWTX3uMilLpeO8jaZhofWelkhTHTOSg2UH1
zih2aLZJVoAXayUJ14qZpvjkIfkxHlevhiB2CMK+QW0WftxXAdUdMgLqMuk4GM2UNKW4v8aLOyvX
e1WNrvwPV6MTXlVvp8u/V3uPbvaH3furfg22/wYW5tk77FabvWrHe1lvSu8Z1m/9pv409ez/o7au
jlTiaeWFWYS8L41Re97+tVGGrT519X7elf99X+9K6GCMf2lcO7o5lC9eQrH3P96ufNE/smBh1gz0
ht9/pNKkvwaaMOwBSeePDuHCE7vMqAty1UOpvtPahXApFk7EBPkoRQWyv8XubKROuEQDw8GpPipb
8VKu9iW0AjHZ9kmvk071/b5+LtV/v+32Bx0Pfytf3n5fb75sve3GU09ntHdnmpiAFIsQNFHCen2p
DDhNI9EtBM2lr7KfKBVFFL13SEa9KOi2EwWqqc5dlLY0swU4Rj84ODGJVXH78oNwzrhwDBM6cGRh
1aSRmELcg+15YACo9/jF8fq84unTt/UboBqB+/3z+9cv67/7XLa8wmuNbv10d1DVQxu9G1GnAPXe
R4RhKyYgjsYAzRjH0rgZelffSp7V6wXGg+4d36YaC0OfIevL7QYyMG31ZPtufHV+StXQTuojgu96
LkofEdOr28W1tXISfLgZrIyT4O5mYasrOQ1jMlh3+XGM7+6tPU8yee14b9hA/gOajDNH9q0RGkqH
vTMqP159sOecDcj46vo8ZLijVHz8cHNlz1W3ow3weASLpZ64XAZMif00pPXOZvOp3QNoEZQmyHEC
32JifD8iZ5ZD8mR8PxqEzCiCFV+ccZgl/niHR6PTxCY7fIM4yLFXK6dueyj/DXYUFDuYDICD/l+9
7LdebVK9/Vv5tF69NM9zPm+h/bfVbvVa9p+VN6O50cHcMA/VDro5M6tA4vH4w7CvPJF3t3ej4ccd
j8Hd7dmIAzjYFWqrymifRatcfGVaT5WffqQCds/cpBxRZYOk9QdFVAXj5rGq3nmurUt6BkKPoO7a
O3x/AycIXKc//uUdVm/lvzwc/AoO3i+nGll0n39NeFVqCzDbKvzULgoORjENGLe2Zs8LtmTHuY2e
JvytsjCO0xsNiVkUuc7nNUBgdXqk8gonG0KzTTYu5763aCKj1SKZh3iaEuLT1esiqP7/MyChfhLr
PCSmPvwzgOGZrZnmxWZvjj90mTfXr/47LpKmSNcZrab6jMnq90cG1m4R+dcVfhh0cw7kp4vxAMYn
4wFiLaLX8wL05kJvPXdPk8zxhF1ToY17l/JtAIMrhZwpzoo8QVe344H2NeDGbm0rAML9CXbIFH+A
CRzTJXWB8kKEfk0CrIKY92F8e92HcCLUebf6lYkiEQ+3o5FxstWAqqTT6VtrK0w//h6d9qOzrFIu
q5+o6Tz3biZxP7QKALh3WZNKG88GVymZ5cmANAaZLOjYEfvr/tUdbNgcAwiOE8cZsaYTGN/YTk9I
hLT5AM/l5JS2j4nhD8fNshYzzArwIs8BxsPKKUFcZo8D/MxDMcGDe1JSR5Ku0g65ABtA7cmSapBL
bvcJGurQ+NOhloNkcX11fzUw+rA6W3QG7R0QHdI+UeBI41XUOieeYn57/dHuRlaWKRsyW+qHFwdE
G+joajTQupBkYOOJZXJ7jT/CLh/QYY96NYtwSKpqzNV4aKaPMTpnWQJ8fX/798BGVeO9/2C/zqIR
8+DD1f3AlN0Ho5Ufl5wo7D7gY8+V77XfkwnT6vdcUkNdO66EJvaBNA8OXDnTMFfP4k68K3UbyLu6
vr/xfg4hdpjDf7/YUm7qd0bm1NV2TSxSJpbWqQ52Y9yLqUyb+dtf1PCz03qCnViapYH9DY7OPptu
4f8xdmXNjdvK+q+48nAqqUpOLMmy5Yd5gEBIwoibuWjxC0tja8aq2JZLsuvG99cfNEBSANlNuSqJ
I3RjIdZGo/trcZdrvFLa8IewutBOU4LQGAeMg0EYLojFJGmxoiiwSxDPb1PCLE61ISU00art3IB+
4NMmxxuh0ouF7m+NMUrkXlCvFqEfEEoLdaw2LNPMo/7u+H7Y/fgAdW1qXqKZBRHhvGxXD/xfzFI/
5mYzkbTcSM2dqBhw9xVM+LgyZMCHrn6j6okoMXh6px5cx7PI7YR2tcxjcSZcQC6TBC/bCYHuYxcw
Fe56EFlv0MMUUnYmX4mgUlUycwQ3X/IIheN1smaixBeo2ssFdfwCc8KKLD33EQG7tz22HZJz+1U/
R71ej3wt8zusaVSpBN5PKK+xMbWbobaOMJMMb2PC8XSYcJGjfGaZT9l++gSEmiIQkEiKQvX7uQmQ
J1Hi6NxNShGORyMUl8jKPE4i5jWWy/gKP37HPIDtjAAmUFdGXO1ATahMTqOQ0FKqwogjfq0EnoB0
OVEZMVWK+8Gcee6pE2LPG1YeyOBACzi0hcyd7stmeQgGIuq7C8IxzGZZnGcZT/HOsHkSgse0r4iJ
w8aXd3nT1Af5yJnwUw34aWmTdFKR4TO9JuMDXJPxmXYiLzDTDbtlMklcfAeejm7/PTPrOQCVORtt
Y5IiWdSUk6GzzLzGWmhn8kRjM8lyX1qWH57o9y6vLPVAmVB4qYWHVGWyznMfnN2X2INaSQvc0TKp
YeMN7vQl4mqFK/qXMgShrBhd4XK/F9z2LvGFr6oc9q/PbF6AQOMAkXo+gRWYqrnePBDa5Ykg992j
eyz6Z8dJ3POZPS4WaRpFUx9f+rOcLYVESXLUH65WOCnMXPWfoO53QOigEK+dU/zmrdKJnUauqCyK
QFRyRdaO7/XfUWQzq1cMGqbTL8EioEzY0znx/pPO19grgl2RqoWFkTNFAn91VVCqHX81pC9iipou
O8mT5Zn2SJ6482GejkbDnsqLm6fP0/vR6KpllICXHJXz2papbq4GZxalzpmKAJ/bwTpx3m3hd++S
GJCJYH54prqQZWVlJyHOJOECXjoajPpndnj1vxBOwBFu0z4xnRYr1A3JLS6JwijAN4LQbbssVHng
F6bkeXD2LppCU7uE0eD20vV06lNrX5HmpHIr9zMChXTpjS7/HZz5yoUSBZwjTtvyew0BvZ0xmjs9
oPijM8dpic0jwqkMXai/mbpAqFmLZF8LsJ6dSPxyEYswBcxp52UlOnuuG8WWnenOZwPq0eHOJ8VZ
VeZKhAVFvkOxUeyG5GCOFDii5J1KUEca4bydBGfnVeKitybXl1dnFg64GGfCOZJHvcEt8TgFpCzC
V1Uy6l3fnqssBM07Op4JeJElKCllgZIGHMibFM6q5k0SySnEHV5k5KsbuvrXuRmkhA5JpRcTGK4z
GoFUqv3WfU+57V8OMNsYJ5ezINTPW0oDLNPe7ZkBTYO0geDLb3u3uNwtYslJbbMq57ZH2Ixo4tW5
TTmNuFqRYoVrbdJMnztOW7NATf4vDGseultIHK8DwfADFKaOIEx8AeAlJI4dicE/2Y1Yh1Gs7qeO
NLvkxcqfNlZwO28mZnnm7KEm5UwuN4cseKykEUA0Sglk8ayhp2yXuXAPAPWzSGZqj8YPTkVVYpsa
Vhe6s13sUt6HLjqbSSmWQ2rC1QyDc0oMY8FrF17a9LKVpLfPiecRZp0yJu5J2p90TIrlIK+WD7q4
2mq2pnwE45h4cPNdRDStM53tj+9/HXeP24s8HddWKMC13T6WLpNAqZxH2ePmDfzHW6YyS7M9Wb9O
uszAnAIYLXNUjepnx6OLog5b8gpaaCB8vD5LR4VQq7s8QqquWgQpUduzs21EaUaANMaJTIMhhmNg
F3q6xGBEoWQrsk8TVl6EMVp9JGNE23bJJtgIvXZ6RvDfrz37JLZJWl8qwrC2vxLaN/diuQP32t/b
rsh/gA8vmDG/P1VciDfbknpNCVag3iVXIObPehL5Ug/d4RaOYKV+FnHDr6Y0Wn/7eCdNy2QY5zYY
IvwsJhMAOm06OxsaeIRTTuWGI9V4xfOAmHiGKWBZIldNJt3g/Lg9PEOgrx1Ehfm5aXhtlPkjQHru
bMf3aN3NIBbn6I0twOpPytHY5JyLtTY3PnVslaJ2hfnYeTOoKf58TjjR1CyhWGbEw1XNA2AGcH3H
n75rtjSLlmxJhLs6ceXh2UatsgZLe6CsB1P4WcRpH0mCKAoplj5ee1gy3HPU3zjGiEp2YTGghmJE
vo5dcNYTSQP/af8aRyNQ04UPOwdhcGhVL2CnJm5OVm1RzmdzNOzhiWkCISCbz2GGnIpEEkKhYVBy
oy90LR1MYx4MKQsFw6HGknqgMAwwFmPiBdp8CO/1LmMSpx5YFqm6pDLCrMB8bjWoBQgDnUsf4Jlw
tath0RA1BASJYYBOS3kiCDVaOb0bsNTWVVZe4W5Ps83hUTsdyb+ji6bRKKh4TtMS8ehscOifhRxd
XvWbieq/Td9PQ1Cii5pWyJQzZCXQmfXZyEah/hhq+ZjaKLhZc9oHgLWuYhJOlpFrFpQ0ZYFoz9Dy
JR7r8JM/FnI6muPmaXPYPICQeXIdrO4cmRUla2HHrzCmDLCJhKmvgb5Tm9MKcFJJaEsr7SQvZBYB
ENAJGxLAc74dFXG2tqoxFntkYunO2h9eu33PfAg7YhzWCQvTMLqPKBVmMU0JX8kEojuoSyiBwQf+
wBl62fI97dKWg4utHZpFndoGnv10KRWLecPF1xhnbw/gafDYPKXL7xUs8dfcftovCaP+8BJNtCJI
aq8gZ3xtPuMO3exgTZqApI75P9tMrYniFG57QNkEsWIJTgmTImdJZsHT29QEAsoEomZB263Byz0q
rJ3dR/Q+UVeY9UcjxCF4//oX0FWKHjh9C0TMvcqioLm+RDG+Sw43uoGViK26kvydmMglOeU8XBFX
W8NRboXfMzaFFn6B9SxbQmjtDDmJ6U1XkSepX/jxuTo0lwzBX6zNWpkEuuupVYYOjkKEZ5NxIAsT
VzRBBkztdybAom0SVyeaaJ4ywv34k8zRB3oZgVMGwpDkhE+3xg6ngSoyrv6N8UALi+Y5u5K+v6Zc
gNsHi90I87VJnmbaQ8JAc7QvIX2OrQtIxqq02S3uATGrCF1RGhOb/4ywj41dO2Hj6pnFFw/P+4d/
sPYrYtEbjkYm0nYrb3lJL5VOcEUMKcxz67a+eXzUAWbUxNUVH/9rm+m122M1R4Y8S3DxehrLiFJ9
LXELEgO/xBb4+jBU7SLRQU9zNYexw3K2DNy3QZ1QuknAm2l7s928q2WMqTHU5SWNkrRg6eCGUJ3X
HLEgTwTDIofzggWE8XzJM7npjS6H+GO+zTPqTwhD6KqybHTTyRCwVe+2myXmo5vBdfd3A89Vv7uc
MOMFmNipKwKF+1Kz8uz6eoTrh2yemxvcpqXmiXlwQ7mtlDypTIfD2+5y4PHj6iYgbMYdpvHgTHcu
JLseXRNOCRVP1mug6CEso/6gm2U5Glz3b2bd08gwCYJLjxdxoV4C8KoXYXJ4mkKgkzSV44ZEkWIh
iNV1m6Hs40bkHINe8vH8vvv58fqgg2SVNxVk0QYTT81udVjgXT3LuIY74/gs89XVUhJKAqBRLpZQ
63cW3hc8iCjbFuCZiyAmHKp1w7Nrah4BOfH4gHLuBnoaDAkHBzZeDS/b+CNu7jUE+STJGfhwDAbD
VZGlnHmESgcY74IVEcQKyIvVaNhYdhWuRtcQW8KBmOY+GS1aXZzprwRNvT47MNiX6WHz9rR7OGIn
MptiSA4QZZUlVhztMkFDVk4hClbPul16BGCESi+8uOCi7VXLVBYEW8tONnw8vvidfTzu9hd8Hx/2
inDcH/5AoKarEr6UwSCxgUv6xY+Pnz+VqOa14YMmY3Qw0WwGMGzz8M/z7tfT+8V/LnzutXXypxXH
PRObo+vtbcz43Ne6IZq1wiTrrrkM8/J63D9rvJy3581nOf/aLwYw1JjKYsrU/xVpNNFx4SLfH1MR
VAKvLgETp+1IsOqvnwfqkj26xOlJtEy/9YeWdH3mM2pkt+akt3btKA+91pScSa/dGSrRkbmkB1jD
6k63Bsx3OvqBYqTUafkMdb6Fok8QJUa7UQIpQIaWigP42VVTa6xTeZJj9muaBuriVoY8aVge2J8r
/LltvwRpXJ2iybqZpm5e4bpZNo/yKcM3NCAHDPBT8UcKnV3vbETTTlp+J4/q+WkUJjLFlxWwiEDJ
m7iEoMm+aNwibeI9BCRr1DkVwVgSWjVNnxB7JBBVebQGXzOs6U9ZMj8jXF+BvJBimTZtytymrU3E
QpJBgjMB0Rkya82m72xMiSiKmi1lOEMtOkxPhBA1NmvcdMBNmev7EVmuL8JogYsnZp5NJddvDB0s
fkZB3Rj6eqL2YcyuB8iJMPPOXRXGLlXtmY3kCB7z29NIRyfpngshEe8NaOAEhm/JQI1ZCOKvH3XM
01hkzF+HuCSmGdQq9wlXbE2H57MEJhwBigc8CQlyPdPe5rLrM0pTOpoON1afUkdrDtKZsqQKH/Rd
FKyf1M+msU/owfRkoBQpsN7gxUkJ6vQa0f7w36N1ZxWZ7JjuakdIqXu7ps9AAWUg5EmmHI6wIk7x
CwVwrGQY0I24F0nU+Qlgv0GiS+mO0He6YkYgQ+uzy2/6qleqTOzwrF+MrLO+fmtRd7xoxmXhyyxT
kocI1cljLWeglxK2vWwhOfdj2dSLWuQymHxazLjXyErksKIiA5NWkzdgqCE9fvo87h7UR/qbTxx+
OYxiXeCKC7lA+6mjHPcjp8ybEqorCDaEHzCQMQE5riP6QhAQVy51SpOPvKFYqj2fCPjBOBdw+wbA
X1y2SNRtWUvV+MUF7tmLJrCncRQO2DifWLFcT1IloBJPZNNVufIWdvNZbc1XnkzVtok3NKccACBU
sFFnY9MOyDJSXRjmrm2kTqZs8atcAQKkHeweDvvj/uf7xezzbXv4a3Hx62N7fMfQys+xnipUe2Fb
jV71Z8ZI0KZp5HsTSYXWWELwblTBzLUiON1/HBwdS5kRXKAGhRuVm/vzse8Z0jcLOBotyZq7TPrj
CJPCZRQEubWROCjlmngRb35tTXhrBFf+HKvmTbYv+/ftm7r+YpsCAGxngOeKPyYgmU2hby/HX2h5
cZBWkwcv0clp7jaq8t/Tz+P79uUier3gT7u3Pwxy3M8ajrve69jL8/6XSk73HPPEx8gmnyoQvPOJ
bG2qucYf9pvHh/0LlQ+lG437Kv57cthuj2ov3V7c7Q/yjirkHKvm3f03WFEFtGiaePexeVZNI9uO
0u2bMS+ydkCE1e559/pvq8wyU2m5vOA5OvhY5vqQ/tIsOFWlw2QsJonAIZ3FCsAmqMMkSvAtVhJb
bJjhYgdgU1ObVrxsGykAADWAKWJbZYtmNQscjsiKDNSW+pGBKgZ5QYxna7Un/DjqzrWHq0IBAgZU
7cSDYh6FDM7uPskFD3LxihX9URjA+yARL8bmgvLQGeI21coNNz5OmJkGRCiohLUPbfb6eNjvHh29
Z+glURNUp9oYSvYTty/H4cKTAaHnJC4zgFTeng6zJSBYP4DtMWb5QARc0YbhRVPbVImz7SJPOTUQ
NnrAyoh4SfJlQL7yw8WVm2AHKIO2PmreKuqYKI5RbRkPQ+1/ZuidXWXBfOmxTBSTtNAGx5hRgVrw
fQNxae8BkFSsAO6Q2iUGBYFKqGhXBRrpIxFStUEVPHGwHutkPhOEqFqzaEBOGU4I57NTBR2N/64Z
UNKKJk0nYGZKAKxmCZ0xlH5H1kmfzqkojXVRdzFIPs1BM2nFGKSvIoqxEQDZWktnMrRCygdgz5ap
vb1Jt1siQh3KgdJyKQ4lR+MeQZM0jDI5sbSdXjNBmgRtv+hUzAwBrZMOugoGcZO0OQ0bZLLbwYyW
oIEHAkAzTto7JN80g0xPUs7UnEbXcclt2DVu7N8QYAKW8mklV52TRrfX15eNVfo98iVxmbxXOYgP
yL1J69uqJuHNMHe2KP17wrK/wwxvoqKZ5lVTKlU5nJRFkwV+lwG71I7niZhNxberwQ1GlxGfwQaW
ffttd9yPRsPbv3p2JB+LNc8mOHpxmCFDXu2q+OcZKeC4/XjcX/zEPvuED2wnzF2TOp0GD6iZ30iE
TwZFpsxcTF9N5DPpe4nA9LxzkYR2rRoi9vRTR1pynAQhAZ7T5Upd7AknQc3T2jVPst/EK3gimKut
Nn/ojkU6ry4SLFdhwzHoPk6DIx1um16izOugTWjarJMEmjZyi+9ozZgmdeTiCQsoYN+7nKUzgrjo
OKQCGaohpvauoOPrY5p2F66uOqnXNDXpqjQGox8C0mOdLqhseUd3J+19vVr+pRmcO+MqYiWUWL8X
/cbvgS20mBRyNWkyFSQ5LdIlw2wGFMlzKvWg1k8nr3emWq9AIy9PtYl5DAaiVhVw1Dd/qvxuxwA+
gWMAnodJzB20bp3S4Q+qI2VS60BShMhj9CKnhtm3h9VP65iQ9sFhkauTp1Anj9PTNu1mgNvduEyE
4ZnDNBoS+B4uEwFy5zJ9qbovNHxEGPI1mHDjoQbTVxp+TTh5ukzE4nGZvtIFRDyIBtPteabbwRdK
uv3KAN9SKIYO09UX2jQiXNKASQmBMOELQhyyi+n1v9JsxUVPApZySfi9WG2h81ccdM9UHPT0qTjO
9wk9cSoOeqwrDnppVRz0ANb9cf5jeue/hojXAizzSI4KAi63IuckGXA41BFOuGxXHFz4mSTwcWqW
MBN5QmgJK6YkYpk8V9k6kT7lNVoxTRnpWFqzJIJ4Ia84JAdHVsLNq+IJc4nfwZzuO/dRWZ7MqbcY
4CEvNXkoYXkiB6GMiuWd/dziaIlK16+Hj8Pu/RN7ipsLCllf8Bzu+YUXiFQrUbNEEoqsireTiB7j
2pVTXfk8EQpPawV4FK91JFXOGrelFhteXabmFtc8EB6tHe215KvukafvZBaco58G336DdyuIhvfn
5+Zl8yfExHvbvf553PzcqnJ2j3+CU/4v6NjfTD/PTRSfp83hcftqx24v32aC7cv+8Hmxe9297zbP
u/+vLDKrkVT3Q2g+n4P3oXP90qQoNP1SN51Q0VTMEzXzSd7q/RFvUkWmv+jkBtWYW/VroA4I+u2l
VH0cPt/e9xcPENq5DHFnB/Q1zOrzphCp7gVN7rfTBfPQxDZrOucynomEJLSzQNx5NLHNmoRTLA1l
rAXVVsPJlszjGPl4CFHcTjbAdO3vLNP7tjhfknJcYexmLDyZgpu4jrRpid4lF7iutuqERKxC/Qcz
7Kw+Lc9mIuRIzmaYT6O4+fjxvHv465/t58WDnma/wJ71097lqu4nAkKU5Cb4v0sV/Bw98brLVxvN
QvSHw95t6xvYx/vT9vV996CjYIpX/SFgAf9/u/enC3Y87h92muRt3jfIl3FOYF4Z8rSbzGdM/dO/
jCN/3Rtc4lJGvb6mMu318WOqWlTizjWhafbUjKlNalFtDmNtIPCyf7Qdy6umjbF5wJsG5w0y8SJQ
kylNTdm8zsL9BDdWLslRd9Ni9UFd9FV329RxvUyIZ75qgMAWK8s7BxxMfhatSTjbHJ/qYWh1Gg5z
Vu2LioqM0+rM1y4ahZYBBn5tj+9YExI+aHp1Ihyd3buaMUL+KjnGPpuLfucYGpbOcVINyXqXnsQN
p6tVea4tX1mPgYepgWriEBmVQKoFKHz421VyEnhn1jlwEEqFE0d/iF+xThwDFFqw2ktmrNc+tdVu
NbxGPk0Rhr3OGaA4CNTykh50kzMlVY0jQv1VnlLTpHfb2Yhl3Gilme27t6eGwUi96XbONkUuCFvn
iiPMx7K7jIQTcO3VpAd01u75yhkAMBPmujVPmnVOaGC4pueDJ1Jk3Cf6b+fOOWP3BORONbTMT1m/
czpXB2X34UdYE9f0JFa35O452DkUmejs4WwZNQeq9Gp6eTtsj8fKDazZrxOfZbiWvjr57vF7fUke
EaH06tydH6XIs87t6D7N2p5Iyeb1cf9yEX68/NgejMHfyc+tuQQgQGKcoOgxVSck46mxBG3uOJqi
T7nPdtdpGu7vYLG0yvwuwT1KgF1SvCYE80LdfFplk4zVbeZLzAlhMdrkgxtVezKZC93z7sdhoy6Q
h/3H++4VFRx8Of7KiQlsZnmd5ULF6Daf2Sna6dWpCuiK9+JbD63kK0fvqcm46Nzmrs+thvS0xGYV
RHNlE7HiBNyrxccCE8FtuvLbI7U9vIONoLo+HDV46HH363Wj4y49PG0fANnRNrP7Crvm9zuGHuzx
cJimsVQH6P8qu5bmxm0YfO+vyLGd2WZ220y7lxxkmo611suUFDu9aNxE42aSOJ7Y6ezPLwBSNikB
yvaWERCaDxAEQeADRmJ7D+ddmB2crZkq7pqZydMuQoRhSXQmUBE/sq7iJCwZkptpzJmup+g+FWOo
ceRh51EaAoaHqLRYq7l9MTN6Fi6TgmsXbGFhcdQXye5RzahtqJq4qhsOB4/M214ffkeAvWTWvxmH
DEms9OTuK/OvliJpZmKJzEo+GJBjIrhGgSo87yjZ2FC8ux12z6j5r3hD1YLICHN04lr/hcVcWPdk
2RDSjpeTRp8wBqsJRAa/B4WlM7ADmpIyJDDl7oZwdX0aEqAJ8ljqnuwhLZpOTVM1f1zB/AaYPkgr
mFqIjl7eJNZR6MVhLRP/tRSDPwL3olkSmCnbGFDypNe9LEcCXeO992Lop50SzxlrQA0Ik+8UzkCP
hL7UTkHR1/3b4+74RHA3Dy/tYct5tKnM7YIgcNjFdnRMpuX9Xi6dOsHSMLc6OTns/hQ5lnWsqzOc
WArXa3xHG7Rwde4FlXx2XaEqwNzc36WTHDZoo43JolT7Xn5xJk6m3uNz++vx8cWp7QOx3tvvb9y8
WXicfsylI9oaxE2KWEwUvunFdxnoWrOKTHb92+err+HiF01UpjgQKTQ7mlLDkQA0NtcI4wE7DtH4
WAFF6LkUznFgSeKsF89ox1RqhfGMGImURr3Uqq6vPRYaT5Nnyd2wOSqb0ax0tKAaz6rgg/l/eA2C
tBYn99P27/ftFj3u8e5wfHt/aXc+Nibl6GLwjPEKHngfT25/u27Xn79/4bgsVBkzQiEgZ1Ky6cj0
HVROfJNhRRRfTH9oWD8FP45Bbz6wt6tuHZenZH/3aHFqLLQ8YOMRPF+/iGpvjMhIWpJXEthMkceY
Dy6YybaZfPJNS/7EMqknHRvfFeJA/S8k11nxpSehGlUK3whsyKnj0tl0JLzatnfLI7fRLFPqB70g
eXjNES4vtU/Gcvh0dF6FQb/nmLIx8O4h/0X+uj98ukhe75/e93ZbzDe7bc+GxMp3sCdzPsY5oGMM
fK3PVdUsEc+AvK6uvdLqmGCOxlxdQC8rWDoBQsYSm3mdYcHekp/P1ZJFQvKC+MfGat9mQTM8vD8T
PspZnIOVpdkMTlX8zEhN9yTHNNlfG5yZhdZFT7itYY/e+PNO/fmwf9wRWNyni5f3Y/u9hT/a4/3l
5eUvw/MDzaK60mvBYeUkg0k67LF83IhZlVo4ViyDi2+3F2NngfD8FEkPklDVRg/emM6rvbK9+sCc
+R+z57WNxw2oo6bO0H8Eq24t15HhLazqETbYk1W4D5vj5gI1LRXaZc77JBZG67TkB/RyTDdSSH+s
hXrwVi0206hCCBxjaibpINhHwpD6v6oMzB9WgE2GsftG1fyxAQQ8zGfy6iPHhyJCTBiBKVL1suTi
J7vsz6B//ZGBurG2h2GsjoDT5obAMYjeASFmI0qLhMna3jzv/9lwyogQgp3J6l0HkmIedZDKWAi5
ontLiCiP5XXT2rcL+r/i2/xVezji1kFNqV7/bd822zYIWakzKRbHCRwazFQG5Js161hml3HA8XR2
vqJbHZx+Kr914M2Fd6vqoIJRHFDR9FPI8TttMDh1BMBZYhGpCBvlMKNB5YyI3QRfJUbodBXNkxxh
MEUuyleDc7QZbwy2CQifTI+qPI3h4j9+5aaBz/V6Wqf8a6adGXt/tEE8vBrp+EolBAQRwwI4KiGH
jxhIrgUgRKTbu+0oHSRPgPUjjrru51D61HVkjIBrQHRMSJolOf/0TBwGvcQE5T8y4ZIjmajxlPe9
WjleCJjmSLxNZVPaDh6dyWLMlp1BqZwyERPYCnO8dEt1SmYxmL6wCs1EZ2qeRoa3Lqi1WWxSOHFH
Jsqm8YyMZ3Bn7wskRaGJ0XVWKNN8RCLAFlcRCOboj6CFIyjDrhGRAWiiFTOqigfRYdZH8x+xZsAp
gNcAAA==
--===============0576121612691288277==--

