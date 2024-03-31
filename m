Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBDF290A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711886738; cv=none; b=jGt8vQxH5zHGvBwFngVVHdJpvlM6wra4IvjQPDe5xLTh904Ct9Mt8+QLfmYpG8YhptACoAKyTDUfdmgJ4ikzDZmBokw/USWSR5X3O5sdal7F72F8izhMVI2/YW6h9XHomZaOAa0Tz0WZzv+2kt8peRFgjxAfc0SFayKJD8EiRMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711886738; c=relaxed/simple;
	bh=nMUeCIJG7fjqtH/W0O2bIgyUKMdleR2atH1FKkxakl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l37sMh12wc/FGqhDHJeXEK85lmpl+NOAUEsXvZiY2driOFBO6PZDa9dHr0j6wDEUhsWcVujYTuMkPfbdRSEArUCnKL4Twf/BUCx9dkCEGZquzEZfqishgKEsHJp0eQkYjA6fMKInx1pp2yc9IhnXUa9mItUSeHufBFNkS0lqRM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amUNk/EN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amUNk/EN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711886736; x=1743422736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nMUeCIJG7fjqtH/W0O2bIgyUKMdleR2atH1FKkxakl4=;
  b=amUNk/ENahuHVqMAeOjfZAzmm0Cpmf0xKUaFC1+AauZ3BYHZ6yt4MmV+
   /KKc8jOqo+ZiZ5F9pWoarbmCYUreBfW+0Lzy6Qr7qNaa34WIXR8SFU8eZ
   SlRhjJn16osPVf6LpbENMwQQiqhP2x9LvU1tiADR0YuDcLkPeTwTCTv+N
   lyaa3w3RKvxZApALP2QLONgUWgt6aiz/e+W6QpbSwfpi+AmccHFixMF+6
   uizuaiulew2/D+D78lkvqGLk26ySnwP8+pi0QE5ATUTQEE2kh22tKBQYY
   S0BCX5G48qHPZUyjzBf6m2ew5YQsC0xdZO9EESPaImN2F5xiCLV8ROJ8H
   A==;
X-CSE-ConnectionGUID: KT5akG76TnGnWrpKy+WHEQ==
X-CSE-MsgGUID: s2Nphrw1TbuC7L6WOZwb5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="7616475"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="7616475"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 05:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="22134179"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Mar 2024 05:05:25 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqtwB-000150-1E;
	Sun, 31 Mar 2024 12:05:23 +0000
Date: Sun, 31 Mar 2024 20:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Ho-Ren (Jack) Chuang" <horenchuang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [akpm-mm:mm-unstable 262/270] vmscan.c:(.text+0x2c90): multiple
 definition of `mt_find_alloc_memory_type';
 kernel/sched/fair.o:fair.c:(.text+0x1db4): first defined here
Message-ID: <202403311952.oxw8fSed-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   0cef2c0a2a356137b170c3cb46cb9c1dd2ca3e6b
commit: 57fc2afac84efdb0968e028382023a937bb4d6a0 [262/270] memory tier: dax/kmem: introduce an abstract layer for finding, allocating, and putting memory types
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240331/202403311952.oxw8fSed-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403311952.oxw8fSed-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403311952.oxw8fSed-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: mm/vmscan.o: in function `mt_find_alloc_memory_type':
>> vmscan.c:(.text+0x2c90): multiple definition of `mt_find_alloc_memory_type'; kernel/sched/fair.o:fair.c:(.text+0x1db4): first defined here
   or1k-linux-ld: mm/vmscan.o: in function `mt_put_memory_types':
>> vmscan.c:(.text+0x2c98): multiple definition of `mt_put_memory_types'; kernel/sched/fair.o:fair.c:(.text+0x1dbc): first defined here
   or1k-linux-ld: mm/memory.o: in function `mt_find_alloc_memory_type':
   memory.c:(.text+0x1810): multiple definition of `mt_find_alloc_memory_type'; kernel/sched/fair.o:fair.c:(.text+0x1db4): first defined here
   or1k-linux-ld: mm/memory.o: in function `mt_put_memory_types':
   memory.c:(.text+0x1818): multiple definition of `mt_put_memory_types'; kernel/sched/fair.o:fair.c:(.text+0x1dbc): first defined here
   or1k-linux-ld: mm/mprotect.o: in function `mt_find_alloc_memory_type':
   mprotect.c:(.text+0x0): multiple definition of `mt_find_alloc_memory_type'; kernel/sched/fair.o:fair.c:(.text+0x1db4): first defined here
   or1k-linux-ld: mm/mprotect.o: in function `mt_put_memory_types':
   mprotect.c:(.text+0x8): multiple definition of `mt_put_memory_types'; kernel/sched/fair.o:fair.c:(.text+0x1dbc): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
