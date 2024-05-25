Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9128E2F50
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 22:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716676808; cv=none; b=hvYObwkOiOHv8l9o7BxNb3C6rHFBik3/C1dGjnIP7zluH6OmJRV6f/AvI8RNG750EkDEw5Xt+85ipwH8JMDudDv3kF9ZUPfOBnf3t/ext4F+7SE5YeD1kURGk4M14CwgXxKOMV/U7mvO/Q6kCDg4U9JaDCFF6ZE1QuwCXhaGEQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716676808; c=relaxed/simple;
	bh=H8sbI58D5CtOe0awkVQbRo51MtPVnxrechijhk0Wn0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekyhH6RhWm09aXpfBCMGSJeoaScCaM7a1Q7BASf/ZaHffcuabK3RJIihcxd4vyn1Tbj67MPk8IuIwk4hXAv18oXuH10SgE0HcckZibpxf6sp2lsfRzOcy/UPXhgiS/e4enb1uK5/O3nQ1177F3Y3E7FjfHP4TbPKoHTgJb8z29E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWm2ko+V; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWm2ko+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716676807; x=1748212807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H8sbI58D5CtOe0awkVQbRo51MtPVnxrechijhk0Wn0U=;
  b=SWm2ko+VrKNKXTEiID+aQ6QFOvTpIDsRpyFUTv1tMcdxwLmakdJdRJ8Y
   RW/2R1aqBmiLahLBWASMssG7aPAmCQNXPRSAiGS1l7fEY6iTm7N8F1Mmd
   1Ht3FXdIfz0V4+84iMiDv2A6kgKVi2FnajY0E8zvkl/A6Lf84n53ZKhw1
   gaM0CBMbI733y5yAkbyMu0+r6ZjbmINfnYTs3nK+JqAtzQB2syza9rbD+
   KjE8eTywDfqnAI/sXEEJ/XQ8eqmgVGQ0x6BP8I6MHpsYAXo48zQ7CbXKt
   Ers9XuB6Hegr3AAkaDw+ikCqDE4Ev6kKroe0D6bvCpftlDePjYZkF6eru
   w==;
X-CSE-ConnectionGUID: RSZ95NFZQLiGXIpqA7qSZQ==
X-CSE-MsgGUID: KNynirXvT0SM10NcB7ROqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="16855082"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="16855082"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 15:40:06 -0700
X-CSE-ConnectionGUID: 46AplidgQ5KdZLq5EpaRpw==
X-CSE-MsgGUID: 1spTYAV1R2OjtdBOBVaVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34858027"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 May 2024 15:40:05 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB03W-0007VH-20;
	Sat, 25 May 2024 22:40:02 +0000
Date: Sun, 26 May 2024 06:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13425/22498]
 drivers/net/ethernet/huawei/hinic/hinic_lld.o: warning: objtool: missing
 symbol for section .init.text
Message-ID: <202405260629.8pNBCMHs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4ba26291c36f420273a2546b25d2c0db3115d226
commit: 90f09a01314abe26de1a722d1b51c351d84e1f5b [13425/22498] net/hinic: Add support for X86 Arch
config: x86_64-buildonly-randconfig-003-20240525 (https://download.01.org/0day-ci/archive/20240526/202405260629.8pNBCMHs-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260629.8pNBCMHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260629.8pNBCMHs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic/hinic_lld.c:531:5: warning: no previous prototype for 'hinic_version_cmp' [-Wmissing-prototypes]
     531 | int hinic_version_cmp(char *ver1, char *ver2)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1126:7: warning: no previous prototype for 'hinic_get_ppf_hwdev_by_pdev' [-Wmissing-prototypes]
    1126 | void *hinic_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1279:6: warning: no previous prototype for 'hinic_get_card_func_info_by_card_name' [-Wmissing-prototypes]
    1279 | void hinic_get_card_func_info_by_card_name(const char *chip_name,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1817:6: warning: no previous prototype for 'hinic_event_process' [-Wmissing-prototypes]
    1817 | void hinic_event_process(void *adapter, struct hinic_event_info *event)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2268:6: warning: no previous prototype for 'cfg_order_reg' [-Wmissing-prototypes]
    2268 | void cfg_order_reg(struct hinic_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_lld.o: warning: objtool: missing symbol for section .init.text
--
>> drivers/net/ethernet/huawei/hinic/hinic_qp.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/huawei/hinic/hinic_msix_attr.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
