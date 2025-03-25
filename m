Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49D620468D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 07:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742886326; cv=none; b=H6dupa29u0EBBCrB4OsapohjLyG0ItxPZUYqSjsKg0r9iR4lKXFk7AjG9a88nMDHUXUSmKeZSMBWphk/tUSGtUXZBlTVMZy13koqfYYrjwU9rR36jiTijpTLUKDr7lSIVKbxZKNKfBzD8QXHkHBfn/+HIxWIlCsOAUn7oaHtkMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742886326; c=relaxed/simple;
	bh=5/LiW29dAfR0Z7MbTNhPG4eo9WikRDCpH0t68mRjvv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4hyGSSPp7ublmr6wBpPELvhuKb+IkgkpMmz4c9iqCO9l9+EDvBIZr5kIAfeeD2ywYLxC+8a3p6XZxDxyupHO1CnzPFa+1zHydzsCM3C0ltGxKIeLOAX+6uV/mxXOVbE7ylzMCpNSBJQtKv8d+1fTo1hZmtm6aBUrMBAmIvFG7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3MDfh9i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3MDfh9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742886320; x=1774422320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5/LiW29dAfR0Z7MbTNhPG4eo9WikRDCpH0t68mRjvv8=;
  b=W3MDfh9ieIL1hVoVDHXvJONroCbEzetGOuXvDmzInSmN3905oXH4HaeQ
   UPVPRt75S+1CsugYWcc01Hw4vebLbBI/scTvg94Kan9d3oQR9KKz3bEnM
   VeqsIbR+bKqnA6hRB9xtBW+I++m1TgfrM58qFdyhdnWSnPZBREpMqxUtm
   RAyou/TMiYAbgj2y/4QQ84EXBv7ZDr2k7wPtS67btpYUbEf0P2YCUOf8m
   yloBnb4rNiEKxaeXLSc/NejRlzqYuOpcF/V6nJWIXvi2/laT3U/h7qwa8
   httZ82PCJMwErp1IFa/xjM+I+8KElfhhy8ESqLZsombF59GYmHdQx37RZ
   w==;
X-CSE-ConnectionGUID: c/8Y4l3GRpSyRQhI6LwnXQ==
X-CSE-MsgGUID: PwkHzhxQRU28m0anz9g6hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47773205"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="47773205"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 00:05:19 -0700
X-CSE-ConnectionGUID: kXRC2HybSQqW+ZKIHg5l2Q==
X-CSE-MsgGUID: xKCJtUwXQ4qSBfHvybD4ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="129109532"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Mar 2025 00:05:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twyLb-0004BV-27;
	Tue, 25 Mar 2025 07:05:15 +0000
Date: Tue, 25 Mar 2025 15:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1513/1513] mm/page_ext.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202503251400.xG2WACIP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3e8e3ea77f0dd528b080f91d615144093b741003
commit: 5f0e34d2aceec67c169be7599d82f0e8519c37f7 [1513/1513] mm/sparsemem: fix 'mem_section' will never be NULL gcc 12 warning
config: x86_64-buildonly-randconfig-005-20250324 (https://download.01.org/0day-ci/archive/20250325/202503251400.xG2WACIP-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251400.xG2WACIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251400.xG2WACIP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_ext.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
