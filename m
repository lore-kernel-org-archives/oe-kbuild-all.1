Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B324679A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 21:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758749250; cv=none; b=Nk8jYZ/uYWc1OZctfLSBALW2k5wPUTIkRZ6KuqbpNvd8e6zpKdOY0g3Y9bXV2aY21Dkzg1IlH5zIbcEI6GGwTaVOJa4/H/6ShKBy+Z6D5/CRzY8CATeqWA/Yhzi2LaPZSyiJAHaustrPRqj1N77haYJ5KOy5Azwnvksk1RVnh3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758749250; c=relaxed/simple;
	bh=CuNmC9fMGvljO155Q/Qh5vI6K7F/S3I2rG6lxRiyNJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nzqycYm65VjMDK4vbJkOBxzxyxMCwJFP5d6aPOGE3BE1suObnW2EJcRFjc7Dwk+Yc6AlFIpVUXSnGfsCupGtw66vOYpe+XLQen/sUnb1deE0skRvTKaLwR8SKO8yt3ZhYtP5QcX0f984Nh+dLe7zkVx1289ARBnHINYdcb/LJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myso5ueW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myso5ueW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758749248; x=1790285248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CuNmC9fMGvljO155Q/Qh5vI6K7F/S3I2rG6lxRiyNJ4=;
  b=myso5ueWIF7gPm7J/UZ0T7jYq3r+9sEOlv3jRUQ5JEzymjqgcsK6g2k+
   1JBUP8NI+Mwkws6RaLCzz7D+bGJANXQfU8+ZdfYSMoR6jAHXkWAZLZqO/
   IgZE+oYWXewH9EnZxTlDDw2+vD3Y4NPkefTPalElJwin9FnaldeOK4mZh
   KK+bX3Hm9zBYvxvpFsdKGnYny52hEUfwnhccRJEf1h+kjCTjn6yGkkuZj
   j36snNvsLkcZFBr3REan31IJD/gf/DwMvKP2hDIOxLUvX+Roh+wbSHbcn
   syWyLWzTBqPDwjOKsXw1KNFoA5qYtkRauAGHjaj7sU/o/7yoJgbXGREG0
   w==;
X-CSE-ConnectionGUID: rY5YxAzUQ3igyPlZXG9nfw==
X-CSE-MsgGUID: JPwH41FLSx2DNCD2zBNRiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64895984"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="64895984"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 14:27:28 -0700
X-CSE-ConnectionGUID: fpehmbipSvyFGlOUVK+uxg==
X-CSE-MsgGUID: 52vsXBVBQuKO4CR+wwY70g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="214265639"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2025 14:27:27 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1X1I-000000004eX-2fpf;
	Wed, 24 Sep 2025 21:27:24 +0000
Date: Wed, 24 Sep 2025 23:26:55 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/dev-bitstruct 10/10] warning: equal expressions as
 operands to `-`
Message-ID: <202509242340.kTk9JeC6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/dev-bitstruct
head:   b32d7e59ee65f3aa21afc5c467495cac8fd5703f
commit: b32d7e59ee65f3aa21afc5c467495cac8fd5703f [10/10] Add hardening for out of bounds access
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250924/202509242340.kTk9JeC6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509242340.kTk9JeC6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509242340.kTk9JeC6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: equal expressions as operands to `-`
   --> rust/kernel/bits/bitfield.rs:311:32
   |
   311 |             const BITS: u32 = ($hi - $lo + 1) as u32;
   |                                ^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#eq_op
   = note: `-W clippy::eq-op` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::eq_op)]`
--
>> warning: this operation has no effect
   --> rust/kernel/bits/bitfield.rs:311:32
   |
   311 |             const BITS: u32 = ($hi - $lo + 1) as u32;
   |                                ^^^^^^^^^ help: consider reducing it to: `$hi`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#identity_op
   = note: `-W clippy::identity-op` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::identity_op)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
