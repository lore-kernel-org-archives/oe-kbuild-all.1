Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA4195811
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 04:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762317133; cv=none; b=oMPESpJF2Yy1KhcKtnVVWznJWlsQyLaiMX3I6yiCAQCtr16hVvEF8t7xsE+jMVOdeaj6ddi39YCsIyj7ZkSJXXbtvc2ntuaX8oapeyTiUbfYDRcmQ9C4hq2cKj3YWJB0OBXvXi84+MgFJlID9YS+LC4J+nCr7BgGzm9DlD33afk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762317133; c=relaxed/simple;
	bh=6YPbRq2/02MrzzdQ6VlUlI1Sp4tb4md8iv87spUx0WU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DgmgJ+TgB5/n3+8i1rcsRe9TkUSiptC+ldi7e/uq9rvCRwLLNnhejcwO3exA4ErYaptsiq7ODPkaDdEYNyqz1PaAkPTjeljn3NGqgcGPm/a8SJgBkuPYy7NasbyKUOxGRDXMRFBQvELw98FNQ/kOqrUZD+d6g6GSwDc98yHZ93E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a75f6Nh8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a75f6Nh8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762317131; x=1793853131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6YPbRq2/02MrzzdQ6VlUlI1Sp4tb4md8iv87spUx0WU=;
  b=a75f6Nh8dvYilQTe9bm20rY3i1E8pDxxwGm7zqBw+TSq/fdSE6vZ7KmW
   JQS2n2EEleCZtAafhwJCBCmdKgKa/Y2+guqmfk2aX/SHbmlDYaLuO10Gg
   3ZKE6UbYjZFveEIhqQ8Q0aL3XJjsoJmvNmikgeS1pIECme/B3eYKmZKEF
   /WutmRYPAUt0kAvJ0B3iIRgbBF7edpCQScGYL1Jj3nQUVPkDatEJWKDVK
   Te4EvAs93Jl8drM8b9K/2msNImMD/yd9JAXA6mwzphcrVINbJQxT9E8Sn
   jdniH96fylDm+BPZSnUU7KL6fJLfPTm+eW2Fd5bCFTsLeuqsaRPFgvA2n
   Q==;
X-CSE-ConnectionGUID: r/5kn5obQw+eecsTc0AQCQ==
X-CSE-MsgGUID: Uh6sguj9QfS9307CyTmAeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68261382"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68261382"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 20:32:09 -0800
X-CSE-ConnectionGUID: 0FYXVCNGSqqtgrBrAzALCQ==
X-CSE-MsgGUID: 0lzjA+QdTHOqLzipYosZqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="187196336"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2025 20:32:08 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGVBm-000SAT-0a;
	Wed, 05 Nov 2025 04:32:06 +0000
Date: Wed, 5 Nov 2025 12:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/ubus_entity.c:56:6:
 warning: no previous prototype for function 'ub_entity_num_free'
Message-ID: <202511051215.u37nznQt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f1418110051edb8e47923b009bbd051f7c06ad1a
commit: 8ae16d21707c9299ad950c2511508a3d3407de7a [3075/3075] ub:ubus: Support UB device enabling basic interface
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251105/202511051215.u37nznQt-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051215.u37nznQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051215.u37nznQt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/ubus/ubus_entity.c:35:19: warning: no previous prototype for function 'ub_alloc_ent' [-Wmissing-prototypes]
      35 | struct ub_entity *ub_alloc_ent(void)
         |                   ^
   drivers/ub/ubus/ubus_entity.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | struct ub_entity *ub_alloc_ent(void)
         | ^
         | static 
>> drivers/ub/ubus/ubus_entity.c:56:6: warning: no previous prototype for function 'ub_entity_num_free' [-Wmissing-prototypes]
      56 | void ub_entity_num_free(struct ub_entity *uent)
         |      ^
   drivers/ub/ubus/ubus_entity.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | void ub_entity_num_free(struct ub_entity *uent)
         | ^
         | static 
   drivers/ub/ubus/ubus_entity.c:157:5: warning: no previous prototype for function 'ub_setup_ent' [-Wmissing-prototypes]
     157 | int ub_setup_ent(struct ub_entity *uent)
         |     ^
   drivers/ub/ubus/ubus_entity.c:157:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     157 | int ub_setup_ent(struct ub_entity *uent)
         | ^
         | static 
   drivers/ub/ubus/ubus_entity.c:220:6: warning: no previous prototype for function 'ub_entity_add' [-Wmissing-prototypes]
     220 | void ub_entity_add(struct ub_entity *uent, void *ctx)
         |      ^
   drivers/ub/ubus/ubus_entity.c:220:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     220 | void ub_entity_add(struct ub_entity *uent, void *ctx)
         | ^
         | static 
   drivers/ub/ubus/ubus_entity.c:263:6: warning: no previous prototype for function 'ub_start_ent' [-Wmissing-prototypes]
     263 | void ub_start_ent(struct ub_entity *uent)
         |      ^
   drivers/ub/ubus/ubus_entity.c:263:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     263 | void ub_start_ent(struct ub_entity *uent)
         | ^
         | static 
   drivers/ub/ubus/ubus_entity.c:312:6: warning: no previous prototype for function 'ub_remove_ent' [-Wmissing-prototypes]
     312 | void ub_remove_ent(struct ub_entity *uent)
         |      ^
   drivers/ub/ubus/ubus_entity.c:312:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     312 | void ub_remove_ent(struct ub_entity *uent)
         | ^
         | static 
   drivers/ub/ubus/ubus_entity.c:343:6: warning: no previous prototype for function 'ub_stop_entities' [-Wmissing-prototypes]
     343 | void ub_stop_entities(void)
         |      ^
   drivers/ub/ubus/ubus_entity.c:343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     343 | void ub_stop_entities(void)
         | ^
         | static 
   drivers/ub/ubus/ubus_entity.c:347:6: warning: no previous prototype for function 'ub_remove_entities' [-Wmissing-prototypes]
     347 | void ub_remove_entities(void)
         |      ^
   drivers/ub/ubus/ubus_entity.c:347:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     347 | void ub_remove_entities(void)
         | ^
         | static 
   8 warnings generated.


vim +/ub_entity_num_free +56 drivers/ub/ubus/ubus_entity.c

    34	
  > 35	struct ub_entity *ub_alloc_ent(void)
    36	{
    37		struct ub_entity *uent;
    38	
    39		uent = kzalloc(sizeof(*uent), GFP_KERNEL);
    40		if (!uent)
    41			return NULL;
    42	
    43		INIT_LIST_HEAD(&uent->node);
    44		INIT_LIST_HEAD(&uent->cna_list);
    45	
    46		uent->dev.type = &ub_dev_type;
    47		uent->cna = 0;
    48	
    49		ub_entity_assign_priv_flag(uent, UB_ENTITY_DETACHED, true);
    50	
    51		return uent;
    52	}
    53	EXPORT_SYMBOL_GPL(ub_alloc_ent);
    54	
    55	static DEFINE_IDA(uent_num_ida);
  > 56	void ub_entity_num_free(struct ub_entity *uent)
    57	{
    58		ida_free(&uent_num_ida, uent->uent_num);
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
