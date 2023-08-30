Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0192F5E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 21:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693429993; x=1724965993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JH7ohUdQdu433N6UE7E8bxscEuh3WGvqoZmhawlqOvU=;
  b=UWZLeztOTSJY/E1DHZyNT2i2nNskO3kNP+b39UhLNZAIyoIUvyDKGB42
   tS8TI/fTMAIXgGmJ+qBzg6mgQafc/5WS3RUjvws7KtrpWqKcWKuX5oeTo
   QiyPN7naL6/lsruh50GKFZ8/wtTfPSu0JZHhE4Ir4IbuU36F7mEWrWxNo
   vgsTAHokZNyZh7WGZ+/3E1a5NCvWzu6xcYM2O466sEhQlTJFZ3OsbjEMp
   PPtvYe5GB+UXQuPYEkTlWZ36cuCZqQ0v8i3nMjXcBfiHfU4TB766zYurF
   xWjO8Le7PNTYyC7vZRTKYY9fWwZgjrktzisGVFu9GJlmt3cefoU343n9G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379502598"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="379502598"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 14:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="912972996"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="912972996"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Aug 2023 14:13:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbSUs-000ADx-1f;
	Wed, 30 Aug 2023 21:13:08 +0000
Date: Thu, 31 Aug 2023 05:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctl-next 2/5]
 .vmlinux.export.c:(___ksymtab+proc_read_intvec_ms_jiffies+0x0): undefined
 reference to `proc_read_intvec_ms_jiffies'
Message-ID: <202308310510.kJtglyeE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctl-next
head:   5db649a3f876dee97af2da8462e4314424a04675
commit: c1fbd8045a68e8c121f9459c75bd413b7a16d696 [2/5] sysctl: Split common handlers into read and write operations
config: csky-randconfig-r011-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310510.kJtglyeE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310510.kJtglyeE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310510.kJtglyeE-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: .vmlinux.export.o: in function `__ksymtab_proc_read_intvec_ms_jiffies':
>> .vmlinux.export.c:(___ksymtab+proc_read_intvec_ms_jiffies+0x0): undefined reference to `proc_read_intvec_ms_jiffies'
   csky-linux-ld: .vmlinux.export.o: in function `__ksymtab_proc_write_intvec_ms_jiffies':
>> .vmlinux.export.c:(___ksymtab+proc_write_intvec_ms_jiffies+0x0): undefined reference to `proc_write_intvec_ms_jiffies'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
