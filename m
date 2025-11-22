Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C6D8F5B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763807523; cv=none; b=EuU+uhYqyKJSomuJeLDgA/GT06SRLhhOheU86KfGOJv5hN01t2UxDZM8VoDWLjXkca3VGJWtk9mAs4FQ3UtMNSc5Fs4D63g6OiHSFvJICD7bEIr6o1UdMZhZlmIrd29Vj9jDqzjqHnd3yk5V60WojkhgbHCaGNTMm952asGSMeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763807523; c=relaxed/simple;
	bh=Ap/kh9ZYfgd39vUIje07ymZORepN0KNvxjz54AYSu5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CDLyOlNMUDG+7FCFy3Vp7WQlwWMKQRIzVtvniyB2axsK4XE30JsTo2dEtOM757RbqplRFJ0EVtaPUJxAzEFYMp5ZRigOJSg+qCbMuEe0p+XRqfdj6dabeaSNSoFRIpOhOnsnY9gGXksZTbuqvmPZH13O5BihB6X3e6Wc7EdHLbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNyfpTnB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNyfpTnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763807522; x=1795343522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ap/kh9ZYfgd39vUIje07ymZORepN0KNvxjz54AYSu5E=;
  b=PNyfpTnB1/q0M1V6wUirX6X+ZQDXIQlgjqzvEd9Nick6ETB+XBQny6lg
   PbQFABZUVT0ijJSeteJTGVQds5LIYZpSxo+1p3PvkmXUufKRjhAnWTnMB
   Wpod7Pnlb6wsNfZaGV/HzNZWxz14HKP/yh43QFDiKkw/tHk3lsZF8jUgi
   QuhVf8D4t8S8AUSwWUV+ZOIPJejuNzJ1QE80JqznIpUHCoSl/9bPxuCx0
   VtWaKrek4EQ+196H9TZTjGEZpGnw0K0SqPLgj1P7vsjiDGIP2/X/LfCNL
   0hG8UyF94jUjr25xj0M1Npb26Xn1qKfNPM0PBqHoelV5G7Gi/sR9llp1u
   Q==;
X-CSE-ConnectionGUID: 30rQaq8rRVasSr+nGwjXMw==
X-CSE-MsgGUID: AZ0TF7rjR9SE8+yKaPWYKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="83276548"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="83276548"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:32:02 -0800
X-CSE-ConnectionGUID: WgJER6HdQJ+CPkVlRr3zxA==
X-CSE-MsgGUID: zxi+mzZ/TheXfr8BY0jhPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192019738"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2025 02:32:00 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMkuL-0007Ph-2l;
	Sat, 22 Nov 2025 10:31:57 +0000
Date: Sat, 22 Nov 2025 18:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 50/63] include/linux/nfs_xdr.h:159:33: error:
 field 'change_attr_type' has incomplete type
Message-ID: <202511221821.vdDVCzRk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   9800773e205f87c3811bef2f1837a30e969c7687
commit: b133c112b8e209d4e1b0690faa2f08ae9fc1b02b [50/63] NFSD: Remove "#include <linux/nfs_fs.h>" from fs/nfsd/localio.c
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251122/202511221821.vdDVCzRk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221821.vdDVCzRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221821.vdDVCzRk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/localio.c:17:
>> include/linux/nfs_xdr.h:159:33: error: field 'change_attr_type' has incomplete type
     159 |                                 change_attr_type; /* Info about change attr */
         |                                 ^~~~~~~~~~~~~~~~
>> include/linux/nfs_xdr.h:265:9: error: unknown type name 'nfs4_stateid'
     265 |         nfs4_stateid stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:275:9: error: unknown type name 'nfs4_stateid'
     275 |         nfs4_stateid stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:301:9: error: unknown type name 'nfs4_stateid'
     301 |         nfs4_stateid stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:333:9: error: unknown type name 'nfs4_stateid'
     333 |         nfs4_stateid stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:341:9: error: unknown type name 'nfs4_stateid'
     341 |         nfs4_stateid stateid;
         |         ^~~~~~~~~~~~
>> include/linux/nfs_xdr.h:364:30: error: field 'dev_id' has incomplete type
     364 |         struct nfs4_deviceid dev_id;
         |                              ^~~~~~
   include/linux/nfs_xdr.h:379:9: error: unknown type name 'nfs4_stateid'
     379 |         nfs4_stateid stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:397:30: error: field 'dev_id' has incomplete type
     397 |         struct nfs4_deviceid dev_id;
         |                              ^~~~~~
