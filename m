Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7254DF71
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362407; cv=none; b=dZz7/9AVVpYXd0gTKzojFMokAAxpUJxa4Shs+SldYoEv+0snxqefmntSSYbyuViRZpoF7ikPyAisEST87+Rs2tC9B1r7tX7/o91A0o8Zd0vs3ncQtGzFQqv6HvExMoMFXA6uFiOo3BHOhf5Zh09yzzxiMA4ePNAOXLBPKQSlSA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362407; c=relaxed/simple;
	bh=gJyOePxI6H1GDBn+mUKiNPnD76HzLVMYPVc5lHdipzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QksUebyrRSeBdEVzA9wYyKP9kIhXqcr7flHGnuS2q6b6IMoxXgs8SwI/um0QZ8QK1cBF+WP9pOUSDM1EHdAhmiruzyKH1dTu2DcdC4nviSUMuqo8Tua2ikOzjAJExrtRMKleeR96Nq/bNPwpWVh3IVTY5QxSOnUyHPXOsWgG1Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLYvq2c5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLYvq2c5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741362405; x=1772898405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gJyOePxI6H1GDBn+mUKiNPnD76HzLVMYPVc5lHdipzM=;
  b=KLYvq2c5AIoHI94TuLMIT4CFJ79JRXYicGWgm97w/cSPwRLsgwjoTTQC
   z0aU5PPQaQnJg8f26JAPyq7hqFCllnh/ngSWtHmNeEWbXNAUtnitZD6Iq
   RvW0F0o56VXwdyDlWCkuZ4uHzel/JLsYYOEnZeGEwILjkN+w+1hKZVaAb
   +SmR0hDN5+c3mWdxEmELxLWqUNQsVGizD91nI5ncS4vtET3UJXgs2eBU+
   2riDQEA59maNM1WBA8Q5nLdOThM2t+RUl37hsEIBFpm1L+qpkzWKB/V8t
   6af9wIteaE733oG1gPxctpcSNwHKWAN4BwuD6LHIavpeaq1KXPL1WFeOv
   w==;
X-CSE-ConnectionGUID: gshmVDn1TWCaRBAX7Bp4pg==
X-CSE-MsgGUID: RlEt5a87SJyyHCS4E9mWUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42270412"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42270412"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 07:46:44 -0800
X-CSE-ConnectionGUID: 6BxCoXGgQLWB6gpZRsceYg==
X-CSE-MsgGUID: i89SR26xTMSOm9gOIPrxZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124581552"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Mar 2025 07:46:43 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqZuL-0000fP-0Q;
	Fri, 07 Mar 2025 15:46:41 +0000
Date: Fri, 7 Mar 2025 23:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6612/9634] arch/alpha/include/asm/io.h:636:18:
 error: implicit declaration of function 'ioread64'; did you mean 'ioread32'?
Message-ID: <202503072343.0F0mSGyJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: dc90c890363d3e4b0ec73cd21b5be592692723fd [6612/9634] asm-generic/io.h: rework split ioread64/iowrite64 helpers
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250307/202503072343.0F0mSGyJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072343.0F0mSGyJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072343.0F0mSGyJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/alpha/include/asm/hardirq.h:8,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from drivers/ntb/hw/mscc/ntb_hw_switchtec.c:7:
   drivers/ntb/hw/mscc/ntb_hw_switchtec.c: In function 'switchtec_ntb_mw_get_align':
>> arch/alpha/include/asm/io.h:636:18: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Wimplicit-function-declaration]
     636 | #define ioread64 ioread64
         |                  ^~~~~~~~
   drivers/ntb/hw/mscc/ntb_hw_switchtec.c:204:16: note: in expansion of macro 'ioread64'
     204 |         size = ioread64(&sndev->peer_shared->mw_sizes[widx]);
         |                ^~~~~~~~
   drivers/ntb/hw/mscc/ntb_hw_switchtec.c: In function 'switchtec_ntb_mw_clr_direct':
>> arch/alpha/include/asm/io.h:637:19: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Wimplicit-function-declaration]
     637 | #define iowrite64 iowrite64
         |                   ^~~~~~~~~
   drivers/ntb/hw/mscc/ntb_hw_switchtec.c:232:9: note: in expansion of macro 'iowrite64'
     232 |         iowrite64(sndev->self_partition, &ctl->bar_entry[bar].xlate_addr);
         |         ^~~~~~~~~


vim +636 arch/alpha/include/asm/io.h

^1da177e4c3f41 include/asm-alpha/io.h      Linus Torvalds 2005-04-16  631  
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  632  /*
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  633   * These get provided from <asm-generic/iomap.h> since alpha does not
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  634   * select GENERIC_IOMAP.
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  635   */
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06 @636  #define ioread64 ioread64
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06 @637  #define iowrite64 iowrite64
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  638  #define ioread8_rep ioread8_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  639  #define ioread16_rep ioread16_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  640  #define ioread32_rep ioread32_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  641  #define iowrite8_rep iowrite8_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  642  #define iowrite16_rep iowrite16_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  643  #define iowrite32_rep iowrite32_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  644  #define pci_iounmap pci_iounmap
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  645  

:::::: The code at line 636 was first introduced by commit
:::::: 7e772dad9913992d0351df760dbe72cc32d479f2 alpha: Use generic <asm-generic/io.h>

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
