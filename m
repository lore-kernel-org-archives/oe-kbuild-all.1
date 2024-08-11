Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638B91757D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 17:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723398856; cv=none; b=coB1tUreGr72xiDe5Q7Dev71qL71FrgQf9S6iSngwU/KkiqStBNO6nPe7Cg3MuUQDwlLqWB1/OPDPLKWkmMn9LnmhkeUfw7q9vBbkmVPP/0hmuC0yzuZbRl5Zg8Ysz1ybZtHYat2JMNqre+dZEwRLSyDpkSSqYzJyLsyUUPC6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723398856; c=relaxed/simple;
	bh=qWLG/Uz5zhJNNIlQniHQE0Br3iisDhn3Z8k9+7A3tvE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UNhM2Z7DYJmAvqg6c2TPhqlj+zvC+4k6MQF7R8biVk6/m9D/2/14ejwlbaL37gSqaTlcfPt/f1Elquyu4Eu1PmrwwoXKU3+Ny6dsqBrYdFndZB7sNREnftLc2xu27Gb8Rm68Qln7MSahR3lw/AdrfwR72p19krP1V6JYHdNYO2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUDmiFo/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUDmiFo/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723398854; x=1754934854;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qWLG/Uz5zhJNNIlQniHQE0Br3iisDhn3Z8k9+7A3tvE=;
  b=RUDmiFo/sM71smqko8pPuuuHE/UPNj/pZGo6QMPY78F+1tmrW2nFXyoE
   hdikqWLcuII7cnXDCzDP/iGx8g021Lk6tx26mxXwnlZySK0j335OEDVUT
   m/4Z8KcxCW1qpG6twrgWeFn614lS9FLXT6n5rkzNVBrk4cPNNZsJx9UNw
   a7jlRY+CRGQpXe3tx4tUM1/XSiUsh2wRPjYfKNFenkzhpDTjagZA3waPP
   Ws5VUv/tVOLqLMlY8a7Ikz9pI/1tJhDV11qn4z0tfGNt28omPJbb/ZeCf
   kv56l0sUexWHTCuvYbQtMBWxRscZ549r4tb4cgrGmV/hVYCgHgBuuVYj8
   g==;
X-CSE-ConnectionGUID: OZpO5W55SFeU5EmJY53rcg==
X-CSE-MsgGUID: BHgF/JtMQt6mIng7tFFwtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21360204"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21360204"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 10:54:13 -0700
X-CSE-ConnectionGUID: FGAFjIobQvejJuuTWrJQgw==
X-CSE-MsgGUID: bMDjcI5JQNG7QoUrH2dy7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="57951504"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Aug 2024 10:54:13 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdCle-000B27-1l
	for oe-kbuild-all@lists.linux.dev;
	Sun, 11 Aug 2024 17:54:10 +0000
Date: Mon, 12 Aug 2024 01:53:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 5116/30000] aarch64-linux-gcc: error:
 unrecognized command-line option '-mllvm'
Message-ID: <202408120139.0VPRCkTU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   4c260f8c19e47797dc45536bd30aa057d85532e3
commit: 2d4373a48297e4cd2ef2d194ad3beba41195c4ed [5116/30000] UPSTREAM: kasan, arm64: select HAVE_ARCH_KASAN_SW_TAGS
config: arm64-randconfig-004-20240811 (https://download.01.org/0day-ci/archive/20240812/202408120139.0VPRCkTU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120139.0VPRCkTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408120139.0VPRCkTU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-gcc: error: unrecognized command-line option '-mllvm'
>> aarch64-linux-gcc: error: unrecognized command-line option '-mllvm'
   make[2]: *** [./Kbuild:21: kernel/bounds.s] Error 1 shuffle=3837122274
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1167: prepare0] Error 2 shuffle=3837122274
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:146: sub-make] Error 2 shuffle=3837122274
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
