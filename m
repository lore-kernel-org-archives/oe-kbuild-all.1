Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314FE14EC62
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727350757; cv=none; b=kt9QS7eIMDlljDpx+10nUieSCZsChnPKlEVJ0WD3k5V0zkbHh0qai6BT8DJvMLrwNztfrADS1r54cP2ugfQO9v77q1AodruZyOE+I0tf+EWyUnfJBVbil0P5rR1NbWNXoSn3kpiyJTbF5e8JWMTfzIJZiPO4NklDV+B7FIYQeH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727350757; c=relaxed/simple;
	bh=AtOqoZwnXbxdZ9vKfUFyzBAKve9RI3ZBUpKNzoy548Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LI7G+C+wdPNO9eq+JJCO3yLBch2ntIqzTIaLbJ/zplcWSQXLWlYmtBv+Blw0e7tTEzl+QNHc6VPu4g7mqbNPLAOxc2X1oH9rD1e8+clj+yobjemwzJgNDmXxZId0xSnQqrP2TucHyXr8QfHyBfgoqE1UaLKrjJt7t1DZcOalNJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkkoqH2K; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkkoqH2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727350754; x=1758886754;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AtOqoZwnXbxdZ9vKfUFyzBAKve9RI3ZBUpKNzoy548Q=;
  b=FkkoqH2K8WmzsY66n3TYisfD49IFt8dzvIWmKTab3gKLc+KI56L0hDxT
   qQIx3/ERp6OmCNSrQ4KHIGdUqmnNuJdRkGddYkqLmXu/ltSwDRv3+jyoT
   WzFrkrzBS65KGpTYmfxPDs3J8uM4d/h+NwbM3+MUyl4lqvoMhIhFTIhbH
   Q4RyOq9TQi0VR0SmufDzvDWnyYstqESlAjrHWrLWyg7m5+t44uXMuslkq
   QQfdPbVysncaHaZyBjaucmCcWqfKewNV3e/9aXvrnnLQIfQNYsllk7ERw
   oS399YoLivR3S8QyNOkpHpDz9/4tHmag4V6IgTLS3OlJkBDo2UpOEgaCG
   g==;
X-CSE-ConnectionGUID: 3aHyKWAmRLalKHHnsEv+HQ==
X-CSE-MsgGUID: tdS2xP6eTHePEhqWrMV60Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25909598"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="25909598"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 04:39:13 -0700
X-CSE-ConnectionGUID: PCLXM2GSRsarlrQGaM3Fyw==
X-CSE-MsgGUID: aELC/l1jRrGSWCUYgE0Flw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="76486161"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Sep 2024 04:39:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stmpx-000Ke6-0N;
	Thu, 26 Sep 2024 11:39:09 +0000
Date: Thu, 26 Sep 2024 19:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 8439/14122] cpu.c:undefined reference to
 `trace_event_buffer_commit'
Message-ID: <202409261955.pho8kSov-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   81a41d2ac1de43215c014bc71d907a026042e55b
commit: 4c7a7e37c75ec2611be134d953ae976bc25c793b [8439/14122] LoongArch: Ch=
ange __my_cpu_offset definition to avoid mis-optimization
config: loongarch-randconfig-002-20240925 (https://download.01.org/0day-ci/=
archive/20240926/202409261955.pho8kSov-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240926/202409261955.pho8kSov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409261955.pho8kSov-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `sou=
nd/core/pcm_lib.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: warning: orphan section `_ftrace_events' from `lib=
/maple_tree.o' being placed in section `_ftrace_events'
   loongarch64-linux-ld: init/main.o: in function `.L199':
   main.c:(.text+0x1f0): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: main.c:(.text+0x22c): undefined reference to `perf=
_trace_run_bpf_submit'
   loongarch64-linux-ld: init/main.o: in function `perf_trace_initcall_star=
t':
   main.c:(.text+0x364): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: main.c:(.text+0x38c): undefined reference to `perf=
_trace_run_bpf_submit'
   loongarch64-linux-ld: init/main.o: in function `perf_trace_initcall_fini=
sh':
   main.c:(.text+0x44c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: main.c:(.text+0x478): undefined reference to `perf=
_trace_run_bpf_submit'
   loongarch64-linux-ld: init/main.o: in function `trace_event_raw_event_in=
itcall_start':
   main.c:(.text+0x550): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: main.c:(.text+0x560): undefined reference to `trac=
e_event_buffer_commit'
   loongarch64-linux-ld: init/main.o: in function `.L240':
   main.c:(.text+0x5a8): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: init/main.o: in function `trace_event_raw_event_in=
itcall_finish':
   main.c:(.text+0x620): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: main.c:(.text+0x634): undefined reference to `trac=
e_event_buffer_commit'
   loongarch64-linux-ld: init/main.o: in function `.L251':
   main.c:(.text+0x688): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: init/main.o: in function `.L247':
   main.c:(.text+0x6bc): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: init/main.o: in function `trace_raw_output_initcal=
