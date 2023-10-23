Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C81C28E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 19:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAtQrjgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698090614; x=1729626614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qrulJ270ZpjltlRsKDtBgQMx68Yti/oWpHODqpmSSUE=;
  b=LAtQrjgmMa2qV6Gi9pnyLMKWB3QRsjulWqlQq4gN3+vTo3RcOnpEQi+N
   lCB+WICeNM6FYrE+hczat/Pb52j+VBa9lccvreYesXslNOgEI/5+ddp/c
   wg+WMo3jQMeA4VZ/Tv12UOCiTo4sY+8z2G3pRxO5nr75svdPhH+WKkkIW
   2g0bJKnCKdu4zASYx2QTLj3Kevx7a5akc56lwzCtSyOmgT61BTVkJEBgZ
   X9P1IF00RmLZvXzFuGs0xg9QgtSRz8kg+d+GVNAlqwnQIOIvT9NgNz4yl
   OnYd0oID6Pgn9/qRPn7U6rEzDagDhUUG3lPPupUa8wfFVdAW0Obr0ifWt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="389763864"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="389763864"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 12:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="881880908"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="881880908"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Oct 2023 12:50:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv0wB-0007Cr-0X;
	Mon, 23 Oct 2023 19:50:07 +0000
Date: Tue, 24 Oct 2023 03:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/lpa2-stage1 15/61] checkpatch: WARNING: do not add
 new typedefs
Message-ID: <202310240318.EtIx2YgR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/lpa2-stage1
head:   aa77c7fe48f8b863ab1c30daf17ed8893850c7eb
commit: a76db86b3ccc1fe556e1d5ea30962cb81d42630e [15/61] arm64: idreg-override: Prepare for place relative reloc patching
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240318.EtIx2YgR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240318.EtIx2YgR-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:NEW_TYPEDEFS: do not add new typedefs
#46: FILE: arch/arm64/kernel/idreg-override.c:29:
+typedef void *prel64_t;

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#152: FILE: arch/arm64/kernel/idreg-override.c:185:
+^I{ .reg = &pfr0 ^I^I},$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#153: FILE: arch/arm64/kernel/idreg-override.c:186:
+^I{ .reg = &pfr1 ^I^I},$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
