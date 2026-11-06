Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978011;
	b=r0o/VXWgu2wBuMkmsvWWRRsy0uxjuHU9lAOzoAads6yPR0nq7grcZaRpZVFeYn379SHE
	 KBihV8ZDGBAZIn/SjYJ4S3J9olCZK1bBMDkQ4XAEgN2h2Nx+99v7vEaAFwljgfU2zoQ0E
	 ktIRtCZXFM3quRcgSp32h2bkBRL2CF2S+1hGyR5LfEYFuvTS1Vm4FBz3y4mWxYx7uT6C0
	 b9dITLZqKBeXOdfcPh5vOOYLvR+Unf2dF8gqZyqncv9lM5xqcBHWKdvZ3yJnOiNKxQHdG
	 15LbxGV2noo53DSnyFAexxA1QtQ4jSiL5PiNDFUd3moNEQlVizqNLNxBoJcLmfZoAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978011;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Jls1hr8gsjJE9rArX6PqLX6CCTMwAK/91ZAe+whrDsQ=;
	b=Ofvx91g3GW/R83yCTKhklIgvaXndTWVc3Z0u30rv6i5eynUEXciSNOI1aZTEaN3Z2/iO
	 UTXf5dmCp0Do0jo6IcAgHjBvMmcSC+tEulgPe+welHPb7oUoZO2rVY9d4frvS0pW5LhLz
	 kQBu28E7O6ijB4g8dgB/Jn2Re+tuOASgubUcMpx5GoYVIoNls8YlvfZOpnF5s7rrpPTHn
	 UyDgCN/FBhlyxPBENmrJKDTyOVMsDJPlky9cA6tPP/m8uLR0Uer61ZVrF4fy78vbH5aMg
	 zYPChynfUmFFaFmr89j4LtVw+OrsOhhZC3OiQNO0lnsaJy3P2DHeUz9Qk8kBC0Kf52A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mjjtvIY5;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E648F606A32C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 15:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E648F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mjjtvIY5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793978010; x=1825514010;
  h=date:from:to:cc:subject:message-id;
  bh=y1URl3XJhImpMf15HOnhGx8n8mOD8C6mvb9r5VV1IXE=;
  b=mjjtvIY5yWbMzrsA4mEB43sSUcG9UIlbHQq6J/TLYxrao0vapJdHV0PB
   0gihLFpgIsF9l5x/GCH3AS37OPxGkaaURhB46OZ86yJgIyArTMdbYGCWw
   ZBRDzW5SfH9f1p2riNmhQmpJlbI5brYsA3W2evXkba5giQzJ+YjBwPIUx
   hgD4kVk472vKLkNVRJA0R45bai6lqZImLJZ6e4ikeXZc93GU19nF54/jw
   59GF/gU7+3Hcykfi03SVOrMemxRYsReqAa8/rh04S6cLIo/eYYdp6SjNx
   SvXNU0zngxTJ7DcbyCm1Bc/KI6HRVNLit9MEi94DhmRnODWXlCdiQ/KDp
   g==;
X-CSE-ConnectionGUID: dMWhHJ0cQWuOHArQxCpPFw==
X-CSE-MsgGUID: bza8BSHVT4eUkQyTARaJfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2832952"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2832952"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 07:13:30 -0800
X-CSE-ConnectionGUID: kDpJZYMWSC+UJW/PauVxZA==
X-CSE-MsgGUID: vs90kEbdSlio1bKs9D/MYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7351982"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 06 Nov 2026 07:13:28 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPLd7-00000000AIP-2ggP;
	Fri, 06 Nov 2026 15:13:25 +0000
Date: Fri, 06 Nov 2026 16:13:20 +0100
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [linux-next:master 1261/4145] {standard input}:61662: Error:
 operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r27,r28,-1'
Message-ID: <202611061612.twOQJVLd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
commit: 8a13fc366acd07c58a72b0eaee2c1e38f9280cee [1261/4145] btrfs: convert volumes.c and block-group.c to use map->stripe_len
config: openrisc-randconfig-r2109-20261106 (https://download.01.org/0day-ci/archive/20261106/202611061612.twOQJVLd-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061612.twOQJVLd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061612.twOQJVLd-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:61662: Error: operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r27,r28,-1'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
