Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1949D286A6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 23:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712271797; cv=none; b=iM8REoyAAA3zEwDdhIh5nQIP1brbQ0NGqEqalAO3qJmaGKL2fAYLm4vVpJKW+Twjbl+UL7xsSWMe2hdPPTgQ47bYykJEgD5P/OlNzHZaQB2Pc12zNuPrIZ2LWN+9tQi9cKf3S5Tkdz6VOTZ8EjXqZRmjtlBvSSD8w7gsvFvf9ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712271797; c=relaxed/simple;
	bh=xuwGImjr/kko3sAwucTTx0Qj7z22FIyB8HOv+dE3gik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ineASj5t6YklEKRM9DklZOKqNJG1vDQ/wjOWufKm1+qw8D4YPZrcppvhz1WLiTjItzg19gBpkvdMMx9WPKvX4B0AEuurOm1g+p7aR6qsff8xygnQiAz6wWBAw/npkkhgjmDSaI7xyK1IS++xIXWZ140OFFQ1knT65Mf3TOF4hU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRb/ObUR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRb/ObUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712271796; x=1743807796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xuwGImjr/kko3sAwucTTx0Qj7z22FIyB8HOv+dE3gik=;
  b=NRb/ObURXle9jPU1FmH+ijoVrWSCKpB7rhRYRF4ViLWpQW2jBvrj8oQG
   a6M6ixIxG4R7mT8UFLdKUhP0zuNgN/BCmbWq6JxTCNqMAzuUI+PPv+A4Y
   YVsSliEKKHgdf5hl8fJuPxpEvcsbMmLIs0j0XG0k20Iq+B9/6CCnxELPi
   VgvKkqgs+Z+yuipIxo5e/ZFw3FqREAG9di7cFoF3ilnN8zFCstgeAFBq2
   eizSZz6I1Ot6O9XhjNilk70uVC81R4IEIUdD17ogqJEhjryKKme8aa068
   qQDep5VHPH0MLbXXWlnU9KDV8XgGSV4cT42eu4HzB4aZVxsmadNmkLQe/
   Q==;
X-CSE-ConnectionGUID: 99Ek9vpxTmKhMX7ol0XQtw==
X-CSE-MsgGUID: AFWqWfbORwS1T+iufP7luw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18944189"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18944189"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 16:03:15 -0700
X-CSE-ConnectionGUID: 27Ru/osPTWmhiMKB+nifvw==
X-CSE-MsgGUID: bJa32bDpTKKAcEqJJRun7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="56431248"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Apr 2024 16:03:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsW6y-0001bm-0H;
	Thu, 04 Apr 2024 23:03:12 +0000
Date: Fri, 5 Apr 2024 07:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 19/28] kernel/time/test_udelay.c:110:14: error:
 implicit declaration of function 'copy_from_iter_full'; did you mean
 'copy_from_user_nofault'?
Message-ID: <202404050718.p3HsjUlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f43454f1aaa3229f819380d12166825180ccee0e
commit: 02b8fcd817e5dbfce4b90bc975bbb4b7c0934cd9 [19/28] kernel: convert to read/write iterators
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050718.p3HsjUlC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050718.p3HsjUlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050718.p3HsjUlC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/test_udelay.c: In function 'udelay_test_write':
   kernel/time/test_udelay.c:101:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     101 |         size_t count = iov_iter_count(from);
         |                        ^~~~~~~~~~~~~~
>> kernel/time/test_udelay.c:110:14: error: implicit declaration of function 'copy_from_iter_full'; did you mean 'copy_from_user_nofault'? [-Werror=implicit-function-declaration]
     110 |         if (!copy_from_iter_full(lbuf, count, from))
         |              ^~~~~~~~~~~~~~~~~~~
         |              copy_from_user_nofault
   cc1: some warnings being treated as errors


vim +110 kernel/time/test_udelay.c

    98	
    99	static ssize_t udelay_test_write(struct kiocb *iocb, struct iov_iter *from)
   100	{
 > 101		size_t count = iov_iter_count(from);
   102		char lbuf[32];
   103		int ret;
   104		int usecs;
   105		int iters;
   106	
   107		if (count >= sizeof(lbuf))
   108			return -EINVAL;
   109	
 > 110		if (!copy_from_iter_full(lbuf, count, from))
   111			return -EFAULT;
   112		lbuf[count] = '\0';
   113	
   114		ret = sscanf(lbuf, "%d %d", &usecs, &iters);
   115		if (ret < 1)
   116			return -EINVAL;
   117		else if (ret < 2)
   118			iters = DEFAULT_ITERATIONS;
   119	
   120		mutex_lock(&udelay_test_lock);
   121		udelay_test_usecs = usecs;
   122		udelay_test_iterations = iters;
   123		mutex_unlock(&udelay_test_lock);
   124	
   125		return count;
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
