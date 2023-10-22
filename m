Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7A22594
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 17:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjpQbcbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697997246; x=1729533246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KAaRf81VKYFQufyg/MjBw9jVYhbza0E8aNyXzEjP01k=;
  b=VjpQbcbqIGP/sHjvYeamsfxlldQ442DJ3R88T61+2FMy6hf5k10GzoeS
   G4sMQoaB35JzBcUVcjkdUKF2ykVwOpU/1Sd5klbECVxP8lN/LAhwLelSG
   lVIiUp1ZK7U6BeRXjO+O+4wPvy42R1bNevyyuI6XPTjU+fD54xMwwSf3a
   ZR8ekRBVXLTzLRVEAfEuibJ8CDevRAaHoTnX8QPdDXttIi84MUksD1rgd
   BXFAKpBBDl9eRZlmtbL3gyzeU8VKoDSQTnaFZTAXheV4v5LLZ8s539tq5
   MkjJdBRiZmYwh+7pGNAk0vzsS+xRwmyT3n95IfXNmyskCtXp/oexGoj2n
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="385603159"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="385603159"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 10:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="828212307"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="828212307"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Oct 2023 10:54:05 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quceI-0006Ae-1u;
	Sun, 22 Oct 2023 17:54:02 +0000
Date: Mon, 23 Oct 2023 01:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 3/23] checkpatch: ERROR: trailing
 whitespace
Message-ID: <202310230113.5XQV1TKi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   7c273a7526ad5e3284b1763207b1d8d6178d9ca4
commit: d86efdccc8b85a6630c98d5a75ce39aaa3b28ed0 [3/23] WIP: arm64: dts: some fixes to solve dtbindings errors
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230113.5XQV1TKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230113.5XQV1TKi-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#54: FILE: arch/arm64/boot/dts/mediatek/mt7988a.dtsi:649:
+^I^I^I^I <&infracfg CLK_INFRA_SPINFI>, $

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
