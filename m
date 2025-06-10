Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936107083C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 05:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749534572; cv=none; b=QyL2hFgBhlaU8W3d3WGim1a8dIxw3zr/GuCWYVhmtRSL0TLMocnzd+2fyNgBIqyWYpJsVXonVl/VozbPT46xgZJcFxcKdfmM3mEtwnTGSB7V90ogbUO9z7LrRFs7AVZjBDcus/rlWXdsVW1pxjR2YNbWU0A54fgI6+OkDaYJhqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749534572; c=relaxed/simple;
	bh=GMSEzQVdmINehZ5oo8/B0cg57ZE96FCdiq3N4OJOBuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+KULk+M/p1jUOS+VjVQaI8Y1fM7LTAowDbluvHpSRyl4Wm0QCddqLuMAo+E4SJPybQ+qXuaHfU3RZb4NExWe3ZNtAzkX4GkQ3n+3uLwb/Cu3BW1tT4bfd39tIFwGZaZcWDQ8WbPqYmfbW2GT/Ns9xHnzr35fjZl8IInMKhCVt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FY82Ijvy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FY82Ijvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749534571; x=1781070571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GMSEzQVdmINehZ5oo8/B0cg57ZE96FCdiq3N4OJOBuE=;
  b=FY82IjvyMrHQH53tBNfgWKXer7+XgNIRUfHjEKcFoyoACZYJRNobv343
   BhSOoFjrvEyjADv4kJIqX4FUM4OKt9C756bX4beocBZske0wkTXomDMAO
   e4c9JQHHJthyx1RFaG67UW5zot6BwP18JgWkP9e8KmA1NR9vj7Mr9Jb3Y
   5DtqvGCCZH87MhdYkQ8VbW5fWJvSgcVYSnOgScRO5tD5lzn85Dtekq2T/
   hGVaTXKTmfUXLneIv8TLf20fzvF5VNheAyBfcO5lqmpJerQUf47yXZvrc
   avjsOOz+4FX+Ao4sX0LZsqvPJZWpRS/jxWMxqIa5jM3rkvjcJpuZrHX5n
   A==;
X-CSE-ConnectionGUID: ETf0TS15TeSD29UlcQR0Ew==
X-CSE-MsgGUID: jyDunKLDT3CzxHrW/F1h5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50735130"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="50735130"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 22:49:30 -0700
X-CSE-ConnectionGUID: leOEfOWQQ6WSTzeKMyBUCg==
X-CSE-MsgGUID: Rvc/mpViRYKKkWIoQty5LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="151606184"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jun 2025 22:49:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOrrT-0007pt-0a;
	Tue, 10 Jun 2025 05:49:27 +0000
Date: Tue, 10 Jun 2025 13:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Benno Lossin <lossin@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pin-init-next 6/14] error[E0282]: type annotations needed
Message-ID: <202506101355.7j9nPNCz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pin-init-next
head:   1c9e8afcd50d7f46d1d0a749a49d9ebd8bee924e
commit: 5aa80dace60a02b7c78702a62ca138c630a71a0a [6/14] rust: pin-init: add `zeroed()` & `Zeroable::zeroed()` functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250610/202506101355.7j9nPNCz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101355.7j9nPNCz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101355.7j9nPNCz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0282]: type annotations needed
   --> rust/kernel/configfs.rs:154:26
   |
   154 |             subsystem <- pin_init::zeroed().chain(
   |                          ^^^^^^^^^^^^^^^^ cannot infer type of the type parameter `T` declared on the function `zeroed`
   |
   help: consider specifying the generic argument
   |
   154 |             subsystem <- pin_init::zeroed::<T>().chain(
   |                                          +++++
--
>> error[E0282]: type annotations needed
   --> rust/kernel/configfs.rs:264:22
   |
   264 |             group <- pin_init::zeroed().chain(|v: &mut Opaque<bindings::config_group>| {
   |                      ^^^^^^^^^^^^^^^^ cannot infer type of the type parameter `T` declared on the function `zeroed`
   |
   help: consider specifying the generic argument
   |
   264 |             group <- pin_init::zeroed::<T>().chain(|v: &mut Opaque<bindings::config_group>| {
   |                                      +++++

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
