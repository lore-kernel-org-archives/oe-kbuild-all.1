Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC9D56458
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715764722; cv=none; b=J2yndOUZUM3oQqImPvkGc+x4NMM4NXeFB/LUknTqbfJXY8sllo4/BEVPxsm7yET0RyU5cdWCjbWWTv3U53XCpqLfZVmjo02Hex7M7HL7nF4zWmavxuvWVYJI7QjCe7kUOQd3BYGNWxd0cpacX6F4GkzcncF0qqzedyuoz6dkrgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715764722; c=relaxed/simple;
	bh=8PXGjSG26QDi1HKQbru3L60pNTfrwXDlGWJFHe6JZFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CVjsoWvxPddJgRgNc0t7xKA+BT4XNGU1am2M92qOMBbZGG0gRo6sS19qa/wuGyJ4VAdepfphPT22dEHwO3gWufLh+gEo77nn8rRWREkp5YfbR+f7TLytMUWzoh+MY1rLV12a4+G7DNyO+ELgxJ0p3PneRPE0YJeW5MyDDeDExtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4wLEsZA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4wLEsZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715764720; x=1747300720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8PXGjSG26QDi1HKQbru3L60pNTfrwXDlGWJFHe6JZFg=;
  b=G4wLEsZAIrMe8H5EHe0F/f252X1ZZ1MGUe9SXKG2DSWh+KC4hkXVQ12D
   Eb8r2rLfWFBv+t6mRY0kuNDVA8VKE4j5RhJqeDuPuJj0QNpBd/PW6dZ3Z
   E251bn1EyXs2wDYLrrPO//yOObhaB5Bs7miab4Th3T7csZ90voTYUWBn1
   P2KSraO4Uj2i56GS/qpOO5BJDDBZTUhx/t2/XCyaK10TNe4XthfL7JBET
   ABVNgopR+CkFnwLNPT6FbWe0f7nTF+D4/tUb85cWmdd27n3GNI/E6tgML
   +q6UJS23xA00tl6QW2aCx8+pMuU7s8D8jmQ4s1kG9nb1BelYZYe2DgpLT
   Q==;
X-CSE-ConnectionGUID: KbX4z5XgSLeluNUZSWSA5A==
X-CSE-MsgGUID: h8JNAN+KT/ScTp/1EvzK3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="29290928"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="29290928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 02:18:39 -0700
X-CSE-ConnectionGUID: 6QjWZSH8RzC5pGl+i4bRZA==
X-CSE-MsgGUID: tFom/lAbRGi0UPaOqOe+tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="68442585"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 May 2024 02:18:36 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7AmP-000CfT-1m;
	Wed, 15 May 2024 09:18:33 +0000
Date: Wed, 15 May 2024 17:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6600/6620]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous
 prototype for 'tdm_service_run'
Message-ID: <202405151714.tlir9g5b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   24bcde27d3b11d99cdceaa28d2ba6213e1678e90
commit: ba47bd6dc7b834ca6a02ad51205a862009981bfa [6600/6620] newfeature:crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240515/202405151714.tlir9g5b-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405151714.tlir9g5b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405151714.tlir9g5b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous prototype for 'tdm_service_run' [-Wmissing-prototypes]
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: warning: no previous prototype for 'tdm_service_exit' [-Wmissing-prototypes]
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~~


vim +/tdm_service_run +151 drivers/crypto/ccp/hygon/tdm-kernel-guard.c

   150	
 > 151	int tdm_service_run(struct tdm_security_enhance *data)
   152	{
   153		int ret = 0;
   154		struct addr_range_info *addr_range = NULL;
   155	
   156		// Allocate memory for addr_range
   157		addr_range = kzalloc(sizeof(struct addr_range_info) + sizeof(struct addr_info), GFP_KERNEL);
   158		if (!addr_range) {
   159			ret = -DYN_ERR_MEM;
   160			pr_err("addr_range kzalloc memory failed\n");
   161			goto end;
   162		}
   163	
   164		// Fill in addr_range
   165		addr_range->count = 1;
   166		addr_range->addr[0].addr_start = data->vaddr;
   167		addr_range->addr[0].length = data->size;
   168		data->mem_range = addr_range;
   169	
   170		// Context configuration
   171		data->context |= TASK_CREATE_VADDR;
   172	
   173		// Allocate memory for authcode
   174		data->authcode = kzalloc(sizeof(struct authcode_2b) + AUTHCODE_MAX, GFP_KERNEL);
   175		if (!data->authcode) {
   176			ret = -DYN_ERR_MEM;
   177			pr_err("authcode_2b kzalloc memory failed\n");
   178			goto free_addr_range_info;
   179		}
   180	
   181		data->authcode->len = AUTHCODE_MAX;
   182	
   183		// Measurement data configuration
   184		data->mdata.hash_algo = HASH_ALGO_SM3;
   185		data->mdata.period_ms = 0;
   186		ret = calc_expected_hash((uint8_t *)data->vaddr, data->size,
   187			data->mdata.expected_measurement);
   188		if (ret) {
   189			pr_err("calculate expected hash failed!\n");
   190			goto free_authcode;
   191		}
   192	
   193		// Create and start tdm task
   194		ret = tdm_task_create_and_run(data);
   195		if (ret) {
   196			pr_err("tdm_task_create_and_run failed!\n");
   197			goto free_authcode;
   198		}
   199	
   200		return ret;
   201	
   202	free_authcode:
   203		kfree(data->authcode);
   204		data->authcode = NULL;
   205	free_addr_range_info:
   206		kfree(data->mem_range);
   207		data->mem_range = NULL;
   208	end:
   209		return ret;
   210	}
   211	
 > 212	int tdm_service_exit(struct tdm_security_enhance *data)
   213	{
   214		int ret = 0;
   215		int task_status = 0;
   216	
   217		task_status = psp_startstop_measure_task(data->task_id, data->authcode, false);
   218		if (task_status < 0) {
   219			ret = task_status;
   220			pr_err("task_id %d stop failed with 0x%x\n", data->task_id, ret);
   221			goto end;
   222		}
   223	
   224		// Waiting for the task to end
   225		msleep(40);
   226	
   227		psp_destroy_measure_task(data->task_id, data->authcode);
   228	
   229		kfree(data->authcode);
   230		data->authcode = NULL;
   231		kfree(data->mem_range);
   232		data->mem_range = NULL;
   233	end:
   234		return ret;
   235	}
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
