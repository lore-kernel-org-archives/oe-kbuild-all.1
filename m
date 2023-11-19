Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4231C3B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 10:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQfTdYII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700390269; x=1731926269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/+JN/zoMx/os+TZ5Z/lVCp+Ia1JUjOmqu4RwK/EqZyc=;
  b=ZQfTdYIIQ0/iyNv2o8JU/VwNJcQBhu0O3k90jO8/GhwMrU9cVcA2p38m
   iIVhkZh7qmId2+m3Fhv9+2imo5/WSwOyqg5lqFqAw7W31kbXnfk/fbUMF
   XvAQUvy/m1nHV9HS3fHu50R2ppH5dXZxrUVduGL8Tho4uUuII9fRF2qkB
   qe/T6it00GujLewHmG/7uadFOjbPJqCOVDLI1CcxBHXd71++uUzbZ2OC/
   pKeF8PqMvZFoNZO2tdDj3QScL//xu0uKx9ljgf6sFoP/DkD7lc90muay3
   GfIDL/rfKPHpx7QbuJecEln282+BB4FJo4UtKGCOnUpD8r7lbxRds7oFj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="477695110"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="477695110"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 02:37:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="13899646"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2023 02:37:47 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4fBP-0004zB-2L;
	Sun, 19 Nov 2023 10:37:43 +0000
Date: Sun, 19 Nov 2023 18:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: Shaohua Li <shli@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: block/blk-throttle.c:1498:43: warning: '%lu' directive output may be
 truncated writing between 1 and 20 bytes into a region of size 17
Message-ID: <202311191805.T3V1HGnn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   037266a5f7239ead1530266f7d7af153d2a867fa
commit: ec80991d6fc2cb17abfc5427ac1512d2ccd40589 blk-throttle: add interface for per-cgroup target latency
date:   7 years ago
config: x86_64-randconfig-r031-20230816 (https://download.01.org/0day-ci/archive/20231119/202311191805.T3V1HGnn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191805.T3V1HGnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191805.T3V1HGnn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/blk-throttle.c: In function 'tg_prfill_limit':
   block/blk-throttle.c:1491:74: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    1491 |                         snprintf(idle_time, sizeof(idle_time), " idle=%lu",
         |                                                                          ^
   block/blk-throttle.c:1491:25: note: 'snprintf' output between 8 and 27 bytes into a destination of size 26
    1491 |                         snprintf(idle_time, sizeof(idle_time), " idle=%lu",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1492 |                                 tg->idletime_threshold);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~
>> block/blk-throttle.c:1498:43: warning: '%lu' directive output may be truncated writing between 1 and 20 bytes into a region of size 17 [-Wformat-truncation=]
    1498 |                                 " latency=%lu", tg->latency_target);
         |                                           ^~~
   block/blk-throttle.c:1498:33: note: directive argument in the range [0, 18446744073709551614]
    1498 |                                 " latency=%lu", tg->latency_target);
         |                                 ^~~~~~~~~~~~~~
   block/blk-throttle.c:1497:25: note: 'snprintf' output between 11 and 30 bytes into a destination of size 26
    1497 |                         snprintf(latency_time, sizeof(latency_time),
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1498 |                                 " latency=%lu", tg->latency_target);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1498 block/blk-throttle.c

  1443	
  1444	static u64 tg_prfill_limit(struct seq_file *sf, struct blkg_policy_data *pd,
  1445				 int off)
  1446	{
  1447		struct throtl_grp *tg = pd_to_tg(pd);
  1448		const char *dname = blkg_dev_name(pd->blkg);
  1449		char bufs[4][21] = { "max", "max", "max", "max" };
  1450		u64 bps_dft;
  1451		unsigned int iops_dft;
  1452		char idle_time[26] = "";
  1453		char latency_time[26] = "";
  1454	
  1455		if (!dname)
  1456			return 0;
  1457	
  1458		if (off == LIMIT_LOW) {
  1459			bps_dft = 0;
  1460			iops_dft = 0;
  1461		} else {
  1462			bps_dft = U64_MAX;
  1463			iops_dft = UINT_MAX;
  1464		}
  1465	
  1466		if (tg->bps_conf[READ][off] == bps_dft &&
  1467		    tg->bps_conf[WRITE][off] == bps_dft &&
  1468		    tg->iops_conf[READ][off] == iops_dft &&
  1469		    tg->iops_conf[WRITE][off] == iops_dft &&
  1470		    (off != LIMIT_LOW ||
  1471		     (tg->idletime_threshold == tg->td->dft_idletime_threshold &&
  1472		      tg->latency_target == DFL_LATENCY_TARGET)))
  1473			return 0;
  1474	
  1475		if (tg->bps_conf[READ][off] != bps_dft)
  1476			snprintf(bufs[0], sizeof(bufs[0]), "%llu",
  1477				tg->bps_conf[READ][off]);
  1478		if (tg->bps_conf[WRITE][off] != bps_dft)
  1479			snprintf(bufs[1], sizeof(bufs[1]), "%llu",
  1480				tg->bps_conf[WRITE][off]);
  1481		if (tg->iops_conf[READ][off] != iops_dft)
  1482			snprintf(bufs[2], sizeof(bufs[2]), "%u",
  1483				tg->iops_conf[READ][off]);
  1484		if (tg->iops_conf[WRITE][off] != iops_dft)
  1485			snprintf(bufs[3], sizeof(bufs[3]), "%u",
  1486				tg->iops_conf[WRITE][off]);
  1487		if (off == LIMIT_LOW) {
  1488			if (tg->idletime_threshold == ULONG_MAX)
  1489				strcpy(idle_time, " idle=max");
  1490			else
  1491				snprintf(idle_time, sizeof(idle_time), " idle=%lu",
  1492					tg->idletime_threshold);
  1493	
  1494			if (tg->latency_target == ULONG_MAX)
  1495				strcpy(latency_time, " latency=max");
  1496			else
  1497				snprintf(latency_time, sizeof(latency_time),
> 1498					" latency=%lu", tg->latency_target);
  1499		}
  1500	
  1501		seq_printf(sf, "%s rbps=%s wbps=%s riops=%s wiops=%s%s%s\n",
  1502			   dname, bufs[0], bufs[1], bufs[2], bufs[3], idle_time,
  1503			   latency_time);
  1504		return 0;
  1505	}
  1506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
