Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF443143875
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720182578; cv=none; b=DLehN03u4l78UVV73HuMdQpzm20mr3jBK8+qdg4+0IZ8Vj4QCC2NK5H3MaIBLGIQUi2sLaNEVHYKgHPshoI+3b3HryK14725rLFNEyXClMtBcKg9vfdNwnRm+j8E9CoRQZcoRzt1M3WFwz8Wbrp1sqi2xhOoN/6pY3bENGDaeVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720182578; c=relaxed/simple;
	bh=U0zNitIvaizlJQb0ksbagGlV8veDRDv7Y9z4BZkjGRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPkkkIaLFC7qaqbBDXID5m38ldY4TEQYAzhjy6bbxJotiO20S/cE0Fv+9gIbsxk5oNeEaEY8OggWeC0teFmoX3WsA1bLpAUlabQ2jdp/zCFROf6QotmpCAZfIeT4X2AgLz4FL1NxZ8ajbsMGd2bkuf/H++AVMWKhud1R7dWywgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jt61gpMj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jt61gpMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720182577; x=1751718577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U0zNitIvaizlJQb0ksbagGlV8veDRDv7Y9z4BZkjGRA=;
  b=Jt61gpMjF8g163hz3aZjI4nkOHdKCYT72JNY8Y1Apyc39w+cFchs3zFL
   LoQMlPMJ6QCD52cNmyzA9OnvpXZgUoRieG/lAFYj5W1HisNxOgKppAbLT
   CFteE3ZSLGMerg9iCjFxuKvJ9D7mMvHZv9TN6i9CYX3ciKh48SBl/HrVu
   r51GRg7lVg2INGRiKRUqzUPD8pHVSdyYGbzou7/XN+4wrYf5P4gVWzXto
   PnktHViJVKbjyA0lQ/AYoc9bNVaHzX6FVvjuXNO6n0PrG+tQLkF32zmly
   jiSDa+/7iziz3JexwGNaOc1OCuTQ912S02xNbxABjo60bYrqQKTAMWots
   A==;
X-CSE-ConnectionGUID: pCY9D8i9S+e0SL16EOhSyg==
X-CSE-MsgGUID: Cr+E3AZkQTWwvuNu3NEgEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17580613"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="17580613"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 05:29:36 -0700
X-CSE-ConnectionGUID: BfdVpqhEQSaWXV1Gt5zmXQ==
X-CSE-MsgGUID: 59ui+2gXQfmxdnbAZB7M5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="51200053"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jul 2024 05:29:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPi4D-000SNU-0M;
	Fri, 05 Jul 2024 12:29:33 +0000
Date: Fri, 5 Jul 2024 20:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14619/15088]
 drivers/media/platform/camx/cam_cdm/cam_cdm_core_common.c:60:5: warning: no
 previous prototype for function 'cam_cdm_insert_client'
Message-ID: <202407052028.NE7Duo7c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   2166fa6b0c817630441a03552541b022f35cfc03
commit: fbdf07ea0d18954639278632f87b65f6ffc7d926 [14619/15088] CHROMIUM: media: camx: rework client refcount handling
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240705/202407052028.NE7Duo7c-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407052028.NE7Duo7c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407052028.NE7Duo7c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/camx/cam_cdm/cam_cdm_core_common.c:18:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2222:
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
>> drivers/media/platform/camx/cam_cdm/cam_cdm_core_common.c:60:5: warning: no previous prototype for function 'cam_cdm_insert_client' [-Wmissing-prototypes]
      60 | int cam_cdm_insert_client(struct cam_cdm *cdm, struct cam_cdm_client *client)
         |     ^
   drivers/media/platform/camx/cam_cdm/cam_cdm_core_common.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      60 | int cam_cdm_insert_client(struct cam_cdm *cdm, struct cam_cdm_client *client)
         | ^
         | static 
>> drivers/media/platform/camx/cam_cdm/cam_cdm_core_common.c:91:6: warning: no previous prototype for function 'cam_cdm_remove_client' [-Wmissing-prototypes]
      91 | void cam_cdm_remove_client(struct cam_cdm *cdm, u32 idx)
         |      ^
   drivers/media/platform/camx/cam_cdm/cam_cdm_core_common.c:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      91 | void cam_cdm_remove_client(struct cam_cdm *cdm, u32 idx)
         | ^
         | static 
   7 warnings generated.


vim +/cam_cdm_insert_client +60 drivers/media/platform/camx/cam_cdm/cam_cdm_core_common.c

    59	
  > 60	int cam_cdm_insert_client(struct cam_cdm *cdm, struct cam_cdm_client *client)
    61	{
    62		int ret = -EINVAL;
    63		u32 idx;
    64	
    65		/* We should be able to grab ownership */
    66		if (!cam_cdm_get_client(client))
    67			return ret;
    68	
    69		write_lock(&cdm->clients_lock);
    70		for (idx = 0; idx < CAM_PER_CDM_MAX_REGISTERED_CLIENTS; idx++) {
    71			if (cdm->clients[idx])
    72				continue;
    73	
    74			/* Found available slot */
    75			client->handle = CAM_CDM_CREATE_CLIENT_HANDLE(cdm->index, idx);
    76			cdm->clients[idx] = client;
    77			ret = 0;
    78			break;
    79		}
    80		write_unlock(&cdm->clients_lock);
    81	
    82		/*
    83		 * Did not find the slot, drop the refcount because we don't own
    84		 * the object
    85		 */
    86		if (ret)
    87			cam_cdm_put_client(client);
    88		return ret;
    89	}
    90	
  > 91	void cam_cdm_remove_client(struct cam_cdm *cdm, u32 idx)
    92	{
    93		struct cam_cdm_client *client;
    94	
    95		/* Remove from cdm clients table */
    96		write_lock(&cdm->clients_lock);
    97		client = cdm->clients[idx];
    98		cdm->clients[idx] = NULL;
    99		write_unlock(&cdm->clients_lock);
   100	
   101		/* Drop cdm ownership refcount */
   102		if (client)
   103			cam_cdm_put_client(client);
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
