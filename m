Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C28F17736
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 01:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754272174; cv=none; b=ZyB+KRLN1U4UpOfKVmQRoExPMI36XmH1yBavaRHNbrE0kM+1sKcgafjjamSkMDN0whwz50pjBNnfO+zothIw538qzXluCDHbaQxkBdKTXBsQA2xaQpZk71ki4YCCFE1N3BvXbNAiz0aXjL6XUiXDc3TNqlSt75H/RHRcqa9nNaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754272174; c=relaxed/simple;
	bh=V3/uoZT1JYHA2WYdWVxQbu+lvYJAMb3DBaEYn9u8elc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+50/Hqv483gypgC1MSLowWtfg0Voro4VsGglN5QegbnnQ3IYUtoObqg5F31WodGxjNh20ygYdGgmCCS/NrkJ9wsgosH9zyHRg8/aQm2GplInHQgcuSEdg2tGPIB+XMo5HKJ0AO8avscNUkr5rbWPexSA3G58sUtZVDEcd2EtkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcWlJWvY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcWlJWvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754272172; x=1785808172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V3/uoZT1JYHA2WYdWVxQbu+lvYJAMb3DBaEYn9u8elc=;
  b=EcWlJWvY3uqlQY+RCvGtHzmJCjM8Kjq3RjlqmB4dikay9eW+NbzFVPKP
   79cRsolIllPpsoriVBP6naG71/cuea5iMNxKswlO5qagkfaMsuFcUpRYU
   bYaE0XwKnBv+FqwQEf3z8u5ROq6d4AtZTb7rYjWs6sOLQsTp2QBFNnrm8
   oOyafZjNjJQe5SJ24OmPvbjk8683KezlI4byACV4eUbpMNnVTiWn3QwH2
   4OyNPq8kHWiy+s2F9fxtUqveuVvrEr7QDMOggEzjmPbtBfuhncgeG8r6o
   koAuYX5kAerw6A54lpSZMLDpF3TWPQJRwl7aDHXOifiacz0NU+8r6oENy
   A==;
X-CSE-ConnectionGUID: B/wb7gujTV64S2NXlbqPuw==
X-CSE-MsgGUID: QUmnrctpSKGn/jGIG+fMEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="60352983"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60352983"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 18:49:31 -0700
X-CSE-ConnectionGUID: J+d5ht8rQzy2w8FxQavKdg==
X-CSE-MsgGUID: Tvs0ZAJoQ4yQED9Ozx0/nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163304956"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 03 Aug 2025 18:49:30 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uikKN-0001iV-2E;
	Mon, 04 Aug 2025 01:49:27 +0000
Date: Mon, 4 Aug 2025 03:49:24 +0200
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 78/85] warning: unresolved link to `remove`
Message-ID: <202508040307.xnVuXDKb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   800be80e4ce2e4872e0d8f2716b2b7c79a0511ef
commit: 7bbdef6a9dbce60cd6490d11ab9912ded7895d35 [78/85] rust: alloc: kvec: WIP(?): Add swap_remove() for AOP series
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250804/202508040307.xnVuXDKb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040307.xnVuXDKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040307.xnVuXDKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `remove`
   --> rust/kernel/alloc/kvec.rs:792:58
   |
   792 |     /// If you need to preserve the element order, use [`remove`] instead.
   |                                                          ^^^^^^ no item named `remove` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
