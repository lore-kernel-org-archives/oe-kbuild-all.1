Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E0528FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739710030; cv=none; b=FXfrJRlHW2ifj5GMYb4fLhM+8TNzUCKOqa9PcGIkbZmlo4yLHZKSlnGcoEwokNg143z9PreMsfpuU7hwxT4latlRxs7cZRJgCHB1tdZuwXx6elRk48sYjhcgPsuBPnhkzYTfcw0v1FUDP3S/XdFKhW1KfRptjTj3LVHNBtJUF2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739710030; c=relaxed/simple;
	bh=6QjvVZsS9zp9JsQalw6H0WXnnT+yIOq5XscGwhnERCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lcq9R1MlXQR5yC02IwNSFFxyfJB/iA1nBgyZGnUcJGm3edWpxay3XrsF2xemG2npqKiUtC1aTRXQ6AoPGDA4FgHqNecIIEMCuzExTPNd6Ij+9//XHctC2tLTDW/Emxcb5yFHMcuKGy82Oq/CUYhwoYDKbm65PD0Join69lsP8Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjcS8KtE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjcS8KtE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739710029; x=1771246029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6QjvVZsS9zp9JsQalw6H0WXnnT+yIOq5XscGwhnERCk=;
  b=LjcS8KtEe3B6SX5Lv0ZuVvzQ81CMZFCsb2if5DvNkV4lvo3mOqAOUSbx
   LAN+DGf2rBoEmB53LbwjuM2KC8vdBznCQ0UlruqfVsdZZi52NLa/C04Oi
   B/0p+yN/BwuLx2zJ/A76hYx9qIxQROzfVU5oRtjhK63aX8k9xzjfdfMSV
   1HkBa0a2hQzxaLLUoiF1XsuOlSz3o1vwWM8nl9GzYcT8zTSbdfVYmkm2x
   X8ZhSMq5GVcdoynhSeC1c5l3d0RUg1Sf7OJEgLsBfD+ez5Wy0/Wh91Sw6
   SJmSrGhySDiLM0h9e7KcWEOfKM0WZH8e6wR5wB9sVqnG6kqIwgx2gy2rD
   g==;
X-CSE-ConnectionGUID: r+P0P79lTAGx5HjS80wBIQ==
X-CSE-MsgGUID: QrXyMRraQ9SCnjnDAikozw==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40330324"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="40330324"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 04:47:08 -0800
X-CSE-ConnectionGUID: DmFN5sYzRRSy0ldMqTWCww==
X-CSE-MsgGUID: mF1zwzxxQ5GJYL0kQ5RxPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="144737666"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Feb 2025 04:47:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tje36-001Bv9-2Q;
	Sun, 16 Feb 2025 12:47:04 +0000
Date: Sun, 16 Feb 2025 20:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 6/6]
 drivers/gpu/drm/mediatek/mtk_dp.c:421:12: warning: 'mtk_dp_suspend' declared
 'static' but never defined
Message-ID: <202502162208.1gEX5U7d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6b9d1df53da06888c48940b89b71b945645df922
commit: 0d96e807079196f870dcef51ecf4bd53fb5472c1 [6/6] CHROMIUM: drm/mediatek: Refine and work around eDP suspend/resume flow
config: arm64-randconfig-003-20250216 (https://download.01.org/0day-ci/archive/20250216/202502162208.1gEX5U7d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502162208.1gEX5U7d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502162208.1gEX5U7d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_dp.c:421:12: warning: 'mtk_dp_suspend' declared 'static' but never defined [-Wunused-function]
     421 | static int mtk_dp_suspend(struct device *dev);
         |            ^~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp.c:422:12: warning: 'mtk_dp_resume' declared 'static' but never defined [-Wunused-function]
     422 | static int mtk_dp_resume(struct device *dev);
         |            ^~~~~~~~~~~~~


vim +421 drivers/gpu/drm/mediatek/mtk_dp.c

f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  413  
044955e3eece16 Jason-jh Lin              2025-01-17  414  static const struct regmap_config mtk_edp_phy_regmap_config = {
044955e3eece16 Jason-jh Lin              2025-01-17  415  	.reg_bits = 32,
044955e3eece16 Jason-jh Lin              2025-01-17  416  	.val_bits = 32,
044955e3eece16 Jason-jh Lin              2025-01-17  417  	.reg_stride = 4,
044955e3eece16 Jason-jh Lin              2025-01-17  418  	.max_register = SEC_OFFSET + 0x90,
044955e3eece16 Jason-jh Lin              2025-01-17  419  	.name = "mtk-edp-phy-registers",
044955e3eece16 Jason-jh Lin              2025-01-17  420  };
044955e3eece16 Jason-jh Lin              2025-01-17 @421  static int mtk_dp_suspend(struct device *dev);
044955e3eece16 Jason-jh Lin              2025-01-17 @422  static int mtk_dp_resume(struct device *dev);
044955e3eece16 Jason-jh Lin              2025-01-17  423  

:::::: The code at line 421 was first introduced by commit
:::::: 044955e3eece16d9c50e1a693c197e4193399d72 CHROMIUM: drm/mediatek: add eDP driver for mt8196

:::::: TO: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
