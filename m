Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664351F5FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FN7NJ05q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700930944; x=1732466944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7TfyRh+hrwC5F3DbfZj2Gsk3hcY+1PPKNrxiA7w7Y0c=;
  b=FN7NJ05qT3GFCE/Yzgngfvl/U5eP5ug5AiLJW8j5KGZkHvTscmInNVDa
   plxv8UjBS6tzReCyt2oPPGwR0hprexxu3dJ9Eele/+iP1CdlPe9YWnxOa
   A4+tcf4wak+JO1XmSmQd4ezgE6GCfbJnT8FJ7SgNwigRR2GniFzeASARn
   qgewpkHQbpRvPsYv7Ut5xfi+9AhOnfPMDyTIHvYbfkc0PfRBcF9DiSy6m
   rePlnfmSNIiuVx7pJM4xcmxQ9Hk0rhBQak4bQv9tJnL5pschrWi8EmbxJ
   UDGegyl5cnl/B2YCn9vZmxkA8dX9tDnuqPXzPRGluujRUWn3cxRMHKHPD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="395348466"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="395348466"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 08:49:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="802346295"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="802346295"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Nov 2023 08:49:02 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6vq0-0004DG-19;
	Sat, 25 Nov 2023 16:49:00 +0000
Date: Sun, 26 Nov 2023 00:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 7/7] treewide: sysctl: migrate proc_dointvec to
 proc_handler_new
Message-ID: <202311252331.C9ABVKC2-lkp@intel.com>
References: <20231125-const-sysctl-v1-7-5e881b0e0290@weissschuh.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125-const-sysctl-v1-7-5e881b0e0290@weissschuh.net>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 0f5cc96c367f2e780eb492cc9cab84e3b2ca88da]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/sysctl-add-helper-sysctl_run_handler/20231125-205506
base:   0f5cc96c367f2e780eb492cc9cab84e3b2ca88da
patch link:    https://lore.kernel.org/r/20231125-const-sysctl-v1-7-5e881b0e0290%40weissschuh.net
patch subject: [PATCH RFC 7/7] treewide: sysctl: migrate proc_dointvec to proc_handler_new
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231125/202311252331.C9ABVKC2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311252331.C9ABVKC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311252331.C9ABVKC2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/scsi_sysctl.c:20:27: error: initialization of 'int (*)(struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(struct ctl_table *, int,  void *, long unsigned int *, long long int *)'} from incompatible pointer type 'int (*)(const struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(const struct ctl_table *, int,  void *, long unsigned int *, long long int *)'} [-Werror=incompatible-pointer-types]
      20 |           .proc_handler = proc_dointvec },
         |                           ^~~~~~~~~~~~~
   drivers/scsi/scsi_sysctl.c:20:27: note: (near initialization for 'scsi_table[0].proc_handler')
   cc1: some warnings being treated as errors


vim +20 drivers/scsi/scsi_sysctl.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  13  
^1da177e4c3f41 Linus Torvalds    2005-04-16  14  
592749e4d05fb6 Joe Perches       2014-06-06  15  static struct ctl_table scsi_table[] = {
894d2491153a9f Eric W. Biederman 2009-11-05  16  	{ .procname	= "logging_level",
^1da177e4c3f41 Linus Torvalds    2005-04-16  17  	  .data		= &scsi_logging_level,
^1da177e4c3f41 Linus Torvalds    2005-04-16  18  	  .maxlen	= sizeof(scsi_logging_level),
^1da177e4c3f41 Linus Torvalds    2005-04-16  19  	  .mode		= 0644,
6d4561110a3e9f Eric W. Biederman 2009-11-16 @20  	  .proc_handler	= proc_dointvec },
^1da177e4c3f41 Linus Torvalds    2005-04-16  21  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
