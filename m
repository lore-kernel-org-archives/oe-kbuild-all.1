Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C809623B0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 04:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749099137; cv=none; b=eaGnso3Jqjt4baNe7zPxoYuE9sLeuDd1V8+QcQbL34fcraQCkLilgyFLdWRO+iOiNVsevsuQdx7lP7Pm4+y3LKb9OfFcgbIsyTtr9cuszEHCP4Wns1IJAa9uoL12MAJIcVQfWczuYycH9kcSgeoziaa/WTipTyMBGEgtlS+Q8Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749099137; c=relaxed/simple;
	bh=d5QDG84U8qFll/oTLJbp/uOOODTC3umZMN7aTH7SGmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLK8UqnJqZQq1rT/76FptoJqCYrpSKwxLIr5sdj4/DCn8CLA1bbeOU2fvgFlJVivLbqK3iAStyzOU8f1kXJrTVdQzvf/o/oijskVmi0s/lDKTBFweprbc6bd/8GAjWHpRqVbqf9ilW8QBy66VPtwZFwKOKy7pUS0KGVKoxoQGT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3VL12v3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3VL12v3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749099136; x=1780635136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5QDG84U8qFll/oTLJbp/uOOODTC3umZMN7aTH7SGmQ=;
  b=d3VL12v3fAMIagoLo/EJ29iYz9Pd17DvU9iVsXVIXC4W71iIIJq8beCg
   8P8q8ifrZVwq71DVmkoE9lTWAYPhsGq9Vcv5doElsGKVLefDkbBnjagGL
   jZ7el9m+m4OlBIXC/TYk8qRjwOxrutLP+nxwBGzQHRsCyOo7bZGZoL080
   ZUhkZ5N3YYTZkwKaP7PXy3SjxT+oqTRoIjVWQj1Ffr91YMF3hiFEFnSaU
   g69aZf/pAm3zK9Bg4oorh2Y6KQXuydxyDO2QZCQ2I2oK7vommfheZ1L/7
   2ydmnaiv83ApbKgqH2VXwLdnPF4mfI8JM6GoWvCbOh2pnCIYt4ZzOpMFp
   g==;
X-CSE-ConnectionGUID: r8eP32mpRySCnxJJXtr6Hw==
X-CSE-MsgGUID: 9KIpiGM6RRqze/oIl6G0QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54864884"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="54864884"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 21:52:15 -0700
X-CSE-ConnectionGUID: URJFPtLRQKKqER15M8+wXQ==
X-CSE-MsgGUID: ktnkntpZSYe9jBtvg0VMPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="145733804"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jun 2025 21:52:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN2aJ-0003jP-1x;
	Thu, 05 Jun 2025 04:52:11 +0000
Date: Thu, 5 Jun 2025 12:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Subject: [uml:next 23/27] arch/um/kernel/irq.c:694:13: sparse: sparse:
 function 'sigchld_handler' with external linkage has definition
Message-ID: <202506051226.X8r7X5aa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
head:   942349413a49670e8bed246e2185fd3a053227be
commit: 8420e08fe3a594b6ffa07705ac270faa2ed452c5 [23/27] um: Track userspace children dying in SECCOMP mode
config: um-randconfig-r122-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051226.X8r7X5aa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506051226.X8r7X5aa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051226.X8r7X5aa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/um/kernel/irq.c:694:13: sparse: sparse: function 'sigchld_handler' with external linkage has definition

vim +/sigchld_handler +694 arch/um/kernel/irq.c

   693	
 > 694	extern void sigchld_handler(int sig, struct siginfo *unused_si,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
