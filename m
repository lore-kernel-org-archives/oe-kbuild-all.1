Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A35518E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 00:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712620930; cv=none; b=t+VRrnJ7DbgMlUthUkWx6qxSaohCMnO6TOPthnS07OU+8HHaO01vh0ds5pclu4Qe7TAMmRD11WOEqsf8Iv6pd8FRVQCSRFx1QVjP5MVAO0NMj0ER2/+hDyaDjMclCc0TGRJgBUdXpcQwWUs0A9LMVytdj3O0sFX0qveUkdq7uSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712620930; c=relaxed/simple;
	bh=/jU3pwfNGBhdPc7POkfTjspxoZkntWBFGvRNcaXrPls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F7fpGjNXHDQSIPG055dE46kvZ00rt76ilfTBm8greksIySdD0JzVDV6rx0MUs+iM6lnQxv8P0cpygY+PAZ2LhgCsHelF5y1bz8zw0XeDNksObk+A5R4OXlLxg4G4Yqv6e2HoBT0O4H1rvvKRvoqjdRojh4AITG08IVp1Jfc4eCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1MICG+7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1MICG+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712620928; x=1744156928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/jU3pwfNGBhdPc7POkfTjspxoZkntWBFGvRNcaXrPls=;
  b=L1MICG+7gt4cToN+860hRcFjNc0CyEJjRJPFFVHyocRDF/SGWvv4h7+W
   NGSmiI/CSluA7StIhkcuVHUek6DisglxGFZtyFd5KdYG2gtkv2CBDvqF3
   8HiMKBu/6kbxV+FT9Mu11nXWlvegNDfTCSXk0xtSF4sjYquCzLV46Am2n
   4DgtG+vhKVw45JNd+2CNmcSeKx0Hd3APl6fu1WsSLac1Qj/iku9ITGPj4
   pM01spCgGPMVa4bm2/vALRkUDhRKfSYOrNYD5vFNGmPHwkoYHAhmnhEAL
   tmpOqlV1m3ydq0frTIUFml7hGsQLeY1VZ5go1GZNVLQ2oaoEaMNlrvEAR
   A==;
X-CSE-ConnectionGUID: 7mqoTRCMTYqLRyAfDnyqCg==
X-CSE-MsgGUID: Wyzg6Wp8RQKY1/Sdl8kfkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18531068"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="18531068"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 17:02:08 -0700
X-CSE-ConnectionGUID: Wja0B8WjStOGnmGbIBy5Kg==
X-CSE-MsgGUID: 9gwml9tlRPuQqNdOg6hIPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="24793821"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Apr 2024 17:02:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtyw8-0005ZG-1E;
	Tue, 09 Apr 2024 00:02:04 +0000
Date: Tue, 9 Apr 2024 08:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 133/166]
 drivers/net/wireless/rsi/rsi_91x_debugfs.c:233: warning: Function parameter
 or struct member 'iocb' not described in 'rsi_debug_zone_write'
Message-ID: <202404090717.jYvty2YG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   e7bbb29bad7bb57e91d8a49a5aab3797680b1560
commit: a9312f909adf6dfb78a67d1d85648042f455c587 [133/166] drivers/net/wireless/rsi: convert to read/write iterators
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240409/202404090717.jYvty2YG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404090717.jYvty2YG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090717.jYvty2YG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/rsi/rsi_91x_debugfs.c:233: warning: Function parameter or struct member 'iocb' not described in 'rsi_debug_zone_write'
>> drivers/net/wireless/rsi/rsi_91x_debugfs.c:233: warning: Function parameter or struct member 'from' not described in 'rsi_debug_zone_write'
>> drivers/net/wireless/rsi/rsi_91x_debugfs.c:233: warning: Excess function parameter 'filp' description in 'rsi_debug_zone_write'
>> drivers/net/wireless/rsi/rsi_91x_debugfs.c:233: warning: Excess function parameter 'buff' description in 'rsi_debug_zone_write'
>> drivers/net/wireless/rsi/rsi_91x_debugfs.c:233: warning: Excess function parameter 'len' description in 'rsi_debug_zone_write'
>> drivers/net/wireless/rsi/rsi_91x_debugfs.c:233: warning: Excess function parameter 'data' description in 'rsi_debug_zone_write'


vim +233 drivers/net/wireless/rsi/rsi_91x_debugfs.c

dad0d04fa7ba41 Fariya Fatima 2014-03-16  221  
dad0d04fa7ba41 Fariya Fatima 2014-03-16  222  /**
dad0d04fa7ba41 Fariya Fatima 2014-03-16  223   * rsi_debug_zone_write() - This function writes into hal queues as per user
dad0d04fa7ba41 Fariya Fatima 2014-03-16  224   *			    requirement.
dad0d04fa7ba41 Fariya Fatima 2014-03-16  225   * @filp: Pointer to the file structure.
dad0d04fa7ba41 Fariya Fatima 2014-03-16  226   * @buff: Pointer to the character buffer.
dad0d04fa7ba41 Fariya Fatima 2014-03-16  227   * @len: Length of the data to be written into buffer.
dad0d04fa7ba41 Fariya Fatima 2014-03-16  228   * @data: Pointer to the data.
dad0d04fa7ba41 Fariya Fatima 2014-03-16  229   *
dad0d04fa7ba41 Fariya Fatima 2014-03-16  230   * Return: len: Number of bytes read.
dad0d04fa7ba41 Fariya Fatima 2014-03-16  231   */
a9312f909adf6d Jens Axboe    2024-04-06  232  static ssize_t rsi_debug_zone_write(struct kiocb *iocb, struct iov_iter *from)
dad0d04fa7ba41 Fariya Fatima 2014-03-16 @233  {
a9312f909adf6d Jens Axboe    2024-04-06  234  	size_t len = iov_iter_count(from);
dad0d04fa7ba41 Fariya Fatima 2014-03-16  235  	unsigned long dbg_zone;
dad0d04fa7ba41 Fariya Fatima 2014-03-16  236  	int ret;
dad0d04fa7ba41 Fariya Fatima 2014-03-16  237  
dad0d04fa7ba41 Fariya Fatima 2014-03-16  238  	if (!len)
dad0d04fa7ba41 Fariya Fatima 2014-03-16  239  		return 0;
dad0d04fa7ba41 Fariya Fatima 2014-03-16  240  
a9312f909adf6d Jens Axboe    2024-04-06  241  	ret = kstrtoul_from_iter(from, len, 16, &dbg_zone);
dad0d04fa7ba41 Fariya Fatima 2014-03-16  242  
dad0d04fa7ba41 Fariya Fatima 2014-03-16  243  	if (ret)
dad0d04fa7ba41 Fariya Fatima 2014-03-16  244  		return ret;
dad0d04fa7ba41 Fariya Fatima 2014-03-16  245  
dad0d04fa7ba41 Fariya Fatima 2014-03-16  246  	rsi_zone_enabled = dbg_zone;
dad0d04fa7ba41 Fariya Fatima 2014-03-16  247  	return len;
dad0d04fa7ba41 Fariya Fatima 2014-03-16  248  }
dad0d04fa7ba41 Fariya Fatima 2014-03-16  249  

:::::: The code at line 233 was first introduced by commit
:::::: dad0d04fa7ba41ce603a01e8e64967650303e9a2 rsi: Add RS9113 wireless driver

:::::: TO: Fariya Fatima <fariyaf@gmail.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
