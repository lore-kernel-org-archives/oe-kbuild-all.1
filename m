Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2831624E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jun 2025 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750494272; cv=none; b=WmJHXfARcSNRQ3FodNUhQCf4wj1C9jyDk8OWOEu188K1xz63nFCXEgrenAWEELjGP1ZWjrUsbQCraDIY2JCLK9iMZ77wCIVH2cJkkWAkQF2roQXltofDW2V3ZgwRcvEdCKSr3ynGE7Vr/M1uMvFHbxb8xv/LjlbmU5HUU/iFKLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750494272; c=relaxed/simple;
	bh=PytXXDTaHFoVMNuHed+IY82W29E4fnBJ0ZyfkYbgYgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fgizBkHCVCNlmf7zsPpfxgqyHUtl90teHA/u8euztPlfkRHVYcGf5NsCaZ/1CeffCrMgWMhLgUWzM8jIr41aHUETeaWrFQ4ZTMOmFf+nvs4EApOvvz1n4kt9SOEkeW/3gVe16oiGrYOQOJyZVlj6cqqIJWkoVNm8xQhUHmoaf1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drHm7si7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drHm7si7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750494269; x=1782030269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PytXXDTaHFoVMNuHed+IY82W29E4fnBJ0ZyfkYbgYgo=;
  b=drHm7si7i5Wn9+TNZErI+XBv/HHOl5OiK3oqo7GdpsGTVc6zVDhGzIa9
   4fGyFyUHw0HDmZ1qekUWoJuanbWInEuS1giBg4SMjtI7mNUZFgcz0hQ1C
   2DQ0EJNhNXQNeC75nHh51lPLNN8PWttQYR1m0UgfzKjxF9nMZ0V4Q9l4d
   skriIXlvEDA5CUDMKNAECvTdVlr1EA/Pc1juNUHP9nPdfVZWpuGT03gGI
   Gfeopma3BL4SCM4zYEYI21CJZGvJ7/PLpedyQb6DiA7zYqA9I5SnjlLkV
   wvPUrD/7ShMnykDvXzIWvkv8ykLa1UNRcw9hIKN/77Fz4yTE1H8MSFDeX
   Q==;
X-CSE-ConnectionGUID: f8egVwWRTUmu+nfz1z4Eow==
X-CSE-MsgGUID: ByxxNegsRkCS5Aa20jyQXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63361958"
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="63361958"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 01:24:28 -0700
X-CSE-ConnectionGUID: fys25ebxQk21DujrcfXqlg==
X-CSE-MsgGUID: 4PJyLAQCSVWNgtHNwTdCXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="151327544"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Jun 2025 01:24:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uStWS-000MTi-1y;
	Sat, 21 Jun 2025 08:24:24 +0000
