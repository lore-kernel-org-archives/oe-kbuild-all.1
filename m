Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE0E9443
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767520290; cv=none; b=eWKJNx6gB0nWz7ZrPoD9ustHrTcBhAsUet46Zht6DHxT0ziW3dFEIqJLN2BZhWBHjwbKHCs8002gSXNzQrG64WLJJvntxiBxsGkRfMyOMFVOiupFUYJjEtc/KfZlMroNgKFyhQss3TwW3Qqqv5ZijAKplHK6/+/wMa2KdutjNcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767520290; c=relaxed/simple;
	bh=rNiSAYQxEEzWWjgLaJDmuSxwJR1ma5texGz2lVxfSDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5eC35lymZtXrg/66cxH1Jg3274gER0cuXNXBeai5eXhJmjFEXQfiMuQm0K0HEAM875/lIgZU+F7TccRKC+18WMoyQnCwkB/LeQFEBdCvXXAOGolACBJbiRqc0VHAUJ9v4tmXlIaNZiyASxCc6EFCpmH+a0jdUvct3/q+UXbow8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkGbVqNy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkGbVqNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767520288; x=1799056288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rNiSAYQxEEzWWjgLaJDmuSxwJR1ma5texGz2lVxfSDw=;
  b=IkGbVqNys3DqPiZP1TefjG9KI4mNweBnegBWkPPs2mjkK+ojKGWuZufW
   1Qzns8+sX1MQ3Lb/xwSGauLAg++DcIM5I4MtE7c/UuYIRazNTKgH6uify
   SS0m16oNtA6Ra3f/Tarbhs3RcSZVytIIJQUos5SR9I/CHdSGdGJe9qJQd
   ETQoddMgwwygVw6iHfSj5CSkaKkXSsRcNZUPPI6XL2xNSVcwTUQSM61QF
   W5U+5PvzrSfzAg+aFVDYIwolbSkz95tBW8zVr5EhMTWXkfTuOOs4/uAYv
   WzlcCSfW2kZsz5FHQfix6iHjDYe+6fiVGEQZGuLLZeFAhKkxajh39Et9W
   g==;
X-CSE-ConnectionGUID: ZcnWvG6VQS6xVyMR3flASQ==
X-CSE-MsgGUID: SlID4iqpR8mMF4XK834Frg==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="86510871"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="86510871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 01:51:27 -0800
X-CSE-ConnectionGUID: q9AYvnEURT2HKUyKo8t2bQ==
X-CSE-MsgGUID: BZ0Y2u1gQjCX2ObwIE0EXA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jan 2026 01:51:27 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcKlg-000000000tV-2lNg;
	Sun, 04 Jan 2026 09:51:24 +0000
Date: Sun, 4 Jan 2026 10:50:52 +0100
From: kernel test robot <lkp@intel.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 3/4] rust: add RTC core abstractions and data
 structures
Message-ID: <202601041058.XmRW4UJV-lkp@intel.com>
References: <20260104060621.3757812-4-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104060621.3757812-4-sunke@kylinos.cn>

Hi Ke,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 805f9a061372164d43ddef771d7cd63e3ba6d845]

