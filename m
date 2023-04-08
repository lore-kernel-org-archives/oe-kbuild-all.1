Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEDC10E3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 03:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680923907; x=1712459907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wT0iIUtDPnf2JAtyEAeYhgrmL6MtXRd5LCQJ6D/oIsE=;
  b=M4RPz3IFo1eR7Gbrm4mTC7SzzICuWXdDfDHpOgPCl1H2rnZZD3UGxVqx
   kMrG7Oyxvjpa8el/uFv3TjIoow3ZkKie3L0H4z5oBaaS6Db2rapATfGCX
   aWZ2A/SHeAtqV6kU/X8G+0yxp/kvVI3QZGp5QNZArx7dXXDXFVWPnOWUp
   j79WGVNWfD7WDfzVE6LGEpQgIz1BVu2shuxmHFnRMZLsYcxiXrn+3ux9a
   4Rk3lG91wZ/OYaf6bIFXqSkliOB+nZk7RCqQ8ZlSCU/Sj/BOEYqaUJWuw
   YZhCquhhQ3JOeGJC5CkyVrT+OffcxJKaOCzcJeXxjPhtxzxokaz4EFyLo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="331765141"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="331765141"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 20:18:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="690221818"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="690221818"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2023 20:18:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkz5t-000TF5-1A;
	Sat, 08 Apr 2023 03:18:25 +0000
Date: Sat, 8 Apr 2023 11:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 11/12] block: mq-deadline: Fix a race condition related
 to zoned writes
Message-ID: <202304081128.OL6BHqTs-lkp@intel.com>
References: <20230407001710.104169-12-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407001710.104169-12-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/block-Send-zoned-writes-to-the-I-O-scheduler/20230407-081846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230407001710.104169-12-bvanassche%40acm.org
patch subject: [PATCH 11/12] block: mq-deadline: Fix a race condition related to zoned writes
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230408/202304081128.OL6BHqTs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/10abd923538d71bd2d53f8d8ec2f7bbfe746e6cb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bart-Van-Assche/block-Send-zoned-writes-to-the-I-O-scheduler/20230407-081846
        git checkout 10abd923538d71bd2d53f8d8ec2f7bbfe746e6cb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081128.OL6BHqTs-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/mq-deadline.c: In function 'deadline_next_request':
>> block/mq-deadline.c:392:36: error: implicit declaration of function 'blk_rq_zone_no'; did you mean 'bdev_zone_no'? [-Werror=implicit-function-declaration]
     392 |                 unsigned int zno = blk_rq_zone_no(rq);
         |                                    ^~~~~~~~~~~~~~
         |                                    bdev_zone_no
   cc1: some warnings being treated as errors


vim +392 block/mq-deadline.c

   362	
   363	/*
   364	 * For the specified data direction, return the next request to
   365	 * dispatch using sector position sorted lists.
   366	 */
   367	static struct request *
   368	deadline_next_request(struct deadline_data *dd, struct dd_per_prio *per_prio,
   369			      enum dd_data_dir data_dir)
   370	{
   371		struct request_queue *q;
   372		struct request *rq;
   373		unsigned long flags;
   374	
   375		rq = per_prio->next_rq[data_dir];
   376		if (!rq)
   377			return NULL;
   378	
   379		q = rq->q;
   380		if (data_dir == DD_READ || !blk_queue_is_zoned(q))
   381			return rq;
   382	
   383		/*
   384		 * Look for a write request that can be dispatched, that is one with
   385		 * an unlocked target zone. For some HDDs, breaking a sequential
   386		 * write stream can lead to lower throughput, so make sure to preserve
   387		 * sequential write streams, even if that stream crosses into the next
   388		 * zones and these zones are unlocked.
   389		 */
   390		spin_lock_irqsave(&dd->zone_lock, flags);
   391		while (rq) {
 > 392			unsigned int zno = blk_rq_zone_no(rq);
   393	
   394			if (blk_req_can_dispatch_to_zone(rq))
   395				break;
   396	
   397			WARN_ON_ONCE(!blk_queue_is_zoned(q));
   398	
   399			if (!blk_queue_nonrot(q)) {
   400				rq = deadline_skip_seq_writes(dd, rq);
   401				if (!rq)
   402					break;
   403				rq = deadline_earlier_request(rq);
   404				if (WARN_ON_ONCE(!rq))
   405					break;
   406			}
   407	
   408			/*
   409			 * Skip all other write requests for the zone with zone number
   410			 * 'zno'. This prevents that this function selects a zoned write
   411			 * that is not the first write for a given zone.
   412			 */
   413			while ((rq = deadline_latter_request(rq)) &&
   414			       blk_rq_zone_no(rq) == zno)
   415				;
   416		}
   417		spin_unlock_irqrestore(&dd->zone_lock, flags);
   418	
   419		return rq;
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
