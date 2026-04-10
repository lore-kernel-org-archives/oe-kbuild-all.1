Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D673E0C65
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 22:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860703; cv=none; b=F5serPRRxWWCzOJ60UyTvaLd0qLHKOMNzyUOcbuaGf3Svk0cKK+2FKx2NgnTGO5ECMEbYeQWhiTSrIzmp9JPFjJf7sl1KpgCTrAynCGs0kpkG6uPS+ZZZee8dlHVQDu/EOSyakBgevqNb3DEKhAe5zfJHYcvuJd5nyQMwavcFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860703; c=relaxed/simple;
	bh=8OWmT7gvRB+WF81rnsoA+lVeWgXThAHNi9GNQRZv+Ho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t7qoWr5EkpP8xcA2E9H3bYgOHNfoHgdmgjC+rzbFwrBIBe33LKDshfYjGD/nW9my2VES/FQ6VTTOZS3dpfTPYsjKhWYVJHOf/F/zItiWw09O76PJId4tUA8IFyRFHe+83lwlWk3VqSPgSpWJQCX9jlEvtRK3DFJXQKd2+ms7zDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bj6+jN4v; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bj6+jN4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775860701; x=1807396701;
  h=date:from:to:cc:subject:message-id;
  bh=8OWmT7gvRB+WF81rnsoA+lVeWgXThAHNi9GNQRZv+Ho=;
  b=bj6+jN4vQedW+9Kus1efcjT9EIDk9xhj3rGvMN5vh+WBd91xdGV5NinO
   oxA69Qla56P9JtzX8GwcIChBP/kcq7xnTgUlfNmfojD3lSI/VhrDCyr5V
   L/NmQ55PjA//pCIHGzd0Yg9RQTeqz7/Va+9EneAGhK2rk652dSmNHJUor
   M3BifX+SW9Xn2l9+U8ITBBrNxN2g+EvFQwmdq+/9R0ycqUNAwMP6NqQyq
   ySDjHjH2TtpI39usG29Pj1PNJ6tkU7+juXSTtPvXcklU0mFCk98mrQw2O
   7o2786ce1C7dyYPjZkwjG96pZQQNI1Ye8kzp7bC6niDNyb/Vtf8hloU7i
   A==;
X-CSE-ConnectionGUID: E4lSC0TsSzqdakeMeIdxNA==
X-CSE-MsgGUID: /njBMrjWSAOdLhh4Y2A+Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76848737"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76848737"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 15:38:20 -0700
X-CSE-ConnectionGUID: drZDkBmRRGuN3gGAB1NgvQ==
X-CSE-MsgGUID: S6g7g93SQryhgkPbwLGEDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="222723107"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2026 15:38:19 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBKUS-000000000JZ-3JAu;
	Fri, 10 Apr 2026 22:38:16 +0000
Date: Sat, 11 Apr 2026 06:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>
Subject: FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or
 directory
Message-ID: <202604110642.Mlzf3TJl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ihor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
commit: 522397d05e7d4a7c30b91841492360336b24f833 resolve_btfids: Change in-place update with raw binary output
date:   4 months ago
config: parisc-randconfig-r063-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110642.Mlzf3TJl-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110642.Mlzf3TJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 522397d05e7d ("resolve_btfids: Change in-place update with raw binary output")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110642.Mlzf3TJl-lkp@intel.com/

All errors (new ones prefixed by >>):

   Complex, interval and imaginary float types are not supported
   Error while encoding BTF.
>> FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
