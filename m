Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1677433C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWyTh/H7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700063446; x=1731599446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gjn6jxrMdxq8yoKHYH5dRdwnEBFNbjJnz86sE+Ks7e8=;
  b=EWyTh/H7rlF6NuHfHqICZoxtt16rv6exP1+eA5L8snIvFbAFa2guos/0
   w2wejA7eeImOzalXEjjDKcntAovL65I/io1ucB/CfWXreob+b2RC1duvF
   S5hTlQWotilgDoMnMB7CkscqlbVQ4DBUuNPVahp7C0rvOLTeCZt68teV7
   g9QiXO7yA/4FIJktf3i+hIGej73Cm2Td4sSxvefekVxiXsJIvC9b+LRkr
   a+063MkhjnoPDp4BmUQgTWKLXy3UaO/m3fSjOJfITy+ZeaM9la7Sb+RK7
   2phSPsdSozVbIxZVHgZw+cn/PPtLBxloK103xQYKqwqPVnnLb7U+B0B/G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477119242"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="477119242"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 07:50:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908818538"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="908818538"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 07:50:42 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3IA4-0000Ul-12;
	Wed, 15 Nov 2023 15:50:40 +0000
Date: Wed, 15 Nov 2023 23:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:hdmi-dbg 32/33] m68k-linux-ld:
 drm_atomic_state_helper.c:undefined reference to
 `drm_hdmi_avi_infoframe_content_type'
Message-ID: <202311152356.63J12KJN-lkp@intel.com>
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
config: m68k-virt_defconfig (https://download.01.org/0day-ci/archive/20231115/202311152356.63J12KJN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152356.63J12KJN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152356.63J12KJN-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `drm_atomic_helper_connector_hdmi_check':
   drm_atomic_state_helper.c:(.text+0x1554): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
   m68k-linux-ld: drm_atomic_state_helper.c:(.text+0x155e): undefined reference to `drm_hdmi_avi_infoframe_bars'
>> m68k-linux-ld: drm_atomic_state_helper.c:(.text+0x156c): undefined reference to `drm_hdmi_avi_infoframe_content_type'
   m68k-linux-ld: drm_atomic_state_helper.c:(.text+0x15b2): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM_DISPLAY_HELPER [=n]
   Selected by [y]:
   - DRM_KMS_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
