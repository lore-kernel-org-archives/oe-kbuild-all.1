Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88FF1B0439
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762269065; cv=none; b=kKL2SBvuyNLYajs0RLfAz0jWqZJJktFyWQTkNu5v8XyDdyu7Oe19oB0R07t9qV/1tWfLf8k1UfPwo7NvSbmDwizVVQrWdVZralyUg9RMqhO6M7y5YWsKHBo39j+D1gPT0bALOOpLMm1aehq8aSA+rbLTJPf1HbBaMq5IsfwCHwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762269065; c=relaxed/simple;
	bh=FHUnPfLUytxjvqLl4q0EiyGgIBMr+tzUmSvBl5bSJEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NI1RNEeAufLvWhQjzqN4lDi7ouM3fPU07PxHxk7Vd56JFHBmhzPVmyLon2oQVdoVPmozYWS3MN85tnWUakXWbpyaKDvj+NaUlQ+8Bsv/B7a8lPaD3Oy5I7VpVmxCMcr/s/xEJyURx1WxXLlILwUgfJcXBuRF//Vb7MDa4MSEdYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RObeGaCW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RObeGaCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762269063; x=1793805063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FHUnPfLUytxjvqLl4q0EiyGgIBMr+tzUmSvBl5bSJEY=;
  b=RObeGaCWUye+JF/NXyHYvGrJI/ep8iX7MEvHW4NbWvNQUhWOyJ43v5Bo
   6HFj0exzfzyFcuFHStV45nqLgnyanoUqm8REszgpCVTSxGuXIqpuHGT3C
   Mr3zZw96zWujUTaS9avNYB5KhWQnCxp34zZ6FT5pJlYwkNUHMOGoo9nIu
   3VGNKL8oQIzjOfRqV5gyZaWcMftxvJV4z1qZIeWxJllZd42Pdo0+rlpx2
   lCXH6eg/gN9XSxLFX8Nnf1UzXmfVKS2XYP+SOd1RiAkAYy5e0t96bdZRG
   vGjKs1N3s82QA/BC2xt2VNjUK0SzkG6axknVYYhhMF7SoRxIZr2CBBNya
   w==;
X-CSE-ConnectionGUID: xDYM+RdES7a+4++9mupgEQ==
X-CSE-MsgGUID: Y6MMyzwIS4K6N/Tw91tLjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68201738"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68201738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 07:11:03 -0800
X-CSE-ConnectionGUID: hG1LgpNmRTKMwYdOMRD1MA==
X-CSE-MsgGUID: QpTp3rEnSzqM94icQRrnpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="186858541"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2025 07:11:01 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGIgU-000RWt-2i;
	Tue, 04 Nov 2025 15:10:58 +0000
Date: Tue, 4 Nov 2025 23:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/enum.c:1332:5:
 warning: no previous prototype for function 'ub_enum_entities_active'
Message-ID: <202511042359.TcIxX2CV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   25097b0e8b7a08363a1cba931a5762548a3b0e16
commit: e7af929fc0444491fa5f13a00c3f576ea5a4b923 [3075/3075] ub:ubus: Supports device enumeration.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251104/202511042359.TcIxX2CV-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511042359.TcIxX2CV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511042359.TcIxX2CV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/ubus/enum.c:996:5: warning: no previous prototype for function 'ub_cfg_read_guid' [-Wmissing-prototypes]
     996 | int ub_cfg_read_guid(struct ub_entity *uent)
         |     ^
   drivers/ub/ubus/enum.c:996:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     996 | int ub_cfg_read_guid(struct ub_entity *uent)
         | ^
         | static 
   drivers/ub/ubus/enum.c:1097:6: warning: no previous prototype for function 'ub_enum_clear_ent_list' [-Wmissing-prototypes]
    1097 | void ub_enum_clear_ent_list(struct list_head *dev_list)
         |      ^
   drivers/ub/ubus/enum.c:1097:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1097 | void ub_enum_clear_ent_list(struct list_head *dev_list)
         | ^
         | static 
>> drivers/ub/ubus/enum.c:1332:5: warning: no previous prototype for function 'ub_enum_entities_active' [-Wmissing-prototypes]
    1332 | int ub_enum_entities_active(struct list_head *dev_list)
         |     ^
   drivers/ub/ubus/enum.c:1332:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1332 | int ub_enum_entities_active(struct list_head *dev_list)
         | ^
         | static 
   3 warnings generated.


vim +/ub_enum_entities_active +1332 drivers/ub/ubus/enum.c

  1331	
> 1332	int ub_enum_entities_active(struct list_head *dev_list)
  1333	{
  1334		struct ub_entity *uent, *tmp;
  1335		int ret;
  1336	
  1337		list_for_each_entry_safe(uent, tmp, dev_list, node) {
  1338			if (uent->entity_idx != 0)
  1339				continue;
  1340	
  1341			ub_route_sync_dev(uent);
  1342			ret = ub_setup_ent(uent);
  1343			if (ret) {
  1344				pr_err("setup dev err, ret=%d\n", ret);
  1345				return ret;
  1346			}
  1347	
  1348			list_del(&uent->node);
  1349			ub_entity_add(uent, uent->ubc);
  1350			ub_start_ent(uent);
  1351		}
  1352	
  1353		return 0;
  1354	}
  1355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
