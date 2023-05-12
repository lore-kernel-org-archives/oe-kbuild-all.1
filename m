Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0995138A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 09:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683882352; x=1715418352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WOVwmmOxKq5b3c3CC9bnzsuM5Sbmltxs14Lzz3+dWAM=;
  b=FyQFCmNRv4AHodUXnqUbvlQ0izWA9+a+VsrI1YPbY1e+LJFmnSVq/BH0
   aphqCu1zOs4gU6TKBDszJDLDT9VO/q6CGtls9jm37ShhvSmDMur9p6zpX
   bGhyOIlSUA0xVAUdnvx+bEqNZbfHnXLn25SoOmWXR5O2vSYvzbHkw7ZcU
   TqRFMldqggSclXlotxyKpnuYoZ2P1xGMsC9GLc4PYUmLIqTYrv4cij2+n
   KQ8qAOeZ92l4mDagslLakXYehJJXgmnWow+mHY0Bfd2qpQC+aimN/293J
   /rEtnZHT+ovYM7/UlvsXgwzkBZwMbrAinzBg90T4prs/yUVR9SlKEF1qR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="335263322"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335263322"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 02:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="650567859"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="650567859"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 May 2023 02:05:44 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxOid-0004jk-1t;
	Fri, 12 May 2023 09:05:43 +0000
Date: Fri, 12 May 2023 17:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Fan, Yugang" <yugang.fan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Sourab Gupta <sourab.gupta@intel.com>,
	Hu Beiyuan <beiyuan.hu@intel.com>,
	Mingwei Wang <mingwei.wang@intel.com>,
	Harish Krupo <harish.krupo.kps@intel.com>,
	Jeremy Compostella <jeremy.compostella@intel.com>
Subject: [intel-lts:4.19/android_t 4846/30000]
 drivers/gpu/drm/i915/i915_gem.c:521:6: warning: no previous prototype for
 'i915_gem_obj_bound_any'
Message-ID: <202305121710.bbJZ63qb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   180df1199944ebd8928f320a1bd16c8a87dba2ed
commit: 10ec55bafa1b73ded0adcb4d10c3146517be4748 [4846/30000] drm/i915: Sysfs interface to get GFX shmem usage stats per process
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230512/202305121710.bbJZ63qb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/10ec55bafa1b73ded0adcb4d10c3146517be4748
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_t
        git checkout 10ec55bafa1b73ded0adcb4d10c3146517be4748
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121710.bbJZ63qb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_gem.c:521:6: warning: no previous prototype for 'i915_gem_obj_bound_any' [-Wmissing-prototypes]
     521 | bool i915_gem_obj_bound_any(struct drm_i915_gem_object *o)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/i915_gem_obj_bound_any +521 drivers/gpu/drm/i915/i915_gem.c

   520	
 > 521	bool i915_gem_obj_bound_any(struct drm_i915_gem_object *o)
   522	{
   523		struct i915_vma *vma;
   524	
   525		list_for_each_entry(vma, &o->vma_list, obj_link)
   526			if (drm_mm_node_allocated(&vma->node))
   527				return true;
   528	
   529		return false;
   530	}
   531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
