Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A02923CE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 07:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678865732; x=1710401732;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Wq9KKZhjpStMaYwHob6hwfQLVY9oOfgddK2kpFMELLw=;
  b=geW69HYcR5AKN4SxLDxSW+EnsipHye0aPimdJtQWanDfVKrfQ5VR9Prs
   lcM+6/tWxPCwDNYePfrKaOagq369gqgG+TtSIHDHVMhNv+6m4HxgL43ip
   lMyKwWVsa76CjPWKCe+4+dUmqMaE46kSg1P3uJT4YDAgzWBH1Vz2WBQOO
   9iYwuKBeoVZ5m+pdQAyBF6k7Ci4dhbL+PAzVC64/fJtJrhWp7yNXDpYSB
   uNThpK6BB/6NmusCFujYwVPolnaZrtXU9kNyY6pUDt748onv/q4o9LJiM
   c7O/ok836ozHdHoMjGMwhvzelpZ8/tcjLrXKlJQR1OuCg+VIrV1BcTdIW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="321478402"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="321478402"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 00:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="853506500"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="853506500"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Mar 2023 00:35:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcLfR-0007WL-0n;
	Wed, 15 Mar 2023 07:35:25 +0000
Date: Wed, 15 Mar 2023 15:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: [linux-stable-rc:queue/5.4 13/68]
 drivers/gpu/drm/drm_edid.c:5119:28: warning: passing argument 1 of
 'is_hdmi2_sink' discards 'const' qualifier from pointer target type
Message-ID: <202303151517.bKL0wFX4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   88ec32cc649883f1cbb6e0cbdd1be0cc11314709
commit: c1a997f02bbd6d15f0eb1d921be231d4efec7064 [13/68] drm/edid: fix AVI infoframe aspect ratio handling
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230315/202303151517.bKL0wFX4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=c1a997f02bbd6d15f0eb1d921be231d4efec7064
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout c1a997f02bbd6d15f0eb1d921be231d4efec7064
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151517.bKL0wFX4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_edid.c: In function 'vic_for_avi_infoframe':
>> drivers/gpu/drm/drm_edid.c:5119:28: warning: passing argument 1 of 'is_hdmi2_sink' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    5119 |         if (!is_hdmi2_sink(connector) && vic > 64)
         |                            ^~~~~~~~~
   drivers/gpu/drm/drm_edid.c:4994:49: note: expected 'struct drm_connector *' but argument is of type 'const struct drm_connector *'
    4994 | static bool is_hdmi2_sink(struct drm_connector *connector)
         |                           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~


vim +5119 drivers/gpu/drm/drm_edid.c

7c7263a4d075fc Ville Syrjälä 2019-10-04  5109  
7c7263a4d075fc Ville Syrjälä 2019-10-04  5110  /*
c1a997f02bbd6d Jani Nikula   2023-01-04  5111   * Avoid sending VICs defined in HDMI 2.0 in AVI infoframes to sinks that
c1a997f02bbd6d Jani Nikula   2023-01-04  5112   * conform to HDMI 1.4.
c1a997f02bbd6d Jani Nikula   2023-01-04  5113   *
c1a997f02bbd6d Jani Nikula   2023-01-04  5114   * HDMI 1.4 (CTA-861-D) VIC range: [1..64]
c1a997f02bbd6d Jani Nikula   2023-01-04  5115   * HDMI 2.0 (CTA-861-F) VIC range: [1..107]
7c7263a4d075fc Ville Syrjälä 2019-10-04  5116   */
c1a997f02bbd6d Jani Nikula   2023-01-04  5117  static u8 vic_for_avi_infoframe(const struct drm_connector *connector, u8 vic)
c1a997f02bbd6d Jani Nikula   2023-01-04  5118  {
7c7263a4d075fc Ville Syrjälä 2019-10-04 @5119  	if (!is_hdmi2_sink(connector) && vic > 64)
7c7263a4d075fc Ville Syrjälä 2019-10-04  5120  		return 0;
7c7263a4d075fc Ville Syrjälä 2019-10-04  5121  
7c7263a4d075fc Ville Syrjälä 2019-10-04  5122  	return vic;
7c7263a4d075fc Ville Syrjälä 2019-10-04  5123  }
7c7263a4d075fc Ville Syrjälä 2019-10-04  5124  

:::::: The code at line 5119 was first introduced by commit
:::::: 7c7263a4d075fc94143b9b05320982e86391f61f drm/edid: Extract drm_mode_cea_vic()

:::::: TO: Ville Syrjälä <ville.syrjala@linux.intel.com>
:::::: CC: Sasha Levin <sashal@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
