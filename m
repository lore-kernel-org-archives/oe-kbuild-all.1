Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8040182B6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 10:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689071160; x=1720607160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7btjBme9KoZknGz/HMEspE+7Uerw2TFLoA16ff4Ves=;
  b=nOBcjkNZKI8ln/etFiFpmjROlMhHaF9ysYIoyDDEkAyDG1ZtsFE7/FOM
   1aJa1COfxOY5jIgn7AfOiJCFlNbDAqNpCVVTYxK4lcwspfpPV6ZviqWCk
   EIPuhs75wn8C80XVVRzNWdwdLhRgx5XDmMdxFELtW7XmuvrrxBLC18oUx
   HLmUiNc6WRPjLiJ8mwC0c33pq4XdXXzOrqHdM1fyEE8qmmJZEpNL/y3Gp
   ZtrorQrkyj4E/W6KIcawgGFjdSJyJk5NH0NFEkYVIcXZyB4agCJMpmjhM
   LqhrM0q+F7Qbsj9mbNiVZsf5azn9U5UJ7q+8gjHbDaJXv04NbRPlZZK9i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="354445609"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="354445609"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 03:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="1051733161"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="1051733161"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2023 03:25:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJAZB-0004iN-38;
	Tue, 11 Jul 2023 10:25:57 +0000
Date: Tue, 11 Jul 2023 18:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [stable:linux-4.19.y 2019/6356] include/linux/sunrpc/xdr.h:512:17:
 error: comparison is always false due to limited range of data type
Message-ID: <202307111814.JtWpig7E-lkp@intel.com>
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
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: 3a2789e8ccb4a3e2a631f6817a2d3bb98b8c4fd8 [2019/6356] NFSD: prevent integer overflow on 32 bit systems
config: sparc64-randconfig-r072-20230710 (https://download.01.org/0day-ci/archive/20230711/202307111814.JtWpig7E-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111814.JtWpig7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111814.JtWpig7E-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
