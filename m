Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621B7101FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 11:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687262173; x=1718798173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XYzweXBT/OX4WSNo0WlLSGpt2EQIPrmjBjIMTOMVprQ=;
  b=RD/Kem8GqS+c/qkliteBJHcJoXXkfzNTW+tY9m5dvEWpQQFiXpwIPHpF
   5imElLjWDVfuHBsr/Lg6a1GItQL+LhXgrZBbLBvfBgwJC4sPuv2yWV+72
   qIliCTcAOVXWQW3/RbLD8D4hGt7Xd9LJVB9abecGNj5Y2r4StidfCVLX0
   i9VAzQVxiG1JiHomfIrIHvpRgNIJBnVKlVIyjcyqSpL1ZqtLAqdgP2isa
   zc7QUzm19JcN5D413v/21NU3/v/+fQ6Cj5hqdT0Wlz7L0CYZ7CXfhgSjB
   9EPNNEQkr1EYLr01x2GsrXkuZdvZuCKwspqEhTQLbA0/ypq6DVwrxiB/i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="357326597"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="357326597"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 04:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="960756629"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="960756629"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jun 2023 04:56:11 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBZxy-0005rQ-1R;
	Tue, 20 Jun 2023 11:56:10 +0000
Date: Tue, 20 Jun 2023 19:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/3] fs/fuse/backing.c:138:16:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202306201940.g1DRN5EL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   c6d386b8a6c4b9cfaee609fb1a0f291ba70e99f9
commit: f5f4199c102aa676998b42abff60d071385c1c0c [1/3] ANDROID: fuse-bpf v1.1
config: x86_64-randconfig-s023-20230620 (https://download.01.org/0day-ci/archive/20230620/202306201940.g1DRN5EL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201940.g1DRN5EL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201940.g1DRN5EL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/backing.c:138:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:294:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:1256:24: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c: note: in included file (through include/linux/compat.h, include/linux/filter.h, fs/fuse/fuse_i.h):
   include/linux/fs.h:3520:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3520:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3520:20: sparse:     got int
   include/linux/fs.h:3520:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3520:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3520:20: sparse:     got int
   fs/fuse/backing.c:2041:18: sparse: sparse: Initializer entry defined twice
   fs/fuse/backing.c:2042:18: sparse:   also defined here

vim +138 fs/fuse/backing.c

   127	
   128	void *fuse_open_finalize(struct fuse_bpf_args *fa,
   129			       struct inode *inode, struct file *file, bool isdir)
   130	{
   131		struct fuse_file *ff = file->private_data;
   132		struct fuse_open_out *foo = fa->out_args[0].value;
   133	
   134		if (ff) {
   135			ff->fh = foo->fh;
   136			ff->nodeid = get_fuse_inode(inode)->nodeid;
   137		}
 > 138		return 0;
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
