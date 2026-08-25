Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F3B39448F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654322; cv=none; b=B+QR403ABZDH/hOjCyHqpwfcyw9QikXXQhgFEKaeR3R/ccM4RwRc4SHlJBjCzvwElVsz16l3J9JCSgqhnYxlcXn55NebzAx2Ww8PjexVqFfMsiOvqqOu4Vn2iUdZK7UTvqhP4G4EXlzF8VLO/OjzJr3rhk0kh0HNrWM+uNPqVPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654322; c=relaxed/simple;
	bh=cVXmGUbTc7iJ6Qpit74ai+4tAYY5bUxQn8XCJnJKkwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AVI+oYY7MxpdzF+aFapyS/ihEDcl5KsaDqaVO5ofnazuTwrZVtg1NqtK/mLTUg62AdOaUS+v/SchiuUWIYugUg4v0qNY9DoJ+Y1HnryC8wSGhGNgRUeXih1vun829y8AGbI7jY9Df49Qjm/L92daS4C+iXyPQQIw4vxYzX3MJME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhisHish; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhisHish"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787654322; x=1819190322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVXmGUbTc7iJ6Qpit74ai+4tAYY5bUxQn8XCJnJKkwI=;
  b=DhisHishLBdhHZi8rVOzmpbqiJMaYGQxNNiENJuq39iESWEn1CF7v/9X
   04sAq00CmkBpvgSdVFCaN9RFh7Ae3hfA2dxMoR+CrYus88ExKCJkn5D73
   bc3m8D6nFfAqm2C6KBlfAJzqQ/5E+mKUSHBRF22u58Rt29nrE++2/ZXrX
   NcaBKkApGZZRQI+VNy2OWMjIyFT+ELKB7kKSyZ4+URUwRh+GVqQWSECgR
   jktJbpZb/zYFB+A4RmXXdXYizYMEGFe5GPPvTuqQ0zMQaZzp3ybUzklUm
   NPtvWLwbfhyYXBHA4pa7mDj5Z7Ryh7IBRd3eP2xz9aaY2SImmansDTB1a
   Q==;
X-CSE-ConnectionGUID: oLtt/vtRTrmaHw5f5D17JQ==
X-CSE-MsgGUID: Byl7F2GhQsCGWYxus7x9JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98706669"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98706669"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:38:38 -0700
X-CSE-ConnectionGUID: ZU6kmxLYSu+90i9zlckigQ==
X-CSE-MsgGUID: iEp5KSEqTsCVLLFNMh0OWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="267825008"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Aug 2026 03:38:37 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyoY5-000000005gd-1svW;
	Tue, 25 Aug 2026 10:38:33 +0000
Date: Tue, 25 Aug 2026 18:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:scratchpad-v10 9/14]
 net/netfilter/nf_tables_api.c:176:1: sparse: sparse: symbol
 'trans_ENABLE_KEY' was not declared. Should it be static?
Message-ID: <202608251820.Ev9RBlph-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   45e5e0071e4ad7afee159e8cbe6cbe50c8db61d0
commit: 3c3f1ee69c19adfb34381a59af5ff7bf6301774a [9/14] netfilter/nf_tables: Route transaction objects to scratchpad
config: i386-randconfig-r132-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251820.Ev9RBlph-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251820.Ev9RBlph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251820.Ev9RBlph-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nf_tables_api.c:176:1: sparse: sparse: symbol 'trans_ENABLE_KEY' was not declared. Should it be static?
   net/netfilter/nf_tables_api.c:2154:25: sparse: sparse: cast between address spaces (__percpu -> __rcu)
   net/netfilter/nf_tables_api.c:2154:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_tables_api.c:2154:25: sparse:    struct nft_stats [noderef] __rcu *
   net/netfilter/nf_tables_api.c:2154:25: sparse:    struct nft_stats [noderef] __percpu *
   net/netfilter/nf_tables_api.c:2357:17: sparse: sparse: cast between address spaces (__percpu -> __rcu)
   net/netfilter/nf_tables_api.c:2357:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_tables_api.c:2357:17: sparse:    struct nft_stats [noderef] __rcu *
   net/netfilter/nf_tables_api.c:2357:17: sparse:    struct nft_stats [noderef] __percpu *
   net/netfilter/nf_tables_api.c:2357:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_tables_api.c:2357:17: sparse:    struct nft_stats [noderef] __rcu *
   net/netfilter/nf_tables_api.c:2357:17: sparse:    struct nft_stats [noderef] __percpu *
   net/netfilter/nf_tables_api.c:2398:21: sparse: sparse: cast between address spaces (__percpu -> __rcu)
   net/netfilter/nf_tables_api.c:2398:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_tables_api.c:2398:21: sparse:    struct nft_stats [noderef] __rcu *
   net/netfilter/nf_tables_api.c:2398:21: sparse:    struct nft_stats [noderef] __percpu *
   net/netfilter/nf_tables_api.c:2807:25: sparse: sparse: cast between address spaces (__percpu -> __rcu)
   net/netfilter/nf_tables_api.c:2807:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_tables_api.c:2807:25: sparse:    struct nft_stats [noderef] __rcu *
   net/netfilter/nf_tables_api.c:2807:25: sparse:    struct nft_stats [noderef] __percpu *

vim +/trans_ENABLE_KEY +176 net/netfilter/nf_tables_api.c

   175	
 > 176	DEFINE_SCRATCHPAD_PARAM(trans,
   177				"Toggle nf_tables transaction scratchpad allocator");
   178	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
