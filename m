Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27634191
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 00:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692319325; x=1723855325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b00AF8wncw5hmRSIEfWdL9qxZxQfAxmAv+k1mhiZAzM=;
  b=R8aDnvPruESQMAxC8WAbCnDLzr5bMzBC1vLt5baHMPgacLGCpl5O0vny
   Ov5V5NEAkWECmCtoW7TiDTS5NC8gwL4FRIrjYVhhTI0sd00APbla+k/mJ
   SFP4ntkJtLUSFUyLxGz8oO+tSNG4uE04NzcjyOF5j1RucQhkow84PEL+l
   yk8QUza77x10nTxwXdybHY9MmkN5hF5TwenZPl/XVTloIOaQtG3Cs0Be5
   uQQcdyIu6wCnxOhoF3MnE2DWYrqGqD49worGYjG/L8eiOvVyc9LfH/p3O
   ecKK9z81M7QTjg5cGWRk5xF7dN9ZJVRG03fTs1Gu/04a/5hR0uak3JZZ6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="375754305"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="375754305"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 17:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="684658458"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="684658458"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Aug 2023 17:42:02 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWnYv-0001ZT-0y;
	Fri, 18 Aug 2023 00:42:01 +0000
Date: Fri, 18 Aug 2023 08:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Tales Aparecida <tales.aparecida@gmail.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: htmldocs: ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109:
 warning: Function parameter or member 'overlap_only' not described in
 'mpcc_blnd_cfg'
Message-ID: <202308180803.QE0R3OlP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   16931859a6500d360b90aeacab3b505a3560a3ed
commit: 33fa4f1df53076d0078be091d5a88d457de54936 Documentation/gpu/amdgpu/amdgpu_dm: add DM docs for pixel blend mode
date:   1 year ago
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180803.QE0R3OlP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180803.QE0R3OlP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'overlap_only' not described in 'mpcc_blnd_cfg'
>> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_gain_mode' not described in 'mpcc_blnd_cfg'
>> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'background_color_bpc' not described in 'mpcc_blnd_cfg'
>> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'top_gain' not described in 'mpcc_blnd_cfg'
>> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_inside_gain' not described in 'mpcc_blnd_cfg'
>> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_outside_gain' not described in 'mpcc_blnd_cfg'

vim +109 ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h

feb4a3cd8eb007f Eric Bernstein 2017-11-06   83  
43d61f6d8f4d2da Melissa Wen    2022-08-04   84  /**
43d61f6d8f4d2da Melissa Wen    2022-08-04   85   * struct mpcc_blnd_cfg - MPCC blending configuration
43d61f6d8f4d2da Melissa Wen    2022-08-04   86   *
43d61f6d8f4d2da Melissa Wen    2022-08-04   87   * @black_color: background color
43d61f6d8f4d2da Melissa Wen    2022-08-04   88   * @alpha_mode: alpha blend mode (MPCC_ALPHA_BLND_MODE)
43d61f6d8f4d2da Melissa Wen    2022-08-04   89   * @pre_multiplied_alpha: whether pixel color values were pre-multiplied by the
43d61f6d8f4d2da Melissa Wen    2022-08-04   90   * alpha channel (MPCC_ALPHA_MULTIPLIED_MODE)
43d61f6d8f4d2da Melissa Wen    2022-08-04   91   * @global_gain: used when blend mode considers both pixel alpha and plane
43d61f6d8f4d2da Melissa Wen    2022-08-04   92   * alpha value and assumes the global alpha value.
43d61f6d8f4d2da Melissa Wen    2022-08-04   93   * @global_alpha: plane alpha value
feb4a3cd8eb007f Eric Bernstein 2017-11-06   94   */
feb4a3cd8eb007f Eric Bernstein 2017-11-06   95  struct mpcc_blnd_cfg {
feb4a3cd8eb007f Eric Bernstein 2017-11-06   96  	struct tg_color black_color;	/* background color */
feb4a3cd8eb007f Eric Bernstein 2017-11-06   97  	enum mpcc_alpha_blend_mode alpha_mode;	/* alpha blend mode */
feb4a3cd8eb007f Eric Bernstein 2017-11-06   98  	bool pre_multiplied_alpha;	/* alpha pre-multiplied mode flag */
feb4a3cd8eb007f Eric Bernstein 2017-11-06   99  	int global_gain;
feb4a3cd8eb007f Eric Bernstein 2017-11-06  100  	int global_alpha;
feb4a3cd8eb007f Eric Bernstein 2017-11-06  101  	bool overlap_only;
feb4a3cd8eb007f Eric Bernstein 2017-11-06  102  
f789b0b82bf0aee Harry Wentland 2019-02-22  103  	/* MPCC top/bottom gain settings */
f789b0b82bf0aee Harry Wentland 2019-02-22  104  	int bottom_gain_mode;
f789b0b82bf0aee Harry Wentland 2019-02-22  105  	int background_color_bpc;
f789b0b82bf0aee Harry Wentland 2019-02-22  106  	int top_gain;
f789b0b82bf0aee Harry Wentland 2019-02-22  107  	int bottom_inside_gain;
f789b0b82bf0aee Harry Wentland 2019-02-22  108  	int bottom_outside_gain;
feb4a3cd8eb007f Eric Bernstein 2017-11-06 @109  };
feb4a3cd8eb007f Eric Bernstein 2017-11-06  110  

:::::: The code at line 109 was first introduced by commit
:::::: feb4a3cd8eb007f4749dc8323110f42fb4682ae0 drm/amd/display: Integrating MPC pseudocode

:::::: TO: Eric Bernstein <eric.bernstein@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
