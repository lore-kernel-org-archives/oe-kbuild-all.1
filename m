Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B324E26F280
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 19:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763407305; cv=none; b=p0cKREZoxNH5YXihRIterXpWMbemefy9Pwe08H9oJZzZt8LxubYEVpO68W+Ou4AX+IM/lEnQk+QNiJKTb86DB8PFlldjsklq7Ehjhx3N7sEZ/8m89WF7lqtpiNHD7QhRdMaAuLwpKoO09YfnbXdIfcLT4hk4GX/C7zgF63Qv/KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763407305; c=relaxed/simple;
	bh=ZV7Cs0DI2DlTXfsz0wRkqFK9Ni9W+NBKj7F//sGhNFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SS/s1M1I2jgzFDOhBCOUQyDoaOSe53zaPpqddh3sYGFYOSgHuyRLgiM9L2N1KWUzWOQz10jIZqTiLxWhyrgJLyYMwSoYsz8ePrVKNT7a090A0mTxLe12f+lYyT4CkMLoOUwsnEfxZmrT5/GDVu1/LEJe2jIoFMewpeXmuMnyrK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYX4+FB2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYX4+FB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763407304; x=1794943304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZV7Cs0DI2DlTXfsz0wRkqFK9Ni9W+NBKj7F//sGhNFo=;
  b=gYX4+FB2hbIse9RRSn/ScAHD0a6JOIhoLoj+WmPvt9JmGUsB4VIKyzNS
   TAToWOGShCOdBN1CUemgrx8TNRYzDwSb9wS/CSaBgCW23PMiHkLIMTM1X
   LCMWPMfazczQ4VJGvI5DMG4kll2Sd0xntV2J2t52xRiDm3VGH4LE+1inO
   TiQkUX5/Jaa1oXrAR+iq3Pt6AegnqGeqidT9iGQ5fRid7ttQ4euRHsBol
   iQzvAFG1ewz+BvpQQCeXpMXnr232Y6sKmj43B/Rqmr9HSl3mzCxvs3Hej
   ziGFJfOBksqzDcaW8F6vCAxOy2dMtjTLdYQHBggRAAirpjq2M9E2OJg4s
   g==;
X-CSE-ConnectionGUID: 1OvhTPigRMOaGn+JTQzO+g==
X-CSE-MsgGUID: K82XBdRUS/iZg8iy9XgA2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65320263"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="65320263"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 11:21:43 -0800
X-CSE-ConnectionGUID: cBi7m3w7TKa03cGUkzajwg==
X-CSE-MsgGUID: AIiI9tnXQjOhAjTBSGlX5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="190685339"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2025 11:21:42 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL4nD-0000zT-0u;
	Mon, 17 Nov 2025 19:21:39 +0000
Date: Tue, 18 Nov 2025 03:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 43/55] include/uapi/linux/nfs3.h:13:33: error:
 expected identifier before numeric constant
Message-ID: <202511180306.2ShakweT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   6158ace3b663c4e9ab201f2cc644f4290fa30905
commit: ed8ca4fd1c9467f1ad1069cc0f0d9620a95ab900 [43/55] NFSD: Replace nfs3.h with nfs3xdr_gen.h
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20251118/202511180306.2ShakweT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180306.2ShakweT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180306.2ShakweT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/nfs3.h:8,
                    from include/linux/nfs_fs.h:40,
                    from fs/nfsd/localio.c:17:
>> include/uapi/linux/nfs3.h:13:33: error: expected identifier before numeric constant
      13 | #define NFS3_FHSIZE             64
         |                                 ^~
   include/linux/sunrpc/xdrgen/nfs3.h:12:8: note: in expansion of macro 'NFS3_FHSIZE'
      12 | enum { NFS3_FHSIZE = 64 };
         |        ^~~~~~~~~~~
   include/uapi/linux/nfs3.h:16:33: error: expected identifier before numeric constant
      16 | #define NFS3_COOKIEVERFSIZE     8
         |                                 ^
   include/linux/sunrpc/xdrgen/nfs3.h:14:8: note: in expansion of macro 'NFS3_COOKIEVERFSIZE'
      14 | enum { NFS3_COOKIEVERFSIZE = 8 };
         |        ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/nfs3.h:15:33: error: expected identifier before numeric constant
      15 | #define NFS3_CREATEVERFSIZE     8
         |                                 ^
   include/linux/sunrpc/xdrgen/nfs3.h:16:8: note: in expansion of macro 'NFS3_CREATEVERFSIZE'
      16 | enum { NFS3_CREATEVERFSIZE = 8 };
         |        ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/nfs3.h:17:33: error: expected identifier before numeric constant
      17 | #define NFS3_WRITEVERFSIZE      8
         |                                 ^
   include/linux/sunrpc/xdrgen/nfs3.h:18:8: note: in expansion of macro 'NFS3_WRITEVERFSIZE'
      18 | enum { NFS3_WRITEVERFSIZE = 8 };
         |        ^~~~~~~~~~~~~~~~~~
   In file included from fs/nfsd/nfs3xdr_gen.h:14,
                    from fs/nfsd/nfsd.h:23,
                    from fs/nfsd/localio.c:21:
