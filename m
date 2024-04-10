Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DCF19BA6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 09:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712740114; cv=none; b=o5SdS0N5D7GyqtEg/lK4tNFNLtZa9qVsNOQmN2oiy9WEfKRqXP/AyhN0OYS9/i2wubPbdD3uX1KC9Q2/Zifyj6282k6+Mb4f25VWR4Lg0n1W/KEVklgPtEfZhKuDHsFfz6LoEwSjeoF8yareUtlwdgvo7sDDMwF0Ef2IM3bwG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712740114; c=relaxed/simple;
	bh=Mn2Iyb2lU3L4cB0qNgSui+HAe14bSod5YC+fdEgJbzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YAS4cYtiwsN2Up7xy0n6aqVySTOOuyI7sLyMaALdI5G8yR9VD4uq77NyUk477QG2Rs/x+6tYGM36GcLQP9I0nIp5RANXJtLlIqPIAnogqMDLQiC5oaj+3+VSdBfwMZMnEZuUQSJxrcrbsXPOsK8WmfJu1lcZAGlta4v1DNZ0LI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQHIFxpx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQHIFxpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712740112; x=1744276112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mn2Iyb2lU3L4cB0qNgSui+HAe14bSod5YC+fdEgJbzo=;
  b=cQHIFxpxXv60gP2z6Jg10NigbTV8M7kMzqrv7ehcl2rFqCcu5T2ZVYSi
   uxKoNCmpCZ0090ZRlip2RX+GkhEbvu0cWT0o+KFHA4qX6LU6iDf0ckIAA
   JnJ1BJfVQ5LcQCp11hsXBQV3Y+aAdljRh5qVf5yCHcHEfBgD7sNGeSqQ/
   POOsyIhEDyo6uRvlATMI4DleKcprgFHwr5iHLbUvLGhO6gQSrcXigae48
   n/N8Ccd49QYxBTNHqAnRkCyO0eUtMwBfPiN3dY3H5+erkBCKdpfMctlQN
   l8aQiexDGLSlnE9UFgMKhXX1bc1MJMVgQqp1gejeCcUQioe+TozTD7IMy
   Q==;
X-CSE-ConnectionGUID: xOPWfH70TfyJyYYJ7Eiu+A==
X-CSE-MsgGUID: j+nww86kTuuG68F3e57svA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948632"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948632"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 02:08:31 -0700
X-CSE-ConnectionGUID: 4BzNPtgVQVaAFZihaY8ZMQ==
X-CSE-MsgGUID: xAQnEWRRRD+ZL+Di6MjWOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25111954"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2024 02:08:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruTwS-000799-3A;
	Wed, 10 Apr 2024 09:08:28 +0000
Date: Wed, 10 Apr 2024 17:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 282/367] drivers/parisc/eisa_eeprom.c:35:85:
 error: 'ppos' undeclared
Message-ID: <202404101748.bz4j7i68-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   ad69a5a8c930e58537ce092334af08caaa412900
commit: b9873494bb35a6c984117def4aa7397013d66cd6 [282/367] parisc: eisa_eeprom: convert to read/write iterators
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101748.bz4j7i68-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101748.bz4j7i68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101748.bz4j7i68-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/parisc/eisa_eeprom.c: In function 'eisa_eeprom_read':
>> drivers/parisc/eisa_eeprom.c:35:85: error: 'ppos' undeclared (first use in this function)
      35 |         count = iocb->ki_pos + count < HPEE_MAX_LENGTH ? count : HPEE_MAX_LENGTH - *ppos;
         |                                                                                     ^~~~
   drivers/parisc/eisa_eeprom.c:35:85: note: each undeclared identifier is reported only once for each function it appears in


vim +/ppos +35 drivers/parisc/eisa_eeprom.c

    24	
    25	static ssize_t eisa_eeprom_read(struct kiocb *iocb, struct iov_iter *to)
    26	{
    27		size_t count = iov_iter_count(to);
    28		unsigned char *tmp;
    29		ssize_t ret;
    30		int i;
    31		
    32		if (iocb->ki_pos < 0 || iocb->ki_pos >= HPEE_MAX_LENGTH)
    33			return 0;
    34		
  > 35		count = iocb->ki_pos + count < HPEE_MAX_LENGTH ? count : HPEE_MAX_LENGTH - *ppos;
    36		tmp = kmalloc(count, GFP_KERNEL);
    37		if (tmp) {
    38			for (i = 0; i < count; i++)
    39				tmp[i] = readb(eisa_eeprom_addr+(*ppos)++);
    40	
    41			if (!copy_to_iter_full(tmp, count, to))
    42				ret = -EFAULT;
    43			else
    44				ret = count;
    45			kfree (tmp);
    46		} else
    47			ret = -ENOMEM;
    48		
    49		return ret;
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
