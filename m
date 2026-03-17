Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2868A39A072
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737060; cv=none; b=DEiEwQ4AmO97/EgMpAjrYInuoG+KY/EJlxnOhsLgPM/YvfCdBTt3ZYwh+iAW8Gbb8Wa++Dotoqqks9HWjXs33gNw+l3FAxYgx7xJJUx3S1TKIoGATOR1Gkodxgyvpdbhkzdkk9DrHdpEgdOQVKoHRM4Ej+A5GzpiBj7bmtaKAxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737060; c=relaxed/simple;
	bh=XXX4Pa8r7VPdLTzN3P1ise+yLpsNeh3ixAxhjJ5/wh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hO9ZbBopeIXZTbHmr4eUnOef+z4j8aIkOFfb2dAxU+jvL9/rW+RedMvySGlZ68xXX1W7DkkGtP8szROlCrNDJoG9KPKyhnuyM+nKa5SCE4PSTcYQRIUV4R046M9/nP0YPYdxzWYbOudZtH+bbG5wySYXnf+zj1RjU7fPtQuBwk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuXRAW9O; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuXRAW9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773737058; x=1805273058;
  h=date:from:to:cc:subject:message-id;
  bh=XXX4Pa8r7VPdLTzN3P1ise+yLpsNeh3ixAxhjJ5/wh0=;
  b=iuXRAW9OL2nCEEsOaNncfo7xQKeUPRpb0dDJaj1tT/iXZNlT3ficPXFu
   Fkxshs4F3ooPOjDIOa+lXbZ3XgZMvCscccKUzaj8hGFhkSFUNluA4qVzo
   4l1MVKkmuECDD4QYPvkAtsd457ErxLEU8mx+xlEqrDaUeZZcVIt6vmRHB
   5Cr44DG8pm3WW8+1d7mWuxADMghh+9/6BQHgnHAYXUAdYP/pg9O0Ll7Hn
   mS4zynKIWIqo9Rdv7q4hjniuqrP0gXtaHiaPov0QSG0cwhfMdH9Q/6b7E
   LJGfAY4VKPX6MfCGlQ4FcHVbzd5k5da6AtZIm5Gb4Dl4H5ezIj6gQfrtb
   g==;
X-CSE-ConnectionGUID: Ffn9ALtzSmmhnrGgovZo1g==
X-CSE-MsgGUID: /qXEZsM6T5C/ece2vtCj0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74946566"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74946566"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:44:18 -0700
X-CSE-ConnectionGUID: e7yQp4f+R0aSNPhkFXs8oQ==
X-CSE-MsgGUID: hEfjX0sfS1mgH29Mq2XSNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221432353"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2026 01:44:17 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Q29-0000000004l-3OhS;
	Tue, 17 Mar 2026 08:44:13 +0000
Date: Tue, 17 Mar 2026 16:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 50/50]
 drivers/gpu/drm/mediatek/mtk_crtc.c:1643:5: warning: no previous prototype
 for function 'mtk_crtc_atomic_check'
Message-ID: <202603171631.I7VHF378-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6030dcaf55c159496b17c680fc1e744454dd74be
commit: cb0626f69e9a9e0cb81a94ff264cbdc2895a6906 [50/50] CHROMIUM: drm/mediatek: Fix kms_color fail for invalid gamma lut size
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260317/202603171631.I7VHF378-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171631.I7VHF378-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171631.I7VHF378-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_crtc.c:598:25: warning: variable 'state' set but not used [-Wunused-but-set-variable]
     598 |         struct mtk_crtc_state *state;
         |                                ^
>> drivers/gpu/drm/mediatek/mtk_crtc.c:1643:5: warning: no previous prototype for function 'mtk_crtc_atomic_check' [-Wmissing-prototypes]
    1643 | int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
         |     ^
   drivers/gpu/drm/mediatek/mtk_crtc.c:1643:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1643 | int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
         | ^
         | static 
   2 warnings generated.


vim +/mtk_crtc_atomic_check +1643 drivers/gpu/drm/mediatek/mtk_crtc.c

  1642	
> 1643	int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
  1644	{
  1645		struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
  1646		struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
  1647		struct drm_property_blob *gamma_lut = crtc_state->gamma_lut;
  1648		int i;
  1649	
  1650		if (gamma_lut) {
  1651			for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
  1652				int lut_size = mtk_ddp_gamma_get_lut_size(mtk_crtc->ddp_comp[i]);
  1653	
  1654				if (lut_size &&
  1655				    gamma_lut->length != (lut_size * sizeof(struct drm_color_lut)))
  1656					return -EINVAL;
  1657			}
  1658		}
  1659	
  1660		return 0;
  1661	}
  1662	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
