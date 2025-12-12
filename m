Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F34926980F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 17:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765562119; cv=none; b=QZJh56UoXfEZhgt/QHliY8iIp0k4n3ejQ1n5VziOcIHU5Wo37DYWD6vZ6vX6f1k01WH9jVlEgAu4jTxHG/25iPQz9zHZFu8SSe654l3/Y0dH8AzHS2PrmbrSe48xnJ/gN58NOVFINhX5QMrR2K6SZKFa6Wf4BG5nBYl4EMybIA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765562119; c=relaxed/simple;
	bh=AUqmO1AHOHXvot/LDp7rK5gXnXOtWsBe1rJWp4yaRSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cGdqY/jjPdwaPJCWqW4oY9XBCeccAYCYx0N/fNPOFEokTqkGsokLYhuopmRjhe6NKqu4mvX6paVfg5k6McwrSxPqonHjTJge4x8KbVfIQk6PjQndVZwGSjjwhHYte30KcuBSguUd8zVl43rUdGjfcVU2bP2QjfyGOlYZpVd+sas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIq79ASv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIq79ASv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765562117; x=1797098117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AUqmO1AHOHXvot/LDp7rK5gXnXOtWsBe1rJWp4yaRSo=;
  b=AIq79ASvIHBFBNcvKk9iPQmgATUU0l0eCJx8mchKMxJ2kL58onT6xvsO
   ci91aAa+uRbqhzC2Zld6b1pXq8sfLC6OrjLyAsRELIQDTe/mB8OpReS18
   +6OiNxdopxqevxPKjjI+XyC+nbGyCj9xRDb2OBTOejmXDyKz8lBvSZeJ2
   edBKNlZ3AjQbj9Rwc0x4ndvNhpWTlAblbUo/lBTkp6q7ad/P5xiU9IviJ
   GEmSxKsljiFCWg/6lKkEKmH6XyO/5+j3EBEeZdBtsaeoZ5R8vGwVtcnUn
   3b3wtiWUGTCkSIQPMcVc43IdUrA2+LDIyEj5Ts1pURy45+n/YEelliwCs
   g==;
X-CSE-ConnectionGUID: VubA4yGgSLS06nQKvMnggg==
X-CSE-MsgGUID: 8Wslly+GSxiJv8QI0YE4Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66744559"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="66744559"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 09:55:16 -0800
X-CSE-ConnectionGUID: onAwEN4VSKC94j0S5FvHTQ==
X-CSE-MsgGUID: KkXySc9iTWW2bLCG8koQnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201325638"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2025 09:55:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU7MG-000000006On-2AXI;
	Fri, 12 Dec 2025 17:55:12 +0000
Date: Sat, 13 Dec 2025 01:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhoujiadong <zhoujiadong5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3407/3407]
 drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:286:6: warning: no previous
 prototype for 'chipif_get_all_pf_dev_info'
