Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D9A2D3A7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755250034; cv=none; b=WAeeFtwNvupYSn2ing91lcoKeHIoqc4Wvj2a4n8w/N79PIFyS+W5zRnHcwW7xxTi1RH2Sqgft/ILlaXnGOs9GPFlqvOPDgWfcxjb8xeGZLb9XYYdGAf2OTfEUKebvnXPsdt0CuW7P0fgoQsfulfeK+WxJ3koQvvIaUIepsLFVRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755250034; c=relaxed/simple;
	bh=RnraM+e4YFUNz/wGOUWNqAtFfY67b2WiV+P96NkbdYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ljrBCl4E97LQ2eukSUs07oAO9WBxU2fybHpecqX3K2drHbTSP8X8JWvEO9m92JRL+dzaD1YGrHZ+Lt6E+1Y3IrqVrhpbGgi26wXrDqvqiUD3cjSd9bwmhHWjkI80z4zcppU1p/BgzuawgV423hg1DknxzVAJP587dwy+1yd0ZOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQXysBuH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQXysBuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755250033; x=1786786033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RnraM+e4YFUNz/wGOUWNqAtFfY67b2WiV+P96NkbdYI=;
  b=nQXysBuHhDZgGcXyLyX7zjW0UGPIj/hA8v8ZTvgGqLhcjUZTg/xKnCX8
   wodBiCGjKytzOiNQelzm3VOhJcdvdUle1YTN7iIgOmR2Tk5Sm7NPuLNr6
   74y+22Arq5PKhxiXhE6tsZTCiM0FnEI2IyrEOlZ+IIwfQQ40tig7PKrQZ
   Z63CUalTcWYNdtgQCn3xiZyVbGgFsxWJVUjJ9CqETFkFE4pcp4pITpbhe
   imble5Dh1PZcjQafubL+5uQvqJMzWTR22GlQF8C9pAd8w1lsXsqa6K0ql
   k6DNDKo/SZooYzvPCGD3dVSVorA0g7De2EGFc5iszLaQ2YeV6kgYnffVj
   g==;
X-CSE-ConnectionGUID: LEFML7NbTjS45afuMB/aeQ==
X-CSE-MsgGUID: w6AY6Z5URf+J1EQPd7AdTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68175607"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68175607"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:27:12 -0700
X-CSE-ConnectionGUID: CehhmC4SStSu+MG90/gMLg==
X-CSE-MsgGUID: ltWqE78qRJOS5qzmawwsdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="190689512"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Aug 2025 02:27:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umqi9-000Bnv-0p;
	Fri, 15 Aug 2025 09:26:59 +0000
Date: Fri, 15 Aug 2025 17:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: kismet: WARNING: unmet direct dependencies detected for SM_GCC_6350
 when selected by SM_VIDEOCC_6350
Message-ID: <202508151725.orPsYxfw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d7ee5bdce7892643409dea7266c34977e651b479
commit: 720b1e8f20047e072b98a0931fc3e9a545fda18f clk: qcom: Add video clock controller driver for SM6350
date:   9 weeks ago
config: arm-kismet-CONFIG_SM_GCC_6350-CONFIG_SM_VIDEOCC_6350-0-0 (https://download.01.org/0day-ci/archive/20250815/202508151725.orPsYxfw-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250815/202508151725.orPsYxfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151725.orPsYxfw-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SM_GCC_6350 when selected by SM_VIDEOCC_6350
   WARNING: unmet direct dependencies detected for SM_GCC_6350
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SM_VIDEOCC_6350 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
