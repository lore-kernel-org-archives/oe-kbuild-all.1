Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18E6168CE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 19:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686252163; x=1717788163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C6QB8aZassE5Wb13aOMAjIZbkw95bsvX0OrbBx3kPqQ=;
  b=Nz3CD5yle+Boawd+zgstxzZNGlX5zWMGHJkBPhCvTgNaAshBWKtMPIIV
   89H9VMkfZPJK8Qo3YI6HunkjbXEiqHIi9ttvdUWS/mpXgZXPQs1fprH2G
   Xh0xqOMtlUAtM/2IfJsn3KnLeZYolhpxqnG/IyPzqKlXwruVhY7YhCCyP
   bMrEb2DsX5pVdL3ladSTNIiIazxUxmaD2gH3lJGlDeipLBFsxFkaYpLtO
   dRd0UuYk7Z0qqUIkC/HEUEU7j7b46HoCZP5xnW0su8LjOuGzEOzJ4fFnw
   OOiahro9O9j5tcfoVUp+WFXcrY3HxCVHPDTA1e5sNqK2gCTzrKdU+lOxe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="354901741"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="354901741"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 12:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="822751497"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="822751497"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2023 12:22:42 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7LDV-0008Bc-0i;
	Thu, 08 Jun 2023 19:22:41 +0000
Date: Fri, 9 Jun 2023 03:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v1-devel-v22 31/33]
 include/linux/evm.h:55:1: error: version control conflict marker in file
Message-ID: <202306090339.DoufNr8n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v1-devel-v22
head:   19f1c2b9463d5b57969d00781cbcb241ce0f2695
commit: 01aafd0066729d05a43f2bfcbfb2064ad9f37fa2 [31/33] evm: Move to LSM infrastructure
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230609/202306090339.DoufNr8n-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/robertosassu/linux/commit/01aafd0066729d05a43f2bfcbfb2064ad9f37fa2
        git remote add robertosassu https://github.com/robertosassu/linux
        git fetch --no-tags robertosassu ima-evm-lsms-v1-devel-v22
        git checkout 01aafd0066729d05a43f2bfcbfb2064ad9f37fa2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090339.DoufNr8n-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_api.c:15:
>> include/linux/evm.h:55:1: error: version control conflict marker in file
      55 | <<<<<<< HEAD
         | ^~~~~~~
   include/linux/evm.h:133:1: error: version control conflict marker in file
     133 | =======
         | ^~~~~~~
>> include/linux/evm.h:134:9: error: invalid suffix "a253..." on integer constant
     134 | >>>>>>> 7010952a253... evm: Move to LSM infrastructure
         |         ^~~~~~~~~~~~~~
--
   In file included from security/integrity/ima/ima_appraise.c:15:
>> include/linux/evm.h:55:1: error: version control conflict marker in file
      55 | <<<<<<< HEAD
         | ^~~~~~~
   include/linux/evm.h:133:1: error: version control conflict marker in file
     133 | =======
         | ^~~~~~~
>> include/linux/evm.h:134:9: error: invalid suffix "a253..." on integer constant
     134 | >>>>>>> 7010952a253... evm: Move to LSM infrastructure
         |         ^~~~~~~~~~~~~~
   security/integrity/ima/ima_appraise.c: In function 'ima_inode_setxattr':
>> security/integrity/ima/ima_appraise.c:775:28: error: implicit declaration of function 'evm_revalidate_status' [-Werror=implicit-function-declaration]
     775 |         if (result == 1 || evm_revalidate_status(xattr_name)) {
         |                            ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +55 include/linux/evm.h

    54	
  > 55	<<<<<<< HEAD
    56	static inline int evm_inode_setattr(struct mnt_idmap *idmap,
    57					    struct dentry *dentry, struct iattr *attr)
    58	{
    59		return 0;
    60	}
    61	
    62	static inline void evm_inode_post_setattr(struct mnt_idmap *idmap,
    63						  struct dentry *dentry, int ia_valid)
    64	{
    65		return;
    66	}
    67	
    68	static inline int evm_inode_setxattr(struct mnt_idmap *idmap,
    69					     struct dentry *dentry, const char *name,
    70					     const void *value, size_t size, int flags)
    71	{
    72		return 0;
    73	}
    74	
    75	static inline void evm_inode_post_setxattr(struct dentry *dentry,
    76						   const char *xattr_name,
    77						   const void *xattr_value,
    78						   size_t xattr_value_len,
    79						   int flags)
    80	{
    81		return;
    82	}
    83	
    84	static inline int evm_inode_removexattr(struct mnt_idmap *idmap,
    85						struct dentry *dentry,
    86						const char *xattr_name)
    87	{
    88		return 0;
    89	}
    90	
    91	static inline void evm_inode_post_removexattr(struct dentry *dentry,
    92						      const char *xattr_name)
    93	{
    94		return;
    95	}
    96	
    97	static inline void evm_inode_post_remove_acl(struct mnt_idmap *idmap,
    98						     struct dentry *dentry,
    99						     const char *acl_name)
   100	{
   101		return;
   102	}
   103	
   104	static inline int evm_inode_set_acl(struct mnt_idmap *idmap,
   105					    struct dentry *dentry, const char *acl_name,
   106					    struct posix_acl *kacl)
   107	{
   108		return 0;
   109	}
   110	
   111	static inline int evm_inode_remove_acl(struct mnt_idmap *idmap,
   112					       struct dentry *dentry,
   113					       const char *acl_name)
   114	{
   115		return 0;
   116	}
   117	
   118	static inline void evm_inode_post_set_acl(struct dentry *dentry,
   119						  const char *acl_name,
   120						  struct posix_acl *kacl)
   121	{
   122		return;
   123	}
   124	
   125	static inline int evm_inode_init_security(struct inode *inode, struct inode *dir,
   126						  const struct qstr *qstr,
   127						  struct xattr *xattrs,
   128						  int *xattr_count)
   129	{
   130		return 0;
   131	}
   132	
   133	=======
 > 134	>>>>>>> 7010952a253... evm: Move to LSM infrastructure
   135	static inline bool evm_revalidate_status(const char *xattr_name)
   136	{
   137		return false;
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
