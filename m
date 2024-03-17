Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4E1852
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 01:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710640331; cv=none; b=pOJS8svs4AQ2rMpowppJSoiPF4JnrETWj8NqBnvOmEWE0dEMUxkz2Bk7BQ4/rq/wOXQcwTIWixbqtvlZ7Xbb4Pucm8XTqKcabPLlC54caKUHlUaRtjZqKx+iiIhlHhj27RXeZym8JOfE6ULDhqMvPrAEjVKFy4La5eMiHrLHtJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710640331; c=relaxed/simple;
	bh=TkFsXH3F7LQN7sxtntbCDN2txd6xcwLzuOMJ1XCkVqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQxw2okpD+/8Bpdcetnsl/rUfrs7cE/fpnpqcrRh2puOm9LJH8jc5RlEtUw0KAuM6vudu5I9wlpdng0/A7/b2IPq44Ib0YHF8uKzxsUCHfTKQoZI+qnQoSNmmvFY5r4qcK9PozJMWEuaUschvHil9AtEPnycDLPz23O8H3iFQ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGaXupo1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGaXupo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710640329; x=1742176329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TkFsXH3F7LQN7sxtntbCDN2txd6xcwLzuOMJ1XCkVqk=;
  b=DGaXupo1Ipjtt+cor3vTP0JEUvOza3Vb2V/ZW66ZqcrvmlaWy/GBdpP6
   yCF8375dxMyAYB09J0qsP7wLea6LfvvgVY03NoBftmkXRippn2GgwnR8P
   dGXkkBHQ6dA2Xd4fnGQyfN6HQEwuF487SQuQOVX7MeAYKDV5Tmtu2EakM
   i6ynO1hyjp7HiRDkBpIAEl5n/CWX7nrMJIiWiN2bvCvlqOerdTSnwoed5
   +Jz7J290e55tK7g2eEW8/tFbrV33pMQDoiKPPjFiv5NMwz1UcvKPlyoi4
   6616Qa1cI5IIohdpqYzzF4EWEGZVZnULQ1q+3P9Al2+Sb3nGYWSjaEqRU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="16030614"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="16030614"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 18:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="36214339"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Mar 2024 18:52:06 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlfgx-000FvJ-31;
	Sun, 17 Mar 2024 01:52:03 +0000
Date: Sun, 17 Mar 2024 09:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?B?TOlv?= Lanteri Thauvin <leseulartichaut@gmail.com>,
	Asahi Lina <lina@asahilina.net>
Subject: [drm-misc:topic/rust-drm 14/18] error[E0606]: casting `&u32` as
 `*const u8` is invalid
Message-ID: <202403170956.7RqBDSvN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   42abbd1bc1f3362a9adee3d05e54518de90f2205
commit: 6c0514c3f46ec15b72726e2a930262a0225e7942 [14/18] rust: Add `container_of` and `offset_of` macros
config: x86_64-randconfig-r113-20240315 (https://download.01.org/0day-ci/archive/20240317/202403170956.7RqBDSvN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403170956.7RqBDSvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170956.7RqBDSvN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0606]: casting `&u32` as `*const u8` is invalid
   --> rust/doctests_kernel_generated.rs:1725:18
   |
   1725 | let test_alias = container_of!(b_ptr, Test, b);
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: this error originates in the macro `container_of` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
