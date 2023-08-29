Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0323F14AAF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 20:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693341535; x=1724877535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wyo+0+cwoSn1/zHxwdeLTnbsjkTxTkkE4HlpyFcImWY=;
  b=WW1BGvb5sNkAnfctVqtGk0pikNG6Q4T03jRR7RYhqmq/iXOEAxlGohjh
   gjGpjdNqGHRqrl0dZEimkcIaP1musb7mq+U6rXWc8aUKmkpi7kL+ltBf9
   0klaXoW4h0pfcMGLcSS6bhgDoZVRqu6+LXbyo3rWwZKoCGPQHoNyHfRHA
   rLWra+OYoFBwwL2MVRjAF6epqnATHfxhxfbFFCkc7rUI4MFFcEbEmG7k3
   kA44o2YP4Dxw0C7GDVXfAg3odrvs21e4XgLsLSlo5Jtyl83Rp0ppca9B8
   Fo1rc55M4YX/2vlPOOf2aKsT839IQoGzmedj7GdFr7w7JXlO5FXMMWAdg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441835616"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="441835616"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 13:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912537096"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="912537096"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Aug 2023 13:38:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb5U6-00093f-1i;
	Tue, 29 Aug 2023 20:38:46 +0000
Date: Wed, 30 Aug 2023 04:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 1/4] nvmet-trace: avoid dereferencing pointer too early
Message-ID: <202308300456.n1DBoTie-lkp@intel.com>
References: <20230829091350.16156-2-dwagner@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829091350.16156-2-dwagner@suse.de>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on hch-configfs/for-next]
[also build test ERROR on linus/master v6.5 next-20230829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Wagner/nvmet-trace-avoid-dereferencing-pointer-too-early/20230829-171734
base:   git://git.infradead.org/users/hch/configfs.git for-next
patch link:    https://lore.kernel.org/r/20230829091350.16156-2-dwagner%40suse.de
patch subject: [RFC v1 1/4] nvmet-trace: avoid dereferencing pointer too early
config: i386-randconfig-013-20230830 (https://download.01.org/0day-ci/archive/20230830/202308300456.n1DBoTie-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300456.n1DBoTie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300456.n1DBoTie-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "nvmet_trace_ctrl_id" [drivers/nvme/target/nvmet.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