l_level':
   main.c:(.text+0x714): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: main.c:(.text+0x734): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: main.c:(.text+0x75c): undefined reference to `trac=
e_raw_output_prep'
   loongarch64-linux-ld: init/main.o: in function `trace_raw_output_initcal=
l_start':
   main.c:(.text+0x7b0): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: main.c:(.text+0x7d0): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: main.c:(.text+0x7fc): undefined reference to `trac=
e_raw_output_prep'
   loongarch64-linux-ld: init/main.o: in function `trace_raw_output_initcal=
l_finish':
   main.c:(.text+0x854): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: main.c:(.text+0x874): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: init/main.o: in function `trace_event_raw_event_in=
itcall_level':
   main.c:(.text+0x8f8): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: main.c:(.text+0x914): undefined reference to `trac=
e_event_buffer_commit'
   loongarch64-linux-ld: init/main.o: in function `.L312':
   main.c:(.text+0x97c): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: init/main.o: in function `.L299':
   main.c:(.text+0x9c8): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: init/main.o:(.ref.data+0x18): undefined reference =
to `trace_event_reg'
   loongarch64-linux-ld: init/main.o:(.ref.data+0x40): undefined reference =
to `trace_event_raw_init'
   loongarch64-linux-ld: init/main.o:(.ref.data+0x60): undefined reference =
to `trace_event_reg'
   loongarch64-linux-ld: init/main.o:(.ref.data+0x88): undefined reference =
to `trace_event_raw_init'
   loongarch64-linux-ld: init/main.o:(.ref.data+0xa8): undefined reference =
to `trace_event_reg'
   loongarch64-linux-ld: init/main.o:(.ref.data+0xd0): undefined reference =
to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/fork.o: in function `perf_trace_task_newtas=
k':
   fork.c:(.text+0x168): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/fork.o: in function `.L34':
   fork.c:(.text+0x1bc): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/fork.o: in function `.L33':
   fork.c:(.text+0x238): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/fork.o: in function `trace_event_raw_event_=
task_newtask':
   fork.c:(.text+0x2f4): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: kernel/fork.o: in function `.L39':
   fork.c:(.text+0x32c): undefined reference to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/fork.o: in function `.L35':
   fork.c:(.text+0x36c): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: kernel/fork.o: in function `.L36':
   fork.c:(.text+0x3a4): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/fork.o: in function `trace_raw_output_task_=
newtask':
   fork.c:(.text+0x3fc): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: fork.c:(.text+0x41c): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: kernel/fork.o: in function `.L52':
   fork.c:(.text+0x444): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/fork.o: in function `trace_raw_output_task_=
rename':
   fork.c:(.text+0x49c): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: fork.c:(.text+0x4bc): undefined reference to `trac=
e_handle_return'
   loongarch64-linux-ld: kernel/fork.o: in function `.L58':
   fork.c:(.text+0x520): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/fork.o: in function `perf_trace_task_rename=
':
   fork.c:(.text+0x580): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/fork.o: in function `.L59':
   fork.c:(.text+0x5f8): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/fork.o: in function `.L70':
   fork.c:(.text+0x6b8): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: kernel/fork.o: in function `trace_event_raw_event_=
task_rename':
   fork.c:(.text+0x6fc): undefined reference to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/fork.o: in function `.L77':
   fork.c:(.text+0x748): undefined reference to `__trace_trigger_soft_disab=
led'
   loongarch64-linux-ld: kernel/fork.o:(.ref.data+0x18): undefined referenc=
e to `trace_event_reg'
   loongarch64-linux-ld: kernel/fork.o:(.ref.data+0x40): undefined referenc=
e to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/fork.o:(.ref.data+0x60): undefined referenc=
e to `trace_event_reg'
   loongarch64-linux-ld: kernel/fork.o:(.ref.data+0x88): undefined referenc=
e to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/cpu.o: in function `perf_trace_cpuhp_enter':
   cpu.c:(.text+0x2cc): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L35':
   cpu.c:(.text+0x300): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/cpu.o: in function `perf_trace_cpuhp_multi_=
enter':
   cpu.c:(.text+0x3dc): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L47':
   cpu.c:(.text+0x410): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/cpu.o: in function `perf_trace_cpuhp_exit':
   cpu.c:(.text+0x4fc): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L59':
   cpu.c:(.text+0x530): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/cpu.o: in function `trace_event_raw_event_c=
puhp_enter':
   cpu.c:(.text+0x628): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L74':
>> cpu.c:(.text+0x644): undefined reference to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L70':
   cpu.c:(.text+0x6a8): undefined reference to `__trace_trigger_soft_disabl=
ed'
   loongarch64-linux-ld: kernel/cpu.o: in function `trace_event_raw_event_c=
puhp_multi_enter':
   cpu.c:(.text+0x730): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: cpu.c:(.text+0x74c): undefined reference to `trace=
_event_buffer_commit'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L81':
   cpu.c:(.text+0x7a8): undefined reference to `__trace_trigger_soft_disabl=
ed'
   loongarch64-linux-ld: kernel/cpu.o: in function `trace_event_raw_event_c=
