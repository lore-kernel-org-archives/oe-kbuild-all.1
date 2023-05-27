Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F944384
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 05:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685164074; x=1716700074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pIqLUp5zJsHAOWCa4aV7tMYozhAzkicSePRMB0tP8LQ=;
  b=ezI8X9xU1w2eEmv4bp7BfQBP0oHbNE2OzGXhZxE6RMCSrjE3ArdjZnNF
   9v9CyZ3axWsWdekVJn4JrewdVW7GWzy5DMXpoub6zPNre5NCncJy5AMD5
   3q4XPP1NRMCUF3SEf6L5wH/SBrtieiYNYmJuyTN1yWAAbu/Ni+GJQ4RIj
   1zeg0b3OD9qXO5QUOxGKWjnAoG80145pjE1eSZgA8Hl0BsaLrbDYER6DK
   6kaAaN6hhyvRUEGpnQbL3tyb8r4seGH+lZVOILzoiV0X9Ws4aqac/l4T2
   3MvFdU2Dfd4ZJzIxzEjqjvVbefwkoIlxNXOhP52fW7yBh7xezanUKAydw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382615369"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="382615369"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 22:07:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="817764715"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="817764715"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 May 2023 22:07:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2m9g-000JmU-0H;
	Sat, 27 May 2023 05:07:52 +0000
Date: Sat, 27 May 2023 13:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/7] drm/i915/huc: differentiate the 2 steps of the
 MTL HuC auth flow
Message-ID: <202305271233.h1MUODDM-lkp@intel.com>
References: <20230527005242.1346093-5-daniele.ceraolospurio@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230527005242.1346093-5-daniele.ceraolospurio@intel.com>

Hi Daniele,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniele-Ceraolo-Spurio/drm-i915-uc-perma-pin-firmwares/20230527-085429
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230527005242.1346093-5-daniele.ceraolospurio%40intel.com
patch subject: [PATCH v3 4/7] drm/i915/huc: differentiate the 2 steps of the MTL HuC auth flow
config: x86_64-randconfig-a001-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271233.h1MUODDM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/5e7ad1c45a6cbb80d8b9f71212d410d19bbe96d9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniele-Ceraolo-Spurio/drm-i915-uc-perma-pin-firmwares/20230527-085429
        git checkout 5e7ad1c45a6cbb80d8b9f71212d410d19bbe96d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271233.h1MUODDM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c: In function 'intel_pxp_gsccs_is_ready_for_sessions':
>> drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:199:13: error: too few arguments to function 'intel_huc_is_authenticated'
     199 |         if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:14,
                    from drivers/gpu/drm/i915/gt/intel_gt_types.h:19,
                    from drivers/gpu/drm/i915/gt/intel_engine.h:18,
                    from drivers/gpu/drm/i915/i915_drv.h:46,
                    from drivers/gpu/drm/i915/gt/intel_context.h:14,
                    from drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:8:
   drivers/gpu/drm/i915/gt/uc/intel_huc.h:60:6: note: declared here
      60 | bool intel_huc_is_authenticated(struct intel_huc *huc,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/intel_huc_is_authenticated +199 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c

dc9ac125d81faf Alan Previn 2023-05-11  188  
99afb7cc8c4457 Alan Previn 2023-05-11  189  bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
99afb7cc8c4457 Alan Previn 2023-05-11  190  {
99afb7cc8c4457 Alan Previn 2023-05-11  191  	/*
99afb7cc8c4457 Alan Previn 2023-05-11  192  	 * GSC-fw loading, HuC-fw loading, HuC-fw authentication and
99afb7cc8c4457 Alan Previn 2023-05-11  193  	 * GSC-proxy init flow (requiring an mei component driver)
99afb7cc8c4457 Alan Previn 2023-05-11  194  	 * must all occur first before we can start requesting for PXP
99afb7cc8c4457 Alan Previn 2023-05-11  195  	 * sessions. Checking for completion on HuC authentication and
99afb7cc8c4457 Alan Previn 2023-05-11  196  	 * gsc-proxy init flow (the last set of dependencies that
99afb7cc8c4457 Alan Previn 2023-05-11  197  	 * are out of order) will suffice.
99afb7cc8c4457 Alan Previn 2023-05-11  198  	 */
99afb7cc8c4457 Alan Previn 2023-05-11 @199  	if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc) &&
99afb7cc8c4457 Alan Previn 2023-05-11  200  	    intel_gsc_uc_fw_proxy_init_done(&pxp->ctrl_gt->uc.gsc))
99afb7cc8c4457 Alan Previn 2023-05-11  201  		return true;
99afb7cc8c4457 Alan Previn 2023-05-11  202  
99afb7cc8c4457 Alan Previn 2023-05-11  203  	return false;
99afb7cc8c4457 Alan Previn 2023-05-11  204  }
99afb7cc8c4457 Alan Previn 2023-05-11  205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
