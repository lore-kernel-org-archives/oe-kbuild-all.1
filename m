Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D49015AE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 01:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758183; x=1710294183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WY6exKDHvDnwHwl4DcWG1JX6mEQX0HGsrW5pvZHLJGY=;
  b=OUAdAfImjQCdDt2tkWS1lSmk3CzIOjiuKiZ4peMz91ZY9QLYeYoBwtHi
   t4X+nwy7iGBPPm6s3kVXP5CYkq2ONNFglkUIfYwPRLycz8nE1L1DsoP9q
   MTvS4AaRDMnhgsVWTb7/4Nm0Bm26BNXuNDvtUKtvhH/u34Eh1aUYvHOYZ
   ddpM3+iXLne/82WFPAtHtQmr5+AGObUt83Qa5wiHKnDPCMKABXhRWH8D7
   jHZDVFXcdkTFykNLMpg7RiPRTe3CnHLRHOueQgXnqf9N/yQw3tarUs4RB
   2cWuVN9s1/ZHlwIlHgNaz2eG6GkQI7kuIoaNKXR3Md011mqRTJ4B9qrk9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399892853"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="399892853"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 18:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="656164099"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="656164099"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Mar 2023 18:43:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbtgr-0006Mu-0Q;
	Tue, 14 Mar 2023 01:43:01 +0000
Date: Tue, 14 Mar 2023 09:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1/1]
 drivers/trusty/trusty-log.c:678:9: warning: no previous prototype for
 'trusty_log_sfile_dev_read'
Message-ID: <202303140923.6NrZ0Yfy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   2cb5328839ee3dede473b095b8d8e4c8371c44e5
commit: 2cb5328839ee3dede473b095b8d8e4c8371c44e5 [1/1] ANDROID: trusty-log: fix potential use-after-free
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230314/202303140923.6NrZ0Yfy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout 2cb5328839ee3dede473b095b8d8e4c8371c44e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303140923.6NrZ0Yfy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/trusty/trusty-log.c: In function 'trusty_log_seq_next':
   drivers/trusty/trusty-log.c:455:21: warning: left shift count >= width of type [-Wshift-count-overflow]
     455 |         *pos = (1UL << 32) + log_sfile_sink->get;
         |                     ^~
   drivers/trusty/trusty-log.c: At top level:
>> drivers/trusty/trusty-log.c:678:9: warning: no previous prototype for 'trusty_log_sfile_dev_read' [-Wmissing-prototypes]
     678 | ssize_t trusty_log_sfile_dev_read(struct file *filp, char __user *buf,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/trusty_log_sfile_dev_read +678 drivers/trusty/trusty-log.c

   677	
 > 678	ssize_t trusty_log_sfile_dev_read(struct file *filp, char __user *buf,
   679					  size_t size, loff_t *ppos)
   680	{
   681		struct seq_file *sfile;
   682		struct trusty_log_sfile *lb;
   683		struct trusty_log_state *s;
   684	
   685		sfile = filp->private_data;
   686		lb = sfile->private;
   687		s = container_of(lb, struct trusty_log_state, log_sfile);
   688	
   689		if (!s->registered) {
   690			dev_err(s->dev, "invalid read fd\n");
   691			return -EINVAL;
   692		}
   693	
   694		return seq_read(filp, buf, size, ppos);
   695	}
   696	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
