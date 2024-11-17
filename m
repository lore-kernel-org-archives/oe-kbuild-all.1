Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B744161
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731827590; cv=none; b=E/Dw0cPgSYjtvI2lbK1RuQ6sLLkyML51nb1LFNkTZOtqwUVyyEGSxn08qrVrSK6mDarF0I6e2YmYVINIZ21VKYDY5VtTag95UTl8o9o5sAvzfoyhC83ja+0uVnL8OcgxE96BGzCNd02NwAjxwZEaUoD+wBW3emqtIYSNn4GN+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731827590; c=relaxed/simple;
	bh=kQaAa23Q1VR5hRPTlv5kCoplQKw0R5RVFGWU71cAY4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XXuqr+COC37Yu9Gra1c53iuwYkXppn4eTvIO2258qahQMQLD5LwgbqhvbuI8xvJMCBvTAnQJ8ze7ZXZq83LjsyoJtzrblfuiCsVBbyXRnp39Ao0pH/iOeFimUv30r4qjWrocuLtUu4wDG2OuXkQ7qtz/QWGcXLB02K5dRoNBJOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNCbWtT0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNCbWtT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731827588; x=1763363588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kQaAa23Q1VR5hRPTlv5kCoplQKw0R5RVFGWU71cAY4o=;
  b=PNCbWtT0y1EVAsenaAKRJprscRKBfeqxnI0ak1oCrazPm/qYm/vQ1h3D
   ZExN7ewi9YLvm8pQUkfesHrbrzvCrbWyUa9Uq37fdeAt/3oof3BXidHd8
   CtRRGbCNaQXLy0Y/6tM5pRaECOr2akhE8X94rwNDhcCj1uvLXv1h8X6lA
   QUpMcCIG2rRH9liW2URwn8NdbX8oF8hjTgm9BiOo0BXkhZNfwzbJEhDn9
   snc88EWEYdvG8ArzzSIOz7N51+phPQpEtnbwlD+EN/ClML/UDxC3JsA7a
   TANqm9fY+5QsySIh7gsskQ4bQVFVB+BUtbzGOmYyvgqsYA7D7jOh7PDUM
   w==;
X-CSE-ConnectionGUID: Bc6kpy3hTiG5MXy5yvaf6Q==
X-CSE-MsgGUID: hfbRBqwlS8i3XzO1kzDb9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31859098"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="31859098"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 23:13:07 -0800
X-CSE-ConnectionGUID: iVjpkuzpSwus+sZVNKBK4Q==
X-CSE-MsgGUID: z8lH0rVdT6exGb+QXxtvEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88506006"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Nov 2024 23:13:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCZSy-0001cY-02;
	Sun, 17 Nov 2024 07:13:04 +0000
Date: Sun, 17 Nov 2024 15:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Gu Bowen <gubowen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] security/security.c:1071:9: error:
 call to undeclared function 'ima_bprm_creds_for_exec'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202411171510.9dZc68aH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: b89997c5e3ffa58c43c4cb3547eb0c11b75d0634 [1474/1474] IMA support script execution check
config: x86_64-buildonly-randconfig-001-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171510.9dZc68aH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171510.9dZc68aH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171510.9dZc68aH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/security.c:14:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> security/security.c:1071:9: error: call to undeclared function 'ima_bprm_creds_for_exec'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1071 |         return ima_bprm_creds_for_exec(bprm);
         |                ^
   security/security.c:1071:9: note: did you mean 'security_bprm_creds_for_exec'?
   security/security.c:1064:5: note: 'security_bprm_creds_for_exec' declared here
    1064 | int security_bprm_creds_for_exec(struct linux_binprm *bprm)
         |     ^
    1065 | {
    1066 |         int ret;
    1067 | 
    1068 |         ret = call_int_hook(bprm_creds_for_exec, 0, bprm);
    1069 |         if (ret)
    1070 |                 return ret;
    1071 |         return ima_bprm_creds_for_exec(bprm);
         |                ~~~~~~~~~~~~~~~~~~~~~~~
         |                security_bprm_creds_for_exec
   1 warning and 1 error generated.


vim +/ima_bprm_creds_for_exec +1071 security/security.c

  1043	
  1044	/**
  1045	 * security_bprm_creds_for_exec() - Prepare the credentials for exec()
  1046	 * @bprm: binary program information
  1047	 *
  1048	 * If the setup in prepare_exec_creds did not setup @bprm->cred->security
  1049	 * properly for executing @bprm->file, update the LSM's portion of
  1050	 * @bprm->cred->security to be what commit_creds needs to install for the new
  1051	 * program.  This hook may also optionally check permissions (e.g. for
  1052	 * transitions between security domains).  The hook must set @bprm->secureexec
  1053	 * to 1 if AT_SECURE should be set to request libc enable secure mode.  @bprm
  1054	 * contains the linux_binprm structure.
  1055	 *
  1056	 * If execveat(2) is called with the AT_CHECK flag, bprm->is_check is set.  The
  1057	 * result must be the same as without this flag even if the execution will
  1058	 * never really happen and @bprm will always be dropped.
  1059	 *
  1060	 * This hook must not change current->cred, only @bprm->cred.
  1061	 *
  1062	 * Return: Returns 0 if the hook is successful and permission is granted.
  1063	 */
  1064	int security_bprm_creds_for_exec(struct linux_binprm *bprm)
  1065	{
  1066		int ret;
  1067	
  1068		ret = call_int_hook(bprm_creds_for_exec, 0, bprm);
  1069		if (ret)
  1070			return ret;
> 1071		return ima_bprm_creds_for_exec(bprm);
  1072	}
  1073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
