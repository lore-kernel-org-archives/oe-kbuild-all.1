Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94853405D4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708601717; cv=none; b=l+quZsHdXlhkr/HtWr5FCigrK/+eMDKL030BaP3K1yiNAv3cVV9j8+Nc3UnL6Q79T6sGNSUAcFZh6peue5GnXrFzo8qubOr5+dLfwSZBd/zvWqQy90oDryKe5JfYby1N1wYvbZM4VNXiFRPHi/NdRP2+rLvmbZrfp/O9qYDBSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708601717; c=relaxed/simple;
	bh=hkWvMck2K+mMuEMvB/lSVvatS+ESX1huw8c9g+MJMk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SRhm6LlR22t+6j/i9j0QSRT4EqU+VkCmTpfseaMyxo0v924DlyVFmEnP2Yc+2Vai4wvWuXWJjc3hwHk7626wtEZY0Y5p4SVH2M+VV3EYNyd8r7RRmasuTdAgwmUyxvB6lZble2uGiUlQgugwl8bRDNvR5JZ//XvdVbeda8i4goY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSFJIHJ+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSFJIHJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708601715; x=1740137715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hkWvMck2K+mMuEMvB/lSVvatS+ESX1huw8c9g+MJMk0=;
  b=JSFJIHJ+qpfEBzU0UKWcO8buhSKrhaBHTT38+9kmdhj1lk/X8UQsizwI
   ON8yM8otQumeBtA00DC0KZ5/kaPQVKbuLUpGJacgxmxa+EVsRlinu635N
   CYih4r5t1edrjBFUKdxPIYMF3xJtsXXlFiDOpLcvezjroUXQHTtrt0K4t
   zF/GETgNL4Bft504lrav/SSwuvjYKDedx+vMqhfaNRanp1Agj5RnZ4fa4
   oSlY0G0AeaJiWBlCjzTgadMDjOK2zztEIJUY0F/x0gW/L18qI2F4Ibxgg
   6Ju7y7oVCjlLcZXzcDseASTcTTGvYPyu5KCNO2+R4C4j2gFGDlwL0D/nx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14243266"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="14243266"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 03:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="10146280"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Feb 2024 03:35:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd7M5-0006Gj-0l;
	Thu, 22 Feb 2024 11:35:09 +0000
Date: Thu, 22 Feb 2024 19:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [kees:for-next/kspp 30/35] arch/arm/boot/compressed/misc.c:157:6:
 warning: no previous prototype for '__fortify_panic'
Message-ID: <202402221926.xjYd3eSz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   e3508eabe0cce31e8bfd2c9da60fd45f129e37b9
commit: 0f4459080884b688c4ec9c2b121f22c641401bc1 [30/35] fortify: Split reporting and avoid passing string pointer
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20240222/202402221926.xjYd3eSz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221926.xjYd3eSz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221926.xjYd3eSz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/boot/compressed/misc.c:157:6: warning: no previous prototype for '__fortify_panic' [-Wmissing-prototypes]
     157 | void __fortify_panic(const u8 reason)
         |      ^~~~~~~~~~~~~~~


vim +/__fortify_panic +157 arch/arm/boot/compressed/misc.c

   156	
 > 157	void __fortify_panic(const u8 reason)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
