Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A0CEBC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 02:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0QR1UNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699409254; x=1730945254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S5MBVMdeNVRpt3+iIf2IqFHnCK1RG/LMemeM36AvPL4=;
  b=G0QR1UNT2uK0KLzbBtfusUQpgXdTjzsEazbVqB4JoWI25ThEm94oUGmp
   WMC5gr9+b/8svxhT7AylicPx2YQdtchMMhLsuxrAAUCs2AfCko+j6km3Z
   EyP967S4c5yI+17074aixlBNuPwD9J639xgGO41L8bAGE35vUtmHSissn
   ouRPfDsZ3YgTqEidg90BwkTjQaDPfi8VID/oGSIKjyFBocyeA+x2pWVtB
   tbGQyylRXZm90PFF9gVwElpX4LGWXH44T3ePeXYrOgFznZ5W89ifzlwEa
   XN5IqpbGh7/Q4s+ouLT5aSPY/sj4p9JjWeSpVwCFN1bbU1ic3zx6bcdjJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8322140"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="8322140"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 18:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="906622718"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="906622718"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2023 18:07:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Xya-0007Yy-0T;
	Wed, 08 Nov 2023 02:07:28 +0000
Date: Wed, 8 Nov 2023 10:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 16/19] kernel/sched/debug.c:532:61:
 warning: cast to pointer from integer of different size
Message-ID: <202311080903.vM0R7bj0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   4a97a4d025f6984a0ae7bb2c21ab09a52d4c1c6a
commit: 727da1ee003381aa8f9a21ba534a86e40c0e9b7e [16/19] sched/fair: Fair server interface
config: s390-defconfig (https://download.01.org/0day-ci/archive/20231108/202311080903.vM0R7bj0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080903.vM0R7bj0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080903.vM0R7bj0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:72:
   kernel/sched/debug.c: In function 'debugfs_fair_server_init':
   kernel/sched/debug.c:529:50: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'unsigned int' [-Wformat=]
     529 |                 snprintf(buf, sizeof(buf), "cpu%ld", cpu);
         |                                                ~~^   ~~~
         |                                                  |   |
         |                                                  |   unsigned int
         |                                                  long int
         |                                                %d
>> kernel/sched/debug.c:532:61: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     532 |                 debugfs_create_file("runtime", 0644, d_cpu, (void *) cpu, &fair_server_runtime_fops);
         |                                                             ^
   kernel/sched/debug.c:533:60: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     533 |                 debugfs_create_file("period", 0644, d_cpu, (void *) cpu, &fair_server_period_fops);
         |                                                            ^
   kernel/sched/debug.c:534:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     534 |                 debugfs_create_file("defer", 0644, d_cpu, (void *) cpu, &fair_server_defer_fops);
         |                                                           ^


vim +532 kernel/sched/debug.c

   515	
   516	static void debugfs_fair_server_init(void)
   517	{
   518		struct dentry *d_fair;
   519		unsigned int cpu;
   520	
   521		d_fair = debugfs_create_dir("fair_server", debugfs_sched);
   522		if (!d_fair)
   523			return;
   524	
   525		for_each_possible_cpu(cpu) {
   526			struct dentry *d_cpu;
   527			char buf[32];
   528	
   529			snprintf(buf, sizeof(buf), "cpu%ld", cpu);
   530			d_cpu = debugfs_create_dir(buf, d_fair);
   531	
 > 532			debugfs_create_file("runtime", 0644, d_cpu, (void *) cpu, &fair_server_runtime_fops);
   533			debugfs_create_file("period", 0644, d_cpu, (void *) cpu, &fair_server_period_fops);
   534			debugfs_create_file("defer", 0644, d_cpu, (void *) cpu, &fair_server_defer_fops);
   535		}
   536	}
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
