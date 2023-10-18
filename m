Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD684311A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 02:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzR9B8SP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697597623; x=1729133623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XRBTX3nMq95vshwk7VT4ItcDuMRIOKTvp4LOww3J9sM=;
  b=dzR9B8SP7KAXY2MpERhGOi7PCDcMvMYONn/NvVP9y3DeiAV6wy79+mU7
   8c8AfczCft7rn7rzZW4wNUNFAGPtlK3Vg/ocYiOdxSiWjZHexsRNFjVAi
   D3bG6Td6IRcJqxk8jfAOLHH763/9ZVKeA2CvB0fVgALQezzBSK0drUyHV
   CA/SNS9erBcAMrqN5CjVVqTZWwlkDxuxfU+91zQP8l0F53ocg6pKq7ZU0
   YgYtPpW2JskHtJks6K+1nuZpnlzuVz7P6yttwstQJduMwqxDIHZm7z3/N
   b2BgjEL7LQSBjqpsXzpS83+0B2rq3PDa4wI9R2VJ48s0J8h4NjNAaPbxn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="370986390"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="370986390"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 19:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826688637"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="826688637"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2023 19:53:34 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qswge-000APi-1E;
	Wed, 18 Oct 2023 02:53:32 +0000
Date: Wed, 18 Oct 2023 10:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	maple-tree@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	willy@infradead.org, liam.howlett@oracle.com,
	zhangpeng.00@bytedance.com,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH 1/3] maple_tree: introduce mas_prealloc_calc()
Message-ID: <202310181030.sYP91twn-lkp@intel.com>
References: <20231009201639.920512-2-sidhartha.kumar@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009201639.920512-2-sidhartha.kumar@oracle.com>

Hi Sidhartha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.6-rc6 next-20231017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sidhartha-Kumar/maple_tree-introduce-mas_prealloc_calc/20231010-041859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231009201639.920512-2-sidhartha.kumar%40oracle.com
patch subject: [PATCH 1/3] maple_tree: introduce mas_prealloc_calc()
config: i386-randconfig-061-20231018 (https://download.01.org/0day-ci/archive/20231018/202310181030.sYP91twn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181030.sYP91twn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181030.sYP91twn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:5428:5: sparse: sparse: symbol 'mas_prealloc_calc' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
