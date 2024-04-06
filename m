Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4FD18C1F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 22:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712442115; cv=none; b=AMhow8r2SI/tkGtYsQEZ6DKfQqSxoBytU09RnVd9NM3803f53rk7QVmQ/So4vomczFsRYcys9bBHgCRevgs2c2C0gHzO2Z3acIJgFPH6jT8XMGc+Cx0W68iD58tDqCu0JGbA6WV160j7JQlcACsNj4S1asiII43+cmldd1Whzic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712442115; c=relaxed/simple;
	bh=CKPTrmSZewdPAlu7zOHH/lgxcS3DUvFwGosgl/hDtCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fPFu91gi02yksR5RBjoJsz40ptJtozJE4nt/J7JBdkjFujFmf8jOMNYonKEODjbTjdeE+yCwNRKGCxertlcGssN2EUBQ3CZR7FhnF+s7Oh9fH0oXCX8UN2v6h8rQCOH6S51V2rrDZK2MbV0pO/gKvc9Yfr7eOwznSau5RyK6ZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9M6mLtp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9M6mLtp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712442114; x=1743978114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CKPTrmSZewdPAlu7zOHH/lgxcS3DUvFwGosgl/hDtCs=;
  b=M9M6mLtpr7NUyI6e9FfPXHC4fY83bRSLwzx9ka9irZn+3mepcq+bOHXM
   srw7eengcL7vgxD70wo2SnxYUJGaHtHtYQxK7lJBoUWWwO66AQmADTe5K
   XgCGSDMjbmxL3UkXdWl14eYUuyyhNWmHPU+5OyEZxGn1W0wFPlCv7jAko
   IUYpnv5m9vqlw2XR2Fi9i/1HQzZWlkf+/5CJ+EEo6PFpt5zt6C5mLlFro
   riregv5557ZljlfDNiO0GwOOTN6vHD9y/k0RfsCUPPZ+0PuAN6twKR3ro
   Y7cPqrAJfd4GuSq3VPGoQOUYG5VYiv3+qTv+0ULLb4iyHksd194MRqu6N
   A==;
X-CSE-ConnectionGUID: r4NhYOuBTzy9d00irB8gjQ==
X-CSE-MsgGUID: VT/Oi4r9TnafsG20C9+Qxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="25189042"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="25189042"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 15:21:53 -0700
X-CSE-ConnectionGUID: 2/iXd6jcTYW+/UP6vTsjPA==
X-CSE-MsgGUID: mgFcTONXSCqUj5bO3LSu6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="50714069"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Apr 2024 15:21:51 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtEQ0-0003ty-2p;
	Sat, 06 Apr 2024 22:21:48 +0000
Date: Sun, 7 Apr 2024 06:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 8/133] drivers/char/ds1620.c:229:14: error:
 implicit declaration of function 'copy_to_iter_full'; did you mean
 'copy_to_user_nofault'?
Message-ID: <202404070616.atCKLJno-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100
commit: 95def902e3f1dc39d968d2af1be8885ac9f7d54e [8/133] char: convert drivers to use ->read_iter() and ->write_iter()
config: arm-netwinder_defconfig (https://download.01.org/0day-ci/archive/20240407/202404070616.atCKLJno-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070616.atCKLJno-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070616.atCKLJno-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/ds1620.c: In function 'ds1620_read':
>> drivers/char/ds1620.c:229:14: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
     229 |         if (!copy_to_iter_full(&cur_temp_degF, 1, to))
         |              ^~~~~~~~~~~~~~~~~
         |              copy_to_user_nofault
   cc1: some warnings being treated as errors
--
   drivers/char/nwbutton.c: In function 'button_read':
>> drivers/char/nwbutton.c:174:18: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
     174 |         return (!copy_to_iter_full(&button_output_buffer, bcount, to))
         |                  ^~~~~~~~~~~~~~~~~
         |                  copy_to_user_nofault
   cc1: some warnings being treated as errors
--
   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/char/nwflash.c:18:
   drivers/char/nwflash.c: In function 'flash_read':
>> drivers/char/nwflash.c:129:54: error: 'ppos' undeclared (first use in this function)
     129 |                        "buffer=%p, count=0x%zx.\n", *ppos, buf, size);
         |                                                      ^~~~
   include/linux/printk.h:429:33: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/char/nwflash.c:128:17: note: in expansion of macro 'printk'
     128 |                 printk(KERN_DEBUG "flash_read: flash_read: offset=0x%llx, "
         |                 ^~~~~~
   drivers/char/nwflash.c:129:54: note: each undeclared identifier is reported only once for each function it appears in
     129 |                        "buffer=%p, count=0x%zx.\n", *ppos, buf, size);
         |                                                      ^~~~
   include/linux/printk.h:429:33: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/char/nwflash.c:128:17: note: in expansion of macro 'printk'
     128 |                 printk(KERN_DEBUG "flash_read: flash_read: offset=0x%llx, "
         |                 ^~~~~~
>> drivers/char/nwflash.c:129:60: error: 'buf' undeclared (first use in this function)
     129 |                        "buffer=%p, count=0x%zx.\n", *ppos, buf, size);
         |                                                            ^~~
   include/linux/printk.h:429:33: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/char/nwflash.c:128:17: note: in expansion of macro 'printk'
     128 |                 printk(KERN_DEBUG "flash_read: flash_read: offset=0x%llx, "
         |                 ^~~~~~
>> drivers/char/nwflash.c:129:65: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
     129 |                        "buffer=%p, count=0x%zx.\n", *ppos, buf, size);
         |                                                                 ^~~~
   include/linux/printk.h:429:33: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/char/nwflash.c:128:17: note: in expansion of macro 'printk'
     128 |                 printk(KERN_DEBUG "flash_read: flash_read: offset=0x%llx, "
         |                 ^~~~~~


vim +229 drivers/char/ds1620.c

   218	
   219	static ssize_t ds1620_read(struct kiocb *iocb, struct iov_iter *to)
   220	{
   221		signed int cur_temp;
   222		signed char cur_temp_degF;
   223	
   224		cur_temp = cvt_9_to_int(ds1620_in(THERM_READ_TEMP, 9)) >> 1;
   225	
   226		/* convert to Fahrenheit, as per wdt.c */
   227		cur_temp_degF = (cur_temp * 9) / 5 + 32;
   228	
 > 229		if (!copy_to_iter_full(&cur_temp_degF, 1, to))
   230			return -EFAULT;
   231	
   232		return 1;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
