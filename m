Content-Type: multipart/mixed; boundary="===============0617209704234369770=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-rt-devel:linux-5.10.y-rt-rebase 57/209] kernel/printk/printk.c:2677:50: error: 'prb' undeclared
Date: Sat, 31 Oct 2020 20:32:05 +0800
Message-ID: <202010312000.nM42nz6T-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0617209704234369770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.10.y-rt-rebase
head:   87b7b3d2cb296950a0e3005406899ccfbbc9da7c
commit: ca4fcaa60de914c0ef6864983a8488bf5ab6cafb [57/209] printk: move cons=
ole printing to kthreads
config: ia64-allnoconfig (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git/commit/?id=3Dca4fcaa60de914c0ef6864983a8488bf5ab6cafb
        git remote add linux-rt-devel https://git.kernel.org/pub/scm/linux/=
kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags linux-rt-devel linux-5.10.y-rt-rebase
        git checkout ca4fcaa60de914c0ef6864983a8488bf5ab6cafb
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dia64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:154,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:33,
                    from kernel/printk/printk.c:23:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:137:41: warning: variable 'old_rr4' =
set but not used [-Wunused-but-set-variable]
     137 |  unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                         ^~~~~~~
   In file included from kernel/printk/printk.c:63:
   kernel/printk/internal.h: At top level:
   kernel/printk/internal.h:56:20: warning: no previous prototype for 'vpri=
ntk_func' [-Wmissing-prototypes]
      56 | __printf(1, 0) int vprintk_func(const char *fmt, va_list args) {=
 return 0; }
         |                    ^~~~~~~~~~~~
   kernel/printk/printk.c:180:5: warning: no previous prototype for 'devkms=
g_sysctl_set_loglvl' [-Wmissing-prototypes]
     180 | int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from ./arch/ia64/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:232,
                    from include/linux/kernel.h:11,
                    from kernel/printk/printk.c:22:
   kernel/printk/printk.c: In function 'register_console':
>> kernel/printk/printk.c:2677:50: error: 'prb' undeclared (first use in th=
is function)
    2677 |   atomic64_set(&newcon->printk_seq, prb_next_seq(prb));
         |                                                  ^~~
   include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRIT=
E_ONCE'
      55 |  *(volatile typeof(x) *)&(x) =3D (val);    \
         |                                 ^~~
   arch/ia64/include/asm/atomic.h:28:27: note: in expansion of macro 'WRITE=
_ONCE'
      28 | #define atomic64_set(v,i) WRITE_ONCE(((v)->counter), (i))
         |                           ^~~~~~~~~~
   kernel/printk/printk.c:2677:3: note: in expansion of macro 'atomic64_set'
    2677 |   atomic64_set(&newcon->printk_seq, prb_next_seq(prb));
         |   ^~~~~~~~~~~~
   kernel/printk/printk.c:2677:50: note: each undeclared identifier is repo=
rted only once for each function it appears in
    2677 |   atomic64_set(&newcon->printk_seq, prb_next_seq(prb));
         |                                                  ^~~
   include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRIT=
E_ONCE'
      55 |  *(volatile typeof(x) *)&(x) =3D (val);    \
         |                                 ^~~
   arch/ia64/include/asm/atomic.h:28:27: note: in expansion of macro 'WRITE=
_ONCE'
      28 | #define atomic64_set(v,i) WRITE_ONCE(((v)->counter), (i))
         |                           ^~~~~~~~~~
   kernel/printk/printk.c:2677:3: note: in expansion of macro 'atomic64_set'
    2677 |   atomic64_set(&newcon->printk_seq, prb_next_seq(prb));
         |   ^~~~~~~~~~~~
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
   kernel/printk/printk.c:2938:6: warning: assignment to 'char *' from 'int=
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

--===============0617209704234369770==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
xIQrKnbvCoXzr79fu3WY+l8AAA==
--===============0617209704234369770==--

