Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F0023BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 10:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681815456; x=1713351456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zT4sNd7nGomkJnV8cUASlvdLDrvQleYXOUOJU5Dlk/0=;
  b=Aabc1KeBM5jqpAtXN3Q0plAomwihyZGweHmQWtl/zkv0hhJrAX/mgnme
   99Upy++wGql71eChgmxQ8deMZOD/evwEITgJot/J1eycU8hK8TCvcacai
   O8nNjfP/LAbT8Ys6o7Kp/5dozWkLNzTterNN0yGlcvd3M+6n4NGTMp6TS
   gMqlV1vzVsnga1Cn0NbmcD5UKIfbOda6H4PI4Hx+rtQLFJFXQYoIt37ws
   VrAqs3U1onnBZnb6o1q9o0cXzbc5IXVCWeM7wJbctQ7759iLonGshe+iS
   hQPQS3u0XhuRcxhsu3L/RQ+yp49zhqMMjcLe+1hJqrhhUTgxCI71mP9EV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="329309173"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="329309173"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 03:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="755664066"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="755664066"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Apr 2023 03:57:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poj1i-000dI9-1U;
	Tue, 18 Apr 2023 10:57:34 +0000
Date: Tue, 18 Apr 2023 18:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:retain-zoned-write-order 15/15]
 block/mq-deadline.c:189:24: error: 'struct gendisk' has no member named
 'max_active_zones'
Message-ID: <202304181837.VCTT4sYB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux retain-zoned-write-order
head:   2bdceaa60eb460189b66d717bce55dc354512fe8
commit: 2bdceaa60eb460189b66d717bce55dc354512fe8 [15/15] block: mq-deadline: Respect the active zone limit
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230418/202304181837.VCTT4sYB-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/2bdceaa60eb460189b66d717bce55dc354512fe8
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche retain-zoned-write-order
        git checkout 2bdceaa60eb460189b66d717bce55dc354512fe8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181837.VCTT4sYB-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/mq-deadline.c: In function 'dd_check_zone':
>> block/mq-deadline.c:189:24: error: 'struct gendisk' has no member named 'max_active_zones'
     189 |         if (rq->q->disk->max_active_zones == 0)
         |                        ^~
   block/mq-deadline.c:206:49: error: 'struct gendisk' has no member named 'max_active_zones'
     206 |         return dd_active_zones(dd) < rq->q->disk->max_active_zones;
         |                                                 ^~
   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:29,
                    from block/mq-deadline.c:8:
   block/mq-deadline.c: In function 'dd_update_wp':
   block/mq-deadline.c:216:37: error: 'struct gendisk' has no member named 'max_active_zones'
     216 |         if (WARN_ON_ONCE(rq->q->disk->max_active_zones == 0))
         |                                     ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   block/mq-deadline.c:216:13: note: in expansion of macro 'WARN_ON_ONCE'
     216 |         if (WARN_ON_ONCE(rq->q->disk->max_active_zones == 0))
         |             ^~~~~~~~~~~~
   block/mq-deadline.c: In function 'dd_dispatch_request':
   block/mq-deadline.c:762:30: error: 'struct gendisk' has no member named 'max_active_zones'
     762 |         if (rq && rq->q->disk->max_active_zones)
         |                              ^~
   block/mq-deadline.c: In function 'dd_finish_request':
   block/mq-deadline.c:1080:24: error: 'struct gendisk' has no member named 'max_active_zones'
    1080 |         if (rq->q->disk->max_active_zones) {
         |                        ^~
   block/mq-deadline.c: In function 'dd_check_zone':
   block/mq-deadline.c:207:1: error: control reaches end of non-void function [-Werror=return-type]
     207 | }
         | ^
   block/mq-deadline.c: At top level:
   block/mq-deadline.c:461:24: warning: 'deadline_skip_seq_writes' defined but not used [-Wunused-function]
     461 | static struct request *deadline_skip_seq_writes(struct deadline_data *dd,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +189 block/mq-deadline.c

   177	
   178	/*
   179	 * Returns true if and only if dispatching request @rq won't cause the active
   180	 * zones limit to be exceeded.
   181	 */
   182	static bool dd_check_zone(struct deadline_data *dd, struct request *rq)
   183	{
   184		unsigned int zno = blk_rq_zone_no(rq);
   185		struct dd_zone *zone;
   186	
   187		lockdep_assert_held(&dd->lock);
   188	
 > 189		if (rq->q->disk->max_active_zones == 0)
   190			return true;
   191	
   192		switch (req_op(rq)) {
   193		case REQ_OP_WRITE:
   194		case REQ_OP_WRITE_ZEROES:
   195		case REQ_OP_ZONE_APPEND:
   196			break;
   197		default:
   198			return true;
   199		}
   200	
   201		hash_for_each_possible(dd->active_zones, zone, entry, zno)
   202			if (zone->zno == zno)
   203				return true; /* zone already open */
   204	
   205		/* zone is empty or closed */
   206		return dd_active_zones(dd) < rq->q->disk->max_active_zones;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
