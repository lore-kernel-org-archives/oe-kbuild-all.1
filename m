Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB34F849C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 03:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748143205; cv=none; b=mLsBiKen1Nes51DXLNK5qSfjJEyUOGF72DTz2UH6SMuBa9i30hyy2dNyW6VSg+x7Z4+ZW/9FHLWuiNSaAnYsjilqryuwW41cOEqKCHz7qTWj//ZWm0TunsFU4y+/I3T9EhqdX1eDnTh/oaSL8E0r5V2nSjYolCHglpDDIFPQGg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748143205; c=relaxed/simple;
	bh=MaivS75AzaDqvuRe8TXKW/cd/L6q+EpQvkw0HYU30qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d0Al27EnaGAv1BU8U7w1P5y0GHDe4Tn2J5icgjbFqXlG55glgU1QGXWwwKk72X3m6yUKxN44NL3Po7C4jLt0nPrYk3Rwx74qp9A+HXbsOBzJ732YJXtOVCePhyBe0KPYVT45UlLOWFaXUVKOc+kaUBacYow8sTB4TGUoEKh6GI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiAdAUFk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiAdAUFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748143204; x=1779679204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MaivS75AzaDqvuRe8TXKW/cd/L6q+EpQvkw0HYU30qo=;
  b=YiAdAUFkRz0EdE7KQETyUGl694Ms421qA0isM26bESLczgl1G2VUq3Gy
   Kv5gdvlXhNQisctGk2EL/olslrcp4ekk17X10TWcLkqAfACXTvWHlnjA+
   qXJKl3pmYvokUWcGFEoPpCIa7i9yOTrh+57GZEbsiF27NZDhuon7idO/G
   5lxnKKeYFrCVFXt3D8yr5IKpjKXpMvbpLG7WB5Vbqs1Ps/9okuApfQ+7b
   YQehbnDh5VmeUKIoWjuWuu4eVwR1rd1STYhQqvH2SM1Vi+NrE2EGkZjni
   T4ogY7F1LFqcGaN5dRxlwEyl46Du6iPul4Es/B9OQe/JRnVUl1boM4J86
   w==;
X-CSE-ConnectionGUID: amG8zT0mTuyw40W8eFwmrw==
X-CSE-MsgGUID: A11cp3YiQz6AQ7JzVAXAow==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50310913"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="50310913"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 20:20:03 -0700
X-CSE-ConnectionGUID: QMqv0iBCRf2ssgnNBRYoZw==
X-CSE-MsgGUID: IS0pDXVvRXmx44791F+iZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="142782365"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 May 2025 20:20:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ1u4-000Raq-1H;
	Sun, 25 May 2025 03:20:00 +0000
Date: Sun, 25 May 2025 11:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:container 12/15] security/keys/container.c:160:52:
 sparse: sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202505251146.ZhAbY3Lx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   e934156b00c64a64a048108513ab445a232c2120
commit: 1b61c8044bc4e4388e4eb1236a1564ed278dd0ba [12/15] containers: Allow a daemon to intercept request_key upcalls in a container
config: arm64-randconfig-r133-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251146.ZhAbY3Lx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250525/202505251146.ZhAbY3Lx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251146.ZhAbY3Lx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/keys/container.c:160:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char const [noderef] __user *_type @@     got char const *_type @@
   security/keys/container.c:160:52: sparse:     expected char const [noderef] __user *_type
   security/keys/container.c:160:52: sparse:     got char const *_type
   security/keys/container.c:132:6: sparse: sparse: symbol 'keyctl_container_intercept' redeclared with different type (incompatible argument 2 (different address spaces)):
   security/keys/container.c:132:6: sparse:    long extern [addressable] [signed] [toplevel] keyctl_container_intercept( ... )
   security/keys/container.c: note: in included file:
   security/keys/internal.h:366:6: sparse: note: previously declared as:
   security/keys/internal.h:366:6: sparse:    long extern [addressable] [signed] [toplevel] keyctl_container_intercept( ... )

vim +160 security/keys/container.c

   127	
   128	/*
   129	 * Add or remove (if dest_keyring==0) a request_key upcall intercept trap upon
   130	 * a container.  If _type points to a string of "*" that matches all types.
   131	 */
   132	long keyctl_container_intercept(int containerfd,
   133					const char *_type,
   134					unsigned int ns_id,
   135					key_serial_t dest_ring_id)
   136	{
   137		struct container *c;
   138		struct fd f;
   139		char type[32] = "";
   140		long ret;
   141	
   142		if (containerfd < 0 || ns_id < 0)
   143			return -EINVAL;
   144		if (dest_ring_id && !_type)
   145			return -EINVAL;
   146	
   147		f = fdget(containerfd);
   148		if (fd_empty(f))
   149			return -EBADF;
   150		ret = -EINVAL;
   151		if (!is_container_file(fd_file(f)))
   152			goto out_fd;
   153	
   154		c = fd_file(f)->private_data;
   155	
   156		/* Find out what type we're dealing with (can be NULL to make removal
   157		 * remove everything).
   158		 */
   159		if (_type) {
 > 160			ret = key_get_type_from_user(type, _type, sizeof(type));
   161			if (ret < 0)
   162				goto out_fd;
   163		}
   164	
   165		/* TODO: Get the namespace to filter on */
   166	
   167		/* We add a filter if a destination keyring has been specified. */
   168		if (dest_ring_id) {
   169			ret = key_create_intercept(c, type, dest_ring_id);
   170		} else {
   171			ret = key_del_intercept(c, _type ? type : NULL);
   172		}
   173	
   174	out_fd:
   175		fdput(f);
   176		return ret;
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
