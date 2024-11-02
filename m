Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE8A14AD20
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730538210; cv=none; b=MXTpAsO6iyzv+2CP/niTMSQ4L04AqSkWE6ZY7saU9y+k9JhIWg2B+/VkXn0KxtpHvnNSQ005+Z0s/DbixEyDGRswhJPzgGng3baG+9ocwi+FBINVJGsiVx9vOhQhk3DGwnV7QX9QB2EL/jwbhr85DfdXb9Mrj5tcjyzpxD+0ScQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730538210; c=relaxed/simple;
	bh=q0MqyUyyDnLgreiK6xME3ojAn4W0COLGxtJCSuATL+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jC/wzRRgdF7gl3oYjTJ5fvlth2WnHcwLA/Y3i+KMYY+sbj0pFxMhwJXUKaPbBYuIDrvU+wAItAHClpKkJNQpcWm1zAmIlQem31SCZf53X2sqqncedn0auYDVu/PTrqwNNgdLiiqhsxPycApBrXIqxRqy6sCi8fKsS++WNjYFzJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itOUSpl4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itOUSpl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730538209; x=1762074209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q0MqyUyyDnLgreiK6xME3ojAn4W0COLGxtJCSuATL+s=;
  b=itOUSpl4GTsLv+kja/wKBf9SyATAbvUwqeNWyeIMcvU77fiuiNxzYLdE
   FN5Gg/2pVr/evqHi/mRSkSf/g/631Jp7d0YGb/L9oxo13LAlYCgKAA0Hh
   lzn64C+IUfE8sGvTRlHLp26jl0rBNubLv+51FdFG1G7VnxJ03QgfQXgox
   a02PoQbLyxyC1KzB48AhGD0gRx9zxRbrN2dn3qcBoUGIoQyMmkXqWtBJb
   2fc+SREM7eifEWGHrCNzHlRa7opymZjAJZj7VBG8avApm+zReAfk/6Znu
   GjML+AK33+yYPGf4Z+tVtym1mP64fQVcxwAY5A8KP5KhGHM/LGzqOlQqZ
   g==;
X-CSE-ConnectionGUID: xckMLzJ2TJ6T6UMaZlC6yw==
X-CSE-MsgGUID: X67qore/SdCA4Ci49ncd3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30253239"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30253239"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 02:03:26 -0700
X-CSE-ConnectionGUID: CqEvzts0SumeF5BUxM17ag==
X-CSE-MsgGUID: hkGIe7eHThSRwnEjNr4G5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="83529946"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Nov 2024 02:03:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7A2U-000id7-2N;
	Sat, 02 Nov 2024 09:03:22 +0000
Date: Sat, 2 Nov 2024 17:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 21/28] drivers/char/aaa.c:90:28: error: array type
 has incomplete element type 'struct scatterlist'
