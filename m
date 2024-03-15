Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BF014F65
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710490325; cv=none; b=ey9ufRN6n/FGoDxgenYz4NWy3wiVpcg3cZvcTT+/Km+qOtooxWVj3bY41ONzOV30oCY0RzMUiQhLNr1XwYlSMt2fgQuUZjciRApVvs289uhRARLYTSMZVw//0Bd1VE8gBUZgh9/q5Vv+i7Eny5qYEISYwg4c2OFSZmDjPCD0n24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710490325; c=relaxed/simple;
	bh=5VWUsHeYs6S1FeLSBLwrRckp4B+PKbhUEW0W6hLzVdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6/SAvyYfD7o0IOaHUn42OofMIU6lSXBmaWieoQ086R/lqwYlO8SiXxIbylPJ5XH1cH5EL9x7+Xa85IhZRWcB+7nFi0BrScV3iD0ixlsq50E4hoPBeVLY70Pckv8IWLPg7AyYRZHSHsuCv24p7zrRHek5K8hbqzeFUH1/LT+mWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxvzQozU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxvzQozU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710490323; x=1742026323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5VWUsHeYs6S1FeLSBLwrRckp4B+PKbhUEW0W6hLzVdQ=;
  b=gxvzQozUxZrY2ECc/0HvxP7eLtxzha+LmfDdLsfGicmFqkMdB3HxPR4x
   ipsbo+omPa0yUMGaIyBbPyxtEaLJ8bUi8FHzGRgsb39afVI3ehXC6SAy9
   Tk7omAnmLQcY7I2e8YeyJVLcYYK1eJdOuRyisEJPcP6hYijkgLvRKcHi4
   kLu5Qx9YKtQVHxUVlXc2bEEJ/cCrJXu/LgVp6sEJPlKex56xfh0ubvjYD
   8+WcQ5PZQ8F5xXdyVNJN7d4GE4X5ezEnQ7E0YZYMkBa+/45NJ5FwjHeAw
   Hu6V5dk4rJZZJ3dyaoqitE4flFndqCKx9hsx0bOTqXFRAsJb2n/evmYDU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16748234"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="16748234"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 01:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12549318"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Mar 2024 01:12:00 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl2fW-000EFJ-0r;
	Fri, 15 Mar 2024 08:11:58 +0000
Date: Fri, 15 Mar 2024 16:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 5/18] warning: unresolved link to
 `RawDeviceId::to_rawid`
Message-ID: <202403151651.nhMv8q3A-lkp@intel.com>
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
commit: 536aa252b05694f74a7aca913fe25fe7e218df4f [5/18] driver, of: Mangle the device ID machinery further to remove const_trait_impl
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240315/202403151651.nhMv8q3A-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151651.nhMv8q3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151651.nhMv8q3A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `RawDeviceId::to_rawid`
   --> rust/kernel/driver.rs:120:11
   |
   120 | ///   - [`RawDeviceId::to_rawid`] stores `offset` in the context/data field of the raw device id so
   |           ^^^^^^^^^^^^^^^^^^^^^ the trait `RawDeviceId` has no associated item named `to_rawid`
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
