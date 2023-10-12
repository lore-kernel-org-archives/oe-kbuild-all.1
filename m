Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0C3DDB6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gd1/BTId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697104604; x=1728640604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hYqDE+6pDGNDJft9QdrjQ+976+FyQ9v8TPruEH5ULEE=;
  b=Gd1/BTIdvy/gUB7Qlb+UnrXbuBA21NjaqCdOd8O4UnjARcxf4HJrhN2f
   bfLDxKeSrVz0SZ3RMGk2d1xFePfcrrcxivWmg+RdrlKbUOktd9BqFoJdr
   iCQLgMZWvD5b5LvF3vbWBP0rIrg2VGAbrVEnuuyFXITZkkkS7QUCjOjpZ
   HZ/u5qYZlbWj/N1F8hrDugTSnCobCV0ffcYYoyK2LnjCwpzcbClc4h5OM
   +K5oPoPntuZXyVLBO20UFjtnEZLzUl0KX/J2YICvFH3IaTqxGXJNmjFlS
   1RYnz5xESLcS1EGFFeQ7N1uU4CfsXT33IdZwbSFebVxRI+vNA0jkdeNYA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3473973"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="3473973"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 02:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="754191060"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="754191060"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Oct 2023 02:56:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqsQo-0003MT-2g;
	Thu, 12 Oct 2023 09:56:38 +0000
Date: Thu, 12 Oct 2023 17:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daan De Meyer <daan.j.demeyer@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@kernel.org>
Subject: [bpf-next:master 6/13] net/core/filter.c:11773:17: warning: no
 previous declaration for 'bpf_sock_addr_set_sun_path'
Message-ID: <202310121712.SMfVJDGT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   d2dc885b8c9ddb6fc374d93a87f8f2d1b97d2caf
commit: 53e380d21441909b12b6e0782b77187ae4b971c4 [6/13] bpf: Add bpf_sock_addr_set_sun_path() to allow writing unix sockaddr from bpf
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20231012/202310121712.SMfVJDGT-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310121712.SMfVJDGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121712.SMfVJDGT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/filter.c:11747:17: warning: no previous declaration for 'bpf_dynptr_from_skb' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_from_skb(struct sk_buff *skb, u64 flags,
                    ^~~~~~~~~~~~~~~~~~~
   net/core/filter.c:11760:17: warning: no previous declaration for 'bpf_dynptr_from_xdp' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_from_xdp(struct xdp_buff *xdp, u64 flags,
                    ^~~~~~~~~~~~~~~~~~~
>> net/core/filter.c:11773:17: warning: no previous declaration for 'bpf_sock_addr_set_sun_path' [-Wmissing-declarations]
    __bpf_kfunc int bpf_sock_addr_set_sun_path(struct bpf_sock_addr_kern *sa_kern,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/filter.c:11877:17: warning: no previous declaration for 'bpf_sock_destroy' [-Wmissing-declarations]
    __bpf_kfunc int bpf_sock_destroy(struct sock_common *sock)
                    ^~~~~~~~~~~~~~~~


vim +/bpf_sock_addr_set_sun_path +11773 net/core/filter.c

 11772	
 11773	__bpf_kfunc int bpf_sock_addr_set_sun_path(struct bpf_sock_addr_kern *sa_kern,
 11774						   const u8 *sun_path, u32 sun_path__sz)
 11775	{
 11776		struct sockaddr_un *un;
 11777	
 11778		if (sa_kern->sk->sk_family != AF_UNIX)
 11779			return -EINVAL;
 11780	
 11781		/* We do not allow changing the address to unnamed or larger than the
 11782		 * maximum allowed address size for a unix sockaddr.
 11783		 */
 11784		if (sun_path__sz == 0 || sun_path__sz > UNIX_PATH_MAX)
 11785			return -EINVAL;
 11786	
 11787		un = (struct sockaddr_un *)sa_kern->uaddr;
 11788		memcpy(un->sun_path, sun_path, sun_path__sz);
 11789		sa_kern->uaddrlen = offsetof(struct sockaddr_un, sun_path) + sun_path__sz;
 11790	
 11791		return 0;
 11792	}
 11793	__diag_pop();
 11794	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