url:    https://github.com/intel-lab-lkp/linux/commits/Ke-Sun/rust-add-AMBA-bus-abstractions/20260104-141029
base:   805f9a061372164d43ddef771d7cd63e3ba6d845
patch link:    https://lore.kernel.org/r/20260104060621.3757812-4-sunke%40kylinos.cn
patch subject: [RFC PATCH v1 3/4] rust: add RTC core abstractions and data structures
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260104/202601041058.XmRW4UJV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601041058.XmRW4UJV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601041058.XmRW4UJV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `crate::amba`
   --> rust/kernel/rtc.rs:10:5
   |
   10 |     amba,
   |     ^^^^ no `amba` in the root
   |
   note: found an item that was configured out
   --> rust/kernel/lib.rs:70:9
   |
   70 | pub mod amba;
   |         ^^^^
   note: the item is gated here
   --> rust/kernel/lib.rs:69:1
   |
   69 | #[cfg(CONFIG_ARM_AMBA)]
   | ^^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0412]: cannot find type `rtc_time` in crate `bindings`
   --> rust/kernel/rtc.rs:44:34
   |
   44 | pub struct RtcTime(pub bindings::rtc_time);
   |                                  ^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `__amba_driver_register` in crate `bindings`
   --> rust/kernel/rtc.rs:861:38
   |
   861   |         to_result(unsafe { bindings::__amba_driver_register(reg.get(), module.0) })
   |                                      ^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `amba_device_register`
   |
   ::: rust/bindings/bindings_generated.rs:80188:5
   |
   80188 |     pub fn amba_device_register(arg1: *mut amba_device, arg2: *mut resource) -> ffi::c_int;
   |     --------------------------------------------------------------------------------------- similarly named function `amba_device_register` defined here
--
>> error[E0425]: cannot find function `amba_driver_unregister` in crate `bindings`
   --> rust/kernel/rtc.rs:866:28
   |
   866   |         unsafe { bindings::amba_driver_unregister(reg.get()) };
   |                            ^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `amba_device_unregister`
   |
   ::: rust/bindings/bindings_generated.rs:80191:5
   |
   80191 |     pub fn amba_device_unregister(arg1: *mut amba_device);
   |     ------------------------------------------------------ similarly named function `amba_device_unregister` defined here
--
>> error[E0425]: cannot find function `devm_rtc_allocate_device` in crate `bindings`
   --> rust/kernel/rtc.rs:1146:36
   |
   1146 |                 unsafe { bindings::devm_rtc_allocate_device(dev_raw) };
   |                                    ^^^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `devm_rtc_register_device`
   |
   ::: rust/bindings/bindings_helpers_generated.rs:1344:5
   |
   1344 |     pub fn devm_rtc_register_device(rtc: *mut rtc_device) -> ffi::c_int;
   |     -------------------------------------------------------------------- similarly named function `devm_rtc_register_device` defined here
--
>> error[E0412]: cannot find type `rtc_class_ops` in crate `bindings`
   --> rust/kernel/rtc.rs:1337:46
   |
   1337 |     pub const fn get() -> &'static bindings::rtc_class_ops {
   |                                              ^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0412]: cannot find type `rtc_time` in crate `bindings`
   --> rust/kernel/rtc.rs:1348:28
   |
   1348 |         tm: *mut bindings::rtc_time,
   |                            ^^^^^^^^ not found in `bindings`
--
>> error[E0412]: cannot find type `rtc_time` in crate `bindings`
   --> rust/kernel/rtc.rs:1375:28
   |
   1375 |         tm: *mut bindings::rtc_time,
   |                            ^^^^^^^^ not found in `bindings`
--
>> error[E0412]: cannot find type `rtc_wkalrm` in crate `bindings`
   --> rust/kernel/rtc.rs:1402:31
   |
   1402 |         alarm: *mut bindings::rtc_wkalrm,
   |                               ^^^^^^^^^^ not found in `bindings`
--
>> error[E0412]: cannot find type `rtc_wkalrm` in crate `bindings`
   --> rust/kernel/rtc.rs:1429:31
   |
   1429 |         alarm: *mut bindings::rtc_wkalrm,
   |                               ^^^^^^^^^^ not found in `bindings`
--
>> error[E0412]: cannot find type `rtc_param` in crate `bindings`
   --> rust/kernel/rtc.rs:1566:31
   |
   1566   |         param: *mut bindings::rtc_param,
   |                               ^^^^^^^^^ help: a struct with a similar name exists: `btf_param`
   |
   ::: rust/bindings/bindings_generated.rs:109976:1
   |
   109976 | pub struct btf_param {
   | -------------------- similarly named struct `btf_param` defined here
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
