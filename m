Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6A7E4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 12:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689338618; x=1720874618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HcNwUOoB34TWzy4BZdLQnfBG4/4lEbDYbVm66HkxUXk=;
  b=im9ssYaFArX1msWRcaHAEcXrtZNLYMgKsXyUOPIhNBEa2qgZ5vvJ8ozd
   XXVtHiSBvaiicmMFxDjwd+z1gRYdWDnz59Yhps7A6CiceSoK5lTZIcKON
   nmQIxAi7uo8e1obKWxDUl87vDLj5XC1hukq4SZfwdslsMLHfpMFhYZBY+
   K+0hcU6Z+QyavkOZ6lorLOLF2ISvjaw+ua+senyYxibagPmIXFRNqZMVt
   yn9KIy3KLLpJ6KBCabuYolpnC4Tf08L3tsw5okP+LgxdLOLS9NMF+lFgv
   1qJvDmjP6kXP/AlBFztk/tozv/mo7/xHrHa4b91259pvuG1jmy0DCPuLf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345060904"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="345060904"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 05:43:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="896408072"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="896408072"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Jul 2023 05:43:35 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKI90-0007RN-1H;
	Fri, 14 Jul 2023 12:43:34 +0000
Date: Fri, 14 Jul 2023 20:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Victor Erminpour <victor.erminpour@oracle.com>
Subject: [oracle-dtrace:v2/6.4 11/13] fs/waitfd.c:60:34: sparse: sparse: cast
 removes address space '__user' of expression
Message-ID: <202307142007.SffWZW7o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: 9402ce66da82c5ad6c5449749b63856473b18cbd [11/13] waitfd: enable by default
config: um-randconfig-r071-20230713 (https://download.01.org/0day-ci/archive/20230714/202307142007.SffWZW7o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142007.SffWZW7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142007.SffWZW7o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/waitfd.c:60:34: sparse: sparse: cast removes address space '__user' of expression
>> fs/waitfd.c:60:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] __user *stat_addr @@     got int * @@
   fs/waitfd.c:60:34: sparse:     expected int [noderef] __user *stat_addr
   fs/waitfd.c:60:34: sparse:     got int *
>> fs/waitfd.c:89:27: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   fs/waitfd.c:89:27: sparse:     expected restricted __poll_t ( *poll )( ... )
   fs/waitfd.c:89:27: sparse:     got unsigned int ( * )( ... )

vim +/__user +60 fs/waitfd.c

19ce4a9705869b Nick Alcock 2018-11-14  51  
19ce4a9705869b Nick Alcock 2018-11-14  52  /*
19ce4a9705869b Nick Alcock 2018-11-14  53   * Returns a multiple of the size of a stat_addr, or a negative error code. The
19ce4a9705869b Nick Alcock 2018-11-14  54   * "count" parameter must be at least sizeof(int).
19ce4a9705869b Nick Alcock 2018-11-14  55   */
19ce4a9705869b Nick Alcock 2018-11-14  56  static ssize_t waitfd_read(struct file *file, char __user *buf, size_t count,
19ce4a9705869b Nick Alcock 2018-11-14  57  			     loff_t *ppos)
19ce4a9705869b Nick Alcock 2018-11-14  58  {
19ce4a9705869b Nick Alcock 2018-11-14  59  	struct waitfd_ctx *ctx = file->private_data;
19ce4a9705869b Nick Alcock 2018-11-14 @60  	int __user *stat_addr = (int *)buf;
19ce4a9705869b Nick Alcock 2018-11-14  61  	int flags = ctx->options;
19ce4a9705869b Nick Alcock 2018-11-14  62  	ssize_t ret, total = 0;
19ce4a9705869b Nick Alcock 2018-11-14  63  
19ce4a9705869b Nick Alcock 2018-11-14  64  	count /= sizeof(int);
19ce4a9705869b Nick Alcock 2018-11-14  65  	if (!count)
19ce4a9705869b Nick Alcock 2018-11-14  66  		return -EINVAL;
19ce4a9705869b Nick Alcock 2018-11-14  67  
19ce4a9705869b Nick Alcock 2018-11-14  68  	if (file->f_flags & O_NONBLOCK)
19ce4a9705869b Nick Alcock 2018-11-14  69  		flags |= WNOHANG;
19ce4a9705869b Nick Alcock 2018-11-14  70  
19ce4a9705869b Nick Alcock 2018-11-14  71  	do {
19ce4a9705869b Nick Alcock 2018-11-14  72  		ret = kernel_wait4(ctx->upid, stat_addr, flags, NULL);
19ce4a9705869b Nick Alcock 2018-11-14  73  		if (ret == 0)
19ce4a9705869b Nick Alcock 2018-11-14  74  			ret = -EAGAIN;
19ce4a9705869b Nick Alcock 2018-11-14  75  		if (ret == -ECHILD)
19ce4a9705869b Nick Alcock 2018-11-14  76  			ret = 0;
19ce4a9705869b Nick Alcock 2018-11-14  77  		if (ret <= 0)
19ce4a9705869b Nick Alcock 2018-11-14  78  			break;
19ce4a9705869b Nick Alcock 2018-11-14  79  
19ce4a9705869b Nick Alcock 2018-11-14  80  		stat_addr++;
19ce4a9705869b Nick Alcock 2018-11-14  81  		total += sizeof(int);
19ce4a9705869b Nick Alcock 2018-11-14  82  	} while (--count);
19ce4a9705869b Nick Alcock 2018-11-14  83  
19ce4a9705869b Nick Alcock 2018-11-14  84  	return total ? total : ret;
19ce4a9705869b Nick Alcock 2018-11-14  85  }
19ce4a9705869b Nick Alcock 2018-11-14  86  
19ce4a9705869b Nick Alcock 2018-11-14  87  static const struct file_operations waitfd_fops = {
19ce4a9705869b Nick Alcock 2018-11-14  88  	.release	= waitfd_release,
19ce4a9705869b Nick Alcock 2018-11-14 @89  	.poll		= waitfd_poll,
19ce4a9705869b Nick Alcock 2018-11-14  90  	.read		= waitfd_read,
19ce4a9705869b Nick Alcock 2018-11-14  91  	.llseek		= noop_llseek,
19ce4a9705869b Nick Alcock 2018-11-14  92  };
19ce4a9705869b Nick Alcock 2018-11-14  93  

:::::: The code at line 60 was first introduced by commit
:::::: 19ce4a9705869b25a970a68669e8837cf78b1ead waitfd: new syscall implementing waitpid() over fds

:::::: TO: Nick Alcock <nick.alcock@oracle.com>
:::::: CC: Nick Alcock <nick.alcock@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
