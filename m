Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455CB1F03C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214321; cv=none; b=dOs570k2Zs5Q9Az4Nps8CFqTOOGYr5MvrvOrN2ip5tnfgp/0MS1F7T3rEPQo57UBAu8wWFbxuhNK+zPQMNkuSS3htB9YijJR6IHJy7qlx616OJVcY1fW0+ilNicnLFV2UUp5UIvlnR7CBCSNYGg3VOELaABCK3C0jPPaj0fPSgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214321; c=relaxed/simple;
	bh=c5IGriNYWsCppyKwM3XsPE+IJO4EjciialfzdYMvVZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tncjqwGX2BgBeuoNV2E4OlcjrzBHxRCZBBlh75p9Gq/H5IZrniHISe/lnKXaAwnKf69tJbczpZIqTE6Fj2VXPVjktPH+FBD9/7GVkUywqgXB21rPRJq+yBI76m5aY8aXA/d9eRX2MGwyxxLRJ3TxPUqrvwTjQY/izgNIxYtyd1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOyizxRz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOyizxRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747214319; x=1778750319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c5IGriNYWsCppyKwM3XsPE+IJO4EjciialfzdYMvVZs=;
  b=JOyizxRzdc6RBxfWpYy4AVtzbMlbo1j2Onqc0Dd4yX3IM3keqRLXgg7z
   IHqM0aWMhvvX6jVgwCTyMF+UvxLbHwaw+C29Rtl9wG/YVaZ9o16OKXCdL
   RbqYfEMz7NRX2JbIQFymvTzY8fyvEZ+bPf0ncMah/WFYWzpD/ldUal2e4
   xOxmMbFsGNCD1OwRAlv+hPhsmPv/TTg5bjTwgAx6NglwRzth0tz+67QIH
   RdwABKV1vDKZ52DzavVPosyjpnRXoqrgEgKY+OEF4hJPmLVs6w5N5oVv9
   YeKiSOCNfSq+iKZ+8r9yI68IZfHaaitHZrhInuTpjPZIyvAjyooB7pTsB
   A==;
X-CSE-ConnectionGUID: MtQHeWfaSc6AWz0CyKpHAQ==
X-CSE-MsgGUID: ljPWF32bQ4GmmNn25s3nCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="71600646"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="71600646"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 02:18:38 -0700
X-CSE-ConnectionGUID: eyifv+SFRaOBc8WnMEavcA==
X-CSE-MsgGUID: O9LSkdSyRGCIP3Pu3r6QRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="168926906"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa002.jf.intel.com with ESMTP; 14 May 2025 02:18:38 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF8G3-00018A-1s;
	Wed, 14 May 2025 09:18:35 +0000
Date: Wed, 14 May 2025 17:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: [linux-next:master 9170/10774]
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb:
 nand-controller@10b80000 (cdns,hp-nfc): 'clock-names' is a required property
Message-ID: <202505141715.4Fm4W6Ja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
commit: 0d57ac1f92c7558b5d1b8f9780b9eb2f0d06b284 [9170/10774] Merge tag 'socfpga_dts_updates_for_v6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into soc/dt
config: arm64-randconfig-2052-20250513 (https://download.01.org/0day-ci/archive/20250514/202505141715.4Fm4W6Ja-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141715.4Fm4W6Ja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141715.4Fm4W6Ja-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: nand-controller@10b80000 (cdns,hp-nfc): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/cdns,hp-nfc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
