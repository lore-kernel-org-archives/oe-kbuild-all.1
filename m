Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726A61C3C10
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182019; cv=none; b=OA/DUodjaCjYwBPdIBG3+xLZIFas/iT6Js1GX9ZHoafMpye6pWhLkKBZIIabw4V6F77wxxtfk2xMJQN4NVKHiDD8X860DUIknZeuzfWYa7IL0UvfKWZJ96f3SrZtc1ktWSJe3dFuM1orKOjyoxGM9/qPkzgtKMvXQv0XLvfboeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182019; c=relaxed/simple;
	bh=y4E6LyQsJ4HXDyNyNdDHUJltHN4Am6K580caNbBb740=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PalNja+7nt98FxzvDGSmgnqaSbTWEWj1SVKdG0lA7rRiJkw9oIpHslVzlX70GJT7WZo+Te0Qh3GT5hhdDTJB80WY4vhUdIm09nZ+yVC5XU5+C413c5EPywAHMkVJn8m4CL5qpk3R/A5Oj0/Zu0rvx2pajce6CHoyBr1oRfUo8kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qt48bJBp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qt48bJBp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739182018; x=1770718018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y4E6LyQsJ4HXDyNyNdDHUJltHN4Am6K580caNbBb740=;
  b=Qt48bJBpjG7lKYu+aQYos44300rTpoO5s/qfNUimCAss7k5VvqF3IQsl
   iXPWP9k2hSBewLXMOTbLiYHFESHUmt8lfe7aFHIhKLFAV2NHo3fFzgOZl
   yfYeEukzaWnpUWZgtEYx3bVmLhtwmpy0HjIy0e/yvRoudXEUXeQwoXr3t
   tuoRhxXZlAWSi8kaBNTjJABQ7sQUfZQw8VcnX+H6CRtmOGsi/JUVpkfKf
   /ws9DtXA2zA0CA79X8Of/IMqe7jq/Vm5Ifds/wsIVc7koQqYuSg5GhlB0
   X8z1bDvw5dC65BvzByvbNE2Kcwqa1pzXNh12kb/jkIWStKV+Pb1LSgkSe
   g==;
X-CSE-ConnectionGUID: URKvgETUQZewCzk/XBbcHg==
X-CSE-MsgGUID: abN8zCd6ScqMAkViLTJ7AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39441224"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39441224"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:06:57 -0800
X-CSE-ConnectionGUID: +UU40Gt7Rr+rtgepBVAD1w==
X-CSE-MsgGUID: 8rh6+kFUQIiBYoBWJTvJEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116214441"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Feb 2025 02:06:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thQgn-0012Yf-1W;
	Mon, 10 Feb 2025 10:06:53 +0000
Date: Mon, 10 Feb 2025 18:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 99/112] warning: deref which would be done
 by auto-deref
Message-ID: <202502101807.9mIlAroi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fd3792ec2053672fb9359a570552a51ae48f4035
commit: 11e3ca6add6aa464ef8dc22708ddcd0b650e79f5 [99/112] rust: alloc: kbox: Add AsRef implementation to Box
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250210/202502101807.9mIlAroi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101807.9mIlAroi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101807.9mIlAroi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: deref which would be done by auto-deref
   --> rust/kernel/alloc/kbox.rs:467:9
   |
   467 |         &**self
   |         ^^^^^^^ help: try: `self`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#explicit_auto_deref
   = note: `-W clippy::explicit-auto-deref` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::explicit_auto_deref)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
