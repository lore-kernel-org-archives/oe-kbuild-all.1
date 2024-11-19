Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1BE1384BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 02:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731983834; cv=none; b=KQX2qmreFOlaOPvuqMYflDwZuHjTnEGfDf6+g8gOKiY2Dnd2mfd9GbnnOI5ZMjICRqC0FHgwONqToBT/RVqOybzRSrwudoUdB4TtcFqytiT58kGAC52I2z/rU0BY607TZpZKRo2nPfvYKsMd7bOm0tQBVvvl5KmIarEiqOAIenU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731983834; c=relaxed/simple;
	bh=ff9SFhzY7wlGCaS8e/TReGZ3YqN9gM3q3EWl5O5oTlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VrEsyIV/FH8m8Iy35nXwFd9qJrR7gJ4w/o/ndZini67Ylc4eO+T5PGGrYFA2xXslmFS6x+xB0NQnl7s5o7zFNARCz4A/nW/DaKa36jE4SrqbbMcLqZaduV/YjrNEx9CaDUvMyQoSD1Ht4dbPC9sDmcEVJYOPG+Ykw/LL/FSwnOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWIgGDrl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWIgGDrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731983833; x=1763519833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ff9SFhzY7wlGCaS8e/TReGZ3YqN9gM3q3EWl5O5oTlI=;
  b=GWIgGDrlk6tsB89PvYmSr/OVJEMZ4e1SfpEYMZA65I/FbIwGdhsnDKbS
   lgsS6oI4/1J1vh34qNwsKLheOJ+/CI64RVxEVBhH2CqTMVWzzquvVN1b0
   82DbqxvL4uD6jkvLDN3z8D3TlI+CwKVOkgBsMMNbozkaTEMD6V57ADwQC
   uMTaGqQ/KqPo6F6+U518xob9Ge4cHzskMZc9itWEUPQmkuGnMVFTABlNo
   HmiqiDDrltd2BKBugKgl0U2Mec8br/f3Cn7pVau3CTpkVbHJRDCzSLO5a
   b+6aWXKQ39YvvxJhyoHqyFTu6F+Bh+eFHjXYfURPLyUL22X12WzDOWFXQ
   w==;
X-CSE-ConnectionGUID: A8FfLvN6Slqx2xAINFn35w==
X-CSE-MsgGUID: i2JT1SLzRbG1FOwnUYSd5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31374587"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31374587"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:37:12 -0800
X-CSE-ConnectionGUID: feOZi5lTSwakQavf/Tna2g==
X-CSE-MsgGUID: SnRi0kmdQ+CerQaNH1QeJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="112715617"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Nov 2024 18:37:11 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDE6w-000032-00;
	Tue, 19 Nov 2024 02:37:09 +0000
Date: Tue, 19 Nov 2024 10:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/zen-sauce 20/31] block/elevator.c:570:42: error: passing
 argument 1 of 'elevator_find_get' from incompatible pointer type
Message-ID: <202411190930.582jXUNa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/zen-sauce
head:   a77e5dc91c4328da8b938f220477e8de98165075
commit: 6912e177e46c2a6e0650395cf13039bfcfc1af86 [20/31] ZEN: INTERACTIVE: Use Kyber as the elevator for MQ devices
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241119/202411190930.582jXUNa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190930.582jXUNa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190930.582jXUNa-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/elevator.c: In function 'elevator_get_default':
>> block/elevator.c:570:42: error: passing argument 1 of 'elevator_find_get' from incompatible pointer type [-Werror=incompatible-pointer-types]
     570 |                 return elevator_find_get(q, "kyber");
         |                                          ^
         |                                          |
         |                                          struct request_queue *
   block/elevator.c:109:60: note: expected 'const char *' but argument is of type 'struct request_queue *'
     109 | static struct elevator_type *elevator_find_get(const char *name)
         |                                                ~~~~~~~~~~~~^~~~
>> block/elevator.c:570:24: error: too many arguments to function 'elevator_find_get'
     570 |                 return elevator_find_get(q, "kyber");
         |                        ^~~~~~~~~~~~~~~~~
   block/elevator.c:109:30: note: declared here
     109 | static struct elevator_type *elevator_find_get(const char *name)
         |                              ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/elevator_find_get +570 block/elevator.c

   557	
   558	/*
   559	 * For single queue devices, default to using mq-deadline. If we have multiple
   560	 * queues or mq-deadline is not available, default to "none".
   561	 */
   562	static struct elevator_type *elevator_get_default(struct request_queue *q)
   563	{
   564		if (q->tag_set->flags & BLK_MQ_F_NO_SCHED_BY_DEFAULT)
   565			return NULL;
   566	
   567		if (q->nr_hw_queues != 1 &&
   568		    !blk_mq_is_shared_tags(q->tag_set->flags))
   569	#if defined(CONFIG_ZEN_INTERACTIVE) && defined(CONFIG_MQ_IOSCHED_KYBER)
 > 570			return elevator_find_get(q, "kyber");
   571	#elif defined(CONFIG_ZEN_INTERACTIVE)
   572			return elevator_find_get(q, "mq-deadline");
   573	#else
   574			return NULL;
   575	#endif
   576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
