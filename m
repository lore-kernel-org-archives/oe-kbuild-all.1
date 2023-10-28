Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2E1639
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 01:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A07pJrQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698456486; x=1729992486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+8jjN+DzQPK2vF1ZQbhRYdKfdjEYR8FqzuqSJ9DyVI=;
  b=A07pJrQBp6AVJbYRsgFNoi1COc4hIzSNed5c9T8BxOP6HNsz7ZAWnpZV
   8HnazZ24oYvr2Ss+RGpzcfFn05tIFg10pQwqQ2IfmMh1q6cqZRbrI7oCn
   Ar/nl7dHw2VhrwWF/LzlZNTohHaHHm5SiGGQYC30yMbW5gIieYieksj1l
   4UQo7wBmJJfWA7ZPN2LoY/8+DWjL91DpcF9des6LHvxWCFqaWpETaVVy6
   Qx1pvLgGrZPJeoIqklj+KPod6Zg3P2dp8by+6JBfLu8FoHaMvmKNoDbDn
   8KfMoTAno2aJrAHoCLd4D99j3qhP4KwssHu1dgNFK6HwZ3+rF6CdAPZ/S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="368089593"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="368089593"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 18:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="759761979"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="759761979"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Oct 2023 18:28:03 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwY7N-000BMW-1I;
	Sat, 28 Oct 2023 01:28:01 +0000
Date: Sat, 28 Oct 2023 09:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/meminfo/v2.1 1/1] meminfo.c:undefined reference to
 `mem_fill_meminfo'
Message-ID: <202310280954.IzTXWu8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/meminfo/v2.1
head:   74f700c787da4ba3818c90e1b0a93a0b597dfa5c
commit: 74f700c787da4ba3818c90e1b0a93a0b597dfa5c [1/1] proc: Implement /proc/self/meminfo
config: arc-randconfig-002-20231028 (https://download.01.org/0day-ci/archive/20231028/202310280954.IzTXWu8s-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310280954.IzTXWu8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310280954.IzTXWu8s-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: fs/proc/meminfo.o: in function `proc_meminfo_show':
>> meminfo.c:(.text+0x858): undefined reference to `mem_fill_meminfo'
>> arc-elf-ld: meminfo.c:(.text+0x858): undefined reference to `mem_fill_meminfo'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
