Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D0528F93F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 11:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060445; cv=none; b=eFTNPAQnZLDqu525CFcoLzo1g/JmPSe96uglbYPLXncLa3CirNN6Tm3RauoSEKUd8aLnWWxIwDoP6mMlbvkE5asDHDO6/T7NSpNNKIORlU3MFsen8mnmYd+NDpjLEhvKGfUP0QzIEHLgRjbgHvsoDWz1naC8TZF382hjUEwZjBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060445; c=relaxed/simple;
	bh=igWQKu5bxf0pYVJkos9/kagBTW7UmdjH06rbJp15n6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kgAYwt56MTTrSFkpQ613bal+lSTrTsCMp4xiNLD9OKc9NkdQLnyV58cO9HObfDEj/dJP6kdUGUWtXsiO6vkS4kkWJAWmWgbX9eV0FhsmjzWpmYV62vCMnymMfQqjNPLmVIAVbWejLVdLYNiQQ0NKObMISmQjZQGfPtnYWj4IsJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYfUbB3/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYfUbB3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752060444; x=1783596444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=igWQKu5bxf0pYVJkos9/kagBTW7UmdjH06rbJp15n6g=;
  b=PYfUbB3/7fckYsu+tK8YS0Zz8htK3SCGX+f5rxJtfNIwEqtn7TUsmGgv
   lVuVIBtnirgrFelvu16IqeGz+iE+g0h/L3AcZLqT9hQQH976QgLh9ckGJ
   83phqA8veujex9EcialGEMCXSjlNkwZnwlUDw3dBE/OS/CheOnAVTR6ju
   1ifLAsz6KZS4CbrcNjUV1UAIoZYSjmNNlS3JQEjpkm826SrCvhWgdKjwS
   02t1AGgKbFsqOuldEFJIvWGlONq3AP1YyUc39YEBn692bKXpjX+yTEbNq
   0I1t5OhtYhayAErTERkbd5Aw2tfejxSkvuC9e74grR+3tKp1JaceeIzgp
   w==;
X-CSE-ConnectionGUID: I7sAGpAqRJWPBgUlR64JHw==
X-CSE-MsgGUID: uEqNxSVMRYmoiFQuEEQjHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54174740"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54174740"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 04:27:21 -0700
X-CSE-ConnectionGUID: Ga6DZbh6TtyDq7HWK8xqRQ==
X-CSE-MsgGUID: GhL5ZceJRASTShIdxy8tZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155881379"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jul 2025 04:27:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZSxJ-0003Sn-2c;
	Wed, 09 Jul 2025 11:27:17 +0000
Date: Wed, 9 Jul 2025 19:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:clk-remove-round-rate 35/37]
 drivers/clk/ti/dpll44xx.c:204:5: error: redefinition of
 'omap4_dpll_regm4xen_determine_rate'
Message-ID: <202507091957.6p54wPNi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/masneyb/linux clk-remove-round-rate
head:   87183237516af3a54bb2ce1f72e261ddaa776bee
commit: c76753ed1ed365ac6aaaba466c222e365cb3a030 [35/37] clk: ti: dpll: convert from round_rate() to determine_rate()
config: arm-randconfig-001-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091957.6p54wPNi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091957.6p54wPNi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091957.6p54wPNi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/ti/dpll44xx.c:204:5: error: redefinition of 'omap4_dpll_regm4xen_determine_rate'
     204 | int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/dpll44xx.c:148:5: note: previous definition of 'omap4_dpll_regm4xen_determine_rate' with type 'int(struct clk_hw *, struct clk_rate_request *)'
     148 | int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/omap4_dpll_regm4xen_determine_rate +204 drivers/clk/ti/dpll44xx.c

83501ff0a5032d arch/arm/mach-omap2/dpll44xx.c Tero Kristo     2014-10-03  193  
83501ff0a5032d arch/arm/mach-omap2/dpll44xx.c Tero Kristo     2014-10-03  194  /**
83501ff0a5032d arch/arm/mach-omap2/dpll44xx.c Tero Kristo     2014-10-03  195   * omap4_dpll_regm4xen_determine_rate - determine rate for a DPLL
83501ff0a5032d arch/arm/mach-omap2/dpll44xx.c Tero Kristo     2014-10-03  196   * @hw: pointer to the clock to determine rate for
0817b62cc037a5 arch/arm/mach-omap2/dpll44xx.c Boris Brezillon 2015-07-07  197   * @req: target rate request
83501ff0a5032d arch/arm/mach-omap2/dpll44xx.c Tero Kristo     2014-10-03  198   *
83501ff0a5032d arch/arm/mach-omap2/dpll44xx.c Tero Kristo     2014-10-03  199   * Determines which DPLL mode to use for reaching a desired rate.
83501ff0a5032d arch/arm/mach-omap2/dpll44xx.c Tero Kristo     2014-10-03  200   * Checks whether the DPLL shall be in bypass or locked mode, and if
83501ff0a5032d arch/arm/mach-omap2/dpll44xx.c Tero Kristo     2014-10-03  201   * locked, calculates the M,N values for the DPLL via round-rate.
0817b62cc037a5 arch/arm/mach-omap2/dpll44xx.c Boris Brezillon 2015-07-07  202   * Returns 0 on success and a negative error value otherwise.
83501ff0a5032d arch/arm/mach-omap2/dpll44xx.c Tero Kristo     2014-10-03  203   */
0817b62cc037a5 arch/arm/mach-omap2/dpll44xx.c Boris Brezillon 2015-07-07 @204  int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,

:::::: The code at line 204 was first introduced by commit
:::::: 0817b62cc037a56c5e4238c7eb7522299ea27aef clk: change clk_ops' ->determine_rate() prototype

:::::: TO: Boris Brezillon <boris.brezillon@free-electrons.com>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