puhp_exit':
   cpu.c:(.text+0x830): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: cpu.c:(.text+0x84c): undefined reference to `trace=
_event_buffer_commit'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L92':
   cpu.c:(.text+0x8a8): undefined reference to `__trace_trigger_soft_disabl=
ed'
   loongarch64-linux-ld: cpu.c:(.text+0x8dc): undefined reference to `trace=
_raw_output_prep'
   loongarch64-linux-ld: kernel/cpu.o: in function `trace_raw_output_cpuhp_=
enter':
   cpu.c:(.text+0x93c): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: cpu.c:(.text+0x95c): undefined reference to `trace=
_handle_return'
   loongarch64-linux-ld: kernel/cpu.o: in function `.L108':
>> cpu.c:(.text+0x984): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/cpu.o: in function `trace_raw_output_cpuhp_=
multi_enter':
   cpu.c:(.text+0x9dc): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: cpu.c:(.text+0x9fc): undefined reference to `trace=
_handle_return'
   loongarch64-linux-ld: cpu.c:(.text+0xa24): undefined reference to `trace=
_raw_output_prep'
   loongarch64-linux-ld: kernel/cpu.o: in function `trace_raw_output_cpuhp_=
exit':
   cpu.c:(.text+0xa7c): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: cpu.c:(.text+0xa9c): undefined reference to `trace=
_handle_return'
   loongarch64-linux-ld: kernel/cpu.o:(.ref.data+0x18): undefined reference=
 to `trace_event_reg'
   loongarch64-linux-ld: kernel/cpu.o:(.ref.data+0x40): undefined reference=
 to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/cpu.o:(.ref.data+0x60): undefined reference=
 to `trace_event_reg'
   loongarch64-linux-ld: kernel/cpu.o:(.ref.data+0x88): undefined reference=
 to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/cpu.o:(.ref.data+0xa8): undefined reference=
 to `trace_event_reg'
   loongarch64-linux-ld: kernel/cpu.o:(.ref.data+0xd0): undefined reference=
 to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/softirq.o: in function `perf_trace_irq_hand=
ler_exit':
   softirq.c:(.text+0x454): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L74':
   softirq.c:(.text+0x480): undefined reference to `perf_trace_run_bpf_subm=
it'
   loongarch64-linux-ld: kernel/softirq.o: in function `perf_trace_softirq':
   softirq.c:(.text+0x544): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L86':
   softirq.c:(.text+0x56c): undefined reference to `perf_trace_run_bpf_subm=
it'
   loongarch64-linux-ld: kernel/softirq.o: in function `perf_trace_tasklet':
   softirq.c:(.text+0x62c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L98':
   softirq.c:(.text+0x658): undefined reference to `perf_trace_run_bpf_subm=
it'
   loongarch64-linux-ld: kernel/softirq.o: in function `trace_event_raw_eve=
nt_irq_handler_exit':
   softirq.c:(.text+0x738): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: softirq.c:(.text+0x74c): undefined reference to `t=
race_event_buffer_commit'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L109':
   softirq.c:(.text+0x7a8): undefined reference to `__trace_trigger_soft_di=
sabled'
   loongarch64-linux-ld: kernel/softirq.o: in function `trace_event_raw_eve=
nt_softirq':
   softirq.c:(.text+0x818): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: softirq.c:(.text+0x828): undefined reference to `t=
race_event_buffer_commit'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L120':
   softirq.c:(.text+0x868): undefined reference to `__trace_trigger_soft_di=
sabled'
   loongarch64-linux-ld: kernel/softirq.o: in function `trace_event_raw_eve=
nt_tasklet':
   softirq.c:(.text+0x8e0): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: softirq.c:(.text+0x8f4): undefined reference to `t=
race_event_buffer_commit'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L131':
   softirq.c:(.text+0x948): undefined reference to `__trace_trigger_soft_di=
sabled'
   loongarch64-linux-ld: softirq.c:(.text+0x97c): undefined reference to `t=
race_raw_output_prep'
   loongarch64-linux-ld: kernel/softirq.o: in function `trace_raw_output_ir=
q_handler_entry':
   softirq.c:(.text+0x9d8): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: softirq.c:(.text+0x9f8): undefined reference to `t=
race_handle_return'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L147':
   softirq.c:(.text+0xa24): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/softirq.o: in function `trace_raw_output_ir=
q_handler_exit':
   softirq.c:(.text+0xa50): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: softirq.c:(.text+0xa70): undefined reference to `t=
race_handle_return'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L153':
   softirq.c:(.text+0xaf4): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/softirq.o: in function `trace_raw_output_ta=
sklet':
   softirq.c:(.text+0xb54): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: softirq.c:(.text+0xb74): undefined reference to `t=
race_handle_return'
   loongarch64-linux-ld: softirq.c:(.text+0xb9c): undefined reference to `t=
race_raw_output_prep'
   loongarch64-linux-ld: kernel/softirq.o: in function `trace_raw_output_so=
