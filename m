Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD122D3733
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 18:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768501264; cv=none; b=cP1IphTSWSqPhOHBiTMR9K8QUPjGLzuOTw+8nY5DD5wSRtFoxegulGOdwaVF1jdY1Tu+RNWUrGEvFoaqa9tyCQe+dverVskLCRrTNqLgmvRfIlwLTBJbkYJ1Bc/1KRqK+42wno7/VZTRlv0z8XP3PUJbZzQ+M0afNgog12+Ypq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768501264; c=relaxed/simple;
	bh=LLXyLZneKQPuFC+UUzls9mk8Lke7308tN8l0i3PHios=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVXzeSOEdgGqW3Rlq8fIRj70P6++VhHN2Km8TfJ+k6w0xJa36QDJ6X+YeCbVntwDVrUOC+Fm4GWnppdLnPXtWbckU6J2MhYXMZgDv3JT/3RY9xjBz+ZzdFfIS7onfj2dVyUBHm0V91XyUU1I8YyYtJFhVhDr5qSV7FJ13zwscR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwTGSqnW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwTGSqnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768501262; x=1800037262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LLXyLZneKQPuFC+UUzls9mk8Lke7308tN8l0i3PHios=;
  b=ZwTGSqnW7mA2XI+TEl2loQPMhqx18Sevzc2dXfWH5MjXK6T6Xr+yzErp
   VfHaXGcqk+wlHCedmbTkgTlxM37Bd9TZwMHOQKLML0wGN/tHBwKkbUldz
   y+1FyQFyhjjtV2ziuhyFL31ajApWLoX++l30mCHR09YKezzWCn6gLhTlD
   s0N2z//ryxQ9YfIpEl0jPu/4NaYsNyyr3rqDbhGOz7UF+pDb2OCRCQbAm
   QBuJaZ94a4o2lM7U7GylNSxzhmQ1vgqsWZ4I4jJcHhXFYSw2z5tp5krQQ
   WLDonuW2ToM5joruWKSvJiUgikkEgDG8D6VgMdBC9AH67vnOSaZncWle7
   Q==;
X-CSE-ConnectionGUID: DMxudz/GS824O/RTQtmLHg==
X-CSE-MsgGUID: yriA8116SnCoKqxMHoLMsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81261186"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="81261186"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 10:21:02 -0800
X-CSE-ConnectionGUID: SUnpwFpsSzukij6a7H7egQ==
X-CSE-MsgGUID: hfFcscwBRwGmYIFABA5Atg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="235723438"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2026 10:21:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgRxr-00000000JfQ-1jCQ;
	Thu, 15 Jan 2026 18:20:59 +0000
Date: Fri, 16 Jan 2026 02:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: Diangang Li <diangangli@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] block: export windowed IO P99 latency
Message-ID: <202601160136.m0I1HNWx-lkp@intel.com>
References: <20260109083126.15052-2-lidiangang@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109083126.15052-2-lidiangang@bytedance.com>

Hi Diangang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Diangang-Li/block-export-windowed-IO-P99-latency/20260109-163449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260109083126.15052-2-lidiangang%40bytedance.com
patch subject: [RFC 1/1] block: export windowed IO P99 latency
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260116/202601160136.m0I1HNWx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160136.m0I1HNWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160136.m0I1HNWx-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: block/blk-mq.o: in function `diskstat_latency_bucket':
   blk-mq.c:(.text+0xe76): undefined reference to `__udivdi3'
   m68k-linux-ld: block/blk-core.o: in function `diskstat_latency_bucket':
>> blk-core.c:(.text+0x736): undefined reference to `__udivdi3'
   m68k-linux-ld: block/blk-flush.o: in function `blk_account_io_flush':
   blk-flush.c:(.text+0x602): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
