Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC3E1419A4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778332651; cv=none; b=Rn67KXngGjqoAXMkgh+ko1yqZBoQw5w9JHRMNoRVqtpbGqRIqeVltndifXXM4TV9oP576znHQhm5H2hJ0q2ZfNki95vt+a0rv3usbhso+nP8LkB/dnjMq7oIMM/fyqWmNK0BqMOR3tLE9NZqaa/s8CkjKFrAJ747A6MX/T0Uj0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778332651; c=relaxed/simple;
	bh=ydvHljLnorYO7XkTQSIWa14/jmwLliM1HxG6EzXf6RY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JAXpiQIyv5wPpYCIWy3Q99NLnVMs1dpq4l7JnUxIuohgeGIUWmlDsg1W3mcUVCKBWbOy8hW6Y1QV7rF9vPJGnorfC8cDbsqtvIskwlWXzUIyisvfU7gk1LjRnP51ZjjdKI5EXRuu/0do+HtM/q+YPlCI87iRL2ZU7h2Nv1HJr4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYx9NQio; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYx9NQio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778332649; x=1809868649;
  h=date:from:to:cc:subject:message-id;
  bh=ydvHljLnorYO7XkTQSIWa14/jmwLliM1HxG6EzXf6RY=;
  b=bYx9NQio8SNstTmxYs2JkOU3lznDHaHWywH5HVSW5psJDfqByFRk5FgJ
   mecDhkclnapQ+gvYQy1JZ6PjtpoXzeaXlckmkZdGIq8YMNEVnF1i9NDOr
   DQ4EHxrU+uo/ifpLk8lGhQF59IU+RFGyVkIIiZMoB+5nyjYwjeaG1/G1Q
   owMMZoSTaR/R3SsFal+imWZVJtY+QswVzVOiv9sTncys05PciO7ZLAPFc
   SBzvb+1H/UHeGN2g3UWQdwHscT30D4/d00rLvdmGnEPQ2SmprGheuwPfn
   F6upfoK3gQzE+CHznu0flGJJbKYJLc63GYbsgWVUaUZd8X+HTVW8CVjy/
   g==;
X-CSE-ConnectionGUID: bKInf+9ERWa2lDCwbOdWew==
X-CSE-MsgGUID: DqjqjtCqRaaE8r2/7kqOkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="66821817"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="66821817"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 06:17:28 -0700
X-CSE-ConnectionGUID: B0CxS5q9Riyll+Ve/i2aAw==
X-CSE-MsgGUID: 7cV+IzwqSr2uMNh+OcsgrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="232513144"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 May 2026 06:17:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLhYb-000000007TH-0jZs;
	Sat, 09 May 2026 13:17:25 +0000
Date: Sat, 09 May 2026 15:17:09 +0200
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 31/54] error[E0277]: `T` doesn't
 implement `core::fmt::Debug`
Message-ID: <202605091534.X8Q5WJTV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   571e5d3c9fc1383a0f7a0a52d30fb5ad9f74bef4
commit: 4af9e85767726a5767b07a6c51479a842b4a896a [31/54] rust: Introduce iosys_map bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260509/202605091534.X8Q5WJTV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091534.X8Q5WJTV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605091534.X8Q5WJTV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: `T` doesn't implement `core::fmt::Debug`
   --> rust/kernel/iosys_map.rs:516:13
   |
   516 |             assert_eq!(*self.vec.as_ref(), *src)
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `T` cannot be formatted using `{:?}` because it doesn't implement `core::fmt::Debug`
   |
   = note: this error originates in the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: consider further restricting type parameter `T` with trait `Debug`
   |
   489 |     impl<T: AsBytes + FromBytes + Clone + PartialEq + core::fmt::Debug> VecIoSysMap<T> {
   |                                                     ++++++++++++++++++

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
