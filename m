Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7851E1FCA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694176688; x=1725712688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VCgw5bbNfX61Ghfh7eaw2Ur91483+33KFkYX+vQeGW4=;
  b=M+xgc+7OjiSrSUbUIuXuePPsGagijmhVee7NitYAjd4NVAa2ytHCliPd
   gkTxXT2xKUseL6hIxwIAvxXnmmKeVcsHIctS9yzmrXpuQxj9IVn4vVGVt
   ciVuq8JDmzjjDkUbH0S/5Afsc6jTV4JwTtkigDxpE34s9BQw27Q3QBBT0
   fPmVcay54tqi8iJXpKMMJQUaD0IeSOM7bJyhfSggwp/gzn+GcZn4ALHpz
   WSlPQtWSlq60GH7nRuFvUv3lAxOGgywnVjwyHNxcfCM3WbGaN9x2KKb9e
   AS9XeBQMoIyiQnJfIrBDJCasI5++nbpnvqpTcK33DlZEmwHq7RN3MPrkQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357939668"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="357939668"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 05:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="771738256"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="771738256"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Sep 2023 05:38:06 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeakO-0002G6-0n;
	Fri, 08 Sep 2023 12:38:04 +0000
Date: Fri, 8 Sep 2023 20:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 9/13] fs/fuse/passthrough.c:70:6: warning:
 variable 'fb' is used uninitialized whenever 'if' condition is false
Message-ID: <202309082011.xa56ORo3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   d49ddc74f18aec5fb799e68b710df0f60928b2f5
commit: f89ded39822038bda45a92145fca90f6293767bb [9/13] fuse: implement ioctls to setup inode bound backing files
config: riscv-randconfig-r023-20230908 (https://download.01.org/0day-ci/archive/20230908/202309082011.xa56ORo3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309082011.xa56ORo3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309082011.xa56ORo3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/passthrough.c:70:6: warning: variable 'fb' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      70 |         if (inode) {
         |             ^~~~~
   fs/fuse/passthrough.c:81:9: note: uninitialized use occurs here
      81 |         return fb ?: ERR_PTR(err);
         |                ^~
   fs/fuse/passthrough.c:70:2: note: remove the 'if' if its condition is always true
      70 |         if (inode) {
         |         ^~~~~~~~~~~
   fs/fuse/passthrough.c:63:25: note: initialize the variable 'fb' to silence this warning
      63 |         struct fuse_backing *fb;
         |                                ^
         |                                 = NULL
   1 warning generated.


vim +70 fs/fuse/passthrough.c

    58	
    59	/* Detach the inode bound backing file from inode */
    60	static struct fuse_backing *fuse_backing_detach(struct fuse_conn *fc,
    61							u64 nodeid)
    62	{
    63		struct fuse_backing *fb;
    64		struct inode *inode;
    65		int err = -ENODEV;
    66	
    67		down_read(&fc->killsb);
    68	
    69		inode = fuse_ilookup(fc, nodeid, NULL);
  > 70		if (inode) {
    71			struct fuse_inode *fi = get_fuse_inode(inode);
    72	
    73			fb = xchg(&fi->fb, NULL);
    74			iput(inode);
    75			if (!fb)
    76				err = -ENOENT;
    77		}
    78	
    79		up_read(&fc->killsb);
    80	
    81		return fb ?: ERR_PTR(err);
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
