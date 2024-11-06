Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9457C64D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 03:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730863146; cv=none; b=Sq+15EldFzwiywh29Ho4UQZ0ZIOO1yB43ByFila5bzGdCD/PeHGB2JvlR9lTkDnMsPINseBHP6ngXCLoneJcr4EVu255cThTr63ZUSwvkVS7EfCBYlHyVG2Y7Pfsat64ymc2nDzok1VKuKZCH+oCLbyZWRbVYy0hzZw7D+Q7lq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730863146; c=relaxed/simple;
	bh=xRAR1Svcq4AoWe8xq69hP7T9wqUr9ZENk5KeM4TPtRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PZ3pM7majFxCwjXB3BcqLwJ3uDeUcG3sdidlUpWaTAA4JgS21mmwBvSwrD73JNICR44rDWArbDDpfioo2L4VFB5j0w8idlCfrlpegjBsaXyw75gLRLCfw846O5ui8G7I0Lc91xuxpb15Vi2IO+E0mnzTjWPM/eO7l5CXU1JjMqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxVLX43Y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxVLX43Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730863145; x=1762399145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xRAR1Svcq4AoWe8xq69hP7T9wqUr9ZENk5KeM4TPtRs=;
  b=XxVLX43Y5kiP99lo+CxCI10FURiHwpGeDmYL1Eq7/qg/TvNpLaP9ShHU
   U/0cOWjBJWfnQrGzQq3U+1PHDTeFj/5Ic/ALSKXscP+gotHZ3UjdVkmVl
   A4VrVDWpQNAbA0HGo52rI3Gtwwt+7NLCgZC+ULQitIGKFch6gf1SdIhDI
   Gt6lzyLHm03YkkhTUKi/6ToPxRer4mO7aqnzBJyfBe7/r6voSCpFSj0A/
   X51+/Z/UHF93dhG/3JG2BaUIVpPTdJ6/XVEalAmv3XTS4aR908lfOfBmr
   +cSwCroL/zS+Iwv1EMYHga7YVud2QAu4n1pJRIgVHEyd94mYnDzsR7DR5
   A==;
X-CSE-ConnectionGUID: /7WbBHzhQai82zBQ3X7NTg==
X-CSE-MsgGUID: UuCfsfiISfik/dRu3ec3lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48104040"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48104040"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 19:19:05 -0800
X-CSE-ConnectionGUID: v9fpdfwyRJ+hZzYYOCnxDQ==
X-CSE-MsgGUID: mHnGZ/uMRYG31dLWwX+xvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="115098766"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2024 19:19:03 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8WZR-000msl-00;
	Wed, 06 Nov 2024 03:19:01 +0000
Date: Wed, 6 Nov 2024 11:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231]
 arch/arm64/kernel/mpam/mpam_mon.c:48: warning: Cannot understand  *
 @rmid_mon_exclusive_all  List of allocated RMIDs with
Message-ID: <202411061140.gNjqbgZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: 0f728d63ce7a19f1dd0dbde79197248e7c4accf6 [1231/1231] arm64/mpam: Add wait queue for monitor alloc and free
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241106/202411061140.gNjqbgZ7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061140.gNjqbgZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061140.gNjqbgZ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/mpam/mpam_mon.c:48: warning: Cannot understand  * @rmid_mon_exclusive_all  List of allocated RMIDs with
    on line 48 - I thought it was a doc line
>> arch/arm64/kernel/mpam/mpam_mon.c:54: warning: Cannot understand  * @rmid_mon_wait_all  List of allocated RMIDs with default
    on line 54 - I thought it was a doc line
>> arch/arm64/kernel/mpam/mpam_mon.c:62: warning: Cannot understand  * @rmid_entry - The entry in the mon list.
    on line 62 - I thought it was a doc line


vim +48 arch/arm64/kernel/mpam/mpam_mon.c

    46	
    47	/**
  > 48	 * @rmid_mon_exclusive_all  List of allocated RMIDs with
    49	 * exclusive available mon.
    50	 */
    51	static LIST_HEAD(rmid_mon_exclusive_all);
    52	
    53	/**
  > 54	 * @rmid_mon_wait_all  List of allocated RMIDs with default
    55	 * 0 mon and wait for exclusive available mon.
    56	 */
    57	static LIST_HEAD(rmid_mon_wait_all);
    58	
    59	static u32 rmid_ptrs_len;
    60	
    61	/**
  > 62	 * @rmid_entry - The entry in the mon list.
    63	 */
    64	static struct rmid_entry    *rmid_ptrs;
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
