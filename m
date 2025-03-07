Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BA1664C6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 05:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741324088; cv=none; b=QhWSg5xCr65WdGCDuoOyhi/jiFzYbd0czepwhwnNjjxlp12cwX3ElftJmWQtsrxp61fQD2bGKNS8csGwl3B+WWLGUNjW+FfLnLvLyKBpw0xJng2c7DxFceKUQos1yiiAg0cRNgV0wUAvyC8DyrFnzVZXXnhhaAAVCZJuyB+16D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741324088; c=relaxed/simple;
	bh=S1SYTRASpCbA+dLioCWWM4XWzVvn1bUBHoNW5Gmw6f4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5E7wIhCRb1Vy+M06oL/P1fr4n2xMMnzv8pzG+VhVZovnlPWGtAff9R/ZzMnGWLd5+FY6+OHFLHYxRBm0xXQcWF6Dd4TWtMDla6nv8ylV1U396RNy74WFofWsxhkCBquzsjo0ixcIxU7OJPlgdQZxw8dWkJFJXtHVmhQNBuR8Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFgTZ2DS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFgTZ2DS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741324087; x=1772860087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1SYTRASpCbA+dLioCWWM4XWzVvn1bUBHoNW5Gmw6f4=;
  b=eFgTZ2DSVVZBAMEIaTcJTim36kHhTTZ9RA2CWIaaG1Qk0yRzY6WPMoX3
   oCFgPHgYnPNQtJpK/HfdtNhkOjRxjfWzEJ2YUzKRSVWKiKOIfz8s0vYAC
   1QJL7BiWPy7Gabt6VWr4xl3YVtXT/bappI/0huVJs/r1AOm66Otor22sH
   tGWC6JZTUykmtmileyp2baRIp6JEn9P+MOkgn1f8Y9dXeoUsEnKCACeBX
   6/eP7iiEAol0zP5Y8d7ihN5K/7Y1I0koMDBb39/4+iqwUVHFWwMw6tw7Z
   CUqHcpiGlcNHKd7EO9pwefgu6i/fky+0peuNZGZJA2VKnXHdNew8GAJQX
   g==;
X-CSE-ConnectionGUID: 7pPEOTZWRtWMgY8vvD+piA==
X-CSE-MsgGUID: d0jbMcASS9OpCsrbpvLt6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42276602"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="42276602"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 21:08:05 -0800
X-CSE-ConnectionGUID: UPoGvrFNSZ2rZFWGZw/ceQ==
X-CSE-MsgGUID: Qr0fE4UJRqOjLjHrxZ6sqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119408485"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 21:08:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqPwE-000OZk-05;
	Fri, 07 Mar 2025 05:07:58 +0000
Date: Fri, 7 Mar 2025 13:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 7500/9212] arch/x86/net/bpf_timed_may_goto.o:
 warning: objtool: arch_bpf_timed_may_goto+0xc: call without frame pointer
 save/setup
Message-ID: <202503071350.QOhsHVaW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   565351ae7e0cee80e9b5ed84452a5b13644ffc4d
commit: 2cb0a521527461c5519b2115b42709062a6a63f1 [7500/9212] bpf, x86: Add x86 JIT support for timed may_goto
config: x86_64-randconfig-006-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071350.QOhsHVaW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071350.QOhsHVaW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071350.QOhsHVaW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/net/bpf_timed_may_goto.o: warning: objtool: arch_bpf_timed_may_goto+0xc: call without frame pointer save/setup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