ftirq':
   softirq.c:(.text+0xbf4): undefined reference to `trace_print_symbols_seq'
   loongarch64-linux-ld: softirq.c:(.text+0xc0c): undefined reference to `t=
race_event_printf'
   loongarch64-linux-ld: softirq.c:(.text+0xc2c): undefined reference to `t=
race_handle_return'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L206':
   softirq.c:(.text+0xff4): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L205':
   softirq.c:(.text+0x1044): undefined reference to `perf_trace_run_bpf_sub=
mit'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L230':
   softirq.c:(.text+0x11d4): undefined reference to `trace_event_buffer_res=
erve'
   loongarch64-linux-ld: kernel/softirq.o: in function `.L227':
   softirq.c:(.text+0x1204): undefined reference to `trace_event_buffer_com=
mit'
   loongarch64-linux-ld: kernel/softirq.o: in function `trace_event_raw_eve=
nt_irq_handler_entry':
   softirq.c:(.text+0x1288): undefined reference to `__trace_trigger_soft_d=
isabled'
   loongarch64-linux-ld: kernel/softirq.o:(.ref.data+0x18): undefined refer=
ence to `trace_event_reg'
   loongarch64-linux-ld: kernel/softirq.o:(.ref.data+0x40): undefined refer=
ence to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/softirq.o:(.ref.data+0x60): undefined refer=
ence to `trace_event_reg'
   loongarch64-linux-ld: kernel/softirq.o:(.ref.data+0x88): undefined refer=
ence to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/softirq.o:(.ref.data+0xa8): undefined refer=
ence to `trace_event_reg'
   loongarch64-linux-ld: kernel/softirq.o:(.ref.data+0xd0): undefined refer=
ence to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/softirq.o:(.ref.data+0xf0): undefined refer=
ence to `trace_event_reg'
   loongarch64-linux-ld: kernel/softirq.o:(.ref.data+0x118): undefined refe=
rence to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/signal.o: in function `perf_trace_signal_ge=
nerate':
   signal.c:(.text+0x260): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/signal.o: in function `.L30':
   signal.c:(.text+0x2cc): undefined reference to `perf_trace_run_bpf_submi=
t'
   loongarch64-linux-ld: kernel/signal.o: in function `.L41':
   signal.c:(.text+0x358): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/signal.o: in function `perf_trace_signal_de=
liver':
   signal.c:(.text+0x414): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/signal.o: in function `.L49':
   signal.c:(.text+0x468): undefined reference to `perf_trace_run_bpf_submi=
t'
   loongarch64-linux-ld: kernel/signal.o: in function `trace_event_raw_even=
t_signal_generate':
   signal.c:(.text+0x590): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: kernel/signal.o: in function `.L66':
   signal.c:(.text+0x5e0): undefined reference to `trace_event_buffer_commi=
t'
   loongarch64-linux-ld: kernel/signal.o: in function `.L62':
   signal.c:(.text+0x688): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: kernel/signal.o: in function `trace_event_raw_even=
t_signal_deliver':
   signal.c:(.text+0x708): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: signal.c:(.text+0x748): undefined reference to `tr=
ace_event_buffer_commit'
   loongarch64-linux-ld: kernel/signal.o: in function `.L78':
   signal.c:(.text+0x7e8): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: kernel/signal.o: in function `.L92':
   signal.c:(.text+0x81c): undefined reference to `trace_raw_output_prep'
--
   update.c:(.text+0x630): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: update.c:(.text+0x650): undefined reference to `tr=
ace_handle_return'
   loongarch64-linux-ld: kernel/rcu/update.o: in function `.L88':
   update.c:(.text+0x67c): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/rcu/update.o: in function `trace_raw_output=
_rcu_stall_warning':
   update.c:(.text+0x6d4): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: update.c:(.text+0x6f4): undefined reference to `tr=
ace_handle_return'
   loongarch64-linux-ld: kernel/rcu/update.o:(.ref.data+0x18): undefined re=
ference to `trace_event_reg'
   loongarch64-linux-ld: kernel/rcu/update.o:(.ref.data+0x40): undefined re=
ference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/rcu/update.o:(.ref.data+0x60): undefined re=
ference to `trace_event_reg'
   loongarch64-linux-ld: kernel/rcu/update.o:(.ref.data+0x88): undefined re=
ference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/dma/swiotlb.o: in function `.L51':
   swiotlb.c:(.text+0x46c): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/dma/swiotlb.o: in function `trace_raw_outpu=
t_swiotlb_bounced':
   swiotlb.c:(.text+0x4a8): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: swiotlb.c:(.text+0x4c8): undefined reference to `t=
race_handle_return'
   loongarch64-linux-ld: kernel/dma/swiotlb.o: in function `.L237':
   swiotlb.c:(.text+0x11c4): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/dma/swiotlb.o: in function `perf_trace_swio=
