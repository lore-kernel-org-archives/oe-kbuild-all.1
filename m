Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794126928;
	b=ZI6hUKB2c4wGex400KdXFvErzI6fOdUZ7Af3pFkuY+MSAVYbWepVWr3lEFfOzHHUc2au
	 SBuBQtLDYV9c+/uQUtGraN0GhEhPvj9eciPR4alJ9nEWM4OXK0XWq/dMwRVU2MUDiOFoN
	 dmCrr01+t9pA6Car5uw/XjP7PLTkObDGkPzjY46qQ5UfALcnp9fdMA8HfKxNC4EWS9YxK
	 gSZgVYsrBdwqosS8AdqQrHOKs0tv/dVvVlNymEhSLmHOjgS8eqV/RAMTics4uhpw/TkfJ
	 hHiBmXkxTlc/VjInEiz3+CWHK4Qh9P7Sdrg803MzIqxLhLIRcUH8U2g/he+TWoZioSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794126928;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Yfauk5KfzoCAPKUuTaFyVXwDO8iAGtqnm21WkDYwfh0=;
	b=cVVKnQ0t4ChKwxvipAgWzLg/PVwDyOAQ7ATuF626Q+8swWBzcGZMtsZTDTFaudlj7JLV
	 4LWRLMOuNudNFQss7AgS8IcdZtmJLuIsu171O9bSxd4w1ZhxjsXpEM2bt29RhPn0GjTmY
	 fEhh/O3tFcdHkCj7c53IBeMzStfvn3liC+FtmKGmwzWNdJPcQRt4E4v+jR1dcf/oaDNql
	 mrtaaKZ9lkENXgtOwI5ZPQuIHGE6+kL+0Kk2iC5Y1aOcZolCr6tOCBFwRMDLABx5THL2Z
	 2jlFqNjd0ZzsXS5hoqUnPmxVbrl/41fy/VCua9/5kyma84nOgGURb3F0MnIe4e+29hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fvr3bBaV;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754B9606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 08:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fvr3bBaV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794126926; x=1825662926;
  h=date:from:to:cc:subject:message-id;
  bh=QRReOroKM2rdIiE8TyOumsZ3Gz64Yt6XKRGQ8EPxfj8=;
  b=fvr3bBaViS7N3LleWrch2W4qv3/DAfzTSN0aw4UZlrBWWBhXgqld6los
   sz6/c2emQZUR9JsgeT2y2zo3BuQX1c06m/J3EyXQs8ZT4QGnsR2VIyUBv
   H6Z8AzTchP9GTkveTiKjEMqrCZ9O5kOnLs4eFHNty/CIhY4iWkXoQsDqb
   Gnqy5MZdR3BdefN6KIKmqHvdoxjJdEbksxSveAy7IYl7pF87PSvKg0rlG
   oUnb6biBMVcvPYj1ulQIeLEjxlYjf2ww5gH59vLuQSfasbnmOTEZBT/4W
   wd1K9PgnZ7c0Tr1RusIg3yCs8UzqBXoD9e3Ge6IogTNZAh3nQ38KwnIN7
   Q==;
X-CSE-ConnectionGUID: S3iWoGhjSV+MijS34q7zKw==
X-CSE-MsgGUID: n89OOvjrQYKozgyJ3NapSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2781277"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2781277"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 00:35:26 -0800
X-CSE-ConnectionGUID: L0I1r/8PSTikmm+qoFBeSg==
X-CSE-MsgGUID: 6LvrtWATTnCQTi476MRchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9369696"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 08 Nov 2026 00:35:24 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPyMz-00000000BLH-2Krw;
	Sun, 08 Nov 2026 08:35:21 +0000
Date: Sun, 08 Nov 2026 09:35:12 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust 32/56] error[E0425]: cannot
 find type `Ac97BusOpsTable` in this scope
Message-ID: <202611080941.9qo4R6Fh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust
head:   85650012d32d6724c5a416eab5ddc324b945e9f6
commit: 9c97f088f138c82c1b4f57f1731ac544fa4b47e6 [32/56] ALSA: rust: add AC97 codec abstraction
config: arm64-randconfig-2200-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080941.9qo4R6Fh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080941.9qo4R6Fh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080941.9qo4R6Fh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find type `Ac97BusOpsTable` in this scope
   --> rust/doctests_kernel_generated.rs:18624:24
   |
   18624 | static MYDRV_AC97_OPS: Ac97BusOpsTable<MyChip> = Ac97BusOpsTable::new();
   |                        ^^^^^^^^^^^^^^^ not found in this scope
   |
   = help: consider importing this struct:
   kernel::sound::ac97::Ac97BusOpsTable
--
>> error[E0425]: cannot find type `MyChip` in this scope
   --> rust/doctests_kernel_generated.rs:18624:40
   |
   18624 | static MYDRV_AC97_OPS: Ac97BusOpsTable<MyChip> = Ac97BusOpsTable::new();
   |                                        ^^^^^^ not found in this scope
--
>> error[E0433]: cannot find type `Ac97BusOpsTable` in this scope
   --> rust/doctests_kernel_generated.rs:18624:50
   |
   18624 | static MYDRV_AC97_OPS: Ac97BusOpsTable<MyChip> = Ac97BusOpsTable::new();
   |                                                  ^^^^^^^^^^^^^^^ use of undeclared type `Ac97BusOpsTable`
   |
   = help: consider importing this struct:
   kernel::sound::ac97::Ac97BusOpsTable

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
