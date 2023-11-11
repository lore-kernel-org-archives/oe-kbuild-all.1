Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D75C14A84
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBEq4BGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699721101; x=1731257101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61k08ML9eMNBLu+Q04enVIrc47EYXZy4dmICFqixRgk=;
  b=gBEq4BGTRYAN9oA/ox6k85AQ1xmzFMVig8Qq2xYEFGXYn7xJ3j7MDah4
   OWf164St/reirQOSoAevfY/Cqk2EGsikunH9xaN/j3LzLhsoX+rC9DXcM
   +7kkqA0BEuOszvHGrv2LfFo896cIyvnsDriswkSE22pyGDJEZhFTs8U2B
   rcWOEYfyRP2hELriYI+mPeZpqiamG7SqIeKavpt/9EPhilQheiVB5dqj/
   l8EK1t1sxYQdtqe1rB95pmVvOefpfQvoyYtL1TYwLpXQfBL2aL8988C1x
   MDPX9BGJ8frKYJrib9BOl840c6wndBWJNR812W+zvs2vR4pIs0ANYN499
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="476511630"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="476511630"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 08:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="767547746"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="767547746"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2023 08:44:57 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1r6N-000AcN-0P;
	Sat, 11 Nov 2023 16:44:55 +0000
Date: Sun, 12 Nov 2023 00:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] fs/fuse/backing.c:191:16:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202311120010.6TFriN1q-lkp@intel.com>
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
head:   47e30b4060c43613523b256168f0e7f5bd7c4724
commit: d0d3399a554cd4a3b58e72b6e76594edba557b27 [1/1] ANDROID: fuse: Restore upstream type of bitfields in fuse_args
config: i386-randconfig-061-20231016 (https://download.01.org/0day-ci/archive/20231112/202311120010.6TFriN1q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120010.6TFriN1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120010.6TFriN1q-lkp@intel.com/

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
