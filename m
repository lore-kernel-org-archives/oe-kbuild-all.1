Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D09821101
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706730056; cv=none; b=ek30s5EURSSIqCpp3nh1QJTtvm3Kvq9FLXrGCp+lqWEXW5TelL54LXfXIAducdMN68lt9kcjuUKYdXvsp5nlfc/rBzIr6TPJ6o2F1mIFP2HbE+LhgQYKfOOpnKpv+ZNXrgLMm2sucXQ+YT0ta6to66QZbGHqGWli0gXR3XSTEds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706730056; c=relaxed/simple;
	bh=kPHTy+enEWsfRnZzS8M6tLipljdV74dTLoET/8dmYPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l2QCxO1vuZ+Pt8O5C9LmDVTxJw4xg6m9QySCk/Sx0P2vHxmu1mxafky0RCfoeNMEitG2DRuAXyrqwjfkEb2bxN9MPscD/IMkOHMvjRNmvrVHddIcImSE1r58f3rJM+hJd63bK0g9Essbnp2b1jLNODnRDBE8K7Xa0eyI1qhK9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiFpZLMq; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiFpZLMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706730054; x=1738266054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kPHTy+enEWsfRnZzS8M6tLipljdV74dTLoET/8dmYPw=;
  b=aiFpZLMqKraxNa/Pf0F8DIARusJiv12GUcB0Hf4G2vDkIoAcsoIE9phN
   38QxOiI430O7Ptcapxh5VGq7nUVF5uZgumFnD5bj3vM/RNdQVWs/DQWyM
   5s1juIWZth3r6aiUGloKoY9bXj6ocPhP+D1CuKXP/hpmAu/0TYjF5h8I1
   +HK/MjCM2PTNqSn8kGFYd/KPEtPzdrbdjvEM4RNGL+m5HxlZ1OQGOWFSY
   iyMUKFg7EHkCIyhIIInfJZDex0SGppwMUX/U4faP7Cz0X7kgl8hrbgZID
   EpsM8QZz9lzIUtJb9+RdWIyfVT0bPD4FgVUh477y02zKaIE2QHQDEbe1j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434876036"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="434876036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 11:40:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="30623775"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2024 11:40:48 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVGRy-0001wG-1w;
	Wed, 31 Jan 2024 19:40:46 +0000
Date: Thu, 1 Feb 2024 03:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:uptr_v3 9/19] kernel/bpf/arena.c:408:24: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202402010325.hlnvRtEf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git uptr_v3
head:   cac4c607120174aa3ff10ca5118f1e72771f01a1
commit: 756274bdd4d38c46515f91b9246002a76bc673f1 [9/19] bpf: Introduce bpf arena.
config: x86_64-randconfig-121-20240131 (https://download.01.org/0day-ci/archive/20240201/202402010325.hlnvRtEf-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010325.hlnvRtEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010325.hlnvRtEf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/arena.c:408:24: sparse: sparse: Using plain integer as NULL pointer

vim +408 kernel/bpf/arena.c

   401	
   402	__bpf_kfunc void *bpf_arena_alloc_pages(void *p__map, u32 page_cnt)
   403	{
   404		struct bpf_map *map = p__map;
   405		struct bpf_arena *arena = container_of(map, struct bpf_arena, map);
   406	
   407		if (map->map_type != BPF_MAP_TYPE_ARENA || !arena->user_vm_start)
 > 408			return 0;
   409	
   410		return (void *)arena_alloc_pages(arena, page_cnt);
   411	}
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
