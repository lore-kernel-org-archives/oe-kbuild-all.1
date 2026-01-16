Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A4A2F5473
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 20:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596927; cv=none; b=uoSL6PyknM3MKKEHRIrjgTpDjdw+4b0xzA2MQscH8/AqpiMfS1Vtf6YuB7hQEKfq7/IhYbI1nFN0XlPEFzq6/f9eF/rq10iG2JPW+2mExPWT368Ticyzez8mR7O07keLj2AylKVMIyAJf8XY5fIePUISgjEkzHhPxWbvIkVWUyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596927; c=relaxed/simple;
	bh=Vfvroc5lxfRS/C8Ac/FKc0xrXsD7OYhh91ew5WlFyL4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SkNprFYO+jG/nyKodGb6zudJWJ4v2FTFYjfaSXB6DEcQ4r0ta0l5xp+mFS1/G9QQXkMxm5iK2BZ18dyTrmC0KNZL6yDR/X8h0V94kKqmBJ3CAz6Hm4pZi/7kbP2E0ILyN0xGat7ioDnSSj/BBFvNczPVIYFGEks7NVdU8iz8Tm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCvtuoH6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCvtuoH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768596925; x=1800132925;
  h=date:from:to:cc:subject:message-id;
  bh=Vfvroc5lxfRS/C8Ac/FKc0xrXsD7OYhh91ew5WlFyL4=;
  b=jCvtuoH6duRNJJ+dD/eZS1RqBW7Ay/YFwvvIlnj/2it2usmDL8n1dVj1
   IPHoU1gbz6Nq436EpwIGpwJZQEfmNgJWr5FUoECLM6ebXSFp9MvRj6Cq2
   ccQDgoMqCtGIVWGPo65OZZN6yidO0JMNp/NXgs9zihu4GIxKhno+3hfR1
   NNQ/SJYuD7EtxXRQRJ66S7q7mUR5iZMir9tHGJ8hQ5p3ZD/rZarji0FDr
   utHIH5Ckoh9xrdj4hSom2Nco39KYs0kLL6cQdUHt5OsQlOoPnj1o3KDVV
   qeDu/J4P3xC7AcGBnAVO7uIo5kKt0SanKOV0ozm8Ctoi8QL3sM9STh5SN
   g==;
X-CSE-ConnectionGUID: OBN7renaSwulT0Zvx9wwwA==
X-CSE-MsgGUID: 77RNwRENSbKLy+eH9iyhhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87490335"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="87490335"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 12:55:22 -0800
X-CSE-ConnectionGUID: Vkj/gc8XRvi/hdVzVPACRA==
X-CSE-MsgGUID: C3QI7lHtQAWo1lKz7kw7jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="236024688"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jan 2026 12:55:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgqqj-00000000LFI-3jzj;
	Fri, 16 Jan 2026 20:55:17 +0000
Date: Sat, 17 Jan 2026 04:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Tianyu Lan <tiala@microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>
Subject: drivers/hv/hv.c:377:31: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202601170445.JtZQwndW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Roman,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   983d014aafb14ee5e4915465bf8948e8f3a723b5
commit: 163224c189e8b679ce919aa64ccabb7a992ca2d1 Drivers: hv: Rename fields for SynIC message and event pages
date:   9 weeks ago
config: x86_64-randconfig-r134-20260116 (https://download.01.org/0day-ci/archive/20260117/202601170445.JtZQwndW-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170445.JtZQwndW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170445.JtZQwndW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hv/hv.c:282:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/hv/hv.c:301:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/hv/hv.c:365:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *hyp_synic_message_page @@
   drivers/hv/hv.c:365:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/hv/hv.c:365:31: sparse:     got void *hyp_synic_message_page
>> drivers/hv/hv.c:377:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *hyp_synic_event_page @@
   drivers/hv/hv.c:377:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/hv/hv.c:377:31: sparse:     got void *hyp_synic_event_page

vim +377 drivers/hv/hv.c

   337	
   338	void hv_synic_disable_regs(unsigned int cpu)
   339	{
   340		struct hv_per_cpu_context *hv_cpu =
   341			per_cpu_ptr(hv_context.cpu_context, cpu);
   342		union hv_synic_sint shared_sint;
   343		union hv_synic_simp simp;
   344		union hv_synic_siefp siefp;
   345		union hv_synic_scontrol sctrl;
   346	
   347		shared_sint.as_uint64 = hv_get_msr(HV_MSR_SINT0 + VMBUS_MESSAGE_SINT);
   348	
   349		shared_sint.masked = 1;
   350	
   351		/* Need to correctly cleanup in the case of SMP!!! */
   352		/* Disable the interrupt */
   353		hv_set_msr(HV_MSR_SINT0 + VMBUS_MESSAGE_SINT, shared_sint.as_uint64);
   354		hv_enable_coco_interrupt(cpu, vmbus_interrupt, false);
   355	
   356		simp.as_uint64 = hv_get_msr(HV_MSR_SIMP);
   357		/*
   358		 * In Isolation VM, sim and sief pages are allocated by
   359		 * paravisor. These pages also will be used by kdump
   360		 * kernel. So just reset enable bit here and keep page
   361		 * addresses.
   362		 */
   363		simp.simp_enabled = 0;
   364		if (ms_hyperv.paravisor_present || hv_root_partition()) {
   365			iounmap(hv_cpu->hyp_synic_message_page);
   366			hv_cpu->hyp_synic_message_page = NULL;
   367		} else {
   368			simp.base_simp_gpa = 0;
   369		}
   370	
   371		hv_set_msr(HV_MSR_SIMP, simp.as_uint64);
   372	
   373		siefp.as_uint64 = hv_get_msr(HV_MSR_SIEFP);
   374		siefp.siefp_enabled = 0;
   375	
   376		if (ms_hyperv.paravisor_present || hv_root_partition()) {
 > 377			iounmap(hv_cpu->hyp_synic_event_page);
   378			hv_cpu->hyp_synic_event_page = NULL;
   379		} else {
   380			siefp.base_siefp_gpa = 0;
   381		}
   382	
   383		hv_set_msr(HV_MSR_SIEFP, siefp.as_uint64);
   384	
   385		/* Disable the global synic bit */
   386		sctrl.as_uint64 = hv_get_msr(HV_MSR_SCONTROL);
   387		sctrl.enable = 0;
   388		hv_set_msr(HV_MSR_SCONTROL, sctrl.as_uint64);
   389	
   390		if (vmbus_irq != -1)
   391			disable_percpu_irq(vmbus_irq);
   392	}
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
