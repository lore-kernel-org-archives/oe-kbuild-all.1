Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FD1EA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 06:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674541124; x=1706077124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U1GIFMdHKo15Of7a2DIC/fSfREH20kAWrsBKge+cTYY=;
  b=jfFwwCLM/R0A+2yBzPoDunCPBWPpn8qJB9Fv7M1paFv7D7orm/W5cR/q
   YOxBwHWXr/shcubjd9m4Q8XV/NadjdTa4QiW7bpvVhlWNQd7GkmgGQKW4
   ogur5AfoZ5z2Xqhj33Cueltw0BwumFV1J7PFxeWlaVXCaY+FNI/ILSycf
   QCE5ukbhU4/qQ4dmFg8KTE1qhYBqCfsQfSnr7vr8k5fKzbGfTtrRTCjk5
   PRC/7xxmqZGMR2x/4Uo6zMCS32xrDMSg2JH39IgW/SoEj/c72xiLWWkU8
   iIkR+OLtP0zbdDLwLZrCUjZW+QqbRZNWdVYQf7MwBuVZ+JsFS+TzFO+jY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388582353"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="388582353"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 22:18:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750718861"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="750718861"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2023 22:18:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKCdm-0006CS-02;
	Tue, 24 Jan 2023 06:18:42 +0000
Date: Tue, 24 Jan 2023 14:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Van Hensbergen <ericvh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, v9fs-developer@lists.sourceforge.net
Subject: [ericvh-v9fs:ericvh/for-next 11/12] fs/9p/vfs_file.c:506:28:
 warning: variable 'v9inode' set but not used
Message-ID: <202301241454.gOqo4xVk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git ericvh/for-next
head:   2245aefc0a6f35eb2a9ad0afa8958c3d2fa694ea
commit: 5cdf58fbef6262fac9937fc9373d6f8b8f80f5fd [11/12] writeback mode fixes
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230124/202301241454.gOqo4xVk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git/commit/?id=5cdf58fbef6262fac9937fc9373d6f8b8f80f5fd
        git remote add ericvh-v9fs https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git
        git fetch --no-tags ericvh-v9fs ericvh/for-next
        git checkout 5cdf58fbef6262fac9937fc9373d6f8b8f80f5fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/9p/vfs_file.c: In function 'v9fs_vm_page_mkwrite':
>> fs/9p/vfs_file.c:506:28: warning: variable 'v9inode' set but not used [-Wunused-but-set-variable]
     506 |         struct v9fs_inode *v9inode;
         |                            ^~~~~~~
   fs/9p/vfs_file.c: At top level:
   fs/9p/vfs_file.c:564:42: warning: 'v9fs_file_vm_ops' defined but not used [-Wunused-const-variable=]
     564 | static const struct vm_operations_struct v9fs_file_vm_ops = {
         |                                          ^~~~~~~~~~~~~~~~


vim +/v9inode +506 fs/9p/vfs_file.c

fb89b45cdfdc8b Dominique Martinet 2014-01-10  502  
fe6340e2d1f5ef Souptick Joarder   2018-07-17  503  static vm_fault_t
11bac80004499e Dave Jiang         2017-02-24  504  v9fs_vm_page_mkwrite(struct vm_fault *vmf)
7263cebed9fada Aneesh Kumar K.V   2011-02-28  505  {
6b39f6d22fbf67 Aneesh Kumar K.V   2011-02-28 @506  	struct v9fs_inode *v9inode;
78525c74d9e7d1 David Howells      2021-08-11  507  	struct folio *folio = page_folio(vmf->page);
11bac80004499e Dave Jiang         2017-02-24  508  	struct file *filp = vmf->vma->vm_file;
496ad9aa8ef448 Al Viro            2013-01-23  509  	struct inode *inode = file_inode(filp);
7263cebed9fada Aneesh Kumar K.V   2011-02-28  510  
7263cebed9fada Aneesh Kumar K.V   2011-02-28  511  
78525c74d9e7d1 David Howells      2021-08-11  512  	p9_debug(P9_DEBUG_VFS, "folio %p fid %lx\n",
78525c74d9e7d1 David Howells      2021-08-11  513  		 folio, (unsigned long)filp->private_data);
7263cebed9fada Aneesh Kumar K.V   2011-02-28  514  
eb497943fa2158 David Howells      2021-11-02  515  	v9inode = V9FS_I(inode);
eb497943fa2158 David Howells      2021-11-02  516  
eb497943fa2158 David Howells      2021-11-02  517  	/* Wait for the page to be written to the cache before we allow it to
eb497943fa2158 David Howells      2021-11-02  518  	 * be modified.  We then assume the entire page will need writing back.
eb497943fa2158 David Howells      2021-11-02  519  	 */
eb497943fa2158 David Howells      2021-11-02  520  #ifdef CONFIG_9P_FSCACHE
78525c74d9e7d1 David Howells      2021-08-11  521  	if (folio_test_fscache(folio) &&
78525c74d9e7d1 David Howells      2021-08-11  522  	    folio_wait_fscache_killable(folio) < 0)
78525c74d9e7d1 David Howells      2021-08-11  523  		return VM_FAULT_NOPAGE;
eb497943fa2158 David Howells      2021-11-02  524  #endif
eb497943fa2158 David Howells      2021-11-02  525  
120c2bcad80c0f Jan Kara           2012-06-12  526  	/* Update file times before taking page lock */
120c2bcad80c0f Jan Kara           2012-06-12  527  	file_update_time(filp);
120c2bcad80c0f Jan Kara           2012-06-12  528  
78525c74d9e7d1 David Howells      2021-08-11  529  	if (folio_lock_killable(folio) < 0)
eb497943fa2158 David Howells      2021-11-02  530  		return VM_FAULT_RETRY;
78525c74d9e7d1 David Howells      2021-08-11  531  	if (folio_mapping(folio) != inode->i_mapping)
7263cebed9fada Aneesh Kumar K.V   2011-02-28  532  		goto out_unlock;
78525c74d9e7d1 David Howells      2021-08-11  533  	folio_wait_stable(folio);
7263cebed9fada Aneesh Kumar K.V   2011-02-28  534  
7263cebed9fada Aneesh Kumar K.V   2011-02-28  535  	return VM_FAULT_LOCKED;
7263cebed9fada Aneesh Kumar K.V   2011-02-28  536  out_unlock:
78525c74d9e7d1 David Howells      2021-08-11  537  	folio_unlock(folio);
7263cebed9fada Aneesh Kumar K.V   2011-02-28  538  	return VM_FAULT_NOPAGE;
7263cebed9fada Aneesh Kumar K.V   2011-02-28  539  }
7263cebed9fada Aneesh Kumar K.V   2011-02-28  540  

:::::: The code at line 506 was first introduced by commit
:::::: 6b39f6d22fbf67cf795c105b4d67c64e9c352ca4 fs/9p: Move writeback fid to v9fs_inode

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
:::::: CC: Eric Van Hensbergen <ericvh@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
