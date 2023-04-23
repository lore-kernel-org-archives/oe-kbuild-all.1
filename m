Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44739370
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682246829; x=1713782829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ljRivfS9cep1cg5NHbGaVTMaV3CFKkl6Z8HaFVOOQL0=;
  b=jgFaio18HHO/5P7bBRa1msnVVOM0N/rMsK3N94+yHJohE5xapQKv7w4V
   fOXcX0jIJTN1EDjRnczvsHpzNBEbGuIx0t4o8+ltcrIxO3D4ylx2K/DR/
   fQbKyKCtXgB4QP4eaIekZINY+brHnaJahZUstSDibwRLv7evZ4doUwbif
   QDQ3w9ieG2WQKzdhhW8qdMb9kMuxXEd+WcdA+UZAmdXTlNck0h3Sn3vz6
   pxktiJraQA3vKMJnyCWlovjzo0J47TyjgBg9gaTo1jnRs9fqx3Mfnw0Jq
   QugXWnS8e7igLKJga2Sd+oyFodfAiaccBr1LOQWjp8pgpaZuM15HBYJKC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="330481086"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="330481086"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 03:47:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="1022386746"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="1022386746"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2023 03:47:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqXFL-000hqo-0N;
	Sun, 23 Apr 2023 10:47:07 +0000
Date: Sun, 23 Apr 2023 18:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:exportfs_encode_fid 1/5] fs/exportfs/expfs.c:384:19:
 error: 'exportfs_encode_ino32_fh' undeclared here (not in a function); did
 you mean 'exportfs_encode_inode_fh'?
Message-ID: <202304231845.jEIVUmDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux exportfs_encode_fid
head:   bb00689c5acaa4e530780be87b78cec7a906e298
commit: 7f28e1e3124eb9e62dddde7feb827b27cdb74caa [1/5] exportfs: make ->encode_fh() a mandatory method
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230423/202304231845.jEIVUmDC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/amir73il/linux/commit/7f28e1e3124eb9e62dddde7feb827b27cdb74caa
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il exportfs_encode_fid
        git checkout 7f28e1e3124eb9e62dddde7feb827b27cdb74caa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304231845.jEIVUmDC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from fs/exportfs/expfs.c:13:
>> fs/exportfs/expfs.c:384:19: error: 'exportfs_encode_ino32_fh' undeclared here (not in a function); did you mean 'exportfs_encode_inode_fh'?
     384 | EXPORT_SYMBOL_GPL(exportfs_encode_ino32_fh);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:87:23: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:151:41: note: in expansion of macro '_EXPORT_SYMBOL'
     151 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   fs/exportfs/expfs.c:384:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     384 | EXPORT_SYMBOL_GPL(exportfs_encode_ino32_fh);
         | ^~~~~~~~~~~~~~~~~


vim +384 fs/exportfs/expfs.c

   344	
   345	/**
   346	 * generic_encode_ino32_fh - generic export_operations->encode_fh function
   347	 * @inode:   the object to encode
   348	 * @fh:      where to store the file handle fragment
   349	 * @max_len: maximum length to store there
   350	 * @parent:  parent directory inode, if wanted
   351	 *
   352	 * This generic encode_fh function assumes that the 32 inode number
   353	 * is suitable for locating an inode, and that the generation number
   354	 * can be used to check that it is still valid.  It places them in the
   355	 * filehandle fragment where export_decode_fh expects to find them.
   356	 */
   357	int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int *max_len,
   358				    struct inode *parent)
   359	{
   360		struct fid *fid = (void *)fh;
   361		int len = *max_len;
   362		int type = FILEID_INO32_GEN;
   363	
   364		if (parent && (len < 4)) {
   365			*max_len = 4;
   366			return FILEID_INVALID;
   367		} else if (len < 2) {
   368			*max_len = 2;
   369			return FILEID_INVALID;
   370		}
   371	
   372		len = 2;
   373		fid->i32.ino = inode->i_ino;
   374		fid->i32.gen = inode->i_generation;
   375		if (parent) {
   376			fid->i32.parent_ino = parent->i_ino;
   377			fid->i32.parent_gen = parent->i_generation;
   378			len = 4;
   379			type = FILEID_INO32_GEN_PARENT;
   380		}
   381		*max_len = len;
   382		return type;
   383	}
 > 384	EXPORT_SYMBOL_GPL(exportfs_encode_ino32_fh);
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
