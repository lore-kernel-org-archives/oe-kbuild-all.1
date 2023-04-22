Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BD77F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 12:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682166705; x=1713702705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yYyQ1OOGP/vCdCuRnGy/u/uMh2a30Vb54WZv6NM0zNI=;
  b=MIWBV9RtUkE160QVHdJDw2E5I0egAkK3SxHiZvvXgfaO9lP5Xqz0jSML
   G+NxH4nKIkc4SO/1lC9khG+RCTK63hsFXZsVj7NiGttgi8jZvqNZmQyd+
   EP4aBdVSoxswC28aasig1oSwieHEIuG0Qs/janHWx0POPbYO4VcuDTJQF
   j71SiEnYUM4sASM6Fum7c1wP2jkMyfu5q+nH9LPS+T8PB/Lly6vTuHekl
   M1NEr8A4KB+K2JiT1UcFaBYY2c1FbZULknJEJkAmwa7EfcFSl1PMThwZs
   z9LY0AQOnQAs2PbSzYz79mRZMAMCFz48BjVHC8g6ZvdhBerdIHqfN2sar
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="346170046"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="346170046"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 05:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="757172140"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="757172140"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2023 05:31:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqCP1-000hIS-2u;
	Sat, 22 Apr 2023 12:31:43 +0000
Date: Sat, 22 Apr 2023 20:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:exportfs_encode_fid 1/2] fs/exportfs/expfs.c:429:16:
 error: implicit declaration of function 'exportifs_encode_ino32_fh'; did you
 mean 'exportfs_encode_ino32_fh'?
Message-ID: <202304222025.acZaj4tM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux exportfs_encode_fid
head:   c904f36f980fd8fb5cc4db0c45965972a8efdd41
commit: 35db1aa5db1cf4ff92de8ab33619711c00f140bd [1/2] exportfs: add helper to encode file handle with 64bit ino
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20230422/202304222025.acZaj4tM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/amir73il/linux/commit/35db1aa5db1cf4ff92de8ab33619711c00f140bd
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il exportfs_encode_fid
        git checkout 35db1aa5db1cf4ff92de8ab33619711c00f140bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222025.acZaj4tM-lkp@intel.com/

Note: the amir73il/exportfs_encode_fid HEAD c904f36f980fd8fb5cc4db0c45965972a8efdd41 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/exportfs/expfs.c: In function 'exportfs_encode_inode_fh':
>> fs/exportfs/expfs.c:429:16: error: implicit declaration of function 'exportifs_encode_ino32_fh'; did you mean 'exportfs_encode_ino32_fh'? [-Werror=implicit-function-declaration]
     429 |         return exportifs_encode_ino32_fh(inode, fid, max_len, parent);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                exportfs_encode_ino32_fh
   At top level:
   fs/exportfs/expfs.c:357:12: warning: 'exportfs_encode_ino32_fh' defined but not used [-Wunused-function]
     357 | static int exportfs_encode_ino32_fh(struct inode *inode, struct fid *fid,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +429 fs/exportfs/expfs.c

   420	
   421	int exportfs_encode_inode_fh(struct inode *inode, struct fid *fid,
   422				     int *max_len, struct inode *parent)
   423	{
   424		const struct export_operations *nop = inode->i_sb->s_export_op;
   425	
   426		if (nop && nop->encode_fh)
   427			return nop->encode_fh(inode, fid->raw, max_len, parent);
   428	
 > 429		return exportifs_encode_ino32_fh(inode, fid, max_len, parent);
   430	}
   431	EXPORT_SYMBOL_GPL(exportfs_encode_inode_fh);
   432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
