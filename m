Content-Type: multipart/mixed; boundary="===============0949113744759213522=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-rt-devel:linux-5.9.y-rt-rebase 61/234] kernel/printk/printk.c:2677:50: error: 'prb' undeclared
Date: Thu, 22 Oct 2020 00:47:16 +0800
Message-ID: <202010220013.4lW4PGhQ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0949113744759213522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.9.y-rt-rebase
head:   fccd942429797174ebfca28a778701a9df9c1277
commit: 71a7f8d7ea8a3167d9f3be464943d5fc7bd24fba [61/234] printk: move cons=
ole printing to kthreads
config: riscv-allnoconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git/commit/?id=3D71a7f8d7ea8a3167d9f3be464943d5fc7bd24fba
        git remote add linux-rt-devel https://git.kernel.org/pub/scm/linux/=
kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags linux-rt-devel linux-5.9.y-rt-rebase
        git checkout 71a7f8d7ea8a3167d9f3be464943d5fc7bd24fba
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:63:
   kernel/printk/internal.h:56:20: warning: no previous prototype for 'vpri=
ntk_func' [-Wmissing-prototypes]
      56 | __printf(1, 0) int vprintk_func(const char *fmt, va_list args) {=
 return 0; }
         |                    ^~~~~~~~~~~~
   kernel/printk/printk.c:180:5: warning: no previous prototype for 'devkms=
g_sysctl_set_loglvl' [-Wmissing-prototypes]
     180 | int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c: In function 'register_console':
>> kernel/printk/printk.c:2677:50: error: 'prb' undeclared (first use in th=
is function)
    2677 |   atomic64_set(&newcon->printk_seq, prb_next_seq(prb));
         |                                                  ^~~
   kernel/printk/printk.c:2677:50: note: each undeclared identifier is repo=
rted only once for each function it appears in
   In file included from include/linux/mmzone.h:10,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from kernel/printk/printk.c:23:
   kernel/printk/printk.c: In function 'printk_kthread_func':
