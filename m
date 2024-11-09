Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EC629CF4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 20:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731183601; cv=none; b=K6xUHMXsfixVJa3nyPq3Io89cAiCAN73r8GGAEuf2yO+IUK8xV/fTyfU2j762wHA5RyHQnBQche4/oKfU6ZzoBHuYTAdrcm05DiNsZSCAfYLft3waziVeAv0Gqj+tXgCKFgklHacKfmkGi9bPCqQfN1AERiTKBs0XTCYjSKFlpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731183601; c=relaxed/simple;
	bh=eJcMy5tNr6V6ZmQV/fcB7+y5cQXZoLz41nM+GTggixI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c//8+bCVYkKvAB2ODkM4BFHpKXbu03XHdxPJWNi9vi9VLwg+l1qlcMgABwZCpfb152DysWQQ+Hnm7UCfpijVbezPkeBAeC7fcBDrOF5SZACxIcyxaCLCIz6fU/XfbU9jc/xPowHhhlFTDxrCmTFGA/BTVFPGYLmRH28JbOMd2Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7QZbnRp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7QZbnRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731183599; x=1762719599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eJcMy5tNr6V6ZmQV/fcB7+y5cQXZoLz41nM+GTggixI=;
  b=L7QZbnRpNrUISK/W/4UYTxCJUx4hSbZYx1JlBEgiLzwe8aPxuZGcV8zi
   +p5MmoYHwZCCyFS1c+zXkgSak0bv2P3uRNcm7yh6DXQYUXzT9DBeysA+t
   dSz4NMDhayLMw3zSl3m0onVK7YCb3wRUPkbUC7TvjMtYdbJqv6dwP4dQk
   IrvxtW7g8vmMurVP2FGJ62uefWmGCUfNYhAL/6CKQv8GcBW9W43zL1tJ2
   TEVrDhKVZzORthLJ6Wavb4RzFjTR8pdaQCvRHqEXPzaj0/vcj+vtwbHVK
   dlBlVpWZZbrPBEQgZLWDgdFKVeZBsPjQeBJSYXcb3xe7ZIDSstENtJ6l3
   w==;
X-CSE-ConnectionGUID: mc+Z9caHSTC81iJc+ak4Qg==
X-CSE-MsgGUID: IIGQ+AMxSl+rozed1tRCCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="33901663"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="33901663"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 12:19:59 -0800
X-CSE-ConnectionGUID: GcI3WkPWQ3CmQaF19PWm9g==
X-CSE-MsgGUID: YEJSiWF/TxicV+P74r8a5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86090488"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Nov 2024 12:19:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9rw4-000sba-04;
	Sat, 09 Nov 2024 20:19:56 +0000
Date: Sun, 10 Nov 2024 04:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2024-11-08 57/70] ERROR: modpost:
 "dpcm_process_paths" [sound/soc/snd-soc-core.ko] undefined!
Message-ID: <202411100416.K0Kg95hJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2024-11-08
head:   e9ab69de24b2818ae26f88e606ccea272bfa1705
commit: c1383d0943f0a4626e60faa314a46a23c3948995 [57/70] ASoC: soc-pcm: remove dpcm_process_paths()
config: i386-randconfig-141-20241109 (https://download.01.org/0day-ci/archive/20241110/202411100416.K0Kg95hJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100416.K0Kg95hJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100416.K0Kg95hJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dpcm_process_paths" [sound/soc/snd-soc-core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
