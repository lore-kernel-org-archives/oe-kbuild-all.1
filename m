Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48420393761
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 12:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889237; cv=none; b=Be/Wsq1dDmrY9NQNaMhwZlhDrKcaRfQNqPg/UhSqrm/SsYP69D7Yb8SIHVEKBVNB+XkLs8UPI2V2WkKDtDf/NLn1+hdIB7pMtVzip/5rawYAiTu2n2+Zsvszb12RuaaRl2T+3P/jCSWwhDd+3AevfX9vPv6Zj7VutOv/i0G4WVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889237; c=relaxed/simple;
	bh=xg9uky+HY/DxsH58XJguOZITRgOTCQIc1YDFpR+t8jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mrFl75UErDJ1nQzb7cDNWbPEJa/z5G71KS0Z6R0usaLJSepy/joFJCptfk0b9RBu6zbFEeQ9htiu8sHJtx28Vg1M+G61yYfZUXpTQvcuD43MNq4TlVDi3rIqhT4aEnlaWgee6FvlDLKUZHpYgUcr1gs8hsVqo6JDM7ubNLhRQBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I46h0yLx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I46h0yLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765889235; x=1797425235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xg9uky+HY/DxsH58XJguOZITRgOTCQIc1YDFpR+t8jQ=;
  b=I46h0yLxScG8tHEjN9gf+tI2XzjwtKy8Ls+CQIL9WdrdOmNiMYq21uCd
   btn1ClZ09ucr+medrgoFDeROUod6LgIA4+Go6rchbXGP8nG+ZnVcWWuH1
   E0KZQkpMR6a5Gu7ASw3L6aDvhVQWgU02E2SqYSjQPFVdPR3MRsdBKjd8s
   2oRwq/nSxf9o8b0E40v/s6VSrJA4x7xUEF3yDFoK456Q+F9Qbk6lT5Vkw
   ueBQoJTA359dXzKSq6xr4UkiRQ2S2ciaB+IM/gRAnr0pwdGccuKDDpZBY
   aoBG7s0i4n0Z7l/TweWL4fkUtOrMjuX0XhFdn1LnMgqTyz1/v7LK39G6k
   A==;
X-CSE-ConnectionGUID: N5FrLemLQVawZ+mROu50hA==
X-CSE-MsgGUID: NEq3hP5uQzyS+dEQN5EdSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67840878"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67840878"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 04:47:15 -0800
X-CSE-ConnectionGUID: RFKOwjTDQKO5J9bkjDfblQ==
X-CSE-MsgGUID: eUGGihNnSnOxWzlFvOmmGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202507687"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Dec 2025 04:47:14 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVUSN-0000000032Y-39np;
	Tue, 16 Dec 2025 12:47:11 +0000
Date: Tue, 16 Dec 2025 20:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/mmc/host/sdhci-brcmstb.c:51:6: warning: no previous prototype for
 function 'brcmstb_reset'
Message-ID: <202512162005.81hPbUJE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Al,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: 8e6940979bb881e90e3196b72a009c7245c08883 [2/2] mmc: sdhci-brcmstb: Enable Clock Gating to save power
config: arm-defconfig (https://download.01.org/0day-ci/archive/20251216/202512162005.81hPbUJE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162005.81hPbUJE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162005.81hPbUJE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-brcmstb.c:51:6: warning: no previous prototype for function 'brcmstb_reset' [-Wmissing-prototypes]
      51 | void brcmstb_reset(struct sdhci_host *host, u8 mask)
         |      ^
   drivers/mmc/host/sdhci-brcmstb.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      51 | void brcmstb_reset(struct sdhci_host *host, u8 mask)
         | ^
         | static 
   1 warning generated.


vim +/brcmstb_reset +51 drivers/mmc/host/sdhci-brcmstb.c

    50	
  > 51	void brcmstb_reset(struct sdhci_host *host, u8 mask)
    52	{
    53		struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
    54		struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
    55	
    56		sdhci_reset(host, mask);
    57	
    58		/* Reset will clear this, so re-enable it */
    59		if (priv->flags & BRCMSTB_PRIV_FLAGS_GATE_CLOCK)
    60			enable_clock_gating(host);
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
