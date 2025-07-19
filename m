Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5381E7C10
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 11:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752924872; cv=none; b=UwUkG79Lji42bVZ4m5/pGaYkQyvcF4IAIfy5m/prOOD/V65x3vAviJJaPnFRhhbJityX+PMcwmXyROx7G8AHhu9gI7PVuojC9BnZ38swIQHsYl1XMPZ0+9JMrESCRh1plLHm27lkan0PXyBnJDiNIbz6g2xuf1At4czqYvJ2NTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752924872; c=relaxed/simple;
	bh=kGTZV+51xE5lD2Y+jMCPVFmywbXUVKPeq8T/o8HjeG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hDJn+B/2E1JkYRNmVccjyOR3IRfZArQO/39GfJ57dl+YU75TaIrLNelP3mndu8p8o1HWUS8cAWRNHVHD8b/z1H7DnpiazA+SzhPw2iteTUNq6NleGjEBPTnBPeydVIGrrPjnpjoDexwOEcbLMhvGXhQ6+MGXSKuI78o1Prbg7jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7sKVH3C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7sKVH3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752924872; x=1784460872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kGTZV+51xE5lD2Y+jMCPVFmywbXUVKPeq8T/o8HjeG0=;
  b=O7sKVH3C0xviiibxz3xA+gHLCm31/FZOkyTHO+W5A+/EqEZ5S+XSTE9L
   pqksdXHWWRFDAIw7jRToPuNGwvy/HYUpYVdLDMauVsPN2j08CgLD6cM8X
   LMCeO3fZH83H728PYej4hwglKAeReZoj0b9daUUOqRfutIBIFl5chuGOM
   xzk4JgI7TbJPlTj9cTtiGGJoISwCGNVoLWiLhIdHODkNqlDw9KWgpNBSE
   N0ZcvGRjxuXSoFlV+aFvnk8Nvbpj69UZPgzirLOkJDtV5x3yVuXouBvWn
   2isou6RxWKZJR9IEFv993SyrzXS5xQ5hyDnQNXchld2uF9FmRlUlKA1/m
   A==;
X-CSE-ConnectionGUID: KGajXTJkQ5yVmMqLIm192w==
X-CSE-MsgGUID: /IWh19joTHefQGlfZlMPpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="65895545"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="65895545"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 04:34:31 -0700
X-CSE-ConnectionGUID: kGhhQk3cRySb1VijuOba8g==
X-CSE-MsgGUID: XzmfgG4oQhe+VVOup6WXLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="162983091"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 19 Jul 2025 04:34:30 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud5pj-000153-0y;
	Sat, 19 Jul 2025 11:34:27 +0000
Date: Sat, 19 Jul 2025 13:34:12 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/irq-exit-v2 4/11] Warning: kernel/rcu/tree.c:734 function
 parameter 'value' not described in 'rcu_set_exp_qs_needed'
Message-ID: <202507191356.oB3tMuao-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/irq-exit-v2
head:   3108c511b834e8cc98679782f42cf1eed9b5a41e
commit: 7ccc41afea53b41ec9c8f3d77e877062a23184dc [4/11] rcu: Add helper functions for task and cpu_no_qs flag setting
config: openrisc-randconfig-2003-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191356.oB3tMuao-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191356.oB3tMuao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191356.oB3tMuao-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/rcu/tree.c:734 function parameter 'value' not described in 'rcu_set_exp_qs_needed'
>> Warning: kernel/rcu/tree.c:745 function parameter 'rdp' not described in 'rcu_set_exp_qs_needed_cpu'
>> Warning: kernel/rcu/tree.c:745 function parameter 'value' not described in 'rcu_set_exp_qs_needed_cpu'
>> Warning: kernel/rcu/tree.c:754 function parameter 'rdp' not described in 'rcu_set_norm_qs_needed'
>> Warning: kernel/rcu/tree.c:754 function parameter 'value' not described in 'rcu_set_norm_qs_needed'
>> Warning: kernel/rcu/tree.c:762 function parameter 't' not described in 'rcu_set_blocked'
>> Warning: kernel/rcu/tree.c:762 function parameter 'value' not described in 'rcu_set_blocked'
>> Warning: kernel/rcu/tree.c:770 function parameter 't' not described in 'rcu_set_need_qs'
>> Warning: kernel/rcu/tree.c:770 function parameter 'value' not described in 'rcu_set_need_qs'
>> Warning: kernel/rcu/tree.c:778 function parameter 't' not described in 'rcu_set_exp_hint'
>> Warning: kernel/rcu/tree.c:778 function parameter 'value' not described in 'rcu_set_exp_hint'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
