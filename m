Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9BE19E839
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 20:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772397901; cv=none; b=aFQ38/CghTEWpEiKn/lbUIzG5ly4VYMMcUUf+yW/6v/HH2bS1pI23aa1bC7mri3fXkKyW/iEkTevz6rPNWmxtogBcy/TDOXLK6LKKDkVoyv4rl32+QZX9NQStBTeqh4O6txQwAFjlhVLASZKcusUVt5TEGG/3AmT2fX15o3ejjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772397901; c=relaxed/simple;
	bh=l8I8l2mP2i3DIxMzaqUFvMd10agMp4ytV4zlGLg/12s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EqlKLUujRePsNEYvvUu/tyP9XaVFKRRz9Uwn52g/cIbdmK8jaK3cjlSXnNOnApoD6px65zsLx6O/hMoisz5U4mEJ6JYTYIeepuuzozK5W3w7enipmPdzR1DM0fOavwaCDUGqLgrabmq1PYawj2hc8WaeIT0St2qZOUVDwp3rVbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6v//2/3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6v//2/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772397900; x=1803933900;
  h=date:from:to:cc:subject:message-id;
  bh=l8I8l2mP2i3DIxMzaqUFvMd10agMp4ytV4zlGLg/12s=;
  b=I6v//2/3gqSw5yxmSUbyvFvAVtomk/nLrFBIG2krfZ6Z4DcblAKFq0s4
   llKTP7Jq002Fqj45dKoje51L4l2nIWhFLy2oTWLHJu8opari44rFNluFF
   wlcxqMt+ZF1Cx4O2BmtWUe/lLIBQS1L9VwxrbT0QaYJyq/Ip2ASRmPKdk
   HIWxS9ZCLocM4Z/jQcJHlFp4Eu1uC3+nom5fcSWkep0YWS06FsIeJaoTc
   VituEo4+mQ8t8CQ3IgSCeE3FmwfZbvyLCySppCPmpIDtxbZtbkcdI4GDx
   NpHpb48C/Icibvp40jrOX/qym38iI/w1ztL0FkhyReNLyR0hwOUQJ8ULK
   g==;
X-CSE-ConnectionGUID: zfXgA2QTT1yBmgmk0o8yJw==
X-CSE-MsgGUID: 4dZ+whZERB2YXWyZV1SvDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73374218"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="73374218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 12:44:59 -0800
X-CSE-ConnectionGUID: mSCmOqTNQmSbSxe6zZA2zg==
X-CSE-MsgGUID: 8n+qlBQRQeKFDkmsNk7QRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="217338881"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2026 12:44:57 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwneo-0000000013R-3xdS;
	Sun, 01 Mar 2026 20:44:54 +0000
Date: Sun, 01 Mar 2026 21:44:26 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 48/57] warning: unresolved link to
 `remove`
Message-ID: <202603012109.UIKVcjJi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   01c00561a643db1264ba75e8b464a87ec2db6126
commit: 3da6b620ceabe07e28ef2f85cd0aaa1f2ad4d7b4 [48/57] rust: alloc: kvec: WIP(?): Add swap_remove() for AOP series
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260301/202603012109.UIKVcjJi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603012109.UIKVcjJi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603012109.UIKVcjJi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `remove`
   --> rust/kernel/alloc/kvec.rs:807:58
   |
   807 |     /// If you need to preserve the element order, use [`remove`] instead.
   |                                                          ^^^^^^ no item named `remove` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
