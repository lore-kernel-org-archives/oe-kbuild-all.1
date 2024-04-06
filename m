Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8282A56B6E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 22:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712442954; cv=none; b=lx2yR6FF0jDzC9FY6yGUEA/Klmhtg1UIGzZ6+VnZ/Wk86UxbBx/f2+x+QLlPLOxxQSVw7vYyaX2jHARAHPTAoLGQWLq/B3x/hsxjD7sBRlyD8bWWtS6h3RqD0IKuW7UMUIySTz3Iv6Szp8EdBYOvyfsojOMnlObaIoJGrAVhpyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712442954; c=relaxed/simple;
	bh=3+6xd6VM1RPDyX1+BMyxHAC9SO7TVADINh2wJTJ8wPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dNWaduTDMuueK5/+A36/8ish8f+1+2pOleHRyP0LC0y/4LcXrd6ySj7JMVLuMiJTYMhTNMm+JsmSj1+3KA50nVaZsmpyNkorKRWIOBECuBZ3JGGawdTBnzSpAAtslmYxN6hAd5dgZggrRriQl+5K2YF6E7SDCSBDOMIfKLg4F2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5vOq6ao; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5vOq6ao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712442952; x=1743978952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3+6xd6VM1RPDyX1+BMyxHAC9SO7TVADINh2wJTJ8wPg=;
  b=Y5vOq6aoMt8mLbwwW5HysiNLf1Xhj3K2hC8UpdSiz40Ubivmh7UO3tX5
   vQyHtreZqvS7okoD73mAFu5QdZSsFFKJM4wseSzhkPpcN9pyM1DHfCe2J
   9DzoQ5d7UQldhXet1bciDx6vOVkGv55qPZXkwC+AI1DHqZrQyK6tro3Sx
   r+5DFhP1frM39JdJpj2CRzK3a8bpVCS2JPjX6THtphvARWpGjVBHcrC7T
   B5gcrspbz96rOrScTSzqDc9EL27OJ1Ev/B98tcK7IJ0JqSl7Z/EptFOuY
   xib8Y9ZXw98ALby8oiHx6ZBVLGMP6qjH0i7io8Z2RMNhLB02QgDe3IQ2G
   w==;
X-CSE-ConnectionGUID: 6If7/jDMRdKA+Ad9DZd2pA==
X-CSE-MsgGUID: MD6HwUmOSgaaoqE4rDmw5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="25251709"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="25251709"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 15:35:52 -0700
X-CSE-ConnectionGUID: 9uj7VrU1QEu5ZHlLTfTI7Q==
X-CSE-MsgGUID: mbDd1oHvTRKmd5CkaosxqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="23993251"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Apr 2024 15:35:51 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtEdZ-0003uY-0L;
	Sat, 06 Apr 2024 22:35:49 +0000
Date: Sun, 7 Apr 2024 06:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 55/126] drivers/rtc/rtc-m41t80.c:699:13: error:
 implicit declaration of function 'iov_iter_count'
Message-ID: <202404070648.CrfXcDVW-lkp@intel.com>
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
commit: 570db5fedfeb2e78d408a62d9a424867844df178 [55/126] drivers/rtc: convert to read/write iterators
config: i386-buildonly-randconfig-001-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070648.CrfXcDVW-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070648.CrfXcDVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070648.CrfXcDVW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-m41t80.c: In function 'wdt_write':
>> drivers/rtc/rtc-m41t80.c:699:13: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     699 |         if (iov_iter_count(from)) {
         |             ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/iov_iter_count +699 drivers/rtc/rtc-m41t80.c

   686	
   687	/**
   688	 *	wdt_write - write to watchdog.
   689	 *	@file: file handle to the watchdog
   690	 *	@buf: buffer to write (unused as data does not matter here
   691	 *	@count: count of bytes
   692	 *	@ppos: pointer to the position to write. No seeks allowed
   693	 *
   694	 *	A write to a watchdog device is defined as a keepalive signal. Any
   695	 *	write of data will do, as we don't define content meaning.
   696	 */
   697	static ssize_t wdt_write(struct kiocb *iocb, struct iov_iter *from)
   698	{
 > 699		if (iov_iter_count(from)) {
   700			wdt_ping();
   701			return 1;
   702		}
   703		return 0;
   704	}
   705	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
