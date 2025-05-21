Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4266222B8A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 03:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747797013; cv=none; b=g0Ij6vmHaYmC0pUoWbbse9C5kMXy5dXacPdaz+Ab9OMdRWGGUPxlQSziyfvRuMumy+MVNrBldkmoXLB5JK82mtxVxFA8PgO/BT3cueHaGMmCFpFVEa82qDpuB5f9MvpAVRFFepz00U70qA9qblzHvdKtynqUurYzZczcVpAkW+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747797013; c=relaxed/simple;
	bh=tVFQQ/RlTXVunnFz6I/0N8fnYoJaTonTy24kqORWEWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PYSe6foJUAXS6QG6/CR+S0SFl8ylQkvPXH6qsRjC+WEKU85H1rO0rOTiGET/OVQk/m8DX1v6Qpw7sMJodHX3NdbnHMaGk2gD/kZ/1Cs+r6DSWxdY8JvGwKgKEWtSRA5EUqAzGwpW5Zf043em1uSuOjSMI2pNtPVstmJ2K9z+9BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZRDl/Ph; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZRDl/Ph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747797011; x=1779333011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tVFQQ/RlTXVunnFz6I/0N8fnYoJaTonTy24kqORWEWA=;
  b=XZRDl/PhLsWNuQRFWdJa8CP6lTGMhLxc06rwnJ30iLPbOC+vu/ScMIz/
   t233DHVvFRTydT6qmpbklYQLhWqym5X1rp9m3J+XD69VY8+DzudE3gnb7
   RgaKe+c1S5DeGaRfyPAX6zfv3xpYdpnFcSzMycPxqWlNY83g+gt9Io5X3
   XWzCiaa1l321Elt/UQBJBA0vffn2iS6E9Y/2t1Cs7Awvu0j0vArjvTuXo
   sU9HVRX/124/dDJbEOjavFGEs+vJkHvuI+WIE/JRkuLDisOiunc5p+/OI
   bFdOuZcKSl3NDKNFLT52bif3NGvH92ttoiKEwuhOjdrRSBqZTUdy0W3U5
   g==;
X-CSE-ConnectionGUID: DLL9kF0OTuiZYYf9CJzx7g==
X-CSE-MsgGUID: ex1k47zxQPiKU+Rm2GvFdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="72276770"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="72276770"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:10:08 -0700
X-CSE-ConnectionGUID: Tx87XxXcRV6oSU6j7G1ktQ==
X-CSE-MsgGUID: WlVqwXtLQRqhyFAzfYojdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="143882875"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2025 20:10:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHZqH-000NoW-1u;
	Wed, 21 May 2025 03:10:05 +0000
Date: Wed, 21 May 2025 11:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/1]
 kernel/sched/core.c:1660:8: error: no member named 'avg' in 'struct
 sched_entity'
Message-ID: <202505211038.NVfBh2eu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   a9210c1506e930df0afea77708f176a29bd80ebf
commit: e0515f89730a8597730e11f244a80d37c7970d4a [0/1] CHROMIUM: FROMLIST: sched/fair: Add util_guest for tasks
config: x86_64-buildonly-randconfig-002-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211038.NVfBh2eu-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211038.NVfBh2eu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211038.NVfBh2eu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:1660:8: error: no member named 'avg' in 'struct sched_entity'
    1660 |         p->se.avg.util_guest = attr->sched_util_min;
         |         ~~~~~ ^
   kernel/sched/core.c:2629:13: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
    2629 |         struct rq *rq;
         |                    ^
   kernel/sched/core.c:4917:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
    4917 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^
   kernel/sched/core.c:4917:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4917 | asmlinkage __visible void __sched schedule_user(void)
         |                      ^
         |                      static 
   2 warnings and 1 error generated.


vim +1660 kernel/sched/core.c

  1656	
  1657		if (likely(!(attr->sched_flags & SCHED_FLAG_UTIL_GUEST)))
  1658			return;
  1659	
> 1660		p->se.avg.util_guest = attr->sched_util_min;
  1661	}
  1662	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
