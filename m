Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38B4EBC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 04:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680841709; x=1712377709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rf3eZQKxhz7KPhbsZti8SDOGcaMsEYFtK2rF2QyHge8=;
  b=jGyVY/wpswGMJD8V/sv8rMpfWjKuWki0z3IlIakVE0VNYbq0fniNQGkr
   UR3JCX+HZCPCU9/nxrtGuH/8Y0SttXSn/kGpLFVQBCPSL7gq4SB/fdEXz
   Xx/XU8CUHyBxUQlE1Clw5K0TJa+flmtSJuL4Q92FR03/wEOl3TF9qfpaa
   N3syiYPuAkYMMIdCZXY7I2kAxt3nGmDkwv4QMEysbeio0+HSc0ZlNPYWn
   CLSQScurckVOBaTyOqrF1nRjXGHAOrl1c5smF0ZTcHOppXjT8PK/DA+Q0
   TSk9Zqo4P4V9XGgfZ3WWzlza5xVdbcPzDT2vmoWOZWoi2zZ/TcnJKvlw0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326995390"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="326995390"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 21:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861675510"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="861675510"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Apr 2023 21:28:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkdi7-000S8E-1A;
	Fri, 07 Apr 2023 04:28:27 +0000
Date: Fri, 7 Apr 2023 12:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-for-next 11/13] block/mq-deadline.c:392:36: error:
 implicit declaration of function 'blk_rq_zone_no'; did you mean
 'bdev_zone_no'?
Message-ID: <202304071219.nIZISs1S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux block-for-next
head:   aa3a56b35f7420ada52515e9815855ed43da6726
commit: 06a57d772ff0414e2f80603f54f5cf69adf42f2a [11/13] block: mq-deadline: Fix a race condition related to zoned writes
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230407/202304071219.nIZISs1S-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/06a57d772ff0414e2f80603f54f5cf69adf42f2a
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche block-for-next
        git checkout 06a57d772ff0414e2f80603f54f5cf69adf42f2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071219.nIZISs1S-lkp@intel.com/

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