tlb_bounced':
   swiotlb.c:(.text+0x1234): undefined reference to `perf_trace_run_bpf_sub=
mit'
   loongarch64-linux-ld: kernel/dma/swiotlb.o: in function `.L239':
   swiotlb.c:(.text+0x1394): undefined reference to `trace_event_buffer_res=
erve'
   loongarch64-linux-ld: kernel/dma/swiotlb.o: in function `.L264':
   swiotlb.c:(.text+0x13ec): undefined reference to `trace_event_buffer_com=
mit'
   loongarch64-linux-ld: kernel/dma/swiotlb.o: in function `trace_event_raw=
_event_swiotlb_bounced':
   swiotlb.c:(.text+0x147c): undefined reference to `trace_event_buffer_res=
erve'
   loongarch64-linux-ld: kernel/dma/swiotlb.o: in function `.L293':
   swiotlb.c:(.text+0x14e8): undefined reference to `__trace_trigger_soft_d=
isabled'
   loongarch64-linux-ld: kernel/dma/swiotlb.o:(.ref.data+0x18): undefined r=
eference to `trace_event_reg'
   loongarch64-linux-ld: kernel/dma/swiotlb.o:(.ref.data+0x40): undefined r=
eference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/entry/common.o: in function `.L22':
   common.c:(.text+0x154): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: common.c:(.text+0x184): undefined reference to `pe=
rf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/entry/common.o: in function `perf_trace_sys=
_enter':
   common.c:(.text+0x250): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/entry/common.o: in function `.L46':
   common.c:(.text+0x298): undefined reference to `perf_trace_run_bpf_submi=
t'
   loongarch64-linux-ld: kernel/entry/common.o: in function `.L33':
   common.c:(.text+0x318): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/entry/common.o: in function `trace_event_ra=
w_event_sys_enter':
   common.c:(.text+0x3d8): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: kernel/entry/common.o: in function `.L51':
   common.c:(.text+0x404): undefined reference to `trace_event_buffer_commi=
t'
   loongarch64-linux-ld: kernel/entry/common.o: in function `.L47':
   common.c:(.text+0x448): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: kernel/entry/common.o: in function `trace_event_ra=
w_event_sys_exit':
   common.c:(.text+0x4c0): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: common.c:(.text+0x4dc): undefined reference to `tr=
ace_event_buffer_commit'
   loongarch64-linux-ld: kernel/entry/common.o: in function `.L58':
   common.c:(.text+0x528): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: common.c:(.text+0x55c): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/entry/common.o: in function `trace_raw_outp=
ut_sys_enter':
   common.c:(.text+0x5cc): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: common.c:(.text+0x5ec): undefined reference to `tr=
ace_handle_return'
   loongarch64-linux-ld: kernel/entry/common.o: in function `.L74':
   common.c:(.text+0x614): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/entry/common.o: in function `trace_raw_outp=
ut_sys_exit':
   common.c:(.text+0x674): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: common.c:(.text+0x694): undefined reference to `tr=
ace_handle_return'
   loongarch64-linux-ld: kernel/entry/common.o:(.ref.data+0x18): undefined =
reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/entry/common.o:(.ref.data+0x40): undefined =
reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/entry/common.o:(.ref.data+0x60): undefined =
reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/entry/common.o:(.ref.data+0x88): undefined =
reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L114':
   timer.c:(.text+0x814): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/time/timer.o: in function `perf_trace_timer=
_class':
   timer.c:(.text+0x83c): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `perf_trace_timer=
_start':
   timer.c:(.text+0x914): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: timer.c:(.text+0x958): undefined reference to `per=
f_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L143':
   timer.c:(.text+0xa2c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/time/timer.o: in function `perf_trace_timer=
_expire_entry':
   timer.c:(.text+0xa6c): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L144':
   timer.c:(.text+0xb34): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/time/timer.o: in function `perf_trace_hrtim=
er_init':
   timer.c:(.text+0xb64): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L156':
   timer.c:(.text+0xc2c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/time/timer.o: in function `perf_trace_hrtim=
