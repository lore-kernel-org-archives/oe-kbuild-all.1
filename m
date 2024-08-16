Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6D83A1B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830370; cv=none; b=kETR+uKj8IfUDkgDYoNnDyxYkk5xEmQy9L+vHRhHo2TXEmQmzVlg2ejaBJNlNE8Ek1/nAYAFPj7G1aWG9gN4J2rPU8HK10MlVAI+Ac7VhWzMjxxTOeHxLf3HsQGZ/uZY+LQbiGjbyQpymRCD4KDilHOiumQ8TsUX9V6v/kkszVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830370; c=relaxed/simple;
	bh=pHAzqsmJaFjecfltjJQF6jCrTadHsMg5ii2GPwpZBDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUFsoiW7d0WWtgwPwJpP2jKNHg7+cb83KOi2uQpJKdbz/AtqLZ0DKCGGR2AXueqchRZh1obVi6dfgf4RvvVN/O1FS+ptwNdFPoGupAIQYdVQFAFx7bb/MSe2DhbLYNRdgA077iLJYi2rtiqmpN7u9TIt7uncQMTnyA2gkh7AlM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6LEyX4e; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6LEyX4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723830369; x=1755366369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pHAzqsmJaFjecfltjJQF6jCrTadHsMg5ii2GPwpZBDE=;
  b=M6LEyX4ewbQtZzymzxlHy0pLRp8swG0qdxDMObNpSFjwwnlBSMoQQG4s
   tZBR4jvu9f1mT2Y9nOHSPlmggaNTpDIe/QVgnyy+YKqLVLVGf7hnR6CoK
   GEdw3UheeiyA9UTzaNehLI5X1qVZk1OhGC8gRwwr1QwU47CMAzCbX+AUw
   YYfgdH960PyI4/XEK7Zo6DKPDbsUVSijejjzdGhzR5i31jiNMATtqV4ZL
   eadykLKERyos2nVOXKeI34Fm8KOyTgeBRnHb6td6PjbgAOm2zCNaHJu3I
   vU5THUofmWByoW0yyRGozO1rY+hVEI9hr3BEBCGGM+CAqpyODiDsKLqU2
   g==;
X-CSE-ConnectionGUID: 5cRbdl3JRb+ziLyrsm8Log==
X-CSE-MsgGUID: 6LmdZs50RCWEDMHT9oBi+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22277580"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="22277580"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:46:08 -0700
X-CSE-ConnectionGUID: M8SSWYi2RKCOiXfHZiHVWw==
X-CSE-MsgGUID: lPsckDVMQ+CQXygZysBYyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="82945940"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Aug 2024 10:46:06 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf11Y-0006h1-1s;
	Fri, 16 Aug 2024 17:46:04 +0000
Date: Sat, 17 Aug 2024 01:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.dio 36/36] fs/inode.c:2468:6: warning: no previous
 prototype for 'inode_dio_finished'
Message-ID: <202408170116.1A9YKst7-lkp@intel.com>
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
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240817/202408170116.1A9YKst7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170116.1A9YKst7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170116.1A9YKst7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/inode.c:2468:6: warning: no previous prototype for 'inode_dio_finished' [-Wmissing-prototypes]
    2468 | bool inode_dio_finished(const struct inode *inode)
         |      ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/fs.h:6,
                    from fs/inode.c:7:
   fs/inode.c: In function 'inode_dio_wait':
>> fs/inode.c:2487:45: warning: the address of 'inode_dio_finished' will always evaluate as 'true' [-Waddress]
    2487 |         wait_var_event(&inode->i_dio_count, inode_dio_finished);
         |                                             ^~~~~~~~~~~~~~~~~~
   include/linux/wait_bit.h:276:13: note: in definition of macro 'wait_var_event'
     276 |         if (condition)                                                  \
         |             ^~~~~~~~~


vim +/inode_dio_finished +2468 fs/inode.c

  2464	
  2465	/*
  2466	 * Direct i/o helper functions
  2467	 */
> 2468	bool inode_dio_finished(const struct inode *inode)
  2469	{
  2470		smp_mb__before_atomic();
  2471		return atomic_read(&inode->i_dio_count) == 0;
  2472	}
  2473	EXPORT_SYMBOL(inode_dio_finished);
  2474	
  2475	/**
  2476	 * inode_dio_wait - wait for outstanding DIO requests to finish
  2477	 * @inode: inode to wait for
  2478	 *
  2479	 * Waits for all pending direct I/O requests to finish so that we can
  2480	 * proceed with a truncate or equivalent operation.
  2481	 *
  2482	 * Must be called under a lock that serializes taking new references
  2483	 * to i_dio_count, usually by inode->i_mutex.
  2484	 */
  2485	void inode_dio_wait(struct inode *inode)
  2486	{
> 2487		wait_var_event(&inode->i_dio_count, inode_dio_finished);
  2488	}
  2489	EXPORT_SYMBOL(inode_dio_wait);
  2490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
