Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A5510EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 02:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6jTG2fD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700878648; x=1732414648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URy9klcPLC52TyDNTILhvnxbZr8UswUwL916+9gzNas=;
  b=R6jTG2fDy2dmPqIg9rVc2KvEXMWVH8gf9hSewhOgD7u4gRcY8PyTAyv2
   TCUXOjZhXqwmqRUB51m4WuP+ml/uFj+IFdChJ7kmWGe2aEYswSn7LyJDc
   dD2dn2nVsXmeLZx/XN061GIjpNhJsZX9AUWJ+VKMLKQWsdBa03BIsxTpN
   3O44JsU3H6piCcphWf1B5GsRba4lbJR9DqDpQ50O8PF6vkAMKJo/oUa/a
   JUwvTxy4NXQ7grtJLo0Re8+vprqcWkJf0kaHvvW6yTEjSQJvFZQBPAAKd
   9k9Zveg/DJdthtSqNg7tYzGdNic98v21ELzHhZy+EHXXQ1ElOQQEAzoxW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="478693291"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="478693291"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 18:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="16094862"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2023 18:17:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6iER-0003Xd-1E;
	Sat, 25 Nov 2023 02:17:19 +0000
Date: Sat, 25 Nov 2023 10:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 4/56] fs/netfs/main.c:37: undefined reference
 to `fscache_init'
Message-ID: <202311250759.1a9WJisj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   69448342f13a737a392c45f17205bc3eaf242e9d
commit: 28f81f45ad3566ce6d0c0ebfac75b43c88e642b6 [4/56] netfs, fscache: Move /proc/fs/fscache to /proc/fs/netfs and put in a symlink
config: x86_64-randconfig-015-20231125 (https://download.01.org/0day-ci/archive/20231125/202311250759.1a9WJisj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250759.1a9WJisj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250759.1a9WJisj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `netfs_init':
>> fs/netfs/main.c:37: undefined reference to `fscache_init'
   ld: vmlinux.o: in function `netfs_exit':
>> fs/netfs/main.c:51: undefined reference to `fscache_exit'


vim +37 fs/netfs/main.c

    36	
  > 37		ret = fscache_init();
    38		if (ret < 0)
    39			goto error_proc;
    40		return 0;
    41	
    42	error_proc:
    43		remove_proc_entry("fs/netfs", NULL);
    44	error:
    45		return ret;
    46	}
    47	fs_initcall(netfs_init);
    48	
    49	static void __exit netfs_exit(void)
    50	{
  > 51		fscache_exit();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
