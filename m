Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D204371
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 03:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbMcNWJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698031470; x=1729567470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=40azN6Oncc+Kef3wP13L+JbowD85+ev0nBrItz9EPio=;
  b=bbMcNWJ2ZJvwQ8ww+fKs/jDjsy5bt4AhlaJ0WoZPbIX8F7fl38Gb/Oj4
   /bjZ6GBizBUU0Ig/I8eoDGQ8Ne0drTvm5H2cT2DJOF4OVcNzFvTGdlEfp
   WzoXJlH+QJiqVjhssvAsKLItxQjpCDZa2ArKVkX3yyV1jgqDe14qsIE5A
   1WtyqSh8u0+g+1hJRIXv0PgL/rH/SRcmOJn/hNtf9ear37H1LDSAuHdWf
   GZFqZVKFdTWi6AfonrzDaK+rWxsk1I24mkcdvDLopNz4b9zAbSgwVWbyi
   t26tQ0SfpkYXRHcVyxSW3fON/kysIMRD5D/wRJvpOyZKb0sc+Ys7cibw2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="417890017"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="417890017"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 20:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="792985660"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="792985660"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Oct 2023 20:24:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qulYH-0006WP-0d;
	Mon, 23 Oct 2023 03:24:25 +0000
Date: Mon, 23 Oct 2023 11:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 8/8] blk-mq-tag: allow shared queue/hctx to get
 more driver tags
Message-ID: <202310231109.iysoP8pc-lkp@intel.com>
References: <20231021154806.4019417-9-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021154806.4019417-9-yukuai1@huaweicloud.com>

Hi Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on next-20231020]
[cannot apply to hch-configfs/for-next linus/master v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/blk-mq-factor-out-a-structure-from-blk_mq_tags/20231021-155339
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20231021154806.4019417-9-yukuai1%40huaweicloud.com
patch subject: [PATCH RFC v2 8/8] blk-mq-tag: allow shared queue/hctx to get more driver tags
config: sh-defconfig (https://download.01.org/0day-ci/archive/20231023/202310231109.iysoP8pc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310231109.iysoP8pc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310231109.iysoP8pc-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: block/blk-mq-tag.o: in function `__blk_mq_driver_tag_busy':
>> blk-mq-tag.c:(.text+0xa74): undefined reference to `__cmpxchg_called_with_bad_pointer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
