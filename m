Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB48125A3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 22:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrzHK3v4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697409691; x=1728945691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0pni2JmLYeJEJxjiyrSRO4fBdqS0yfj2aWrhMBh5iWs=;
  b=QrzHK3v4MBHZfE3+xnorskBZ6Knv0Y6mTTtNhHMD0vGUCbY1juucONWM
   scfWGVXKOcYBXwk1tC/oJHrT4dqMP84k8oSAGqIEWirta+RsY2nP4R7Vc
   D1KnOzJ+qSAtEUHexw3w3LbDiNMvWiQu2kpbaV8+Iq8dgj+AFkYWFJKvh
   C4EVRv8wcw6SvML317C9lffvZ/pyUq26/D1A/T3i8IESkVUCXvpbsJibZ
   czDxQjIrCUklmkx8wjcSWszdpqZVCfwOsiAFVuO4INoVExqLgLtQx4U++
   75Dg5uNdfosSvr38CwXgK2Hms2GaqfvYnxclB1admWwv0Lq8XoI3JxFQA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375788575"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375788575"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 15:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705382349"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="705382349"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Oct 2023 15:41:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs9nY-0007sP-0i;
	Sun, 15 Oct 2023 22:41:24 +0000
Date: Mon, 16 Oct 2023 06:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 26/30] fs/fuse/passthrough.c:178:6:
 warning: variable 'fb' is used uninitialized whenever 'if' condition is true
Message-ID: <202310160652.nsq0KVkD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   a0ba52a923559bf03cf408db6ff1b0cc0318421b
commit: a4c107220c8f6579995cf006f93031eb756fc7db [26/30] fuse: implement ioctls to manage backing files
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231016/202310160652.nsq0KVkD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160652.nsq0KVkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160652.nsq0KVkD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/passthrough.c:178:6: warning: variable 'fb' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (backing_id <= 0)
               ^~~~~~~~~~~~~~~
   fs/fuse/passthrough.c:204:19: note: uninitialized use occurs here
           fuse_backing_put(fb);
                            ^~
   fs/fuse/passthrough.c:178:2: note: remove the 'if' if its condition is always false
           if (backing_id <= 0)
           ^~~~~~~~~~~~~~~~~~~~
   fs/fuse/passthrough.c:173:25: note: initialize the variable 'fb' to silence this warning
           struct fuse_backing *fb;
                                  ^
                                   = NULL
   1 warning generated.


vim +178 fs/fuse/passthrough.c

   167	
   168	/* Setup passthrough to a backing file */
   169	void fuse_passthrough_setup(struct file *file, int backing_id)
   170	{
   171		struct fuse_file *ff = file->private_data;
   172		struct fuse_conn *fc = ff->fm->fc;
   173		struct fuse_backing *fb;
   174		struct file *backing_file;
   175		int err;
   176	
   177		err = -EINVAL;
 > 178		if (backing_id <= 0)
   179			goto out;
   180	
   181		rcu_read_lock();
   182		fb = idr_find(&fc->backing_files_map, backing_id);
   183		fb = fuse_backing_get(fb);
   184		rcu_read_unlock();
   185	
   186		err = -ENOENT;
   187		if (!fb)
   188			goto out;
   189	
   190		/* Allocate backing file per fuse file to store fuse path */
   191		backing_file = backing_file_open(&file->f_path, file->f_flags,
   192						 &fb->file->f_path, fb->cred);
   193		err = PTR_ERR(backing_file);
   194		if (IS_ERR(backing_file))
   195			goto out;
   196	
   197		err = 0;
   198		ff->passthrough = backing_file;
   199		ff->cred = get_cred(fb->cred);
   200	out:
   201		pr_debug("%s: backing_id=%d, fb=0x%p, backing_file=0x%p, err=%i\n", __func__,
   202			 backing_id, fb, ff->passthrough, err);
   203	
   204		fuse_backing_put(fb);
   205		if (!ff->passthrough)
   206			ff->open_flags &= ~FOPEN_PASSTHROUGH;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
