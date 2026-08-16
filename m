Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F50120ADF8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 08:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786870581; cv=none; b=nZm6TjvDiz1TRUkKAXdBM7T1k5BXVzPDlsLREDHT9wN6Rw7lnEsshimBa7GFXJJ/oLEBRJho9dByr3iFaGJxqnuJOzSc8E5Jq79Cm7ROh07DsVjV2UlkH3J0gK3NW2TzCyupdvxAvuF3pP8zJ3hYOf9PZxreFzYnRSC8D/DthgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786870581; c=relaxed/simple;
	bh=EVc9oNR7AEVpYqBTTGrogkaC7grGmfVAPANz9DOwxwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F+UvW5v+nKIx2gPu0/GeqwoaN990/b9AIZKWkqby5tVVrMxUO/vB34prYVDExHR8yChnLHt+4Zpvi9DM5PWp3bAw3eLL6DnQ/vKDtBlHoNqNrZ9BN6PyMdt2oUyPDVJLp3TqUd1wVPUr5SSAzdLYyQzk+S03vUSxEBwQ5O4U4wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6y7fZEv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6y7fZEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786870579; x=1818406579;
  h=date:from:to:cc:subject:message-id;
  bh=EVc9oNR7AEVpYqBTTGrogkaC7grGmfVAPANz9DOwxwM=;
  b=C6y7fZEvDpzgxm17yDnp/IZZyNs9lPsWuo3oOc76aqHwqFkeHG7lcjKI
   dHyFjRlP0G9UYbEB750gG/yYrz3udm9G0SihLakEEdpLV/0Vkxlqdsx1O
   IG4zQQ6XaTz+NUPum3STXN5qZGTX/TfYNVauQgpJ4OoZ2wS5bnNxtJ/19
   Y3sa674laYs0jwJSriXwKN1FCeADtRSj2aF+ZsVyfx3rzerLNaTcNHDsd
   LRFPg3OhnwEWKE2O7R5+WwDGeVrHM5eGpozofq4NWUmGc6CplrorgC0j/
   zIbaEXPYf2EPw7l3qd4hWJjJ9kSxz8W0bSpSrYXxtC7D7Cz33/VckIOaT
   w==;
X-CSE-ConnectionGUID: b48ahNubTqifQWEya+HIzA==
X-CSE-MsgGUID: PoW8NMu1T+SyH3O4eqPBUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87587782"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87587782"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 01:56:18 -0700
X-CSE-ConnectionGUID: LJLXg9f0SHmgm4lgSgYdhw==
X-CSE-MsgGUID: qKq79scyT5+QCJZ0IaxvPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="268481955"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2026 01:56:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvWf9-00000000cpe-1gFq;
	Sun, 16 Aug 2026 08:56:15 +0000
Date: Sun, 16 Aug 2026 16:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [reinette:resctrl/controls_rfc_v2.2 75/88]
 drivers/resctrl/mpam_resctrl.c:1016:19: error: 'hw_ctrl' undeclared
Message-ID: <202608161654.OW8cHxE0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git resctrl/controls_rfc_v2.2
head:   e53ef7bef436e58b8b4a1ef2337330bfd8588fd4
commit: 3407e523c988cfeea969aeb210ad64b2b2cd3642 [75/88] fs/resctrl: Introduce emulated controls and control mode
config: arm64-randconfig-004-20260816 (https://download.01.org/0day-ci/archive/20260816/202608161654.OW8cHxE0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161654.OW8cHxE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161654.OW8cHxE0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/resctrl/mpam_resctrl.c: In function 'mpam_resctrl_control_init':
>> drivers/resctrl/mpam_resctrl.c:1016:19: error: 'hw_ctrl' undeclared (first use in this function)
    1016 |   INIT_LIST_HEAD(&hw_ctrl->r_ctrl.emulated_by);
         |                   ^~~~~~~
   drivers/resctrl/mpam_resctrl.c:1016:19: note: each undeclared identifier is reported only once for each function it appears in


vim +/hw_ctrl +1016 drivers/resctrl/mpam_resctrl.c

   998	
   999	static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
  1000	{
  1001		struct mpam_class *class = res->class;
  1002		struct mpam_props *cprops = &class->props;
  1003		struct rdt_resource *r = &res->resctrl_res;
  1004		struct mpam_resctrl_ctrl *mpam_ctrl;
  1005	
  1006		mpam_ctrl = kzalloc_obj(*mpam_ctrl);
  1007		if (!mpam_ctrl)
  1008			return -ENOMEM;
  1009	
  1010		switch (r->rid) {
  1011		case RDT_RESOURCE_L2:
  1012		case RDT_RESOURCE_L3:
  1013			mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_BITMAP;
  1014			mpam_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_DEF;
  1015			INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);
> 1016			INIT_LIST_HEAD(&hw_ctrl->r_ctrl.emulated_by);
  1017			__set_bit(RESCTRL_BITMAP_FLAG_SPARSE, mpam_ctrl->r_ctrl.bitmap.flags);
  1018			mpam_ctrl->r_ctrl.bitmap.cbm_len = class->props.cpbm_wd;
  1019			/* mpam_devices will reject empty bitmaps */
  1020			mpam_ctrl->r_ctrl.bitmap.min_cbm_bits = 1;
  1021	
  1022			if (r->rid == RDT_RESOURCE_L2) {
  1023				r->name = "L2";
  1024				r->ctrl_scope = RESCTRL_L2_CACHE;
  1025				r->cdp_capable = true;
  1026			} else {
  1027				r->name = "L3";
  1028				r->ctrl_scope = RESCTRL_L3_CACHE;
  1029				r->cdp_capable = true;
  1030			}
  1031	
  1032			/*
  1033			 * Which bits are shared with other ...things...  Unknown
  1034			 * devices use partid-0 which uses all the bitmap fields. Until
  1035			 * we have configured the SMMU and GIC not to do this 'all the
  1036			 * bits' is the correct answer here.
  1037			 */
  1038			mpam_ctrl->r_ctrl.bitmap.shareable_bits = resctrl_get_default_ctrlval(&mpam_ctrl->r_ctrl);
  1039			list_add(&mpam_ctrl->r_ctrl.entry, &r->controls);
  1040			r->alloc_capable = true;
  1041			break;
  1042		case RDT_RESOURCE_MBA:
  1043			r->ctrl_scope = RESCTRL_L3_CACHE;
  1044			mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_SCALAR;
  1045			mpam_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_DEF;
  1046			INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);
  1047			INIT_LIST_HEAD(&hw_ctrl->r_ctrl.emulated_by);
  1048	
  1049			r->bw_throttle_mode = THREAD_THROTTLE_UNDEFINED;
  1050			__set_bit(RESCTRL_SCALAR_FLAG_LINEAR, mpam_ctrl->r_ctrl.scalar.flags);
  1051			mpam_ctrl->r_ctrl.scalar.min = get_mba_min(cprops);
  1052			mpam_ctrl->r_ctrl.scalar.max = MAX_MBA_BW;
  1053			mpam_ctrl->r_ctrl.scalar.reset_val = MAX_MBA_BW;
  1054			mpam_ctrl->r_ctrl.scalar.gran = get_mba_granularity(cprops);
  1055			list_add(&mpam_ctrl->r_ctrl.entry, &r->controls);
  1056	
  1057			r->name = "MB";
  1058			r->alloc_capable = true;
  1059			break;
  1060		default:
  1061			return -EINVAL;
  1062		}
  1063	
  1064		return 0;
  1065	}
  1066	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
