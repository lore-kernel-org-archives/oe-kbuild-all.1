Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89549303C9F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769784499; cv=none; b=p0x9kxMekVGL2SX9MJhax1tdBbWoSujxpg1yBcSwO6rm6BZFFGPjIB4c8g1Y/gThlbWvqEk1exkl9kyha2l6nBX2RbW1OhdJBxsKo+vQnysXJvpfs2hgkqMCZyGKpxpKw/GpF8qjQqeYhk2XdYRzYQo2ERfTQu9Y7yn/vVZ6o9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769784499; c=relaxed/simple;
	bh=y84BDFdkpStmHT9V6XMVnLZImVK8fFZOSGpB+STX9Pg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WiyUWLR8FThUjs8aqMmhlQU/HE02yA6W/aqYzerXZIfQq0vXaluB+lqGxaH1epJKeFY7nBAOui3OfI03nUpBsOilAm10CLqYefdzoceyP7ctmwc5yiivgsgAbff8qAlEVfvWc95a0Adoxwu4hKwm9xjlBA6qt/sWrHDl+C4WCLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLFCdaDU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLFCdaDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769784499; x=1801320499;
  h=date:from:to:cc:subject:message-id;
  bh=y84BDFdkpStmHT9V6XMVnLZImVK8fFZOSGpB+STX9Pg=;
  b=kLFCdaDUqGsOtN3uhuCd1RF50t+RIM8xaSA2wd8qVJ5jUMcN1IB9ChIU
   wRToWMWmPpCS2cdlr0BTmvwe4QJQkCgYN3UCUAVpi6B5TVZTnnYpYXi9k
   075Tuyc7c4cc7uBgsT0y5gFAjy/YsZTAXXnh4CbTWkzIjShE/3zdTKxL3
   MuY8C4Fyahtc3a9ptx8+PNx5BETMhzpa776MpWcjirgMg7ZRLC1Bqojc9
   IlFnFgEjhvQ6GxABim2r4e+zjlWqWTYIJXZOyTyLC/Rm6VqQT6dEIkWMX
   ZF3KP0W2Ch7n52g7BVvQNvHa93JyEaYIGjClQaWq3KfcMt4E8ZYidpApL
   w==;
X-CSE-ConnectionGUID: QHFzninpT4qLxf3fTkJfpw==
X-CSE-MsgGUID: mthlBw7DQSyjxNkVgJV4LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88451518"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="88451518"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 06:48:19 -0800
X-CSE-ConnectionGUID: DO/hix26RWW4cWABI2yeDQ==
X-CSE-MsgGUID: UHNGnbtHTK+zTbC/9mPPog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="240137748"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jan 2026 06:48:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlpnB-00000000d38-3LJr;
	Fri, 30 Jan 2026 14:48:13 +0000
Date: Fri, 30 Jan 2026 22:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Alexey Gladkov <legion@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: xtensa-linux-objcopy: st2a95ta: warning: allocated section
 `.DebugInterruptVector.text' not in segment
Message-ID: <202601302238.EohgQKKM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4d310797262f0ddf129e76c2aad2b950adaf1fda
commit: 3e86e4d74c0490e5fc5a7f8de8f29e7579c9ffe5 kbuild: keep .modinfo section in vmlinux.unstripped
date:   4 months ago
config: xtensa-randconfig-r073-20260130 (https://download.01.org/0day-ci/archive/20260130/202601302238.EohgQKKM-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601302238.EohgQKKM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601302238.EohgQKKM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   xtensa-linux-objcopy: vmlinux: section `.WindowVectors.text' can't be allocated in segment 1
   LOAD: .data .init.text .init.data .init.rodata .data..percpu .dummy .WindowVectors.text
   xtensa-linux-objcopy: vmlinux: section `.DebugInterruptVector.text' can't be allocated in segment 3
   LOAD: .WindowVectors.text .DebugInterruptVector.text
>> xtensa-linux-objcopy: st2a95ta: warning: allocated section `.DebugInterruptVector.text' not in segment

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
