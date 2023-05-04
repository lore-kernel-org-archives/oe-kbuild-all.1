Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290ABA2D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683196044; x=1714732044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWIb/XnfxmkPAjNNGU4B//6DQtzU88vSLreuioZ4Q30=;
  b=N0aeLNm6k+5ZggZhAWvFrWr4WRSP09NTATqdTgJotaVuczAzVxm5BWbG
   k++dl/d5W7ah2ezLlO6tgWL1qDt3AY4id9azAaDWylvdRMK1MqDr9KfNy
   gXH1tQ3rL7q4FmdkVEKvsUpX3ywLb3GNpgMJhBjqbfZxk/s6IiThP76PW
   YQliRoDHB+Z7Qv2J4S/rkjxdh+uYMIk9o1xw1u6UfHdh2KOFa6GRjIVAO
   VM+dOpV9NtX8atkJMF/Fht6C9kguq9PZ0qOs94e9v4hjeK9H8IVUj8Tcq
   sUPxO281GBVtS1JJJrf8b9glyOZ7t/egSdOHcVYLaCl+e18C5uGl+VNo7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333272222"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="333272222"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 03:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674493931"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="674493931"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 May 2023 03:27:22 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puWBF-0002qe-10;
	Thu, 04 May 2023 10:27:21 +0000
Date: Thu, 4 May 2023 18:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_modify 23/27] fs/namespace.c:492:5: warning: no
 previous prototype for function '__sb_mnt_want_write_file'
Message-ID: <202305041810.2LZmOHGt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_pre_modify
head:   889dee83a548e67305a3b713f457b30bc075b3f8
commit: 5471d0cb02f3a3aeb3d9f04e5f2d43f5d54bbdbc [23/27] fanotify: introduce FAN_PRE_ATTRIB permission event
config: i386-randconfig-a011-20230501 (https://download.01.org/0day-ci/archive/20230504/202305041810.2LZmOHGt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/amir73il/linux/commit/5471d0cb02f3a3aeb3d9f04e5f2d43f5d54bbdbc
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il fan_pre_modify
        git checkout 5471d0cb02f3a3aeb3d9f04e5f2d43f5d54bbdbc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041810.2LZmOHGt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namespace.c:492:5: warning: no previous prototype for function '__sb_mnt_want_write_file' [-Wmissing-prototypes]
   int __sb_mnt_want_write_file(struct file *file)
       ^
   fs/namespace.c:492:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __sb_mnt_want_write_file(struct file *file)
   ^
   static 
   1 warning generated.


vim +/__sb_mnt_want_write_file +492 fs/namespace.c

   482	
   483	/**
   484	 * __sb_mnt_want_write_file - get write access to a file's mount and sb
   485	 * @file: the file who's mount on which to take a write
   486	 *
   487	 * This is like mnt_want_write, but if the file is already open for writing it
   488	 * skips incrementing mnt_writers (since the open file already has a reference)
   489	 * and instead only does the freeze protection and the check for emergency r/o
   490	 * remounts.  This must be paired with mnt_drop_write_file.
   491	 */
 > 492	int __sb_mnt_want_write_file(struct file *file)
   493	{
   494		int ret;
   495	
   496		sb_start_write(file_inode(file)->i_sb);
   497		ret = __mnt_want_write_file(file);
   498		if (ret)
   499			sb_end_write(file_inode(file)->i_sb);
   500		return ret;
   501	}
   502	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
