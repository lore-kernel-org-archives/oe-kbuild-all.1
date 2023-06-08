Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08B91953A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 23:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686267115; x=1717803115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6z/8lvl7lNbNei+SF/uOfDBhH0wnFKrQG1CHeG4ESEc=;
  b=ZamRuUZDgy8lHGpGgBLfmQK8u31K8mg6K8G7gObi7OlaRmAluGK6V2uZ
   nSYg3D9Uxay4/a7h9hxgGrQpUUpDU5g8iKWkAlQV5JcHkCGhGJd/8P4Sd
   IoGYbl6wTDnG7P6pmEbFeWRxO3MRGAgwXlQ2LiaSi30zqMmyuLR0ATTMq
   /jJVxwoPWF17lTnd/SlY1e3xfLov3weECYnPaPwnhDqNJJsOP9Hp5Eao5
   4Bh0KoFIldGOo/GRgRSQMQHShdnvtr/iJEwfp1ZNUau2vhMaMOE1ghUO9
   1axaOzX01Y3MDCcBorWoFLH8tHsklb+MnNRQb0uA8Il0PBylkPjXTbj0F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="357466429"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="357466429"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 16:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="884379954"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="884379954"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Jun 2023 16:31:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7P6Z-0008Lg-1O;
	Thu, 08 Jun 2023 23:31:47 +0000
Date: Fri, 9 Jun 2023 07:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS
 without recursion
