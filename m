Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379C34C8E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739719403; cv=none; b=aUW2Vh7ZfdSNiBddx1cTvNzhlS8W3FLPlbo4r4Fax9tcbG6u/8ViFl0yh87jmqbwe3gKRphc29JNQZkpdzm1YcLybuU5TQR5kHrVUWMZUMEBS7K96Uk1zRj8Q8yUxaB+htk5m9M2pd3xmUxMSE7E6LEvIBZol2F1ByMU3PLgSkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739719403; c=relaxed/simple;
	bh=LvzVkNx4ljaWCFAbMmL0KHq9ndWfn+s2WJGVw5c+R2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p5txTmcdoY2uqPuEKwnC48TSf7bAA0cqb6OeH/jljIQj1T8/87Pqa9h0f/8L1WRob/WKdpBZI+MUlO1Fd1UFfbVVXjUxifyQD/o4UzzyDBUyG/04QuV0t+YZ1vKchqhS+CzPMwzqYbsaKSUcNW5Tagp/qXQns1ek/GWAd5KaAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aj1LdL2K; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aj1LdL2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739719402; x=1771255402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LvzVkNx4ljaWCFAbMmL0KHq9ndWfn+s2WJGVw5c+R2g=;
  b=aj1LdL2KbfoO4jiaw66JrJ86BecmEbbKfnO14cIswjGOaZxuQlbNJSs6
   iF/eCy8VGjpZYt9r7GtyWX+MTVKKlH3gjCIXalOIMiwGqmwPFuhby15PG
   RuIXQRjkb+TlBaLd7g2llFh2AmSiFc+ZoEMsdLI0gzLg1WMyknmP4frdl
   qO54s07QirISZgarQxW313IfefRaYMUp0G7mnpLUdXeEmfCy71IYoSHy2
   8bEsmCy+6Hi/1JkdsCW2lkbrh31CoGSAxGnrtYWqk/RoeJhwddidy2CCI
   1kiKGwMQNGx5YttWPn9k9HN5NnTsr9U3Mh9EivGZuxfqMHZGhVm9VJgDe
   g==;
X-CSE-ConnectionGUID: r+gY7TwGQ62jjUqbbuQH6A==
X-CSE-MsgGUID: DQNxK14tRluqYBgd4aYsTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51035116"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="51035116"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 07:23:21 -0800
X-CSE-ConnectionGUID: 5bz1m3mlThePHE7fZYj/Lw==
X-CSE-MsgGUID: nTiTilxTS36vaMWlMsFIkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="113783010"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Feb 2025 07:23:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjgUI-001C1F-2r;
	Sun, 16 Feb 2025 15:23:18 +0000
Date: Sun, 16 Feb 2025 23:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/phy-exynos-usbdrd-fix 2/2]
 phy-exynos5-usbdrd.c:undefined reference to `typec_switch_unregister'
Message-ID: <202502162341.LCymbuqF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/phy-exynos-usbdrd-fix
head:   c2c4065e701bb4eb3d2790fb163d39fe858fff2e
commit: c2c4065e701bb4eb3d2790fb163d39fe858fff2e [2/2] sq v3
config: loongarch-randconfig-001-20250216 (https://download.01.org/0day-ci/archive/20250216/202502162341.LCymbuqF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502162341.LCymbuqF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502162341.LCymbuqF-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/phy/samsung/phy-exynos5-usbdrd.o: in function `exynos5_usbdrd_orien_switch_unregister':
>> phy-exynos5-usbdrd.c:(.text+0xb8c): undefined reference to `typec_switch_unregister'
   loongarch64-linux-ld: drivers/phy/samsung/phy-exynos5-usbdrd.o: in function `exynos5_usbdrd_phy_probe':
>> phy-exynos5-usbdrd.c:(.text+0x15f4): undefined reference to `typec_switch_register'
>> loongarch64-linux-ld: phy-exynos5-usbdrd.c:(.text+0x1634): undefined reference to `typec_switch_unregister'
   loongarch64-linux-ld: drivers/phy/samsung/phy-exynos5-usbdrd.o: in function `exynos5_usbdrd_orien_sw_set':
>> phy-exynos5-usbdrd.c:(.text+0x2138): undefined reference to `typec_switch_get_drvdata'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
