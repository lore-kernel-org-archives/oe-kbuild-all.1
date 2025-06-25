Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32B1B0F1E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750881301; cv=none; b=dqb7I3aBs00y+kZ1ON+ZC6XCSKg/pPG8/iGbLouqNctG69Oo1+dXPhwEdnQ1yzeoX+r7DeQVK38KtbocVkRIwr3BRwX/gKK6jGhJozftqilCQbphSBujOAF3DD4kqjgiy6Jr8jIT7Ez6tdpMv9EErbD6Q7QS9qKw9SmqFsrYqqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750881301; c=relaxed/simple;
	bh=CYTO3tDxBefodqZnEBz/pegj7yK42fUd6Mdlp7ZrNt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oqeydw8Fz198Fr8/QJAbM9xWuVQvF/eqTCakA/umyyk6FA1QC177aUJHgP46e7xEYNiVPvbRnspoWrMbHBJxrvuKcefOnTOEv/4tqQphTNp4fkVly1R6KE6TqU5zI8GKYJf5zdHgm1TSXaETYAIXD41qOcJnK1uDvlSbvx0ow8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZcghowHc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcghowHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750881300; x=1782417300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CYTO3tDxBefodqZnEBz/pegj7yK42fUd6Mdlp7ZrNt0=;
  b=ZcghowHcz2tE0hwQ0q7ZaS4mgm08MOLrC/di+lpyXcasBHKlVabxucWh
   6N6fCbVTe0N85UVAaORP28wsRAeKzU0sIl65IYivAfmivyXZHNGGRJU/C
   gNLWL+2wzzUn/FDWLs6p1hsY2JlzycpjxO8S3Xd1lIQTuW73zEMevUx27
   ked1/TDpzi1LMO6pVes9Wlq3gBlBzfMuhQueT31jSfhSR3AqSpyYrfV7a
   Y8DGpaWKWPUWxN9V9OajNbzb8jGxvnsdhWXhNXfBDcBup5da3CrtaHE2+
   eHqkH5RvsZJ1QB2HQXWGDqMw/JmKj3y4istPLR1nuup0SnahG8j/GFpNC
   A==;
X-CSE-ConnectionGUID: uBKSbHWrRnKeue6Tfm3bUw==
X-CSE-MsgGUID: ek/6ny2BSGW1Mm504zccHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="40782087"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="40782087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 12:54:59 -0700
X-CSE-ConnectionGUID: XjhV2Id2T52Lbjae8ADWWA==
X-CSE-MsgGUID: XhduNX9rQlKHONF+af+yuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="151827743"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 25 Jun 2025 12:54:58 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUWCt-00004N-1C;
	Wed, 25 Jun 2025 19:54:55 +0000
Date: Wed, 25 Jun 2025 21:54:53 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] fs/resctrl/monitor.c:51: warning:
 Cannot understand  * @closid_num_dirty_rmid    The number of dirty RMID each
 CLOSID has.
Message-ID: <202506260338.JCBW9Br8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 13e249bf4944afceae17195b7bb77c767ff61384 [2195/2195] x86/resctrl: Move the filesystem portions of resctrl to live in '/fs/'
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250626/202506260338.JCBW9Br8-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260338.JCBW9Br8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260338.JCBW9Br8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl/monitor.c:51: warning: Cannot understand  * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    on line 51 - I thought it was a doc line


vim +51 fs/resctrl/monitor.c

    49	
    50	/**
  > 51	 * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    52	 *     Only allocated when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is defined.
    53	 *     Indexed by CLOSID. Protected by rdtgroup_mutex.
    54	 */
    55	static u32 *closid_num_dirty_rmid;
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
