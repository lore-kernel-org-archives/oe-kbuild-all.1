Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731DB25F78F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754477815; cv=none; b=pp5U47MH4/f4BTEXmYLMVeOX6v09knvc0TitjrnYNeiAz6MUeatdp0hLfyxPBktY2DSFzUqAwZUv50baL6aI5kv05jw4kF16RrSwpDds0SUk5c5DbHn22vE53IKdSeh3noriS1nszcDT5KJ8bsI1RNLs9EkT+ZRbOPjfUDndR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754477815; c=relaxed/simple;
	bh=OCxX6lfwUancXtPqQsqaCqtnOVT7DgLGXCCuVIIMDFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzcTYTCbtTpfQl5jAvOWHyL3HqZN/YUKUdEmRJzmutFdkYmMcL3uJOljxhVme3nXXnReUClEd0LMUU7sgpp36xV9uL9Bds20t1v0lVEhJ24HkrChp+1RKxByOUiMUPS0GApp4EJUvCQ4xVwvF8FjeR89T0e9q3dkb6Dr02P22/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbyH/kMG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbyH/kMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754477812; x=1786013812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OCxX6lfwUancXtPqQsqaCqtnOVT7DgLGXCCuVIIMDFc=;
  b=mbyH/kMGgRmhKduHSAYlkIySRwk1qInwxuRpJI9LRN+s/6/ahPnaTRm8
   aGm1oUq4lW7o4EsL1rvZq3xyqV1MmBtVgO5IPL7nNUdG97eDTihDnhBAg
   kcgkibc7uJZ6f+QIbTsro8jAEOyPEktdlIzfr/3fiTiEqHMvLqR+VyNly
   g1bW7+4VIJFRmRyNwogI2CbZ8ONNR95nrM6Kgnb45ds+MxkgCrub71Wle
   bhDgYCIHKjIqWqDizccQkBCjYmKfQE1Q+RWmyD6sDav6lZ9hSpGw0/sJj
   JIWHwfR4+0iCTRGIkZ2DWIJ1/7VkqvAqi9ZvWsm48Mo+WTJA5YDPk2rd9
   w==;
X-CSE-ConnectionGUID: pxGHrQdKSiOI9pG/btmVLQ==
X-CSE-MsgGUID: 6HN/Ld9GQySNuEacEMX76w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56707483"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56707483"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 03:56:52 -0700
X-CSE-ConnectionGUID: wPRbuqmdR5WR/RFynqHy2Q==
X-CSE-MsgGUID: JQV20pgTSnOcbVLjNHUecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="168923033"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 06 Aug 2025 03:56:50 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujbpA-0002C7-2K;
	Wed, 06 Aug 2025 10:56:48 +0000
Date: Wed, 6 Aug 2025 12:55:49 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2658/2658]
 drivers/video/fbdev/ls2k500sfb.c:254:13: warning: no previous prototype for
 function 'ls2k500sfb_interrupt'
Message-ID: <202508061235.qxpfqpxl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8551213150db5f8eebd27273dae93f6fe258d63a
commit: 8248d42b7c5f4338a54f26d8efebec8614b43466 [2658/2658] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: loongarch-randconfig-2005-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061235.qxpfqpxl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061235.qxpfqpxl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061235.qxpfqpxl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/video/fbdev/ls2k500sfb.c:12:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/video/fbdev/ls2k500sfb.c:254:13: warning: no previous prototype for function 'ls2k500sfb_interrupt' [-Wmissing-prototypes]
     254 | irqreturn_t ls2k500sfb_interrupt(int irq, void *arg)
         |             ^
   drivers/video/fbdev/ls2k500sfb.c:254:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     254 | irqreturn_t ls2k500sfb_interrupt(int irq, void *arg)
         | ^
         | static 
   5 warnings generated.


vim +/ls2k500sfb_interrupt +254 drivers/video/fbdev/ls2k500sfb.c

   253	
 > 254	irqreturn_t ls2k500sfb_interrupt(int irq, void *arg)
   255	{
   256		struct ls2k500sfb_struct *priv = arg;
   257		struct pci_dev *pdev = priv->dev;
   258	
   259		if (irq == pdev->irq)
   260			pr_info("ls2k500sfb pcie interrupt\n");
   261		else
   262			pr_info("ls2k500sfb gpio interrupt\n");
   263		if (system_state != SYSTEM_RUNNING)
   264			return IRQ_HANDLED;
   265	
   266		if (!priv->running) {
   267			if (!resetdelay || time_after(jiffies, priv->reset_time + resetdelay * HZ)) {
   268				priv->running = 1;
   269				queue_work(priv->wq, &priv->work);
   270			}
   271			priv->reset_time = jiffies;
   272		}
   273		return IRQ_HANDLED;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
