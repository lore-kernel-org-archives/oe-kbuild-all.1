Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A931D530
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 21:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710712601; cv=none; b=jkG4eNCmbJTo3sOWvhbQkvklYIFHYnoeWZUyf0Coo+d4SWGG39ExWbsvB1F2UjHJ8DbLi8dK60GnEqrVFUKG+BTXUOxrEz2CWixQM+9US6E5MhvuJKtUNo/y1KgDULrLV51/lpm5dnjgvQH8J/cMlXkws51Oo5fY2mUJqOfX5Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710712601; c=relaxed/simple;
	bh=TvtZx0zgMnD8Z4M2wLouTWVv8g+ZQphzM6xvpKye2uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=emjVWNXWllsKc1hVGEBqBvF1gLb91Y99QLB3aFxjbP5jLX/pIB/l3XeJ/1t+qNwSY9FVPPFX2PIk0EUOxyZCaZ2Pmmiiazh01czlojpPplqghvRwz+ptnmkNTlz1n+l1vBocw7BAY9V4Ua3z1ILuhoOJBur+hWGBr8ugiHtAtrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkQzRL8O; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkQzRL8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710712599; x=1742248599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TvtZx0zgMnD8Z4M2wLouTWVv8g+ZQphzM6xvpKye2uw=;
  b=ZkQzRL8O5+8uQmlVen7wcFJZeyna5O5ewxJVUfxG/zcEsg1t3KZHBwm1
   S8UhGl8VLranQladjCfI75dqZK/U9eK8TmvLqT/PjABOwInwkq8BMXWnN
   xqn8mHdV9cahw/Co32zzLTc7tKFTFHiPxRiOPiQfRPZOBGhq1fatVWu4Z
   94Jp1KDfQRoQZzE1S1oY4gvj+EUc6TUQpOuACtxTo3X412OGRSEyRuEFs
   4bv2zS0BaPC/OzG273ue1kO3bo0dMxeDxiFJP9mCheKXbCCZ/etM3KSZg
   ISPmtsVo5DHLozrPmmx2ZZkpdBEcPq9zF1aUJCQSgtv0AzDNxnR1SPxD0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16657677"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="16657677"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 14:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="17872473"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2024 14:56:36 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlyUc-000GTv-1b;
	Sun, 17 Mar 2024 21:56:34 +0000
Date: Mon, 18 Mar 2024 05:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/279 827/930] warning: unresolved link to
 `alloc::string::ToString::to_string`
Message-ID: <202403180521.880CKTKT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/279
head:   15d2163ed4a2934b567a1cb2c59678ba1190b35c
commit: 2737b7a00c464473c1e894ef9a46eb897578ab6b [827/930] fixup! rust: sync: Replace static LockClassKey refs with a pointer wrapper
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240318/202403180521.880CKTKT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403180521.880CKTKT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403180521.880CKTKT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `alloc::string::ToString::to_string`
   --> rust/kernel/module_param.rs:14:7
   |
   14 | /// [`alloc::string::ToString::to_string`] (as implemented through the
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ no item named `string` in module `alloc`
--
>> warning: unresolved link to `alloc::format`
   --> rust/kernel/device.rs:437:25
   |
   437 | /// [`core::fmt`] and [`alloc::format!`].
   |                         ^^^^^^^^^^^^^^ no item named `format` in module `alloc`
--
>> warning: unclosed HTML tag `t`
   --> rust/kernel/time.rs:51:58
   |
   51 |     /// Returns the time elapsed since an earlier Instant<t>, or
   |                                                          ^^^
   |
   = note: `#[warn(rustdoc::invalid_html_tags)]` on by default
   help: try marking as source code
   |
   51 |     /// Returns the time elapsed since an earlier `Instant<t>`, or
   |                                                   +          +
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/time.rs:68:52
   |
   68 |     /// Returns the time elapsed since this Instant<T>.
   |                                                    ^^^
   |
   help: try marking as source code
   |
   68 |     /// Returns the time elapsed since this `Instant<T>`.
   |                                             +          +
--
>> warning: unresolved link to `module::module`
   --> rust/kernel/module_param.rs:388:57
   |
   388 |     /// This function is only meant to be used in the [`module::module`] macro.
   |                                                         ^^^^^^^^^^^^^^ no item named `module` in scope
--
>> warning: unresolved link to `alloc::format`
   --> rust/kernel/device.rs:362:25
   |
   362 | /// [`core::fmt`] and [`alloc::format!`].
   |                         ^^^^^^^^^^^^^^ no item named `format` in module `alloc`
--
>> warning: unresolved link to `alloc::format`
   --> rust/kernel/device.rs:387:25
   |
   387 | /// [`core::fmt`] and [`alloc::format!`].
   |                         ^^^^^^^^^^^^^^ no item named `format` in module `alloc`
--
>> warning: unresolved link to `alloc::format`
   --> rust/kernel/device.rs:512:25
   |
   512 | /// [`core::fmt`] and [`alloc::format!`].
   |                         ^^^^^^^^^^^^^^ no item named `format` in module `alloc`
--
>> warning: unresolved link to `alloc::format`
   --> rust/kernel/device.rs:337:25
   |
   337 | /// [`core::fmt`] and [`alloc::format!`].
   |                         ^^^^^^^^^^^^^^ no item named `format` in module `alloc`
--
>> warning: unresolved link to `alloc::format`
   --> rust/kernel/device.rs:412:25
   |
   412 | /// [`core::fmt`] and [`alloc::format!`].
   |                         ^^^^^^^^^^^^^^ no item named `format` in module `alloc`
--
>> warning: unresolved link to `alloc::format`
   --> rust/kernel/device.rs:487:25
   |
   487 | /// [`core::fmt`] and [`alloc::format!`].
   |                         ^^^^^^^^^^^^^^ no item named `format` in module `alloc`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
