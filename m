Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BDA2B9A9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 20:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709929926; cv=none; b=JLfcJx87j7kp1PdTQ7//4ksNNP2YkoBX4zMCLeEOoyVEydn+1cpww7CFrDqMwP7JQDJ0v58IbdM7TSgiWAhDMidU8hQKNezjheppTIpJ9QG5jHtURlL/HxcFjxaY7CRwf1KYTFmpUxTp1vwjdDmaNEw6qEmNIK55pw+05G0g3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709929926; c=relaxed/simple;
	bh=hZEqSZ66CTPHVLbrjpmWJP58OL3M0wac9Y4By8h8Asc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgSw0WhRuvq4HtS6DZM0/PRs89Cwqad+wJkA++sbdw2FGBg+wI675fSFU0YDLthIHTzM0aDQnUCVd6GITUMrqg4OFBE1JN7IUKZDSDTG2f+JtdhNVNavpZsyiKs8PPp4zq4HfZVM1TdH/wUcVpeqSllX0L/zKEUKqNzNdNTzGNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fv4Mau0R; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fv4Mau0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709929924; x=1741465924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hZEqSZ66CTPHVLbrjpmWJP58OL3M0wac9Y4By8h8Asc=;
  b=fv4Mau0RPNFkh0pQoOdgjYcqudSP5Fmj/8UDnmkRSwn/KVnAsGkdH3mr
   frx3kppy8I33TYUtde3K5hmNeM4F7IVjM+WGSmdndslx3BQ1ellFh4hUR
   cT8kK+dbgI3WcpFsFlNb5DlXOSniMLdHkmeQLt270jybIWD0msrKEJkWK
   mQS6XO+vXgWA80p+F5dns9U5V/SHL//QxY7wrSLjIVMu8REdzHazrvAb/
   dhaFpWKI+nDjn0g+509thco+sHQKox8gDR6rFjFd1H+hBATPinzwLl9oL
   6Lt4VPXc/OZETJdfMmN0681OPBhqMKYfCeGd/LEWyOWDouoPXAUnLhyIn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4836769"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4836769"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 12:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="41504849"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Mar 2024 12:32:02 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rigso-0006gN-39;
	Fri, 08 Mar 2024 20:31:58 +0000
Date: Sat, 9 Mar 2024 04:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 1/5] bpf: Add link support for sk_msg prog
Message-ID: <202403090440.SJcB4STL-lkp@intel.com>
References: <20240305202201.3891042-1-yonghong.song@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305202201.3891042-1-yonghong.song@linux.dev>

