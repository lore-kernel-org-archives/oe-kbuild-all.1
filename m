Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784A43803C2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838153; cv=none; b=eSvl/q8UKXeEx9B3vgqxtUPrrW6tbEOB4ipBKkdjMXNOU0R32dCGARPOWjI/dFP2m1oDqP/1eLKOWTX7EKP53FfoKVZNilT4hSAgsWvS+9/5iVR/XRqKyyHp4mV825Tmz+4lbXDLBufM22u2DyRjPnDVJg3gYmfjqvHsYUDAEXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838153; c=relaxed/simple;
	bh=FYWucqfu462C88DJFMWMSSaWqRw5RUnmBwg5xoMgESY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H9YQUN4uS2jhpn1lFQ6t+RkAKUwUENqPP0caIxHHHNvxMB1tnnfsuVBQ2/mX4DtVbfgeKmBkC+3HOHrKXfCmTndqpCaWwKD5Fsbcm7CSb3cwP9N0jYSn886SKeOwpEL8hyGTvhvQZ56pY69NJj4Nc89b496lcDhd7pct/EO/zKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzXsI7N7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzXsI7N7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768838153; x=1800374153;
  h=date:from:to:cc:subject:message-id;
  bh=FYWucqfu462C88DJFMWMSSaWqRw5RUnmBwg5xoMgESY=;
  b=DzXsI7N7iOVBYc8z+1Y9ed25Viy7GvA2TJQg8tg5Vrjo55aUvUoVG7LR
   bfmBJjqB/vCy4yZ75FGmP9xmfmAYALJ2RBFL35Mv58ohMpjyfs7Ithh9M
   37vO6RJ4h8+Zep95TokkOnmJ3Hb+u8X+0/n8WXluUwHgr/VscYxJf1JcO
   xVYkx2OA9axSur6N5hZLierNVzxzy+rI29weTJr6CtqpSZ1HZ7qthxZ8y
   NmPUybAuVy/C5p0CKzKC1RXpcQ8H6mXZX4aSZ6N2sUx1XBC1WTjRSe6dt
   3n6y8KeCe7KbSDIMUdo+eMtuXCGz8CHNX6BsAiHqIni0WalcyA7JG3D9w
   Q==;
X-CSE-ConnectionGUID: W/HTSjmiQxmcv6mjAGG75Q==
X-CSE-MsgGUID: 9lSwJEoIRSS/zMgKwN5i4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73679442"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="73679442"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 07:55:53 -0800
X-CSE-ConnectionGUID: RiV+N/dtRqamGQIdvHffkQ==
X-CSE-MsgGUID: pHQ3sKSJTQiKMLeMByZebA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205923288"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jan 2026 07:55:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhrbY-00000000NyP-2jmS;
	Mon, 19 Jan 2026 15:55:48 +0000
Date: Mon, 19 Jan 2026 23:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 223/223]
 fs/bcachefs/data/reconcile/trigger.c:27:5-8: Unneeded variable: "ret". Return
 "0" on line 42
Message-ID: <202601192319.HoIZGVcG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   1c240e59948ecca320c96b94db4ffae87581d477
commit: 1c240e59948ecca320c96b94db4ffae87581d477 [223/223] bcachefs: Break up reconcile.c
config: alpha-randconfig-r053-20260119 (https://download.01.org/0day-ci/archive/20260119/202601192319.HoIZGVcG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601192319.HoIZGVcG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/reconcile/trigger.c:27:5-8: Unneeded variable: "ret". Return "0" on line 42
--
>> fs/bcachefs/data/reconcile/work.c:207:21-22: Unneeded semicolon

vim +27 fs/bcachefs/data/reconcile/trigger.c

    21	
    22	int bch2_extent_reconcile_validate(struct bch_fs *c,
    23					   struct bkey_s_c k,
    24					   struct bkey_validate_context from,
    25					   const struct bch_extent_reconcile *r)
    26	{
  > 27		int ret = 0;
    28	
    29		bkey_fsck_err_on(r->pending && !r->need_rb,
    30				 c, extent_reconcile_bad_pending,
    31				 "pending incorrectly set");
    32	
    33		bkey_fsck_err_on(r->hipri && !(r->need_rb & BIT(BCH_REBALANCE_data_replicas)),
    34				 c, extent_reconcile_bad_hipri,
    35				 "hipri incorrectly set");
    36	
    37		bkey_fsck_err_on(!r->data_replicas,
    38				 c, extent_reconcile_bad_replicas,
    39				 "bad replicas");
    40	
    41	fsck_err:
  > 42		return ret;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
