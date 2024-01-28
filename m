Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D287A31A6B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 19:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706469221; cv=none; b=jdlNbnbxUEH7X5OsWsP2/Bk84fzTi7V602fAPQlCb5v08Nu+he0Bw0W2H9EOTzZUt8U/iPDbctaIuNfy6BmvicOTbo+1me4z2bDkJijtvLHnXO5wkyes+ZWDkdZF5346hpyLEBhYqEBFaLeo0vBmJ0GwayLiPrJlHdd9tZJMgws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706469221; c=relaxed/simple;
	bh=uEqYmahENhwNKo3qAFPfepdaAjPzVmNGp4EyzE2HJzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oz8R/QDTFXhw+kjsaJ6yulg/YhYSB/0/gARjRaEW8jlq8Ng8xglU0B47gCBWybdcfCctxcVIfbE0XtF6yD2kPdJhA9sSPNFYBTjZLVZEMgAv942qSIyZXtViQqXkq+788epF/M56x7dguGX+gM70rPMCRzRoPpj5Rj1xnE6WYBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsftE5t0; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsftE5t0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706469218; x=1738005218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uEqYmahENhwNKo3qAFPfepdaAjPzVmNGp4EyzE2HJzI=;
  b=RsftE5t0W0Knc4EL5GP222EF2FEy3IsPsZtfDr6bwlodB2yYJgQdFmsU
   PviSRKpWfOGD9Z9WakiOJ3WuPygnZQKCBOCbXDSqMApYAj+5XIsI5+3x9
   189ZHi7JKOkddFMu6m9+bxDRtSXrYBjV+lIOIQhhk4OXv2SavA/RdIe26
   YplAYAQg/2bo0dVYSaOwkwE1ZKWte1eJzXfN8/sU4hqa1r8SjFF1RHdEa
   O8Uxi2W87PYz7x2G1jceqXXqkntaRSKxA7lvoSy3+yCVE+b2N1WRkvoBz
   muKDg2WcBj7W0uJ47/JpvuxeS6vmV5VSI3gD8rGh+hLhuE+2dT20yUieB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="399951797"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="399951797"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 11:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3178209"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jan 2024 11:13:38 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUAb1-0003fe-08;
	Sun, 28 Jan 2024 19:13:35 +0000
Date: Mon, 29 Jan 2024 03:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:uptr_v3 2/11] kernel/bpf/core.c:2975:12: warning: no
 previous prototype for 'bpf_arena_get_user_vm_start'
Message-ID: <202401290328.mApkVJab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git uptr_v3
head:   545ce904000a1f553bc985000a0eee057b6c4847
commit: 35e094065b98d2f1e23592f3e65d4f8c6bc1863e [2/11] bpf: Introduce bpf arena.
config: m68k-m5208evb_defconfig (https://download.01.org/0day-ci/archive/20240129/202401290328.mApkVJab-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290328.mApkVJab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290328.mApkVJab-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.c:2975:12: warning: no previous prototype for 'bpf_arena_get_user_vm_start' [-Wmissing-prototypes]
    2975 | __weak u64 bpf_arena_get_user_vm_start(struct bpf_arena *arena)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/core.c:2979:12: warning: no previous prototype for 'bpf_arena_get_kern_vm_start' [-Wmissing-prototypes]
    2979 | __weak u64 bpf_arena_get_kern_vm_start(struct bpf_arena *arena)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_arena_get_user_vm_start +2975 kernel/bpf/core.c

  2972	
  2973	#ifndef CONFIG_MMU
  2974	__weak const struct bpf_map_ops arena_map_ops;
> 2975	__weak u64 bpf_arena_get_user_vm_start(struct bpf_arena *arena)
  2976	{
  2977		return 0;
  2978	}
> 2979	__weak u64 bpf_arena_get_kern_vm_start(struct bpf_arena *arena)
  2980	{
  2981		return 0;
  2982	}
  2983	#endif
  2984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
