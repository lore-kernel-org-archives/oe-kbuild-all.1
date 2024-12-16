Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF53139CEF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 23:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734392117; cv=none; b=U9+BLpv+Z+OgAKyoy4VGqzM6C7TyPWlBDzsqPnxeGc02GZ5j4J2CWlf2uslfofPiY8RIJnmTbmxCPqXFE4WLF2BfrZiUcZzcwlRq1GMHVE+67hFEQH1DU9Bj4Q+XJdNcYFuSEpyREPLXW7oTTXCTuUddRtM5dq4/cfX9eD/jlkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734392117; c=relaxed/simple;
	bh=gg9VkjhEmMuf+/scGYKsus3xvm+0RuRno9H5W8UYbcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZhPq76IHCntGpqeSn1yqEDuyqtCpvXP7OqupJkHtfZYJZhBaBRtcgyVlWTk2h8yoizxZhNZmp6tmHO7kUoHVaIYyKSWiViubJwqG35NfwCADanz3bKxoA4ixncv5DNfk5aURNge936G0oGvnwzHVajTRr5m0LBzWFeajhxo/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrjzcq1u; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrjzcq1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734392115; x=1765928115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gg9VkjhEmMuf+/scGYKsus3xvm+0RuRno9H5W8UYbcA=;
  b=jrjzcq1umiS4v/6uEi4IOQlgLlM1LQwMqmHukgoO86CMnFitBMZdy7Xo
   YFzlOX9fW1eO+oo4KZK9sqrolE0lLjV6gni9EAsPek6Qk7GSIpYz0n4VZ
   78gwOUIZKm8Js0WRvDK/c9KQN3eF9nQgY4XRupjUumFz+Z60W1pC/7R23
   Vwu629PJYn51Jdkb6Z96HfFx/vfZ1/MrmrPDUMxcSmRwskht3wRRNxGA9
   bTjkUsrmdcpg03XAYwu2nz9Fksb5nUUdWC+RQ8yQumKsBXDGL2iyuWB3Y
   7BA80mXnBOG8jQIG6zM4MxPtyBDh6n4+NvmWUMjdpOcYfPlZWBUT7TAg9
   A==;
X-CSE-ConnectionGUID: 2ojwh3DhSQuTp4OjReLXjA==
X-CSE-MsgGUID: mgFT3oc/Re+HOuMf/BChKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="37646112"
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; 
   d="scan'208";a="37646112"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 15:35:14 -0800
X-CSE-ConnectionGUID: wC3jid4hTSS+5o0r4ILVhQ==
X-CSE-MsgGUID: FbSoNsccRr+/6FjAP2um5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134684060"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2024 15:35:13 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNKcI-000EYS-2w;
	Mon, 16 Dec 2024 23:35:10 +0000
Date: Tue, 17 Dec 2024 07:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4328/4379]
 drivers/firmware/cirrus/test/cs_dsp_test.o: warning: objtool:
 .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202412170707.Yw6zEjCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e25c8d66f6786300b680866c0e0139981273feba
commit: 0ff1673013c7111e301637337feb1398eeda5802 [4328/4379] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: x86_64-randconfig-r063-20241216 (https://download.01.org/0day-ci/archive/20241217/202412170707.Yw6zEjCE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412170707.Yw6zEjCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170707.Yw6zEjCE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/cirrus/test/cs_dsp_test.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
