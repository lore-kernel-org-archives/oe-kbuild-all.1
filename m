Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B51F542B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742638650; cv=none; b=Hxvp4OYCki/EN+LY+iY2IOSETf+ikIiP8KzpppqchTvXJFI0ZA6wCZAvYxqIZrdQWLhwyVXQwviwIHs8C7g9n/psMvTBhkwO+y5Qnwu/BBgo+oMNBI5gOR0iZHYeK6uBmLPNzOktWRQ6GXnHIL25KDpGGTKUy7aHT4zX6Nfe0c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742638650; c=relaxed/simple;
	bh=13/rB+pEC160puonCzCTqJSmhPgXf66jaX8aErUyTwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OLBmFw+v3jBrQ03vDERWXxneQqpud4VLCuDlnRY8ufL8xO+oPBYJmXT76ZLPHQy/HxLdFwWjaY45YX+Xq8kHh4sGZtppyLPNm4jrCUSNj4zAFQApDp8TI7TiWCFyMZ4Oaq4XLFgBXx4KfUsvRgbKceJeo9nNonP75502lz/9YWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bftXijxu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bftXijxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742638649; x=1774174649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=13/rB+pEC160puonCzCTqJSmhPgXf66jaX8aErUyTwY=;
  b=bftXijxu19zq2p0wZXekY9tlV805xqJaGspkmje58biBwSjOGK5k1/Yd
   whemhqMdUrJ87npD4nvD32H02vkBtyq0WOqSf04VxPdBSqdvkFR86Xfpz
   muuvQvxIN8GPCF12u+q0bmizKiEirEj9x4q/lu0bPbScDlvKZkTGXyuM9
   nYixgguCg07OMJquweBUGJNdC7Ltm2GEsRYN7I1aTU79wpiU+Up2SZJml
   werUSsVD/JYi/b6ystwkab6cpD8e6PPqcpmgj/RPutSeUCfZv8TBnj0am
   Fjqrr1brYRy7VobyjHGX6vgMr1vRqngPHNy56bTnmBjvKyOZ8FRWif42t
   Q==;
X-CSE-ConnectionGUID: WqCfTzavTnWi/T7Sia90pw==
X-CSE-MsgGUID: YBYp2PLDRhiSKnwGU8RzQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="69251010"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="69251010"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 03:17:28 -0700
X-CSE-ConnectionGUID: psCIs9OxSoWBxxn7pN9Iow==
X-CSE-MsgGUID: gpgz5JYIQd278NgsaIcwHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="127762060"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Mar 2025 03:17:26 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvvuu-00025C-1Z;
	Sat, 22 Mar 2025 10:17:24 +0000
Date: Sat, 22 Mar 2025 18:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	Tamir Duberstein <tamird@gmail.com>, Lyude Paul <lyude@redhat.com>
Subject: [rust:hrtimer-next 4/13] warning: casting to the same type is
 unnecessary (`u32` -> `u32`)
Message-ID: <202503221804.cWPPp7A4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux hrtimer-next
head:   ac4f9157e8d7f6a9793209a693cb3e3a6f840983
commit: f008650c44ceb89d82441e79233d8e0f02fa9276 [4/13] rust: hrtimer: allow timer restart from timer handler
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250322/202503221804.cWPPp7A4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221804.cWPPp7A4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221804.cWPPp7A4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/time/hrtimer.rs:319:17
   |
   319 |     NoRestart = bindings::hrtimer_restart_HRTIMER_NORESTART as u32,
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::hrtimer_restart_HRTIMER_NORESTART`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   = note: `-W clippy::unnecessary-cast` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::unnecessary_cast)]`
--
>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/time/hrtimer.rs:321:15
   |
   321 |     Restart = bindings::hrtimer_restart_HRTIMER_RESTART as u32,
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::hrtimer_restart_HRTIMER_RESTART`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
