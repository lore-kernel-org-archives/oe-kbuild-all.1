Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1A527442
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 04:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778733701; cv=none; b=djS2Vb9WMhc6H5Ppp4liBV5NFWoHRPtkL/lxx+R2Eht+phcZFH6oAdhHF2X2S+Zl6dq3ZC8lH61eWG3jlT9VrggPsX3rmkjfxvC3Zfr1AGwcpG664lnn2EUr7ebGX1rQ6YVK4n0cN55ZSl65HxPKfgEIbHzKo0i3ECjOD+dGKKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778733701; c=relaxed/simple;
	bh=SIQAKDme8AKDKNm/auAhtCi1lpDzXKz3yaBFORLPVOM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UC7dHVuJ98ui1mSofZaHk2PphH/8nGcLt66eTXzlDQLQUUNnCPuZQsdrI3rpaCXtAyL8A8x9omBZr6qZxNmKyTB51CcnvVk/Osc0cr1UkFG54v8oXbR2L2Ji9Nn/Ssm6jb9NHJO2C4PdxTTIhSqwLGOl11lqgtECu9wwrR73a/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTSEIGUW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTSEIGUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778733700; x=1810269700;
  h=date:from:to:cc:subject:message-id;
  bh=SIQAKDme8AKDKNm/auAhtCi1lpDzXKz3yaBFORLPVOM=;
  b=RTSEIGUWRTXyd6pBEYJTwtHg3IOZ3PHb8ELzQLeOT3oDSVPmD+6e2ThF
   1k9j08+8kbpAL1GQqenIPTU1/tkl/LPN73sisI3AkWkYR9J+nPEGKLuXY
   FPwxRrD36PgIlWqIlMQCP8S35zUQvtOlobF025iMUPAGG9SQvgJkVf+ZK
   73bwxQJcFL3GG1IGo+T50OSg4ZBC6AQ6v4P81fiIrdHwUUAH7bFBalpWq
   xRu7a5EnsfnggO6lIge6cHbEZhd6z5cItt4XNArjL+O7kkGLiZ4weupZ2
   TBKK1lolCPEoM4Bv7KhWurKLwDQnVZ0HYmqFvMuaBmbR8pLQQn2QXMoGL
   w==;
X-CSE-ConnectionGUID: InJjd4zsT1moiu7xLevGYQ==
X-CSE-MsgGUID: CJozhamNQBy1Efz5obKT7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79624252"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79624252"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 21:41:40 -0700
X-CSE-ConnectionGUID: 0gZMZNNER2y60gfPn3vTNA==
X-CSE-MsgGUID: wUA78y/uQMOfhuaFaUR68A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="234004007"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2026 21:41:37 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNNt9-000000005pj-02RW;
	Thu, 14 May 2026 04:41:35 +0000
Date: Thu, 14 May 2026 12:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>
Subject: arch/um/drivers/vector_user.c:184:27: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202605141207.Cy94BJGe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: b555cb66583e99158cfef8e91c025252cefae55b um: vector: Eliminate the dependency on uml_net
date:   1 year ago
config: um-randconfig-r111-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141207.Cy94BJGe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141207.Cy94BJGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b555cb66583e ("um: vector: Eliminate the dependency on uml_net")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141207.Cy94BJGe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/um/drivers/vector_user.c:184:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [assigned] [usertype] sll_protocol @@     got unsigned short @@
   arch/um/drivers/vector_user.c:184:27: sparse:     expected restricted __be16 [assigned] [usertype] sll_protocol
   arch/um/drivers/vector_user.c:184:27: sparse:     got unsigned short
>> arch/um/drivers/vector_user.c:828:9: sparse: sparse: Using plain integer as NULL pointer
   arch/um/drivers/vector_user.c:908:24: sparse: sparse: Using plain integer as NULL pointer

vim +184 arch/um/drivers/vector_user.c

b3b8ca2a1b63713 Anton Ivanov 2019-08-09  163  
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  164  static int create_raw_fd(char *iface, int flags, int proto)
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  165  {
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  166  	struct ifreq ifr;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  167  	int fd = -1;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  168  	struct sockaddr_ll sock;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  169  	int err = -ENOMEM;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  170  
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  171  	fd = socket(AF_PACKET, SOCK_RAW, flags);
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  172  	if (fd == -1) {
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  173  		err = -errno;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  174  		goto raw_fd_cleanup;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  175  	}
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  176  	memset(&ifr, 0, sizeof(ifr));
1e06589843632af Kees Cook    2024-02-02  177  	strscpy(ifr.ifr_name, iface);
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  178  	if (ioctl(fd, SIOCGIFINDEX, (void *) &ifr) < 0) {
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  179  		err = -errno;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  180  		goto raw_fd_cleanup;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  181  	}
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  182  
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  183  	sock.sll_family = AF_PACKET;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09 @184  	sock.sll_protocol = htons(proto);
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  185  	sock.sll_ifindex = ifr.ifr_ifindex;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  186  
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  187  	if (bind(fd,
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  188  		(struct sockaddr *) &sock, sizeof(struct sockaddr_ll)) < 0) {
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  189  		err = -errno;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  190  		goto raw_fd_cleanup;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  191  	}
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  192  	return fd;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  193  raw_fd_cleanup:
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  194  	printk(UM_KERN_ERR "user_init_raw: init failed, error %d", err);
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  195  	if (fd >= 0)
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  196  		os_close_file(fd);
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  197  	return err;
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  198  }
b3b8ca2a1b63713 Anton Ivanov 2019-08-09  199  

:::::: The code at line 184 was first introduced by commit
:::::: b3b8ca2a1b63713f59e8d7ad772b09bcd8dc9048 um: Add legacy tap support and rename existing vector to hybrid

:::::: TO: Anton Ivanov <anton.ivanov@cambridgegreys.com>
:::::: CC: Richard Weinberger <richard@nod.at>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
