Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAAB227573
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 05:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733809731; cv=none; b=EWvT8a0+3Qq2HPjtbtI2KAJvafFitLcoNqnPExt2Nv2Arub3DlhTWNyLic3WYAFTqTMTBGc68NXTRkfobDIEc+H4H0wJe3MnYk/nW+CkPftr8vwRd7T5CxN+LqLgEJtSm7pSKbsJYlZ3Bb9+ORyWaTxzysfFK4DTL5Ls0vhlbLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733809731; c=relaxed/simple;
	bh=e/iSgJBjz+8LETnfthQQUZhrlYS3XoG5kEjrkS1h0wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FOJ6FXv18I/bgRHAaP9Z362w4C+A8a0eS5pkeAt41HjrhNmOGarqvc7QgSx32Rrl+ecbg2VduBJR93dYlWi1Hhth0Qhtb/DLr6Wu6hlGlcQMEgWkLSsrN/Gca6A+mkRfv4EOacvLOuBFwHbrIY3iEP7uCsYijw6jdYOzirJvpI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UK+8O2k/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UK+8O2k/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733809729; x=1765345729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/iSgJBjz+8LETnfthQQUZhrlYS3XoG5kEjrkS1h0wQ=;
  b=UK+8O2k/MBzVV46IYzN/XFiknMoCRj2dHkoudIkDub9tghRtcaKUdtdc
   MC9gYQeR1zYOk753tXqaKpUIjXsmnUUZkRWjgtobatFZn5VsSO/uWZxlU
   W2GZ8B5zUIHgIQJXuYu3F8TyZzpCLyT/VCyjcQaSLWspIcsc9C2h8V7XR
   dzkRkMNNug6SIWOp30YuEYu500VyLbQz6Xs50Dl675p+I0gArJyZxP5WY
   pgQFxhuV64mFfBdlT50Nh0kUVfu7SduBT8Gs5At0DpR7O5VGXbGfSAlnv
   onmVQietADDTE5UeR2XnvKgMOBuEJGRbMf1BVqxKM05VLONNQiFBQRZPm
   Q==;
X-CSE-ConnectionGUID: UhZbeEB8QKqhyblawrae4w==
X-CSE-MsgGUID: W1+ToD9jRGeiWjK+MT3iPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45519785"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45519785"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 21:48:49 -0800
X-CSE-ConnectionGUID: Mr5u+/hvQZa1lTHR+WVRcw==
X-CSE-MsgGUID: IZEOWQkJQnOuht3nWNmuZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="100344747"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Dec 2024 21:48:48 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKt6z-00059N-1s;
	Tue, 10 Dec 2024 05:48:45 +0000
Date: Tue, 10 Dec 2024 13:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "Carrie.Cai" <carrie.cai@montage-tech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1609/1609]
 drivers/crypto/montage/tsse/tsse_ipc_api.c:62:36: warning: variable
 'device_handle' is uninitialized when used here
Message-ID: <202412101347.Sow2DxhA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Carrie.Cai,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c0c5f5fdc62998e0c68e6c77d6aae2566185bfd5
commit: 914854f2adb6988ac3b6521088ec96833d6743e2 [1609/1609] driver: crypto - update support for Mont-TSSE Driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241210/202412101347.Sow2DxhA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101347.Sow2DxhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101347.Sow2DxhA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/montage/tsse/tsse_ipc_api.c:10:
   In file included from drivers/crypto/montage/tsse/tsse_dev.h:13:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2243:
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
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/montage/tsse/tsse_ipc_api.c:62:36: warning: variable 'device_handle' is uninitialized when used here [-Wuninitialized]
      62 |         service_instance->device_handle = device_handle;
         |                                           ^~~~~~~~~~~~~
   drivers/crypto/montage/tsse/tsse_ipc_api.c:56:19: note: initialize the variable 'device_handle' to silence this warning
      56 |         int device_handle;
         |                          ^
         |                           = 0
   6 warnings generated.


vim +/device_handle +62 drivers/crypto/montage/tsse/tsse_ipc_api.c

    41	
    42	/**
    43	 * tsse_im_service_handle_alloc() - Allocate IPC Message service handle for specific service.
    44	 * @name: IPC Message service name
    45	 * @cb: request callback for the service
    46	 * @handle: function output for the service handle
    47	 * Return: 0 if allocated successfully, other values for failure
    48	 */
    49	int tsse_im_service_handle_alloc(
    50		const char *name,
    51		tsse_im_cb_func cb,
    52		tsse_im_service_handle *handle)
    53	{
    54		struct tsse_service_instance *service_instance;
    55		int ret;
    56		int device_handle;
    57	
    58		service_instance = kzalloc(sizeof(struct tsse_service_instance), GFP_ATOMIC);
    59		if (!service_instance)
    60			return -ENOMEM;
    61		service_instance->service_opened = 0;
  > 62		service_instance->device_handle = device_handle;
    63		service_instance->cb = cb;
    64		strscpy(service_instance->service_name, name, TSSE_IM_SERVICE_NAME_LEN);
    65	
    66		ret = tsse_schedule_device_handle(service_instance);
    67		if (ret) {
    68			kfree(service_instance);
    69			return ret;
    70		}
    71	
    72		ret = tsse_service_open(service_instance);
    73		if (ret) {
    74			pr_err("%s(): open service: %s failed: %d\n",
    75				__func__, service_instance->service_name, ret);
    76			kfree(service_instance);
    77			return ret;
    78		}
    79		*handle = service_instance;
    80		return 0;
    81	}
    82	EXPORT_SYMBOL_GPL(tsse_im_service_handle_alloc);
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