>> include/linux/sunrpc/xdrgen/nfs3.h:88:9: error: redeclaration of enumerator 'NF3REG'
      88 |         NF3REG = 1,
         |         ^~~~~~
   include/uapi/linux/nfs3.h:56:9: note: previous definition of 'NF3REG' with type 'enum nfs3_ftype'
      56 |         NF3REG  = 1,
         |         ^~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:89:9: error: redeclaration of enumerator 'NF3DIR'
      89 |         NF3DIR = 2,
         |         ^~~~~~
   include/uapi/linux/nfs3.h:57:9: note: previous definition of 'NF3DIR' with type 'enum nfs3_ftype'
      57 |         NF3DIR  = 2,
         |         ^~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:90:9: error: redeclaration of enumerator 'NF3BLK'
      90 |         NF3BLK = 3,
         |         ^~~~~~
   include/uapi/linux/nfs3.h:58:9: note: previous definition of 'NF3BLK' with type 'enum nfs3_ftype'
      58 |         NF3BLK  = 3,
         |         ^~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:91:9: error: redeclaration of enumerator 'NF3CHR'
      91 |         NF3CHR = 4,
         |         ^~~~~~
   include/uapi/linux/nfs3.h:59:9: note: previous definition of 'NF3CHR' with type 'enum nfs3_ftype'
      59 |         NF3CHR  = 4,
         |         ^~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:92:9: error: redeclaration of enumerator 'NF3LNK'
      92 |         NF3LNK = 5,
         |         ^~~~~~
   include/uapi/linux/nfs3.h:60:9: note: previous definition of 'NF3LNK' with type 'enum nfs3_ftype'
      60 |         NF3LNK  = 5,
         |         ^~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:93:9: error: redeclaration of enumerator 'NF3SOCK'
      93 |         NF3SOCK = 6,
         |         ^~~~~~~
   include/uapi/linux/nfs3.h:61:9: note: previous definition of 'NF3SOCK' with type 'enum nfs3_ftype'
      61 |         NF3SOCK = 6,
         |         ^~~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:94:9: error: redeclaration of enumerator 'NF3FIFO'
      94 |         NF3FIFO = 7,
         |         ^~~~~~~
   include/uapi/linux/nfs3.h:62:9: note: previous definition of 'NF3FIFO' with type 'enum nfs3_ftype'
      62 |         NF3FIFO = 7,    /* changed from NFSv2 (was 8) */
         |         ^~~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:161:9: error: redeclaration of enumerator 'DONT_CHANGE'
     161 |         DONT_CHANGE = 0,
         |         ^~~~~~~~~~~
   include/uapi/linux/nfs3.h:67:9: note: previous definition of 'DONT_CHANGE' with type 'enum nfs3_time_how'
      67 |         DONT_CHANGE             = 0,
         |         ^~~~~~~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:162:9: error: redeclaration of enumerator 'SET_TO_SERVER_TIME'
     162 |         SET_TO_SERVER_TIME = 1,
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/nfs3.h:68:9: note: previous definition of 'SET_TO_SERVER_TIME' with type 'enum nfs3_time_how'
      68 |         SET_TO_SERVER_TIME      = 1,
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:163:9: error: redeclaration of enumerator 'SET_TO_CLIENT_TIME'
     163 |         SET_TO_CLIENT_TIME = 2,
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/nfs3.h:69:9: note: previous definition of 'SET_TO_CLIENT_TIME' with type 'enum nfs3_time_how'
      69 |         SET_TO_CLIENT_TIME      = 2,
         |         ^~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsd.h:55:9: warning: 'NFS3_FSF_DEFAULT' redefined
      55 | #define NFS3_FSF_DEFAULT                0x001f
         |         ^~~~~~~~~~~~~~~~
   include/uapi/linux/nfs3.h:50:9: note: this is the location of the previous definition
      50 | #define NFS3_FSF_DEFAULT        0x001B
         |         ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/nfs3.h:8,
                    from include/linux/nfs_fs.h:40,
                    from localio.c:17:
