Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B45F2C80
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711189199; cv=none; b=JXbGnbWGGlql7rIqFegq+BjbkaVH5Eokh47V5kd+NBj09AJJYpM7s2ZSY3XqBy/s/9FUGnrhTmyO1SMHjDLWNmEtZkP0c/dqyjERjlPidR63uYfy7D4KnuXcHpJlXgpuZPVzYdSYW46V4rg4psvKIJZP1kKNYY9+f69TZJnmehU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711189199; c=relaxed/simple;
	bh=SBalKkQz96rrAfxfJ+51ySRVqwSKUWRCKklE30jXHxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gjWsUj61I8rrYqAjzxKqhYNuudcQJgyT4MFcMgwzEzjk+Q8WFFsFjH9N8P792kONWfVsX0wSZFq09mCZPH/X/xM48iCDoXyZUr6s0lyuM5LFSdo8pyDl/8eyNtozsFFuUxVr4pAeR0RZ6Mh8IVs+omITmtMEplgoNGSlKXUXMBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdJrRekG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdJrRekG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711189197; x=1742725197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SBalKkQz96rrAfxfJ+51ySRVqwSKUWRCKklE30jXHxI=;
  b=SdJrRekGtqVuv66ErSpgYFOJBncD//JtVykFkbfOMFHdeDJWnFeIQxEh
   YgitlcKywgpU5r8HjzRlqOtCliZILEn9VQtYiYOzgesdQIPBNvMGE81vW
   j155epuVxY1z2GRSzNHGlVHk8q3FiIZ2J1sGO6BvYmquDJBQ0OaL5x3rz
   vDoq19L3Omv7neKWKq/5lws/19+UwXzm/ElO5uQA7RU8rXOgt9llJZWx6
   6D2wM0JD0ToGOV59zAnmYNf5TgH/VqnTfsgeeVBZlcyMG2PidQVQRp1xE
   bn8kJyJVMcsGOSjIY5Hd7/3Wy4tWHkBMeHGYGKDft12BETNu92gNTssU1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6350790"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="6350790"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 03:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="15827342"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2024 03:19:55 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnyTg-000L3r-1d;
	Sat, 23 Mar 2024 10:19:52 +0000
Date: Sat, 23 Mar 2024 18:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 10038/30000] ld.lld: error: undefined symbol:
 sk_msg_alloc
Message-ID: <202403231836.Ys5ZDZ5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   459341c4b4845b283c7a884e6a0dc4bd8cdb89e6
commit: e9ce37bbceb2779c0015fcac54cc8df7a2ec8b76 [10038/30000] tcp_comp: implement sendmsg for tcp compression
config: x86_64-randconfig-001-20240323 (https://download.01.org/0day-ci/archive/20240323/202403231836.Ys5ZDZ5J-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231836.Ys5ZDZ5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231836.Ys5ZDZ5J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sk_msg_alloc
   >>> referenced by tcp_comp.c:148 (net/ipv4/tcp_comp.c:148)
   >>>               ipv4/tcp_comp.o:(tcp_comp_sendmsg) in archive net/built-in.a
--
>> ld.lld: error: undefined symbol: sk_msg_trim
   >>> referenced by tcp_comp.c:236 (net/ipv4/tcp_comp.c:236)
   >>>               ipv4/tcp_comp.o:(tcp_comp_sendmsg) in archive net/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
