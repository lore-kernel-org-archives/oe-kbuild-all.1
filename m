Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5E88825
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 02:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729651042; cv=none; b=tAhx9pBDh1SksK/UNQrg31258PtIDtZtav00T71BxDh7bLyem4K7/VKcC1GvFvs92VDdde25B+TxBSe8Qd2erTNKrctLD/uPVa/O+tmLYipzu1kRKFem0rHnlgOZMrBQ1GJCslRwRl6b1niBs7SjBahpBwf1VVRaTqf2J6nZwpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729651042; c=relaxed/simple;
	bh=dgtUKcIU91Rj1KDN03X2s+30dk3rcl+gg98WHTLThLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mrjGZlkOIswob80hIp0EuDIzNCBtP8ApEmPSZ0v4otx2CoB1BZDMuoxmmsr933BgthGwAsi4V4G7UxVS8OS2QUV2fOMhUuK70x5T1cq/6FlWHjeWWDxoDe7dLEss8wKOU0X/T3USUMxEGkhTNMHe5srlG2lYRiAL06f174CaQR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTZgGUMM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTZgGUMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729651041; x=1761187041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dgtUKcIU91Rj1KDN03X2s+30dk3rcl+gg98WHTLThLA=;
  b=aTZgGUMMBhmUg33P6xroMc4ClYPI7mxSfIjSzMUYR0JvJEQ/wUOSWXnc
   jw47Tui2kMBa/H5XauLrk2MpGr43aHuhP44LA9wSE8yDWTVn8tcW83me9
   KnbXieRjo7WE4aNB+mWLNz/FIkXuDWsRSarCxUOdUdDQiHNwY4sbyj5Gd
   LAjwhUwxsUvXcUDvoBMyPqZsezOTXz3sd4pnSvk8vA6e81HBKcY9O+HWa
   H+pNEChBMEFT2GqFiwr9C+h8TSlOyNEAZmus08Y4Vn9PFhiAmS/gBHhXj
   18lXi2TwwvATgHnUiHfrAmEDycspXev113adLAD5AEFgCLuboM4bWMqxr
   Q==;
X-CSE-ConnectionGUID: f9r9O56+RJmHe12hrc0KLw==
X-CSE-MsgGUID: CaEkQ7vSQMu40vUDdmyy0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="46699056"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="46699056"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 19:37:20 -0700
X-CSE-ConnectionGUID: 3WsNqje4Tb+k4xm9aawSQA==
X-CSE-MsgGUID: 3wAG0a6MQhOeJpOj2jAKmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80129892"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Oct 2024 19:37:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3RFM-000UN2-2l;
	Wed, 23 Oct 2024 02:37:16 +0000
Date: Wed, 23 Oct 2024 10:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 5764/6080]
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: audio-codec@11:
 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202410231034.kBCQ5FvS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7436324ebd147598f940dde1335b7979dbccc339
commit: 6df447d57800b7f9adb8eb673f1853331be20bb3 [5764/6080] arm64: dts: rockchip: Drop invalid clock-names from es8388 codec nodes
config: arm64-randconfig-055-20241022 (https://download.01.org/0day-ci/archive/20241023/202410231034.kBCQ5FvS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231034.kBCQ5FvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231034.kBCQ5FvS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: audio-codec@11: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
