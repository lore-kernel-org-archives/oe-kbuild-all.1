Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176603D82
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 11:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695123556; x=1726659556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n2XIYHz3Pk09kB6qNQKww3+ZoyliAvRmfvxKtl6CqkQ=;
  b=FgOFqJDQlCR1Jq7oh0wKlwm74VOxdJD/nKy03jaO6WWUji54Xqy+pHz2
   EeceqduFTuPOZSz8zZ/3ScIerjTy/sJ3KnL9nUVwLIBxlNW55EyJHLTvc
   a/1AtNXPS3LzfSozIotdsnA51/d0MtwvTq/m9a/xQvKv9vAo1ryaY9iJ1
   qg5DwT65o+8fFZent5UuMzn4z1MA6MWnsBufDHLjCuZIpAuh5Md2F3qI/
   WnKjNt4HadSNjS6KCjs9qqsAxRfv0vsq3yDBhJJk/czMarOCaiLinoQ4o
   JFNM7DThw8ok4P77jjarAkR9jRjqcRcbyh0c2eGkfpsJdvdphlk/nz4OQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="378812050"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="378812050"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="836402086"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="836402086"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2023 04:39:13 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiZ4R-0007IS-20;
	Tue, 19 Sep 2023 11:39:11 +0000
Date: Tue, 19 Sep 2023 19:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5187/6333] arch/m68k/include/asm/string.h:53:25:
 warning: '__builtin_memcpy' offset [0, 2] is out of the bounds [0, 0]
Message-ID: <202309191933.2FJx5yys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   29e400e3ea486bf942b214769fc9778098114113
commit: 0e2bdaccb10a440a7a451343e8347d29a874b58e [5187/6333] Bluetooth: hci_core: Fix build warnings
config: m68k-buildonly-randconfig-r002-20210930 (https://download.01.org/0day-ci/archive/20230919/202309191933.2FJx5yys-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191933.2FJx5yys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309191933.2FJx5yys-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/poll.h:8,
                    from include/net/bluetooth/bluetooth.h:29,
                    from net/bluetooth/hci_event.c:30:
   In function 'hci_cc_read_class_of_dev',
       inlined from 'hci_cc_read_class_of_dev' at net/bluetooth/hci_event.c:511:11:
>> arch/m68k/include/asm/string.h:53:25: warning: '__builtin_memcpy' offset [0, 2] is out of the bounds [0, 0] [-Warray-bounds]
      53 | #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_event.c:521:9: note: in expansion of macro 'memcpy'
     521 |         memcpy(hdev->dev_class, rp->dev_class, 3);
         |         ^~~~~~


vim +/__builtin_memcpy +53 arch/m68k/include/asm/string.h

ea61bc461d09e8 Greg Ungerer 2010-09-07  50  
ea61bc461d09e8 Greg Ungerer 2010-09-07  51  #define __HAVE_ARCH_MEMCPY
ea61bc461d09e8 Greg Ungerer 2010-09-07  52  extern void *memcpy(void *, const void *, __kernel_size_t);
ea61bc461d09e8 Greg Ungerer 2010-09-07 @53  #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
ea61bc461d09e8 Greg Ungerer 2010-09-07  54  

:::::: The code at line 53 was first introduced by commit
:::::: ea61bc461d09e8d331a307916530aaae808c72a2 m68k/m68knommu: merge MMU and non-MMU string.h

:::::: TO: Greg Ungerer <gerg@snapgear.com>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
