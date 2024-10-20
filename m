Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A723C9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 02:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729390514; cv=none; b=uqitGfEX0tOweXVeAfRILYJkZRydPeojNrozt8auwaeX8A2KIte11g3hzIeenaCATP2OCz33lo4V2xkOF9e9DIjs2zte8qS87YOFJuoe4nX43ZYhz+7erH5mJ5ylNfHvToqZK7Ux/SEASBXEhUzPXk6QHjFiNJmBgXUyy6qT+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729390514; c=relaxed/simple;
	bh=Fdiplepo2jBVugEWmHFOED1OdAod1CU95jypgYdD9U4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sK1PuZMO4FJx5pKdl19qb6LxQJCSn+DSwwD1LXqGB6YSGbsf5TDNPHOOyXe4xaoSUCMO/bnWCsUW7YpeNC0xudcdrSX1VVHHc6+4QQcXeavPG+G8F4Rqzle0W16wETC1jFTHkkO+EXDFLtaFQavfGLyw7tyEpHHeVqbWNJ7bBok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMaC6W1t; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMaC6W1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729390512; x=1760926512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fdiplepo2jBVugEWmHFOED1OdAod1CU95jypgYdD9U4=;
  b=bMaC6W1tUf2kcujN1QaoivJrx/l0gLhZ6yAKd9XiPdog1HR83sEDg/aL
   bKAPFMnfVAN+eIX8FAaj/YOKy6QN1El8eZQbV2bb/UX5jvabewP7/SUm8
   G08xQL9iz6XIjnvtBjrDPFmwUPM9wvpcK6BnbblI5m9FQShXKXbDIfgSf
   SntNFAIPlNyog5xjQIEkRJv65TAFsrR4+C+7HTCwNLj0p/POchylqGLEH
   Q1ShuGo9zkcW62+vk08Owk2Z/nLWyMJ3LKEcDGeXuEI74sDg7uEWQ/Yqg
   xPfxDLgqMfHQPiB2vGM5w6ETGygg9pyL56FAvBotqKrD5zpiEXGWwlYoq
   Q==;
X-CSE-ConnectionGUID: uw5p8YAWQra6r/x3E/pv8g==
X-CSE-MsgGUID: SbjRLXacQ7aCk78SXO68sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="32808584"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="32808584"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 19:15:12 -0700
X-CSE-ConnectionGUID: bl1iwmbGTZiZKzoNKs07qA==
X-CSE-MsgGUID: 2mGF3DGjS+uU7O6t99Z8tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="109960205"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2024 19:15:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2LTI-000Pmd-2a;
	Sun, 20 Oct 2024 02:15:08 +0000
Date: Sun, 20 Oct 2024 10:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 19/19] ld.lld: error: undefined symbol:
 io_iov_get_page
Message-ID: <202410201004.zpSPQFOM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   2ddeede97bba995798be3e7a1ae9ac3340bec129
commit: 2ddeede97bba995798be3e7a1ae9ac3340bec129 [19/19] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: x86_64-buildonly-randconfig-004-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201004.zpSPQFOM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201004.zpSPQFOM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201004.zpSPQFOM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: io_iov_get_page
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(veth_iou_rcv_skb)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
