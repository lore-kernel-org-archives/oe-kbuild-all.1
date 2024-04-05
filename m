Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E74536D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 00:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712275579; cv=none; b=SB4/Jc+xUJuBZNw5i7LDWWZJTrMMiUyAoSJ3MMB7QroFCUfZqhvRa2IPkX0io8IEKD0pWu4iTW9kE2Rz69O9EVTn0VNhtYgww0t8jRpj1K6SICqvPLYTIbYRvBvhpqF1CdAY/FW6JK3b4luGZicDrQdCjcTp+x13KJw6RNA+vhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712275579; c=relaxed/simple;
	bh=xbt5Lv3T6u8wrWI4QSi1TKwwPE7KdsIqwfn8HDreV94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LjeOQzQr4vWZYZ8lgYdIKiipSCMWDoSAK4IWScusEubT5SzLv8BBI3Vm6Dp7V4DvhJrgIiomqliPSpWxqMkpgsnDiUK1BP6VojCk1a7F0zzmwfIYvXoMxQXcgpPuEetl38pX/x9HfrJwUqQd6ChRPB31qY257r1Otanx6QjsILA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXfwUeeR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXfwUeeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712275578; x=1743811578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xbt5Lv3T6u8wrWI4QSi1TKwwPE7KdsIqwfn8HDreV94=;
  b=ZXfwUeeReAjJnTvX8UefhlEhK0JBn7ejaOLwXYMIsVmb8/ZQjgYlrUdh
   Ntlw8zI8M6fH1UlFWkJMLeJgaiim8aAeSwRH3gfUm/Hu9SUQAA9iW+qqu
   1Gd8/JK8+jhY+QThGQhppeQiQQ9AOL5SBGmDA9aVC4Gsuceysy59+8shS
   0hCsy8W6ADnIU18SxlzeusZjZ2vRkwnI3BHIJ4IScEq9nPeu/LmYxDRxm
   Ec6GA3u0h1yJDOmRRPBGwdkTOrHXMUCn4v/VNRW29MUpiSaIQSrLarEG7
   HGRrx7GCvoN0ecbx9Pd5jaQxHMSPc1MLa4kZwCGXdrFXfv12QxgLCrXk1
   w==;
X-CSE-ConnectionGUID: UICb+++ASwqSnqx33yFMew==
X-CSE-MsgGUID: 19+BvCS9RuuoYZ4N2YfCLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11389544"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="11389544"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 17:06:17 -0700
X-CSE-ConnectionGUID: kx9zgsCvR4edGTfmR0s8SA==
X-CSE-MsgGUID: 5nIbEAfCTJq6J+tl+VRcJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18927716"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Apr 2024 17:06:17 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsX5y-0001eU-0A;
	Fri, 05 Apr 2024 00:06:14 +0000
Date: Fri, 5 Apr 2024 08:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 24/28] lib/xz/xz_dec_test.c:125:30: error:
 implicit declaration of function 'copy_from_iter_full'; did you mean
 'copy_from_user_nofault'?
Message-ID: <202404050815.nYimD9IM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   34a49de340a534b0cb222309e73d1ef215ff4db6
commit: 46c473d84f35c495739937049bf536474f25938f [24/28] lib: convert to read/write iterators
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050815.nYimD9IM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050815.nYimD9IM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050815.nYimD9IM-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/xz/xz_dec_test.c: In function 'xz_dec_test_write':
   lib/xz/xz_dec_test.c:104:23: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     104 |         size_t size = iov_iter_count(from);
         |                       ^~~~~~~~~~~~~~
>> lib/xz/xz_dec_test.c:125:30: error: implicit declaration of function 'copy_from_iter_full'; did you mean 'copy_from_user_nofault'? [-Werror=implicit-function-declaration]
     125 |                         if (!copy_from_iter_full(buffer_in, buffers.in_size, from))
         |                              ^~~~~~~~~~~~~~~~~~~
         |                              copy_from_user_nofault
   cc1: some warnings being treated as errors


vim +125 lib/xz/xz_dec_test.c

    93	
    94	/*
    95	 * Decode the data given to us from the userspace. CRC32 of the uncompressed
    96	 * data is calculated and is printed at the end of successful decoding. The
    97	 * uncompressed data isn't stored anywhere for further use.
    98	 *
    99	 * The .xz file must have exactly one Stream and no Stream Padding. The data
   100	 * after the first Stream is considered to be garbage.
   101	 */
   102	static ssize_t xz_dec_test_write(struct kiocb *iocb, struct iov_iter *from)
   103	{
 > 104		size_t size = iov_iter_count(from);
   105		size_t remaining;
   106	
   107		if (ret != XZ_OK) {
   108			if (size > 0)
   109				printk(KERN_INFO DEVICE_NAME ": %zu bytes of "
   110						"garbage at the end of the file\n",
   111						size);
   112	
   113			return -ENOSPC;
   114		}
   115	
   116		printk(KERN_INFO DEVICE_NAME ": decoding %zu bytes of input\n",
   117				size);
   118	
   119		remaining = size;
   120		while ((remaining > 0 || buffers.out_pos == buffers.out_size)
   121				&& ret == XZ_OK) {
   122			if (buffers.in_pos == buffers.in_size) {
   123				buffers.in_pos = 0;
   124				buffers.in_size = min(remaining, sizeof(buffer_in));
 > 125				if (!copy_from_iter_full(buffer_in, buffers.in_size, from))
   126					return -EFAULT;
   127	
   128				remaining -= buffers.in_size;
   129			}
   130	
   131			buffers.out_pos = 0;
   132			ret = xz_dec_run(state, &buffers);
   133			crc = crc32(crc, buffer_out, buffers.out_pos);
   134		}
   135	
   136		switch (ret) {
   137		case XZ_OK:
   138			printk(KERN_INFO DEVICE_NAME ": XZ_OK\n");
   139			return size;
   140	
   141		case XZ_STREAM_END:
   142			printk(KERN_INFO DEVICE_NAME ": XZ_STREAM_END, "
   143					"CRC32 = 0x%08X\n", ~crc);
   144			return size - remaining - (buffers.in_size - buffers.in_pos);
   145	
   146		case XZ_MEMLIMIT_ERROR:
   147			printk(KERN_INFO DEVICE_NAME ": XZ_MEMLIMIT_ERROR\n");
   148			break;
   149	
   150		case XZ_FORMAT_ERROR:
   151			printk(KERN_INFO DEVICE_NAME ": XZ_FORMAT_ERROR\n");
   152			break;
   153	
   154		case XZ_OPTIONS_ERROR:
   155			printk(KERN_INFO DEVICE_NAME ": XZ_OPTIONS_ERROR\n");
   156			break;
   157	
   158		case XZ_DATA_ERROR:
   159			printk(KERN_INFO DEVICE_NAME ": XZ_DATA_ERROR\n");
   160			break;
   161	
   162		case XZ_BUF_ERROR:
   163			printk(KERN_INFO DEVICE_NAME ": XZ_BUF_ERROR\n");
   164			break;
   165	
   166		default:
   167			printk(KERN_INFO DEVICE_NAME ": Bug detected!\n");
   168			break;
   169		}
   170	
   171		return -EIO;
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