>> include/linux/nfs_xdr.h:399:25: error: field 'opnum' has incomplete type
     399 |         enum nfs_opnum4 opnum;
         |                         ^~~~~
   include/linux/nfs_xdr.h:405:9: error: unknown type name 'nfs4_stateid'
     405 |         nfs4_stateid stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:435:9: error: unknown type name 'nfs4_stateid'
     435 |         nfs4_stateid                    src_stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:436:9: error: unknown type name 'nfs4_stateid'
     436 |         nfs4_stateid                    dst_stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:461:25: error: unknown type name 'nfs4_stateid'
     461 |                         nfs4_stateid            stateid;
         |                         ^~~~~~~~~~~~
>> include/linux/nfs_xdr.h:487:25: error: unknown type name 'nfs4_verifier'
     487 |                         nfs4_verifier   verifier; /* EXCLUSIVE */
         |                         ^~~~~~~~~~~~~
   include/linux/nfs_xdr.h:489:17: error: unknown type name 'nfs4_stateid'
     489 |                 nfs4_stateid    delegation;             /* CLAIM_DELEGATE_CUR */
         |                 ^~~~~~~~~~~~
>> include/linux/nfs_xdr.h:496:33: error: field 'claim' has incomplete type
     496 |         enum open_claim_type4   claim;
         |                                 ^~~~~
>> include/linux/nfs_xdr.h:497:33: error: field 'createmode' has incomplete type
     497 |         enum createmode4        createmode;
         |                                 ^~~~~~~~~~
   include/linux/nfs_xdr.h:505:9: error: unknown type name 'nfs4_stateid'
     505 |         nfs4_stateid            stateid;
         |         ^~~~~~~~~~~~
>> include/linux/nfs_xdr.h:512:41: error: 'NFS4_BITMAP_SIZE' undeclared here (not in a function); did you mean 'NFS_BITMASK_SZ'?
     512 |         __u32                   attrset[NFS4_BITMAP_SIZE];
         |                                         ^~~~~~~~~~~~~~~~
         |                                         NFS_BITMASK_SZ
   include/linux/nfs_xdr.h:528:9: error: unknown type name 'nfs4_stateid'
     528 |         nfs4_stateid *          stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:534:9: error: unknown type name 'nfs4_stateid'
     534 |         nfs4_stateid            stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:544:9: error: unknown type name 'nfs4_stateid'
     544 |         nfs4_stateid            stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:555:9: error: unknown type name 'nfs4_stateid'
     555 |         nfs4_stateid            stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:576:9: error: unknown type name 'nfs4_stateid'
     576 |         nfs4_stateid            lock_stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:578:9: error: unknown type name 'nfs4_stateid'
     578 |         nfs4_stateid            open_stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:588:9: error: unknown type name 'nfs4_stateid'
     588 |         nfs4_stateid            stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:598:9: error: unknown type name 'nfs4_stateid'
     598 |         nfs4_stateid            stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:603:9: error: unknown type name 'nfs4_stateid'
     603 |         nfs4_stateid            stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:638:15: error: unknown type name 'nfs4_stateid'
     638 |         const nfs4_stateid *stateid;
         |               ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:675:9: error: unknown type name 'nfs4_stateid'
     675 |         nfs4_stateid            stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:823:9: error: unknown type name 'nfs4_stateid'
     823 |         nfs4_stateid                    stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:948:33: error: field 'createmode' has incomplete type
     948 |         enum nfs3_createmode    createmode;
         |                                 ^~~~~~~~~~
>> include/linux/nfs_xdr.h:972:33: error: field 'type' has incomplete type
     972 |         enum nfs3_ftype         type;
         |                                 ^~~~
   include/linux/nfs_xdr.h:1166:9: error: unknown type name 'nfs4_verifier'
    1166 |         nfs4_verifier                   verifier;
         |         ^~~~~~~~~~~~~
   include/linux/nfs_xdr.h:1176:9: error: unknown type name 'nfs4_verifier'
    1176 |         nfs4_verifier                   verifier;
         |         ^~~~~~~~~~~~~
   include/linux/nfs_xdr.h:1193:15: error: unknown type name 'nfs4_verifier'
    1193 |         const nfs4_verifier *           sc_verifier;
         |               ^~~~~~~~~~~~~
   include/linux/nfs_xdr.h:1205:9: error: unknown type name 'nfs4_verifier'
    1205 |         nfs4_verifier                   confirm;
         |         ^~~~~~~~~~~~~
