Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D818030
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 22:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiPb/+Wu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700086243; x=1731622243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6tRvPeOGs7blv74sc85I2RruT56RJd6yw+LZJ5wnFwg=;
  b=IiPb/+WuVCRIrTYSujiWIowMrBauc3xIq/SCXVUNZMhC6QGTaQu1uXSu
   PpHmagZMVrpTag0uH/ND8zsh5vhmB7nLwRHXXRXr1a6CnOR0wx5zbtHwX
   67+tpVaK+j3xiWtJ/WZOTFQL2e8LeZ/TMWZYNdwTZxSoLNBemtuXQCUZq
   IjwtksBPrvgX/RDgOIYSwSkHKOlCIeVFMx0NILXN5U/BRPm86BOTlJm+9
   GxIw0RZBgoM9LAPo9cA4LIMZCF+B0t/z77ntuRxoRP2ZaGs8C0m9yrEWz
   DrXkNSJVNlIm0XhPtrphiREIdW2sRrMBJq21EpxaPm4lCWj8WYpaqNQ9A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12518796"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="12518796"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 14:10:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765107992"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="765107992"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Nov 2023 14:10:39 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3O5l-0000tg-1H;
	Wed, 15 Nov 2023 22:10:37 +0000
Date: Thu, 16 Nov 2023 06:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:hdmi-dbg 32/33] or1k-linux-ld:
 drm_atomic_state_helper.c:undefined reference to
 `drm_hdmi_avi_infoframe_content_type'
Message-ID: <202311160625.Q8wdUev0-lkp@intel.com>
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
commit: db9c565cb7766e9a0bbb4edd9dc03cdf0310bff8 [32/33] vc4: add content type support
config: openrisc-virt_defconfig (https://download.01.org/0day-ci/archive/20231116/202311160625.Q8wdUev0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160625.Q8wdUev0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160625.Q8wdUev0-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `drm_atomic_helper_connector_hdmi_check':
   drm_atomic_state_helper.c:(.text+0x1f60): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
   drm_atomic_state_helper.c:(.text+0x1f60): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_hdmi_avi_infoframe_colorimetry'
   or1k-linux-ld: drm_atomic_state_helper.c:(.text+0x1f6c): undefined reference to `drm_hdmi_avi_infoframe_bars'
   drm_atomic_state_helper.c:(.text+0x1f6c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_hdmi_avi_infoframe_bars'
>> or1k-linux-ld: drm_atomic_state_helper.c:(.text+0x1f78): undefined reference to `drm_hdmi_avi_infoframe_content_type'
   drm_atomic_state_helper.c:(.text+0x1f78): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_hdmi_avi_infoframe_content_type'
   or1k-linux-ld: drm_atomic_state_helper.c:(.text+0x1fd0): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'
   drm_atomic_state_helper.c:(.text+0x1fd0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_hdmi_infoframe_set_hdr_metadata'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM_DISPLAY_HELPER [=n]
   Selected by [y]:
   - DRM_KMS_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
