Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E981C101E1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 15:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694013618; x=1725549618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wuwLxDXMo6bh4eWHtMmcfv6H8BOiA61dOGDxhl09R+8=;
  b=GD4QU8PYvaB4W5qy//q09Y2GzjkOtO3CZh8GkPj8pMXyg5aTtlso8VQf
   wNUBrvB2jy17CvjGWq5yHUJMNduQxy2zQmksPR+ZRTBLGemimn/5oMatk
   8azu6HLOz8l+U0PrqKsvCOCtAQ1X45ZE/A7WPSt/LKKLaTLUmqjxxYUX0
   cLwlM/mGbZhlqT7TYudbBnMCpYebAsXUZvZnCWEfUbYBqqFbsBic0L0ww
   eBLeggBhgihp+4W9nrXMmZC1PXQ7+6FpWsAwSH2QZWrlDF/aIdzWt8XLw
   s8W+F/MlyV0TXxJD1QpVTGooqyqyMDMnTgRgrcHdDPWZpsbbFuqxyeEoF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="375996195"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="375996195"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 08:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="770803964"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="770803964"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Sep 2023 08:20:16 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qduKE-0000KF-1C;
	Wed, 06 Sep 2023 15:20:14 +0000
Date: Wed, 6 Sep 2023 23:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 1/4] nvmet-trace: avoid dereferencing pointer too early
Message-ID: <202309062255.pYH5WG3z-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on hch-configfs/for-next]
[also build test WARNING on linus/master v6.5 next-20230906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Wagner/nvmet-trace-avoid-dereferencing-pointer-too-early/20230829-171734
base:   git://git.infradead.org/users/hch/configfs.git for-next
patch link:    https://lore.kernel.org/r/20230829091350.16156-2-dwagner%40suse.de
patch subject: [RFC v1 1/4] nvmet-trace: avoid dereferencing pointer too early
config: x86_64-randconfig-122-20230906 (https://download.01.org/0day-ci/archive/20230906/202309062255.pYH5WG3z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309062255.pYH5WG3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309062255.pYH5WG3z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/trace.c:214:12: sparse: sparse: symbol 'nvmet_trace_ctrl_name' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
