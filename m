Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B710B488229
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792388890; cv=none; b=bHdpnwKFXwGXWXd0G61znVgv2Jl3htg87SyCk5XT2N+C4vGCDHkhuSeOhSVBAH16fqZIzMJMbBfGwr/KoUPgNDPl120vNhJhR4h37RUse1gSuC4z7qDnSTIO6eFYUSmHMeNM+IAofe02cr8gFmjg/5/xiSOzBPhbFcybPYCG0Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792388890; c=relaxed/simple;
	bh=irN8ZCi+yOzXfzt0JrWkYTwBlwgAuyR7gpaRgH8+sns=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BNr6s7HLcEaSHBOkR+R3G/cLTzhiSyir75Z69afjSsoXcVQpWvSQ6tBCAKSU7aJchJ0Owr4auSm/Gk3l9ZaYEOmCal1n028Z68dAXRnSRD33WC5AbLfVJuv5nJi7ZK4kpxbj6VbAMgkfJfvAQ90cOcV6+2aJkTDjD5FOc4LAJ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQ9K+8po; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQ9K+8po"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792388780; x=1823924780;
  h=date:from:to:cc:subject:message-id;
  bh=irN8ZCi+yOzXfzt0JrWkYTwBlwgAuyR7gpaRgH8+sns=;
  b=hQ9K+8poOQPoIjc8OD6ZDbJfqtcLpngvol2tTy6DK98vvNFZv98TpRUH
   lPiMnanOs1Ot0AlWgS+VKepTD0tHrC/ibXkXIz58dwGABKAoBjKIIrZAW
   0vHJM2II7B1NIXZ5kDh1n6kQ4tke3wCaEhrCCj+QvJgFuLoKUe5COf7EB
   kAYGRtiLFunxwav0/yifYCrWL/p1gDVAEeBOiBdWIo9Hl4pSWgj+AlZn8
   /CRjeSxn1Nd7pNB8ENT0eTrrmkk0TpMGW8wzWGffViIje6rWe9Ft5EQVE
   y7ajTT9gk7Y28v89icriEsqiN4ztvKaJl8/RMBFz7fkFkcVKOeaMjj5CR
   g==;
X-CSE-ConnectionGUID: 4YJ5TtduRv6sIBc5HzRQfg==
X-CSE-MsgGUID: aV4R5q1ITwu2wUPkOJLkMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1057322"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1057322"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 22:46:19 -0700
X-CSE-ConnectionGUID: KYvV3HtETGe8SmjqkbRjxg==
X-CSE-MsgGUID: 6nNUfo4fRbCRhCF8MIWAUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2531118"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Oct 2026 22:46:18 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIgCN-00000000LJi-1sdc;
	Mon, 19 Oct 2026 05:46:15 +0000
Date: Mon, 19 Oct 2026 13:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4 8/22] vmlinux.o: warning: objtool:
 ___bpf_prog_run+0x2: ignoring unreachables due to jump table quirk
Message-ID: <202610191359.W4pjI4W1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4
head:   1abf4915b934f55c588e220cfc73188a5d4f13a7
commit: 20f58aa1dc32160414033482f1b4ee292279d225 [8/22] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20261019/202610191359.W4pjI4W1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191359.W4pjI4W1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191359.W4pjI4W1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ___bpf_prog_run+0x2: ignoring unreachables due to jump table quirk

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