>> include/uapi/linux/nfs3.h:13:33: error: expected identifier before numeric constant
      13 | #define NFS3_FHSIZE             64
         |                                 ^~
   include/linux/sunrpc/xdrgen/nfs3.h:12:8: note: in expansion of macro 'NFS3_FHSIZE'
      12 | enum { NFS3_FHSIZE = 64 };
         |        ^~~~~~~~~~~
   include/uapi/linux/nfs3.h:16:33: error: expected identifier before numeric constant
      16 | #define NFS3_COOKIEVERFSIZE     8
         |                                 ^
   include/linux/sunrpc/xdrgen/nfs3.h:14:8: note: in expansion of macro 'NFS3_COOKIEVERFSIZE'
      14 | enum { NFS3_COOKIEVERFSIZE = 8 };
         |        ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/nfs3.h:15:33: error: expected identifier before numeric constant
      15 | #define NFS3_CREATEVERFSIZE     8
         |                                 ^
   include/linux/sunrpc/xdrgen/nfs3.h:16:8: note: in expansion of macro 'NFS3_CREATEVERFSIZE'
      16 | enum { NFS3_CREATEVERFSIZE = 8 };
         |        ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/nfs3.h:17:33: error: expected identifier before numeric constant
      17 | #define NFS3_WRITEVERFSIZE      8
         |                                 ^
   include/linux/sunrpc/xdrgen/nfs3.h:18:8: note: in expansion of macro 'NFS3_WRITEVERFSIZE'
      18 | enum { NFS3_WRITEVERFSIZE = 8 };
         |        ^~~~~~~~~~~~~~~~~~
   In file included from nfs3xdr_gen.h:14,
                    from nfsd.h:23,
                    from localio.c:21:
>> include/linux/sunrpc/xdrgen/nfs3.h:88:9: error: redeclaration of enumerator 'NF3REG'
      88 |         NF3REG = 1,
         |         ^~~~~~
   include/uapi/linux/nfs3.h:56:9: note: previous definition of 'NF3REG' with type 'enum nfs3_ftype'
      56 |         NF3REG  = 1,
         |         ^~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:89:9: error: redeclaration of enumerator 'NF3DIR'
      89 |         NF3DIR = 2,
         |         ^~~~~~
   include/uapi/linux/nfs3.h:57:9: note: previous definition of 'NF3DIR' with type 'enum nfs3_ftype'
      57 |         NF3DIR  = 2,
         |         ^~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:90:9: error: redeclaration of enumerator 'NF3BLK'
      90 |         NF3BLK = 3,
         |         ^~~~~~
   include/uapi/linux/nfs3.h:58:9: note: previous definition of 'NF3BLK' with type 'enum nfs3_ftype'
      58 |         NF3BLK  = 3,
         |         ^~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:91:9: error: redeclaration of enumerator 'NF3CHR'
      91 |         NF3CHR = 4,
         |         ^~~~~~
   include/uapi/linux/nfs3.h:59:9: note: previous definition of 'NF3CHR' with type 'enum nfs3_ftype'
      59 |         NF3CHR  = 4,
         |         ^~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:92:9: error: redeclaration of enumerator 'NF3LNK'
      92 |         NF3LNK = 5,
         |         ^~~~~~
   include/uapi/linux/nfs3.h:60:9: note: previous definition of 'NF3LNK' with type 'enum nfs3_ftype'
      60 |         NF3LNK  = 5,
         |         ^~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:93:9: error: redeclaration of enumerator 'NF3SOCK'
      93 |         NF3SOCK = 6,
         |         ^~~~~~~
   include/uapi/linux/nfs3.h:61:9: note: previous definition of 'NF3SOCK' with type 'enum nfs3_ftype'
      61 |         NF3SOCK = 6,
         |         ^~~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:94:9: error: redeclaration of enumerator 'NF3FIFO'
      94 |         NF3FIFO = 7,
         |         ^~~~~~~
   include/uapi/linux/nfs3.h:62:9: note: previous definition of 'NF3FIFO' with type 'enum nfs3_ftype'
      62 |         NF3FIFO = 7,    /* changed from NFSv2 (was 8) */
         |         ^~~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:161:9: error: redeclaration of enumerator 'DONT_CHANGE'
     161 |         DONT_CHANGE = 0,
         |         ^~~~~~~~~~~
   include/uapi/linux/nfs3.h:67:9: note: previous definition of 'DONT_CHANGE' with type 'enum nfs3_time_how'
      67 |         DONT_CHANGE             = 0,
         |         ^~~~~~~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:162:9: error: redeclaration of enumerator 'SET_TO_SERVER_TIME'
     162 |         SET_TO_SERVER_TIME = 1,
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/nfs3.h:68:9: note: previous definition of 'SET_TO_SERVER_TIME' with type 'enum nfs3_time_how'
      68 |         SET_TO_SERVER_TIME      = 1,
         |         ^~~~~~~~~~~~~~~~~~
