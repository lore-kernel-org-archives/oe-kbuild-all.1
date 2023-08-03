Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E642B25154
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 18:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691089130; x=1722625130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OJrzy2Vu0/03o5sdYpoeYg0tdpHUHZUmPmTND63DoHc=;
  b=KfEQ1aQiKz0zVrfFb1XrFrPOoVKKURu3MkT+L5FzRPL1E+hOX2dIpPot
   GKquN4qXibtTAM9RxzE9mbkCbX4dyG1j3bDUq+kcOgNdhvorEYLEvmqFG
   axcii2y2MmGod709f+iqsl2Ncwm+gs0S+Aqcm52flWgvYOsu0f8QTmi3k
   oQrLTxRiMpp2ytEJtvEahNP61LGgkzAIAT5HcXWrzcpgiQRni42b4ct+h
   +DckM7/dXmS/p6KCkIkOz+oWbWvtpBjNWRMQ+GQKCuKKenR3uD31VEXJL
   r3L1e1IJGc4zJMxu6t+I/KtYBIMsU6ro5CCQDYB3NW7vd8vXWkiTwHN6s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436291582"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="436291582"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 11:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="819798157"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="819798157"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2023 11:58:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRdX3-0002IV-0X;
	Thu, 03 Aug 2023 18:58:45 +0000
Date: Fri, 4 Aug 2023 02:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>,
	Ming Lei <ming.lei@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@infradead.org>,
	gost.dev@samsung.com, linux-block@vger.kernel.org,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	Matias Bjorling <Matias.Bjorling@wdc.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Minwoo Im <minwoo.im.dev@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	Johannes Thumshirn <jth@kernel.org>,
	Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/3] ublk: enable zoned storage support
Message-ID: <202308040229.pFTUh2cG-lkp@intel.com>
References: <20230803140701.18515-4-nmi@metaspace.dk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803140701.18515-4-nmi@metaspace.dk>

Hi Andreas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Hindborg-Samsung/ublk-add-helper-to-check-if-device-supports-user-copy/20230803-224003
base:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
patch link:    https://lore.kernel.org/r/20230803140701.18515-4-nmi%40metaspace.dk
patch subject: [PATCH v10 3/3] ublk: enable zoned storage support
config: sh-randconfig-r024-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040229.pFTUh2cG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040229.pFTUh2cG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040229.pFTUh2cG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/block/ublk_drv.c: In function 'ublk_alloc_report_buffer':
>> drivers/block/ublk_drv.c:281:23: error: implicit declaration of function '__vmalloc'; did you mean '__kmalloc'? [-Werror=implicit-function-declaration]
     281 |                 buf = __vmalloc(bufsize, GFP_KERNEL | __GFP_NORETRY);
         |                       ^~~~~~~~~
         |                       __kmalloc
>> drivers/block/ublk_drv.c:281:21: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     281 |                 buf = __vmalloc(bufsize, GFP_KERNEL | __GFP_NORETRY);
         |                     ^
   cc1: some warnings being treated as errors


vim +281 drivers/block/ublk_drv.c

   264	
   265	/* Based on virtblk_alloc_report_buffer */
   266	static void *ublk_alloc_report_buffer(struct ublk_device *ublk,
   267					      unsigned int nr_zones, size_t *buflen)
   268	{
   269		struct request_queue *q = ublk->ub_disk->queue;
   270		size_t bufsize;
   271		void *buf;
   272	
   273		nr_zones = min_t(unsigned int, nr_zones,
   274				 ublk->ub_disk->nr_zones);
   275	
   276		bufsize = nr_zones * sizeof(struct blk_zone);
   277		bufsize =
   278			min_t(size_t, bufsize, queue_max_hw_sectors(q) << SECTOR_SHIFT);
   279	
   280		while (bufsize >= sizeof(struct blk_zone)) {
 > 281			buf = __vmalloc(bufsize, GFP_KERNEL | __GFP_NORETRY);
   282			if (buf) {
   283				*buflen = bufsize;
   284				return buf;
   285			}
   286			bufsize >>= 1;
   287		}
   288	
   289		*buflen = 0;
   290		return NULL;
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