Hi Yonghong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/bpf-Add-link-support-for-sk_msg-prog/20240306-042552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240305202201.3891042-1-yonghong.song%40linux.dev
patch subject: [RFC PATCH bpf-next 1/5] bpf: Add link support for sk_msg prog
config: i386-buildonly-randconfig-004-20240308 (https://download.01.org/0day-ci/archive/20240309/202403090440.SJcB4STL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090440.SJcB4STL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090440.SJcB4STL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/trace_events.h:21,
                    from include/trace/define_trace.h:102,
                    from include/trace/events/siox.h:66,
                    from drivers/siox/siox-core.c:37:
>> include/linux/bpf.h:3087:5: warning: no previous prototype for 'sock_map_prog_update' [-Wmissing-prototypes]
    3087 | int sock_map_prog_update(struct bpf_map *map, struct bpf_prog *prog,
         |     ^~~~~~~~~~~~~~~~~~~~
>> include/linux/bpf.h:3092:5: warning: no previous prototype for 'bpf_skmsg_link_create' [-Wmissing-prototypes]
    3092 | int bpf_skmsg_link_create(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from include/linux/entry-common.h:7,
                    from kernel/entry/common.c:4:
>> include/linux/bpf.h:3087:5: warning: no previous prototype for 'sock_map_prog_update' [-Wmissing-prototypes]
    3087 | int sock_map_prog_update(struct bpf_map *map, struct bpf_prog *prog,
         |     ^~~~~~~~~~~~~~~~~~~~
>> include/linux/bpf.h:3092:5: warning: no previous prototype for 'bpf_skmsg_link_create' [-Wmissing-prototypes]
    3092 | int bpf_skmsg_link_create(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:292,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from include/linux/sched.h:13,
                    from include/linux/context_tracking.h:5,
                    from kernel/entry/common.c:3:
   In function 'fortify_memcpy_chk',
       inlined from 'syscall_get_arguments' at arch/x86/include/asm/syscall.h:87:2,
       inlined from 'perf_trace_sys_enter' at include/trace/events/syscalls.h:18:1:
   include/linux/fortify-string.h:537:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     537 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'fortify_memcpy_chk',
       inlined from 'syscall_get_arguments' at arch/x86/include/asm/syscall.h:87:2,
       inlined from 'trace_event_raw_event_sys_enter' at include/trace/events/syscalls.h:18:1:
   include/linux/fortify-string.h:537:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     537 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from kernel/time/hrtimer.c:30:
>> include/linux/bpf.h:3087:5: warning: no previous prototype for 'sock_map_prog_update' [-Wmissing-prototypes]
    3087 | int sock_map_prog_update(struct bpf_map *map, struct bpf_prog *prog,
         |     ^~~~~~~~~~~~~~~~~~~~
>> include/linux/bpf.h:3092:5: warning: no previous prototype for 'bpf_skmsg_link_create' [-Wmissing-prototypes]
    3092 | int bpf_skmsg_link_create(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
     120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
--
   ld: init/do_mounts.o: in function `sock_map_prog_update':
>> do_mounts.c:(.text+0xc): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: init/do_mounts.o: in function `bpf_skmsg_link_create':
>> do_mounts.c:(.text+0x14): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: init/do_mounts_initrd.o: in function `sock_map_prog_update':
   do_mounts_initrd.c:(.text+0x0): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: init/do_mounts_initrd.o: in function `bpf_skmsg_link_create':
   do_mounts_initrd.c:(.text+0x8): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: init/initramfs.o: in function `sock_map_prog_update':
   initramfs.c:(.text+0xf8): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: init/initramfs.o: in function `bpf_skmsg_link_create':
   initramfs.c:(.text+0x100): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/entry/syscall_32.o: in function `sock_map_prog_update':
   syscall_32.c:(.text+0x0): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/entry/syscall_32.o: in function `bpf_skmsg_link_create':
   syscall_32.c:(.text+0x8): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/entry/common.o: in function `sock_map_prog_update':
   common.c:(.text+0x0): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/entry/common.o: in function `bpf_skmsg_link_create':
   common.c:(.text+0x8): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/entry/vdso/extable.o: in function `sock_map_prog_update':
   extable.c:(.text+0x0): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/entry/vdso/extable.o: in function `bpf_skmsg_link_create':
   extable.c:(.text+0x8): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/events/core.o: in function `sock_map_prog_update':
   core.c:(.text+0x2530): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/events/core.o: in function `bpf_skmsg_link_create':
   core.c:(.text+0x2538): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/events/utils.o: in function `sock_map_prog_update':
   utils.c:(.text+0x3c8): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/events/utils.o: in function `bpf_skmsg_link_create':
   utils.c:(.text+0x3d0): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/events/amd/core.o: in function `sock_map_prog_update':
   core.c:(.text+0x1960): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/events/amd/core.o: in function `bpf_skmsg_link_create':
   core.c:(.text+0x1968): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/events/amd/lbr.o: in function `sock_map_prog_update':
   lbr.c:(.text+0x444): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/events/amd/lbr.o: in function `bpf_skmsg_link_create':
   lbr.c:(.text+0x44c): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/events/amd/brs.o: in function `sock_map_prog_update':
   brs.c:(.text+0x0): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/events/amd/brs.o: in function `bpf_skmsg_link_create':
   brs.c:(.text+0x8): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/events/amd/power.o: in function `sock_map_prog_update':
   power.c:(.text+0x4f4): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/events/amd/power.o: in function `bpf_skmsg_link_create':
   power.c:(.text+0x4fc): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/events/zhaoxin/core.o: in function `sock_map_prog_update':
   core.c:(.text+0x974): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/events/zhaoxin/core.o: in function `bpf_skmsg_link_create':
   core.c:(.text+0x97c): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/process_32.o: in function `sock_map_prog_update':
   process_32.c:(.text+0x3c): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/process_32.o: in function `bpf_skmsg_link_create':
   process_32.c:(.text+0x44): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/signal.o: in function `sock_map_prog_update':
   signal.c:(.text+0x14c): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/signal.o: in function `bpf_skmsg_link_create':
   signal.c:(.text+0x154): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/signal_32.o: in function `sock_map_prog_update':
   signal_32.c:(.text+0x104): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/signal_32.o: in function `bpf_skmsg_link_create':
   signal_32.c:(.text+0x10c): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/traps.o: in function `sock_map_prog_update':
   traps.c:(.text+0x480): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/traps.o: in function `bpf_skmsg_link_create':
   traps.c:(.text+0x488): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/idt.o: in function `sock_map_prog_update':
   idt.c:(.text+0x44): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/idt.o: in function `bpf_skmsg_link_create':
   idt.c:(.text+0x4c): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/irq.o: in function `sock_map_prog_update':
   irq.c:(.text+0x10c): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/irq.o: in function `bpf_skmsg_link_create':
   irq.c:(.text+0x114): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/ioport.o: in function `sock_map_prog_update':
   ioport.c:(.text+0x0): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/ioport.o: in function `bpf_skmsg_link_create':
   ioport.c:(.text+0x8): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/nmi.o: in function `sock_map_prog_update':
   nmi.c:(.text+0x6d0): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/nmi.o: in function `bpf_skmsg_link_create':
   nmi.c:(.text+0x6d8): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/ldt.o: in function `sock_map_prog_update':
   ldt.c:(.text+0x42c): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/ldt.o: in function `bpf_skmsg_link_create':
   ldt.c:(.text+0x434): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/setup.o: in function `sock_map_prog_update':
   setup.c:(.text+0x34): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/setup.o: in function `bpf_skmsg_link_create':
   setup.c:(.text+0x3c): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/irqinit.o: in function `sock_map_prog_update':
   irqinit.c:(.text+0x0): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/irqinit.o: in function `bpf_skmsg_link_create':
   irqinit.c:(.text+0x8): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/irq_work.o: in function `sock_map_prog_update':
   irq_work.c:(.text+0x0): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/irq_work.o: in function `bpf_skmsg_link_create':
   irq_work.c:(.text+0x8): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
   ld: arch/x86/kernel/sys_ia32.o: in function `sock_map_prog_update':
   sys_ia32.c:(.text+0x0): multiple definition of `sock_map_prog_update'; init/main.o:main.c:(.text+0x798): first defined here
   ld: arch/x86/kernel/sys_ia32.o: in function `bpf_skmsg_link_create':
   sys_ia32.c:(.text+0x8): multiple definition of `bpf_skmsg_link_create'; init/main.o:main.c:(.text+0x7a0): first defined here
--
   In file included from include/linux/security.h:35,
                    from include/net/scm.h:9,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:45,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:101,
                    from include/net/addrconf.h:61,
                    from lib/vsprintf.c:41:
>> include/linux/bpf.h:3087:5: warning: no previous prototype for 'sock_map_prog_update' [-Wmissing-prototypes]
    3087 | int sock_map_prog_update(struct bpf_map *map, struct bpf_prog *prog,
         |     ^~~~~~~~~~~~~~~~~~~~
>> include/linux/bpf.h:3092:5: warning: no previous prototype for 'bpf_skmsg_link_create' [-Wmissing-prototypes]
    3092 | int bpf_skmsg_link_create(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from include/linux/security.h:35,
                    from kernel/ptrace.c:22:
>> include/linux/bpf.h:3087:5: warning: no previous prototype for 'sock_map_prog_update' [-Wmissing-prototypes]
    3087 | int sock_map_prog_update(struct bpf_map *map, struct bpf_prog *prog,
         |     ^~~~~~~~~~~~~~~~~~~~
>> include/linux/bpf.h:3092:5: warning: no previous prototype for 'bpf_skmsg_link_create' [-Wmissing-prototypes]
    3092 | int bpf_skmsg_link_create(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:292,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from include/linux/sched.h:13,
                    from kernel/ptrace.c:13:
   In function 'fortify_memcpy_chk',
       inlined from 'syscall_get_arguments.constprop' at arch/x86/include/asm/syscall.h:87:2:
   include/linux/fortify-string.h:537:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     537 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from include/linux/entry-common.h:7,
                    from arch/x86/include/asm/idtentry.h:11,
                    from arch/x86/include/asm/traps.h:9,
                    from arch/x86/kernel/irq.c:23:
>> include/linux/bpf.h:3087:5: warning: no previous prototype for 'sock_map_prog_update' [-Wmissing-prototypes]
    3087 | int sock_map_prog_update(struct bpf_map *map, struct bpf_prog *prog,
         |     ^~~~~~~~~~~~~~~~~~~~
>> include/linux/bpf.h:3092:5: warning: no previous prototype for 'bpf_skmsg_link_create' [-Wmissing-prototypes]
    3092 | int bpf_skmsg_link_create(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from arch/x86/include/asm/trace/irq_vectors.h:383,
                    from arch/x86/kernel/irq.c:27:
   include/trace/stages/init.h:2:23: warning: 'str__irq_vectors__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/bpf_verifier.h:7,
                    from kernel/bpf/btf.c:19:
>> include/linux/bpf.h:3087:5: warning: no previous prototype for 'sock_map_prog_update' [-Wmissing-prototypes]
    3087 | int sock_map_prog_update(struct bpf_map *map, struct bpf_prog *prog,
         |     ^~~~~~~~~~~~~~~~~~~~
>> include/linux/bpf.h:3092:5: warning: no previous prototype for 'bpf_skmsg_link_create' [-Wmissing-prototypes]
    3092 | int bpf_skmsg_link_create(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c: In function 'btf_seq_show':
   kernel/bpf/btf.c:7330:29: warning: function 'btf_seq_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7330 |         seq_vprintf((struct seq_file *)show->target, fmt, args);
         |                             ^~~~~~~~
   kernel/bpf/btf.c: In function 'btf_snprintf_show':
   kernel/bpf/btf.c:7367:9: warning: function 'btf_snprintf_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7367 |         len = vsnprintf(show->target, ssnprintf->len_left, fmt, args);
         |         ^~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
