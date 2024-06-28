Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1E91BF312
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719583582; cv=none; b=dJg6uFcUsib/0bmyiY+2d4KNpbejHGTAhnkg3t1c9/bPMHGsL5rYFoSfwAPsi4rBSZnea40qk75dxpf910yi4vH9vgL2FMSszecMDCAhALtbb3hYgCgLKQUWKGNbcXikCeJ+QXX3wcbIXzGGRhIuAFKuIL0GnpmZPxMB0h8+COk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719583582; c=relaxed/simple;
	bh=hOwCeKuDlzXp4WvnlN4C+dJq19RPXDIsOAbFnaOh7Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JvjXPZDQVNh+kT6cC69ip+hc4mWcNsn8QKxax/yiZq/NHkjHSAqbLSyCAMuqI1HPgvwTxWiVD7M741n4GxfbCgpVoYoZz9cLK5nitboLsV26dRpyjR8Vx3ODED6LYBoNsNEDumwMCy0+9HhXCiCjwoAsQhBpMj9RFgAKmDoR2NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T08Nd/l4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T08Nd/l4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719583580; x=1751119580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hOwCeKuDlzXp4WvnlN4C+dJq19RPXDIsOAbFnaOh7Kc=;
  b=T08Nd/l48PzcBEgvGkH9XwMWE4dishlBcqDC3firpFCaflZBCuxJng6m
   xfEgl0cn2oF3Gh9YU0yy618ipGFBrYaAxH8Mc4JyEpNkrfflxULDo+kTa
   jKXelYwurUf9RfXPl61UGle+PfYWPp3D3jik2dnxnQ3FWuVWsRqhRYNxv
   XGt6uw3cHUa/nt5QJLEAWf5i/hmGnpkXgxkJNyGQSezkXzRIKmvATQACF
   dqZ84P7URirb65IyHZ9c1EQq1WLX57wecUnAgEhvXyzfzvAlKHva3BbSG
   jsaBPBhwsIfNjVQ+0AaKSUU4FnN8qvoy9K1iPWWWOB9b2G3stmMowMAW4
   A==;
X-CSE-ConnectionGUID: zOxr2uQFRzyX93jq/NLt/w==
X-CSE-MsgGUID: NYRPY3vBRU+to9kumirGRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="19668570"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="19668570"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 07:06:20 -0700
X-CSE-ConnectionGUID: 9ZP+kozpR4unEnDq+uzy/g==
X-CSE-MsgGUID: cZO+mSYYT0yjcw7VVJA+LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44655512"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Jun 2024 07:06:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNCEy-000HBq-1s;
	Fri, 28 Jun 2024 14:06:16 +0000
Date: Fri, 28 Jun 2024 22:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcg1_cont.1 9/9] include/linux/memcontrol.h:1932:20:
 error: redefinition of 'mem_cgroup_enter_user_fault'
Message-ID: <202406282204.NeTIiM4W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcg1_cont.1
head:   2912fe73c289f9333036146deea5dc50476999ee
commit: 2912fe73c289f9333036146deea5dc50476999ee [9/9] mm: memcg: put struct task_struct::in_user_fault under CONFIG_MEMCG_V1
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240628/202406282204.NeTIiM4W-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282204.NeTIiM4W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282204.NeTIiM4W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:21:
>> include/linux/memcontrol.h:1932:20: error: redefinition of 'mem_cgroup_enter_user_fault'
    1932 | static inline void mem_cgroup_enter_user_fault(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h:1393:20: note: previous definition of 'mem_cgroup_enter_user_fault' with type 'void(void)'
    1393 | static inline void mem_cgroup_enter_user_fault(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/memcontrol.h:1936:20: error: redefinition of 'mem_cgroup_exit_user_fault'
    1936 | static inline void mem_cgroup_exit_user_fault(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h:1397:20: note: previous definition of 'mem_cgroup_exit_user_fault' with type 'void(void)'
    1397 | static inline void mem_cgroup_exit_user_fault(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/mem_cgroup_enter_user_fault +1932 include/linux/memcontrol.h

  1931	
> 1932	static inline void mem_cgroup_enter_user_fault(void)
  1933	{
  1934	}
  1935	
> 1936	static inline void mem_cgroup_exit_user_fault(void)
  1937	{
  1938	}
  1939	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
