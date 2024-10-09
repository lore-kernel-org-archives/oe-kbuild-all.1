Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945E01C6BE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 11:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728471952; cv=none; b=nMnvMjFzaxXvopNN9ra4bxMubqAbXXKOu1VbMsjYt23qW0BX8WM5rQDHAA+oApzUetZZsVGZXCNq6SyQTMbQe2IHarmJfv2PHRn2isjfChyUm99T6Ywe+Jf5EMd3dvFmAVWVsiBb6EkcaZaqIEYrLgE+7VY2em5PnhoqVUMM80A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728471952; c=relaxed/simple;
	bh=ODSdbukr8Kss+fy8iEGUuoPWYhOq8pUDFGq1iPYUJkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WdkVqYJLgyYXMphpMzrJ8iLgRCPEMq3mi2L273W9hfnre260DA9hswV7mNAp3VqTrPbexQtERpycGAeiL3+hC9Gcde0SUY3OtMgnFqWHo2NIKGgycJzQVfLQ+Gt6qfcDN+sVA/Tg3z2S04urGMYg90CVDtljDseyp8kK0VHM76A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRbmPccb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRbmPccb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728471951; x=1760007951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ODSdbukr8Kss+fy8iEGUuoPWYhOq8pUDFGq1iPYUJkU=;
  b=mRbmPccbcQpMwSibbKFbHWrhr/1nBq8lYpX8k2XLrohnKRW/+3mBqpAs
   HjFZbJd+bwTRkMD+qklO0GPRo2eRXHqkYp8aYFRjO4JzW8rrXXtGuKf5r
   2gQEG8CSWsMfBTi0LrRQwf8yyf7rgYsxvqNo+aeNrzr92x7l+2aJSXmRB
   fi2lpSVD8TOkR1CIBjeZWgj8Vo1XGBrJENxwpoE/I/oJHgE0kOJXNbPc5
   GfkjE74CNVkfIb93d05LWgCHihguH6pvYthHzmoqecAYn0w4z7Y9aAr7h
   KCk5Mt5tgo5A/ApE6oKH45REskSTIlD3zUs4rzKPJJ1hoY92DCVnBPqUN
   A==;
X-CSE-ConnectionGUID: 6dezOLTYSWiGWrgxSfGG9A==
X-CSE-MsgGUID: J21PthgeTdClzmPrQTobJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="53171328"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="53171328"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 04:05:50 -0700
X-CSE-ConnectionGUID: DABgqJusQ0+6zsPyFAiDew==
X-CSE-MsgGUID: Fa8B6Gg0QEuUGvBfT/muwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76442054"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2024 04:05:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syUVm-00098G-1K;
	Wed, 09 Oct 2024 11:05:46 +0000
Date: Wed, 9 Oct 2024 19:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:brauner.file.file_ref 2/4]
 arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates
 bits from constant value (e000000000000000 becomes 0)
Message-ID: <202410091852.NToRK0Ie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git brauner.file.file_ref
head:   072dfe12c3697eb822f81205ae1454896215d3cf
commit: 947c3d13e57f7abbc240d0d354049e4882ea2c3f [2/4] fs: add file_ref
config: sparc-randconfig-r112-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091852.NToRK0Ie-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241009/202410091852.NToRK0Ie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091852.NToRK0Ie-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/file.c:486:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:486:17: sparse:     expected struct file **old_fds
   fs/file.c:486:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:487:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:487:17: sparse:     expected struct file **new_fds
   fs/file.c:487:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:502:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:502:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:502:17: sparse:    struct file *
   fs/file.c:537:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   fs/file.c:577:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:760:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:950:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:971:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:975:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic64_t [usertype] *v @@     got struct atomic64_t [noderef] __rcu * @@
   fs/file.c:978:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file_reloaded @@     got struct file * @@
   fs/file.c:1001:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file_reloaded @@
   fs/file.c:1003:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1024:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:1026:32: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1048:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file **f @@
   fs/file.c:1048:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:1052:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *[assigned] file @@
   fs/file.c:1354:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@
   fs/file.c: note: in included file (through arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, arch/sparc/include/asm/atomic.h, ...):
>> arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (e000000000000000 becomes 0)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (e000000000000000 becomes 0)

vim +161 arch/sparc/include/asm/cmpxchg_64.h

d550bbd40c0e10 David Howells 2012-03-28  155  
d550bbd40c0e10 David Howells 2012-03-28  156  static inline unsigned long
d550bbd40c0e10 David Howells 2012-03-28  157  __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
d550bbd40c0e10 David Howells 2012-03-28  158  {
d550bbd40c0e10 David Howells 2012-03-28  159  	switch (size) {
a12ee2349312d7 Babu Moger    2017-05-24  160  		case 1:
a12ee2349312d7 Babu Moger    2017-05-24 @161  			return __cmpxchg_u8(ptr, old, new);
d550bbd40c0e10 David Howells 2012-03-28  162  		case 4:
d550bbd40c0e10 David Howells 2012-03-28  163  			return __cmpxchg_u32(ptr, old, new);
d550bbd40c0e10 David Howells 2012-03-28  164  		case 8:
d550bbd40c0e10 David Howells 2012-03-28  165  			return __cmpxchg_u64(ptr, old, new);
d550bbd40c0e10 David Howells 2012-03-28  166  	}
d550bbd40c0e10 David Howells 2012-03-28  167  	__cmpxchg_called_with_bad_pointer();
d550bbd40c0e10 David Howells 2012-03-28  168  	return old;
d550bbd40c0e10 David Howells 2012-03-28  169  }
d550bbd40c0e10 David Howells 2012-03-28  170  

:::::: The code at line 161 was first introduced by commit
:::::: a12ee2349312d7112b9b7c6ac2e70c5ec2ca334e arch/sparc: Introduce cmpxchg_u8 SPARC

:::::: TO: Babu Moger <babu.moger@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
