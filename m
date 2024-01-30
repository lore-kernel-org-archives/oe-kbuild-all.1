Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE3B7EEE8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 22:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706654682; cv=none; b=DK9VwLvcOumXAb7P1azadXeX0KtrqaI95l/4VEXOiob7g/GW4EObh+doBTh94PZCtReRbqgxS2ZVQeLk0jjYeYxRGQFhAy9yAddsGiE+vnpkmE/yTvX10OgIXr0J0Y/rUOEeEa0foGNwopnrz/boqIWJYlqjYZyFTXz8RD8UIhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706654682; c=relaxed/simple;
	bh=puvmnmQKwD+o5B8ITqQ4Wsnwbn/SYeduL8hWTc393yM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uIK1enek+Rs3yl/7i0YflkGOCbV1bfO+kVOceYeQuJprxv/HawGuK6eYkukIDR+ZxTW7yTry8dDmaDhtUYSeznQJmTYB8FfhkzOmIdoPN7XEWB3cL8QA1VNb/ycI0aI/SlvEUJbTpmvb5/+wnNMDx3YYkAxPUJtV4pTVz730bSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Keh1w6Ad; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Keh1w6Ad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706654680; x=1738190680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=puvmnmQKwD+o5B8ITqQ4Wsnwbn/SYeduL8hWTc393yM=;
  b=Keh1w6AdXNn3jBtJspOG985o+yUzV6z4JzldiLaONX7IMN8ifjZMXV6e
   YNPRe9IcnC0tS1XU6xVfZ8b/s8Wl2YhhPeZ7bBrJbwiDq3xx7+b1V8rG3
   Ld9H4j33lehKxRC6j8qdE0J6V7hyeG6X1ZWnyRRz2hnkvEkKG/9b6Ko56
   7e/iOowkqvWc9J8Sxs24mUXdnwixwr/rAPogROCB6VXsrONYqAZz+39vr
   zs2hxFdoysp6wfUvZv9MNB9wQIUBxRzEey04l4YxuovOYKOJHWjy4G9Ke
   kEmEZVrII0E4FtrIF0LtssRar9h3NlZl3Sywx4xWDZ6CT+3cMqje8VIgK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="403045593"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="403045593"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 14:44:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3872819"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2024 14:44:39 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUwqK-0000t6-1q;
	Tue, 30 Jan 2024 22:44:36 +0000
Date: Wed, 31 Jan 2024 06:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 7202/7390] warning: unresolved link to
 `pr_info`
Message-ID: <202401310618.DPVS8MQL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c7ebed599b0045d5ab2a1dae86c429b06bb23309
commit: 37481c8f5a5a018d37e32be081c3f6878b791546 [7202/7390] UPSTREAM: rust: upgrade to Rust 1.73.0
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240131/202401310618.DPVS8MQL-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310618.DPVS8MQL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310618.DPVS8MQL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `pr_info`
   --> rust/kernel/print.rs:395:63
   |
   395 | /// Use only when continuing a previous `pr_*!` macro (e.g. [`pr_info!`]).
   |                                                               ^^^^^^^^ no item named `pr_info` in scope
   |
   = note: `macro_rules` named `pr_info` exists in this crate, but it is not in scope at this link's location
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: redundant explicit link target
   --> rust/kernel/task.rs:85:21
   |
   85 |     /// [`current`](crate::current) macro because it is safe.
   |          ---------  ^^^^^^^^^^^^^^ explicit target is redundant
   |          |
   |          because label contains path that resolves to same destination
   |
   = note: when a link's destination is not specified,
   the label is used to resolve intra-doc links
   = note: `#[warn(rustdoc::redundant_explicit_links)]` on by default
   help: remove explicit link target
   |
   85 |     /// [`current`] macro because it is safe.
   |         ~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
