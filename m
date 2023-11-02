Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ABC1DA2B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrqmOtgl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698944795; x=1730480795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KGXZNQdNlQDMcJNzMtG7Bfg6wKgkTbhSTuSJg4hnkYo=;
  b=SrqmOtglGBbAytEZVYO/Os4fZFNkzCA2tZbhK51NU3PtX0IM5RBbB8hf
   FbqsHnAZNSxqLPChWxEyuHc8OE/tg/PvH2RQhAGCFBRGacYS9mRmW/Cuv
   QruHMkkT4kokGadRbXTyqYeuNVctNgVg6nSd9Rm4M6+Kn/i34qnXBQXDh
   6pcY1bTFJAEj3JnquLt3sQ1Xhlt1gqB65SrU53aTgmYBZT/aBEK+s2O8K
   h6YGWuTpANp7DzOb4BDOirPYD8AgbBFlMtwFMspWsvDxI1KD2DszgJV5g
   xINGbB+4VpvzXoKfY3RCdOx6AFkEH3uynIN4gwMYOFKBlA5Y83chX4h8/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="455244873"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="455244873"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 10:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="2612252"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2023 10:06:34 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyb9L-0001h6-2a;
	Thu, 02 Nov 2023 17:06:31 +0000
Date: Fri, 3 Nov 2023 01:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:vc4 32/33] ld:
 drivers/gpu/drm/drm_atomic_state_helper.c:921: undefined reference to
 `drm_hdmi_avi_infoframe_content_type'
Message-ID: <202311030007.uNAf7ELQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git vc4
head:   814eee0fb2a10f00039cef7db9679ae37117e486
commit: 4c402993001a6dca9b8d2795fddf4098bfdfe5a2 [32/33] vc4: add content type support
config: x86_64-randconfig-012-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030007.uNAf7ELQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030007.uNAf7ELQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030007.uNAf7ELQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `hdmi_generate_avi_infoframe':
   drivers/gpu/drm/drm_atomic_state_helper.c:919: undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
   ld: drivers/gpu/drm/drm_atomic_state_helper.c:920: undefined reference to `drm_hdmi_avi_infoframe_bars'
>> ld: drivers/gpu/drm/drm_atomic_state_helper.c:921: undefined reference to `drm_hdmi_avi_infoframe_content_type'
   ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `hdmi_generate_hdr_infoframe':
   drivers/gpu/drm/drm_atomic_state_helper.c:965: undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM_DISPLAY_HELPER [=n]
   Selected by [y]:
   - DRM_KMS_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