>> include/linux/nfs_xdr.h:1349:28: error: field 'enforce' has incomplete type
    1349 |         struct nfs4_op_map enforce;
         |                            ^~~~~~~
>> include/linux/nfs_xdr.h:1350:28: error: field 'allow' has incomplete type
    1350 |         struct nfs4_op_map allow;
         |                            ^~~~~
   include/linux/nfs_xdr.h:1355:9: error: unknown type name 'nfs4_verifier'
    1355 |         nfs4_verifier                   verifier;
         |         ^~~~~~~~~~~~~
>> include/linux/nfs_xdr.h:1363:50: error: 'NFS4_OPAQUE_LIMIT' undeclared here (not in a function)
    1363 |         char                            major_id[NFS4_OPAQUE_LIMIT];
         |                                                  ^~~~~~~~~~~~~~~~~
>> include/linux/nfs_xdr.h:1374:41: error: field 'date' has incomplete type
    1374 |         struct nfstime4                 date;
         |                                         ^~~~
>> include/linux/nfs_xdr.h:1380:41: error: field 'sessionid' has incomplete type
    1380 |         struct nfs4_sessionid           sessionid;
         |                                         ^~~~~~~~~
   include/linux/nfs_xdr.h:1387:41: error: field 'sessionid' has incomplete type
    1387 |         struct nfs4_sessionid           sessionid;
         |                                         ^~~~~~~~~
   include/linux/nfs_xdr.h:1413:41: error: field 'sessionid' has incomplete type
    1413 |         struct nfs4_sessionid           sessionid;
         |                                         ^~~~~~~~~
   include/linux/nfs_xdr.h:1439:9: error: unknown type name 'nfs4_stateid'
    1439 |         nfs4_stateid                    stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:1449:9: error: unknown type name 'nfs4_stateid'
    1449 |         nfs4_stateid                    stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:1469:9: error: unknown type name 'nfs4_stateid'
    1469 |         nfs4_stateid                     falloc_stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:1487:9: error: unknown type name 'nfs4_stateid'
    1487 |         nfs4_stateid                    src_stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:1491:9: error: unknown type name 'nfs4_stateid'
    1491 |         nfs4_stateid                    dst_stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:1500:9: error: unknown type name 'nfs4_stateid'
    1500 |         nfs4_stateid            stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:1516:9: error: unknown type name 'nfs4_stateid'
    1516 |         nfs4_stateid                    osa_stateid;
         |         ^~~~~~~~~~~~
   include/linux/nfs_xdr.h:1530:9: error: unknown type name 'nfs4_stateid'
    1530 |         nfs4_stateid            cna_src_stateid;
         |         ^~~~~~~~~~~~
>> include/linux/nfs_xdr.h:1531:33: error: field 'cna_dst' has incomplete type
    1531 |         struct nl4_server       cna_dst;
         |                                 ^~~~~~~
>> include/linux/nfs_xdr.h:1537:33: error: field 'cnr_lease_time' has incomplete type
    1537 |         struct nfstime4         cnr_lease_time;
         |                                 ^~~~~~~~~~~~~~
   include/linux/nfs_xdr.h:1538:9: error: unknown type name 'nfs4_stateid'
    1538 |         nfs4_stateid            cnr_stateid;
         |         ^~~~~~~~~~~~
>> include/linux/nfs_xdr.h:1539:33: error: field 'cnr_src' has incomplete type
    1539 |         struct nl4_server       cnr_src;
         |                                 ^~~~~~~
   include/linux/nfs_xdr.h:1546:9: error: unknown type name 'nfs4_stateid'
    1546 |         nfs4_stateid                    sa_stateid;
         |         ^~~~~~~~~~~~


vim +/change_attr_type +159 include/linux/nfs_xdr.h

