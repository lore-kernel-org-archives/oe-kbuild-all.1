Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EAA1F03EF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764768638; cv=none; b=qoBlE+wp5xYc7/kYicJzQE4JQohIKG0ZizP9aOlEPg1RkaEssu0/Nm+apI9beRzZFJ6WXAYenK1VssKkp6880iUGi0uieEEBT5wBctTK2EsYGAJ9eDPX14eCoyy+wKRKIkI4eln6dK04MiDdYs0Yjv7u3sqRyxYrRCIgdWZLJK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764768638; c=relaxed/simple;
	bh=CWD4n82maUKU7+Fy6Iu/hxENK89dfOYfa5coXOSuDE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SNViOWlXOz2Z1mGBoSuDEj1+A1EzVtksH/oQvn49PqYfuAniRyT2RohrBj60rQgCoA/jgufXqDfiwSB/sh8a1cVX61tkgy1wkzjQZNE5JOPhbwmtFwFXWG7ywJtVOQMyIq6dY+2RXWrk/Uo2MQxFLVz8GiBYdd9vPn2DYca5dfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3HNI7S9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3HNI7S9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764768636; x=1796304636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CWD4n82maUKU7+Fy6Iu/hxENK89dfOYfa5coXOSuDE0=;
  b=d3HNI7S9ET9P67B+5I1bhWjNai2cMsmTCz8cpOr6lNaPpE4xRyIXEGsZ
   qOcdMFeQ5RPQorjZW5aMCCtPua2TTYlKZnqnkU/yYiKpNNAoW8cwb9XZI
   UQrGRmkmK910NxM5YIntUzfJMuxuMKzoW31aHmcAm6T1XH6y9JvWLTW7M
   QKonVKOyDgfOm6aChl1RRSJvEbLw8HUG3Z6TGV7J8l/pP66EdIb47jdt+
   xrgHC57GlAA+GvDmKlsPjDjQv5cogVpmihmMW2WXqozAoiggHdUoqywMD
   OA6URzWE3mcY8aXkELIrwPmBF6YafNQKW8tK+JC2YXldyR25LlvHvftnp
   Q==;
X-CSE-ConnectionGUID: 6JFV2SG3S5KhUj/KWw5BXg==
X-CSE-MsgGUID: 7M014eBPSS+XkAbptGfu5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92239543"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="92239543"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 05:30:36 -0800
X-CSE-ConnectionGUID: jUpzrQgDTVml5LT8Gs8dMA==
X-CSE-MsgGUID: FYX5xfk9Qaa6rH/SbCMqJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="194902136"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Dec 2025 05:30:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQmwD-00000000B0j-0t8V;
	Wed, 03 Dec 2025 13:30:33 +0000
Date: Wed, 3 Dec 2025 21:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/memory.c:3334: warning:
 Excess function parameter 'start' description in 'unmap_mapping_zeropages'
Message-ID: <202512032133.crOyRaEF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kaihao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   495c6b49736046cad5a06a343ca0be2750aed6fe
commit: 09797fd32d329b879a57e99f74d83d5704511ea4 [2/2] anolis: mm: add switch for file zero page
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251203/202512032133.crOyRaEF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512032133.crOyRaEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512032133.crOyRaEF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:3334: warning: Excess function parameter 'start' description in 'unmap_mapping_zeropages'
>> mm/memory.c:3334: warning: Excess function parameter 'nr' description in 'unmap_mapping_zeropages'


vim +3334 mm/memory.c

  3323	
  3324	/**
  3325	 * unmap_mapping_zeropages() - Unmap zeropages from processes.
  3326	 * @mapping: The address space containing pages to be unmapped.
  3327	 * @start: Index of first page to be unmapped.
  3328	 * @nr: Number of pages to be unmapped.  0 to unmap to end of file.
  3329	 *
  3330	 * Unmap the zero pages in this address space from any userspace process which
  3331	 * has them mmaped.
  3332	 */
  3333	void unmap_mapping_zeropages(struct address_space *mapping)
> 3334	{
  3335		struct zap_details details = { };
  3336	
  3337		details.check_mapping = mapping;
  3338		details.first_index = 0;
  3339		details.last_index = ULONG_MAX;
  3340		details.flags = ZAP_ZEROPAGE;
  3341	
  3342		i_mmap_lock_write(mapping);
  3343		if (unlikely(!RB_EMPTY_ROOT(&mapping->i_mmap.rb_root)))
  3344			unmap_mapping_range_tree(&mapping->i_mmap, &details);
  3345		i_mmap_unlock_write(mapping);
  3346	}
  3347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
