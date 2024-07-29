Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67126156227
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722265771; cv=none; b=EHJPtKm380p8huke0HLH7tCbRsfm3vwza1yC5v+rYaK9qDsQZOx3gwMuwN6Gu35Epd7+jx0BDSNw/T+pff/9SSugiC1wthi41uYHeq9S8KnZhqvxsPRbnEZDNQ5Bv6+/OABF28E2MPNOcA4y3WH3TXk/Uolw03idlGVbN/65BR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722265771; c=relaxed/simple;
	bh=Fd/8876iNMwA1KNeyr4kgQJanlEe8Ga/ww9gdUaiPPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTwasbQSTrc5zckqe7yAD3Fl8W0nF6rQPInf/XCYLpIX5uxUdAovRamCQGSnlOq2hbLWOqWSnPICEpD5baV04n8oBZ1KKm6GyHE8+WeFKs+/xdyxsQmIpCr5Lgg8NDbNUOiD6KoXYM2FwcAl8IK7SxgfbqGx41Tm2OwFR86TstM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOWMyjE3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOWMyjE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722265769; x=1753801769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fd/8876iNMwA1KNeyr4kgQJanlEe8Ga/ww9gdUaiPPM=;
  b=kOWMyjE3xShRGEJq/PRB/abuBGPN0pSyLFWG+ph1twDxY5sz/kfGvT4z
   JZoMQ1jy1hhmlnucXVgmzCa8hVuvsMFfscmvT4f5UhidsGuqOo2YuypYN
   +A/7PdYTiq0+pVxP0UMbpAqpomfHF63f1RjkEKaj/TVwGFzYzkaaNvUeu
   wbccG2MQDHec+z9ibXU1oRBJblumaOSjG44kXThVaqC7sUvkpGFFgHl6y
   /pJT7qT2EFSzZXV4ugMfKYB4DDpVUhKr3gsZlAs+qvFZzGYoqJp85JWYi
   +vOre0+BPbws8Tt2ZWsUhWxJxLKfU5URRw3ULlnLawWI8wpK0aKp4H14x
   g==;
X-CSE-ConnectionGUID: MX+g0x9fSR2ZNtsK6PWJWg==
X-CSE-MsgGUID: /vFj4W9LR/O8XPOs+h0J0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30647985"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="30647985"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 08:07:52 -0700
X-CSE-ConnectionGUID: E6CneNDhTiKSdrvWTH/ZBw==
X-CSE-MsgGUID: Hi9bt3wRSy+heb9gdzoCWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="53972091"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jul 2024 08:07:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYRyW-000rn2-2b;
	Mon, 29 Jul 2024 15:07:48 +0000
Date: Mon, 29 Jul 2024 23:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.fd 28/39] include/linux/cleanup.h:111:21: error:
 function declaration isn't a prototype
Message-ID: <202407292309.QXlzRsZS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.fd
head:   154eb19a802fdf8629273d414dbeb31eccb61587
commit: a5027b86a79716e98fe0b8e1247743dfb5a5c080 [28/39] switch spufs_calls_{get,put}() to CLASS() use
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240729/202407292309.QXlzRsZS-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407292309.QXlzRsZS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407292309.QXlzRsZS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/file.h:14,
                    from arch/powerpc/platforms/cell/spu_syscalls.c:10:
>> include/linux/cleanup.h:111:21: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     111 | static inline _type class_##_name##_constructor(_init_args)             \
         |                     ^~~~~~
   arch/powerpc/platforms/cell/spu_syscalls.c:59:1: note: in expansion of macro 'DEFINE_CLASS'
      59 | DEFINE_CLASS(spufs_calls, struct spufs_calls *, spufs_calls_put(_T), spufs_calls_get())
         | ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +111 include/linux/cleanup.h

54da6a0924311c Peter Zijlstra 2023-05-26   82  
54da6a0924311c Peter Zijlstra 2023-05-26   83  
54da6a0924311c Peter Zijlstra 2023-05-26   84  /*
54da6a0924311c Peter Zijlstra 2023-05-26   85   * DEFINE_CLASS(name, type, exit, init, init_args...):
54da6a0924311c Peter Zijlstra 2023-05-26   86   *	helper to define the destructor and constructor for a type.
54da6a0924311c Peter Zijlstra 2023-05-26   87   *	@exit is an expression using '_T' -- similar to FREE above.
54da6a0924311c Peter Zijlstra 2023-05-26   88   *	@init is an expression in @init_args resulting in @type
54da6a0924311c Peter Zijlstra 2023-05-26   89   *
54da6a0924311c Peter Zijlstra 2023-05-26   90   * EXTEND_CLASS(name, ext, init, init_args...):
54da6a0924311c Peter Zijlstra 2023-05-26   91   *	extends class @name to @name@ext with the new constructor
54da6a0924311c Peter Zijlstra 2023-05-26   92   *
54da6a0924311c Peter Zijlstra 2023-05-26   93   * CLASS(name, var)(args...):
54da6a0924311c Peter Zijlstra 2023-05-26   94   *	declare the variable @var as an instance of the named class
54da6a0924311c Peter Zijlstra 2023-05-26   95   *
54da6a0924311c Peter Zijlstra 2023-05-26   96   * Ex.
54da6a0924311c Peter Zijlstra 2023-05-26   97   *
54da6a0924311c Peter Zijlstra 2023-05-26   98   * DEFINE_CLASS(fdget, struct fd, fdput(_T), fdget(fd), int fd)
54da6a0924311c Peter Zijlstra 2023-05-26   99   *
54da6a0924311c Peter Zijlstra 2023-05-26  100   *	CLASS(fdget, f)(fd);
a825760957e3aa Al Viro        2024-05-31  101   *	if (!fd_file(f))
54da6a0924311c Peter Zijlstra 2023-05-26  102   *		return -EBADF;
54da6a0924311c Peter Zijlstra 2023-05-26  103   *
54da6a0924311c Peter Zijlstra 2023-05-26  104   *	// use 'f' without concern
54da6a0924311c Peter Zijlstra 2023-05-26  105   */
54da6a0924311c Peter Zijlstra 2023-05-26  106  
54da6a0924311c Peter Zijlstra 2023-05-26  107  #define DEFINE_CLASS(_name, _type, _exit, _init, _init_args...)		\
54da6a0924311c Peter Zijlstra 2023-05-26  108  typedef _type class_##_name##_t;					\
54da6a0924311c Peter Zijlstra 2023-05-26  109  static inline void class_##_name##_destructor(_type *p)			\
54da6a0924311c Peter Zijlstra 2023-05-26  110  { _type _T = *p; _exit; }						\
54da6a0924311c Peter Zijlstra 2023-05-26 @111  static inline _type class_##_name##_constructor(_init_args)		\
54da6a0924311c Peter Zijlstra 2023-05-26  112  { _type t = _init; return t; }
54da6a0924311c Peter Zijlstra 2023-05-26  113  

:::::: The code at line 111 was first introduced by commit
:::::: 54da6a0924311c7cf5015533991e44fb8eb12773 locking: Introduce __cleanup() based infrastructure

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
