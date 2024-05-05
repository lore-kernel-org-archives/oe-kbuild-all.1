Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF75D136E03
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 22:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714947131; cv=none; b=fs5C82sD6ooNw7pflTovawUoREOPSb8IBXhj0qKINThnPWrKeXFmS5uGMtzzcy/wXZzAsPsMdJCItvRzAhnF5hzcOfWeEErIk8ybg0oY4kERK7zuHARYFhLm2AB1K1O+M6ZNx9iRLQdWMrdg6VxnXJrReNxOfRQbIeNbhbnVEUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714947131; c=relaxed/simple;
	bh=NU8qhFWVY+Hg2P0frsJkBBxoOd6qUY4+zYEt0SspmZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0lHcPUX8vU3dG/rsT+1xFHNnH5rE3FCriWHU5/j0Q7Ub9FcdSTkm8CdIcgaSSKfKYJmG7ccgsvHUE8sGjSOpIJy8PEdMiP2GyBkcmRI2Ez818eiRvgJmvRklPCyt26Zj2ThgnxpufFr8+BOvzgRN4kmasEGJlQdYw9WVg+4wgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRuAa5y8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRuAa5y8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714947130; x=1746483130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NU8qhFWVY+Hg2P0frsJkBBxoOd6qUY4+zYEt0SspmZg=;
  b=lRuAa5y8qHlFJk7FAONG5lfyOY2Mj1K2VDmUr/dGNHbWd+w9GjbgcSaD
   mu65tn4i39ikqMGTZOy1b7GwKfi7h0VNtTh3Y7l3rvY2Odmpf4LSUkzEM
   wzLJAhACt8jt2QW6AoPf5ea6w/tWvRw2Cz3Do5PnG+UY/MPUM0HxFxIac
   IqIWDDxLwRs2/RI0JLmuaZWRh8lSoCfnzfxv3/pj+u2JGtGzqpvwZWqYy
   NG1ibw6xVoifOlHSvWT+bpiM1rsY8u3NalT8th68ZNBPWo38TaBHZoiAV
   OL+VXtmyNwkps8q83OZznO8xtebkRoBH0iGiZCvPexHsejl5/3r4ytYky
   Q==;
X-CSE-ConnectionGUID: Ypa11PxZRWO4mvCKGoeNuw==
X-CSE-MsgGUID: +B8Cd+ygQq2dblr2J5QPEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21833488"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="21833488"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 15:12:09 -0700
X-CSE-ConnectionGUID: L+rLGSQ8QAOVWzGuwPDEUg==
X-CSE-MsgGUID: KR46cR9nTy6oter3dan4nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="32647449"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 May 2024 15:12:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3k5W-0000FL-0j;
	Sun, 05 May 2024 22:12:06 +0000
Date: Mon, 6 May 2024 06:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 1024/1143]
 drivers/char/hw_random/dwc/src/trng/kernel/nist_trng.c:148:5: warning: no
 previous prototype for 'nisttrng_hwrng_driver_read'
Message-ID: <202405060629.GKbBEfik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: cbd62701a0dc62129ef2fa57a6cd6b736cf54aed [1024/1143] drivers: hw_random: add DWC NIST TRNG driver
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240506/202405060629.GKbBEfik-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060629.GKbBEfik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060629.GKbBEfik-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/hw_random/dwc/src/trng/kernel/nist_trng.c:148:5: warning: no previous prototype for 'nisttrng_hwrng_driver_read' [-Wmissing-prototypes]
     148 | int nisttrng_hwrng_driver_read(struct hwrng *rng, void *buf, size_t max,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/dwc/src/trng/kernel/nist_trng.c: In function 'str_to_384_bit':
>> drivers/char/hw_random/dwc/src/trng/kernel/nist_trng.c:1512:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1512 |         int ret;
         |             ^~~
--
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:23,
                    from drivers/char/hw_random/dwc/src/pdu/linux/include/elppdu.h:51,
                    from drivers/char/hw_random/dwc/src/trng/include/nisttrng.h:51,
                    from drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:48:
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c: In function 'nisttrng_init':
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/char/hw_random/dwc/src/trng/include/nisttrng_common.h:23:41: note: in expansion of macro 'BIT'
      23 | #define NIST_DFLT_MAX_REQ_PER_SEED      BIT(48)
         |                                         ^~~
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:133:48: note: in expansion of macro 'NIST_DFLT_MAX_REQ_PER_SEED'
     133 |                                                NIST_DFLT_MAX_REQ_PER_SEED);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c: At top level:
>> drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:579:5: warning: no previous prototype for 'nisttrng_vtrng_wait_on_busy' [-Wmissing-prototypes]
     579 | int nisttrng_vtrng_wait_on_busy(struct nist_trng_state *state, int priv, int vtrng)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c: In function 'nisttrng_generate_public_vtrng':
>> drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:633:40: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     633 |                 DEBUG("rnc_disabled\n");
         |                                        ^
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:636:41: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     636 |                 DEBUG("not seed_enum\n");
         |                                         ^
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:659:67: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     659 |                         DEBUG("EDU_VSTAT_ANY_RW1 set 0x%x\n", tmp);
         |                                                                   ^
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c: At top level:
>> drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:719:5: warning: no previous prototype for 'nisttrng_generate_private_vtrng' [-Wmissing-prototypes]
     719 | int nisttrng_generate_private_vtrng(struct nist_trng_state *state, void *random_bits,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c: In function 'nisttrng_generate_private_vtrng':
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:747:40: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     747 |                 DEBUG("rnc_disabled\n");
         |                                        ^
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:750:41: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     750 |                 DEBUG("not seed_enum\n");
         |                                         ^
   drivers/char/hw_random/dwc/src/trng/trng/nist_trng.c:770:67: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     770 |                         DEBUG("EDU_VSTAT_ANY_RW1 set 0x%x\n", tmp);
         |                                                                   ^


vim +/nisttrng_hwrng_driver_read +148 drivers/char/hw_random/dwc/src/trng/kernel/nist_trng.c

   147	
 > 148	int nisttrng_hwrng_driver_read(struct hwrng *rng, void *buf, size_t max,
   149				       bool wait)
   150	{
   151		struct platform_device *pdev = 0;
   152	
   153		if (rng == 0)
   154			return -1;
   155	
   156		pdev = (struct platform_device *)rng->priv;
   157		return nisttrng_platform_driver_read(pdev, buf, max, wait);
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
