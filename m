Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9EE25D8FD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853679; cv=none; b=JjVRoU4F7HRJr0o+sj62+aAfddGGzbC560Qa/zBQaAUDS1yWAupy+B+yc01GSrmPbxnJboGtbOAaK0aOYxOLsNBM9qm4TdWvq2PfOdP9D+Nncd8+6VBS42frVgD9mE/Dl9kaeXkt47UptesKCrZIS1Nm25+UqSdGaXieAtdosDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853679; c=relaxed/simple;
	bh=KiK4QJM8v1GadsM4xggr0Jw94DMjzBaJ6eIb3EogB6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kFJ39RlgJYsr89eMccdFdfcXay/ihIxWhkl25WNxopHLwjqfD+n+SRfT3BqueaDt16DeZNrc0hffMy/FINZVlCEIamfoOhEaq2FzIjA2BKyRvdw8uSpg111ce/LWKWyb5V+wBLloAgZ5uSeXEpZY6PvVw2rxalHmDsREwaG4hmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgHSW8DN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgHSW8DN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750853678; x=1782389678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KiK4QJM8v1GadsM4xggr0Jw94DMjzBaJ6eIb3EogB6U=;
  b=RgHSW8DNPnvz0rUIObUCKwix77tusL6AadDkoXhAXRbmkxGYiw7ktYIM
   fxgSGF/QassUZFaPDwcEB/Egc5nDZYocE3xfj2z+w50N74HKXbg1X99hW
   4Tg19JuR62CqD3T3BlVuKsVJ9nZE+VK2hOfZaXmHgm45FhTGgxmNjDj4Q
   wZQaIzc15kHCmdMUtFv8fkODjmTIe2eUa6Ww/rT67A6n5xmrYYgNoDcQy
   oFkKUeBHMtl0hFm30C9NpDHqk54wz30rApQ55gn4VAvjVE1UJEU5cjEVz
   DxY2YnqEXFD8ZFnMIxoqj0rLn0kDlyZLXYQgstwCRELedEWsM99Tioc07
   A==;
X-CSE-ConnectionGUID: EFJxM6RmSwSmzobZtgaudw==
X-CSE-MsgGUID: 9323Pv/NR4ab453c08g/yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52839944"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52839944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:14:35 -0700
X-CSE-ConnectionGUID: vAFPwVx9R+uaH/7CfK0zKg==
X-CSE-MsgGUID: XVQMbwmbQ16A8yyz4uxQ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="157700649"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jun 2025 05:14:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUP1M-000T5R-0H;
	Wed, 25 Jun 2025 12:14:32 +0000
Date: Wed, 25 Jun 2025 20:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.3 2/16] mm/bpf_oom.c:31:6: warning: variable
 'ret' is used uninitialized whenever 'if' condition is false
Message-ID: <202506252033.C16GTwlF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Roman,

FYI, the error/warning still remains.

tree:   https://github.com/rgushchin/linux.git bpfoom.1.3
head:   2ad0d39d05d59bc3930ed54991a90d397fd498a8
commit: 954f163d5cf03cb8f4ea7c9930265fc327c46a91 [2/16] mm: introduce a bpf hook for OOM handling
config: arm-randconfig-001-20250625 (https://download.01.org/0day-ci/archive/20250625/202506252033.C16GTwlF-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506252033.C16GTwlF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506252033.C16GTwlF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/bpf_oom.c:31:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      31 |         if (ops && ops->handle_out_of_memory)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:35:11: note: uninitialized use occurs here
      35 |         return !!ret && oc->bpf_memory_freed;
         |                  ^~~
   mm/bpf_oom.c:31:2: note: remove the 'if' if its condition is always true
      31 |         if (ops && ops->handle_out_of_memory)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      32 |                 ret = ops->handle_out_of_memory(oc);
>> mm/bpf_oom.c:31:6: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
      31 |         if (ops && ops->handle_out_of_memory)
         |             ^~~
   mm/bpf_oom.c:35:11: note: uninitialized use occurs here
      35 |         return !!ret && oc->bpf_memory_freed;
         |                  ^~~
   mm/bpf_oom.c:31:6: note: remove the '&&' if its condition is always true
      31 |         if (ops && ops->handle_out_of_memory)
         |             ^~~~~~
   mm/bpf_oom.c:25:9: note: initialize the variable 'ret' to silence this warning
      25 |         int ret, idx;
         |                ^
         |                 = 0
   2 warnings generated.


vim +31 mm/bpf_oom.c

    20	
    21	bool bpf_handle_oom(struct oom_control *oc)
    22	{
    23		struct bpf_oom *b = &system_bpf_oom;
    24		struct bpf_oom_ops *ops;
    25		int ret, idx;
    26	
    27		oc->bpf_memory_freed = false;
    28	
    29		idx = srcu_read_lock(&b->srcu);
    30		ops = READ_ONCE(b->ops);
  > 31		if (ops && ops->handle_out_of_memory)
    32			ret = ops->handle_out_of_memory(oc);
    33		srcu_read_unlock(&b->srcu, idx);
    34	
    35		return !!ret && oc->bpf_memory_freed;
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
