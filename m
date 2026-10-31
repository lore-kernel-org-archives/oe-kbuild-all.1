Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793411656;
	b=p5zmyfbXYLUjcCCaRzTO2iTOjBK697U/0MBDu9mk2BMp14FNVMitdKb7MJdN0C7FfVhp
	 csYa7mfe6QldZhTu4AXGwla207C4HQ/65xBLfVMFkYuC3MBR4vem/bchjhJKSzMq3AySy
	 c9kokBKE2+N2mL9Uoq/eb1e4vBsJwzHpCOZ+L6shLSCQz6RkhL+ox8023YyrejAuYoRBj
	 577JnmOZsYDks2BIhbCVQsTM16O4iWJpI4AAsaWb6cO82+bYj7sSLnA435dSoidkPeWwz
	 jOJa9v1ey1lzCJKLPyTYmY2CtBx4kWXDZpgMDJH/ssBx/5SAYcuAj+keuL+JGP9AQVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793411656;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KmczHtFQ5eNC0VKMeLZI3CgTTru1oael/f4N4xiNguM=;
	b=r5cn6fVxGaHkTy8krIgfi+WDB/dC8ApidGpl3a0c22BaUalp4tHCCmKxWvojQWux3YnL
	 yAhCh44N2qs16mOrGmdrxKNuHNAfooe4sS/yNGDNrFPzRrsx2Uq3xgz6GUnRtKs6+9m93
	 ujXuJg/A76FmN8FBpG1iLrfSLbG9iG7H0kTyYEpw8cDzT8khms5YqGboSGqJumPw+m8lr
	 yFaTsBm956KYEMyyRVKDW+Q9WXJCbHjsDpfONU+nuLB+Q8Tl+eZntWqR2UjDSCr9PTkjj
	 hyYEvkWjjHEdJ0lMi6yihhn0Re94QDHb1OcX/O8clAU5W27pXnpo5D1BPbZDcHjj6jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gjpSDKJp;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D291606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 01:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D291606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gjpSDKJp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793411655; x=1824947655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BXWnVn+cRnGIcPln/CCZ9v574AOyyXQi2017M6apAN4=;
  b=gjpSDKJpDttlUUi9nPSLO1bZUPEUVWAtJEU4apo8/ZweEHFZXFzjOptO
   gS1v+4/IJ8cadLeyMTI7xoPOlbc1b5SYY5A/uj3VURcAiwjuOfLwr1gPp
   FlIV0uIY9BruGGngqpvzVx43UTpGMD68+7bG9A276wPgeVHjAqPwRGZen
   FKRPSwQiK7R+ftG/VClZjkbBBDnVcPWKRxq9/YA7xsFK88YjqvOEGz7oO
   lbKRxXDfsXxxEfCA33wvbtrwKJaGwHkRkiR1b/xcSd8iyzvWvNcjbcnuw
   JSMjC9ZadFJBeMkB58vLCIWrjilUUvCVEdnUOML7wuSV+vQlqP+SmLiwO
   w==;
X-CSE-ConnectionGUID: RZT3kt9ASdeVWihdlq2Thg==
X-CSE-MsgGUID: lG4pferfQfad6hP9mH6kUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2212848"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2212848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:54:12 -0700
X-CSE-ConnectionGUID: SJdlRg3VSaeXMuVKtYDpww==
X-CSE-MsgGUID: jMI6TXXwQYCcP2nxJNnpTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5921565"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Oct 2026 18:54:08 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMyIG-00000000cRM-0xgJ;
	Sat, 31 Oct 2026 01:54:04 +0000
Date: Sat, 31 Oct 2026 09:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Vladimir.Kondratiev@mobileye.com
Subject: Re: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <202610310951.FopXBJty-lkp@intel.com>
References: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>

Hi Vladimir,

kernel test robot noticed the following build errors:

[auto build test ERROR on c03c1a14507dfaf8b856c2608f9ac216021fc222]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Kondratiev/riscv-build-kernel-atomics-from-LR-SC-when-Zaamo-is-disabled/20261026-112002
base:   c03c1a14507dfaf8b856c2608f9ac216021fc222
patch link:    https://lore.kernel.org/r/20261026-lrsc-only-v3-1-ec29c8190fb1%40mobileye.com
patch subject: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo is disabled
config: riscv-randconfig-1001-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310951.FopXBJty-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310951.FopXBJty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310951.FopXBJty-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: -march=rv64im_zalrsc: unsupported ISA substring '_zalrsc'
   make[3]: *** [scripts/Makefile.build:290: scripts/mod/empty.o] Error 1 shuffle=1929180073
>> cc1: error: -march=rv64im_zalrsc: unsupported ISA substring '_zalrsc'
   make[3]: *** [scripts/Makefile.build:185: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1929180073
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1424: prepare0] Error 2 shuffle=1929180073
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1929180073
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1929180073
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
