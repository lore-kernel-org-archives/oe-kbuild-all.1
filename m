Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D066219BD9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 23:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687390284; x=1718926284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yjGBrgrevFSw4OXkgtuL77NceT89pBKsDSYr1AhZSCQ=;
  b=SGOnbIZPi+1pSOztomY5uGQhIVBPr0Nb/1hnTILY2oVQU479PTFMvMh4
   4yHMuD9M5mz4sbjKRoCc6Jfc6UJUTymBzx1HAdnSeiy1PzEaoHtVA6Oyr
   2O2l9whsvEc7U+9nTuFElq8YgWtO/5Cc45FK7UXKvRDWrI+AqO/l+Zk/R
   2nuvbRD7bFYLzUo5C3YBZY0iv6Gxwulz9RXZFq5tCb67BbuBHqxpSekIv
   FKPAEYqdYxB4hDSL5B9R2t20NcxfhxB5jSXgMvEqMC932WmX4PytrVxfX
   3pp/x6YviBk7J5qBsvs07YzZ2U++IzxV6pQWdFpoaoP82tGPIEIDv8Hcw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360352022"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="360352022"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 16:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="692034378"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="692034378"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Jun 2023 16:31:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC7IH-00079t-1a;
	Wed, 21 Jun 2023 23:31:21 +0000
Date: Thu, 22 Jun 2023 07:30:24 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/4] filemap: use minimum order while allocating folios
Message-ID: <202306220746.W5YUD7lG-lkp@intel.com>
References: <20230621083823.1724337-3-p.raghav@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621083823.1724337-3-p.raghav@samsung.com>

Hi Pankaj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on axboe-block/for-next linus/master v6.4-rc7 next-20230621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/fs-Allow-fine-grained-control-of-folio-sizes/20230621-172322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230621083823.1724337-3-p.raghav%40samsung.com
patch subject: [RFC 2/4] filemap: use minimum order while allocating folios
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230622/202306220746.W5YUD7lG-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220746.W5YUD7lG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220746.W5YUD7lG-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: mm/readahead.o: in function `readahead_expand':
>> readahead.c:(.text+0x1180): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
