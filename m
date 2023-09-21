Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3745D622
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 00:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695257928; x=1726793928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ygeiWvGpDfIBU4ea33y5AuqxKTQycKWf5fxKhFSx1yI=;
  b=PmJ+7dBvFFO5Hh0006jmD0t4AdwX4pyyt7DKto2cEdoULTQ/CKcUZsbN
   QpJoZftF5s5Ye8Im1o9Ql4FjmfJ4QOGAXAX6v2AkPXTSLurJC5iE6B4lw
   wQ1wo7LiBKzl7wXhHpKu60lkBNML78cJGQANfDA6Gg7rarjQi4StSeWOD
   vXb6ZmJpuB9h9UJFlkdPvL6F6z7pUYpjsL8JeinU77NwRgsRoVYHNNYki
   hGbhh5TfcS+cRw2j1A5cN53bVt82WVZVxj8utdoKzhMyTfsYOHu5Z8CjV
   muYgKFb9JMJz01R9edcCOs1qjSji+Tjg+tITzafzk3KxMv8vfSKpaHIKm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379263384"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="379263384"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 17:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="776222006"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="776222006"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 20 Sep 2023 17:58:45 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj81j-0009Lo-0y;
	Thu, 21 Sep 2023 00:58:43 +0000
Date: Thu, 21 Sep 2023 08:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 11/37] drm/connector: hdmi: Add Infoframes
 generation
Message-ID: <202309210850.pGUBBwfW-lkp@intel.com>
References: <20230920-kms-hdmi-connector-state-v2-11-17932daddd7d@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-11-17932daddd7d@kernel.org>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-connector-Introduce-an-HDMI-connector/20230920-224045
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230920-kms-hdmi-connector-state-v2-11-17932daddd7d%40kernel.org
patch subject: [PATCH RFC v2 11/37] drm/connector: hdmi: Add Infoframes generation
config: arm-u8500_defconfig (https://download.01.org/0day-ci/archive/20230921/202309210850.pGUBBwfW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210850.pGUBBwfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210850.pGUBBwfW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `drm_atomic_helper_connector_hdmi_check':
   drm_atomic_state_helper.c:(.text+0x1618): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
>> arm-linux-gnueabi-ld: drm_atomic_state_helper.c:(.text+0x1624): undefined reference to `drm_hdmi_avi_infoframe_bars'
>> arm-linux-gnueabi-ld: drm_atomic_state_helper.c:(.text+0x1670): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM_DISPLAY_HELPER [=n]
   Selected by [y]:
   - DRM_KMS_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
