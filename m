Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9B118052
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 17:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727891371; cv=none; b=H/MsgJZnZVoRM04IX0zCRYYVjOXVu+twhzigGKypzGzXBoGrTvOfPYm5qmwGs6xZLVtcHSjUhVxEOSAwkiEhjqJYDxW0XuJDCzAzaUavkyyYw9MOuFI213xt0i32ms3aOlydHfi7rW0WryzFv1OQOUXe/irbQV/pwg9MdZnrrVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727891371; c=relaxed/simple;
	bh=4pJ5L6igSG0TiJU/zaWFOKiOEsL+CLCralIcj3N2Y40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DQbrzl/kDts8E2OX35UmVi2HzAEXcLXh4L4PRiVDkhIUJ/6n8m7G3a68ndSMt4fSJmgNDnZjXMeS7fyji1o1AnnR19IMuv5sdHREBMrwpmej35f4zWi8FAhEFCn5IhqgfdnmKKceBBeCPWL/Mxjc1P3CaYXvOUyR3qtQG+hbac4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiyZAtdU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiyZAtdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727891369; x=1759427369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4pJ5L6igSG0TiJU/zaWFOKiOEsL+CLCralIcj3N2Y40=;
  b=jiyZAtdUzuVzG0M/MuT69fmjZOxZC97WEs/gs7olrHycR5Eaj0BiIbXI
   /+8eJj5h7cUu01kyKJNHLnBuACR+qOfjBljl26MfUPG7ZcRb6z3zerMaL
   KZEBBR7pJD8x9Ih9M1vaevDPzkTDlYUQAmtKIh0pdbuQTNF87Mi01F/Wo
   6n+ufXxecVZmfvPyBMDhtSM6EeT05uOtc7OXHusE1YGjlMuYMNB8p/IrH
   XktvnZC0hazd5Y3B/mrX1BPTJ21ZjxlzrUXZU80m0mAYJLQNm0Jgi6NB4
   2WW2P0gS/Xx2FQLMG3Ce4sDkPYH0Ced22GTOLc1Fsf/pGY3qGah1o847e
   Q==;
X-CSE-ConnectionGUID: xGdpgRoiQv6wOgy43RRVbg==
X-CSE-MsgGUID: J3TAPFFfT5qebsATGLZe2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27196830"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="27196830"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 10:49:29 -0700
X-CSE-ConnectionGUID: 0U5+rkjIR4yPDWRK72psWA==
X-CSE-MsgGUID: F7pqKTXPQGa7HSVqdYfW1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="73659149"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2024 10:49:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw3TZ-000UM3-1V;
	Wed, 02 Oct 2024 17:49:25 +0000
Date: Thu, 3 Oct 2024 01:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15308/20658]
 drivers/media/platform/camx/cam_cdm/cam_cdm_core_common.c:60:5: warning: no
 previous prototype for function 'cam_cdm_insert_client'
Message-ID: <202410030114.oeI09ztp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sergey,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   a81f127d7432274edb73f16568b5b097fca99d2a
commit: fbdf07ea0d18954639278632f87b65f6ffc7d926 [15308/20658] CHROMIUM: media: camx: rework client refcount handling
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241003/202410030114.oeI09ztp-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030114.oeI09ztp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030114.oeI09ztp-lkp@intel.com/

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