>> kernel/printk/printk.c:2836:36: error: 'log_wait' undeclared (first use =
in this function); did you mean 'poll_wait'?
    2836 |   error =3D wait_event_interruptible(log_wait,
         |                                    ^~~~~~~~
   include/linux/wait.h:272:39: note: in definition of macro '___wait_event'
     272 |   long __int =3D prepare_to_wait_event(&wq_head, &__wq_entry, st=
ate);\
         |                                       ^~~~~~~
   include/linux/wait.h:465:11: note: in expansion of macro '__wait_event_i=
nterruptible'
     465 |   __ret =3D __wait_event_interruptible(wq_head, condition);  \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2836:11: note: in expansion of macro 'wait_event_=
interruptible'
    2836 |   error =3D wait_event_interruptible(log_wait,
         |           ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2877:7: error: implicit declaration of function '=
kernel_sync_mode' [-Werror=3Dimplicit-function-declaration]
    2877 |   if (kernel_sync_mode() && con->write_atomic) {
         |       ^~~~~~~~~~~~~~~~
>> kernel/printk/printk.c:2889:4: error: implicit declaration of function '=
printk_delay'; did you mean 'print_dev_t'? [-Werror=3Dimplicit-function-dec=
laration]
    2889 |    printk_delay(r.info->level);
         |    ^~~~~~~~~~~~
         |    print_dev_t
   kernel/printk/printk.c: In function 'console_try_thread':
>> kernel/printk/printk.c:2938:8: error: implicit declaration of function '=
get_sprint_buf' [-Werror=3Dimplicit-function-declaration]
    2938 |  buf =3D get_sprint_buf(&sprint_id, &irqflags);
         |        ^~~~~~~~~~~~~~
>> kernel/printk/printk.c:2938:6: warning: assignment to 'char *' from 'int=
' makes pointer from integer without a cast [-Wint-conversion]
    2938 |  buf =3D get_sprint_buf(&sprint_id, &irqflags);
         |      ^
>> kernel/printk/printk.c:2942:2: error: implicit declaration of function '=
print_sync_until' [-Werror=3Dimplicit-function-declaration]
    2942 |  print_sync_until(prb_next_seq(prb), con, buf, PREFIX_MAX + LOG_=
LINE_MAX);
         |  ^~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2942:32: error: 'prb' undeclared (first use in th=
is function)
    2942 |  print_sync_until(prb_next_seq(prb), con, buf, PREFIX_MAX + LOG_=
LINE_MAX);
         |                                ^~~
>> kernel/printk/printk.c:2944:2: error: implicit declaration of function '=
put_sprint_buf' [-Werror=3Dimplicit-function-declaration]
    2944 |  put_sprint_buf(sprint_id, irqflags);
         |  ^~~~~~~~~~~~~~
   kernel/printk/printk.c: At top level:
   kernel/printk/printk.c:3483:6: warning: no previous prototype for 'prb_l=
ock' [-Wmissing-prototypes]
    3483 | void prb_lock(struct prb_cpulock *cpu_lock, unsigned int *cpu_st=
ore)
         |      ^~~~~~~~
   kernel/printk/printk.c:3501:6: warning: no previous prototype for 'prb_u=
nlock' [-Wmissing-prototypes]
    3501 | void prb_unlock(struct prb_cpulock *cpu_lock, unsigned int cpu_s=
tore)
         |      ^~~~~~~~~~
   kernel/printk/printk.c:2094:13: warning: 'call_console_drivers' defined =
but not used [-Wunused-function]
    2094 | static void call_console_drivers(const char *ext_text, size_t ex=
t_len,
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2079:12: warning: 'syslog_seq' defined but not us=
ed [-Wunused-variable]
    2079 | static u64 syslog_seq;
         |            ^~~~~~~~~~
   kernel/printk/printk.c:84:13: warning: 'sync_mode' defined but not used =
[-Wunused-variable]
      84 | static bool sync_mode;
         |             ^~~~~~~~~
   cc1: some warnings being treated as errors

vim +/prb +2677 kernel/printk/printk.c

  2563	=

  2564	/*
  2565	 * The console driver calls this routine during kernel initialization
  2566	 * to register the console printing procedure with printk() and to
  2567	 * print any messages that were printed by the kernel before the
  2568	 * console driver was initialized.
  2569	 *
  2570	 * This can happen pretty early during the boot process (because of
  2571	 * early_printk) - sometimes before setup_arch() completes - be care=
ful
  2572	 * of what kernel features are used - they may not be initialised ye=
t.
  2573	 *
  2574	 * There are two types of consoles - bootconsoles (early_printk) and
  2575	 * "real" consoles (everything which is not a bootconsole) which are
  2576	 * handled differently.
  2577	 *  - Any number of bootconsoles can be registered at any time.
  2578	 *  - As soon as a "real" console is registered, all bootconsoles
  2579	 *    will be unregistered automatically.
  2580	 *  - Once a "real" console is registered, any attempt to register a
  2581	 *    bootconsoles will be rejected
  2582	 */
  2583	void register_console(struct console *newcon)
  2584	{
  2585		struct console *bcon =3D NULL;
  2586		int err;
  2587	=

  2588		for_each_console(bcon) {
  2589			if (WARN(bcon =3D=3D newcon, "console '%s%d' already registered\n",
  2590						 bcon->name, bcon->index))
  2591				return;
  2592		}
  2593	=

  2594		/*
  2595		 * before we register a new CON_BOOT console, make sure we don't
  2596		 * already have a valid console
  2597		 */
  2598		if (newcon->flags & CON_BOOT) {
  2599			for_each_console(bcon) {
  2600				if (!(bcon->flags & CON_BOOT)) {
  2601					pr_info("Too late to register bootconsole %s%d\n",
  2602						newcon->name, newcon->index);
  2603					return;
  2604				}
  2605			}
  2606		}
  2607	=

  2608		newcon->thread =3D NULL;
  2609	=

  2610		if (console_drivers && console_drivers->flags & CON_BOOT)
  2611			bcon =3D console_drivers;
  2612	=

  2613		if (!has_preferred_console || bcon || !console_drivers)
  2614			has_preferred_console =3D preferred_console >=3D 0;
  2615	=

  2616		/*
  2617		 *	See if we want to use this console driver. If we
  2618		 *	didn't select a console we take the first one
  2619		 *	that registers here.
  2620		 */
  2621		if (!has_preferred_console) {
  2622			if (newcon->index < 0)
  2623				newcon->index =3D 0;
  2624			if (newcon->setup =3D=3D NULL ||
  2625			    newcon->setup(newcon, NULL) =3D=3D 0) {
  2626				newcon->flags |=3D CON_ENABLED;
  2627				if (newcon->device) {
  2628					newcon->flags |=3D CON_CONSDEV;
  2629					has_preferred_console =3D true;
  2630				}
  2631			}
  2632		}
  2633	=

  2634		/* See if this console matches one we selected on the command line =
*/
  2635		err =3D try_enable_new_console(newcon, true);
  2636	=

  2637		/* If not, try to match against the platform default(s) */
  2638		if (err =3D=3D -ENOENT)
  2639			err =3D try_enable_new_console(newcon, false);
  2640	=

  2641		/* printk() messages are not printed to the Braille console. */
  2642		if (err || newcon->flags & CON_BRL)
  2643			return;
  2644	=

  2645		/*
  2646		 * If we have a bootconsole, and are switching to a real console,
  2647		 * don't print everything out again, since when the boot console, a=
nd
  2648		 * the real console are the same physical device, it's annoying to
  2649		 * see the beginning boot messages twice
  2650		 */
  2651		if (bcon && ((newcon->flags & (CON_CONSDEV | CON_BOOT)) =3D=3D CON_=
CONSDEV))
  2652			newcon->flags &=3D ~CON_PRINTBUFFER;
  2653	=

  2654		/*
  2655		 *	Put this console in the list - keep the
  2656		 *	preferred driver at the head of the list.
  2657		 */
  2658		console_lock();
  2659		if ((newcon->flags & CON_CONSDEV) || console_drivers =3D=3D NULL) {
  2660			newcon->next =3D console_drivers;
  2661			console_drivers =3D newcon;
  2662			if (newcon->next)
  2663				newcon->next->flags &=3D ~CON_CONSDEV;
  2664			/* Ensure this flag is always set for the head of the list */
  2665			newcon->flags |=3D CON_CONSDEV;
  2666		} else {
  2667			newcon->next =3D console_drivers->next;
  2668			console_drivers->next =3D newcon;
  2669		}
  2670	=

  2671		if (newcon->flags & CON_EXTENDED)
  2672			nr_ext_console_drivers++;
  2673	=

  2674		if (newcon->flags & CON_PRINTBUFFER)
  2675			atomic64_set(&newcon->printk_seq, 0);
  2676		else
> 2677			atomic64_set(&newcon->printk_seq, prb_next_seq(prb));
  2678	=

  2679		console_try_thread(newcon);
  2680		console_unlock();
  2681		console_sysfs_notify();
  2682	=

  2683		/*
  2684		 * By unregistering the bootconsoles after we enable the real conso=
le
  2685		 * we get the "console xxx enabled" message on all the consoles -
  2686		 * boot consoles, real consoles, etc - this is to ensure that end
  2687		 * users know there might be something in the kernel's log buffer t=
hat
  2688		 * went to the bootconsole (that they do not see on the real consol=
e)
  2689		 */
  2690		pr_info("%sconsole [%s%d] enabled\n",
  2691			(newcon->flags & CON_BOOT) ? "boot" : "" ,
  2692			newcon->name, newcon->index);
  2693		if (bcon &&
  2694		    ((newcon->flags & (CON_CONSDEV | CON_BOOT)) =3D=3D CON_CONSDEV)=
 &&
  2695		    !keep_bootcon) {
  2696			/* We need to iterate through all boot consoles, to make
  2697			 * sure we print everything out, before we unregister them.
  2698			 */
  2699			for_each_console(bcon)
  2700				if (bcon->flags & CON_BOOT)
  2701					unregister_console(bcon);
  2702		}
  2703	}
  2704	EXPORT_SYMBOL(register_console);
  2705	=

  2706	int unregister_console(struct console *console)
  2707	{
  2708		struct console *con;
  2709		int res;
  2710	=

  2711		pr_info("%sconsole [%s%d] disabled\n",
  2712			(console->flags & CON_BOOT) ? "boot" : "" ,
  2713			console->name, console->index);
  2714	=

  2715		res =3D _braille_unregister_console(console);
  2716		if (res < 0)
  2717			return res;
  2718		if (res > 0)
  2719			return 0;
  2720	=

  2721		res =3D -ENODEV;
  2722		console_lock();
  2723		if (console_drivers =3D=3D console) {
  2724			console_drivers=3Dconsole->next;
  2725			res =3D 0;
  2726		} else {
  2727			for_each_console(con) {
  2728				if (con->next =3D=3D console) {
  2729					con->next =3D console->next;
  2730					res =3D 0;
  2731					break;
  2732				}
  2733			}
  2734		}
  2735	=

  2736		if (res)
  2737			goto out_disable_unlock;
  2738	=

  2739		if (console->flags & CON_EXTENDED)
  2740			nr_ext_console_drivers--;
  2741	=

  2742		/*
  2743		 * If this isn't the last console and it has CON_CONSDEV set, we
  2744		 * need to set it on the next preferred console.
  2745		 */
  2746		if (console_drivers !=3D NULL && console->flags & CON_CONSDEV)
  2747			console_drivers->flags |=3D CON_CONSDEV;
  2748	=

  2749		console->flags &=3D ~CON_ENABLED;
  2750		console_unlock();
  2751		console_sysfs_notify();
  2752	=

  2753		if (console->thread && !IS_ERR(console->thread))
  2754			kthread_stop(console->thread);
  2755	=

  2756		if (console->exit)
  2757			res =3D console->exit(console);
  2758	=

  2759		return res;
  2760	=

  2761	out_disable_unlock:
  2762		console->flags &=3D ~CON_ENABLED;
  2763		console_unlock();
  2764	=

  2765		return res;
  2766	}
  2767	EXPORT_SYMBOL(unregister_console);
  2768	=

  2769	/*
  2770	 * Initialize the console device. This is called *early*, so
  2771	 * we can't necessarily depend on lots of kernel help here.
  2772	 * Just do some early initializations, and do the complex setup
  2773	 * later.
  2774	 */
  2775	void __init console_init(void)
  2776	{
  2777		int ret;
  2778		initcall_t call;
  2779		initcall_entry_t *ce;
  2780	=

  2781		/* Setup the default TTY line discipline. */
  2782		n_tty_init();
  2783	=

  2784		/*
  2785		 * set up the console device so that later boot sequences can
  2786		 * inform about problems etc..
  2787		 */
  2788		ce =3D __con_initcall_start;
  2789		trace_initcall_level("console");
  2790		while (ce < __con_initcall_end) {
  2791			call =3D initcall_from_entry(ce);
  2792			trace_initcall_start(call);
  2793			ret =3D call();
  2794			trace_initcall_finish(call, ret);
  2795			ce++;
  2796		}
  2797	}
  2798	=

  2799	static int printk_kthread_func(void *data)
  2800	{
  2801		struct console *con =3D data;
  2802		unsigned long dropped =3D 0;
  2803		struct printk_info info;
  2804		struct printk_record r;
  2805		char *ext_text =3D NULL;
  2806		size_t dropped_len;
  2807		char *dropped_text;
  2808		int ret =3D -ENOMEM;
  2809		char *write_text;
  2810		u64 printk_seq;
  2811		size_t len;
  2812		char *text;
  2813		int error;
  2814		u64 seq;
  2815	=

  2816		if (con->flags & CON_EXTENDED) {
  2817			ext_text =3D kmalloc(CONSOLE_EXT_LOG_MAX, GFP_KERNEL);
  2818			if (!ext_text)
  2819				return ret;
  2820		}
  2821		text =3D kmalloc(LOG_LINE_MAX + PREFIX_MAX, GFP_KERNEL);
  2822		dropped_text =3D kmalloc(64, GFP_KERNEL);
  2823		if (!text || !dropped_text)
  2824			goto out;
  2825	=

  2826		if (con->flags & CON_EXTENDED)
  2827			write_text =3D ext_text;
  2828		else
  2829			write_text =3D text;
  2830	=

  2831		seq =3D atomic64_read(&con->printk_seq);
  2832	=

  2833		prb_rec_init_rd(&r, &info, text, LOG_LINE_MAX + PREFIX_MAX);
  2834	=

  2835		for (;;) {
> 2836			error =3D wait_event_interruptible(log_wait,
  2837					prb_read_valid(prb, seq, &r) || kthread_should_stop());
  2838	=

  2839			if (kthread_should_stop())
  2840				break;
  2841	=

  2842			if (error)
  2843				continue;
  2844	=

  2845			if (seq !=3D r.info->seq) {
  2846				dropped +=3D r.info->seq - seq;
  2847				seq =3D r.info->seq;
  2848			}
  2849	=

  2850			seq++;
  2851	=

  2852			if (!(con->flags & CON_ENABLED))
  2853				continue;
  2854	=

  2855			if (suppress_message_printing(r.info->level))
  2856				continue;
  2857	=

  2858			if (con->flags & CON_EXTENDED) {
  2859				len =3D info_print_ext_header(ext_text,
  2860					CONSOLE_EXT_LOG_MAX,
  2861					r.info);
  2862				len +=3D msg_print_ext_body(ext_text + len,
  2863					CONSOLE_EXT_LOG_MAX - len,
  2864					&r.text_buf[0], r.info->text_len,
  2865					&r.info->dev_info);
  2866			} else {
  2867				len =3D record_print_text(&r,
  2868					console_msg_format & MSG_FORMAT_SYSLOG,
  2869					printk_time);
  2870			}
  2871	=

  2872			printk_seq =3D atomic64_read(&con->printk_seq);
  2873	=

  2874			console_lock();
  2875			console_may_schedule =3D 0;
  2876	=

  2877			if (kernel_sync_mode() && con->write_atomic) {
  2878				console_unlock();
  2879				break;
  2880			}
  2881	=

  2882			if (!(con->flags & CON_EXTENDED) && dropped) {
  2883				dropped_len =3D snprintf(dropped_text, 64,
  2884						       "** %lu printk messages dropped **\n",
  2885						       dropped);
  2886				dropped =3D 0;
  2887	=

  2888				con->write(con, dropped_text, dropped_len);
  2889				printk_delay(r.info->level);
  2890			}
  2891	=

  2892			con->write(con, write_text, len);
  2893			if (len)
  2894				printk_delay(r.info->level);
  2895	=

  2896			atomic64_cmpxchg_relaxed(&con->printk_seq, printk_seq, seq);
  2897	=

  2898			console_unlock();
  2899		}
  2900	out:
  2901		kfree(dropped_text);
  2902		kfree(text);
  2903		kfree(ext_text);
  2904		pr_info("%sconsole [%s%d]: printing thread stopped\n",
  2905			(con->flags & CON_BOOT) ? "boot" : "" ,
  2906			con->name, con->index);
  2907		return ret;
  2908	}
  2909	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0949113744759213522==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Rt1QnM66EQAuTqt2VkyDZJkJgf8XiN7B89xMAAA=
--===============0949113744759213522==--

