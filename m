Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663E51D2704
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 02:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730859970; cv=none; b=U3QJAZ2SpBVJYgmXq+Q0BbtF55mVfWGSZw7m3gjWlK7E1b715yh6XZyPXmdWj6mlvqS6niZcEavumdVHHu1KXEQU0hTo15DERvW4kB9YzgrvkHvJUNadD8vNp9QSxlb6e0tjksbB5neivCohI6Fr/qBIrr7Sma+bx6EesTiB7P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730859970; c=relaxed/simple;
	bh=eZJo9WFDJ7RnliIFYPRscGm7wkXoUYcsplfRpOIj9zw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dTdFSPgpJF4ZCs4nX+EbiTjj4Xn3RDvAPEX8SF9eVH4F9MgbnT6KuUfuaiNxrKF4gjnVOYICaxmZf3ENVzFjicI17wE/Bd63JoE/Y2TUpVNFLz6ILhpIB9bO5QwqlbjymkLx2rIWhHgGh4TB6AHJnXKx79TrKzJ9FjfA5aT7Nos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0kc0eDE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0kc0eDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730859968; x=1762395968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eZJo9WFDJ7RnliIFYPRscGm7wkXoUYcsplfRpOIj9zw=;
  b=Q0kc0eDEiS3ioMhjbdQMiCLoa4DZKrFFf0IHMr/Cwc4wOdlAuIn8S20z
   osw+hBjta4ods6RTIkT5/5k+jWQy9b7fV1UY3Y49csox6CCX7LAfYNcod
   tCdJHfSBqiutZYlwPKXkS8lDCxbXquNQIt1dSm1C9ZCXC2OTIXI6UXZpN
   7O75a/QKeScRlbIK95LT8tgf7Qr8kn3wWeJFDnjFOmCrlKh14xYxqMVtn
   M1tp+DU+r5SToaWvNh1M/YSnmjiF2F2fOtLUot+lHxIF+mEYPlV3Ysba9
   vszS9OZBlvra09DrM5TBScUbUmLluBaSzTG88TNUMwf1ZFkhwbpWxdVav
   A==;
X-CSE-ConnectionGUID: LOg6OeCiRrCVHTA5CK9rnw==
X-CSE-MsgGUID: iyJi0ATBRoWLjd1d9vKwfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42018030"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="42018030"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:26:08 -0800
X-CSE-ConnectionGUID: 4bnvm7S/SRO+DeKio//Lnw==
X-CSE-MsgGUID: RgAKjD0dSViPXs6YVOLenw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="115071801"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2024 18:25:00 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Vj7-000moF-2N;
	Wed, 06 Nov 2024 02:24:57 +0000
Date: Wed, 6 Nov 2024 10:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-mt7988upstream 39/40] Error:
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:91.1-5 Label or
 path eth not found
Message-ID: <202411061053.1YZ5uE8J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-mt7988upstream
head:   3f84f8d621ca28a56bcc9e2a277ebd99dd10b36e
commit: 298704e989ebad986f9745082d5cd01003e21bac [39/40] arm64: dts: update bpi-r4.dts to actual state
config: arm64-randconfig-003-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061053.1YZ5uE8J-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061053.1YZ5uE8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061053.1YZ5uE8J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:91.1-5 Label or path eth not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:95.1-7 Label or path gmac0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:99.1-7 Label or path gmac1 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:106.1-7 Label or path gmac2 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:113.1-8 Label or path switch not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:117.1-10 Label or path gsw_phy0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:122.1-11 Label or path gsw_port0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:126.1-15 Label or path gsw_phy0_led0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:131.1-10 Label or path gsw_phy1 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:136.1-15 Label or path gsw_phy1_led0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:141.1-10 Label or path gsw_phy2 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:146.1-15 Label or path gsw_phy2_led0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:151.1-10 Label or path gsw_phy3 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:156.1-15 Label or path gsw_phy3_led0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:177.1-5 Label or path cci not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:294.1-7 Label or path pcie0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:301.1-7 Label or path pcie1 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:308.1-7 Label or path pcie2 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:315.1-7 Label or path pcie3 not found
>> Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:325.1-5 Label or path fan not found
   Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:334.1-6 Label or path tphy not found
   Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:392.1-7 Label or path uart0 not found
   Error: arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:400.1-6 Label or path xphy not found
   FATAL ERROR: Syntax error parsing input tree

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
