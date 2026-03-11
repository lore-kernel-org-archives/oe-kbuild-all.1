Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE7FEEC0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 05:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205360; cv=none; b=o8nqogYgyCciIxbIB9+8Tvjt8UYGMZ7hPYZeMiKe/2AFT7pydIKuHy/pbuK5O9aPg16f3CEGjbddtdF+Fexmp8wS73jzcp/98kz2ROwU4uFh2XTlx87ie7oFsJzqd3CeNeIXDQbyVQ8rknA8f4JEEkwOB9tU3mw2n8Z0JdAAwB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205360; c=relaxed/simple;
	bh=/NFayhotEC2pRiVXoWXnhM+/ypbktFDxQctUmEqhiJ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bAEuAKsa8fQTKmpYY5lVGSMQrg4l9TB1nWgIEse0oceen/C6yHpSI1xIbkAVjQb/pOsFDXEXhGaERsqpaaRvNtjQuigfHC5kxgs18R0WKvDwWVD+EGr6kEKmvgupKHdUuDdLTKlFFaXY4Z0i4StSjV/whqYcYQJ7TXvdbmD/XFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhYWJlce; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhYWJlce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773205359; x=1804741359;
  h=date:from:to:cc:subject:message-id;
  bh=/NFayhotEC2pRiVXoWXnhM+/ypbktFDxQctUmEqhiJ8=;
  b=dhYWJlceG4bvFsARxn0hP11atX2s8Z9NoWkESzXHxm6ys/Y5qldKofzv
   QutrUXM0bzTpnXJBcWNp1tyujyiKBU4i1t077bxdXNmFzgA5nQzCXvuFS
   tTFhCUhXmcqVLqKcbfO3epJ7hlAPUGNJfiXIJimsGgsCqht66VHENc9ri
   m076SPKGjQb/5aG1mdruk/wM0Mc82uo5geUEp74LZGnXeufyC7xOk/VHI
   cZcp0kzMIKssWmuW88ejwTPmEj5S0SjVxSGfknPg36JGy2uE/JceAQSH3
   lsUF5OQ3R91jhS84ETlJE9JfsJqnRowKrsZgKpeIzmGEZ5u17krG42nLV
   Q==;
X-CSE-ConnectionGUID: AJ5CDLNsRoGNC0cAkpdVCA==
X-CSE-MsgGUID: F6tWO962Qhi/I6a21W91XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74382762"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74382762"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 22:02:38 -0700
X-CSE-ConnectionGUID: r/vUCdhOQD2eYFqLCZiPWw==
X-CSE-MsgGUID: fuuzEj8KRyu0GsfeVYU4CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224515892"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Mar 2026 22:02:36 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0BiL-000000000ib-26zH;
	Wed, 11 Mar 2026 05:02:33 +0000
Date: Wed, 11 Mar 2026 13:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 17/17]
 include/linux/blkdev.h:1699:24: error: field 'req_list' has incomplete type
Message-ID: <202603111217.qTpmuxxQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   6ca2c2288ee8399eaf9532746cdb562577e09565
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [17/17] UPSTREAM: block: add a rq_list type
config: x86_64-randconfig-073-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111217.qTpmuxxQ-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111217.qTpmuxxQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111217.qTpmuxxQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/romfs/super.c:67:
>> include/linux/blkdev.h:1699:24: error: field 'req_list' has incomplete type
    1699 |         struct rq_list req_list;
         |                        ^~~~~~~~
--
   In file included from include/linux/blk-mq.h:5,
                    from include/scsi/scsi_host.h:11,
                    from include/linux/libata.h:21,
                    from drivers/pnp/resource.c:20:
>> include/linux/blkdev.h:1699:24: error: field 'req_list' has incomplete type
    1699 |         struct rq_list req_list;
         |                        ^~~~~~~~
   include/linux/blk-mq.h: In function 'rq_list_empty':
>> include/linux/blk-mq.h:239:18: error: invalid use of undefined type 'const struct rq_list'
     239 |         return rl->head == NULL;
         |                  ^~
   include/linux/blk-mq.h: In function 'rq_list_init':
>> include/linux/blk-mq.h:244:11: error: invalid use of undefined type 'struct rq_list'
     244 |         rl->head = NULL;
         |           ^~
   include/linux/blk-mq.h:245:11: error: invalid use of undefined type 'struct rq_list'
     245 |         rl->tail = NULL;
         |           ^~
   include/linux/blk-mq.h: In function 'rq_list_add_tail':
   include/linux/blk-mq.h:251:15: error: invalid use of undefined type 'struct rq_list'
     251 |         if (rl->tail)
         |               ^~
   include/linux/blk-mq.h:252:19: error: invalid use of undefined type 'struct rq_list'
     252 |                 rl->tail->rq_next = rq;
         |                   ^~
   include/linux/blk-mq.h:254:19: error: invalid use of undefined type 'struct rq_list'
     254 |                 rl->head = rq;
         |                   ^~
   include/linux/blk-mq.h:255:11: error: invalid use of undefined type 'struct rq_list'
     255 |         rl->tail = rq;
         |           ^~
   include/linux/blk-mq.h: In function 'rq_list_add_head':
   include/linux/blk-mq.h:260:25: error: invalid use of undefined type 'struct rq_list'
     260 |         rq->rq_next = rl->head;
         |                         ^~
   include/linux/blk-mq.h:261:11: error: invalid use of undefined type 'struct rq_list'
     261 |         rl->head = rq;
         |           ^~
   include/linux/blk-mq.h:262:16: error: invalid use of undefined type 'struct rq_list'
     262 |         if (!rl->tail)
         |                ^~
   include/linux/blk-mq.h:263:19: error: invalid use of undefined type 'struct rq_list'
     263 |                 rl->tail = rq;
         |                   ^~
   include/linux/blk-mq.h: In function 'rq_list_pop':
   include/linux/blk-mq.h:268:32: error: invalid use of undefined type 'struct rq_list'
     268 |         struct request *rq = rl->head;
         |                                ^~
   include/linux/blk-mq.h:271:19: error: invalid use of undefined type 'struct rq_list'
     271 |                 rl->head = rl->head->rq_next;
         |                   ^~
   include/linux/blk-mq.h:271:30: error: invalid use of undefined type 'struct rq_list'
     271 |                 rl->head = rl->head->rq_next;
         |                              ^~
   include/linux/blk-mq.h:272:24: error: invalid use of undefined type 'struct rq_list'
     272 |                 if (!rl->head)
         |                        ^~
   include/linux/blk-mq.h:273:27: error: invalid use of undefined type 'struct rq_list'
     273 |                         rl->tail = NULL;
         |                           ^~
   include/linux/blk-mq.h: In function 'rq_list_peek':
   include/linux/blk-mq.h:282:18: error: invalid use of undefined type 'struct rq_list'
     282 |         return rl->head;
         |                  ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/req_list +1699 include/linux/blkdev.h

  1697	
  1698	struct io_comp_batch {
> 1699		struct rq_list req_list;
  1700		bool need_ts;
  1701		void (*complete)(struct io_comp_batch *);
  1702	};
  1703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
