Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0302BB16
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709401500; cv=none; b=LLfZ2OkgQIBxdMObarJkRem9aWshC0qe0IAmNza16C8z7QrHUi0ZbEaPP3kiPfqzlxIZQRVPNqUMhYNOHQNCGROwX2s7j6nFCyYRnX5CnKMaoRztRAeAjUtF9vhwI+m5QaSGhV8aRmvV0Yvue6VVGNikjTVoY3z5h62wtwry24U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709401500; c=relaxed/simple;
	bh=WYYcjTvjs5nBPICUw5XVvn4LOf9X+ASY0Bz3Bx+xuhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TPpjvfQdTaEg1VtCbdefAgrPkTTpHGg3eWuM+iwyFiymMlQ307APwK4pB1HFprUFYdVcu3qcj7tq/YM1LvJNKzgKI4ClNLktsoWbKaR72ZZ2oEYNlMkO8oL5Wji+BqtETAC8NaH1ge5zTqDS5mTeGUtZREZ4UVa5pw7ujVIB+FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcclhjXB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcclhjXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709401498; x=1740937498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WYYcjTvjs5nBPICUw5XVvn4LOf9X+ASY0Bz3Bx+xuhY=;
  b=PcclhjXB+Gj8/mMpXwiuGv/BnMKjw09Mi/qiusDh5ueRATozrUkv8mT2
   NrCvpSr0OrFY/4WNJbNzOIHtbUV8TjOgzrm9fH0WqskPjYEBxPc+7fmy3
   ww3AMI/U50OUglc00hd4GVUVh7glMByaYjdyzFFUDD/n+Qqc29A5n8yAH
   foB90uVweNVT4aiRMK76W7yxUHr4U0Bh6nkp7R5zih3uMBhuCpvz87eZA
   gggG8HhCc5xrKpo3NmDLluTY6Tl+gbfRmLN0mEvF71q2BB6ictYFN7WDc
   SpsBodHlDtvaISpmMNozMZD8HsI0LteiG1F/fcapAvQY0jXklczAzQd71
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3863035"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="3863035"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 09:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="13208122"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Mar 2024 09:44:56 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgTPp-0000Bw-0z;
	Sat, 02 Mar 2024 17:44:53 +0000
Date: Sun, 3 Mar 2024 01:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11242/11394]
 arch/riscv/include/asm/pgtable.h:443:41: error: implicit declaration of
 function 'napot_cont_size'
Message-ID: <202403030137.l7lx0vQ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1870cdc0e8dee32e3c221704a2977898ba4c10e8
commit: 224eb81771e34595a6472772514b36ff8c3ec9a0 [11242/11394] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
config: riscv-randconfig-r003-20230430 (https://download.01.org/0day-ci/archive/20240303/202403030137.l7lx0vQ2-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030137.l7lx0vQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030137.l7lx0vQ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/uaccess.h:12,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from kernel/events/core.c:11:
   kernel/events/core.c: In function 'perf_get_pgtable_size':
>> arch/riscv/include/asm/pgtable.h:443:41: error: implicit declaration of function 'napot_cont_size' [-Werror=implicit-function-declaration]
     443 |                                         napot_cont_size(napot_cont_order(pte)) :\
         |                                         ^~~~~~~~~~~~~~~
   kernel/events/core.c:7588:24: note: in expansion of macro 'pte_leaf_size'
    7588 |                 size = pte_leaf_size(pte);
         |                        ^~~~~~~~~~~~~
>> arch/riscv/include/asm/pgtable.h:443:57: error: implicit declaration of function 'napot_cont_order'; did you mean 'get_count_order'? [-Werror=implicit-function-declaration]
     443 |                                         napot_cont_size(napot_cont_order(pte)) :\
         |                                                         ^~~~~~~~~~~~~~~~
   kernel/events/core.c:7588:24: note: in expansion of macro 'pte_leaf_size'
    7588 |                 size = pte_leaf_size(pte);
         |                        ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/napot_cont_size +443 arch/riscv/include/asm/pgtable.h

9e953cda5cdf1c Alexandre Ghiti 2019-05-26  441  
e0fe5ab4192c17 Alexandre Ghiti 2024-02-27  442  #define pte_leaf_size(pte)	(pte_napot(pte) ?				\
e0fe5ab4192c17 Alexandre Ghiti 2024-02-27 @443  					napot_cont_size(napot_cont_order(pte)) :\
e0fe5ab4192c17 Alexandre Ghiti 2024-02-27  444  					PAGE_SIZE)
e0fe5ab4192c17 Alexandre Ghiti 2024-02-27  445  

:::::: The code at line 443 was first introduced by commit
:::::: e0fe5ab4192c171c111976dbe90bbd37d3976be0 riscv: Fix pte_leaf_size() for NAPOT

:::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
