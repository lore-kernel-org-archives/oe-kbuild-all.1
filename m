Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C39E1C5490
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733517681; cv=none; b=ty6wKXcVuk2Fhdh8qY++O34yroQeTvOtlV9Z28YzjZVziiDAiZym4UcPIrJVmwV1aFzOP+2JLe5s7plDAK87GItcUe5otaz1tDW2aYloZPXtdKh06H0/Yce+ebmI+huggrz59snQHTdkwOibqAwe2PDztZ7/FqywC2mlbxx8cL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733517681; c=relaxed/simple;
	bh=zW6m78DkOKgHHLkBCx1w5jqlcu4C3RfIawYWfpp3o+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qZsAMXcyviTbB/z947mWmuDTYEwkQ9emkiXmv5YC0R+lINvG29RlQnQUyJzuLnqyhu94lmqw34cpf/1XqYdNsKXPzAp5vLKi9eqXUlegdYrdORePtbZH8mB1bnkIh+K3OQjkA7TtQa8QsMEj8J2/bfoG5fXzdrEU+bl+kaJhivs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUdEVl4r; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUdEVl4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733517679; x=1765053679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zW6m78DkOKgHHLkBCx1w5jqlcu4C3RfIawYWfpp3o+Q=;
  b=YUdEVl4rFvWzaydpH41bnmscmB+nF39WgxcDdaM3TM+tCGEKV3qjd709
   F3Tv/nm6tm+4P0iiT/v4vjmi0jivx1LciiVftbhGlYmFBId2Hyn6JBZx2
   5M/tqVndDY6bbb/q47obccii5q9N1BxNap6974ff9YzBe6HyxSSQfhzbS
   GBjS4jm/DdN/b2LOrIYqp15N6x6PGkY1lfZ9fSfXOJZroZukuOIezCCIk
   Vh19TVPReAPkpiC5bNMWQxnAyP7C+sim7gcnrQ/nM9P+eS40dpAvp4RMq
   ynL5HBVzOQJasVamnsajZ6wLcaWj9LWANVSkwH/V3CckeFFfCrnrsbTN3
   Q==;
X-CSE-ConnectionGUID: uxueC/jnREGSRjSJjdv+kQ==
X-CSE-MsgGUID: Y8GpDYs2QwGvKDNagi3JBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45281440"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45281440"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 12:41:19 -0800
X-CSE-ConnectionGUID: +73XQ2NPQmupKhBtDD+xlg==
X-CSE-MsgGUID: wp0/gaS2SGOqpBoqgX2jVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="94314809"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Dec 2024 12:41:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJf8V-0002FH-1E;
	Fri, 06 Dec 2024 20:41:15 +0000
Date: Sat, 7 Dec 2024 04:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v9-wip 10/22] io_uring/zcrx.c:51:2-8: WARNING: NULL
 check before some freeing functions is not needed.
Message-ID: <202412070426.x05zKiSh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v9-wip
head:   265a57e2057eabebef11b4b533a65ecf75284489
commit: 12a2eb6e0439c488df7f891b0a1cf1117a27d088 [10/22] io_uring/zcrx: add io_zcrx_area
config: xtensa-randconfig-r061-20241206 (https://download.01.org/0day-ci/archive/20241207/202412070426.x05zKiSh-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070426.x05zKiSh-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/zcrx.c:51:2-8: WARNING: NULL check before some freeing functions is not needed.
   io_uring/zcrx.c:53:2-8: WARNING: NULL check before some freeing functions is not needed.

vim +51 io_uring/zcrx.c

    47	
    48	static void io_zcrx_free_area(struct io_zcrx_area *area)
    49	{
    50		if (area->freelist)
  > 51			kvfree(area->freelist);
    52		if (area->nia.niovs)
    53			kvfree(area->nia.niovs);
    54		if (area->pages) {
    55			unpin_user_pages(area->pages, area->nia.num_niovs);
    56			kvfree(area->pages);
    57		}
    58		kfree(area);
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
