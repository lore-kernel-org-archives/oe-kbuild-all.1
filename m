Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E1B25D208
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009604; cv=none; b=qLmBPXX7NrqrYI5XGfEA7NmeH5SzcRNbrRhzeylMf8dTczj7X064oREI+mDSaTWf6pRLPvBCPs2xBZyZBi1YulEDzwpeqCoJpS+u/uQJ9SApaNeARuDBLkdB/kEiAzi40eSRNEI9i0wjbRfYjgjGb5D5bf92OawTGf1TjOp/bf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009604; c=relaxed/simple;
	bh=euJfAaiMh2vIN2Cnh7vs0ExpReJYkPR5cYCd2ROyRyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0Lf+e1gCXgweH2VsPKk0O93rNXmULgotG+HvZhLDhDI2yjZIX2+O10zSSB2PQYIZLougZ7c032/T7UkLbobp1dbWkgCPX7oAyDQHV5vd6QfCzvCGoRlnSxaxcHBKTZhFusj/DeCu84E9NhqRgk56lomsKPFb/drWkpyZmq3B2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8uqhzvK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8uqhzvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009603; x=1794545603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=euJfAaiMh2vIN2Cnh7vs0ExpReJYkPR5cYCd2ROyRyU=;
  b=E8uqhzvKwEHZNvSddpgn55aG8ygM4cUdKhs4x1rLTkRwS9pw3Jb/BDSv
   M8WF8zIfs15B2BUhHHOOV1yWbuwiC4n/V5Asl8HG9gBGyhEkIWvMMogdR
   PzbuMlDHUmvGOzbcxfJ6wWo0hdqDVUqtweZ59Z7tJzxh8P2J80P3kf7W4
   huCYp4gXUNMsXdjA2HdgEGw4pBDQcLsaxCvYok1Ct3Z0GPZ6U7BmCo0A0
   Lqtxz5xIXhNy68G5KMDvSBpoQRrfI/4ddaxVDzxjSoSrB9XMEj3thGnmO
   hxovTHJFWznsVrk250R+L7hq2uLFtXkJtLcvU4LpxlQR1S4vxSBPn9r8k
   g==;
X-CSE-ConnectionGUID: B4fVr800Ro+QWnfmT+Hkdw==
X-CSE-MsgGUID: O4I3ZZiDQEmJLl3vox3mSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65175885"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65175885"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:53:22 -0800
X-CSE-ConnectionGUID: KtFhvljLQyq+KiBuXlBJgA==
X-CSE-MsgGUID: bpfUaZIgSiKheelXCAaoKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="190138857"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2025 20:53:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPKh-0004u3-1Q;
	Thu, 13 Nov 2025 04:53:19 +0000
Date: Thu, 13 Nov 2025 12:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 289/289]
 drivers/gpu/drm/mediatek/mtk_disp_dither.c:109:6: warning: no previous
 prototype for function 'mtk_dither_set'
Message-ID: <202511131110.CFvO194O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jay,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   207d9b4854da0b5e3534ed6b5379a00aeaac8ce0
commit: f12867625feef57b67579aef553133dfe5dd1bf2 [289/289] CHROMIUM: drm/mediatek: refactor dither module code
config: arm64-randconfig-004-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131110.CFvO194O-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131110.CFvO194O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131110.CFvO194O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:109:6: warning: no previous prototype for function 'mtk_dither_set' [-Wmissing-prototypes]
     109 | void mtk_dither_set(struct device *dev, unsigned int bpc,
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_dither.c:109:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     109 | void mtk_dither_set(struct device *dev, unsigned int bpc,
         | ^
         | static 
   1 warning generated.


vim +/mtk_dither_set +109 drivers/gpu/drm/mediatek/mtk_disp_dither.c

   108	
 > 109	void mtk_dither_set(struct device *dev, unsigned int bpc,
   110			    unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
   111	{
   112		struct mtk_disp_dither *dither = dev_get_drvdata(dev);
   113	
   114		mtk_dither_set_common(dither->regs, &dither->cmdq_reg, bpc, cfg,
   115				      DISP_DITHERING, cmdq_pkt);
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
