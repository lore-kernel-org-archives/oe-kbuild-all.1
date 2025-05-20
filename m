Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F29211A16
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730894; cv=none; b=m4Dpe8KZ+Wu/OdclZZ3wXjLOABgaq8rWwFuLn1/aaRXJGDU9efjwVfYLUnIhFzFJcK0VwBqo0a9vL0ciq5fA2FodOHY2lZ9nTIF0EdEVK2BAUAlgfw3M49cY9+wylLi4DkH8nm1T8NJxKBXB8OC7F+pxLq51mxBZwG0Ayywlr+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730894; c=relaxed/simple;
	bh=8oDKruhmg06st/B4nZH8EQ9Bmkqj8Gfvnks4Xst9XFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rZbuWwO5U8f86C8SCUOeVNQHdazQwgM7Bmm3LBg9605GOdcsIIoUxSWxFbh+glOnrpWi+l5O6nWvaKulN3R53iDs2aJ3GVHfYn0Gzd0si6sBHAJg4M3hG9aTHpzHqFbzS0dO/dZ0M9A5XLJiWKM9RzYPHo9iA+fU3rrSynvNrAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mP+pm9vP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mP+pm9vP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747730892; x=1779266892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8oDKruhmg06st/B4nZH8EQ9Bmkqj8Gfvnks4Xst9XFY=;
  b=mP+pm9vPm3EYiKypA0cWZcqqxgJkTcUMMw536R50wmVLuDVQM52URazO
   GewqyOk6nfBNGKsZhEI6+yr+phTb6ahAW35ahH3FJXgbqGCFKvXCoNlof
   LNKrlOhx4OkuHkrHfh3/kmP3+43fSCnoJFR/HNhtPdGM0da0PNv/fW4An
   U3FrQSJbgbMjkQGc44qeteWfKzoYuy7Q2FLx+Xnbe12CSmWPIdZoE8C9K
   NvAt8xUZq2Ch8FJ1akROLcZIZhYygM+IAIwXvc9cO/AmfO+L+FVm2Ks3p
   5mzqcA3ev6Qgffd/aeziyTG3pA4v/Up5BTUSE7+t6mWMUjpyX0T7jLVbw
   g==;
X-CSE-ConnectionGUID: YdG9UaMpQBuljexs5qjU4w==
X-CSE-MsgGUID: CYCBpAgeR8CE7QWKVG4Hiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="59882452"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="59882452"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 01:48:11 -0700
X-CSE-ConnectionGUID: Za5zm+idQNamGdEoPD6/Lg==
X-CSE-MsgGUID: TGamvUGdTZepQAmphZ8eeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="162934536"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2025 01:48:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHIds-000MLe-0x;
	Tue, 20 May 2025 08:48:08 +0000
Date: Tue, 20 May 2025 16:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:la57-cpucap-v5 5/5] arch/x86/mm/pgtable.c:849:6: warning: no
 previous prototype for '__pgtable_l5_enabled'
Message-ID: <202505201646.PWCS1Zin-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git la57-cpucap-v5
head:   29fa6f3a27a57cea428ec1379140d419498003d5
commit: 29fa6f3a27a57cea428ec1379140d419498003d5 [5/5] x86/boot: Avoid LA57 CPU feature for pgtable_l5_enabled() in modules
config: i386-buildonly-randconfig-004-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201646.PWCS1Zin-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201646.PWCS1Zin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201646.PWCS1Zin-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/pgtable.c:849:6: warning: no previous prototype for '__pgtable_l5_enabled' [-Wmissing-prototypes]
     849 | bool __pgtable_l5_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/__pgtable_l5_enabled +849 arch/x86/mm/pgtable.c

   848	
 > 849	bool __pgtable_l5_enabled(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
