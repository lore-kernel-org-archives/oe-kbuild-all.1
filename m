Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282496;
	b=HNEVMmgwW8M1inIJwVGdcdAfLT5MdMselbhzp/Sp4B5MiyTERGKg03jic2AeEvDbrAZq
	 GWZjmZBkKpYeU9fG+E1UiKDM6OeOqGeUFgVy/skfFitVMIG/SxuqC1mfQEpZ0K74++MfJ
	 RqDw0Rg5Y6w8bOKBAUdE+UbtcscvztBSTdLkLmp7Le9AiHt0l5qq4virfM3HGZdRZ3vW4
	 +2PR0RCH7ub6F5n1dcSOXUfqddLXRI0U8gMkiWop9D2PaNIJ86l396XmBt/BGnzIJLOin
	 8/uLRr2OQqY4qL+JzfwUFK4ZOP9+vcWz2ALww6VBOK9gQHyuFgRUM2Vb0Cq8U+P/qTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282496;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Sis8LtvdzbveLLIHKFZQEhjJeTiHsX+VReizWMfZg7k=;
	b=v0vfnodoVNzUP1VNzxqwo7BPAvs480LSQOjp69H/3vyLm9s3vLi6L5IA9pR8I/fOPs1Y
	 y2ng9oM1kNljLSo3GkibdKi2DQrFg603kwSGWtOoxWN5+rvsL4RRqEBkTx2FbpuzCstt9
	 pShxCWAHMDXOEOl4k8giiCpzBHejPIhkypOAFv4d52iKoSsJKqkRABPQhZDi4z4obJlPr
	 8ierHyS+f9ZUqwhXsQbchphKMWvJLckIT44TnLEpMTDfdN48pJ1O8MZRuLtCiu+LoxI/W
	 AcCEXgXu8qFVrHIu9oJtKXFvrU10qYvuao7VkZ8tNI1uqPnwgYnmfco8VpearlwBCPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RXf35JTn;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D002606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 03:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D002606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RXf35JTn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794282495; x=1825818495;
  h=date:from:to:cc:subject:message-id;
  bh=Av0KlQhHHfCzz6Gbo5DQ4LshNcXTXKmPBXUpzKzGMgE=;
  b=RXf35JTnfTiT2ZE55ztERo/5q1KmoQhY7vba9c0PpKU1Wfkq6xKJcmx8
   ADrrjUuYRtUjFqyIve8IfH1cBCKFTZGwQRD5aUdmj+zD8sCQQ/Rzl/NsG
   60uQn0A10XwGbp2HVnUctbR3zSg7xzajRg1oaV9FPnS+z97hPXefFi7fR
   jIXAEAdBFWczKXICe0dHRWZ1Q0zjuZ+CIS324/vfw8w6eBX49bolYL/tj
   z6wba5HnjuDqY1h6h9PXXfrCx8sKnfMjcwPraCBzXshxjozyqV3r/NTY/
   UHcSiVechFr5P8Wfd1QxzOgAN+lcwfJy2eedlnF/WW72SV1mH+0ZimjXt
   w==;
X-CSE-ConnectionGUID: 4X4CCe6XT6yEo5p959gQkQ==
X-CSE-MsgGUID: 9XZ3aBOTSRKSQEv56ix+XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3057715"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3057715"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:48:14 -0800
X-CSE-ConnectionGUID: uXRm/EOKRB2xa8BhjdLQMw==
X-CSE-MsgGUID: p6njsTSnTmiQqd6jnyXQ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="9822019"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 09 Nov 2026 19:48:12 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQcq9-000000000AB-3qsv;
	Tue, 10 Nov 2026 03:48:09 +0000
Date: Tue, 10 Nov 2026 04:47:49 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2026-01 0/4]
 include/trace/hooks/binder.h:41:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202611100422.SFlqGNlP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-5.15-2026-01
head:   56ea73375e8c182c68661ac2a8309d77b8d26fcc
commit: b3efd2ad717556d899d5293a70c3eef0d62b34d5 [0/4] ANDROID: remove inclusions from hook definition headers
config: i386-randconfig-2300-20261110 (https://download.01.org/0day-ci/archive/20261110/202611100422.SFlqGNlP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100422.SFlqGNlP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611100422.SFlqGNlP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/binder.h):
>> include/trace/hooks/binder.h:41:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/binder.h:41:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/binder.h:41:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/gic_v3.h):
   include/trace/hooks/gic_v3.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic_v3.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gic_v3.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cpufreq.h):
   include/trace/hooks/cpufreq.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cpufreq.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/preemptirq.h):
   include/trace/hooks/preemptirq.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cgroup.h):
   include/trace/hooks/cgroup.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:40:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:40:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:40:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:44:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:44:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:44:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:48:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:48:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:48:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/iommu.h):
   include/trace/hooks/iommu.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/net.h):
   include/trace/hooks/net.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:27:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:29:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:29:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:29:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/vmscan.h):
   include/trace/hooks/vmscan.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/vmscan.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/avc.h):
   include/trace/hooks/avc.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/creds.h):
   include/trace/hooks/creds.h:16:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:16:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:16:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/selinux.h):
   include/trace/hooks/selinux.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/selinux.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/selinux.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +41 include/trace/hooks/binder.h

