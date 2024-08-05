Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A62C684
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 16:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722876775; cv=none; b=b5J0MEiCwwjWuaDNm0hsj7t+pZ4aQih6Q5I53AJWzAKRKb/DpBThzbYnK+njpPS8sKjshNu1H7qERWinv4Nd1xOXzc2HqRmTbuCrX8b3fVVoesWFyBQerleT13nuWVLRd3vVRc+F73KG0d8zjbpKmr3TsoKC5RAaS2QNDtorDg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722876775; c=relaxed/simple;
	bh=A13HpUC/IO5xsHBTFlQ+D5cH4wV9qxlA0MTnVZFRLPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VmuqiGOEVWcGxLho6mdVx9fqv467U3VvmPt3eYEtcvUIPf+h79qLrbrucXqysKOpWuy5MSr6Hj4YMo9Vw0OSZn/bNEsZnq0SRcOtYYPBviHEWP0T49dV0xxwI5lgZO47ok0gUB9pHda8vQKyA9kklliXWYNbVn1gfqgC627958Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L72ynt6T; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L72ynt6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722876773; x=1754412773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A13HpUC/IO5xsHBTFlQ+D5cH4wV9qxlA0MTnVZFRLPk=;
  b=L72ynt6T5ngE8BMDu4sfTr5V66sRbhc3As3tGZ89CgnXAfcQX3InCOxe
   cIu5DI+SJEP4sedYzYmOFMhg/Rg5WpYPAjLg0KjBR+2+N6RoBsLEPkA6l
   qnoCi8aQylz7xiCmOavICTZCQ4z4/tOejwydjKfwBmwKM3gFCSWPD2t/Y
   WOsuv/UDyHMZwFUqTp5JXs0TxXhyFIMen+ltNCuE1v1WqKCSKqJhcW/ZE
   lQt7G2lHYu8b7KEjUem1MrltnuKmjpVArUW9PS8OdzgoLEf0GcJKX+pOg
   IktfqNnMXswarykzDpt10WNZ1CyH2loCESDlq5UUSyhMIADaka77VAWyf
   A==;
X-CSE-ConnectionGUID: haLIBS3bSk68gd9NTVhYDw==
X-CSE-MsgGUID: 5htA+ddYTRWdLrCPDa3VSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32009109"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="32009109"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 09:52:53 -0700
X-CSE-ConnectionGUID: XG3KacOIQnG5ioBKSPxGYg==
X-CSE-MsgGUID: kBnKMZH3Rai6P4SgUdmljw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="56312841"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Aug 2024 09:52:51 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb0wz-0003Ew-0M;
	Mon, 05 Aug 2024 16:52:49 +0000
Date: Tue, 6 Aug 2024 00:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 442/442]
 sound/oss/dmasound/dmasound_core.c:1159:10: error: 'const struct
 file_operations' has no member named 'write'
Message-ID: <202408060035.ET1x1Gt4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449894f5917ad62cb4083d1df948f4f5c92a01da
commit: 51036f9719aad90aa0e0ca1aa9443e6ce79c0fd2 [442/442] fs: finally remove ->read() and ->write() from file_operations
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240806/202408060035.ET1x1Gt4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060035.ET1x1Gt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060035.ET1x1Gt4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/oss/dmasound/dmasound_core.c:1159:10: error: 'const struct file_operations' has no member named 'write'
    1159 |         .write          = sq_write,
         |          ^~~~~
>> sound/oss/dmasound/dmasound_core.c:1159:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1159 |         .write          = sq_write,
         |                           ^~~~~~~~
   sound/oss/dmasound/dmasound_core.c:1159:27: note: (near initialization for 'sq_fops')
>> sound/oss/dmasound/dmasound_core.c:1159:27: error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, const char *, unsigned int,  long long int *)'} [-Wincompatible-pointer-types]
   sound/oss/dmasound/dmasound_core.c:1159:27: note: (near initialization for 'sq_fops.read_iter')
   cc1: some warnings being treated as errors


vim +1159 sound/oss/dmasound/dmasound_core.c

d209974cdc36ae Arnd Bergmann    2010-07-12  1154  
9c2e08c592cd35 Arjan van de Ven 2007-02-12  1155  static const struct file_operations sq_fops =
^1da177e4c3f41 Linus Torvalds   2005-04-16  1156  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  1157  	.owner		= THIS_MODULE,
^1da177e4c3f41 Linus Torvalds   2005-04-16  1158  	.llseek		= no_llseek,
^1da177e4c3f41 Linus Torvalds   2005-04-16 @1159  	.write		= sq_write,
^1da177e4c3f41 Linus Torvalds   2005-04-16  1160  	.poll		= sq_poll,
d209974cdc36ae Arnd Bergmann    2010-07-12  1161  	.unlocked_ioctl	= sq_unlocked_ioctl,
2022ca0a940a16 Arnd Bergmann    2018-09-06  1162  	.compat_ioctl	= compat_ptr_ioctl,
^1da177e4c3f41 Linus Torvalds   2005-04-16  1163  	.open		= sq_open,
^1da177e4c3f41 Linus Torvalds   2005-04-16  1164  	.release	= sq_release,
d8b3966e4c976d Al Viro          2007-03-14  1165  };
d8b3966e4c976d Al Viro          2007-03-14  1166  

:::::: The code at line 1159 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
