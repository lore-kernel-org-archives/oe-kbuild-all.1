Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D6A52F60
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709630025; cv=none; b=pu4GxGCOT3MenbRmaVyZ0K0n3CChOw3aRt0XKTc2tyyNqPsMhRoo62kWwhbwKWyu6WxBC9Cf1h6bNu2eEzbJPMjFJNWH3ml6MML8BLKhMjaUJhBCC2rc0KNaBGQZm3IU29EXs07Cza7FU/ETWzSImq54aFgrfMZFl+NvwN5MTDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709630025; c=relaxed/simple;
	bh=qEAz4ySoeJQP9PKXYq12gja5A3U8B0KJE0PjrRY1bbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1CoNMYV87VpCYgfsj+1gYb8uTYDnFXWZqu3kD/OTdJ9rEgTWWN79E79PgMXcbqZc85MdWFZeeIsy8euQhMk9lNeFqrZx5ESmCw7KUvaiC1WtkOerHfIVYzVFW/Tl8BQCddxqxrJvNdBmrr5NpAZIVMQogaOspmHFE0qobM3p7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVLq3GcV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVLq3GcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709630024; x=1741166024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qEAz4ySoeJQP9PKXYq12gja5A3U8B0KJE0PjrRY1bbU=;
  b=kVLq3GcVXdsFFEOuK49bZJKYxhrBCHFgHwnQKhbDA8nOso9QAV6js8Kj
   yQ/T3KdmAtjC34INhNUMzHKT07xkqWmyEfTHhK8KFerEPnON8WOY378/4
   /MpnRSlTMWk5CKxrRU3thxDI0kfubBk2rUeOm35BVFYQ21+mCqPNCRDsn
   woixJpxcq4Po8TdiB1ZbogWUWGx0fGHKB29ryNFmOSPEnvFMFQNZpQ3AU
   gsUWfMu0FBiynSAjKPqkhITR1WNIEGAk3MdknKRIWLAM75MQa30J2lf1Z
   G37VHTTi5gfur1jSS3l5zm1OOrutaUS7vmOpU/DSA1ukrh+/D9yees4cr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4028137"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4028137"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:13:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9888995"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2024 01:13:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhQrh-0003Aw-0J;
	Tue, 05 Mar 2024 09:13:37 +0000
Date: Tue, 5 Mar 2024 17:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 39/41] drivers/char/aaa.c:91:26: warning:
 conversion from 'long long unsigned int' to 'dma_addr_t' {aka 'unsigned
 int'} changes value from '18374686479671623680' to '0'
Message-ID: <202403051739.yKCeGHR4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   ae68847cb7b2931e05cac969d0920beb7f40e7dc
commit: 286881ea887dedf90cd8b3c94c802e9e4d1fee72 [39/41] kfifo tester
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240305/202403051739.yKCeGHR4-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051739.yKCeGHR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051739.yKCeGHR4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/aaa.c: In function 'dump_fifo':
>> drivers/char/aaa.c:91:26: warning: conversion from 'long long unsigned int' to 'dma_addr_t' {aka 'unsigned int'} changes value from '18374686479671623680' to '0' [-Woverflow]
      91 |         dma_addr_t dma = 0xffULL << (64 - 8);
         |                          ^~~~~~~
   In file included from include/linux/kernel.h:31,
                    from include/linux/kfifo.h:39,
                    from drivers/char/aaa.c:2:
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:542:9: note: in expansion of macro 'printk'
     542 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:24:25: note: in expansion of macro 'KERN_SOH'
      24 | #define KERN_CONT       KERN_SOH "c"
         |                         ^~~~~~~~
   include/linux/printk.h:542:16: note: in expansion of macro 'KERN_CONT'
     542 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                ^~~~~~~~~
   drivers/char/aaa.c:110:17: note: in expansion of macro 'pr_cont'
     110 |                 pr_cont(" %u.v=%px %u.d=%.16llx %u.l=%u",
         |                 ^~~~~~~


vim +91 drivers/char/aaa.c

    87	
    88	static void dump_fifo(void)
    89	{
    90		struct scatterlist sg[4] = {};
  > 91		dma_addr_t dma = 0xffULL << (64 - 8);
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
   104			page_address(virt_to_page(fifo.kfifo.data)) +
   105			offset_in_page(fifo.kfifo.data),
   106			&dma);
   107	
   108		pr_info("\t");
   109		for (unsigned i = 0; i < n; i++) {
   110			pr_cont(" %u.v=%px %u.d=%.16llx %u.l=%u",
   111				i, sg_virt(&sg[i]),// - fifo.kfifo.data,
   112				i, sg_dma_address(&sg[i]),
   113				i, sg_dma_len(&sg[i]));
   114		}
   115		pr_cont("\n");
   116	
   117		mutex_unlock(&my_mutex);
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
