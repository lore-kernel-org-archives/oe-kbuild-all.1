Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCCF2EB84E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049053; cv=none; b=D466H99mQgq38rPbg2u8JkMjugzuP27eYhrojO6AOPyC60+xTKMQyz7wpD6ORXtPVVNoOdDOsG8NaXWx3O9L9jeagZbdTEgy39jpKuLZsppffrqQn0b0J/QR47DyJiy37n1SWHFnisM+DwCQw67IugCAKzjzcK2qKhoUh644CmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049053; c=relaxed/simple;
	bh=cPIUiQwgIsrksucncxOfqF5q2pplrXsywvYrwICzw6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DP9UozXaWAWwBj88/kUNXI/wph5nxKV44C4JCy/bTWgxaQhycgch5PuJU9Ta+egi+n0aKjHKHuGYGYjfS6eP94SC7gjdSZ12NfGG+5zKK4RsQh4TCQg5keO4EJ8w4AEQhtm+7oca1mk0dQw/KzcQzEwrHBsHEnjLbi8rc0PeADg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYUlnEQg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYUlnEQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766049052; x=1797585052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cPIUiQwgIsrksucncxOfqF5q2pplrXsywvYrwICzw6k=;
  b=MYUlnEQgm4liC1FG2rAxkUAD7Wxg5zmyjlaxHzPXvQR0hjJrLRft20B5
   qCd0d9XOYElMiZkoJISuOiTMqKxJSnplp2gkD+Ovvdb0UANs1rlzareg1
   a55uCtI3YftI4wJBmT74FuPu4Ga3rrFT04549lNvtboe9SZc3P90c8XHp
   3eU3WlO6ECI9nY0HgJctxDqJERjxRm/pMkZqnVNLPWCk7Sh10OADecezl
   Rrw2Ge3hzQqBrUSRxVB5mdl5FlC0Icowb+sAOATw1/eQfoIvUYf+kpS6U
   zBvyhzkZSKM8jh+fiVlNDUJNbtcLoieyHyplglb+CroPRf+/58GKDrleG
   w==;
X-CSE-ConnectionGUID: GPlnhChVQxOY0JDa05Hymg==
X-CSE-MsgGUID: sQ2iHZD5TyW2wAx1wVf4Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="68153208"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="68153208"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 01:10:51 -0800
X-CSE-ConnectionGUID: 5jree3B2RSCBnj4bs8N1bA==
X-CSE-MsgGUID: Erl53hm5TSq6AuFsW+wFkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="202922204"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Dec 2025 01:10:50 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWA24-000000001s5-0Szu;
	Thu, 18 Dec 2025 09:10:48 +0000
Date: Thu, 18 Dec 2025 17:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/2] arch/x86/kernel/smp.o: warning:
 objtool: fred_sysvec_reboot()+0x65: unreachable instruction
Message-ID: <202512181746.4qhrcC0k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: c86f5a9dfd24421e81b9b978d0ce4a6d06b6ce4c [0/2] x86/idtentry: Incorporate definitions/declarations of the FRED entries
config: x86_64-randconfig-002-20251216 (https://download.01.org/0day-ci/archive/20251218/202512181746.4qhrcC0k-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181746.4qhrcC0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181746.4qhrcC0k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smp.o: warning: objtool: fred_sysvec_reboot()+0x65: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
