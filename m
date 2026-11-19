Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049091;
	b=422S8eueCYqLwqH8AI5QVfq3FDyk3e3NrKGR7/1gqw4pp+T9FeXhMoz9Ma24PpDrRcer
	 0g3Qbl66qqNFTx1fBNEKn9lJLkPOLnTTAw5TDigSiw6L3+mv81Kyu8ldz49PyxISRoUx8
	 ffl2OOAJ2w+X85Hj2eMSC4vqZXfNESZsfHpLye8Bh2MUEZcdYtHuo5UkmFXche8/K1KyV
	 b9K9VkSe/Z69K4lCWQ9NgsgqztpVpdlRXMyWCROVPdpwTegSexYKEGadv01pBk0SoaPBa
	 p1i/VNvUM+mdh/ZLWCDbZf+eBT3enoPSL+DKzabiWEFP+tHMqZt/vzDjlr05flnEQCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049091;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NZCUNtQIf94mvsD1meKr12kavbJie+rPhrKVuxqjlW0=;
	b=i1sxJbWOsowp8MAg2v4GFgp1tMF57GDAGTKP+SV4VvCQ9joOprM0P5vAyeNT3KIeFFZJ
	 tXU6xYpd4xpzUxH9Jdu+Y9l1PAX5c4CrKvZyLm5ryAXanfP8e4nMt87dH4rso5y4iHPGP
	 ZPoRQmH2XzuzpM3NarDO+M4mt90QfpZxPSOqOL/m5btAfZE/gBNbLOvQ9JzKDBSMsQQfX
	 o5HEo6nrXlCDJ4zFw0DXLXyG6FYI44ikTMCmoRn7jww3v5T4iyCK6uUAeHEvzYZTBt4uZ
	 ClWDZfJ7TR5XgRYY0GyJ0OikZuQlLlH9pKg/y0T4sr1IDC+IVYoOi/pZK9jxx+mstfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="L6kMB9/N";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91095606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 00:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91095606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L6kMB9/N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795049091; x=1826585091;
  h=date:from:to:cc:subject:message-id;
  bh=PdbKXiGy/8rXfz7VZmHKdIXiNSEM66x14CTkHSLYits=;
  b=L6kMB9/N0YElwDwUwqDYAzZCY1/3fefkFY3z8pxlc7LwXFAwGtrzYGE9
   thAlX0+8RLS4Q69HAEnoMbNA+ylgVuS6Qg0ttm7isq5BuXjDwFyfJOg74
   DtMZ2tjsLJemmui3VuPue593i/r6/4QzJOv5M2BGB1ljNjJp7KrXN7fQt
   bMDRrdDK6x/J6jtk9sO2U6zX5/MLsmQM+xDdnndWZwv9fn/k6T0euMu/a
   RraKFZ1N3qPZJxFrbnQhSQKbpFvbV/Jr+bzdkIfp4awP2Rc1ZSdziZ9YY
   K9mGgEbzy4mXVhz0svpuioksSG3Sx1C99Tc0Hintp9Z0PRQWnQOKYo4j9
   A==;
X-CSE-ConnectionGUID: FF3eoBMvR8ytXzRZ605U2Q==
X-CSE-MsgGUID: Akby9AQuRAaWQb1dh86Brg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3878376"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3878376"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 16:44:50 -0800
X-CSE-ConnectionGUID: yKgikM5ISFK15+Tr2KpY9A==
X-CSE-MsgGUID: AWM9tlltS6e+BTLUgz0Ipg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10369131"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 18 Nov 2026 16:44:49 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqGb-000000003YT-3BSs;
	Thu, 19 Nov 2026 00:44:45 +0000
Date: Thu, 19 Nov 2026 01:44:09 +0100
From: kernel test robot <lkp@intel.com>
To: Ding Feng <dingf3ng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Damien Le Moal <dlemoal@kernel.org>
Subject: [dlemoal-zonefs:for-7.4-fixes 2/2] fs/zonefs/file.c:406
 zonefs_write_check_limits() warn: always true condition '(limit <= ((~0 >>
 1))) => (0-u32max <= s64max)'
Message-ID: <20261119014002.7BsmIpI9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/zonefs.git for-7.4-fixes
head:   8de358df7785d9c8b3e6640cef2418eecc3d4a94
commit: 8de358df7785d9c8b3e6640cef2418eecc3d4a94 [2/2] zonefs: ignore RLIMIT_FSIZE above LLONG_MAX in zonefs_write_check_limits()
config: sh-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119014002.7BsmIpI9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119014002.7BsmIpI9-lkp@intel.com/

smatch warnings:
fs/zonefs/file.c:406 zonefs_write_check_limits() warn: always true condition '(limit <= ((~0 >> 1))) => (0-u32max <= s64max)'

vim +406 fs/zonefs/file.c

   392	
   393	/*
   394	 * Do not exceed the LFS limits nor the file zone size. If pos is under the
   395	 * limit it becomes a short access. If it exceeds the limit, return -EFBIG.
   396	 */
   397	static loff_t zonefs_write_check_limits(struct file *file, loff_t pos,
   398						loff_t count)
   399	{
   400		struct inode *inode = file_inode(file);
   401		struct zonefs_zone *z = zonefs_inode_zone(inode);
   402		unsigned long limit = rlimit(RLIMIT_FSIZE);
   403		loff_t max_size = z->z_capacity;
   404	
   405		/* No file position reaches a limit above LLONG_MAX. */
 > 406		if (limit != RLIM_INFINITY && limit <= LLONG_MAX) {
   407			if (pos >= (loff_t)limit) {
   408				send_sig(SIGXFSZ, current, 0);
   409				return -EFBIG;
   410			}
   411			count = min(count, (loff_t)limit - pos);
   412		}
   413	
   414		if (!(file->f_flags & O_LARGEFILE))
   415			max_size = min_t(loff_t, MAX_NON_LFS, max_size);
   416	
   417		if (unlikely(pos >= max_size))
   418			return -EFBIG;
   419	
   420		return min(count, max_size - pos);
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
