Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281187F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 00:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711929780; cv=none; b=cxK92GR655UwZpuBYZCqCjse/1b6mSZitWOJEBDIoc9+rSocvrDxeKUrvbirL0FiDkIahyZxOYlGyA8iPh8TC1cz/n6U4KToZqT5LYUWuE1LNnezqGaYTwPFVoggX4I9z4GAjsVDwOPQ8wT52SxEPF5Y9VbnPZlWwfi9bxf857o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711929780; c=relaxed/simple;
	bh=kv35ozhBwdt7czE3pkUN8oQUTmGHFhF1xuUBjeGrJFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mSM9tbh11iqUJfEyetVbUfCSbL5uIXNjyx2YmbcFM4hfz5INR8283WtmwvGzR+SXlhScuQISVd/C8OFo9KZcMxtEdsWUQeggGHs5Ebw59MPsJ3q1IRrZg1bamm5ifRxD0iVHl02ajLJlwKmD7G8xPOIE3jga6aH/9RUAWn71Yfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhwaKwl3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhwaKwl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711929778; x=1743465778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kv35ozhBwdt7czE3pkUN8oQUTmGHFhF1xuUBjeGrJFs=;
  b=ZhwaKwl3eYWWBvTLEJyQanarPHPk2MBdpoN9olZLsdLZXp5mgLT6eUiE
   8j+5eXeBiUT0Iah6dup5ywUU/g9sKSXfJjcj12ro37vjNtWyi2Du1cGFU
   3vrR4p10L2WDiW8idoYpMl4Oe8qYvAQu3Lt7CRcS3O1a1c9j1sYjyQI7i
   kEsPhwM0dIzrCH+OkDKPeiGvrpyjDKQdZwB8aWaSSE1GLKuDNLDQLBZNY
   ZRhENla1bmId+qRZLDqX4+JbtDMGJdH8UOoQL6j/76iTUl1BkrGdIuR1r
   ePo0OnWnI+65EYgL+3oAJVa6ss+vt2VrpTmfQKQOLauPW87QmvE0aiQG1
   w==;
X-CSE-ConnectionGUID: WCAoDTV6SuKXFj2KxlxTnQ==
X-CSE-MsgGUID: LH+yw2i9SqWZY4xZB8dgMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="17670209"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="17670209"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 17:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="17411791"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Mar 2024 17:02:56 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr58Y-0001VY-09;
	Mon, 01 Apr 2024 00:02:54 +0000
Date: Mon, 1 Apr 2024 08:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 10/13]
 drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c:415:31: warning: variable
 'hw_ops' set but not used
Message-ID: <202404010746.Ev7N4rol-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   d010d5e1e024413b59938c00d390018f0e5305f8
commit: 7cf1285ed4af5b1002e8f9263a16aa7f618f9c98 [10/13] CHROMIUM: remoteproc: mediatek: Add APU remoteproc driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240401/202404010746.Ev7N4rol-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404010746.Ev7N4rol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010746.Ev7N4rol-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c:7:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1776:
   include/linux/vmstat.h:502:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c:415:31: warning: variable 'hw_ops' set but not used [-Wunused-but-set-variable]
     415 |         const struct mtk_apu_hw_ops *hw_ops;
         |                                      ^
   6 warnings generated.
--
   In file included from drivers/remoteproc/mediatek_apusys/plat/mt8188_plat.c:10:
   In file included from include/linux/remoteproc/mtk_apu.h:13:
   In file included from include/linux/remoteproc/mtk_apu_ipi.h:9:
   In file included from include/linux/rpmsg/mtk_rpmsg.h:10:
   In file included from include/linux/remoteproc.h:40:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1776:
   include/linux/vmstat.h:502:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/remoteproc/mediatek_apusys/plat/mt8188_plat.c:32:10: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      32 |         int32_t ret;
         |                 ^
   6 warnings generated.
--
   In file included from drivers/soc/mediatek/apusys/mtk_apu_hw_logger.c:10:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1776:
   include/linux/vmstat.h:502:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/apusys/mtk_apu_hw_logger.c:852:16: error: incompatible pointer to integer conversion passing 'char[2]' to parameter of type 'char' [-Wint-conversion]
     852 |                         seq_putc(s, "\n");
         |                                     ^~~~
   include/linux/seq_file.h:120:40: note: passing argument to parameter 'c' here
     120 | void seq_putc(struct seq_file *m, char c);
         |                                        ^
   5 warnings and 1 error generated.


vim +/hw_ops +415 drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c

   406	
   407	static int mtk_apu_probe(struct platform_device *pdev)
   408	{
   409		struct device *dev = &pdev->dev;
   410		struct device_node *np = dev->of_node;
   411		struct device_node *hw_logger_np;
   412		struct rproc *rproc;
   413		struct mtk_apu *apu;
   414		const struct mtk_apu_platdata *data;
 > 415		const struct mtk_apu_hw_ops *hw_ops;
   416		int ret = 0;
   417	
   418		data = of_device_get_match_data(dev);
   419		hw_ops = &data->ops;
   420	
   421		rproc = devm_rproc_alloc(dev, np->name, &mtk_apu_ops, data->fw_name, sizeof(struct mtk_apu));
   422		if (!rproc)
   423			return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");
   424	
   425		rproc->auto_boot = data->flags.auto_boot;
   426		rproc->sysfs_read_only = true;
   427	
   428		apu = rproc->priv;
   429		apu->rproc = rproc;
   430		apu->pdev = pdev;
   431		apu->dev = dev;
   432		apu->platdata = data;
   433		apu->genpd_nb.notifier_call = mtk_apu_power_genpd_notifier;
   434	
   435		hw_logger_np = of_parse_phandle(np, "mediatek,hw-logger", 0);
   436		if (!hw_logger_np)
   437			return dev_err_probe(dev, -ENOENT, "failed to get hw-logger phandle\n");
   438	
   439		apu->hw_logger_data = get_mtk_apu_hw_logger_device(hw_logger_np);
   440	
   441		of_node_put(hw_logger_np);
   442	
   443		if (!apu->hw_logger_data)
   444			return dev_err_probe(dev, -EPROBE_DEFER, "failed to get hw-logger data\n");
   445	
   446		platform_set_drvdata(pdev, apu);
   447	
   448		spin_lock_init(&apu->reg_lock);
   449	
   450		pm_runtime_enable(&pdev->dev);
   451		pm_runtime_get_sync(&pdev->dev);
   452	
   453		ret = rproc_add(rproc);
   454		if (ret < 0) {
   455			dev_info(dev, "boot fail ret:%d\n", ret);
   456			goto err_put_device;
   457		}
   458	
   459		pm_runtime_put_sync(&pdev->dev);
   460	
   461		dev_pm_genpd_add_notifier(dev, &apu->genpd_nb);
   462	
   463		return 0;
   464	
   465	err_put_device:
   466		pm_runtime_put_sync(&apu->pdev->dev);
   467		pm_runtime_disable(&pdev->dev);
   468	
   469		return ret;
   470	}
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
