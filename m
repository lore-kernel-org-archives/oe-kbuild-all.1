Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C6113635E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 19:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743622928; cv=none; b=kFq9NEu1yuC+vbUsA9XQs2heZ9/2RgEn7jJa22jz9e1Ospzb3OyuoJMaNJRSzQ5rl501j1zZK6zGLbjITpeYPOtBptZGGE4lmMCl2XI4Y9mwQkexP1z8yT6YXGQ+b+tNzY7RFGb6Gf/OQPtqTfPXiVva/HQ4DoUm20+Q7x+PFnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743622928; c=relaxed/simple;
	bh=XDDFThK64IHjP4reGkjaW/Bk5civDiSbEujizPth1rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bbRoxlN6OtDDK+WqcHyv2d9rV4EwhO/2Ni6Ak+Yf3uZK427UNrOWup5NC6BstzBh1TQEUHeRcqU3kfiuT9z+bmjTrDKEPA5tCZO5eJ2bBxW/M7feLLJ6rffYGWlSkzqPatGLSnFcmub5MdsY+cUdvT0CHLZt1EasyNrcresjnP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RB74w1t8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RB74w1t8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743622927; x=1775158927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDDFThK64IHjP4reGkjaW/Bk5civDiSbEujizPth1rQ=;
  b=RB74w1t8SH/jFdQqpvdorUr4KLjOBFRE+WQngPP9BYVLVxjz9yodGJDB
   WAP/4hnJG5qr19Yd1VzV+ttPsuWPhyEhW5ca1sCSBtia36UcvlyeytLON
   gD4F9Hs8JmeR2kvI9Rfc2RcQrMHGxGzXzGijS2KorTsWL1TT6MkkxVVe+
   gxun0SaCYEjWEPkSDR/fYJj6b5qxooZZu2JYU/gKM1YmINevSeMF4Ip0p
   SZrWfyLZh4e+d23t/bLkHIoFqD/3Jqc95WkVROQBZJWzQyEeMy+VAamrL
   nB5Ry0ymaxmbjGkbmVirxbTflm4IpX1eUXV1GqxKBk7zQ96Frs0izvv+t
   A==;
X-CSE-ConnectionGUID: AdqA+pJlSuemT2X0AKP7Yw==
X-CSE-MsgGUID: Y0o125s3Tl+CDbJmAIwDjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="67476277"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="67476277"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 12:42:06 -0700
X-CSE-ConnectionGUID: 2ctdbVscQ7mrkoNz75mRBw==
X-CSE-MsgGUID: 9LnJ1A0uSRWzGJNCTN01aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="130924017"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Apr 2025 12:42:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u03yM-000B02-31;
	Wed, 02 Apr 2025 19:42:02 +0000
Date: Thu, 3 Apr 2025 03:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-thread 2/2] Diff in rust/kernel/task/thread.rs at line
 302:
Message-ID: <202504030323.OiqcwBjE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-thread
head:   49cb8471b5a4815cafe2503033d20615c5b6b1f3
commit: 49cb8471b5a4815cafe2503033d20615c5b6b1f3 [2/2] rust: task: Add kernel thread support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250403/202504030323.OiqcwBjE-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030323.OiqcwBjE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030323.OiqcwBjE-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/task/thread.rs at line 302:
            let t = Self::try_new(name, f)?;
    
            // SAFETY: `t` is newly created thread, so it's safe to start.
   -        unsafe { bindings::kthread_start(t.raw.task.0.get()); }
   +        unsafe {
   +            bindings::kthread_start(t.raw.task.0.get());
   +        }
    
            Ok(t)
        }
>> Diff in rust/kernel/task/thread.rs at line 302:
            let t = Self::try_new(name, f)?;
    
            // SAFETY: `t` is newly created thread, so it's safe to start.
   -        unsafe { bindings::kthread_start(t.raw.task.0.get()); }
   +        unsafe {
   +            bindings::kthread_start(t.raw.task.0.get());
   +        }
    
            Ok(t)
        }
>> Diff in rust/kernel/task/thread.rs at line 302:
            let t = Self::try_new(name, f)?;
    
            // SAFETY: `t` is newly created thread, so it's safe to start.
   -        unsafe { bindings::kthread_start(t.raw.task.0.get()); }
   +        unsafe {
   +            bindings::kthread_start(t.raw.task.0.get());
   +        }
    
            Ok(t)
        }
   make[2]: *** [Makefile:1811: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