er_start':
   timer.c:(.text+0xc70): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L168':
   timer.c:(.text+0xd2c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L179':
   timer.c:(.text+0xd64): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L180':
   timer.c:(.text+0xe24): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: timer.c:(.text+0xe4c): undefined reference to `per=
f_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L192':
   timer.c:(.text+0xf14): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L203':
   timer.c:(.text+0xf60): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L204':
   timer.c:(.text+0x1034): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: timer.c:(.text+0x1070): undefined reference to `pe=
rf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L219':
   timer.c:(.text+0x1130): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L216':
   timer.c:(.text+0x1140): undefined reference to `trace_event_buffer_commi=
t'
>> loongarch64-linux-ld: timer.c:(.text+0x1188): undefined reference to `__=
trace_trigger_soft_disabled'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_event_raw_=
event_timer_class':
   timer.c:(.text+0x1208): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L231':
   timer.c:(.text+0x1238): undefined reference to `trace_event_buffer_commi=
t'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L232':
   timer.c:(.text+0x1288): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L246':
   timer.c:(.text+0x1300): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: timer.c:(.text+0x132c): undefined reference to `tr=
ace_event_buffer_commit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L242':
   timer.c:(.text+0x1368): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_event_raw_=
event_timer_expire_entry':
   timer.c:(.text+0x13e8): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L257':
   timer.c:(.text+0x1400): undefined reference to `trace_event_buffer_commi=
t'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L253':
   timer.c:(.text+0x1448): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_event_raw_=
event_hrtimer_init':
   timer.c:(.text+0x14b8): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: timer.c:(.text+0x14e8): undefined reference to `tr=
ace_event_buffer_commit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L264':
   timer.c:(.text+0x152c): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_event_raw_=
event_hrtimer_start':
   timer.c:(.text+0x15a8): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: timer.c:(.text+0x15cc): undefined reference to `tr=
ace_event_buffer_commit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L279':
   timer.c:(.text+0x1608): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L276':
   timer.c:(.text+0x1678): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: timer.c:(.text+0x1688): undefined reference to `tr=
ace_event_buffer_commit'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_event_raw_=
event_hrtimer_expire_entry':
   timer.c:(.text+0x16c8): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L286':
   timer.c:(.text+0x1748): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L287':
   timer.c:(.text+0x1780): undefined reference to `trace_event_buffer_commi=
t'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_event_raw_=
event_hrtimer_class':
   timer.c:(.text+0x17c8): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L298':
   timer.c:(.text+0x1848): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_event_raw_=
event_itimer_state':
   timer.c:(.text+0x186c): undefined reference to `trace_event_buffer_commi=
t'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L312':
   timer.c:(.text+0x18c8): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: timer.c:(.text+0x18fc): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L308':
   timer.c:(.text+0x1950): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_event_raw_=
event_itimer_expire':
   timer.c:(.text+0x1970): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: timer.c:(.text+0x199c): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L324':
   timer.c:(.text+0x19fc): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L319':
   timer.c:(.text+0x1a1c): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: timer.c:(.text+0x1a44): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_raw_output=
_timer_class':
   timer.c:(.text+0x1a98): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: timer.c:(.text+0x1ab8): undefined reference to `tr=
ace_handle_return'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L338':
   timer.c:(.text+0x1ae4): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_raw_output=
_timer_expire_entry':
   timer.c:(.text+0x1b30): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: timer.c:(.text+0x1b50): undefined reference to `tr=
ace_handle_return'
   loongarch64-linux-ld: timer.c:(.text+0x1b7c): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_raw_output=
_hrtimer_expire_entry':
   timer.c:(.text+0x1bf0): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: timer.c:(.text+0x1c10): undefined reference to `tr=
ace_handle_return'
   loongarch64-linux-ld: timer.c:(.text+0x1c3c): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_raw_output=
_hrtimer_class':
   timer.c:(.text+0x1c98): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: timer.c:(.text+0x1cb8): undefined reference to `tr=
ace_handle_return'
   loongarch64-linux-ld: timer.c:(.text+0x1ce4): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_raw_output=
_itimer_state':
   timer.c:(.text+0x1d84): undefined reference to `trace_print_flags_seq'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L362':
   timer.c:(.text+0x1db0): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: timer.c:(.text+0x1de0): undefined reference to `tr=
ace_handle_return'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_raw_output=
_itimer_expire':
   timer.c:(.text+0x1e0c): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: timer.c:(.text+0x1e68): undefined reference to `tr=
ace_print_symbols_seq'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L368':
   timer.c:(.text+0x1e80): undefined reference to `trace_print_symbols_seq'
   loongarch64-linux-ld: timer.c:(.text+0x1e9c): undefined reference to `tr=
ace_event_printf'
   loongarch64-linux-ld: kernel/time/timer.o: in function `trace_raw_output=
_timer_start':
   timer.c:(.text+0x1ec8): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: timer.c:(.text+0x1ef4): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/time/timer.o: in function `.L374':
   timer.c:(.text+0x1f70): undefined reference to `trace_print_symbols_seq'
   loongarch64-linux-ld: timer.c:(.text+0x1f94): undefined reference to `tr=
ace_event_printf'
   loongarch64-linux-ld: timer.c:(.text+0x1fc0): undefined reference to `tr=
ace_handle_return'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x18): undefined re=
ference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x40): undefined re=
ference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x60): undefined re=
ference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x88): undefined re=
ference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0xa8): undefined re=
ference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0xd0): undefined re=
ference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0xf0): undefined re=
ference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x118): undefined r=
eference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x138): undefined r=
eference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x160): undefined r=
eference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x180): undefined r=
eference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x1a8): undefined r=
eference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x1c8): undefined r=
eference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x1f0): undefined r=
eference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x210): undefined r=
eference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x238): undefined r=
eference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x258): undefined r=
eference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/timer.o:(.ref.data+0x280): undefined r=
eference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `perf_trace_=
alarmtimer_suspend':
   alarmtimer.c:(.text+0x2d4): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `.L46':
   alarmtimer.c:(.text+0x300): undefined reference to `perf_trace_run_bpf_s=
ubmit'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `perf_trace_=
alarm_class':
   alarmtimer.c:(.text+0x3cc): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `.L58':
   alarmtimer.c:(.text+0x408): undefined reference to `perf_trace_run_bpf_s=