Message-ID: <202512130114.JDMitdxe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   da8948fdddb84e5496272bab85973165594dd469
commit: 3d776c92130b1cdb4c9c0e5b7267152ab998fec3 [3407/3407] scsi/hifc: Fix compile error in allyesconfigs
config: x86_64-randconfig-001-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130114.JDMitdxe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130114.JDMitdxe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130114.JDMitdxe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:286:6: warning: no previous prototype for 'chipif_get_all_pf_dev_info' [-Wmissing-prototypes]
     286 | void chipif_get_all_pf_dev_info(struct pf_dev_info *dev_info, int card_idx,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:797: warning: Function parameter or member 'vhwdev' not described in 'hifc_dbgtool_knl_init'
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:797: warning: Excess function parameter 'hwdev' description in 'hifc_dbgtool_knl_init'
>> drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:892: warning: Function parameter or member 'vhwdev' not described in 'hifc_dbgtool_knl_deinit'
>> drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:892: warning: Excess function parameter 'hwdev' description in 'hifc_dbgtool_knl_deinit'


vim +/chipif_get_all_pf_dev_info +286 drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c

02b4d17a9ac62b denglei     2021-04-26  285  
02b4d17a9ac62b denglei     2021-04-26 @286  void chipif_get_all_pf_dev_info(struct pf_dev_info *dev_info, int card_idx,
02b4d17a9ac62b denglei     2021-04-26  287  				void **g_func_handle_array)
02b4d17a9ac62b denglei     2021-04-26  288  {
02b4d17a9ac62b denglei     2021-04-26  289  	u32 func_idx;
02b4d17a9ac62b denglei     2021-04-26  290  	struct hifc_hwdev *hwdev;
02b4d17a9ac62b denglei     2021-04-26  291  
02b4d17a9ac62b denglei     2021-04-26  292  	if (!dev_info) {
02b4d17a9ac62b denglei     2021-04-26  293  		pr_err("Params error!\n");
02b4d17a9ac62b denglei     2021-04-26  294  		return;
02b4d17a9ac62b denglei     2021-04-26  295  	}
02b4d17a9ac62b denglei     2021-04-26  296  
02b4d17a9ac62b denglei     2021-04-26  297  	/* pf at most 16 */
02b4d17a9ac62b denglei     2021-04-26  298  	for (func_idx = 0; func_idx < 16; func_idx++) {
02b4d17a9ac62b denglei     2021-04-26  299  		hwdev = (struct hifc_hwdev *)g_func_handle_array[func_idx];
02b4d17a9ac62b denglei     2021-04-26  300  
3d776c92130b1c zhoujiadong 2023-05-09  301  		dev_info[func_idx].phy_addr = g_hifc_card_phy_addr[card_idx];
02b4d17a9ac62b denglei     2021-04-26  302  
02b4d17a9ac62b denglei     2021-04-26  303  		if (!hwdev) {
02b4d17a9ac62b denglei     2021-04-26  304  			dev_info[func_idx].bar0_size = 0;
02b4d17a9ac62b denglei     2021-04-26  305  			dev_info[func_idx].bus = 0;
02b4d17a9ac62b denglei     2021-04-26  306  			dev_info[func_idx].slot = 0;
02b4d17a9ac62b denglei     2021-04-26  307  			dev_info[func_idx].func = 0;
02b4d17a9ac62b denglei     2021-04-26  308  		} else {
02b4d17a9ac62b denglei     2021-04-26  309  			dev_info[func_idx].bar0_size =
02b4d17a9ac62b denglei     2021-04-26  310  				pci_resource_len
02b4d17a9ac62b denglei     2021-04-26  311  				(((struct pci_dev *)hwdev->pcidev_hdl), 0);
02b4d17a9ac62b denglei     2021-04-26  312  			dev_info[func_idx].bus =
02b4d17a9ac62b denglei     2021-04-26  313  				((struct pci_dev *)
02b4d17a9ac62b denglei     2021-04-26  314  				hwdev->pcidev_hdl)->bus->number;
02b4d17a9ac62b denglei     2021-04-26  315  			dev_info[func_idx].slot =
02b4d17a9ac62b denglei     2021-04-26  316  				PCI_SLOT(((struct pci_dev *)hwdev->pcidev_hdl)
02b4d17a9ac62b denglei     2021-04-26  317  						->devfn);
02b4d17a9ac62b denglei     2021-04-26  318  			dev_info[func_idx].func =
02b4d17a9ac62b denglei     2021-04-26  319  				PCI_FUNC(((struct pci_dev *)hwdev->pcidev_hdl)
02b4d17a9ac62b denglei     2021-04-26  320  						->devfn);
02b4d17a9ac62b denglei     2021-04-26  321  		}
02b4d17a9ac62b denglei     2021-04-26  322  	}
02b4d17a9ac62b denglei     2021-04-26  323  }
02b4d17a9ac62b denglei     2021-04-26  324  

:::::: The code at line 286 was first introduced by commit
:::::: 02b4d17a9ac62b6d75e70a3d3bec5449bdeb30fa scsi/hifc: add port manager module of hifc driver

:::::: TO: denglei <denglei25@huawei.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
