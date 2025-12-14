Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3C330DEA7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765740946; cv=none; b=li4w/7MEDAPvowXwejslfoLzwB6cIxfz2h4ezMqw+9J9fwif5onInIZcPtZFoXd7MPXZMKOky/TeyLlHACrEiJDhmwz53G8+LGUyZ/6KHgZxsILhA9g6YfjK86aWi2nmxK0TkGZjdDjkKbb3MbC6i2j1NheL33PMaCgwj0UPaSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765740946; c=relaxed/simple;
	bh=JM0APJ9Rjj3qsscttPUaIZvYntI0tCYVM9R3lS+pK1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sziIRQtrWkYk6Z2fBFoIiFH8bEvLebFxvO312vScVuAA8eTatGHEOPBh3ksQ0YLsMRfA+2ByUE3AiygIAr8wI741U/86gXDAsSfR7eh4xOwFGjDoKN3uStWaUO3kwISzoPfovOKSzaY5c2pSyFtRdEVOxHdXdAP0GLvRC7AOs8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/cgbKHA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/cgbKHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765740945; x=1797276945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JM0APJ9Rjj3qsscttPUaIZvYntI0tCYVM9R3lS+pK1w=;
  b=R/cgbKHAeaShvScrE4qrQhTIXQ0eKVAzSQPcvWAS/KupeRV2oR9BPdMj
   VtMV6Wr4jA0NfDGZgGrOCozVWdLjUvflg5E0aq6gsK5JVRvgE7FcaGs34
   CEr/H/p4J+QQory3uX7GRH5OOG2eLWNHTP3JXT3afI9ztFix+QXUH5L94
   vrWCnqbBiwROwOYW3FgK1fEvtMXsHYbr4nOB6AnAaiDJFS64tv3eUBBAu
   8k6DYOUJ7CV79/Xf2Ei4aSHh/T5xTiLT41JIXJuoD18G6u6/GfKuQcDNC
   U0ZZDyX1HQhAlqnKpJViCIW1nOC/3AOk8eTbr2jEMbiBcnBsmvGoMak7M
   A==;
X-CSE-ConnectionGUID: v93jdlZZQmKBlkQviaeuDA==
X-CSE-MsgGUID: zL+uaNWhR5GcpS07OVukow==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67691488"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67691488"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 11:35:41 -0800
X-CSE-ConnectionGUID: viVbYo9MR9mzGq1w4pE7Ow==
X-CSE-MsgGUID: /dWMQIvJRXGRU5NGs4OrlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228621683"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 11:35:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUrsY-000000009Jj-0SyD;
	Sun, 14 Dec 2025 19:35:38 +0000
Date: Mon, 15 Dec 2025 03:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>, Tianyu Lan <tiala@microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: drivers/hv/hv.c:365:31: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202512150359.fMdmbddk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Roman,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 163224c189e8b679ce919aa64ccabb7a992ca2d1 Drivers: hv: Rename fields for SynIC message and event pages
date:   4 weeks ago
config: x86_64-randconfig-123-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150359.fMdmbddk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150359.fMdmbddk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150359.fMdmbddk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hv/hv.c:282:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/hv/hv.c:301:26: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/hv/hv.c:365:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *hyp_synic_message_page @@
   drivers/hv/hv.c:365:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/hv/hv.c:365:31: sparse:     got void *hyp_synic_message_page
>> drivers/hv/hv.c:377:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *hyp_synic_event_page @@
   drivers/hv/hv.c:377:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/hv/hv.c:377:31: sparse:     got void *hyp_synic_event_page

vim +365 drivers/hv/hv.c

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
 > 365			iounmap(hv_cpu->hyp_synic_message_page);
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