ubmit'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `trace_event=
_raw_event_alarmtimer_suspend':
   alarmtimer.c:(.text+0x4d8): undefined reference to `trace_event_buffer_r=
eserve'
   loongarch64-linux-ld: alarmtimer.c:(.text+0x4ec): undefined reference to=
 `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `.L73':
   alarmtimer.c:(.text+0x528): undefined reference to `__trace_trigger_soft=
_disabled'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `.L70':
   alarmtimer.c:(.text+0x598): undefined reference to `trace_event_buffer_r=
eserve'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `trace_event=
_raw_event_alarm_class':
   alarmtimer.c:(.text+0x5c0): undefined reference to `trace_event_buffer_c=
ommit'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `.L84':
   alarmtimer.c:(.text+0x60c): undefined reference to `__trace_trigger_soft=
_disabled'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `.L80':
   alarmtimer.c:(.text+0x644): undefined reference to `trace_raw_output_pre=
p'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `trace_raw_o=
utput_alarmtimer_suspend':
   alarmtimer.c:(.text+0x6a0): undefined reference to `trace_print_flags_se=
q'
   loongarch64-linux-ld: alarmtimer.c:(.text+0x6b8): undefined reference to=
 `trace_event_printf'
   loongarch64-linux-ld: alarmtimer.c:(.text+0x6d8): undefined reference to=
 `trace_handle_return'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `.L96':
   alarmtimer.c:(.text+0x704): undefined reference to `trace_raw_output_pre=
p'
   loongarch64-linux-ld: kernel/time/alarmtimer.o: in function `trace_raw_o=
utput_alarm_class':
   alarmtimer.c:(.text+0x76c): undefined reference to `trace_print_flags_se=
q'
   loongarch64-linux-ld: alarmtimer.c:(.text+0x78c): undefined reference to=
 `trace_event_printf'
   loongarch64-linux-ld: alarmtimer.c:(.text+0x7b0): undefined reference to=
 `trace_handle_return'
   loongarch64-linux-ld: kernel/time/alarmtimer.o:(.ref.data+0x18): undefin=
ed reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/alarmtimer.o:(.ref.data+0x40): undefin=
ed reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/time/alarmtimer.o:(.ref.data+0x60): undefin=
ed reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/time/alarmtimer.o:(.ref.data+0x88): undefin=
ed reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/smp.o: in function `perf_trace_csd_queue_cp=
u':
   smp.c:(.text+0x214): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/smp.o: in function `.L30':
   smp.c:(.text+0x248): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/smp.o: in function `perf_trace_csd_function=
':
   smp.c:(.text+0x30c): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/smp.o: in function `.L42':
   smp.c:(.text+0x338): undefined reference to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/smp.o: in function `trace_event_raw_event_c=
sd_queue_cpu':
   smp.c:(.text+0x428): undefined reference to `trace_event_buffer_reserve'
   loongarch64-linux-ld: kernel/smp.o: in function `.L57':
   smp.c:(.text+0x444): undefined reference to `trace_event_buffer_commit'
   loongarch64-linux-ld: kernel/smp.o: in function `.L53':
   smp.c:(.text+0x4a8): undefined reference to `__trace_trigger_soft_disabl=
ed'
   loongarch64-linux-ld: kernel/smp.o: in function `trace_event_raw_event_c=
sd_function':
   smp.c:(.text+0x520): undefined reference to `trace_event_buffer_reserve'
>> loongarch64-linux-ld: smp.c:(.text+0x534): undefined reference to `trace=
_event_buffer_commit'
   loongarch64-linux-ld: kernel/smp.o: in function `.L64':
   smp.c:(.text+0x588): undefined reference to `__trace_trigger_soft_disabl=
ed'
   loongarch64-linux-ld: kernel/smp.o: in function `.L65':
   smp.c:(.text+0x5bc): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/smp.o: in function `trace_raw_output_csd_qu=
eue_cpu':
   smp.c:(.text+0x61c): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: smp.c:(.text+0x63c): undefined reference to `trace=
_handle_return'
   loongarch64-linux-ld: kernel/smp.o: in function `.L80':
   smp.c:(.text+0x664): undefined reference to `trace_raw_output_prep'
   loongarch64-linux-ld: kernel/smp.o: in function `trace_raw_output_csd_fu=
nction':
   smp.c:(.text+0x6b4): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: smp.c:(.text+0x6d4): undefined reference to `trace=
_handle_return'
   loongarch64-linux-ld: kernel/smp.o:(.ref.data+0x18): undefined reference=
 to `trace_event_reg'
   loongarch64-linux-ld: kernel/smp.o:(.ref.data+0x40): undefined reference=
 to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/smp.o:(.ref.data+0x60): undefined reference=
 to `trace_event_reg'
   loongarch64-linux-ld: kernel/smp.o:(.ref.data+0x88): undefined reference=
 to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L255':
   kexec_core.c:(.text+0x1b10): undefined reference to `machine_kexec_clean=
