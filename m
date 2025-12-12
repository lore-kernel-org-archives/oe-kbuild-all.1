Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D2C3101DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571313; cv=none; b=WuQa83fgal/oFyTNwTZorukPRp+c2/yncDXJy9Kpxe91ctFXJr1W/b7CL6Ljpgenuzw88la2UKNh8fN1DFyM0XXPHgNAHJT9T9VHD1iBvfRwtCkCjqdhv/yScH/rwmk8cZJd/usnSsLnq0L2qQZ6N+r6qEkNmPykwso0bKFpg44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571313; c=relaxed/simple;
	bh=vyIKPZ5MdJgdmOIgNCGNpLO4Ghn2loVHsnRGxJ5cUig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N1ssMO+sfwoK7Stcj2aVaXh2fav1rZlHdfZ05PoLqXnqEoWZPzpj+zjs4qrZtgjj5CH8HartRrHh5+u8kotLSyv7KV97VQOk+qiIXrnXh9Owl7DT26QNpkMTsHpza8L7Vl1Or7TToq4wjPtmjla72KLbouO2JQjSZG2/ko/bgjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOcc3Sda; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOcc3Sda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765571312; x=1797107312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vyIKPZ5MdJgdmOIgNCGNpLO4Ghn2loVHsnRGxJ5cUig=;
  b=fOcc3SdadrUIwA0KcWMckDjt3+7pZDgfZmBA5qi3WTbuGcLty+FN6rIb
   jqe6m2Wp7XblDWoC4dPZIZMSAtOOqvduN9ND5acDMMMHiBTH5kXwsOI4Y
   2oKz081bmPCGJ4SPDJ8ax88YOetOBfLV30IryZPR4AmQnEW8O/d8dLB4z
   5EO4uAS/fFoe22Qu9Pb1mAlXja3mNzr/PaoYoKxj1ljCovF4KXH7videe
   xwT1aIClzTjPeE4KOnMQG0dVPI5CByr/6chB9bLUM1XrdW5pHzgRNfLK9
   tcM3K5Y/gnbcLqBUDFbZYjDzoFgcgpoq9D+CEUfAUmNIbfBXbWme5IbtI
   Q==;
X-CSE-ConnectionGUID: KJMdBLt5Q9KfMB9lHDHFnw==
X-CSE-MsgGUID: YVgYXe9NQfK/1yIAtURswQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78284899"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78284899"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:28:28 -0800
X-CSE-ConnectionGUID: PwOXMOeCQQWTma7xzibPQA==
X-CSE-MsgGUID: OIvWBOMaSUa51Bd3JPc3UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196250287"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 12:28:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9kW-000000006Zd-1kI6;
	Fri, 12 Dec 2025 20:28:24 +0000
Date: Sat, 13 Dec 2025 04:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2540:29:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202512130423.1ubNFGvk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bennie,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [3541/3541] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130423.1ubNFGvk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130423.1ubNFGvk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130423.1ubNFGvk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:32:5: sparse: sparse: symbol 'nbl_serv_setup_queues' was not declared. Should it be static?
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:68:6: sparse: sparse: symbol 'nbl_serv_flush_rx_queues' was not declared. Should it be static?
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:77:5: sparse: sparse: symbol 'nbl_serv_setup_rings' was not declared. Should it be static?
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:124:6: sparse: sparse: symbol 'nbl_serv_stop_rings' was not declared. Should it be static?
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2116:6: sparse: sparse: symbol 'nbl_serv_pldmfw_op_pci_match_record' was not declared. Should it be static?
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2528:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2528:38: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2528:38: sparse:     got void *
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2540:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2540:29: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2540:29: sparse:     got void *
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2851:5: sparse: sparse: symbol 'nbl_serv_get_vf_base_vsi_id' was not declared. Should it be static?
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +2540 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c

