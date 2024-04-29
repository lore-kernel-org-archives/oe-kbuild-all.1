Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A0D38B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 00:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714349891; cv=none; b=s4JaburH+SXFKPoSznaFl6ioMV64n6M8XiinnOKcXV+AVfpFCkRI0C75TVGMCSBQlQgRvt+zKYit2YlzK0moe5uHLOeMDjaNFhlYms5V5cyiyXj0vrnb9DNmHN8XwoMfQExJtj8fNWY25LHiRJrPjuCBVBv/wtb+HqZlR/vZ3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714349891; c=relaxed/simple;
	bh=Xraajne3CSU5GUjfTCv7vvBJGb2i/kmB0PIjrN+osPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z3x30BDc9gMtrHFQoBg8pIDNncrXg+BqjSTm6+Svs/6Y9ioZaI3K/k5j+b5+zaT80cwtv+QeOf0bBNdLsxQH2CnLH3DvOcAhFeR9eql/4aTSAzzwMH1DZ6c0PTL673PR/K9wDxIKHCqZw95Pu28oAYnR17g18/dNerP2BPf03uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5p4gitz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5p4gitz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714349889; x=1745885889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xraajne3CSU5GUjfTCv7vvBJGb2i/kmB0PIjrN+osPE=;
  b=F5p4gitzSNzEdpEsMzqk2DgyoKJIhnMqEtqi9CWL09+aKGKNjzMnKEpR
   USW5LHSWU4nl86srSanwkdaXl0a5S2ifHNvx1Kq/tvrCHmQvn8ewgM0zM
   WkRfeAKsY3rNF6legPKT2cNE9nmKRXbK/uiQNpl+ncQ00fEJU0UUDd8C0
   VnEEOFaToV4S5ips2HwbWLJ6xbplw5JI4zleCA0iEQzhM/AZWRoqv/R4N
   2RH8nPytVejRplSxvKIpplyxg0iSENcBGJJKWkPLJXPQu7/o+sjIAQyjg
   I3oyURWXo8gh+wKr5ycNZRpDVqvnTc3Ucv1uASc1PGwHLp3UABPLZFmXX
   Q==;
X-CSE-ConnectionGUID: ons3wbTORlqUwWBo5T+hYA==
X-CSE-MsgGUID: pmge0s5WRg6TbnoUyQEZrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9875171"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="9875171"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 17:18:08 -0700
X-CSE-ConnectionGUID: Du0pweLLRJC6MPyTMbWSnw==
X-CSE-MsgGUID: 4n4E6eXjRjqPwthVwW2pJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26356149"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Apr 2024 17:18:07 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Eib-0006og-06;
	Mon, 29 Apr 2024 00:18:05 +0000
Date: Mon, 29 Apr 2024 08:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3 14/16] net/sched/em_meta.c:593:51:
 sparse: sparse: incorrect type in argument 1 (different modifiers)
Message-ID: <202404290844.gD47xPfl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3
head:   245e8a4d98fee0307884585dbeb3dbb7ee1bf8fa
commit: 49d60804ba15895c09e4b47eb20fdc8b56ed6878 [14/16] net: replace page_frag with page_frag_cache
config: x86_64-randconfig-121-20240429 (https://download.01.org/0day-ci/archive/20240429/202404290844.gD47xPfl-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290844.gD47xPfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290844.gD47xPfl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/sched/em_meta.c:198:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long value @@     got restricted __be16 @@
   net/sched/em_meta.c:198:20: sparse:     expected unsigned long value
   net/sched/em_meta.c:198:20: sparse:     got restricted __be16
>> net/sched/em_meta.c:593:51: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct page_frag_cache *nc @@     got struct page_frag_cache const * @@
   net/sched/em_meta.c:593:51: sparse:     expected struct page_frag_cache *nc
   net/sched/em_meta.c:593:51: sparse:     got struct page_frag_cache const *

vim +593 net/sched/em_meta.c

   584	
   585	META_COLLECTOR(int_sk_sendmsg_off)
   586	{
   587		const struct sock *sk = skb_to_full_sk(skb);
   588	
   589		if (!sk) {
   590			*err = -1;
   591			return;
   592		}
 > 593		dst->value = page_frag_cache_page_offset(&sk->sk_frag);
   594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