up'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L296':
   kexec_core.c:(.text+0x1d70): undefined reference to `machine_crash_shutd=
own'
   loongarch64-linux-ld: kexec_core.c:(.text+0x1d78): undefined reference t=
o `machine_kexec'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L383':
   kexec_core.c:(.text+0x2350): undefined reference to `machine_shutdown'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L380':
   kexec_core.c:(.text+0x2360): undefined reference to `machine_kexec'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L128':
   cgroup.c:(.text+0x858): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L129':
   cgroup.c:(.text+0x8b0): undefined reference to `perf_trace_run_bpf_submi=
t'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `perf_trace_cg=
roup_event':
   cgroup.c:(.text+0xa58): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L147':
   cgroup.c:(.text+0xab8): undefined reference to `perf_trace_run_bpf_submi=
t'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L168':
   cgroup.c:(.text+0xd70): undefined reference to `trace_event_buffer_reser=
ve'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L2=021':
   cgroup.c:(.text+0xdb4): undefined reference to `trace_event_buffer_commi=
t'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L192':
   cgroup.c:(.text+0xe68): undefined reference to `__trace_trigger_soft_dis=
abled'
   loongarch64-linux-ld: cgroup.c:(.text+0xe9c): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L189':
   cgroup.c:(.text+0xefc): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L200':
   cgroup.c:(.text+0xf1c): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: cgroup.c:(.text+0xf44): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L190':
   cgroup.c:(.text+0xfa0): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `trace_raw_out=
put_cgroup_root':
   cgroup.c:(.text+0xfc0): undefined reference to `trace_handle_return'
   loongarch64-linux-ld: cgroup.c:(.text+0xfec): undefined reference to `tr=
ace_raw_output_prep'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `trace_raw_out=
put_cgroup':
   cgroup.c:(.text+0x106c): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: cgroup.c:(.text+0x108c): undefined reference to `t=
race_handle_return'
   loongarch64-linux-ld: cgroup.c:(.text+0x10b4): undefined reference to `t=
race_raw_output_prep'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `trace_raw_out=
put_cgroup_migrate':
   cgroup.c:(.text+0x1124): undefined reference to `trace_event_printf'
   loongarch64-linux-ld: cgroup.c:(.text+0x1144): undefined reference to `t=
race_handle_return'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L725':
   cgroup.c:(.text+0x3e50): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L1=025':
   cgroup.c:(.text+0x3ed4): undefined reference to `perf_trace_run_bpf_subm=
it'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L756':
   cgroup.c:(.text+0x4020): undefined reference to `perf_trace_buf_alloc'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L761':
   cgroup.c:(.text+0x407c): undefined reference to `perf_trace_run_bpf_subm=
it'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L779':
   cgroup.c:(.text+0x41d4): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L769':
   cgroup.c:(.text+0x4218): undefined reference to `trace_event_buffer_comm=
it'
   loongarch64-linux-ld: cgroup.c:(.text+0x4274): undefined reference to `t=
race_event_buffer_reserve'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L772':
   cgroup.c:(.text+0x42c8): undefined reference to `__trace_trigger_soft_di=
sabled'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `perf_trace_cg=
roup_migrate':
   cgroup.c:(.text+0x4364): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: cgroup.c:(.text+0x4394): undefined reference to `t=
race_event_buffer_commit'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L783':
   cgroup.c:(.text+0x43ec): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L784':
   cgroup.c:(.text+0x4448): undefined reference to `__trace_trigger_soft_di=
sabled'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L799':
   cgroup.c:(.text+0x4520): undefined reference to `trace_event_buffer_rese=
rve'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `perf_trace_cg=
roup':
   cgroup.c:(.text+0x4588): undefined reference to `trace_event_buffer_comm=
it'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o: in function `.L802':
   cgroup.c:(.text+0x4668): undefined reference to `__trace_trigger_soft_di=
sabled'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0x18): undefined=
 reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0x40): undefined=
 reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0x60): undefined=
 reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0x88): undefined=
 reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0xa8): undefined=
 reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0xd0): undefined=
 reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0xf0): undefined=
 reference to `trace_event_reg'
   loongarch64-linux-ld: kernel/cgroup/cgroup.o:(.ref.data+0x118): undefine=
d reference to `trace_event_raw_init'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o: in function `.=
L12':
   error_report-traces.c:(.text+0xdc): undefined reference to `perf_trace_b=
uf_alloc'
   loongarch64-linux-ld: error_report-traces.c:(.text+0x108): undefined ref=
erence to `perf_trace_run_bpf_submit'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o: in function `t=
race_event_raw_event_error_report_template':
   error_report-traces.c:(.text+0x1d8): undefined reference to `trace_event=
_buffer_reserve'
   loongarch64-linux-ld: kernel/trace/error_report-traces.o: in function `.=
L27':
   error_report-traces.c:(.text+0x1ec): undefined reference to `trace_event=
_buffer_commit'
=2E.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=3Dy] && ASYMMETRIC_KEY_TYPE [=3Dn]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=3Dy] && CRYPTO [=3Dy]

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
