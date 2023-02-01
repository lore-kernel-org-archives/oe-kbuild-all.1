Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3477F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675240219; x=1706776219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Zg6LZvOyB8lrRhnYyIo9XuPDFPLU6VwfAzQS2X271c=;
  b=UWfdubKlv+j8MRw8LCVH2fd5DVgENu9L6n9JAKuRXWf4R6RjxtH+ZyqD
   aLEufInLDg3d+4Sl//s35pqScFjQmIZSYwaTt3jdim59amOUJ+z7w6/3E
   aRHrW1S1ZGL/dPbWF/wkoAD8RMJ7U/BVXs0D41xECBk6LN3Z/tenG6F5f
   ECt+Y/7E+ihsh6R9H8aCkgYfFC/WDGOO58qsj6NQyk9GjwSOqCsgftjBb
   9W9sRmrhOy/ifMTxrI43en3utKxq2lJ7c4PiBuJjiJQQ6q/5oN2RJJKPd
   UBDMrNFEYt3WtoNYmxmEOpJzudZQR+fW69c9qlTQ7tCSdw+l7fGolKPqM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="328096754"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="328096754"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 00:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="807480688"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="807480688"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2023 00:30:17 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN8VV-0005GU-08;
	Wed, 01 Feb 2023 08:30:17 +0000
Date: Wed, 1 Feb 2023 16:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [linux-stable-rc:linux-4.19.y 2019/5207]
 include/linux/sunrpc/xdr.h:512:17: error: comparison is always false due to
 limited range of data type
Message-ID: <202302011646.2tnPz17P-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
head:   058f329f30acdec62df56d9f440ea21b42569c20
commit: 3a2789e8ccb4a3e2a631f6817a2d3bb98b8c4fd8 [2019/5207] NFSD: prevent integer overflow on 32 bit systems
config: sparc64-buildonly-randconfig-r001-20230201 (https://download.01.org/0day-ci/archive/20230201/202302011646.2tnPz17P-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=3a2789e8ccb4a3e2a631f6817a2d3bb98b8c4fd8
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-4.19.y
        git checkout 3a2789e8ccb4a3e2a631f6817a2d3bb98b8c4fd8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FRAME_POINTER
   Depends on [n]: DEBUG_KERNEL [=y] && (M68K || UML || SUPERH) || ARCH_WANT_FRAME_POINTERS [=n] || MCOUNT [=n]
   Selected by [y]:
   - LOCKDEP [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && !MIPS && !PPC && !ARM && !S390 && !MICROBLAZE && !ARC && !X86


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
