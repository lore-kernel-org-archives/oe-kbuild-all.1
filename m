Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D891C2AD13
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722873668; cv=none; b=Ok0fPAeCeqTUqCxcmnoRrW7Ydn54wXcuUYDRfZwA+MCcXOaQagP826AExZizbDGOuldwVAVKkiR/2Vfwg3fj5Pd4/npFCZgmfbCDDPNvwOurLejhXFTaD1eweY9O9a8x7dCzfTtSBfN65mJr3RwVaEghkk5lQqDxzn8QT6LUb74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722873668; c=relaxed/simple;
	bh=oS0AhSyfLSOt5+0HGoacOHrhaDB0I8TuJAv9AyFg/6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oNzXImx24qcRoKVOh3jTDZdYtK9GEE/DxG1JCzXXxKN6EtM+4jdaFxVXGOKC2+Ks9w3G0cMNXXijnpJ7lSg+ESqtBYfTE9lGaBqpwFXAcNUBtfVcd7hD8JzCoMqCD9hKI984rZpM9EzJMsMYLDz2kbRpg8oRdH3hc/QyS2sNsAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H105ry9J; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H105ry9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722873664; x=1754409664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oS0AhSyfLSOt5+0HGoacOHrhaDB0I8TuJAv9AyFg/6I=;
  b=H105ry9Jm7Cc7E2317uAElAt7z9I6mFA8XIoFSL7Jiwosft1UGtMdoFS
   ohMUWWe8/H4Ox36L2QBVzdpyfjfTyNHWABDoTwKIJ2VzXYvB9qso3ak6P
   Jd5Nf5TBW4FiszSn4fAaijRIpF2GceOx6bvK33gYXJiD588YnXb9vNc8/
   xEAmPAw/hw6wzYrAcF1KC+KUFjQ45hZkOiDvGz7uOA9oF/Wx4W0uxbDfl
   BGOtcI/McffnDr+rkWEp+5Kn43jBhBDC6rtV0ATP+FxHZOvikyrmeLBX5
   mOlD3rjPvIYWhjYSW3a2eFI6mRpNgKbFKsXuQAHlaB1vTixuJLBqbg3lq
   A==;
X-CSE-ConnectionGUID: zxAJGgcaQQ2mtjUM54NMsQ==
X-CSE-MsgGUID: uLHclufgS8e9UdiNKy4gEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20522556"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="20522556"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 09:01:03 -0700
X-CSE-ConnectionGUID: f8tlAWj7R3++AU3jAgZIVg==
X-CSE-MsgGUID: NcPpScF+SsezTrAuK6e44w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="56150213"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Aug 2024 09:01:02 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb08m-00032M-2V;
	Mon, 05 Aug 2024 16:00:57 +0000
Date: Mon, 5 Aug 2024 23:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 337/442] drivers/parisc/eisa_eeprom.c:39:59:
 error: 'ppos' undeclared
Message-ID: <202408052359.L8XHtB9r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   51036f9719aad90aa0e0ca1aa9443e6ce79c0fd2
commit: 480f312d58a8b130b13da96d6c9801f6e7be6db7 [337/442] parisc: eisa_eeprom: convert to read/write iterators
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240805/202408052359.L8XHtB9r-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408052359.L8XHtB9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408052359.L8XHtB9r-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/parisc/eisa_eeprom.c: In function 'eisa_eeprom_read':
>> drivers/parisc/eisa_eeprom.c:39:59: error: 'ppos' undeclared (first use in this function)
      39 |                         tmp[i] = readb(eisa_eeprom_addr+(*ppos)++);
         |                                                           ^~~~
   drivers/parisc/eisa_eeprom.c:39:59: note: each undeclared identifier is reported only once for each function it appears in


vim +/ppos +39 drivers/parisc/eisa_eeprom.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  24  
480f312d58a8b13 Jens Axboe     2024-04-09  25  static ssize_t eisa_eeprom_read(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f415 Linus Torvalds 2005-04-16  26  {
480f312d58a8b13 Jens Axboe     2024-04-09  27  	size_t count = iov_iter_count(to);
^1da177e4c3f415 Linus Torvalds 2005-04-16  28  	unsigned char *tmp;
^1da177e4c3f415 Linus Torvalds 2005-04-16  29  	ssize_t ret;
^1da177e4c3f415 Linus Torvalds 2005-04-16  30  	int i;
^1da177e4c3f415 Linus Torvalds 2005-04-16  31  	
480f312d58a8b13 Jens Axboe     2024-04-09  32  	if (iocb->ki_pos < 0 || iocb->ki_pos >= HPEE_MAX_LENGTH)
^1da177e4c3f415 Linus Torvalds 2005-04-16  33  		return 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  34  	
480f312d58a8b13 Jens Axboe     2024-04-09  35  	count = iocb->ki_pos + count < HPEE_MAX_LENGTH ? count : HPEE_MAX_LENGTH - iocb->ki_pos;
^1da177e4c3f415 Linus Torvalds 2005-04-16  36  	tmp = kmalloc(count, GFP_KERNEL);
^1da177e4c3f415 Linus Torvalds 2005-04-16  37  	if (tmp) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  38  		for (i = 0; i < count; i++)
^1da177e4c3f415 Linus Torvalds 2005-04-16 @39  			tmp[i] = readb(eisa_eeprom_addr+(*ppos)++);
^1da177e4c3f415 Linus Torvalds 2005-04-16  40  
480f312d58a8b13 Jens Axboe     2024-04-09  41  		if (!copy_to_iter_full(tmp, count, to))
^1da177e4c3f415 Linus Torvalds 2005-04-16  42  			ret = -EFAULT;
^1da177e4c3f415 Linus Torvalds 2005-04-16  43  		else
^1da177e4c3f415 Linus Torvalds 2005-04-16  44  			ret = count;
^1da177e4c3f415 Linus Torvalds 2005-04-16  45  		kfree (tmp);
^1da177e4c3f415 Linus Torvalds 2005-04-16  46  	} else
^1da177e4c3f415 Linus Torvalds 2005-04-16  47  		ret = -ENOMEM;
^1da177e4c3f415 Linus Torvalds 2005-04-16  48  	
^1da177e4c3f415 Linus Torvalds 2005-04-16  49  	return ret;
^1da177e4c3f415 Linus Torvalds 2005-04-16  50  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  51  

:::::: The code at line 39 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
