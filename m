Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19340EDB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683996136; x=1715532136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OwNjPceV71+aWBV4fEF/G0q/Gi+UdMHfh518RarTyas=;
  b=ZpbYzUauSrn6DMA1Mz/GG/aZAlCehywTuDJ46kfuTBFIy+qt2bWnRAfM
   KnFg/Jc6nF1KhuLAJCURLwODk21ZqBl7s6OOxjQCl3jva/lFPfhipO/Bx
   lthCFAE7zZgQZWN1vUqdzM4uDsJX79TVgJgOf0C8/vdDb7R7EEDLkw8QE
   Q2T36zDQTMxaG7wSvsQmwxOUT27h0tc4XkkmGuLsQYTKa5Hg9bjoaBEAa
   PTTP/YEXZsvm7Oo+Tz4aipR6mL8uyYD5CEnAWBI/lTOQfJzxZ6C3pMK/J
   Wn08KOEsV52yaLXP/l6URXnRSZJ2BRcRrIXoDRzNnGfzYDwLzcGDd483K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="330589989"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="330589989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 09:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="812431269"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="812431269"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 May 2023 09:42:13 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxsJx-0005a8-0t;
	Sat, 13 May 2023 16:42:13 +0000
Date: Sun, 14 May 2023 00:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Tian Lan <tilan7663@gmail.com>, axboe@kernel.dk,
	linux-block@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Tian Lan <tian.lan@twosigma.com>
Subject: Re: [PATCH 1/1] blk-mq: fix blk_mq_hw_ctx active request accounting
Message-ID: <202305140028.fzLbBFSs-lkp@intel.com>
References: <20230513141234.8395-1-tilan7663@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230513141234.8395-1-tilan7663@gmail.com>

Hi Tian,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.4-rc1 next-20230512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tian-Lan/blk-mq-fix-blk_mq_hw_ctx-active-request-accounting/20230513-221329
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230513141234.8395-1-tilan7663%40gmail.com
patch subject: [PATCH 1/1] blk-mq: fix blk_mq_hw_ctx active request accounting
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230514/202305140028.fzLbBFSs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/f958f858d42c76e1439649993bd485ac02200f87
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tian-Lan/blk-mq-fix-blk_mq_hw_ctx-active-request-accounting/20230513-221329
        git checkout f958f858d42c76e1439649993bd485ac02200f87
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140028.fzLbBFSs-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-mq.c: In function 'blk_mq_put_rq_ref':
>> block/blk-mq.c:1574:66: error: expected ';' before '__blk_mq_free_request'
    1574 |                         __blk_mq_dec_active_requests(rq->mq_hctx)
         |                                                                  ^
         |                                                                  ;
    1575 | 
    1576 |                 __blk_mq_free_request(rq);
         |                 ~~~~~~~~~~~~~~~~~~~~~                             


vim +1574 block/blk-mq.c

  1566	
  1567	void blk_mq_put_rq_ref(struct request *rq)
  1568	{
  1569		if (is_flush_rq(rq)) {
  1570			if (rq->end_io(rq, 0) == RQ_END_IO_FREE)
  1571				blk_mq_free_request(rq);
  1572		} else if (req_ref_put_and_test(rq)) {
  1573			if (rq->rq_flags & RQF_MQ_INFLIGHT)
> 1574				__blk_mq_dec_active_requests(rq->mq_hctx)
  1575	
  1576			__blk_mq_free_request(rq);
  1577		}
  1578	}
  1579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
