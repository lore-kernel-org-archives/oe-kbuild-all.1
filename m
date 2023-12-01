Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768072207A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3zxHJlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701432970; x=1732968970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9bKkR7y7m1+YjkrRYDrtdLp0mkTP2t9LgK+cw7AEQjg=;
  b=i3zxHJlf3VVpxdCeqlNlzPZ0JyOiwpQDKOk7bwBMsw3KXFJiev6LjqGv
   wgEsnslpb8MUf+u3U5kSEjEz82/anajdrOhzlQJ6AHCVuNEZapGQxcdKU
   vGHbusfNb5+V94/jc7/o+uux19Cs+lTnCAoxI2Jcg67CDVuFIJiTwEUoJ
   YYt1se3jkTtBsbJ/NslGhZA7yZx4sCGyB+BHl65/reNeRL3D9pyDUrUxP
   OijXgOW7eTwO9uPoxZ8473a3nNC1gQPrVoz/2hj2p1dYbNov8LJeOSOJe
   vgJLNkPJF2vF+4w9zMV7TIGrDYQ6ipdUwrqy+FMsvoQG3hliXqoR/mnGg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="372880873"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="372880873"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 04:16:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="769664599"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="769664599"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 01 Dec 2023 04:16:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r92RB-0003dk-24;
	Fri, 01 Dec 2023 12:16:05 +0000
Date: Fri, 1 Dec 2023 20:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] fs/fuse/backing.c:191:16:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202312012001.TXjOeHNF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nathan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   fc1bbf14612b94ee6cbe94972fa47d1fdba42236
commit: d0d3399a554cd4a3b58e72b6e76594edba557b27 [1/1] ANDROID: fuse: Restore upstream type of bitfields in fuse_args
config: i386-randconfig-061-20231016 (https://download.01.org/0day-ci/archive/20231201/202312012001.TXjOeHNF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312012001.TXjOeHNF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312012001.TXjOeHNF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/backing.c:191:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:347:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:1307:24: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c: note: in included file (through include/linux/compat.h, include/linux/filter.h, fs/fuse/fuse_i.h):
   include/linux/fs.h:3346:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3346:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3346:20: sparse:     got int
   include/linux/fs.h:3346:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3346:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3346:20: sparse:     got int
   fs/fuse/backing.c:2082:18: sparse: sparse: Initializer entry defined twice
   fs/fuse/backing.c:2083:18: sparse:   also defined here

vim +191 fs/fuse/backing.c

6be5b06e4195b0 Daniel Rosenberg 2021-12-02  180  
9a5023967b4d2b Daniel Rosenberg 2022-03-30  181  void *fuse_open_finalize(struct fuse_bpf_args *fa,
6be5b06e4195b0 Daniel Rosenberg 2021-12-02  182  		       struct inode *inode, struct file *file, bool isdir)
6be5b06e4195b0 Daniel Rosenberg 2021-12-02  183  {
6be5b06e4195b0 Daniel Rosenberg 2021-12-02  184  	struct fuse_file *ff = file->private_data;
6be5b06e4195b0 Daniel Rosenberg 2021-12-02  185  	struct fuse_open_out *foo = fa->out_args[0].value;
6be5b06e4195b0 Daniel Rosenberg 2021-12-02  186  
494e7075c95df7 Paul Lawrence    2022-08-15  187  	if (ff) {
6be5b06e4195b0 Daniel Rosenberg 2021-12-02  188  		ff->fh = foo->fh;
494e7075c95df7 Paul Lawrence    2022-08-15  189  		ff->nodeid = get_fuse_inode(inode)->nodeid;
494e7075c95df7 Paul Lawrence    2022-08-15  190  	}
6be5b06e4195b0 Daniel Rosenberg 2021-12-02 @191  	return 0;
6be5b06e4195b0 Daniel Rosenberg 2021-12-02  192  }
6be5b06e4195b0 Daniel Rosenberg 2021-12-02  193  

:::::: The code at line 191 was first introduced by commit
:::::: 6be5b06e4195b002c52a1c2c82573ea7a76ce111 ANDROID: fuse-bpf v1

:::::: TO: Daniel Rosenberg <drosen@google.com>
:::::: CC: Paul Lawrence <paullawrence@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
