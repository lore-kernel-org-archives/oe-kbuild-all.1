Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA71316418
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 20:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVl7OUhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705092945; x=1736628945;
  h=date:from:cc:subject:message-id:mime-version;
  bh=et/CjD/ON0di0lt8h+hLNBZrqpGKJ4r2TkiOYIMpFlY=;
  b=FVl7OUhnqkFoxjDZIHoxFhoasCG4GTSgKMwnXtMn9YjvCQOHu1Su8VSJ
   VV8mupSaal132TMEjNNjjMCgfafvrLkUsfUBE9dNv3A/WolOH3+N0GO0k
   dUMjYea9i+zQI9ywjahZg+iT4wYbbx7AaMasnbivLHj4WVZ146AqqJXJd
   zkeQc5Dx/Xe1hJcewQE62uaL1OfehIlIMjKuI4OCpKSbC1Sh8FVKj1dTP
   Jo8q6whzz1OhH34EsGEJ77Pram054XUPvf2GFMtACV0SlhKjlbPBHaBWa
   MAAyuhkUuO6fDzIpYgbO4B3nLOwo5sPh+2ADB/kg/EppC9+dj/qNN4uVv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="430455008"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="430455008"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 12:55:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="31518225"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Jan 2024 12:55:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOOZ2-0009ow-0P;
	Fri, 12 Jan 2024 20:55:40 +0000
Date: Sat, 13 Jan 2024 04:54:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 15688/15708] net/socket.c:586:60:
 error: 'SOCK_OOB' undeclared
Message-ID: <202401130456.HOrRzVVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philippe,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: c36cad6eceb9b8b5ac81ccf043b06f0772c41182 [15688/15708] net: dovetail: enable out-of-band networking (EXPERIMENTAL)
config: mips-gpr_defconfig (https://download.01.org/0day-ci/archive/20240113/202401130456.HOrRzVVT-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401130456.HOrRzVVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401130456.HOrRzVVT-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/socket.c: In function 'sock_map_fd':
>> net/socket.c:586:60: error: 'SOCK_OOB' undeclared (first use in this function)
     586 |                 if (IS_ENABLED(CONFIG_NET_OOB) && (flags & SOCK_OOB)) {
         |                                                            ^~~~~~~~
   net/socket.c:586:60: note: each undeclared identifier is reported only once for each function it appears in
   In file included from <command-line>:
   net/socket.c: In function '__sys_socket_create':
   net/socket.c:1731:22: error: 'SOCK_OOB' undeclared (first use in this function)
    1731 |         BUILD_BUG_ON(SOCK_OOB & SOCK_TYPE_MASK);
         |                      ^~~~~~~~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   net/socket.c:1731:9: note: in expansion of macro 'BUILD_BUG_ON'
    1731 |         BUILD_BUG_ON(SOCK_OOB & SOCK_TYPE_MASK);
         |         ^~~~~~~~~~~~
   net/socket.c: In function '__sys_getsockopt':
   net/socket.c:2410:13: warning: variable 'max_optlen' set but not used [-Wunused-but-set-variable]
    2410 |         int max_optlen;
         |             ^~~~~~~~~~


vim +/SOCK_OOB +586 net/socket.c

   574	
   575	static int sock_map_fd(struct socket *sock, int flags)
   576	{
   577		struct file *newfile;
   578		int fd = get_unused_fd_flags(flags), ret;
   579		if (unlikely(fd < 0)) {
   580			sock_release(sock);
   581			return fd;
   582		}
   583	
   584		newfile = sock_alloc_file(sock, flags, NULL);
   585		if (!IS_ERR(newfile)) {
 > 586			if (IS_ENABLED(CONFIG_NET_OOB) && (flags & SOCK_OOB)) {
   587				ret = sock_oob_attach(sock);
   588				if (ret < 0) {
   589					put_unused_fd(fd);
   590					sock_release(sock);
   591					return ret;
   592				}
   593			}
   594			fd_install(fd, newfile);
   595			return fd;
   596		}
   597	
   598		put_unused_fd(fd);
   599		return PTR_ERR(newfile);
   600	}
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