Message-ID: <202306090735.fxxdATDy-lkp@intel.com>
References: <20230608142428.256985-9-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230608142428.256985-9-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on next-20230608]
[cannot apply to masahiroy-kbuild/fixes arnd-asm-generic/master rafael-pm/l=
inux-next linus/master v6.4-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/Reve=
rt-PATCH-uml-export-symbols-added-by-GCC-hardened/20230608-223125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbu=
ild.git for-next
patch link:    https://lore.kernel.org/r/20230608142428.256985-9-masahiroy%=
40kernel.org
patch subject: [PATCH v7 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS =
without recursion
config: xtensa-randconfig-r025-20230608 (https://download.01.org/0day-ci/ar=
chive/20230609/202306090735.fxxdATDy-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=3D1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linu=
x/kernel/git/masahiroy/linux-kbuild.git
        git fetch masahiroy-kbuild for-next
        git checkout masahiroy-kbuild/for-next
        b4 shazam https://lore.kernel.org/r/20230608142428.256985-9-masahir=
oy@kernel.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/make=
=2Ecross W=3D1 O=3Dbuild_dir ARCH=3Dxtensa olddefconfig
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/make=
=2Ecross W=3D1 O=3Dbuild_dir ARCH=3Dxtensa SHELL=3D/bin/bash kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090735.fxxdATDy-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:6: Error: can't resolve prof_on - L0=01
>> {standard input}:7: Error: can't resolve profile_hits - L0=01
--
   {standard input}: Assembler messages:
   {standard input}:6: Error: can't resolve __put_cred - L0=01
   {standard input}:7: Error: can't resolve get_task_cred - L0=01
   {standard input}:8: Error: can't resolve prepare_creds - L0=01
   {standard input}:9: Error: can't resolve commit_creds - L0=01
   {standard input}:10: Error: can't resolve abort_creds - L0=01
   {standard input}:11: Error: can't resolve override_creds - L0=01
   {standard input}:12: Error: can't resolve revert_creds - L0=01
   {standard input}:13: Error: can't resolve cred_fscmp - L0=01
   {standard input}:14: Error: can't resolve prepare_kernel_cred - L0=01
   {standard input}:15: Error: can't resolve set_security_override - L0=01
   {standard input}:16: Error: can't resolve set_security_override_from_ctx=
 - L0=01
   {standard input}:17: Error: can't resolve set_create_files_as - L0=01
>> {standard input}:18: Error: can't resolve creds_are_invalid - L0=01
>> {standard input}:19: Error: can't resolve __invalid_creds - L0=01
>> {standard input}:20: Error: can't resolve __validate_process_creds - L0=
=01
--
   {standard input}: Assembler messages:
   {standard input}:6: Error: can't resolve context_tracking - L0=01
>> {standard input}:7: Error: can't resolve ct_idle_enter - L0=01
>> {standard input}:8: Error: can't resolve ct_idle_exit - L0=01
   {standard input}:9: Error: can't resolve context_tracking_key - L0=01
   {standard input}:10: Error: can't resolve __ct_user_enter - L0=01
   {standard input}:11: Error: can't resolve ct_user_enter - L0=01
   {standard input}:12: Error: can't resolve __ct_user_exit - L0=01
   {standard input}:13: Error: can't resolve ct_user_exit - L0=01
--
   {standard input}: Assembler messages:
>> {standard input}:6: Error: can't resolve rcu_scheduler_active - L0=01
>> {standard input}:7: Error: can't resolve rcu_get_gp_kthreads_prio - L0=01
>> {standard input}:8: Error: can't resolve rcu_momentary_dyntick_idle - L0=
=01
>> {standard input}:9: Error: can't resolve rcu_get_gp_seq - L0=01
>> {standard input}:10: Error: can't resolve rcu_exp_batches_completed - L0=
=01
>> {standard input}:11: Error: can't resolve rcutorture_get_gp_data - L0=01
>> {standard input}:12: Error: can't resolve rcu_is_watching - L0=01
>> {standard input}:13: Error: can't resolve rcu_gp_slow_register - L0=01
>> {standard input}:14: Error: can't resolve rcu_gp_slow_unregister - L0=01
>> {standard input}:15: Error: can't resolve rcu_gp_set_torture_wait - L0=01
>> {standard input}:16: Error: can't resolve rcu_force_quiescent_state - L0=
=01
   {standard input}:17: Error: can't resolve call_rcu - L0=01
   {standard input}:18: Error: can't resolve kvfree_call_rcu - L0=01
   {standard input}:19: Error: can't resolve synchronize_rcu - L0=01
   {standard input}:20: Error: can't resolve get_completed_synchronize_rcu_=
full - L0=01
   {standard input}:21: Error: can't resolve get_state_synchronize_rcu - L0=
=01
>> {standard input}:22: Error: can't resolve get_state_synchronize_rcu_full=
 - L0=01
   {standard input}:23: Error: can't resolve start_poll_synchronize_rcu - L=
0=01
>> {standard input}:24: Error: can't resolve start_poll_synchronize_rcu_ful=
l - L0=01
   {standard input}:25: Error: can't resolve poll_state_synchronize_rcu - L=
0=01
>> {standard input}:26: Error: can't resolve poll_state_synchronize_rcu_ful=
l - L0=01
>> {standard input}:27: Error: can't resolve cond_synchronize_rcu - L0=01
>> {standard input}:28: Error: can't resolve cond_synchronize_rcu_full - L0=
=01
   {standard input}:29: Error: can't resolve rcu_barrier - L0=01
>> {standard input}:30: Error: can't resolve rcu_exp_jiffies_till_stall_che=
ck - L0=01
>> {standard input}:31: Error: can't resolve rcu_jiffies_till_stall_check -=
 L0=01
>> {standard input}:32: Error: can't resolve rcu_check_boost_fail - L0=01
>> {standard input}:33: Error: can't resolve show_rcu_gp_kthreads - L0=01
   {standard input}:34: Error: can't resolve rcu_fwd_progress_check - L0=01
   {standard input}:35: Error: can't resolve synchronize_rcu_expedited - L0=
=01
   {standard input}:36: Error: can't resolve start_poll_synchronize_rcu_exp=
edited - L0=01
   {standard input}:37: Error: can't resolve start_poll_synchronize_rcu_exp=
edited_full - L0=01
   {standard input}:38: Error: can't resolve cond_synchronize_rcu_expedited=
 - L0=01
   {standard input}:39: Error: can't resolve cond_synchronize_rcu_expedited=
_full - L0=01
   {standard input}:40: Error: can't resolve rcu_nocb_flush_deferred_wakeup=
 - L0=01
   {standard input}:41: Error: can't resolve rcu_nocb_cpu_deoffload - L0=01
   {standard input}:42: Error: can't resolve rcu_nocb_cpu_offload - L0=01
   {standard input}:43: Error: can't resolve rcu_bind_current_to_nocb - L0=
=01
   {standard input}:44: Error: can't resolve rcu_note_context_switch - L0=01
   {standard input}:45: Error: can't resolve __rcu_read_lock - L0=01
   {standard input}:46: Error: can't resolve __rcu_read_unlock - L0=01
--
   {standard input}: Assembler messages:
>> {standard input}:6: Error: can't resolve rcu_gp_is_normal - L0=01
>> {standard input}:7: Error: can't resolve rcu_async_should_hurry - L0=01
>> {standard input}:8: Error: can't resolve rcu_async_hurry - L0=01
>> {standard input}:9: Error: can't resolve rcu_async_relax - L0=01
>> {standard input}:10: Error: can't resolve rcu_gp_is_expedited - L0=01
>> {standard input}:11: Error: can't resolve rcu_expedite_gp - L0=01
>> {standard input}:12: Error: can't resolve rcu_unexpedite_gp - L0=01
>> {standard input}:13: Error: can't resolve rcu_inkernel_boot_has_ended - =
L0=01
   {standard input}:14: Error: can't resolve wakeme_after_rcu - L0=01
   {standard input}:15: Error: can't resolve __wait_rcu_gp - L0=01
   {standard input}:16: Error: can't resolve finish_rcuwait - L0=01
>> {standard input}:17: Error: can't resolve init_rcu_head - L0=01
>> {standard input}:18: Error: can't resolve destroy_rcu_head - L0=01
>> {standard input}:19: Error: can't resolve init_rcu_head_on_stack - L0=01
>> {standard input}:20: Error: can't resolve destroy_rcu_head_on_stack - L0=
=01
>> {standard input}:21: Error: can't resolve rcuhead_debug_descr - L0=01
   {standard input}:22: Error: can't resolve do_trace_rcu_torture_read - L0=
=01
>> {standard input}:23: Error: can't resolve rcu_cpu_stall_suppress - L0=01
   {standard input}:24: Error: can't resolve rcu_cpu_stall_suppress_at_boot=
 - L0=01
   {standard input}:25: Error: can't resolve get_completed_synchronize_rcu =
- L0=01
   {standard input}:26: Error: can't resolve call_rcu_tasks - L0=01
   {standard input}:27: Error: can't resolve synchronize_rcu_tasks - L0=01
   {standard input}:28: Error: can't resolve rcu_barrier_tasks - L0=01
>> {standard input}:29: Error: can't resolve show_rcu_tasks_classic_gp_kthr=
ead - L0=01
--
   {standard input}: Assembler messages:
   {standard input}:6: Error: can't resolve init_srcu_struct - L0=01
   {standard input}:7: Error: can't resolve cleanup_srcu_struct - L0=01
>> {standard input}:8: Error: can't resolve __srcu_read_lock - L0=01
   {standard input}:9: Error: can't resolve __srcu_read_unlock - L0=01
   {standard input}:10: Error: can't resolve call_srcu - L0=01
>> {standard input}:11: Error: can't resolve synchronize_srcu_expedited - L=
0=01
   {standard input}:12: Error: can't resolve synchronize_srcu - L0=01
   {standard input}:13: Error: can't resolve get_state_synchronize_srcu - L=
0=01
   {standard input}:14: Error: can't resolve start_poll_synchronize_srcu - =
L0=01
   {standard input}:15: Error: can't resolve poll_state_synchronize_srcu - =
L0=01
>> {standard input}:16: Error: can't resolve srcu_barrier - L0=01
>> {standard input}:17: Error: can't resolve srcu_batches_completed - L0=01
>> {standard input}:18: Error: can't resolve srcutorture_get_gp_data - L0=01
>> {standard input}:19: Error: can't resolve srcu_torture_stats_print - L0=
=01
--
   kernel/sched/core.c:6778:35: warning: no previous prototype for 'schedul=
e_user' [-Wmissing-prototypes]
    6778 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^~~~~~~~~~~~~
   {standard input}: Assembler messages:
   {standard input}:6: Error: can't resolve __tracepoint_ipi_send_cpu - L0=
=01
   {standard input}:7: Error: can't resolve __traceiter_ipi_send_cpu - L0=01
   {standard input}:8: Error: can't resolve __SCK__tp_func_ipi_send_cpu - L=
0=01
   {standard input}:9: Error: can't resolve __tracepoint_ipi_send_cpumask -=
 L0=01
   {standard input}:10: Error: can't resolve __traceiter_ipi_send_cpumask -=
 L0=01
   {standard input}:11: Error: can't resolve __SCK__tp_func_ipi_send_cpumas=
k - L0=01
   {standard input}:12: Error: can't resolve __tracepoint_pelt_cfs_tp - L0=
=01
   {standard input}:13: Error: can't resolve __traceiter_pelt_cfs_tp - L0=01
   {standard input}:14: Error: can't resolve __SCK__tp_func_pelt_cfs_tp - L=
0=01
   {standard input}:15: Error: can't resolve __tracepoint_pelt_rt_tp - L0=01
   {standard input}:16: Error: can't resolve __traceiter_pelt_rt_tp - L0=01
   {standard input}:17: Error: can't resolve __SCK__tp_func_pelt_rt_tp - L0=
=01
   {standard input}:18: Error: can't resolve __tracepoint_pelt_dl_tp - L0=01
   {standard input}:19: Error: can't resolve __traceiter_pelt_dl_tp - L0=01
   {standard input}:20: Error: can't resolve __SCK__tp_func_pelt_dl_tp - L0=
=01
   {standard input}:21: Error: can't resolve __tracepoint_pelt_irq_tp - L0=
=01
   {standard input}:22: Error: can't resolve __traceiter_pelt_irq_tp - L0=01
   {standard input}:23: Error: can't resolve __SCK__tp_func_pelt_irq_tp - L=
0=01
   {standard input}:24: Error: can't resolve __tracepoint_pelt_se_tp - L0=01
   {standard input}:25: Error: can't resolve __traceiter_pelt_se_tp - L0=01
   {standard input}:26: Error: can't resolve __SCK__tp_func_pelt_se_tp - L0=
=01
   {standard input}:27: Error: can't resolve __tracepoint_pelt_thermal_tp -=
 L0=01
   {standard input}:28: Error: can't resolve __traceiter_pelt_thermal_tp - =
L0=01
   {standard input}:29: Error: can't resolve __SCK__tp_func_pelt_thermal_tp=
 - L0=01
   {standard input}:30: Error: can't resolve __tracepoint_sched_cpu_capacit=
y_tp - L0=01
   {standard input}:31: Error: can't resolve __traceiter_sched_cpu_capacity=
_tp - L0=01
   {standard input}:32: Error: can't resolve __SCK__tp_func_sched_cpu_capac=
ity_tp - L0=01
   {standard input}:33: Error: can't resolve __tracepoint_sched_overutilize=
d_tp - L0=01
   {standard input}:34: Error: can't resolve __traceiter_sched_overutilized=
_tp - L0=01
   {standard input}:35: Error: can't resolve __SCK__tp_func_sched_overutili=
zed_tp - L0=01
   {standard input}:36: Error: can't resolve __tracepoint_sched_util_est_cf=
s_tp - L0=01
   {standard input}:37: Error: can't resolve __traceiter_sched_util_est_cfs=
_tp - L0=01
   {standard input}:38: Error: can't resolve __SCK__tp_func_sched_util_est_=
cfs_tp - L0=01
   {standard input}:39: Error: can't resolve __tracepoint_sched_util_est_se=
_tp - L0=01
   {standard input}:40: Error: can't resolve __traceiter_sched_util_est_se_=
tp - L0=01
   {standard input}:41: Error: can't resolve __SCK__tp_func_sched_util_est_=
se_tp - L0=01
   {standard input}:42: Error: can't resolve __tracepoint_sched_update_nr_r=
unning_tp - L0=01
   {standard input}:43: Error: can't resolve __traceiter_sched_update_nr_ru=
nning_tp - L0=01
   {standard input}:44: Error: can't resolve __SCK__tp_func_sched_update_nr=
_running_tp - L0=01
   {standard input}:45: Error: can't resolve wake_up_process - L0=01
   {standard input}:46: Error: can't resolve single_task_running - L0=01
   {standard input}:47: Error: can't resolve kstat - L0=01
   {standard input}:48: Error: can't resolve kernel_cpustat - L0=01
   {standard input}:49: Error: can't resolve schedule - L0=01
>> {standard input}:50: Error: can't resolve preempt_schedule - L0=01
>> {standard input}:51: Error: can't resolve preempt_schedule_notrace - L0=
=01
   {standard input}:52: Error: can't resolve default_wake_function - L0=01
   {standard input}:53: Error: can't resolve set_user_nice - L0=01
   {standard input}:54: Error: can't resolve sched_setattr_nocheck - L0=01
   {standard input}:55: Error: can't resolve sched_set_fifo - L0=01
   {standard input}:56: Error: can't resolve sched_set_fifo_low - L0=01
   {standard input}:57: Error: can't resolve sched_set_normal - L0=01
   {standard input}:58: Error: can't resolve __cond_resched_lock - L0=01
   {standard input}:59: Error: can't resolve __cond_resched_rwlock_read - L=
0=01
   {standard input}:60: Error: can't resolve __cond_resched_rwlock_write - =
L0=01
   {standard input}:61: Error: can't resolve yield - L0=01
   {standard input}:62: Error: can't resolve yield_to - L0=01
   {standard input}:63: Error: can't resolve io_schedule_timeout - L0=01
   {standard input}:64: Error: can't resolve io_schedule - L0=01
   {standard input}:65: Error: can't resolve sched_show_task - L0=01

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
