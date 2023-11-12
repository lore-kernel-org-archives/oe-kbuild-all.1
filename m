Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5976FC4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9AxJPlA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699786114; x=1731322114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XVboqflfGuX7XQ7cXRbJkFDg1TZZq1PtK2jBljkxOEw=;
  b=a9AxJPlA7j+MaFuE2f2VRyzVYMZDBjF9ob7kDXmIiAFPTAMaqu/NuuFY
   RS48C2TFR/G+Q43Vcr+V1DMNaao6cyoMFaazVLV2MP5YUsTb7uxa6rv2Q
   V3LrLZVOGXDd5NH/56GvWJREhGQ+vezEnms89XV3GvAw5L0j6SnZ9qK6c
   se7rV+xO/ragsYKoLXR5lLN4SXs0I4vg4ZDmbP4tHKVOEcfdvjQVjbMO7
   ytBkcFJsS3zZFHtgMYeQFiAtF9PwT2QGjU6fziiF1lS8+fZowhSyTPNTc
   3a6wn66XQTHQs53SqJxXCxRn5I97VmCmtJdVmQjw9gNhpMayNnL0Uym46
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="390130474"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="390130474"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 02:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="907808653"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="907808653"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Nov 2023 02:48:33 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2810-000B5u-2y;
	Sun, 12 Nov 2023 10:48:30 +0000
Date: Sun, 12 Nov 2023 18:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl-fixes 1/3] fs/overlayfs/export.c:292:24: warning:
 unused variable 'dentry'
Message-ID: <202311121805.wDYoh8Yw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux ovl-fixes
head:   5a90629b82f45c4628219c70072ff31566222adb
commit: 3415a62597161b03b2db48ca195af34d25afc5d5 [1/3] ovl: stop using d_alloc_anon()/d_instantiate_anon()
config: arc-randconfig-002-20231112 (https://download.01.org/0day-ci/archive/20231112/202311121805.wDYoh8Yw-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311121805.wDYoh8Yw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121805.wDYoh8Yw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/overlayfs/export.c: In function 'ovl_obtain_alias':
>> fs/overlayfs/export.c:292:24: warning: unused variable 'dentry' [-Wunused-variable]
     292 |         struct dentry *dentry;
         |                        ^~~~~~


vim +/dentry +292 fs/overlayfs/export.c

8ed5eec9d6c4c0 Amir Goldstein 2017-07-12  281  
8556a4205b111c Amir Goldstein 2018-01-19  282  /*
f71bd9cfb692ec Amir Goldstein 2018-01-19  283   * Find or instantiate an overlay dentry from real dentries and index.
8556a4205b111c Amir Goldstein 2018-01-19  284   */
8556a4205b111c Amir Goldstein 2018-01-19  285  static struct dentry *ovl_obtain_alias(struct super_block *sb,
f71bd9cfb692ec Amir Goldstein 2018-01-19  286  				       struct dentry *upper_alias,
f71bd9cfb692ec Amir Goldstein 2018-01-19  287  				       struct ovl_path *lowerpath,
f71bd9cfb692ec Amir Goldstein 2018-01-19  288  				       struct dentry *index)
8556a4205b111c Amir Goldstein 2018-01-19  289  {
f941866fc4a8ad Amir Goldstein 2018-01-19  290  	struct dentry *lower = lowerpath ? lowerpath->dentry : NULL;
f71bd9cfb692ec Amir Goldstein 2018-01-19  291  	struct dentry *upper = upper_alias ?: index;
8556a4205b111c Amir Goldstein 2018-01-19 @292  	struct dentry *dentry;
0af950f57fefab Amir Goldstein 2023-04-08  293  	struct inode *inode = NULL;
8556a4205b111c Amir Goldstein 2018-01-19  294  	struct ovl_entry *oe;
ac6a52eb65b532 Vivek Goyal    2018-05-08  295  	struct ovl_inode_params oip = {
ac6a52eb65b532 Vivek Goyal    2018-05-08  296  		.index = index,
ac6a52eb65b532 Vivek Goyal    2018-05-08  297  	};
8556a4205b111c Amir Goldstein 2018-01-19  298  
f71bd9cfb692ec Amir Goldstein 2018-01-19  299  	/* We get overlay directory dentries with ovl_lookup_real() */
f71bd9cfb692ec Amir Goldstein 2018-01-19  300  	if (d_is_dir(upper ?: lower))
8556a4205b111c Amir Goldstein 2018-01-19  301  		return ERR_PTR(-EIO);
8556a4205b111c Amir Goldstein 2018-01-19  302  
0af950f57fefab Amir Goldstein 2023-04-08  303  	oe = ovl_alloc_entry(!!lower);
0af950f57fefab Amir Goldstein 2023-04-08  304  	if (!oe)
0af950f57fefab Amir Goldstein 2023-04-08  305  		return ERR_PTR(-ENOMEM);
0af950f57fefab Amir Goldstein 2023-04-08  306  
ac6a52eb65b532 Vivek Goyal    2018-05-08  307  	oip.upperdentry = dget(upper);
0af950f57fefab Amir Goldstein 2023-04-08  308  	if (lower) {
0af950f57fefab Amir Goldstein 2023-04-08  309  		ovl_lowerstack(oe)->dentry = dget(lower);
0af950f57fefab Amir Goldstein 2023-04-08  310  		ovl_lowerstack(oe)->layer = lowerpath->layer;
0af950f57fefab Amir Goldstein 2023-04-08  311  	}
0af950f57fefab Amir Goldstein 2023-04-08  312  	oip.oe = oe;
ac6a52eb65b532 Vivek Goyal    2018-05-08  313  	inode = ovl_get_inode(sb, &oip);
8556a4205b111c Amir Goldstein 2018-01-19  314  	if (IS_ERR(inode)) {
0af950f57fefab Amir Goldstein 2023-04-08  315  		ovl_free_entry(oe);
8556a4205b111c Amir Goldstein 2018-01-19  316  		dput(upper);
8556a4205b111c Amir Goldstein 2018-01-19  317  		return ERR_CAST(inode);
8556a4205b111c Amir Goldstein 2018-01-19  318  	}
8556a4205b111c Amir Goldstein 2018-01-19  319  
9d3dfea3d35a32 Vivek Goyal    2018-05-11  320  	if (upper)
9d3dfea3d35a32 Vivek Goyal    2018-05-11  321  		ovl_set_flag(OVL_UPPERDATA, inode);
9d3dfea3d35a32 Vivek Goyal    2018-05-11  322  
3415a62597161b Amir Goldstein 2023-11-12  323  	return d_obtain_alias(inode);
8556a4205b111c Amir Goldstein 2018-01-19  324  }
8556a4205b111c Amir Goldstein 2018-01-19  325  

:::::: The code at line 292 was first introduced by commit
:::::: 8556a4205b111c4dac931ee5eba4fcce74c3cb21 ovl: decode pure upper file handles

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