>> include/linux/sunrpc/xdrgen/nfs3.h:163:9: error: redeclaration of enumerator 'SET_TO_CLIENT_TIME'
     163 |         SET_TO_CLIENT_TIME = 2,
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/nfs3.h:69:9: note: previous definition of 'SET_TO_CLIENT_TIME' with type 'enum nfs3_time_how'
      69 |         SET_TO_CLIENT_TIME      = 2,
         |         ^~~~~~~~~~~~~~~~~~
   nfsd.h:55:9: warning: 'NFS3_FSF_DEFAULT' redefined
      55 | #define NFS3_FSF_DEFAULT                0x001f
         |         ^~~~~~~~~~~~~~~~
   include/uapi/linux/nfs3.h:50:9: note: this is the location of the previous definition
      50 | #define NFS3_FSF_DEFAULT        0x001B
         |         ^~~~~~~~~~~~~~~~


vim +13 include/uapi/linux/nfs3.h

607ca46e97a1b65 David Howells 2012-10-13   7  
607ca46e97a1b65 David Howells 2012-10-13   8  #define NFS3_PORT		2049
607ca46e97a1b65 David Howells 2012-10-13   9  #define NFS3_MAXDATA		32768
607ca46e97a1b65 David Howells 2012-10-13  10  #define NFS3_MAXPATHLEN		PATH_MAX
607ca46e97a1b65 David Howells 2012-10-13  11  #define NFS3_MAXNAMLEN		NAME_MAX
607ca46e97a1b65 David Howells 2012-10-13  12  #define NFS3_MAXGROUPS		16
607ca46e97a1b65 David Howells 2012-10-13 @13  #define NFS3_FHSIZE		64
607ca46e97a1b65 David Howells 2012-10-13  14  #define NFS3_COOKIESIZE		4
607ca46e97a1b65 David Howells 2012-10-13  15  #define NFS3_CREATEVERFSIZE	8
607ca46e97a1b65 David Howells 2012-10-13  16  #define NFS3_COOKIEVERFSIZE	8
607ca46e97a1b65 David Howells 2012-10-13  17  #define NFS3_WRITEVERFSIZE	8
607ca46e97a1b65 David Howells 2012-10-13  18  #define NFS3_FIFO_DEV		(-1)
607ca46e97a1b65 David Howells 2012-10-13  19  #define NFS3MODE_FMT		0170000
607ca46e97a1b65 David Howells 2012-10-13  20  #define NFS3MODE_DIR		0040000
607ca46e97a1b65 David Howells 2012-10-13  21  #define NFS3MODE_CHR		0020000
607ca46e97a1b65 David Howells 2012-10-13  22  #define NFS3MODE_BLK		0060000
607ca46e97a1b65 David Howells 2012-10-13  23  #define NFS3MODE_REG		0100000
607ca46e97a1b65 David Howells 2012-10-13  24  #define NFS3MODE_LNK		0120000
607ca46e97a1b65 David Howells 2012-10-13  25  #define NFS3MODE_SOCK		0140000
607ca46e97a1b65 David Howells 2012-10-13  26  #define NFS3MODE_FIFO		0010000
607ca46e97a1b65 David Howells 2012-10-13  27  

:::::: The code at line 13 was first introduced by commit
:::::: 607ca46e97a1b6594b29647d98a32d545c24bdff UAPI: (Scripted) Disintegrate include/linux

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
