Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D7918E02
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 03:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708139470; cv=none; b=AimVvYEibZhVzlcWMVI0PJx3CMXNOXZe6GD8mJsptZdrUbOpbMxWjooc7/iz5msifB+27LLejGFjkVR1gbdP1KsjXJhyMVDByGJzWciAppQunDPD0+TXJgDGeVB0ynndWmaqkVu3Y2HlsW+lGUCH3p5BiMHgd20UlZeInwadnas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708139470; c=relaxed/simple;
	bh=p7msdvsEGIUkSY3TVwuYnfU9OVOoWKpUDcF525aM/ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I5EgKSRLEc6Xo2lL/t1rvulhspSm+4z1TyGohBWe5CyRqEV9YLEVApc4WGgxXKlEUVhdP4h6ZQAQKejM/EwTdGOLNqFoOv9y27RiljYLzHI8rnpOOWUTks5IAiTDShX39Yri2tsyLOm27JTcRPCO88leEQMKq7JIHqvadWVbzu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2/D54ES; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2/D54ES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708139469; x=1739675469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p7msdvsEGIUkSY3TVwuYnfU9OVOoWKpUDcF525aM/ds=;
  b=Z2/D54ESqDx4UDdWup11pYQSgdSCsCR8cHIC+yzB5ZPi5qSUfNOuAve3
   9hQMKbKaZvFKgOE2JLv05/0DD5uyWOYzK0ZVnbtuPqUb8FmrBt3RMV4QT
   0CxQqCMUZrhcBaBsro6H0mfGcwHpCm826rcV+P8LnYQPQ0gOeviYQzxQc
   D9fkKimGeMQv7/k3tE/3aKqstTNMl4Rw8YVNQDr+TLrGH6EKxlbVyEZd7
   HUyRNYLjRq/4UULTdQbQNU+VUK73ZYMwyzft4cLR0wHkBg4nrEOqYimlb
   46hnLCtBx50eTiRrckxypQ5yeWxbxpUurVPNxj0K2Scg5VzafyuTtAPFR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="19806922"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="19806922"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 19:11:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="35051248"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Feb 2024 19:11:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbB6W-0001mi-2y;
	Sat, 17 Feb 2024 03:11:04 +0000
Date: Sat, 17 Feb 2024 11:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 109/113]
 fs/bcachefs/bcachefs_format.h:254:1: warning: alignment 1 of 'struct bkey'
 is less than 4
Message-ID: <202402171108.TzcVdtks-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   f83873b0f3d124973127c44a3b7c9489d1c9cd57
commit: 9a555a741e807275c320807babd3f42efb8fee90 [109/113] bcachefs: omit alignment attribute on big endian struct bkey
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240217/202402171108.TzcVdtks-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402171108.TzcVdtks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171108.TzcVdtks-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:209,
                    from fs/bcachefs/backpointers.c:2:
>> fs/bcachefs/bcachefs_format.h:254:1: warning: alignment 1 of 'struct bkey' is less than 4 [-Wpacked-not-aligned]
     254 | ;
         | ^
   fs/bcachefs/bcachefs_format.h:221:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     221 |         struct bversion version;
         |                         ^~~~~~~


vim +254 fs/bcachefs/bcachefs_format.h

   208	
   209		/* Type of the value */
   210		__u8		type;
   211	
   212	#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
   213		__u8		pad[1];
   214	
   215		struct bversion	version;
   216		__u32		size;		/* extent size, in sectors */
   217		struct bpos	p;
   218	#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
   219		struct bpos	p;
   220		__u32		size;		/* extent size, in sectors */
   221		struct bversion	version;
   222	
   223		__u8		pad[1];
   224	#endif
   225	} __packed
   226	#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
   227	/*
   228	 * The big-endian version of bkey can't be compiled by rustc with the "aligned"
   229	 * attr since it doesn't allow types to have both "packed" and "aligned" attrs.
   230	 * So for Rust compatibility, don't include this. It can be included in the LE
   231	 * version because the "packed" attr is redundant in that case.
   232	 *
   233	 * History: (quoting Kent)
   234	 *
   235	 * Specifically, when i was designing bkey, I wanted the header to be no
   236	 * bigger than necessary so that bkey_packed could use the rest. That means that
   237	 * decently offten extent keys will fit into only 8 bytes, instead of spilling over
   238	 * to 16.
   239	 *
   240	 * But packed_bkey treats the part after the header - the packed section -
   241	 * as a single multi word, variable length integer. And bkey, the unpacked
   242	 * version, is just a special case version of a bkey_packed; all the packed
   243	 * bkey code will work on keys in any packed format, the in-memory
   244	 * representation of an unpacked key also is just one type of packed key...
   245	 *
   246	 * So that constrains the key part of a bkig endian bkey to start right
   247	 * after the header.
   248	 *
   249	 * If we ever do a bkey_v2 and need to expand the hedaer by another byte for
   250	 * some reason - that will clean up this wart.
   251	 */
   252	__aligned(8)
   253	#endif
 > 254	;
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
