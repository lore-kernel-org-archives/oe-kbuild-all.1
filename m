Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5FA6AB1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 19:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694030223; x=1725566223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MePHl8qsgB9USOKmWmlkG+JixJJ4b+ML5BLCC/eKrmA=;
  b=ZfpOsj35qOfieLNn4LqQMufzF2w+JK3pvn6l2uvTR9K5OBCmbpk+v4kp
   BZ+XSbl5vR5PwFGRntIK4InFzBu5gNtFvdT52rwx9qWDi00uyrTcYB08b
   yMJjktNL9yx/mRxRltGhn+2pyZvl9rHiBhoBvttnMwJKdTvtUYSFQq8k3
   bv0RKw8xY6jLVlCR8UQXOjRraVJs7motVQAWcW9ky08flEbCYsmX+NOVb
   l7lP0K3+g2vv+I0vtR7rir1KxqkkDpd+Fy5FqjkbIxa1tAs6ViwqnricA
   B6l0g/IKudya4eX8C8D/23REJ67ZSLHeJPoD6E+2zT7iQ37irQnNIhSMY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356650825"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="356650825"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 12:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="744808338"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="744808338"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Sep 2023 12:57:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdye2-0000YD-0A;
	Wed, 06 Sep 2023 19:56:58 +0000
Date: Thu, 7 Sep 2023 03:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Fan, Yugang" <yugang.fan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Sourab Gupta <sourab.gupta@intel.com>,
	Hu Beiyuan <beiyuan.hu@intel.com>,
	Mingwei Wang <mingwei.wang@intel.com>,
	Harish Krupo <harish.krupo.kps@intel.com>,
	Jeremy Compostella <jeremy.compostella@intel.com>
Subject: [intel-lts:4.19/android_s 3753/30000]
 drivers/gpu/drm/i915/i915_gem.c:521:6: warning: no previous prototype for
 'i915_gem_obj_bound_any'
Message-ID: <202309070333.kopaTjxC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yugang,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   6bfae51123c09ed71d82cfc739c5ccbeac60c4aa
commit: 10ec55bafa1b73ded0adcb4d10c3146517be4748 [3753/30000] drm/i915: Sysfs interface to get GFX shmem usage stats per process
config: i386-randconfig-003-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070333.kopaTjxC-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070333.kopaTjxC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070333.kopaTjxC-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
