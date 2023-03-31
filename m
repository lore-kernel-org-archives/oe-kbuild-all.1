Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422F923DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 11:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680261816; x=1711797816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aoOsKBf/z+1A2Pgrp9n8wO3N1SvoP3rabufF19GYYGE=;
  b=n8OWKrQuro6xAdmcevDOkp1F8UIimVPJK8A1fz9AIY+Iaud2UeBiWJkF
   Taw8UJZ53kWLB+DBlEZk324Mtvj8J2CQedEM48T3pc3fVMSN1GLvcWDik
   0ERODwv7efleZFN56H8JC7dIYitHPI+cAHvJHjX4s8ZoKqcI3Ao8sYyax
   8U0zxh0uZktNSoJgtOFhfajReWqW+7+6uuSgW5UvfJyUkKLdhW7Bb4Lg6
   bwitLfijCzf7M7dG5MzUZV6fgxpIz+DIK+SOB2i8xvXJASp8Q3+YNYGJv
   +88xxhkSZQFXCE61Xk55TJNF1E/eG1ypswDQ+K7Atvp2q+bM4OqjCUa+g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="341440059"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="341440059"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 04:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="749600373"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="749600373"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2023 04:23:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piCqz-000LiU-06;
	Fri, 31 Mar 2023 11:23:33 +0000
Date: Fri, 31 Mar 2023 19:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [stable:linux-4.19.y 2019/5654] include/linux/sunrpc/xdr.h:512:17:
 error: comparison is always false due to limited range of data type
Message-ID: <202303311952.DALCU0Cc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   30baa0923a27fb9a04444a29562344e0573992e4
commit: 3a2789e8ccb4a3e2a631f6817a2d3bb98b8c4fd8 [2019/5654] NFSD: prevent integer overflow on 32 bit systems
config: sparc64-allnoconfig (https://download.01.org/0day-ci/archive/20230331/202303311952.DALCU0Cc-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=3a2789e8ccb4a3e2a631f6817a2d3bb98b8c4fd8
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 3a2789e8ccb4a3e2a631f6817a2d3bb98b8c4fd8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 SHELL=/bin/bash arch/sparc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303311952.DALCU0Cc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sunrpc/sched.h:19,
                    from include/linux/sunrpc/auth.h:15,
                    from include/linux/nfs_fs.h:31,
                    from arch/sparc/kernel/sys_sparc32.c:25:
   include/linux/sunrpc/xdr.h: In function 'xdr_stream_decode_uint32_array':
>> include/linux/sunrpc/xdr.h:512:17: error: comparison is always false due to limited range of data type [-Werror=type-limits]
     512 |         if (len > SIZE_MAX / sizeof(*p))
         |                 ^
   In file included from include/linux/ethtool.h:17,
                    from include/linux/netdevice.h:41,
                    from include/net/sock.h:51,
                    from include/linux/tcp.h:23,
                    from include/linux/ipv6.h:87,
                    from include/net/ipv6.h:16,
                    from include/linux/sunrpc/clnt.h:28,
                    from include/linux/nfs_fs.h:32:
   include/linux/compat.h: In function 'put_compat_sigset':
   include/linux/compat.h:495:58: error: this statement may fall through [-Werror=implicit-fallthrough=]
     495 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ~~~~~~~~~^~~~~~~~~~~~~
   include/linux/compat.h:496:9: note: here
     496 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |         ^~~~
   include/linux/compat.h:496:58: error: this statement may fall through [-Werror=implicit-fallthrough=]
     496 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ~~~~~~~~~^~~~~~~~~~~~~
   include/linux/compat.h:497:9: note: here
     497 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |         ^~~~
   include/linux/compat.h:497:58: error: this statement may fall through [-Werror=implicit-fallthrough=]
     497 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ~~~~~~~~~^~~~~~~~~~~~~
   include/linux/compat.h:498:9: note: here
     498 |         case 1: v.sig[1] = (set->sig[0] >> 32); v.sig[0] = set->sig[0];
         |         ^~~~
   cc1: all warnings being treated as errors


vim +512 include/linux/sunrpc/xdr.h

   490	
   491	/**
   492	 * xdr_stream_decode_uint32_array - Decode variable length array of integers
   493	 * @xdr: pointer to xdr_stream
   494	 * @array: location to store the integer array or NULL
   495	 * @array_size: number of elements to store
   496	 *
   497	 * Return values:
   498	 *   On success, returns number of elements stored in @array
   499	 *   %-EBADMSG on XDR buffer overflow
   500	 *   %-EMSGSIZE if the size of the array exceeds @array_size
   501	 */
   502	static inline ssize_t
   503	xdr_stream_decode_uint32_array(struct xdr_stream *xdr,
   504			__u32 *array, size_t array_size)
   505	{
   506		__be32 *p;
   507		__u32 len;
   508		ssize_t retval;
   509	
   510		if (unlikely(xdr_stream_decode_u32(xdr, &len) < 0))
   511			return -EBADMSG;
 > 512		if (len > SIZE_MAX / sizeof(*p))
   513			return -EBADMSG;
   514		p = xdr_inline_decode(xdr, len * sizeof(*p));
   515		if (unlikely(!p))
   516			return -EBADMSG;
   517		if (array == NULL)
   518			return len;
   519		if (len <= array_size) {
   520			if (len < array_size)
   521				memset(array+len, 0, (array_size-len)*sizeof(*array));
   522			array_size = len;
   523			retval = len;
   524		} else
   525			retval = -EMSGSIZE;
   526		for (; array_size > 0; p++, array++, array_size--)
   527			*array = be32_to_cpup(p);
   528		return retval;
   529	}
   530	#endif /* __KERNEL__ */
   531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
