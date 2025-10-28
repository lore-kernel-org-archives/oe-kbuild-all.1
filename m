Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEAD47A6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 01:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761613425; cv=none; b=cDn1onKIAhlNcum6FZNRwDWJotyRYFlVna8cYe9643LD/c+eyixPEC5gSmidW1NiHK+xR1LyJAUF6H7clEHTN5TWkUKNNDF/8zp17ZZuhMGBeJLCrVJv6l4Py/bREZU56IKInD2rFZD/GpIchv24YjoHOQJRdFyWjpK16OU7ZR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761613425; c=relaxed/simple;
	bh=RUcVKecH05yecy6cRGnPdxo/Vq9agXclNdfrn6VdoKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rWGxiuSZoeMB8WM6g0JpgQPMqkp2acITWLmRRLKEusEt23NmEX1+9pMsKqTG/TAYHRH8N+4mphcKbcByQfJee8hr/ryoZjKrP1w3oEZXZKmvXBdcWki/smjoXCYFl6vWArHBzzNWnO/ZDT0mimGbWXBJEzqbBweFGVhUYDBtrAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZ480OvQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZ480OvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761613423; x=1793149423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RUcVKecH05yecy6cRGnPdxo/Vq9agXclNdfrn6VdoKo=;
  b=NZ480OvQZAMoPTBemPqGJvY4jMKd3I4SXl6aw8cHf1zKaCHYcIQFmK5a
   nm0VjcOBpY6mAU/GP5WO+JUCMLd+aT1HvM701cjwEPk/DFMbTLG2pMhxu
   MwsaovCFCshgsr3RhTu5rMSqGF1lbkx2A20o3Lh/lfBEtVGhxk4hZVAKJ
   6wK6lDrytCMK8ECGdcWZNWpLi44MCYfg0lE7hojz1NnX+jO9vNuHiJEb7
   e01Gu52njof7G33l0Tv25O7QTBz6bJ5PQ43IKUAPCL2EjB1tb4Ok2F8Qu
   l1nE0gakfXtQ4PMPwVDaS+9NIiQJ/00+SiEhV+cpDKYGbjcEjmLtQv2vx
   A==;
X-CSE-ConnectionGUID: rwrd56aDTSiVylzCCDk/rw==
X-CSE-MsgGUID: Cte01eZFSpCia0wy1NwVpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81127851"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="81127851"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 18:03:43 -0700
X-CSE-ConnectionGUID: LCM3mXXZSqylwEaGy8bVTg==
X-CSE-MsgGUID: pc29mYq7RT+oSxM2lknjZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="185105134"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 27 Oct 2025 18:03:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDY7f-000IcZ-0a;
	Tue, 28 Oct 2025 01:03:39 +0000
Date: Tue, 28 Oct 2025 09:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, LinKun <linkun2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1843/1843]
 drivers/net/ethernet/huawei/hinic3/hw/.tmp_hinic3_lld.o: warning: objtool:
 missing symbol for section .text.unlikely.
Message-ID: <202510280809.PNDpUlLq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   94ad87c57bb159a8da41b1b31e58598bac9d0c8d
commit: 04f1abe06870ce691b6770c45ec6a5bd31087570 [1843/1843] Enable Huawei Intelligent Network Card Driver: hinic3
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251028/202510280809.PNDpUlLq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280809.PNDpUlLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280809.PNDpUlLq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:103:6: warning: no previous prototype for function 'hinic3_uld_lock_init' [-Wmissing-prototypes]
     103 | void hinic3_uld_lock_init(void)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | void hinic3_uld_lock_init(void)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:525:5: warning: no previous prototype for function 'hinic3_pdev_is_virtfn' [-Wmissing-prototypes]
     525 | u32 hinic3_pdev_is_virtfn(struct pci_dev *pdev)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:525:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     525 | u32 hinic3_pdev_is_virtfn(struct pci_dev *pdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:785:5: warning: no previous prototype for function '__set_vroce_func_state' [-Wmissing-prototypes]
     785 | int __set_vroce_func_state(struct hinic3_pcidev *pci_adapter)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:785:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     785 | int __set_vroce_func_state(struct hinic3_pcidev *pci_adapter)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:826:6: warning: no previous prototype for function 'slave_host_mgmt_vroce_work' [-Wmissing-prototypes]
     826 | void slave_host_mgmt_vroce_work(struct work_struct *work)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:826:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     826 | void slave_host_mgmt_vroce_work(struct work_struct *work)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:834:7: warning: no previous prototype for function 'hinic3_get_roce_uld_by_pdev' [-Wmissing-prototypes]
     834 | void *hinic3_get_roce_uld_by_pdev(struct pci_dev *pdev)
         |       ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:834:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     834 | void *hinic3_get_roce_uld_by_pdev(struct pci_dev *pdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1796:6: warning: no previous prototype for function 'hinic3_set_func_state' [-Wmissing-prototypes]
    1796 | void hinic3_set_func_state(struct hinic3_pcidev *pci_adapter)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1796:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1796 | void hinic3_set_func_state(struct hinic3_pcidev *pci_adapter)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1822:6: warning: no previous prototype for function 'slave_host_mgmt_work' [-Wmissing-prototypes]
    1822 | void slave_host_mgmt_work(struct work_struct *work)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1822:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1822 | void slave_host_mgmt_work(struct work_struct *work)
         | ^
         | static 
   7 warnings generated.
>> drivers/net/ethernet/huawei/hinic3/hw/.tmp_hinic3_lld.o: warning: objtool: missing symbol for section .text.unlikely.
--
>> drivers/net/ethernet/huawei/hinic3/hw/.tmp_hinic3_devlink.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
