Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748528F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 01:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723338982; cv=none; b=DQ1rA+z8EPXLpXi4NeSqDpnnhRQkJ1qkM+p3VYgQsyKHsq0D6nbmZgzBCUpb90D5yPjdrPD7RpbF7crsGrrWtvOKPN0yboEO07yw1aORvYUl5vw9gi0jJnrBtz7Yd/z8Tmw74VvOHWaMZcCgew9xc5oyUu5ro/HjpqK6E0I+FcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723338982; c=relaxed/simple;
	bh=wMbOYePXV3t17lqS0AZoPNMtHpgpAJzx6zAziCzK5hw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJZRFCxE7nvOr0bZZL2tV+ynfpL/IdhvGBHsJLfQQw8gY/aM8v/nDqMLnKaGQyg5j28muB/TXnw3zFCCeIdr6/aQ+eHf8s+dC5r7Mz638yN8PEPwY+pBZS6XcCBf65DYqzmFXW6W5Rw+8S9+uKJkMUbMNl7NYzWzUzYRvRHsfds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dn4ndOHE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dn4ndOHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723338980; x=1754874980;
  h=date:from:cc:subject:message-id:mime-version;
  bh=wMbOYePXV3t17lqS0AZoPNMtHpgpAJzx6zAziCzK5hw=;
  b=Dn4ndOHEMVmJzbiqo6Fx7sj7a+3DDoq9DXhcR+NF2crbZFJb+qzaQy9P
   6fFIKyCa05JpLU3uMBxHB2WMgq6MSqFJm+SglgmvmXcPSiSvH2nc7f1DX
   pshJymsI019jfX6rrcYpWbTIPCty3DRPh5wG5WcJRMR2U+4zYURoV0k1t
   qVMTTPTfKckUgcMwoUUVEAGMKK+sBYXbHMKcVuKdRQ7E6sDUy7U4utfXY
   /ifj6Uink4D4LQOyhB1Keb12YzNtjJ5uIk84hYpUVNn0OZdHq30axnic4
   6aUt6s85KONiUkOTWMn3/+VUnTOpJuoDdjcgbpIHADFmrb9jlArpPsTP5
   A==;
X-CSE-ConnectionGUID: 3K7f7wy6Rc+GnfE8GrPbMA==
X-CSE-MsgGUID: wCAnRwoEQZWcjbUvfJ0dLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="25274848"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="25274848"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 18:16:19 -0700
X-CSE-ConnectionGUID: hqL2pOROR4KY1RwCi6anPw==
X-CSE-MsgGUID: 3+GOPHhBSzKLxQ8vaKQ0NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="62584104"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 10 Aug 2024 18:16:18 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scxBw-000ASO-0V
	for oe-kbuild-all@lists.linux.dev;
	Sun, 11 Aug 2024 01:16:16 +0000
Date: Sun, 11 Aug 2024 09:15:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/dovetail-xenomai 3737/9574] net/socket.c:591:46:
 error: use of undeclared identifier 'SOCK_OOB'
Message-ID: <202408110944.lkS9qQ7P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/dovetail-xenomai
head:   c2530fc7095f682dd411b807a75445d3ff3b0d7c
commit: 738c5fc1b7348378193f5ae7e16781fe5890969f [3737/9574] net: dovetail: enable out-of-band networking (EXPERIMENTAL)
config: mips-ath25_defconfig (https://download.01.org/0day-ci/archive/20240811/202408110944.lkS9qQ7P-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110944.lkS9qQ7P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408110944.lkS9qQ7P-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/socket.c:55:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2178:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/socket.c:591:46: error: use of undeclared identifier 'SOCK_OOB'
     591 |                 if (IS_ENABLED(CONFIG_NET_OOB) && (flags & SOCK_OOB)) {
         |                                                            ^
   net/socket.c:1765:15: error: use of undeclared identifier 'SOCK_OOB'
    1765 |         BUILD_BUG_ON(SOCK_OOB & SOCK_TYPE_MASK);
         |                      ^
   net/socket.c:1767:66: error: use of undeclared identifier 'SOCK_OOB'
    1767 |         if ((type & ~SOCK_TYPE_MASK) & ~(SOCK_CLOEXEC | SOCK_NONBLOCK | SOCK_OOB))
         |                                                                         ^
   1 warning and 3 errors generated.


vim +/SOCK_OOB +591 net/socket.c

   579	
   580	static int sock_map_fd(struct socket *sock, int flags)
   581	{
   582		struct file *newfile;
   583		int fd = get_unused_fd_flags(flags), ret;
   584		if (unlikely(fd < 0)) {
   585			sock_release(sock);
   586			return fd;
   587		}
   588	
   589		newfile = sock_alloc_file(sock, flags, NULL);
   590		if (!IS_ERR(newfile)) {
 > 591			if (IS_ENABLED(CONFIG_NET_OOB) && (flags & SOCK_OOB)) {
   592				ret = sock_oob_attach(sock);
   593				if (ret < 0) {
   594					put_unused_fd(fd);
   595					sock_release(sock);
   596					return ret;
   597				}
   598			}
   599			fd_install(fd, newfile);
   600			return fd;
   601		}
   602	
   603		put_unused_fd(fd);
   604		return PTR_ERR(newfile);
   605	}
   606	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
