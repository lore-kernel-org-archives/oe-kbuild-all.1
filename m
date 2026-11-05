Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920999;
	b=Tc30XBYnrGnko4LGxtPxlddeV7NFiicR3h+3pqRJzFYz+gHRaEzfN0MH9RPUwe+bsPRN
	 j2leCvqvSAMQHrdHS6WN2Wv2mkkyZqumT6gopWD+GdbNGSjcI8k5sXXH5kNTWFw1s17Om
	 tghRpHNuFhpCSU4kLKCQFTTFXeoZkpHahbaGzbOidALju7fbD28WoIxO39aiZ6cFQF6b9
	 vzWrh2sYuAH/priKg8aBHnl/tjS0ZKtC+dB9Lt6yr8d5yL/cXwRwlk3DwjInsOjs25bjX
	 gjSWNHaSDXDxRZ+N8C3zGPJGNx8sjL/xs9fLNBfp2p8sZ9MhoPJdWsS8LlJ1A3hKR3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920999;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rBV8upxnt4msbxQzZ63eEhSzGVbJzqkSLWao2sISAsY=;
	b=Q+9AxVwIdbRDZrD/qd4g5Cqiz94P4zEvnTY5cK44KN2CmSFTKORIjxxKzcIZZslrFE4M
	 komLpJkLezXUFyxw13lBEJdNVvoR3DeqfwkQKDYJVtWLH3fMKGyMYRuyAY71Jspf+f+6B
	 ZCoDrIE3UCZIPFwyLsvqM35t0JfpDQ/jK8mxyU1VR0mvhlONzkba/KJS4JprgI9M+dAuh
	 4QEzpxORgjjvOi+AG4EOYexaxo43M6BEhxO36ynUTB4jgNtsWZl6JC+pSFDUlqgD6IWNu
	 f4lSmAwGH6GG5SZDKKpE0JYGFnBuWeL+wYdsp6e3GawpGbFY37Rx2BMKBMura/uZB8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MQwSjET7;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BB0606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 23:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82BB0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MQwSjET7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793920999; x=1825456999;
  h=date:from:to:cc:subject:message-id;
  bh=FCG55QVwiKpBDwugbFLe2PewKn8x9ZJcBDzB24vvX4I=;
  b=MQwSjET7dHu9xUMQN0Z+jr9bHd8zMibWLp2svkDIzIEgk2h1AJrVv6dZ
   ZQNfR4Gik9YiksmEBljPaGWQlK5S4J/6XDJ8eFoQHDiHfLxvkD6ZMg+N1
   10nJ3sBHkixE8X8zAbKWvP1Usf1Z7MJwverfG+dEuAAsMQwQSX46zgRj/
   27A8WVSY0C/Xj+6iiNSV2MZZLV1tWdBFMDpifaNk1zF7xQHhx1Y+Obdtg
   A7Xc24qWvDrO+PIIglOktv0teParR7YZBI6f+E1g6kH+9OABHRdpjVILn
   2hRUOPOxaVnDTdS7mvjvFcoLeYBdq4kmGZAbjAVWE35X8dnky5DUhQaST
   A==;
X-CSE-ConnectionGUID: AFdRe7ZgSR29syhGWGxs3g==
X-CSE-MsgGUID: OcdVEdOfRxGOySYdwACDZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2831570"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2831570"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 15:23:18 -0800
X-CSE-ConnectionGUID: 3VakEvy1TiiovtUxNd3Z2Q==
X-CSE-MsgGUID: ltVOhA8zRcK1VxsQz8dGkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7464156"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2026 15:23:16 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP6na-000000009sr-1ShE;
	Thu, 05 Nov 2026 23:23:14 +0000
Date: Fri, 06 Nov 2026 00:23:10 +0100
From: kernel test robot <lkp@intel.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:test/sound-rust-v7.3 7/56] Diff in
 rust/kernel/pm.rs:24:
Message-ID: <202611060004.YCuneUre-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: d5dd8d4a1fbe95ad79dc47b8b6606b6fcece0c82 [7/56] rust: add runtime PM support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261106/202611060004.YCuneUre-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060004.YCuneUre-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060004.YCuneUre-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/pm.rs:24:
        types::ForeignOwnable, //
    };
    
   -use core::{
   -    cell::UnsafeCell,
   -    marker::PhantomData
   -};
   +use core::{cell::UnsafeCell, marker::PhantomData};
    
    /// Runtime Power Management modes that determine how a particular PM
    /// transition is to be carried out.
>> Diff in rust/kernel/pm.rs:24:
        types::ForeignOwnable, //
    };
    
   -use core::{
   -    cell::UnsafeCell,
   -    marker::PhantomData
   -};
   +use core::{cell::UnsafeCell, marker::PhantomData};
    
    /// Runtime Power Management modes that determine how a particular PM
    /// transition is to be carried out.
   make[2]: *** [Makefile:2038: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
