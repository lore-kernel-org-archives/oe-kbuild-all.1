Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1D205AA5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 14:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591832; cv=none; b=ud9/0Y2bxwnfqYevDf3DUB0U2v6QgjzRmnpKP4+yHN4T2rsV7cKhEQ5yXuNokfpW2LefTXC1Kz65DS8nMy72wcyHUeVkfr4U2L7gzTIFbDuGG8Cy8rataeslVQimtAJd/nHMA/lrcRBntAyw1jwl67Ul4FEbgsw9sKczh9X+4HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591832; c=relaxed/simple;
	bh=vYZARgukxasTRmQotp38rneCVicGAiNV0c/QKvgddro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUFPZxkuAQJi+sRcXWN+nIJA3FAw/CSEXW+I9iyRUqqK3OmBf+J7YkwxBcSwSZIHWXwYexuk1tOJx2Gg44hKMtLajnafEZeh65v+Df/6255D43tLBiWehQ07wl5PrLSHYQgC2s+fidsarpW7lrHUI6Hgwt/VxBwImSMHdK/MTwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKv5d3hg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKv5d3hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591831; x=1770127831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vYZARgukxasTRmQotp38rneCVicGAiNV0c/QKvgddro=;
  b=FKv5d3hgVbwW4ns2JzYaftzrW/NARFNbzBfsO+QF2flUcid4wsRoQX+3
   sPy6gASSPo0wEdj9vHllelC3r7adTCFDCZ9ilCIfuVYA9TC5olPNLupsD
   2AOd5ew+zDksdCBnn4o63X2vcKpB9DOWhYJab1HpXYbMt57PPHcZJE+TM
   PharkI6tzgF3vBNIX6w4Idqf5Jb6QyvR6gD9wTKJ0LBU+V2QGyVrwmK6D
   UpHu453vPeTie96dR1/TYAy2+fnKN5uGEc0i68Trkc789cg2CS+eF3gt8
   GZVv5yM2bYAc6Gg4rJ3pcmaCbHshocOLjD6LSMJzmzL9jqSOof736xoEb
   Q==;
X-CSE-ConnectionGUID: wsIdqEDaTHmzlGwDpjh2xg==
X-CSE-MsgGUID: gbEoFsoNTrq8fik0FbOMzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50473633"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="50473633"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:10:31 -0800
X-CSE-ConnectionGUID: iR7V5st8SAqM13fwvb5dBQ==
X-CSE-MsgGUID: H6KxLTbWRvGCotO/JiQJKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="141168813"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Feb 2025 06:10:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tex9f-000r1X-1v;
	Mon, 03 Feb 2025 14:10:27 +0000
Date: Mon, 3 Feb 2025 22:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 57/57]
 drivers/gpu/drm/mediatek/mtk_crtc.c:976:1: warning: label
 'update_config_out' defined but not used
Message-ID: <202502032141.ewkVAeVB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6175b263c04ce3f5cf949719af87547964ae77fd
commit: 536e89daf375ca867b9e01405517083763491bc5 [57/57] BACKPORT: FROMLIST: drm/mediatek: Add secure flow support to mediatek-drm
config: arm64-randconfig-004-20250203 (https://download.01.org/0day-ci/archive/20250203/202502032141.ewkVAeVB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502032141.ewkVAeVB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502032141.ewkVAeVB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_crtc.c: In function 'mtk_crtc_update_config':
>> drivers/gpu/drm/mediatek/mtk_crtc.c:976:1: warning: label 'update_config_out' defined but not used [-Wunused-label]
     976 | update_config_out:
         | ^~~~~~~~~~~~~~~~~


vim +/update_config_out +976 drivers/gpu/drm/mediatek/mtk_crtc.c

   975	
 > 976	update_config_out:
   977	
   978		if (ret) {
   979			spin_lock_irqsave(&mtk_crtc->config_lock, flags);
   980			mtk_crtc->config_updating = false;
   981			spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
   982		}
   983	
   984		mutex_unlock(&mtk_crtc->hw_lock);
   985	}
   986	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
