Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A727E5646E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 03:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712632536; cv=none; b=rqhzlbMzHDuz9kCHhgS6uIfn6/luzZXjOAjXIgp6czktccmAZjchOgJyjrVI1ZR++YqS7FZ0Rr7GjMrQU2uWdcF1EUPHFWVN7zO7/bGRZphuDT5SxXnDK2xFY78XTmfRAZYNAqznNYncsmcAVH2eEa3abxHwDDBgfbiEYd+8YDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712632536; c=relaxed/simple;
	bh=Ld6pXzi/lJ7PiRPMHcRpSeWEn0PZTMhgO1NPDTRS6NU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=twEW5y8QaciiAh1LKLypHmGejjTeB/8jbKkWTv7CTTdb2G4Wn1BZCjMEXuYU+nosWyYAacFJtboqTKdlQSq+DCptGp8wJwjFOU7tgSy9e7Uq8AZcmOxV9d7hKArp8/rH9rEPxfQRRFNUk/ke34rTj9GK8sFhlNY/x18VOMMdNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOTfWK3P; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOTfWK3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712632534; x=1744168534;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Ld6pXzi/lJ7PiRPMHcRpSeWEn0PZTMhgO1NPDTRS6NU=;
  b=cOTfWK3PtEmT0hdpzULlL+WU1TkeQJdQwNmPsbAVb3/Xm3kF5MpnE7DI
   JeuWr01+l93vKD1u5PB6iESN6jtIB7TzBmLkAhdCQMgaeDGxJ5IC38jiR
   E+CBoRsmdoDgFZuj+I/eD8mA6x35dUcbsyQUkyW+Ze9Jk2mK0mLqTNwYx
   6IvSoi0I2SodOey52WovF7yYT4loco9wgYm1i6suhDYQ+C6v9Tg48LtoE
   K9RCXapBKuJwgyAEN10Mm5/pS/XYnzDtPF//iXANPGyjsHvSAUCsThb03
   k9p7ktTsFllHbnq74xfw5oT43GTzceitobY9dlbi7UwQ6ecZEnRLAY6Co
   w==;
X-CSE-ConnectionGUID: cRWq6pZnTAKyS2IKfuzmfg==
X-CSE-MsgGUID: zK6VfGEsQBmtT0eZeC3Rrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7788824"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="7788824"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 20:15:33 -0700
X-CSE-ConnectionGUID: nKOwFbo+SFmMSESkoZiKnw==
X-CSE-MsgGUID: FyoMkaYNTGOuuOQJxS1+1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="19970174"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Apr 2024 20:15:32 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru1xK-0005fq-0U
	for oe-kbuild-all@lists.linux.dev;
	Tue, 09 Apr 2024 03:15:30 +0000
Date: Tue, 9 Apr 2024 11:15:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 325/1172] fs/verity/measure.c:40:13:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202404091136.mybDQxJl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common 4.19/android_s
head:   71b63f21a8292ca960a4c363d69d5e95c0265597
commit: ebeb654881fe81557c7344902ce3beae527ba5e2 [325/1172] fs-verity: implement FS_IOC_MEASURE_VERITY ioctl
config: m68k-randconfig-r123-20240406 (https://download.01.org/0day-ci/archive/20240409/202404091136.mybDQxJl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404091136.mybDQxJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091136.mybDQxJl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/verity/measure.c:40:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const *__gu_ptr @@     got unsigned short [noderef] <asn:1> * @@
   fs/verity/measure.c:40:13: sparse:     expected void const *__gu_ptr
   fs/verity/measure.c:40:13: sparse:     got unsigned short [noderef] <asn:1> *
   fs/verity/measure.c:22: warning: Function parameter or member 'filp' not described in 'fsverity_ioctl_measure'
   fs/verity/measure.c:22: warning: Function parameter or member '_uarg' not described in 'fsverity_ioctl_measure'

vim +40 fs/verity/measure.c

    11	
    12	/**
    13	 * fsverity_ioctl_measure() - get a verity file's measurement
    14	 *
    15	 * Retrieve the file measurement that the kernel is enforcing for reads from a
    16	 * verity file.  See the "FS_IOC_MEASURE_VERITY" section of
    17	 * Documentation/filesystems/fsverity.rst for the documentation.
    18	 *
    19	 * Return: 0 on success, -errno on failure
    20	 */
    21	int fsverity_ioctl_measure(struct file *filp, void __user *_uarg)
    22	{
    23		const struct inode *inode = file_inode(filp);
    24		struct fsverity_digest __user *uarg = _uarg;
    25		const struct fsverity_info *vi;
    26		const struct fsverity_hash_alg *hash_alg;
    27		struct fsverity_digest arg;
    28	
    29		vi = fsverity_get_info(inode);
    30		if (!vi)
    31			return -ENODATA; /* not a verity file */
    32		hash_alg = vi->tree_params.hash_alg;
    33	
    34		/*
    35		 * The user specifies the digest_size their buffer has space for; we can
    36		 * return the digest if it fits in the available space.  We write back
    37		 * the actual size, which may be shorter than the user-specified size.
    38		 */
    39	
  > 40		if (get_user(arg.digest_size, &uarg->digest_size))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
