Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1045928EB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 21:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688335192; x=1719871192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AEcombl6k/BFE+sAUrDXIhP7pecEHMrBXpubAhrSxkw=;
  b=CBR3sNDfd09LfR87a+yNP52KDF0dyHDnLxP9Zl28jZdwqd9l9VfCfDux
   7umPC5w1QGZyu7gHK8vc9cf4TaWpdNSNYj78ZRCfqTZPIHnlBqKtOLsYT
   yCR0gv978hHQkCttMxUQT2ZjkONFV6mnJ1DQ6ZNCf8bXhLnXut3tCfeDb
   sGnvjOLoQLwgnguq/J05OjSK30AUfe3z15lbur1T4wG/SPWKNRShlWtTi
   cq9WBQmSLHYqRqOD6dsUSzzqkxiAtMwuBypkX3za9s8Oba9BRpMcTBEXy
   iHtj45WQ3LbL0KvG78ns5ciT7ZT1o04V8ElpIjexcyIIDtZsRn3WKnAsm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="393486284"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="393486284"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 14:59:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="747966459"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="747966459"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Jul 2023 14:59:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qG56i-000Gtn-1e;
	Sun, 02 Jul 2023 21:59:48 +0000
Date: Mon, 3 Jul 2023 05:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:start-write-safe 3/5] fs/nfsd/vfs.c:1031:13: error: call
 to undeclared function 'file_access_permission'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202307030533.JzRuE4Ev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux start-write-safe
head:   a5282aa7e38bc78059dd397d3313f16cebc97168
commit: 7c555d357bf6cd0c111b63caf1299d747f9f028b [3/5] splice: move permission hook out of splice_direct_to_actor()
config: s390-randconfig-r044-20230703 (https://download.01.org/0day-ci/archive/20230703/202307030533.JzRuE4Ev-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307030533.JzRuE4Ev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307030533.JzRuE4Ev-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/vfs.c:28:
   In file included from include/linux/ima.h:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/nfsd/vfs.c:28:
   In file included from include/linux/ima.h:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/nfsd/vfs.c:28:
   In file included from include/linux/ima.h:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from fs/nfsd/vfs.c:36:
   In file included from fs/nfsd/xdr3.h:11:
   In file included from fs/nfsd/xdr.h:8:
   In file included from fs/nfsd/nfsd.h:19:
   In file included from include/linux/sunrpc/svc.h:17:
   include/linux/sunrpc/xdr.h:778:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     778 |         if (len > SIZE_MAX / sizeof(*p))
         |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/vfs.c:1031:13: error: call to undeclared function 'file_access_permission'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1031 |         host_err = file_access_permission(file, MAY_READ);
         |                    ^
   fs/nfsd/vfs.c:1031:13: note: did you mean 'file_permission'?
   include/linux/fs.h:2519:19: note: 'file_permission' declared here
    2519 | static inline int file_permission(struct file *file, int mask)
         |                   ^
   13 warnings and 1 error generated.


vim +/file_access_permission +1031 fs/nfsd/vfs.c

  1005	
  1006	/**
  1007	 * nfsd_splice_read - Perform a VFS read using a splice pipe
  1008	 * @rqstp: RPC transaction context
  1009	 * @fhp: file handle of file to be read
  1010	 * @file: opened struct file of file to be read
  1011	 * @offset: starting byte offset
  1012	 * @count: IN: requested number of bytes; OUT: number of bytes read
  1013	 * @eof: OUT: set non-zero if operation reached the end of the file
  1014	 *
  1015	 * Returns nfs_ok on success, otherwise an nfserr stat value is
  1016	 * returned.
  1017	 */
  1018	__be32 nfsd_splice_read(struct svc_rqst *rqstp, struct svc_fh *fhp,
  1019				struct file *file, loff_t offset, unsigned long *count,
  1020				u32 *eof)
  1021	{
  1022		struct splice_desc sd = {
  1023			.len		= 0,
  1024			.total_len	= *count,
  1025			.pos		= offset,
  1026			.u.data		= rqstp,
  1027		};
  1028		ssize_t host_err;
  1029	
  1030		trace_nfsd_read_splice(rqstp, fhp, offset, *count);
> 1031		host_err = file_access_permission(file, MAY_READ);
  1032		if (!host_err)
  1033			host_err = splice_direct_to_actor(file, &sd,
  1034							  nfsd_direct_splice_actor);
  1035		return nfsd_finish_read(rqstp, fhp, file, offset, count, eof, host_err);
  1036	}
  1037	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
