Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF8512E45
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708672868; cv=none; b=F79pkOOxBK30i6h7B8Orv6lz2Rw8WtDCRGIR2xitppDezCARHpWrF61qHoeyGr25QnM010DWTyqmtqvIQO6dBPRIc6VbbDeVHBf4q0oUn44FqIxm9A7wo007wJmoUEQXkZfG+zLFLMowS1SosGOk1X+gT7YSyJgWudmBU1TZJ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708672868; c=relaxed/simple;
	bh=VuPNJqIbNCFRq/AGaoiSqRalja3dkl96ih43Z3gk3pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VEfGJDRZ2tbqKLp8eqnspE2RsjpZsEiyLR29cq5PwLemn1RsxwmxYM39d/Hgy2ec9LDOt2UTUcd6S63anU33ybofqlaQq2sCIb1o5nTa1craIQONJ9e8hBVtHQNQLd2m33/9OgJXpYms8Xnv0+tvURm+kvuZ5rrmV7gtITa7WTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuI+LFop; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuI+LFop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708672866; x=1740208866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VuPNJqIbNCFRq/AGaoiSqRalja3dkl96ih43Z3gk3pc=;
  b=GuI+LFopjtdyXHLpWHZJCaLiORQH7/VvFBoTiMItucmEUdcm7nN4d9jg
   6JUtCgK292n84bHrWfizFllz3wFMFN+/k/wrYBFq3eay6UB9JjzLB/yzn
   sTMRi6SsuJ8Wn2Yvs/F0mrlq6ejyzW4T1uxenYbd5/IzLTpIygOH1UEWS
   jOx9EqCwELmJPSMtVLMmDZoUgBF2IyI3AzQODmTrrB+nptk3NYyyQsWbH
   ZKAZb/TVuhK0IomDfVWntU7s6R99t6eoC3kpWWBK1YM4TplBp1I+aJUaB
   cWAMyD3lBX3bV0zrTW6+b2hZPpWjRREL+ZGQTyzdiENlfHDkjP95GmxiP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28406060"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="28406060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 23:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6227507"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Feb 2024 23:21:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdPrh-0007Bc-1y;
	Fri, 23 Feb 2024 07:21:01 +0000
Date: Fri, 23 Feb 2024 15:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-debug 10/20]
 drivers/soc/renesas/r8a77961-mstp.c:617:13: warning: no previous prototype
 for 'r8a77961_disable_mstp_clocks'
Message-ID: <202402231525.wFLTl40d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-debug
head:   5da04202c8b2b842bcf74a93e5232f4133c222fa
commit: ea517c322a7e736531e654cf307f8f75c21a5ec3 [10/20] [DEBUG] soc: renesas: r8a77961: MSTP debug handling
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240223/202402231525.wFLTl40d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231525.wFLTl40d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231525.wFLTl40d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/renesas/r8a77961-mstp.c:617:13: warning: no previous prototype for 'r8a77961_disable_mstp_clocks' [-Wmissing-prototypes]
     617 | void __init r8a77961_disable_mstp_clocks(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/r8a77961_disable_mstp_clocks +617 drivers/soc/renesas/r8a77961-mstp.c

   616	
 > 617	void __init r8a77961_disable_mstp_clocks(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
