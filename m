Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B164B3DB88
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 23:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TunDKTA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700869202; x=1732405202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=67QvvOKq/5AOZjvkFPaXIJflEKemZQ3lo1cHa0220jI=;
  b=TunDKTA/MA6Gix99+B439pOYzdoRm0FRz7A1PvV0+k0hw/YAQjCyoA0s
   uesHDKdYA+NeWL8cA9il+NooW22uBH+8xvMaPK/1QiMbn/idfYMWZ7H04
   soOA3EkPCZp4xLjGPIYOYiBF5WQf9NfDgquhbRId6P0lIhIGcl0+l5tyF
   RoIxoA9hLgw8kyPaVF+7U5dmn5UeYo5Py+ZbNdkiIRwZP8l9CGXlO1Yh1
   AMyEOzEYLGgPtHz8ouNw22peSulEDvBj7w+emyLlor0HN91RSCMqdSwoW
   9/DkVU1SdcHr9jtxm1oxxGIfVVK+2xuNCQMTAsZN46htSTAiNHLb9ihfJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377526702"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="377526702"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 15:40:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="761063025"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="761063025"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 15:40:01 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6fmA-0003OK-2p;
	Fri, 24 Nov 2023 23:39:58 +0000
Date: Sat, 25 Nov 2023 07:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 4/56] fs/netfs/main.c:37:undefined reference
 to `fscache_init'
Message-ID: <202311250434.96kEHnix-lkp@intel.com>
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
config: arm-qcom_defconfig (https://download.01.org/0day-ci/archive/20231125/202311250434.96kEHnix-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250434.96kEHnix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250434.96kEHnix-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/netfs/main.o: in function `netfs_init':
>> fs/netfs/main.c:37:(.init.text+0x20): undefined reference to `fscache_init'
   arm-linux-gnueabi-ld: fs/netfs/main.o: in function `netfs_exit':
>> fs/netfs/main.c:51:(.exit.text+0x4): undefined reference to `fscache_exit'


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
