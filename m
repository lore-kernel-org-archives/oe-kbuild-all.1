Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7072263C0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 12:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694090647; x=1725626647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DN449QJfvm8pf85lHnIDQADsOU4GgWGIbyqWzxA9aWk=;
  b=Wxzfud/jcED2HjKDpRFC+pWpDslVqaZWtpSGbDe0S3Tecowbsz+N+81L
   NshMu3u1ZwWXVZC6ujyWHg8Hkd1UWhB+PJUIrT3dHOGGlZDez2NcCDE9K
   3DNtXZo9D/jzC8aBE5CaVmrYS75ETw946GVjAsx1yL6G8I/cY2vzu0TNn
   i0amOEcfhYJfNbsk/6l6xrn/ydr0DJrCpY4QcCkr+EOFR8s+1+qesk8R6
   48UPEehNOkCd531ODMQisK2eXpkKX+52VkRKyGq9qhoNmh4EI9HKhSwRg
   dXZRyX/V3+66r0vDlmOohf5s0lcer7Mf2IsvDm4WSHZMyACAE/LF+12Rk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377256450"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="377256450"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 05:44:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="777053881"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="777053881"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2023 05:44:04 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeEMc-0001EH-19;
	Thu, 07 Sep 2023 12:44:02 +0000
Date: Thu, 7 Sep 2023 20:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Run relevant bits of debugfs
 drop_caches per GT
Message-ID: <202309072025.Gx2nDzVd-lkp@intel.com>
References: <20230907101135.176326-1-andi.shyti@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907101135.176326-1-andi.shyti@linux.intel.com>

Hi Andi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Andi-Shyti/drm-i915-Run-relevant-bits-of-debugfs-drop_caches-per-GT/20230907-181322
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230907101135.176326-1-andi.shyti%40linux.intel.com
patch subject: [Intel-gfx] [PATCH v2] drm/i915: Run relevant bits of debugfs drop_caches per GT
config: i386-randconfig-013-20230907 (https://download.01.org/0day-ci/archive/20230907/202309072025.Gx2nDzVd-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309072025.Gx2nDzVd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309072025.Gx2nDzVd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_debugfs.c:36:0:
   drivers/gpu/drm/i915/i915_debugfs.c: In function 'i915_drop_caches_set':
   drivers/gpu/drm/i915/gt/intel_gt.h:170:14: error: comparison between pointer and integer [-Werror]
          (id__) < I915_MAX_GT; \
                 ^
   drivers/gpu/drm/i915/i915_debugfs.c:751:2: note: in expansion of macro 'for_each_gt'
     for_each_gt(i915, i, gt) {
     ^~~~~~~~~~~
   In file included from include/drm/drm_connector.h:32:0,
                    from drivers/gpu/drm/i915/display/intel_display_core.h:16,
                    from drivers/gpu/drm/i915/i915_drv.h:40,
                    from drivers/gpu/drm/i915/gt/intel_context.h:14,
                    from drivers/gpu/drm/i915/gem/i915_gem_context.h:12,
                    from drivers/gpu/drm/i915/i915_debugfs.c:35:
>> drivers/gpu/drm/i915/gt/intel_gt.h:172:33: error: invalid type argument of '->' (have 'unsigned int')
      for_each_if(((gt__) = (i915__)->gt[(id__)]))
                                    ^
   include/drm/drm_util.h:63:38: note: in definition of macro 'for_each_if'
    #define for_each_if(condition) if (!(condition)) {} else
                                         ^~~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs.c:751:2: note: in expansion of macro 'for_each_gt'
     for_each_gt(i915, i, gt) {
     ^~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +172 drivers/gpu/drm/i915/gt/intel_gt.h

bec68cc9ea42d8 Tvrtko Ursulin 2022-03-19  167  
bec68cc9ea42d8 Tvrtko Ursulin 2022-03-19  168  #define for_each_gt(gt__, i915__, id__) \
bec68cc9ea42d8 Tvrtko Ursulin 2022-03-19  169  	for ((id__) = 0; \
bec68cc9ea42d8 Tvrtko Ursulin 2022-03-19  170  	     (id__) < I915_MAX_GT; \
bec68cc9ea42d8 Tvrtko Ursulin 2022-03-19  171  	     (id__)++) \
bec68cc9ea42d8 Tvrtko Ursulin 2022-03-19 @172  		for_each_if(((gt__) = (i915__)->gt[(id__)]))
bec68cc9ea42d8 Tvrtko Ursulin 2022-03-19  173  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
