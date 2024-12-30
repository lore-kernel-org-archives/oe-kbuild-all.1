Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2255E2AE72
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 18:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735584693; cv=none; b=Air+qeih0/Mw5uTFKqSxHagnhN6O+WG2lxRUaW4jE8c4Gj+w2RKBw0kBKOaAvXpMtWBYKask88Az4OunOGn1d8dPlJXz8hF+ykg3FPEEn/XzvBnFOFpK11HxL1EecV73ZEapgchxYyuKeaHf1qLFO4OlY2N0PpwbWrffz6FNr18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735584693; c=relaxed/simple;
	bh=FEyqLb5zS/fQkm0IB8Na1WzRE20RPjnglYrwkmkZ9ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O1vFlF3xVYNAYMuzvSk6QUGCyDGzVMENmBxcJ9cTExpO8Cp7B8+5LoVBkgi0HZOty+2UZigejwWh+ciOC/AmchBclfvYGW/Ig/m90CfBm8zdYA/d5HYfP6PkkehBOO+0mfSi67PQ542iksYhackgghhKLuIPt5jahmJaRaEDye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjzbW25X; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjzbW25X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735584691; x=1767120691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FEyqLb5zS/fQkm0IB8Na1WzRE20RPjnglYrwkmkZ9ik=;
  b=FjzbW25X/gh31PllC5QL00Vc/dDu5E2yB0aiIOWL5NMmMlqMRRwTCzXy
   cUBOJeCWPPbZglkUi7xVbRmwe6MLsc6La8ISjPiDmpKwk8sakquB6ha2J
   pi5EbyQtbfbFLDayCHywLxTe01hwHV6iQu/5bsoXn0/zEFna8zKf4z6lN
   4XPA2ftw6K7qNtXtT0Njq1POBKfJl8oALmnoFZnlGN5/50HCwwgFxMrGh
   Ia8+2E6rkkfWqbCE31/gFM4TD5mzCUABU1iEwlRSGl2kK2MmaNZczNYdr
   0VRrcigedW6fPt6AodmHgMO7mys5i1u29YFw/U24kDaAmQBXQDXtGkADD
   g==;
X-CSE-ConnectionGUID: QYPUC8eZSNqD2zSdnnrpyw==
X-CSE-MsgGUID: JPpg0I0xS7aChbQLNEjrTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35986797"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="35986797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 10:51:31 -0800
X-CSE-ConnectionGUID: Zaa7aZELRh6yvxW0rbRASA==
X-CSE-MsgGUID: B+mwbYZZT8mUi4+uifMvlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101712490"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Dec 2024 10:51:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSKrP-0006KT-18;
	Mon, 30 Dec 2024 18:51:27 +0000
Date: Tue, 31 Dec 2024 02:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2610/2610] fs/cachefiles/ondemand.c:23:25:
 warning: implicit conversion from 'enum cachefiles_obj_ref_trace' to 'enum
 fscache_obj_ref_trace'
Message-ID: <202412310256.l8FuLcbO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8bba4b17284e774544bd01d9ea5190546e93a849
commit: 2937cd5f8c58bd8e7895f6b2698057721442248e [2610/2610] cachefiles: notify the user daemon when looking up cookie
config: arm64-randconfig-004-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310256.l8FuLcbO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310256.l8FuLcbO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310256.l8FuLcbO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/cachefiles/ondemand.c: In function 'cachefiles_ondemand_fd_release':
>> fs/cachefiles/ondemand.c:23:25: warning: implicit conversion from 'enum cachefiles_obj_ref_trace' to 'enum fscache_obj_ref_trace' [-Wenum-conversion]
      23 |                         cachefiles_obj_put_ondemand_fd);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cachefiles/ondemand.c: In function 'cachefiles_ondemand_get_fd':
   fs/cachefiles/ondemand.c:145:25: warning: implicit conversion from 'enum cachefiles_obj_ref_trace' to 'enum fscache_obj_ref_trace' [-Wenum-conversion]
     145 |                         cachefiles_obj_get_ondemand_fd) ? 0 : -EAGAIN;
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cachefiles/ondemand.c:191:25: warning: implicit conversion from 'enum cachefiles_obj_ref_trace' to 'enum fscache_obj_ref_trace' [-Wenum-conversion]
     191 |                         cachefiles_obj_put_ondemand_fd);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +23 fs/cachefiles/ondemand.c

     7	
     8	static int cachefiles_ondemand_fd_release(struct inode *inode,
     9						  struct file *file)
    10	{
    11		struct cachefiles_object *object = file->private_data;
    12		int object_id = object->ondemand_id;
    13		struct cachefiles_cache *cache;
    14	
    15		cache = container_of(object->fscache.cache,
    16				     struct cachefiles_cache, cache);
    17	
    18		object->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
    19		xa_lock(&cache->ondemand_ids.idr_rt);
    20		idr_remove(&cache->ondemand_ids, object_id);
    21		xa_unlock(&cache->ondemand_ids.idr_rt);
    22		object->fscache.cache->ops->put_object(&object->fscache,
  > 23				cachefiles_obj_put_ondemand_fd);
    24		return 0;
    25	}
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
