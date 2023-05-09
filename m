Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FED19909
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 21:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683668036; x=1715204036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LxfhN7twkbsXW4buKGDFp0m82yxZW5uwWpLzdxIpSC8=;
  b=iqBGjh5irG7x2Mofj3OJr74fNj2tNiKTanjninbxtPza93OpaX4vCcdj
   Bkh8DJn/4X7RjXq9mbQFaDPGL2Z6xZbkyY8E62LjPoX/SFrYvOVm3Qa0Q
   AjRUvTnAfb8s4sPA6s6a9KsKhs7qxnXHm+TTGMfwkGNavYLQh6qJt4ZyD
   eUMkc1NDnJ4xwZKQ89qjQ7A7rym099NpTocD6PQ/6jt9ZVYNabxn/E2+1
   LXDqWdVAQxSqgMi+o47ZYPr8tq0Ti/Of2W1cQvs1+qkO/u/CtpSksq+rl
   5vmUqwQllzWlhp73RxRv0e7U5kq6iFyVQnuy9tCjR1I7LToF+40i4+/2r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="330421321"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="330421321"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 14:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="729693392"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="729693392"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 May 2023 14:33:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwUxz-0002WE-0b;
	Tue, 09 May 2023 21:33:51 +0000
Date: Wed, 10 May 2023 05:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ed Tsai <ed.tsai@mediatek.com>, axboe@kernel.dk
Cc: oe-kbuild-all@lists.linux.dev, linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com, bvanassche@acm.org,
	stanley.chu@mediatek.com, peter.wang@mediatek.com,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
	powen.kao@mediatek.com, naomi.chu@mediatek.com,
	wsd_upstream@mediatek.com, Ed Tsai <ed.tsai@mediatek.com>
Subject: Re: [PATCH 1/2] block: make the fair sharing of tag configurable
Message-ID: <202305100557.gdIvlzRS-lkp@intel.com>
References: <20230509065230.32552-2-ed.tsai@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509065230.32552-2-ed.tsai@mediatek.com>

Hi Ed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on jejb-scsi/for-next mkp-scsi/for-next linus/master v6.4-rc1 next-20230509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ed-Tsai/block-make-the-fair-sharing-of-tag-configurable/20230509-145439
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230509065230.32552-2-ed.tsai%40mediatek.com
patch subject: [PATCH 1/2] block: make the fair sharing of tag configurable
config: openrisc-randconfig-r022-20230509 (https://download.01.org/0day-ci/archive/20230510/202305100557.gdIvlzRS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b1081024bc6d1cdaf5b39994b19040cd8e6099ec
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ed-Tsai/block-make-the-fair-sharing-of-tag-configurable/20230509-145439
        git checkout b1081024bc6d1cdaf5b39994b19040cd8e6099ec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100557.gdIvlzRS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-mq.c:12:
   block/blk-mq.c: In function 'blk_mq_init_allocated_queue':
>> include/linux/blkdev.h:569:39: warning: left shift count >= width of type [-Wshift-count-overflow]
     569 |                                  (1UL << QUEUE_FLAG_FAIR_TAG_SHARING))
         |                                       ^~
   block/blk-mq.c:4232:27: note: in expansion of macro 'QUEUE_FLAG_MQ_DEFAULT'
    4232 |         q->queue_flags |= QUEUE_FLAG_MQ_DEFAULT;
         |                           ^~~~~~~~~~~~~~~~~~~~~


vim +569 include/linux/blkdev.h

   565	
   566	#define QUEUE_FLAG_MQ_DEFAULT	((1UL << QUEUE_FLAG_IO_STAT) |		\
   567					 (1UL << QUEUE_FLAG_SAME_COMP) |	\
   568					 (1UL << QUEUE_FLAG_NOWAIT) |		\
 > 569					 (1UL << QUEUE_FLAG_FAIR_TAG_SHARING))
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
