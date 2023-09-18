Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6171CAA4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043202; x=1726579202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ykgUdcAyff68JbKMpOfYfrK6kmGZcZxRKCMtU2anr+I=;
  b=OlqTThdUKqUh+WKrN7wwZ8HsShOZJ1tQ/+xy6U1czZoqEsS/8jokcdDS
   ielhXCmAK7AqPPbzpRzw7//dwA15vVTnMftZDQX1FXF0aiJSGvuPDfBc8
   lIZl5Fojc+yftzJEMgCCchT4bnAfdZ3rq2VWHPbD9td4l92bOsVVnH0Am
   7ofBrgTtwY68IGuUj7+8hokwBafnh92n0ZOPXlOLtGzeUrkdS3XN0tZ1M
   YRyLaPZsQU5GGtFCWJ2s93t3MdZ5plrRlcBgEGR5PHdDtHYWGbWYCU9jI
   ZUY9OlQulDZOSOT7AIc4v9CEjiq91XdZT5A1tgKzBBW4WovAEdyzGJWZ2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113309"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113309"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342022"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342022"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 18 Sep 2023 06:12:19 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiE2z-00067M-0D;
	Mon, 18 Sep 2023 13:12:17 +0000
Date: Mon, 18 Sep 2023 21:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>, Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Pankaj Raghav <p.raghav@samsung.com>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH 08/18] mm/readahead: allocate folios with mapping order
 preference
Message-ID: <202309182020.nSchrF93-lkp@intel.com>
References: <20230918110510.66470-9-hare@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918110510.66470-9-hare@suse.de>

Hi Hannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.6-rc2 next-20230918]
[cannot apply to xfs-linux/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/mm-readahead-rework-loop-in-page_cache_ra_unbounded/20230918-190732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230918110510.66470-9-hare%40suse.de
patch subject: [PATCH 08/18] mm/readahead: allocate folios with mapping order preference
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230918/202309182020.nSchrF93-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309182020.nSchrF93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309182020.nSchrF93-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/readahead.o: in function `readahead_expand':
>> readahead.c:(.text+0x17b): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