b3efd2ad717556d Todd Kjos                      2022-09-02  19  
3fc5e942554eb43 JianMin Liu                    2020-07-21  20  DECLARE_HOOK(android_vh_binder_transaction_init,
3fc5e942554eb43 JianMin Liu                    2020-07-21  21  	TP_PROTO(struct binder_transaction *t),
3fc5e942554eb43 JianMin Liu                    2020-07-21  22  	TP_ARGS(t));
ad2d36f06f90e07 xieliujie                      2021-04-27  23  DECLARE_HOOK(android_vh_binder_priority_skip,
ad2d36f06f90e07 xieliujie                      2021-04-27  24  	TP_PROTO(struct task_struct *task, bool *skip),
ad2d36f06f90e07 xieliujie                      2021-04-27  25  	TP_ARGS(task, skip));
3fc5e942554eb43 JianMin Liu                    2020-07-21  26  DECLARE_HOOK(android_vh_binder_set_priority,
3fc5e942554eb43 JianMin Liu                    2020-07-21  27  	TP_PROTO(struct binder_transaction *t, struct task_struct *task),
3fc5e942554eb43 JianMin Liu                    2020-07-21  28  	TP_ARGS(t, task));
3fc5e942554eb43 JianMin Liu                    2020-07-21  29  DECLARE_HOOK(android_vh_binder_restore_priority,
3fc5e942554eb43 JianMin Liu                    2020-07-21  30  	TP_PROTO(struct binder_transaction *t, struct task_struct *task),
3fc5e942554eb43 JianMin Liu                    2020-07-21  31  	TP_ARGS(t, task));
de3955742da82a0 Satya Durga Srinivasu Prabhala 2020-12-15  32  DECLARE_HOOK(android_vh_binder_wakeup_ilocked,
f4450be6e75d708 Liujie Xie                     2021-03-16  33  	TP_PROTO(struct task_struct *task, bool sync, struct binder_proc *proc),
f4450be6e75d708 Liujie Xie                     2021-03-16  34  	TP_ARGS(task, sync, proc));
f4450be6e75d708 Liujie Xie                     2021-03-16  35  DECLARE_HOOK(android_vh_binder_wait_for_work,
f4450be6e75d708 Liujie Xie                     2021-03-16  36  	TP_PROTO(bool do_proc_work, struct binder_thread *tsk, struct binder_proc *proc),
f4450be6e75d708 Liujie Xie                     2021-03-16  37  	TP_ARGS(do_proc_work, tsk, proc));
f4450be6e75d708 Liujie Xie                     2021-03-16  38  DECLARE_HOOK(android_vh_sync_txn_recvd,
f4450be6e75d708 Liujie Xie                     2021-03-16  39  	TP_PROTO(struct task_struct *tsk, struct task_struct *from),
f4450be6e75d708 Liujie Xie                     2021-03-16  40  	TP_ARGS(tsk, from));
9a7758d97fb469b Liangliang Li                  2021-11-10 @41  DECLARE_RESTRICTED_HOOK(android_rvh_binder_transaction,
9a7758d97fb469b Liangliang Li                  2021-11-10  42  	TP_PROTO(struct binder_proc *target_proc, struct binder_proc *proc,
9a7758d97fb469b Liangliang Li                  2021-11-10  43  		struct binder_thread *thread, struct binder_transaction_data *tr),
9a7758d97fb469b Liangliang Li                  2021-11-10  44  	TP_ARGS(target_proc, proc, thread, tr), 1);
3c5df4a52e4a1e0 zhang chuang                   2021-06-16  45  DECLARE_HOOK(android_vh_binder_print_transaction_info,
3c5df4a52e4a1e0 zhang chuang                   2021-06-16  46  	TP_PROTO(struct seq_file *m, struct binder_proc *proc,
3c5df4a52e4a1e0 zhang chuang                   2021-06-16  47  		 const char *prefix, struct binder_transaction *t),
3c5df4a52e4a1e0 zhang chuang                   2021-06-16  48  	TP_ARGS(m, proc, prefix, t));
3c5df4a52e4a1e0 zhang chuang                   2021-06-16  49  

:::::: The code at line 41 was first introduced by commit
:::::: 9a7758d97fb469b860a2757cc0475cd530776208 ANDROID: GKI: Add vendor hook to binder transaction

:::::: TO: Liangliang Li <liliangliang@vivo.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
