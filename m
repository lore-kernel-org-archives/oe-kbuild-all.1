Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72C41C0DF8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711819418; cv=none; b=ldK7uwqFwbUjMwaQDAmKBlZ9XAN/YbJpR+UBbzn7kxRS1QVxb+d37I1IJ2uPbReTRsxhOS1eNQGGhesDT5t5pGxK/jq/Mmift+iEK/Bnvecj/4OjqiV3xmkegS7LiqY74QJhNH9vlRw5c2KYMnjvyV3+D0E2nxWJfgcWLoPfUJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711819418; c=relaxed/simple;
	bh=+e6blPTrG5dc1811VPzDP0TMWKpyWKfYiG0tQf+0eyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e7n2AfRRxNhBY+1sl9+hunLbim+xRExgUxoV7Z6q3+AhX1FZLLAEUchvWcasMBBzEEN7VA97Bwm7gWW73f6MtrJ9KEeznBB6lm+eUZEr7MFgfV7Gx9LXavsuCzK9mVJeuDPUuC8XOXd59U3hE+POCaUqKIx8PaGmHBaI4K/VbJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcKAtlIh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcKAtlIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711819417; x=1743355417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+e6blPTrG5dc1811VPzDP0TMWKpyWKfYiG0tQf+0eyI=;
  b=kcKAtlIhzMDngwAh+X6FuTcZxVxqjJID4C+LI2dOP8QikC5e99OE9wYt
   VXefcVhvETG7wIR/xWz3e6sTXOAzfxgW7ss0n2t5OYznHvicPVu/1wWhy
   woAN1bB7AG8cNVSnm2KGxSZQsV0XehdV8MWP3fdqWjxUSkHdVlIzUxsOD
   IsgSQrTBXO8vQQVWoQkzrNL7EWe+0Wt56l3z8HjSEG/LpRxiO2Zj3K3p0
   sNGSIvR9XOVJcJQ+RcLVohujNQmmw5jzZ0VdOnW0qXo+Sx4h8b9fJeiGo
   vq/x/1pXXguI4T04D+oyiL76TB2+lrOEvDZ6ZorxuimY7pP5+88xY8Elr
   g==;
X-CSE-ConnectionGUID: SHofkaU+RP6WS0DXNDCYkQ==
X-CSE-MsgGUID: aN39F8RvSBubUYPQppmeCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="18131091"
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="18131091"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 10:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="17735090"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Mar 2024 10:23:35 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqcQW-0000EI-35;
	Sat, 30 Mar 2024 17:23:32 +0000
Date: Sun, 31 Mar 2024 01:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 1/32] .meta_changes/README: warning: ignored by one
 of the .gitignore files
Message-ID: <202403310135.k9poitUB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   694c5d0b7f0af673991cf9d6c834acd9819cc41b
commit: 688645a98acf24321d0647007eff632c1b2f3356 [1/32] === mark start of DAMON hack tree ===
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240331/202403310135.k9poitUB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403310135.k9poitUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403310135.k9poitUB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .meta_changes/README: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
