Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1723081D2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 22:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770675424; cv=none; b=klIcqroZ9CWi+KMtt6wb8Gkh4eLSn2680s+Askv68TH25kSjOq/tPZpv4n0rpRkE48HtsGicOUuTfxkoNJ++T/qHcESzMKla1xs0IUsijMSVowilVHt+/a3tU6Q1n0ROGHm9QmP0TdYP7KzR7IxfzhdE+ivmF90pan6Q0hFRDkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770675424; c=relaxed/simple;
	bh=IQYTV9LZkHvkxnJ4MmCpIcBmiskYo3IPlhEXf8xhdUg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eoZghc3R1qK651fgK8ncK4kGCBMy/ntPYMtRwXEhTYRrJK61eg9C+HH1Rdusg/Op8rdgUc4t2Q6WaHILMboPrpRfJYIuc4rn+WFlY03O7uPaBvoU8SQ8p0eBGAs4yp93XQIPz99yjOuRncvozt8aoww3J5TaFfp9pQ9sq//FrBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyvglCk+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyvglCk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770675423; x=1802211423;
  h=date:from:to:cc:subject:message-id;
  bh=IQYTV9LZkHvkxnJ4MmCpIcBmiskYo3IPlhEXf8xhdUg=;
  b=FyvglCk+3nqmpTU7lJ2CqOSZ4Pk56E26Huj04VCWmFd1ktUaLY2xpSgi
   O/8ly/zXg6latvtUP+JLKyAj/RcsOELDeVoUhJLbt5XcJnXnwxsw54PgB
   xZulb7Ci16G6VJqn0dnEghu1YqxYkL7CH0wnYvCtd2OSSVTciE8vlC3FE
   DXseLWkAD9EyTMdhOR1EV8ZkwxcweQHQHA6T4TjRoKyX6tBoB2565QgRZ
   N06Jv5RpUA1/CYE4546jm2uIu9lLYjeJu4h9jIjeeI459VZyyG+JGs9T0
   mAnx/AaxcmnUZjqjdup+Q9WDepto2D+h0vq28HjrnqBv9HbSXuQFhVGiK
   A==;
X-CSE-ConnectionGUID: oFkVWV6OQyGxAMAmdJnBzQ==
X-CSE-MsgGUID: 6yzVWEtBTWSVB87Ue73SOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70812071"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="70812071"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 14:17:03 -0800
X-CSE-ConnectionGUID: 3ItkeFUTS52KkK2hzEMOcw==
X-CSE-MsgGUID: F4zp67QOTJyZTKQQf7Y2iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216236177"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2026 14:17:02 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpZYx-000000000U9-0HGp;
	Mon, 09 Feb 2026 22:16:59 +0000
Date: Mon, 09 Feb 2026 23:16:27 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_2 1/1]
 kernel/bpf/trampoline.c:40:42: warning: cast from pointer to integer of
 different size
Message-ID: <202602092355.4VUKd07R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_2
head:   ebbef7d1c33bdfa68df327c0d80101c04ab6d996
commit: ebbef7d1c33bdfa68df327c0d80101c04ab6d996 [1/1] trampoline mutext pool
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260209/202602092355.4VUKd07R-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092355.4VUKd07R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092355.4VUKd07R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'trampoline_locks_lookup':
>> kernel/bpf/trampoline.c:40:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      40 |         return &trampoline_locks[hash_64((u64) tr, TRAMPOLINE_LOCKS_BITS)];
         |                                          ^


vim +40 kernel/bpf/trampoline.c

    37	
    38	static struct mutex *trampoline_locks_lookup(struct bpf_trampoline *tr)
    39	{
  > 40		return &trampoline_locks[hash_64((u64) tr, TRAMPOLINE_LOCKS_BITS)];
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
