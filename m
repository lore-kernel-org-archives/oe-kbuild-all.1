Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854E73C6A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695225477; x=1726761477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K/75zvsDjpKMnyYAaFYNNtgynQlcZBfsL1rsCnTdS3U=;
  b=JV/7W9uWxn0PMGS/1VBou7l25/vKQjRsdgp6d8ROArlafrr3f85E4CPr
   pw9ETRmA0B3riZ/Ed1YVuhcsmj99NtZVR8uMDnJ3tnCfBkVzNsXM7Lv73
   ezrwWDQbsWb3PwPxiLFwQbhyfXz4rnSrCSytXG4pbldA7pUAWv9uI+Can
   9YprNbsHZY8E7FZwDdxJfs6wwXWwZCciAxCZHktTKykOR4rq75+cKgaB7
   je4Yx90/VylAL3NpbpZkFHNwGxfkt3jZqeiYzHlsMpvHo4ms727eF/fSM
   P+fRdCFJQqdzULu2BqIJa0kk3P1zTRk1HtYKpgEitLx7aEHHO7TUcUtHk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466571397"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="466571397"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 08:57:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="816960209"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="816960209"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2023 08:57:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qizaK-0008uI-12;
	Wed, 20 Sep 2023 15:57:52 +0000
Date: Wed, 20 Sep 2023 23:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 02/37] drm/connector: hdmi: Create a custom state
Message-ID: <202309202329.qQ9TYl4e-lkp@intel.com>
References: <20230920-kms-hdmi-connector-state-v2-2-17932daddd7d@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-2-17932daddd7d@kernel.org>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-connector-Introduce-an-HDMI-connector/20230920-224045
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230920-kms-hdmi-connector-state-v2-2-17932daddd7d%40kernel.org
patch subject: [PATCH RFC v2 02/37] drm/connector: hdmi: Create a custom state
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309202329.qQ9TYl4e-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202329.qQ9TYl4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309202329.qQ9TYl4e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_atomic_state_helper.c:570: warning: Function parameter or member 'new_state' not described in '__drm_atomic_helper_connector_hdmi_reset'


vim +570 drivers/gpu/drm/drm_atomic_state_helper.c

   558	
   559	/**
   560	 * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
   561	 * @connector: DRM connector
   562	 *
   563	 * Initializes all HDMI resources from a @drm_connector_state without
   564	 * actually allocating it. This is useful for HDMI drivers, in
   565	 * combination with __drm_atomic_helper_connector_reset() or
   566	 * drm_atomic_helper_connector_reset().
   567	 */
   568	void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
   569						      struct drm_connector_state *new_state)
 > 570	{
   571	}
   572	EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
