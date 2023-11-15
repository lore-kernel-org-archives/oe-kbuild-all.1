Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED7B1A707
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 13:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANFvcNiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700055350; x=1731591350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oevVv3YMWJgRFZ9dan46FvJECfmbn1LhI/1QGXyKk7Q=;
  b=ANFvcNiRf8ZPjuCTwShw7xFtwNgoJUnpL2XlvV4iCIgUt+pu1DyVfdw4
   npRxslAfZDx/C0Zj2eaahwQ4DubqDVmO0jeAjLKgtokoiqPM04x+E/TAb
   gUdoMS1B2zIFf+EEhyF8bVAzE9m8HGqSvA0wwQKgL+2MnE/G3tqlZJpoI
   gfieCwNm16vBoI3Laap2KM1PbBsgyt9hHIcMH81YCLD2+geovq/KugEPZ
   546+5E4rChv3cDzzhLSA9lXZbjfK4NkPbBXoBEvEevQGJjvH7YYe/XLQY
   KM1W42wpOUGCNx3nlwOS/ZSK2m3rEmdxLQGis60Tn1Y1QpnHi8JHsqkPm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393732321"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="393732321"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:35:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="6404696"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Nov 2023 05:35:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3G3T-0000MY-0e;
	Wed, 15 Nov 2023 13:35:43 +0000
Date: Wed, 15 Nov 2023 21:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:hdmi-dbg 27/33] m68k-linux-ld:
 drm_atomic_state_helper.c:undefined reference to
 `drm_hdmi_avi_infoframe_bars'
Message-ID: <202311152125.dbfniW3l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   509acd58c8dd0202ccdbb861ede858e4975b42c4
commit: a7a7b6b700693e86f08273e8816a91d86583cd3f [27/33] drm/connector: hdmi: Add Infoframes generation
config: m68k-virt_defconfig (https://download.01.org/0day-ci/archive/20231115/202311152125.dbfniW3l-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152125.dbfniW3l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152125.dbfniW3l-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `drm_atomic_helper_connector_hdmi_check':
   drm_atomic_state_helper.c:(.text+0x1554): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
>> m68k-linux-ld: drm_atomic_state_helper.c:(.text+0x155e): undefined reference to `drm_hdmi_avi_infoframe_bars'
>> m68k-linux-ld: drm_atomic_state_helper.c:(.text+0x15a8): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM_DISPLAY_HELPER [=n]
   Selected by [y]:
   - DRM_KMS_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
