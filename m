Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984215FDBC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 23:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707609585; cv=none; b=Xp155wdgKNKBtfE/C8az0q40VM2rVm/3T7eKeu7+IRSuMM12nlZ0PtMSyK9/Q+48h2jD/7gaPiCcyx1WKIJQx2ASOv4e6pH5bGIJASs+B+lhIcbqSJRm+ulCZoi8i//RITYxiQyaU8LaEiIiGj0GZ9QdlPBHqYFOugQRkPWRrWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707609585; c=relaxed/simple;
	bh=PzvS797WbKuuMeYmRedZFYAKgIbFDlOYW+z5klHEbJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q4yb/WTAybaNp7odFwNuPz1rMC4xJ4LB6sLRLJt1eg1YTB1U+a/g3+G5q219W7xRN3ZlX1bxWvHRUi6IWMGeXLMpkGGgMyd6cK4AC5d8H1tOB/QMRWZMXW2FXpnEupLzwlUTbyPZfCGdrlQoMbAU42RvT1ljl+mc73e5Mw/EIJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKgfv8NQ; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKgfv8NQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707609583; x=1739145583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PzvS797WbKuuMeYmRedZFYAKgIbFDlOYW+z5klHEbJ4=;
  b=PKgfv8NQ5Zav5bR5w1Q82qsilDUnFXA/TIUuX6jjjSyaxWNgZts7Lv/2
   3ZDJY65oN2c9CSNG+5zBMLpu/9JZcxYUiSnXPYpMoAlEHK9QlCgWwzZ9n
   mLAdDBNeUDJIaPMymVSQ72+Pu3rpveJL+uiShNgN5cE0nR8pR0PaYQIWo
   bJtxtz9+ze8TlFvaIs8Yu+6MMVz2YBpmLYfRD57zBofmJe3D/zVpmFWbH
   XW6CIG0fpm4y2Gmk7GwQTX/tZbhQobwFJtyKf7I310EFcu+QlVesOwR7i
   vQP1Mebkqd9XHqBZWx69Pm7+OdWNXkm9Y9h/PRKMMgzasglKU9VPBBhD3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="396028930"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="396028930"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 15:59:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="6881463"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Feb 2024 15:59:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYxFz-0006By-1v;
	Sat, 10 Feb 2024 23:59:39 +0000
Date: Sun, 11 Feb 2024 07:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Subject: [jlayton:dir-deleg 5/5] ld.lld: error: undefined symbol:
 nfs4_proc_get_dir_delegation
Message-ID: <202402110749.VeHXUGra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   bbc24bba5c1b3f92bc88efbb08afd159cffceba2
commit: 7b60285292bdd8a4c76775a8eabde93e9dd5b8a2 [5/5] nfs: add an ioctl to fetch a directory delegation
config: i386-randconfig-141-20240210 (https://download.01.org/0day-ci/archive/20240211/202402110749.VeHXUGra-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110749.VeHXUGra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110749.VeHXUGra-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nfs4_proc_get_dir_delegation
   >>> referenced by nfs4proc.c:10722 (fs/nfs/nfs4proc.c:10722)
   >>>               fs/nfs/nfs4proc.o:(nfs4_cachectl) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
