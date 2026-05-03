Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223217D2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 00:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777767531; cv=none; b=fO0dDOcCRqJU9SECyVnrJObmhxDDNOL4dSHmpIkVdUvr/VEOK4NV6201N2T8yrSNRIWSjKVTx2VkDUWqhAJ+5czQ1L1wi9wDPrfREEgvn4yvJpBPNuq1bqIAmo0evTOQfTmNHXJxw2LnnvH4aHcPBj4ySo76xng5Qh5VC3A1Q+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777767531; c=relaxed/simple;
	bh=fN4hvEG2/0CBI5zkzoxQ2lzZVJFhbG+OfarPQwnAw3s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T0jLXLjFhJUiYrHbt2wLhSvUigULlzvM2hSfKcqC3D0lK7oWyWvYIAOvv8B50qZCVOyIOZAgGutYSW8Wve4BKU11L/+BiWSDfwbQXPHXdgtni0VsEl7r7J5KrbZryII1udnszhjHthweSHA99sAhfswNtfkvpSponPH52NOWIKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G30Vn8+M; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G30Vn8+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777767529; x=1809303529;
  h=date:from:to:cc:subject:message-id;
  bh=fN4hvEG2/0CBI5zkzoxQ2lzZVJFhbG+OfarPQwnAw3s=;
  b=G30Vn8+MfGhRF7VjbYjXQ2OlP83e65v8w33I3/cO8cX4kCEgsVRflZ0u
   LPJtIWid+qXfwx4oJtswM0TsVXve1rJQhozF137tC6rHxgP+HF2hUdqpC
   M7DsUoOd0nKjmqqWywariPGLVSW76WLK5qTRFuhDwvfZYr4sXwgmO+QaL
   K37HuxrbEPJRBZmUbYMLD7t/lPVstlhSqfClXYH76gCYAA1jDl5mSLgSl
   zeWFFgKKN6+6+qh462Z2v4HzL3HiMvAaYu+ldwEPE8t1i34gKGVtei5Iu
   BfmL3DaUqpZ06oxnrZHNlkYRpa/8g7xyIWSiy/0SGqJGDZr3P4urwkZW2
   g==;
X-CSE-ConnectionGUID: lOspMrGiSRiPIhmJx/dyzg==
X-CSE-MsgGUID: Q7hTnplfQs6+fndm6bueeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="90140259"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="90140259"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 17:18:48 -0700
X-CSE-ConnectionGUID: HMQ2KKGpQkuM3FxNb7THxw==
X-CSE-MsgGUID: 0GCvRRtqQdG+I06KCiX5qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="239141724"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 May 2026 17:18:48 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJKXl-000000001wP-00jM;
	Sun, 03 May 2026 00:18:45 +0000
Date: Sun, 03 May 2026 08:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:kvfree-rcu-improvements-rfc-v2r1-wip 4/9] Warning:
 mm/slab_common.c:1342 struct member 'defer_head' not described in
 'kfree_rcu_cpu'
Message-ID: <202605030845.QSYIJMCj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kvfree-rcu-improvements-rfc-v2r1-wip
head:   1e4fd024c798fbeff0b5a3c5f55cdcf710367c59
commit: 56d22ff0926080094a3df57e64b2aa87c9e1433d [4/9] mm/slab: introduce kfree_rcu_nolock()
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605030845.QSYIJMCj-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030845.QSYIJMCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030845.QSYIJMCj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slab_common.c:1342 struct member 'defer_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'defer_free' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'sched_delayed_monitor' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'run_page_cache_worker' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'defer_head' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'defer_free' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'sched_delayed_monitor' not described in 'kfree_rcu_cpu'
>> Warning: mm/slab_common.c:1342 struct member 'run_page_cache_worker' not described in 'kfree_rcu_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