bad535d287c9c10 Bennie Yan 2024-09-24  2511  
bad535d287c9c10 Bennie Yan 2024-09-24  2512  static int nbl_serv_process_passthrough(struct nbl_service_mgt *serv_mgt,
bad535d287c9c10 Bennie Yan 2024-09-24  2513  					unsigned int cmd, unsigned long arg)
bad535d287c9c10 Bennie Yan 2024-09-24  2514  {
bad535d287c9c10 Bennie Yan 2024-09-24  2515  	struct nbl_dispatch_ops *disp_ops = NBL_SERV_MGT_TO_DISP_OPS(serv_mgt);
bad535d287c9c10 Bennie Yan 2024-09-24  2516  	struct nbl_common_info *common = NBL_SERV_MGT_TO_COMMON(serv_mgt);
bad535d287c9c10 Bennie Yan 2024-09-24  2517  	struct nbl_passthrough_fw_cmd_param *param = NULL, *result = NULL;
bad535d287c9c10 Bennie Yan 2024-09-24  2518  	int ret = 0;
bad535d287c9c10 Bennie Yan 2024-09-24  2519  
bad535d287c9c10 Bennie Yan 2024-09-24  2520  	param = kzalloc(sizeof(*param), GFP_KERNEL);
bad535d287c9c10 Bennie Yan 2024-09-24  2521  	if (!param)
bad535d287c9c10 Bennie Yan 2024-09-24  2522  		goto alloc_param_fail;
bad535d287c9c10 Bennie Yan 2024-09-24  2523  
bad535d287c9c10 Bennie Yan 2024-09-24  2524  	result = kzalloc(sizeof(*result), GFP_KERNEL);
bad535d287c9c10 Bennie Yan 2024-09-24  2525  	if (!result)
bad535d287c9c10 Bennie Yan 2024-09-24  2526  		goto alloc_result_fail;
bad535d287c9c10 Bennie Yan 2024-09-24  2527  
bad535d287c9c10 Bennie Yan 2024-09-24  2528  	ret = copy_from_user(param, (void *)arg, _IOC_SIZE(cmd));
bad535d287c9c10 Bennie Yan 2024-09-24  2529  	if (ret) {
bad535d287c9c10 Bennie Yan 2024-09-24  2530  		nbl_err(common, NBL_DEBUG_ST, "Bad access %d.\n", ret);
bad535d287c9c10 Bennie Yan 2024-09-24  2531  		return ret;
bad535d287c9c10 Bennie Yan 2024-09-24  2532  	}
bad535d287c9c10 Bennie Yan 2024-09-24  2533  
bad535d287c9c10 Bennie Yan 2024-09-24  2534  	nbl_debug(common, NBL_DEBUG_ST, "Passthough opcode: %d\n", param->opcode);
bad535d287c9c10 Bennie Yan 2024-09-24  2535  
bad535d287c9c10 Bennie Yan 2024-09-24  2536  	ret = disp_ops->passthrough_fw_cmd(NBL_SERV_MGT_TO_DISP_PRIV(serv_mgt), param, result);
bad535d287c9c10 Bennie Yan 2024-09-24  2537  	if (ret)
bad535d287c9c10 Bennie Yan 2024-09-24  2538  		goto passthrough_fail;
bad535d287c9c10 Bennie Yan 2024-09-24  2539  
bad535d287c9c10 Bennie Yan 2024-09-24 @2540  	ret = copy_to_user((void *)arg, result, _IOC_SIZE(cmd));
bad535d287c9c10 Bennie Yan 2024-09-24  2541  
bad535d287c9c10 Bennie Yan 2024-09-24  2542  passthrough_fail:
bad535d287c9c10 Bennie Yan 2024-09-24  2543  	kfree(result);
bad535d287c9c10 Bennie Yan 2024-09-24  2544  alloc_result_fail:
bad535d287c9c10 Bennie Yan 2024-09-24  2545  	kfree(param);
bad535d287c9c10 Bennie Yan 2024-09-24  2546  alloc_param_fail:
bad535d287c9c10 Bennie Yan 2024-09-24  2547  	return ret;
bad535d287c9c10 Bennie Yan 2024-09-24  2548  }
bad535d287c9c10 Bennie Yan 2024-09-24  2549  

:::::: The code at line 2540 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
