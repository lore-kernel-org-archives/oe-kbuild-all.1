Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C77F328A7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 20:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1oTtnqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696624954; x=1728160954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UViyi8XdqDaf4Zz+Enms3juwPuqKKxUUshyEiDhi8uk=;
  b=N1oTtnqWOVkZe47tELFLx6J/EY8qGEUpPm2N/R9W14/aJvZpAQNrPMZp
   QwhiQQ8qMjm48EV9P4NXQOXiPfKDrtnnbJ94Vc7mwQcnxvKg4kEdf69BT
   rKAzuHSMwl+vciL8EFukm+JLXHDZX1FuNQiA1M6jTicATOTyGAgT7Sd0i
   VDuXJpTpVLTzZTfh3IsCdF5hOxPlhPkO6jD6PAc/ox+aeVo/0gJ+3zcAK
   P3NoyZa9xyWw1C/bLVGpL+NrNEM+SuJodnYfHUliIk33QM1bOfAQBxKTW
   /NZx7qGgjVngLPJdBZLSvBzVTyESt6NvWt1iFlzF0Dv5LJJlYvbTmB60X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="450325200"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="450325200"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 13:42:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="728982579"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="728982579"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Oct 2023 13:42:32 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoreX-0003d7-30;
	Fri, 06 Oct 2023 20:42:29 +0000
Date: Sat, 7 Oct 2023 04:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: ERROR: start_text address is c000000000000900, should be
 c000000000000200
Message-ID: <202310070419.BcA2fDgk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Randy,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af95dc6fdc25e616051d0234aad638e15c02ec8f
commit: 47c258d71ebfc832a760a1dc6540cf3c33968023 powerpc/head_check: use stdout for error messages
date:   2 years, 2 months ago
config: powerpc64-buildonly-randconfig-r003-20211118 (https://download.01.org/0day-ci/archive/20231007/202310070419.BcA2fDgk-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310070419.BcA2fDgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310070419.BcA2fDgk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: start_text address is c000000000000900, should be c000000000000200
   ERROR: try to enable LD_HEAD_STUB_CATCH config option
   ERROR: see comments in arch/powerpc/tools/head_check.sh

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
