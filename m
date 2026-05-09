Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279D4361DBF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 14:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778335715; cv=none; b=TrhCQk+ZaG5YINaVqibpHpLsdcYbuqgodmib2+xO/rzzadLc1lvRaGRkdZJVE6lGZFCBChQh6MzoHhGohePXOhbOmLkjyswe9uReLkDKlGDDxg8H6ecqLLrHOYNpy0XkowSuWEXdr/h0ktV+p0+Vkp1XGtyxhwrfkZp1Ip2M90w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778335715; c=relaxed/simple;
	bh=Bit4MIdCWWcxH1aizCLoMKy4fqg1htF4Pxixefger/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rnQL9QaQV9xFHa7N6syDLLB+nbiTNuWV7B/GwbHr080/E58NCFPBeX9Xrlk22wtXjS+dq2tfTZVuG3YIMYrMLvITi3KWwfUUXxAJLteogbICQf1IsSuLJWDU0ec4l81dZxJmdimv7nZtI7npsfywpE3qLvmZDGA+Q20wePKaLsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiPDrTtH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiPDrTtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778335713; x=1809871713;
  h=date:from:to:cc:subject:message-id;
  bh=Bit4MIdCWWcxH1aizCLoMKy4fqg1htF4Pxixefger/w=;
  b=aiPDrTtHyjA8L2BZYWAJMzZh/R650ZVw98KxP3UAZo3fQUSLwyiEXcEZ
   lYFKRMgHMz+1sjdLLW4isGAwoMHEHlMHJS7svDu4UFWOlcbm285BPoBZY
   iE/8k7q6GZA/LT1M+D6GCrh3g8papVvSkjk8HU9pc2Ty1eXvjH1Z5HRUJ
   5HNMOJW3NMkQLuS2iZ4SLGlI8R6lljLCY1yhyjeOnANXpIMtYsml74po/
   U8MjlS+xMi29dzL+KxClEpViPHa8VDIcF69Iu/h1Y7goZywDlLwjhQar/
   zWdPZ6TCS9iys30KLIGnx1P8i+8aNmef3lzB8Wna9mU7z6Aqi5R5P6RHT
   A==;
X-CSE-ConnectionGUID: rpkmrbKZSrypU4TH9USadg==
X-CSE-MsgGUID: 3F5CtPrBS/qfuk4vXo0bdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="81859939"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="81859939"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 07:08:32 -0700
X-CSE-ConnectionGUID: +Zh0zcbCTEq0ucn8M7nhTg==
X-CSE-MsgGUID: kMoKBYEPS/COrIl4hcDjXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="232688046"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2026 07:08:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLiLx-000000007UF-3vDB;
	Sat, 09 May 2026 14:08:25 +0000
Date: Sat, 09 May 2026 16:08:03 +0200
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 47/54] Diff in
 rust/kernel/iio/common/aop_sensors.rs:9:
Message-ID: <202605091649.LeXDL5yf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   571e5d3c9fc1383a0f7a0a52d30fb5ad9f74bef4
commit: e4ab7d865010fb638f403d885c31a457aecb2fac [47/54] iio: common: Add AOP sensor drivers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260509/202605091649.LeXDL5yf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091649.LeXDL5yf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605091649.LeXDL5yf-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/iio/common/aop_sensors.rs:9:
    use core::sync::atomic::{AtomicU32, Ordering};
    
    use kernel::{
   -    bindings, device,
   +    bindings,
   +    device,
        prelude::*,
        soc::apple::aop::FakehidListener,
        sync::Arc,
>> Diff in rust/kernel/iio/common/aop_sensors.rs:9:
    use core::sync::atomic::{AtomicU32, Ordering};
    
    use kernel::{
   -    bindings, device,
   +    bindings,
   +    device,
        prelude::*,
        soc::apple::aop::FakehidListener,
        sync::Arc,
>> Diff in rust/kernel/iio/common/aop_sensors.rs:9:
    use core::sync::atomic::{AtomicU32, Ordering};
    
    use kernel::{
   -    bindings, device,
   +    bindings,
   +    device,
        prelude::*,
        soc::apple::aop::FakehidListener,
        sync::Arc,
>> Diff in rust/kernel/iio/common/aop_sensors.rs:9:
    use core::sync::atomic::{AtomicU32, Ordering};
    
    use kernel::{
   -    bindings, device,
   +    bindings,
   +    device,
        prelude::*,
        soc::apple::aop::FakehidListener,
        sync::Arc,
   make[2]: *** [Makefile:1916: rustfmt] Error 123
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
