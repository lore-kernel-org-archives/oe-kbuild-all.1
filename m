Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A381DFDE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732715134; cv=none; b=q0WsU39fmzBPRX/byDM/1M2iI5jkDKAbbE6ASDsdWRg4LV/eZ6AA/JDW8PyaSbMLupL9iB1Cxa1BqTas1syuvo/dBkuoRLMK1u6qcRs7TeXNz+5K3KoSg28Ff1uLBG0qgdLvift8+OuQnvzx2uyNeeTm3OXLDVXk/55N8x/BjAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732715134; c=relaxed/simple;
	bh=CHTvaJya4QPfDIuZ8edpN3aTs09GINCPo+gcJAXGfbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGvgPxkBCb09DeEBgSi/LK/26hvIrJZLL80O1+uN7nNXoMv878vBQcJK8C8ZG8phTrogP1RQ96KawXr6+XNIhyRgnpziDo0v5p3n3ayAcUA1rwWmGRzhp9d+zTpfpMoYtCH94h8QTIGQYDMtnOU1rW7UPclJyF4aueSoOicjPys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwRmBNRn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwRmBNRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732715133; x=1764251133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CHTvaJya4QPfDIuZ8edpN3aTs09GINCPo+gcJAXGfbk=;
  b=cwRmBNRnEVrsk4qBEXxoAoxVMnxP+ppr/gOD7IFus10TZc7GjyHQqWop
   HYqrcEgU3cJEzjKvdTkSib2l8FbUHOPgMn/an/EorGLacfWZuiH1kB0iy
   kkHKAwDW8OsVE2/0cKaivhzdF1yAA98wtrpXPO0+Rs0WHA8e+0ifqyZdH
   aTRG4ohyp5A3wLQkY3UaBThXKCwXoiXSSLJ/60vBro3pBAbF29z3TLH0h
   lM1BD6pC/7e0o7V/eWMfl2V5/fQUc63eWYikXbeBd1NoRGWKh4a/vK0QR
   OBUNSLJ0jdwV/JBAVNtweOWPs+8Pvyg9Y85Ca771gYFLkIkn0bmuaGmyZ
   A==;
X-CSE-ConnectionGUID: uA1Dma9wSQu5m5n8Kaic5Q==
X-CSE-MsgGUID: SbFmjQPyTput1W0yk1zRCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44297383"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="44297383"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 05:45:33 -0800
X-CSE-ConnectionGUID: iZWa1Zq4T5CcijPlETT6aQ==
X-CSE-MsgGUID: Gyvon94/TVS4pHAySRMd6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="96699271"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Nov 2024 05:45:31 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGIMC-00081f-33;
	Wed, 27 Nov 2024 13:45:28 +0000
Date: Wed, 27 Nov 2024 21:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v8-region-rebase 22/22] ld.lld: error: undefined
 symbol: io_iov_get_page
Message-ID: <202411272107.lEUt4Mjh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v8-region-rebase
head:   40f3c0ed84549afda9f6b6f3b9503ee7191809a4
commit: 40f3c0ed84549afda9f6b6f3b9503ee7191809a4 [22/22] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: arm64-randconfig-001-20241127 (https://download.01.org/0day-ci/archive/20241127/202411272107.lEUt4Mjh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411272107.lEUt4Mjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411272107.lEUt4Mjh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: io_iov_get_page
   >>> referenced by veth.c
   >>>               drivers/net/veth.o:(veth_iou_rcv_skb) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
