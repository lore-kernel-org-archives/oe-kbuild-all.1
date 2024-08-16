Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C341C461F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830973; cv=none; b=kaZJtwkad5jrC5nGKqlgQoSOGRiAH67FiEPdEgZjbXaP5KFj427J+N+6fEt75TUmDC/UWVUtkjXTwYdZy5GBIiTsXznFgTl0z+sW1SP+D+jl0lmc5hETfnRsb6+fNUXSQY8fcUILm11h628bC/7APNNY3MwZk4Stwgo6esUkSP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830973; c=relaxed/simple;
	bh=9YGQJJ+5NQD9SWL+0OIw+I8vNSjQKH6YoufTUXrESpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDsG5gijBw2CPwvjC/YqPhtwbnrAQ/XC4sOA1e3Upx63E6MoLZ1OnluvQyoVhJ1cU+F8EsYnYsvVL8J+jA0a7WXoSL0wBofxGDlt/2G26IPozCU31MKcjdi6GIpVpaNYE7jwU2ADYaWV4+nDW1LUOsvWTLlS4t+rL/OY0ZuJGRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRjZwu2z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRjZwu2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723830971; x=1755366971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9YGQJJ+5NQD9SWL+0OIw+I8vNSjQKH6YoufTUXrESpI=;
  b=BRjZwu2z7w5ej8WYkiz5lwFU3sQwyMZOzncG57n7/qSc8YEVlPp2mPjS
   xGLESJu85Y+LOAOWpTUOr1LTzBckWXZqx7kzRi//8FymLTZ7UTkHKeW5H
   XZGQPicZjZlLyzGdZoQFBr8rp3gVzxwOTZx14xVC14Sm08INez6CgmmNj
   wO2L6o1GdGJaslUOCZrHxhxD05FfM1/fXhiKteg9LrxwCs2YCSdDVhEGf
   8N+Mw4bGNHfyyIMCH9ofUG4AT5x/6/ML46JicLChh5R7LREaMQH7YvDTs
   sx7oFhVCLRhKzAAToWPOnzwjevYAUuQaOYDElwREoRmNIlwGq7OoZVuR5
   g==;
X-CSE-ConnectionGUID: 63CBN94EQu62sIszScvgzA==
X-CSE-MsgGUID: sk3ilWPdSMqNPQgPip9pGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32709574"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="32709574"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:56:10 -0700
X-CSE-ConnectionGUID: LkTNhuivRz6Js9PC07XAAw==
X-CSE-MsgGUID: 2j/rtAn0TWmU8g+nQ5mT3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="97242046"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2024 10:56:09 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf1BG-0006jq-0t;
	Fri, 16 Aug 2024 17:56:06 +0000
Date: Sat, 17 Aug 2024 01:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.dio 36/36] fs/netfs/locking.c:22:12: error:
 conflicting types for 'inode_dio_wait_interruptible'; have 'int(struct inode
 *)'
Message-ID: <202408170151.Q95ZZCHe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.dio
head:   547ff50a106c7fda7594b19819588fbf9356e85c
commit: 547ff50a106c7fda7594b19819588fbf9356e85c [36/36] inode: remove __I_DIO_WAKEUP
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240817/202408170151.Q95ZZCHe-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170151.Q95ZZCHe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170151.Q95ZZCHe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/locking.c:22:12: error: conflicting types for 'inode_dio_wait_interruptible'; have 'int(struct inode *)'
      22 | static int inode_dio_wait_interruptible(struct inode *inode)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/netfs.h:18,
                    from fs/netfs/locking.c:9:
   include/linux/fs.h:3229:6: note: previous declaration of 'inode_dio_wait_interruptible' with type 'void(struct inode *)'
    3229 | void inode_dio_wait_interruptible(struct inode *inode);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/locking.c: In function 'inode_dio_wait_interruptible':
>> fs/netfs/locking.c:24:13: error: implicit declaration of function 'inode_dio_finished'; did you mean 'inode_dio_end'? [-Wimplicit-function-declaration]
      24 |         if (inode_dio_finished(inode))
         |             ^~~~~~~~~~~~~~~~~~
         |             inode_dio_end


vim +22 fs/netfs/locking.c

46ed60dcd4f2c94 David Howells     2023-10-11  11  
46ed60dcd4f2c94 David Howells     2023-10-11  12  /*
46ed60dcd4f2c94 David Howells     2023-10-11  13   * inode_dio_wait_interruptible - wait for outstanding DIO requests to finish
46ed60dcd4f2c94 David Howells     2023-10-11  14   * @inode: inode to wait for
46ed60dcd4f2c94 David Howells     2023-10-11  15   *
46ed60dcd4f2c94 David Howells     2023-10-11  16   * Waits for all pending direct I/O requests to finish so that we can
46ed60dcd4f2c94 David Howells     2023-10-11  17   * proceed with a truncate or equivalent operation.
46ed60dcd4f2c94 David Howells     2023-10-11  18   *
46ed60dcd4f2c94 David Howells     2023-10-11  19   * Must be called under a lock that serializes taking new references
46ed60dcd4f2c94 David Howells     2023-10-11  20   * to i_dio_count, usually by inode->i_mutex.
46ed60dcd4f2c94 David Howells     2023-10-11  21   */
46ed60dcd4f2c94 David Howells     2023-10-11 @22  static int inode_dio_wait_interruptible(struct inode *inode)
46ed60dcd4f2c94 David Howells     2023-10-11  23  {
547ff50a106c7fd Christian Brauner 2024-08-16 @24  	if (inode_dio_finished(inode))
46ed60dcd4f2c94 David Howells     2023-10-11  25  		return 0;
46ed60dcd4f2c94 David Howells     2023-10-11  26  
547ff50a106c7fd Christian Brauner 2024-08-16  27  	inode_dio_wait_interruptible(inode);
547ff50a106c7fd Christian Brauner 2024-08-16  28  	return !inode_dio_finished(inode) ? -ERESTARTSYS : 0;
46ed60dcd4f2c94 David Howells     2023-10-11  29  }
46ed60dcd4f2c94 David Howells     2023-10-11  30  

:::::: The code at line 22 was first introduced by commit
:::::: 46ed60dcd4f2c94d27735743ce55cd8d6b93cc1d netfs: Implement unbuffered/DIO vs buffered I/O locking

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
