Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115E14B1E6E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747491706; cv=none; b=Ecjp2f0GBvbfCKhwo26grJoQR8XjqHFrjPZeTgNDCS299pykyk2oLh+JPBDcLxFedk7Rq/ZUMgq0aBekLFtpQ28hT1aIBVJi//hMEoxArBMr4JH38mxj0zBXTxCCDSbimVqX6IsN1Z78pa7V/Q4UvL2B1qcwqtQcvyMMx5xkrjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747491706; c=relaxed/simple;
	bh=bf2q6o2k4JPDbfvJai+BmQVQ+JL4lUFS5qyYCQA9QaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OnxlFbhlSMwV1zhvVo4ZbWUsdH6TjXMII554TA5w4qX23eNOkDyO61T0+KK5OdAd3+jiIISi7DBKi3c4GfGQ+oBP1rfLaTW09tERk13+b3pveuiysv4wPHUsbm7COMaxxRyT2EnT/jgYOdyuV1a6oqMJMb4tkRcZ2IOw9dTLU+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbgjXtxt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbgjXtxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747491705; x=1779027705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bf2q6o2k4JPDbfvJai+BmQVQ+JL4lUFS5qyYCQA9QaI=;
  b=QbgjXtxt5XGPbboh765DKuZ/0xCuy60I9YCQ8c8zjShei9vxeOl/PrkU
   8RU37mxzmi4VJjJ4n9IpYHX88yEq91ZWZ7EwtAHq97gSaopCeaiOpk2Lw
   0k5oFvjmLLMWGPl7DMOEdk29X+4UDI+TV+gJOxfzVItYwxnojgHzsf3Tb
   2HnOV29Yq0uGmnCM9jgHxuM/Lw5kIeh0380U1PgzuGdCXQWX+HnAmeJ1w
   cZAWa/+xkPFJKqB21L07h9InA6FhDtqo7bi5kpZj93WDO23W2mQBKOKTc
   iFfGFtEeUiIAcI5at1aSfg6HOIJ6UnaxNseaJ551GlhzM7+nb6mfatpM8
   A==;
X-CSE-ConnectionGUID: upUn6TFWQ+SsOR+FZlAN9A==
X-CSE-MsgGUID: M+ZHGvl8Q4mLMU6muiTTgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="71950260"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="71950260"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 07:21:44 -0700
X-CSE-ConnectionGUID: 2NKjVs4kTgyDReh/QjoCHQ==
X-CSE-MsgGUID: AWDcUYhnR46Z19KHvB5c9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="144075138"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 May 2025 07:21:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGIQ1-000KAV-0h;
	Sat, 17 May 2025 14:21:41 +0000
Date: Sat, 17 May 2025 22:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/18] Diff in
 drivers/android/binder/range_alloc/array.rs at line 141:
Message-ID: <202505172215.8FngmAgR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   147b27e8d66c20bee7541b52cd32243cd495c94c
commit: 716353352652c4288040269992610814cd7330cc [0/18] ANDROID: rust_binder: fixups for 6.12.19 LTS
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250517/202505172215.8FngmAgR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505172215.8FngmAgR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505172215.8FngmAgR-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/android/binder/range_alloc/array.rs at line 141:
                state: DescriptorState::new(is_oneway, debug_id, pid),
            };
            // Insert the value at the given index to keep the array sorted.
   -        self.ranges.insert_within_capacity(insert_at_idx, new_range).ok().unwrap();
   +        self.ranges
   +            .insert_within_capacity(insert_at_idx, new_range)
   +            .ok()
   +            .unwrap();
    
            Ok(insert_at_offset)
        }
>> Diff in drivers/android/binder/range_alloc/array.rs at line 141:
                state: DescriptorState::new(is_oneway, debug_id, pid),
            };
            // Insert the value at the given index to keep the array sorted.
   -        self.ranges.insert_within_capacity(insert_at_idx, new_range).ok().unwrap();
   +        self.ranges
   +            .insert_within_capacity(insert_at_idx, new_range)
   +            .ok()
   +            .unwrap();
    
            Ok(insert_at_offset)
        }
>> Diff in drivers/android/binder/range_alloc/array.rs at line 141:
                state: DescriptorState::new(is_oneway, debug_id, pid),
            };
            // Insert the value at the given index to keep the array sorted.
   -        self.ranges.insert_within_capacity(insert_at_idx, new_range).ok().unwrap();
   +        self.ranges
   +            .insert_within_capacity(insert_at_idx, new_range)
   +            .ok()
   +            .unwrap();
    
            Ok(insert_at_offset)
        }
   Diff in rust/kernel/miscdevice.rs at line 20:
        str::CStr,
        types::{AsBytes, ForeignOwnable, Opaque},
    };
   -use core::{
   -    marker::PhantomData,
   -    mem::MaybeUninit,
   -    pin::Pin,
   -    ptr::NonNull,
   -};
   +use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin, ptr::NonNull};
    
    /// The kernel `loff_t` type.
    #[allow(non_camel_case_types)]
   Diff in rust/kernel/miscdevice.rs at line 20:
        str::CStr,
        types::{AsBytes, ForeignOwnable, Opaque},
    };
   -use core::{
   -    marker::PhantomData,
   -    mem::MaybeUninit,
   -    pin::Pin,
   -    ptr::NonNull,
   -};
   +use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin, ptr::NonNull};
    
    /// The kernel `loff_t` type.
    #[allow(non_camel_case_types)]
   make[2]: *** [Makefile:1806: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:242: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