3132e49ecef9da Jeff Layton           2016-08-10  138  
^1da177e4c3f41 Linus Torvalds        2005-04-16  139  /*
^1da177e4c3f41 Linus Torvalds        2005-04-16  140   * Info on the file system
^1da177e4c3f41 Linus Torvalds        2005-04-16  141   */
^1da177e4c3f41 Linus Torvalds        2005-04-16  142  struct nfs_fsinfo {
^1da177e4c3f41 Linus Torvalds        2005-04-16  143  	struct nfs_fattr	*fattr; /* Post-op attributes */
^1da177e4c3f41 Linus Torvalds        2005-04-16  144  	__u32			rtmax;	/* max.  read transfer size */
^1da177e4c3f41 Linus Torvalds        2005-04-16  145  	__u32			rtpref;	/* pref. read transfer size */
^1da177e4c3f41 Linus Torvalds        2005-04-16  146  	__u32			rtmult;	/* reads should be multiple of this */
^1da177e4c3f41 Linus Torvalds        2005-04-16  147  	__u32			wtmax;	/* max.  write transfer size */
^1da177e4c3f41 Linus Torvalds        2005-04-16  148  	__u32			wtpref;	/* pref. write transfer size */
^1da177e4c3f41 Linus Torvalds        2005-04-16  149  	__u32			wtmult;	/* writes should be multiple of this */
^1da177e4c3f41 Linus Torvalds        2005-04-16  150  	__u32			dtpref;	/* pref. readdir transfer size */
^1da177e4c3f41 Linus Torvalds        2005-04-16  151  	__u64			maxfilesize;
e86d5a02874c13 Trond Myklebust       2019-10-04  152  	struct timespec64	time_delta; /* server time granularity */
^1da177e4c3f41 Linus Torvalds        2005-04-16  153  	__u32			lease_time; /* in seconds */
ca440c383a5880 Jeff Layton           2016-09-15  154  	__u32			nlayouttypes; /* number of layouttypes */
3132e49ecef9da Jeff Layton           2016-08-10  155  	__u32			layouttype[NFS_MAX_LAYOUT_TYPES]; /* supported pnfs layout driver */
dae100c2b1b946 Fred Isaman           2011-07-30  156  	__u32			blksize; /* preferred pnfs io block size */
2a92ee92d45454 Peng Tao              2015-09-26  157  	__u32			clone_blksize; /* granularity of a CLONE operation */
7f08a3359a3c1e Trond Myklebust       2021-03-26  158  	enum nfs4_change_attr_type
7f08a3359a3c1e Trond Myklebust       2021-03-26 @159  				change_attr_type; /* Info about change attr */
b78ef845c35dba Frank van der Linden  2020-06-23  160  	__u32			xattr_support; /* User xattrs supported */
^1da177e4c3f41 Linus Torvalds        2005-04-16  161  };
^1da177e4c3f41 Linus Torvalds        2005-04-16  162  
^1da177e4c3f41 Linus Torvalds        2005-04-16  163  struct nfs_fsstat {
^1da177e4c3f41 Linus Torvalds        2005-04-16  164  	struct nfs_fattr	*fattr; /* Post-op attributes */
^1da177e4c3f41 Linus Torvalds        2005-04-16  165  	__u64			tbytes;	/* total size in bytes */
^1da177e4c3f41 Linus Torvalds        2005-04-16  166  	__u64			fbytes;	/* # of free bytes */
^1da177e4c3f41 Linus Torvalds        2005-04-16  167  	__u64			abytes;	/* # of bytes available to user */
^1da177e4c3f41 Linus Torvalds        2005-04-16  168  	__u64			tfiles;	/* # of files */
^1da177e4c3f41 Linus Torvalds        2005-04-16  169  	__u64			ffiles;	/* # of free files */
^1da177e4c3f41 Linus Torvalds        2005-04-16  170  	__u64			afiles;	/* # of files available to user */
^1da177e4c3f41 Linus Torvalds        2005-04-16  171  };
^1da177e4c3f41 Linus Torvalds        2005-04-16  172  
^1da177e4c3f41 Linus Torvalds        2005-04-16  173  struct nfs2_fsstat {
^1da177e4c3f41 Linus Torvalds        2005-04-16  174  	__u32			tsize;  /* Server transfer size */
^1da177e4c3f41 Linus Torvalds        2005-04-16  175  	__u32			bsize;  /* Filesystem block size */
^1da177e4c3f41 Linus Torvalds        2005-04-16  176  	__u32			blocks; /* No. of "bsize" blocks on filesystem */
^1da177e4c3f41 Linus Torvalds        2005-04-16  177  	__u32			bfree;  /* No. of free "bsize" blocks */
^1da177e4c3f41 Linus Torvalds        2005-04-16  178  	__u32			bavail; /* No. of available "bsize" blocks */
^1da177e4c3f41 Linus Torvalds        2005-04-16  179  };
^1da177e4c3f41 Linus Torvalds        2005-04-16  180  
^1da177e4c3f41 Linus Torvalds        2005-04-16  181  struct nfs_pathconf {
^1da177e4c3f41 Linus Torvalds        2005-04-16  182  	struct nfs_fattr	*fattr; /* Post-op attributes */
^1da177e4c3f41 Linus Torvalds        2005-04-16  183  	__u32			max_link; /* max # of hard links */
^1da177e4c3f41 Linus Torvalds        2005-04-16  184  	__u32			max_namelen; /* max name length */
^1da177e4c3f41 Linus Torvalds        2005-04-16  185  };
^1da177e4c3f41 Linus Torvalds        2005-04-16  186  
^1da177e4c3f41 Linus Torvalds        2005-04-16  187  struct nfs4_change_info {
^1da177e4c3f41 Linus Torvalds        2005-04-16  188  	u32			atomic;
^1da177e4c3f41 Linus Torvalds        2005-04-16  189  	u64			before;
^1da177e4c3f41 Linus Torvalds        2005-04-16  190  	u64			after;
^1da177e4c3f41 Linus Torvalds        2005-04-16  191  };
^1da177e4c3f41 Linus Torvalds        2005-04-16  192  
cee54fc944422c Trond Myklebust       2005-10-18  193  struct nfs_seqid;
9ff71c3a9827b9 Benny Halevy          2009-04-01  194  
557134a39c8d2a Andy Adamson          2009-04-01  195  /* nfs41 sessions channel attributes */
557134a39c8d2a Andy Adamson          2009-04-01  196  struct nfs4_channel_attrs {
557134a39c8d2a Andy Adamson          2009-04-01  197  	u32			max_rqst_sz;
557134a39c8d2a Andy Adamson          2009-04-01  198  	u32			max_resp_sz;
557134a39c8d2a Andy Adamson          2009-04-01  199  	u32			max_resp_sz_cached;
557134a39c8d2a Andy Adamson          2009-04-01  200  	u32			max_ops;
557134a39c8d2a Andy Adamson          2009-04-01  201  	u32			max_reqs;
557134a39c8d2a Andy Adamson          2009-04-01  202  };
557134a39c8d2a Andy Adamson          2009-04-01  203  
76e697ba7e8d18 Trond Myklebust       2012-11-26  204  struct nfs4_slot;
9ff71c3a9827b9 Benny Halevy          2009-04-01  205  struct nfs4_sequence_args {
2b2fa71723f955 Trond Myklebust       2012-11-16  206  	struct nfs4_slot	*sa_slot;
8fe72bac8de784 Trond Myklebust       2012-10-29  207  	u8			sa_cache_this : 1,
8fe72bac8de784 Trond Myklebust       2012-10-29  208  				sa_privileged : 1;
9ff71c3a9827b9 Benny Halevy          2009-04-01  209  };
9ff71c3a9827b9 Benny Halevy          2009-04-01  210  
9ff71c3a9827b9 Benny Halevy          2009-04-01  211  struct nfs4_sequence_res {
dfb4f309830359 Benny Halevy          2010-09-24  212  	struct nfs4_slot	*sr_slot;	/* slot used to send request */
8e63b6a8adabb0 Trond Myklebust       2012-12-15  213  	unsigned long		sr_timestamp;
fbcd4abcb3841f Andy Adamson          2009-04-01  214  	int			sr_status;	/* sequence operation status */
0629e370dd5819 Alexandros Batsakis   2009-12-05  215  	u32			sr_status_flags;
da0507b7c95ccd Trond Myklebust       2012-11-20  216  	u32			sr_highest_slotid;
464ee9f9664047 Trond Myklebust       2012-11-20  217  	u32			sr_target_highest_slotid;
9ff71c3a9827b9 Benny Halevy          2009-04-01  218  };
9ff71c3a9827b9 Benny Halevy          2009-04-01  219  
2050f0cc0703aa Andy Adamson          2009-04-01  220  struct nfs4_get_lease_time_args {
2050f0cc0703aa Andy Adamson          2009-04-01  221  	struct nfs4_sequence_args	la_seq_args;
2050f0cc0703aa Andy Adamson          2009-04-01  222  };
2050f0cc0703aa Andy Adamson          2009-04-01  223  
2050f0cc0703aa Andy Adamson          2009-04-01  224  struct nfs4_get_lease_time_res {
2050f0cc0703aa Andy Adamson          2009-04-01  225  	struct nfs4_sequence_res	lr_seq_res;
62ae082d883d16 Trond Myklebust       2012-11-29  226  	struct nfs_fsinfo	       *lr_fsinfo;
2050f0cc0703aa Andy Adamson          2009-04-01  227  };
2050f0cc0703aa Andy Adamson          2009-04-01  228  
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  229  struct xdr_stream;
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  230  struct nfs4_xdr_opaque_data;
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  231  
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  232  struct nfs4_xdr_opaque_ops {
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  233  	void (*encode)(struct xdr_stream *, const void *args,
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  234  			const struct nfs4_xdr_opaque_data *);
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  235  	void (*free)(struct nfs4_xdr_opaque_data *);
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  236  };
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  237  
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  238  struct nfs4_xdr_opaque_data {
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  239  	const struct nfs4_xdr_opaque_ops *ops;
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  240  	void *data;
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  241  };
f8c3cf9d7d7f04 Trond Myklebust       2016-10-20  242  
b1f69b754ee312 Andy Adamson          2010-10-20  243  #define PNFS_LAYOUT_MAXSIZE 4096
b1f69b754ee312 Andy Adamson          2010-10-20  244  
b1f69b754ee312 Andy Adamson          2010-10-20  245  struct nfs4_layoutdriver_data {
35124a0994fc02 Weston Andros Adamson 2011-03-24  246  	struct page **pages;
35124a0994fc02 Weston Andros Adamson 2011-03-24  247  	__u32 pglen;
b1f69b754ee312 Andy Adamson          2010-10-20  248  	__u32 len;
b1f69b754ee312 Andy Adamson          2010-10-20  249  };
b1f69b754ee312 Andy Adamson          2010-10-20  250  
b1f69b754ee312 Andy Adamson          2010-10-20  251  struct pnfs_layout_range {
b1f69b754ee312 Andy Adamson          2010-10-20  252  	u32 iomode;
b1f69b754ee312 Andy Adamson          2010-10-20  253  	u64 offset;
b1f69b754ee312 Andy Adamson          2010-10-20  254  	u64 length;
b1f69b754ee312 Andy Adamson          2010-10-20  255  };
b1f69b754ee312 Andy Adamson          2010-10-20  256  
b1f69b754ee312 Andy Adamson          2010-10-20  257  struct nfs4_layoutget_args {
62ae082d883d16 Trond Myklebust       2012-11-29  258  	struct nfs4_sequence_args seq_args;
b1f69b754ee312 Andy Adamson          2010-10-20  259  	__u32 type;
b1f69b754ee312 Andy Adamson          2010-10-20  260  	struct pnfs_layout_range range;
b1f69b754ee312 Andy Adamson          2010-10-20  261  	__u64 minlength;
b1f69b754ee312 Andy Adamson          2010-10-20  262  	__u32 maxcount;
b1f69b754ee312 Andy Adamson          2010-10-20  263  	struct inode *inode;
b1f69b754ee312 Andy Adamson          2010-10-20  264  	struct nfs_open_context *ctx;
cf7d63f1f98957 Fred Isaman           2011-01-06 @265  	nfs4_stateid stateid;
35124a0994fc02 Weston Andros Adamson 2011-03-24  266  	struct nfs4_layoutdriver_data layout;
b1f69b754ee312 Andy Adamson          2010-10-20  267  };
b1f69b754ee312 Andy Adamson          2010-10-20  268  

:::::: The code at line 159 was first introduced by commit
:::::: 7f08a3359a3c1e39c2a118fbbe583d8c8db14ace NFSv4: Add support for the NFSv4.2 "change_attr_type" attribute

:::::: TO: Trond Myklebust <trond.myklebust@hammerspace.com>
:::::: CC: Trond Myklebust <trond.myklebust@hammerspace.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