Message-ID: <202411021655.3Nfrreyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   8a4f2c71acf243e19ca2de60aab89a6bdf7cf66c
commit: b1eb0844bab3ef8e30c18b6b4469089070c713aa [21/28] kfifo tester
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241102/202411021655.3Nfrreyk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021655.3Nfrreyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021655.3Nfrreyk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/char/aaa.c: In function 'dump_fifo':
>> drivers/char/aaa.c:90:28: error: array type has incomplete element type 'struct scatterlist'
      90 |         struct scatterlist sg[4] = {};
         |                            ^~
   In file included from drivers/char/aaa.c:2:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/kfifo.h:790:24: note: in definition of macro 'kfifo_dma_out_prepare_mapped'
     790 |         int __nents = (nents); \
         |                        ^~~~~
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/char/aaa.c:97:53: note: in expansion of macro 'ARRAY_SIZE'
      97 |         n = kfifo_dma_out_prepare_mapped(&fifo, sg, ARRAY_SIZE(sg), FIFO_SIZE,
         |                                                     ^~~~~~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/spinlock.h:60,
                    from include/linux/kfifo.h:40:
>> drivers/char/aaa.c:104:17: error: implicit declaration of function 'page_address'; did you mean 'pbe_address'? [-Werror=implicit-function-declaration]
     104 |                 page_address(virt_to_page(fifo.kfifo.data)) +
         |                 ^~~~~~~~~~~~
   include/linux/printk.h:462:33: note: in definition of macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:563:9: note: in expansion of macro 'printk'
     563 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/char/aaa.c:100:9: note: in expansion of macro 'pr_info'
     100 |         pr_info("%s: in=%4u out=%4u len=%4u avail=%4u sgs=%u data=0x%px(0x%px) dma=%pad\n",
         |         ^~~~~~~
>> drivers/char/aaa.c:105:17: error: implicit declaration of function 'offset_in_page' [-Werror=implicit-function-declaration]
     105 |                 offset_in_page(fifo.kfifo.data),
         |                 ^~~~~~~~~~~~~~
   include/linux/printk.h:462:33: note: in definition of macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:563:9: note: in expansion of macro 'printk'
     563 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/char/aaa.c:100:9: note: in expansion of macro 'pr_info'
     100 |         pr_info("%s: in=%4u out=%4u len=%4u avail=%4u sgs=%u data=0x%px(0x%px) dma=%pad\n",
         |         ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%p' expects argument of type 'void *', but argument 9 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:462:25: note: in definition of macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:563:9: note: in expansion of macro 'printk'
     563 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:563:16: note: in expansion of macro 'KERN_INFO'
     563 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/char/aaa.c:100:9: note: in expansion of macro 'pr_info'
     100 |         pr_info("%s: in=%4u out=%4u len=%4u avail=%4u sgs=%u data=0x%px(0x%px) dma=%pad\n",
         |         ^~~~~~~
>> drivers/char/aaa.c:111:28: error: implicit declaration of function 'sg_virt' [-Werror=implicit-function-declaration]
     111 |                         i, sg_virt(&sg[i]),// - fifo.kfifo.data,
         |                            ^~~~~~~
   include/linux/printk.h:462:33: note: in definition of macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:575:9: note: in expansion of macro 'printk'
     575 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   drivers/char/aaa.c:110:17: note: in expansion of macro 'pr_cont'
     110 |                 pr_cont(" %u.v=%px %u.d=%.16llx %u.l=%u",
         |                 ^~~~~~~
>> drivers/char/aaa.c:112:48: error: implicit declaration of function 'sg_dma_address' [-Werror=implicit-function-declaration]
     112 |                         i, (unsigned long long)sg_dma_address(&sg[i]),
         |                                                ^~~~~~~~~~~~~~
   include/linux/printk.h:462:33: note: in definition of macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:575:9: note: in expansion of macro 'printk'
     575 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   drivers/char/aaa.c:110:17: note: in expansion of macro 'pr_cont'
     110 |                 pr_cont(" %u.v=%px %u.d=%.16llx %u.l=%u",
         |                 ^~~~~~~
>> drivers/char/aaa.c:113:28: error: implicit declaration of function 'sg_dma_len'; did you mean 'msg_data_left'? [-Werror=implicit-function-declaration]
     113 |                         i, sg_dma_len(&sg[i]));
         |                            ^~~~~~~~~~
   include/linux/printk.h:462:33: note: in definition of macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:575:9: note: in expansion of macro 'printk'
     575 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   drivers/char/aaa.c:110:17: note: in expansion of macro 'pr_cont'
     110 |                 pr_cont(" %u.v=%px %u.d=%.16llx %u.l=%u",
         |                 ^~~~~~~
>> drivers/char/aaa.c:90:28: warning: unused variable 'sg' [-Wunused-variable]
      90 |         struct scatterlist sg[4] = {};
         |                            ^~
   cc1: some warnings being treated as errors


vim +90 drivers/char/aaa.c

    87	
    88	static void dump_fifo(void)
    89	{
  > 90		struct scatterlist sg[4] = {};
    91		dma_addr_t dma = 0xffUL << (32 - 8);
    92		unsigned int n;
    93	
    94		if (mutex_lock_interruptible(&my_mutex))
    95			return;
    96	
    97		n = kfifo_dma_out_prepare_mapped(&fifo, sg, ARRAY_SIZE(sg), FIFO_SIZE,
    98						 dma);
    99	
   100		pr_info("%s: in=%4u out=%4u len=%4u avail=%4u sgs=%u data=0x%px(0x%px) dma=%pad\n",
   101			__func__,
   102			ms(fifo.kfifo.in), ms(fifo.kfifo.out),
   103			kfifo_len(&fifo), kfifo_avail(&fifo), n, fifo.kfifo.data,
 > 104			page_address(virt_to_page(fifo.kfifo.data)) +
 > 105			offset_in_page(fifo.kfifo.data),
   106			&dma);
   107	
   108		pr_info("\t");
   109		for (unsigned i = 0; i < n; i++) {
   110			pr_cont(" %u.v=%px %u.d=%.16llx %u.l=%u",
 > 111				i, sg_virt(&sg[i]),// - fifo.kfifo.data,
 > 112				i, (unsigned long long)sg_dma_address(&sg[i]),
 > 113				i, sg_dma_len(&sg[i]));
   114		}
   115		pr_cont("\n");
   116	
   117		mutex_unlock(&my_mutex);
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
