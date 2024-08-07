Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC2D14E2E6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 22:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723071030; cv=none; b=fwIXW0allxGjIP6aNs2I2Bj3CmDr0TT6SZlO/J9VBzkL0dT7f8TrPqGl7fRaega85NRRfeWdOPUz+yVJreJJqCABW0KxlJBEv/W1TNiDtn4nMcnvMF++IrmHkBn8TWw8LEsoJa4nMB3Szt5mbsTUkL2sJw4zirLeZ8OK59EKC10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723071030; c=relaxed/simple;
	bh=bMaODGKYrKy4WWNsIc9AY2BftKQZPeSDFHan26lYwQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QtZDeqqe/+tkaV6QmzdsBM2ZCaTVAjWZ8A9SEOYma1DZO3hdn52aHu1/uWTZcOokIOK9cTPVWRZP1/yfOC29qwIYMNqXjiHLNOrAmu8gjwzn5p6p/V8bzXEN/0eGmugoYkd8fDLeGYYJsCq+MvOfHHM6bzzsly6nIdrM22cbGJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6Q/fIza; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6Q/fIza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723071029; x=1754607029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bMaODGKYrKy4WWNsIc9AY2BftKQZPeSDFHan26lYwQk=;
  b=B6Q/fIzaaxhwrJU1IbGGcDLZ30GnlLVjpJ7VUN1kBbG8sj5bcmJ0wGBp
   rJtk0P1wnEn1u5D9LhoQoVhcEULddgrCa/qrCnrzb4ApbLx918Q0tE1I3
   kSu2M0hQg8wfbnyMUhMLoq3XIb9X7G76KryNCHGUWnVk7U/jzpDocJ1n/
   2F+0lcMXwLZ/WssE/cXInqy9Zo0PjTiSgMANxW21plzFCOb4Wg6CFho27
   vd2/dWLKlU1Ez9C4cTuQjyFHfy6A5jVrUqC4W2WqabtRuO3OLz7d/0d2P
   SvfmFB3Is3kMbVT/VP7iNcMbtpfBd6EF02QwKkgtv/g9QVW+kE9uHN/i+
   A==;
X-CSE-ConnectionGUID: 5WWw+c/QSnWEXE9v319IoQ==
X-CSE-MsgGUID: Nq7wx2U0Qoax8Jnv2y/ybQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20833769"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="20833769"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 15:50:25 -0700
X-CSE-ConnectionGUID: ZziiuFkVRYeuBTTK/DSfdw==
X-CSE-MsgGUID: HDjZsATxSVu3dQvS2yx2mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="94574763"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Aug 2024 15:50:24 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbpU6-0005lp-06;
	Wed, 07 Aug 2024 22:50:22 +0000
Date: Thu, 8 Aug 2024 06:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: Fabien Parent <fabien.parent@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1040 17/23] warning: explicit call to `.into_iter()` in
 function argument accepting `IntoIterator`
Message-ID: <202408080650.cYW99bMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1040
head:   75eed45d343ba14a3bac1b23323dbc0ef0ec6569
commit: d717ceeb6df82bf53e1f9f974306792981216538 [17/23] rust: macros: paste: add support for using var as part of group
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240808/202408080650.cYW99bMM-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080650.cYW99bMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080650.cYW99bMM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: explicit call to `.into_iter()` in function argument accepting `IntoIterator`
   --> rust/macros/paste.rs:52:33
   |
   52  |                 segments.extend(group_segments.into_iter());
   |                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider removing the `.into_iter()`: `group_segments`
   |
   note: this parameter accepts any `IntoIterator`, so you don't need to call `.into_iter()`
   --> /opt/cross/rustc-1.78.0-bindgen-0.65.1/rustup/toolchains/1.78.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/iter/traits/collect.rs:415:18
   |
   415 |     fn extend<T: IntoIterator<Item = A>>(&mut self, iter: T);
   |                  ^^^^^^^^^^^^^^^^^^^^^^
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#useless_conversion
   = note: `-W clippy::useless-conversion` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::useless_conversion)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
