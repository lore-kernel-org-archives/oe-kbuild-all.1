Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796DD184
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 00:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689552456; x=1721088456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WaV2krTncFR4SIhh60PmhAeNbTKwzK0gs7nARM9fuSo=;
  b=kNmLt9qm8UhL9tYFAfkLEiuIjnLTiBkh0NsPrbo646Si6+rgA+dLqVOl
   wuVYgyVZ8BCZwoo3x9r+jmP71kZP0CA4L1yFjJ+PgEaiU2746/baA+N0i
   I2A+y/uFINg+EpXwCwqia7DdXxhXoAonuNVPB0rt47SGUwfe9AY9viUvK
   LDVkVS3DVDlh7psXOV4EXd+aIZf4pYPIFg8ersgpa+avJHODYa3G+8d3j
   GsquwLsh0ZYFOQ8duZlrmU9AFgR63J9HALk/KJWtVJkj5Nu1ayQ+F6A9U
   dCwpR+34ZptMeRJB33enDhzz/KASYTxag+6oxU6/YmHAaXM5/TaSLnLKZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="346118237"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="346118237"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 17:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="758225687"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="758225687"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Jul 2023 17:07:34 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLBm1-00094G-1L;
	Mon, 17 Jul 2023 00:07:33 +0000
Date: Mon, 17 Jul 2023 08:07:00 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:start-write-safe 10/10] fs/read_write.c:848:9: warning: no
 previous prototype for function 'do_iter_write'
Message-ID: <202307170737.4TQufdtD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux start-write-safe
head:   249f6fc94a26bd48f4d0903e05fb15d9e77356e2
commit: 249f6fc94a26bd48f4d0903e05fb15d9e77356e2 [10/10] fs: move file_start_write() into vfs_iter_write()
config: x86_64-randconfig-x012-20230717 (https://download.01.org/0day-ci/archive/20230717/202307170737.4TQufdtD-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170737.4TQufdtD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170737.4TQufdtD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/read_write.c:848:9: warning: no previous prototype for function 'do_iter_write' [-Wmissing-prototypes]
   ssize_t do_iter_write(struct file *file, struct iov_iter *iter, loff_t *pos,
           ^
   fs/read_write.c:848:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t do_iter_write(struct file *file, struct iov_iter *iter, loff_t *pos,
   ^
   static 
   1 warning generated.


vim +/do_iter_write +848 fs/read_write.c

   847	
 > 848	ssize_t do_iter_write(struct file *file, struct iov_iter *iter, loff_t *pos,
   849			      rwf_t flags)
   850	{
   851		size_t tot_len;
   852		ssize_t ret = 0;
   853	
   854		if (!(file->f_mode & FMODE_WRITE))
   855			return -EBADF;
   856		if (!(file->f_mode & FMODE_CAN_WRITE))
   857			return -EINVAL;
   858	
   859		tot_len = iov_iter_count(iter);
   860		if (!tot_len)
   861			return 0;
   862		ret = rw_verify_area(WRITE, file, pos, tot_len);
   863		if (ret < 0)
   864			return ret;
   865	
   866		if (file->f_op->write_iter)
   867			ret = do_iter_readv_writev(file, iter, pos, WRITE, flags);
   868		else
   869			ret = do_loop_readv_writev(file, iter, pos, WRITE, flags);
   870		if (ret > 0)
   871			fsnotify_modify(file);
   872		return ret;
   873	}
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