Date: Sat, 21 Jun 2025 16:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 14/22]
 include/linux/trace_events.h:839: multiple definition of
 `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839:
 first defined here
Message-ID: <202506211634.fQCnMaQS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   28441de17b08aa419e3a354e2940268a9078d418
commit: 89a42c8698525b65373f65deb274eb0e24c5144c [14/22] bpf: Add support to create tracing multi link
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20250621/202506211634.fQCnMaQS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506211634.fQCnMaQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506211634.fQCnMaQS-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: init/do_mounts.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: init/do_mounts.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: init/do_mounts.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: init/do_mounts.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: init/noinitramfs.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: init/noinitramfs.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: init/noinitramfs.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: init/noinitramfs.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: init/init_task.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: init/init_task.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: init/init_task.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: arch/alpha/kernel/osf_sys.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: arch/alpha/kernel/osf_sys.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: arch/alpha/kernel/osf_sys.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: arch/alpha/kernel/osf_sys.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: arch/alpha/kernel/signal.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: arch/alpha/kernel/signal.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: arch/alpha/kernel/signal.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: arch/alpha/kernel/signal.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: arch/alpha/kernel/pci.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: arch/alpha/kernel/pci.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: arch/alpha/kernel/pci.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: arch/alpha/kernel/pci.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: arch/alpha/mm/fault.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: arch/alpha/mm/fault.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: arch/alpha/mm/fault.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/fork.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/fork.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/fork.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/fork.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/exec_domain.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/exec_domain.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/exec_domain.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/exec_domain.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/panic.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/panic.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/panic.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/cpu.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/cpu.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/cpu.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/cpu.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/exit.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/exit.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/exit.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/exit.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/softirq.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/softirq.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/softirq.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/sysctl.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/sysctl.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/sysctl.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/sysctl.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/capability.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/capability.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/capability.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/capability.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/ptrace.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/ptrace.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/ptrace.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/ptrace.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/signal.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/signal.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/signal.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/signal.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/sys.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/sys.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/sys.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/sys.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/umh.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/umh.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/umh.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/umh.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/pid.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/pid.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/pid.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/pid.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/extable.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/extable.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/extable.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/nsproxy.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/nsproxy.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/nsproxy.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/nsproxy.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/notifier.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/notifier.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/notifier.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/cred.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/cred.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/cred.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/reboot.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/reboot.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/reboot.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/reboot.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/groups.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/groups.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/groups.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/groups.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/sched/core.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:576: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/sched/core.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/sched/core.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/sched/core.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:837: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/sched/fair.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/sched/fair.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/sched/fair.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/sched/fair.o: in function `bpf_tracing_multi_attach':
>> include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/sched/build_policy.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/sched/build_policy.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/sched/build_policy.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/sched/build_policy.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/sched/build_utility.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/sched/build_utility.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/sched/build_utility.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/sched/build_utility.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/locking/semaphore.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/locking/semaphore.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/locking/semaphore.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/power/qos.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/power/qos.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/power/qos.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/power/qos.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/printk/printk.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/printk/printk.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/printk/printk.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/printk/printk.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/printk/printk_safe.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/printk/printk_safe.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/printk/printk_safe.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/rcu/update.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/rcu/update.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/rcu/update.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/module/main.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/module/main.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/module/main.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/module/main.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/module/kmod.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/module/kmod.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/module/kmod.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/module/kmod.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/time/time.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/time/time.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/time/time.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/time/time.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/time/timer.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/time/timer.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/time/timer.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/time/timer.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/time/hrtimer.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/time/hrtimer.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/time/hrtimer.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/time/hrtimer.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/time/posix-timers.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here
   alpha-linux-ld: kernel/time/posix-timers.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:580: multiple definition of `unregister_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:580: first defined here
   alpha-linux-ld: kernel/time/posix-timers.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:585: multiple definition of `modify_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:585: first defined here
   alpha-linux-ld: kernel/time/posix-timers.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:839: multiple definition of `bpf_tracing_multi_attach'; init/main.o:include/linux/trace_events.h:839: first defined here
   alpha-linux-ld: kernel/time/posix-clock.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:578: multiple definition of `register_ftrace_direct_hash'; init/main.o:include/linux/ftrace.h:578: first defined here


vim +839 include/linux/trace_events.h

   797	
   798	static inline int
   799	perf_event_query_prog_array(struct perf_event *event, void __user *info)
   800	{
   801		return -EOPNOTSUPP;
   802	}
   803	struct bpf_raw_tp_link;
   804	static inline int bpf_probe_register(struct bpf_raw_event_map *btp, struct bpf_raw_tp_link *link)
   805	{
   806		return -EOPNOTSUPP;
   807	}
   808	static inline int bpf_probe_unregister(struct bpf_raw_event_map *btp, struct bpf_raw_tp_link *link)
   809	{
   810		return -EOPNOTSUPP;
   811	}
   812	static inline struct bpf_raw_event_map *bpf_get_raw_tracepoint(const char *name)
   813	{
   814		return NULL;
   815	}
   816	static inline void bpf_put_raw_tracepoint(struct bpf_raw_event_map *btp)
   817	{
   818	}
   819	static inline int bpf_get_perf_event_info(const struct perf_event *event,
   820						  u32 *prog_id, u32 *fd_type,
   821						  const char **buf, u64 *probe_offset,
   822						  u64 *probe_addr, unsigned long *missed)
   823	{
   824		return -EOPNOTSUPP;
   825	}
   826	static inline int
   827	bpf_kprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   828	{
   829		return -EOPNOTSUPP;
   830	}
   831	static inline int
   832	bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   833	{
   834		return -EOPNOTSUPP;
   835	}
   836	int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
   837	{
   838		return -EOPNOTSUPP;
 > 839	}
   840	#endif
   841	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
