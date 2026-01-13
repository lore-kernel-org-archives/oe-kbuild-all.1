Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3481EB5FD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 07:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290457; cv=none; b=UDiwfAC+8rWQE3NRm5+Tn4ma3jP0ff5YfKl0CkdXLRyT73jcNnh26MQ05LofZHc2AcNBiGbo+G3F5b7lKBWpqZVLeaN8X968hNKQv/WHD8yMw/TGDZHhtPfuzNJf031oRfPtNE8SOHcua/YB0km6LPvPZ85dD1kypIQPTXI9Y7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290457; c=relaxed/simple;
	bh=A5qH13LyDzar5LpdyQy7hzBeAR/YUjDz86C3W6hot7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nAVzcg61S3yHDn80mo+m/sbPMuf1JEZcaRE1/yGWEGIAjgqOWBGfqMFb13V3XT1XbFhQJBs/EX5wCDl3MMr8c3zx1yo1fhBZsoBx/8pzxUoIBeCkfBhTuEGZanzNrY/YxDdf4bo9uRwSpjXzSe0daYPDFY9VzWp18cG0ZIu2QwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YeewQtoZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YeewQtoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768290455; x=1799826455;
  h=date:from:to:cc:subject:message-id;
  bh=A5qH13LyDzar5LpdyQy7hzBeAR/YUjDz86C3W6hot7c=;
  b=YeewQtoZSQzucXGPtPB1MdPL0z4EGqXsM/vYekKIshl7J2UqBdcomucA
   B65QVzPdNV32G/FE9LPEHI2D+WUmelZ6lfbYVuaEbuoBx3IjPKG6jqTZd
   iXFFceq0TDPRzRNr8rtJwRSduS8O/Au1VXqTpQy47xLr7MYGKZdit5Pm0
   S0aQ4p8TE9mtMCWw8SAPbWBhje3XZmKlTkzcCvL3nwHnXZp5Hje83160J
   sX9/Q42flqj3jFNSLQCkv9vdJ0oHn0qF7jVDX4xRTDmS59L41Y0lticOm
   UvXf/N5t9HphINxT/7AMMiE8Uc4UZ0YuaquVT6QHmi3ZZgniZLqEmj6k6
   g==;
X-CSE-ConnectionGUID: DNeP40TCRZSQ53bbwza6tA==
X-CSE-MsgGUID: YWPqndpKSIifYPToDj7fDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80678671"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80678671"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:47:35 -0800
X-CSE-ConnectionGUID: JFrcvyYcQve7nMXNxWVzeQ==
X-CSE-MsgGUID: 30ukAHAiTCe4Rvr4FaulJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235024327"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jan 2026 23:47:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfZ7j-00000000EOE-0YmW;
	Tue, 13 Jan 2026 07:47:31 +0000
Date: Tue, 13 Jan 2026 15:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 13/17] net/core/skbuff.c:7315:67:
 sparse: sparse: incorrect type in argument 6 (incompatible argument 1
 (different address spaces))
Message-ID: <202601131538.TVcsyC5g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: 586e10988ec72acea43cbc695cec236fd69c57f3 [13/17] net: Perform special handling for a splice from a bvecq
config: um-randconfig-r113-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131538.TVcsyC5g-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131538.TVcsyC5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131538.TVcsyC5g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/skbuff.c:7315:67: sparse: sparse: incorrect type in argument 6 (incompatible argument 1 (different address spaces)) @@     expected unsigned int ( *[usertype] step )( ... ) @@     got unsigned int ( * )( ... ) @@
   net/core/skbuff.c:7315:67: sparse:     expected unsigned int ( *[usertype] step )( ... )
   net/core/skbuff.c:7315:67: sparse:     got unsigned int ( * )( ... )
   net/core/skbuff.c:7306:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *buff @@     got void [noderef] __user *iter_from @@
   net/core/skbuff.c:7306:30: sparse:     expected void const *buff
   net/core/skbuff.c:7306:30: sparse:     got void [noderef] __user *iter_from
   net/core/skbuff.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/inet.h):
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int

vim +7315 net/core/skbuff.c

  7309	
  7310	static void skb_splice_csum_bv(struct sk_buff *skb, struct bio_vec *bv,
  7311				       size_t skip, size_t len)
  7312	{
  7313		__wsum csum = 0;
  7314	
> 7315		size_t did = iterate_one_bvec(bv, skip, len, &csum, NULL, csum_one);
  7316	
  7317		WARN_ON_ONCE(did != len);
  7318		skb->csum = csum_block_add(skb->csum, csum, len);
  7319	}
  7320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
