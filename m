Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A286E39A4AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 23:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539067; cv=none; b=a2uphFIIAMs14ScXd2pYUauO5y+ZZb7mEqmuj8vsb1+oHyLdra8TUq3HdtxcwKCUoZ5LW/T1UG5Pn/qJthlhRb3vPx03NMGrUk2c9+wgtwVvUBSJULREVE3GLQO0ZP8UJXq4W9L7QLfKnQ+CAPg9TU4jiMtlQHvCFAy/jOMHZqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539067; c=relaxed/simple;
	bh=FjL1VKFtLsuNAFlmj8vdbQ8E0xLs2XqjPcXXeSjdTWQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CCRkNFTsAk7PT/iKU0CbG5mkwVgas0jb9FIwwK8AGSBBGkI33L8CKFRXhpu4pV3lljJDdvO9vptZPGWVjiScv0sGK63OiWNBHxa6/psK5wl7Joydl0bogT78ZcypTmz6tiOy3Aq31d+DUIXxo/kxv8S6UyU1YvXWXO6uGqgUvbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuMGxTOS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuMGxTOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785539064; x=1817075064;
  h=date:from:to:cc:subject:message-id;
  bh=FjL1VKFtLsuNAFlmj8vdbQ8E0xLs2XqjPcXXeSjdTWQ=;
  b=FuMGxTOSVa74NL28Og5+8dW4B/QQHNkpWjMfWFnGXxTosBvp2S42obgn
   u9zaMYYSu2whPQXteldiMS1KA1EDRZTUOWsx4dZ8GQzCDTvtYW95LRdrl
   aQL/zPPCYioxS9pzpvOy10XH9i2o4MX6/px4E3gR/K59arj63jBrB0hhm
   r+zGnxCGfJ3QkUWb/B19kpxGjGqM6WbnmxvcosDlyijc5oktu6oisp9xN
   tpdBsqMllg8vpDnmKXuKfP5AyCUHBqVd/Gz37qJ1SYY1B0YEHbP+NjtaE
   qTpqF9ebc7vbHV9Fh1Fl4MoO44nNwL3s2i6fO4QXEcLPaDfae39N0UGFT
   w==;
X-CSE-ConnectionGUID: O8XI/JLQTDO73ZFfo1zbGg==
X-CSE-MsgGUID: 7dKn1ur7Q2qk1nxHDuQ5Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="85142584"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="85142584"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 16:04:22 -0700
X-CSE-ConnectionGUID: OWOK8vC6QvCawiW9SsRj1w==
X-CSE-MsgGUID: 1ToFt+V5R5OGa5uexeamTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="258008305"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jul 2026 16:04:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpwH4-000000002NF-12iE;
	Fri, 31 Jul 2026 23:04:18 +0000
Date: Sat, 01 Aug 2026 07:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Georgia Garcia <georgia.garcia@canonical.com>
Subject: [linux-next:master 10056/11507]
 security/apparmor/apparmorfs.c:1391:37: warning: 'seq_ns_compress_max_fops'
 defined but not used
Message-ID: <202608010623.1Ofojy9E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: 1c5f27e845e84f58ed6bbe3e6bc12d6a013e74b5 [10056/11507] apparmor: Fix build failure when ZSTD_DECOMPRESS is not enabled
config: sparc-randconfig-002-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010623.1Ofojy9E-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010623.1Ofojy9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010623.1Ofojy9E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/apparmorfs.c: In function 'rawdata_open':
   security/apparmor/apparmorfs.c:1602:17: error: implicit declaration of function 'decompress_zstd' [-Werror=implicit-function-declaration]
    1602 |         error = decompress_zstd(loaddata->data, loaddata->compressed_size,
         |                 ^~~~~~~~~~~~~~~
   At top level:
>> security/apparmor/apparmorfs.c:1391:37: warning: 'seq_ns_compress_max_fops' defined but not used [-Wunused-const-variable=]
    1391 | static const struct file_operations seq_ns_ ##NAME ##_fops = {        \
         |                                     ^~~~~~~
   security/apparmor/apparmorfs.c:1470:1: note: in expansion of macro 'SEQ_NS_FOPS'
    1470 | SEQ_NS_FOPS(compress_max);
         | ^~~~~~~~~~~
>> security/apparmor/apparmorfs.c:1391:37: warning: 'seq_ns_compress_min_fops' defined but not used [-Wunused-const-variable=]
    1391 | static const struct file_operations seq_ns_ ##NAME ##_fops = {        \
         |                                     ^~~~~~~
   security/apparmor/apparmorfs.c:1469:1: note: in expansion of macro 'SEQ_NS_FOPS'
    1469 | SEQ_NS_FOPS(compress_min);
         | ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/seq_ns_compress_max_fops +1391 security/apparmor/apparmorfs.c

f8eb8a1324e819 John Johansen 2013-08-14  1378  
64c8697045f877 John Johansen 2017-05-25  1379  /*
64c8697045f877 John Johansen 2017-05-25  1380   * namespace based files
64c8697045f877 John Johansen 2017-05-25  1381   *     several root files and
64c8697045f877 John Johansen 2017-05-25  1382   *     policy/ *
64c8697045f877 John Johansen 2017-05-25  1383   */
f8eb8a1324e819 John Johansen 2013-08-14  1384  
64c8697045f877 John Johansen 2017-05-25  1385  #define SEQ_NS_FOPS(NAME)						      \
64c8697045f877 John Johansen 2017-05-25  1386  static int seq_ns_ ##NAME ##_open(struct inode *inode, struct file *file)     \
64c8697045f877 John Johansen 2017-05-25  1387  {									      \
64c8697045f877 John Johansen 2017-05-25  1388  	return single_open(file, seq_ns_ ##NAME ##_show, inode->i_private);   \
64c8697045f877 John Johansen 2017-05-25  1389  }									      \
64c8697045f877 John Johansen 2017-05-25  1390  									      \
64c8697045f877 John Johansen 2017-05-25 @1391  static const struct file_operations seq_ns_ ##NAME ##_fops = {	      \
64c8697045f877 John Johansen 2017-05-25  1392  	.owner		= THIS_MODULE,					      \
64c8697045f877 John Johansen 2017-05-25  1393  	.open		= seq_ns_ ##NAME ##_open,			      \
64c8697045f877 John Johansen 2017-05-25  1394  	.read		= seq_read,					      \
64c8697045f877 John Johansen 2017-05-25  1395  	.llseek		= seq_lseek,					      \
64c8697045f877 John Johansen 2017-05-25  1396  	.release	= single_release,				      \
64c8697045f877 John Johansen 2017-05-25  1397  }									      \
3e3e569539864d John Johansen 2017-01-16  1398  

:::::: The code at line 1391 was first introduced by commit
:::::: 64c8697045f87713f0648e8429fcc3a0c4c61ffd apparmor: use macro template to simplify namespace seq_files

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
