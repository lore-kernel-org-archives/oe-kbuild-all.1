Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F17A31
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 20:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712175749; cv=none; b=Jr9kqWbRtZU3gOgNYzoDBiH2tOx6OdvkLeOVg2OrxuYBePTv1qx/1/6C9ZQjfPM+pN6DyGYVOHJt0KY5NQumC7TPiiwr8OyXe5qc37gYZPN5yIB2VpI5JziSbrslE/c3zVbYJtocPlQl3WSjVVsdklQXq8sU9ku79IBkji9Y/hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712175749; c=relaxed/simple;
	bh=eXXmPhmQWrbsPHjCeWvik76VqROAVyy/skW7xwhjvzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nmpePm8MU+flAB0xeTOXVZWuIheKsuaMGLGsLTUxF4UvsASKF2QKHIKLI5P+6J3fBD8SaVthMm+VFcAiAo+jrVWYsUH3dx7lqbq6W+UnMzKKpinIutkOqUf4U5ZphdB2alJ4fvM1hkJzjRfkY5STOiQL74K/RuqDy/ONSccRn2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIAQMBGx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIAQMBGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712175748; x=1743711748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eXXmPhmQWrbsPHjCeWvik76VqROAVyy/skW7xwhjvzE=;
  b=iIAQMBGxwLTlmi8NqSwHwsIXJY+8NVC7wpSTcLfb3u9G2fs7bAML2e4O
   mD152BWTZCCUH0Blacnb/i67GaTHOr7SBYZVAwx1xeJ+R9LLqWh4oNT0w
   WR+Ipr+hCZv7/LPcykEZqqos0oNBXDQntpvK813Ky/y+mv4+L+oJEPOxX
   GWc4B3Imj2eIqL2UENkgqrfMF83/S5JuhRDPvebDLCniyjn1uhIn6vNaW
   +qzRXBRLbTZVuPsOjDplVW0p7w8zG30gcx+f/B0obSLjAoa+DncgqWAx3
   R7QW4bDQeyeZ4Yto85p11CcBX/dOeDxGGJ2RSKHtZGsSm2EXAjTEHWzpE
   A==;
X-CSE-ConnectionGUID: mw+Cs0gcR2Kx0Eirc6gKiQ==
X-CSE-MsgGUID: oydBr1+lQP6F7wyEOM+z4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="10399779"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="10399779"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 13:22:14 -0700
X-CSE-ConnectionGUID: Xwnwag57TMGEpiSv+ru7Eg==
X-CSE-MsgGUID: BLg1CVfYSh+bZodT3ahcDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18400714"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2024 13:22:12 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs77Z-0000CS-1x;
	Wed, 03 Apr 2024 20:22:09 +0000
Date: Thu, 4 Apr 2024 04:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 5/10] fs/debugfs/file.c:36:16: error: implicit
 declaration of function 'iov_iter_count'
Message-ID: <202404040435.Wxo5Ix5O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   bc45e135ae557c852f29a8473a2bf57fb06b6027
commit: 9c9b194abb1f6b266a4db14859611801811cf0b3 [5/10] debugfs: convert to ->read_iter()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240404/202404040435.Wxo5Ix5O-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040435.Wxo5Ix5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040435.Wxo5Ix5O-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/debugfs/file.c: In function 'default_write_file_iter':
>> fs/debugfs/file.c:36:16: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
      36 |         return iov_iter_count(from);
         |                ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/iov_iter_count +36 fs/debugfs/file.c

    33	
    34	static ssize_t default_write_file_iter(struct kiocb *iocb, struct iov_iter *from)
    35	{
  > 36		return iov_iter_count(from);
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
