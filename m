Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B361AE877
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 18:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767031572; cv=none; b=jmp/9HXE6k4QhLw/euiAwcFm2YRP17RoPDb7hYg236WNqmlcmJnHw4peOXPodb4SECX3WCoRT7RkN4V7xHdG24j52/fG3Yt/y7dtvbBb9gc37bW2O8ELxS+NCPT9i4Y17JtvQi7quIT2ga9EaOdw7Qqym9ePltmR35PwzSFgrWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767031572; c=relaxed/simple;
	bh=4eQIAFD8fhmA+K+DlZRmMPlzNOYQ4zScpAIpEI6FZws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QAiu5HFGRHs3QSIoW+pB9pu58ezz0DVitq1WUe8cj3EakpZLB4c9T96dxLxoFI/hHUVvpfw9FAnaT9hkFOkr8TsamWX9RpF4hXPZkPVZBJTmZ9xhWQSMMUocpKmQRLiQgXFOC/3oHuSYMZsgom6dCwJLkaxmQFSGO08/XMTIOEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsyS4ROD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsyS4ROD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767031571; x=1798567571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4eQIAFD8fhmA+K+DlZRmMPlzNOYQ4zScpAIpEI6FZws=;
  b=VsyS4RODXJNYAT3TrV5o+w2RVP+MzVyvX2fkFoPi7QUjohiznvj6opMI
   FrquAAJDoV5Cqf7bnXs6N3Yn2dp7HYXfTPV/FEV5XO0q2iK3JzJe2BeON
   /BVmCaakOjIbNl8bFHQpKoSgFcSSKpwuYNyBqKcqZ+SlChF4lQdlxntwl
   TTSYyeSytPhCWT6XkbSvSRodCIt1h3DkKSzk+cTwY+8Hhiui6glTf5Xpg
   kYUpQYnoaPpyaXUdl5ybgUY/wKzzTcUk93yV7jsFtad1PkmM+n20aCzx3
   d3ggCn2xUaiw03UZoc/tG8ZeDKrg/MGTsdcH9YdCsM/l0SPplOhfJkxzX
   w==;
X-CSE-ConnectionGUID: /gdt5S/xSm6oS7YISBWZNA==
X-CSE-MsgGUID: ZHtkwCxmQiq7EVQEIa6Mcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68577779"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68577779"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 10:06:10 -0800
X-CSE-ConnectionGUID: xV4ToJbtQpGZVVE/hIsISQ==
X-CSE-MsgGUID: EFVvcccVTSadBamtSQsPmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="201895198"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 Dec 2025 10:06:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaHd6-000000007oG-3xSl;
	Mon, 29 Dec 2025 18:06:04 +0000
Date: Mon, 29 Dec 2025 19:06:02 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 0/15] htmldocs: ./fs/eventpoll.c:2043: warning:
 Function parameter or member 'ep' not described in
 'ep_get_upwards_depth_proc'
Message-ID: <202512291934.AIV7LiBp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f148785f0bb856bba8ceca2b699a2f102f22174a
commit: e26c080d818afd35143c9bcc49978bdf5068ee33 [0/15] eventpoll: Fix semi-unbounded recursion
reproduce: (https://download.01.org/0day-ci/archive/20251229/202512291934.AIV7LiBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512291934.AIV7LiBp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/wmi.h
   Error: Cannot open file ./include/linux/fs.h
   Error: Cannot open file ./include/linux/fs.h
   Error: Cannot open file ./include/linux/dcache.h
   Error: Cannot open file ./include/linux/dcache.h
>> ./fs/eventpoll.c:2043: warning: Function parameter or member 'ep' not described in 'ep_get_upwards_depth_proc'
>> ./fs/eventpoll.c:2043: warning: Function parameter or member 'depth' not described in 'ep_get_upwards_depth_proc'
   Error: Cannot open file ./include/linux/fscache-cache.h
   Error: Cannot open file ./include/linux/fscache.h
   Error: Cannot open file ./include/linux/jbd2.h
   Error: Cannot open file ./include/linux/jbd2.h
   Error: Cannot open file ./include/linux/netfs.h


vim +2043 ./fs/eventpoll.c

  2038	
  2039	/**
  2040	 * ep_get_upwards_depth_proc - determine depth of @ep when traversed upwards
  2041	 */
  2042	static int ep_get_upwards_depth_proc(struct eventpoll *ep, int depth)
> 2043	{
  2044		int result = 0;
  2045		struct epitem *epi;
  2046	
  2047		if (ep->gen == loop_check_gen)
  2048			return ep->loop_check_depth;
  2049		hlist_for_each_entry_rcu(epi, &ep->refs, fllink)
  2050			result = max(result, ep_get_upwards_depth_proc(epi->ep, depth + 1) + 1);
  2051		ep->gen = loop_check_gen;
  2052		ep->loop_check_depth = result;
  2053		return result;
  2054	}
  2055	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
