Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE04273F0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G67cYLvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697461376; x=1728997376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dd94mVWjzYc7rXk1uQtHzOotGV6uxuDcJuMEago4XAE=;
  b=G67cYLvhS2hIzJ0CDo/hfVD91sKm2NVFLuuQnnKvMmWS/f6fA/rvdt34
   OV1Ml9JUPgOgJPzia7e3tiHaPbFMzBLQBPXsXkdWHYMxbxCyYj3xJM6Yv
   wG2Bw3BvOCyGP5XVnMkM9F4OYtbB7htORui8wyMNXMKUwNrJlMcfHLyWg
   2O2mjtR0OjzMaPxB/vxn0hLMy8v0gNwB3ufhB3G2cPWeoYFrWiK2KPk7n
   YabVkWxbNonxLzvpyk5gowVj3OC4QKuSNUzCuCC/L5da2tVsTG1CvCD8y
   tVFG7WhvtpPjnL+dzQ7KwJX7qd9SmrONnEzbfULNcbI38U9uDhJpKsk87
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="4131527"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="4131527"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 06:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755686921"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="755686921"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Oct 2023 06:02:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsNFD-0008OQ-19;
	Mon, 16 Oct 2023 13:02:51 +0000
Date: Mon, 16 Oct 2023 21:01:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Moeller <jon.moeller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 3638/30000]
 drivers/platform/x86/sepdk/pax/pax.c:88:31: warning: 'pax_version_ops'
 defined but not used
Message-ID: <202310162113.nmC2Keli-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   a0b8c3f924aa72ed5d1892e77377d9144287fc35
commit: fadb19e08fbf603c6b11d9c45dbf33accdd58016 [3638/30000] platform/x86: add sep and socwatch drivers without socperf.
config: i386-buildonly-randconfig-002-20231016 (https://download.01.org/0day-ci/archive/20231016/202310162113.nmC2Keli-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310162113.nmC2Keli-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310162113.nmC2Keli-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/sepdk/pax/pax.c:88:31: warning: 'pax_version_ops' defined but not used [-Wunused-variable]
      88 | static struct file_operations pax_version_ops = {
         |                               ^~~~~~~~~~~~~~~


vim +/pax_version_ops +88 drivers/platform/x86/sepdk/pax/pax.c

    85	
    86	static int pax_version_proc_read(struct seq_file *, void *);
    87	static int pax_version_proc_open(struct inode *, struct file *);
  > 88	static struct file_operations pax_version_ops = {
    89		.owner = THIS_MODULE,
    90		.open = pax_version_proc_open,
    91		.read = seq_read,
    92		.llseek = seq_lseek,
    93		.release = single_release,
    94	};
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
