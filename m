Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAAB2D0283
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 11:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758110258; cv=none; b=dzVVVjhkEW4VALusGjRYzsmMMiyLM+qeTaN9nXCjtCL+ArfgvQaU2cHypEs+lPBTfw9FBKs7rVt/hvFeNrYnPvcxhxIgzJx2NAgsTC1sTIxkvTLRBvDW1ZBfCdpjNLPSkhGT7dBox2lgBP6Z4sxJnBIbU5QbP8KOpXniM6DJ62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758110258; c=relaxed/simple;
	bh=hb2aWuYl8LzDayGWy2LgayAXM1HzVHqQ/3/Ga76YBd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BNUkT/Cp6yFYeEKxNyA+BzII8agdw8bqK6gwF7BxuPJdx/P6AvnDV2dn4lkrQp93nhztJUCflhhy0EXrxSovfyB8XmYMUQJjye3YjEeknj98/eX8gjx6PwZsoJFUyGrmbON7rroZ40lXqmc+FVotd9BMRH8PbnME6/epf6r3fRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U58W/Oo2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U58W/Oo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758110256; x=1789646256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hb2aWuYl8LzDayGWy2LgayAXM1HzVHqQ/3/Ga76YBd8=;
  b=U58W/Oo2vxff5J8PnnSBkHMNzeXwD77FMg3Q4si270o/+FsN42ZRi3/l
   VIfvt5ocCnrL2L4wJuDkRzhTRqyL9HmBOlGwHEaRCNvLfWcq3vF/W4YQm
   uKe9FPuoNBJkkmahfRT5TGsQEilUeAF0EsN9jlNT/d/ZgC9QiRt1lJPRL
   B6HfeCoYRoldQbbyg5VKgi/Ec6RHHeGGmDspxJew+NlBY+M5cYbrYT9f/
   JaHw4uoJhrbZLDJNdfWQCtL/VpbFjHxq1IlIQCgyZko12ESADIONPgyTz
   W94XYrjieW/WZfxaXXV101NFrFv3K0wKO1Ox0hbywsbjAnB/k4W/3KtoX
   g==;
X-CSE-ConnectionGUID: bJgsEaTmSU+H9ZGHmmnl3A==
X-CSE-MsgGUID: AXXJclP7TjCtO84MG1LqeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60479729"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60479729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 04:57:36 -0700
X-CSE-ConnectionGUID: Z6UGO2kkT6yKsOdO8Lw+Uw==
X-CSE-MsgGUID: 1+dxz4XlTaub9Je68VG8Gg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Sep 2025 04:57:34 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyqmy-0001Rn-1O;
	Wed, 17 Sep 2025 11:57:32 +0000
Date: Wed, 17 Sep 2025 19:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>,
	John Johansen <john.johhansen@canonical.com>
Subject: [pcmoore-lsm:working-lsm_init_rework 40/41]
 security/lsm_init.c:516:undefined reference to `securityfs_init'
Message-ID: <202509171951.rXOi8Oez-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git working-lsm_init_rework
head:   8ea7358ca612bb85eef9179ae746edeb5f1dc9ac
commit: bf19c9b17d8d2f27e2031822337e8d137b2c6224 [40/41] lsm: consolidate all of the LSM framework initcalls
config: x86_64-randconfig-003-20250917 (https://download.01.org/0day-ci/archive/20250917/202509171951.rXOi8Oez-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509171951.rXOi8Oez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509171951.rXOi8Oez-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: security/lsm_init.o: in function `security_initcall_core':
>> security/lsm_init.c:516:(.init.text+0x101b): undefined reference to `securityfs_init'


vim +516 security/lsm_init.c

   508	
   509	/**
   510	 * security_initcall_core - Run the LSM core initcalls
   511	 */
   512	static int __init security_initcall_core(void)
   513	{
   514		int rc_sfs, rc_lsm;
   515	
 > 516		rc_sfs = securityfs_init();
   517		rc_lsm = lsm_initcall(core);
   518	
   519		return (rc_sfs ? rc_sfs : rc_lsm);
   520	}
   521	core_initcall(security_initcall_core);
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
