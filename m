Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08835C8FE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762086588; cv=none; b=jcVXSpWOvWkB2lZ6YWDiq7GeO6H7KyYptVK3R35idUZ10heiB3cuYMPhSEPqSk3bJ2v1FWsrw+QkWaBuB1FFCCDxsZlGpf1qH++Hl7cjr09yl7Q30+JahqQOjFlPvLZtz3RY1yP78Urm8lzTvbs4t9zzfebd0aPOdMrR/WRzeus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762086588; c=relaxed/simple;
	bh=0XQhzOet2oQkXKXjSVv7F+p/DtI4//EJ9hPQnq5VndY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JS6Fu/9exyi5LJAGp1qJqZYjqWUUw3tlcHnI/Guht20IZySPutm6oGTvZ/5ATNM9idkrpb83DNe3iXr6ZjReE0nx7IjpuG3mt3JDTHb1QBfmdedS/nOUJN5N0n/15/tUO0WVAIniFks2aCsTLRW8eD+f8YMhkLmITXdZ7/Owyp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIOZWBml; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIOZWBml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762086587; x=1793622587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0XQhzOet2oQkXKXjSVv7F+p/DtI4//EJ9hPQnq5VndY=;
  b=oIOZWBmloPAWucw/MRKnTdWOhV8xbN+J4afL1X51ouZHaXXkcowYZRzA
   vjAvNJ4NPoPM4iroM2dFhgChRTViTN1dP2G9ag1hNfzlpiF8Mk0PBjKFI
   xtYtRaCJi+YIXHcrWTyNscQ2p8Nh7V+8Wg/7khgrkhboBC78aU606Tj52
   TyYUQ6WvpMxzJe513U15E3J0qZduIr5WR4HzfYhuvY7Gob11xsQxpkwds
   y1XptaZuxXM57rNJ16AitKMxjc1ysd53giBuXnilXMRd1QPwJQzQzzAOQ
   zGZ3BpILkI9RifNuyCZiQcwA+Y7dm6tZgu8PkEYAThTEuD7K9sQPAkTWk
   A==;
X-CSE-ConnectionGUID: 8dLx712yQQy6Sc0bjyRESg==
X-CSE-MsgGUID: w/YA5P+iTlWVCneCq5z4fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="74786830"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="74786830"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 04:29:47 -0800
X-CSE-ConnectionGUID: mAkY6MUHRPWGuC3M0CR0Dg==
X-CSE-MsgGUID: gDMli/8HRrSMjZWCctXcuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="186595700"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Nov 2025 04:29:46 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFXDF-000PDI-0X;
	Sun, 02 Nov 2025 12:29:39 +0000
Date: Sun, 2 Nov 2025 20:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:kernel-6.19.cred 2/7]
 security/keys/process_keys.c:54:54: sparse: sparse: incorrect type in
 argument 4 (different address spaces)
Message-ID: <202511022027.FKWPWjmM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git kernel-6.19.cred
head:   9e970633688388842161b767155f88179084b2b7
commit: c7e56a3ba792e3bee2283052a52d9bd51c4a76cf [2/7] creds: make init_cred static
config: sparc-randconfig-r134-20251102 (https://download.01.org/0day-ci/archive/20251102/202511022027.FKWPWjmM-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511022027.FKWPWjmM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511022027.FKWPWjmM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/keys/process_keys.c:54:54: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *extern [addressable] [toplevel] cred @@
   security/keys/process_keys.c:54:54: sparse:     expected struct cred const *cred
   security/keys/process_keys.c:54:54: sparse:     got struct cred const [noderef] __rcu *extern [addressable] [toplevel] cred

vim +54 security/keys/process_keys.c

    34	
    35	/*
    36	 * Get or create a user register keyring.
    37	 */
    38	static struct key *get_user_register(struct user_namespace *user_ns)
    39	{
    40		struct key *reg_keyring = READ_ONCE(user_ns->user_keyring_register);
    41	
    42		if (reg_keyring)
    43			return reg_keyring;
    44	
    45		down_write(&user_ns->keyring_sem);
    46	
    47		/* Make sure there's a register keyring.  It gets owned by the
    48		 * user_namespace's owner.
    49		 */
    50		reg_keyring = user_ns->user_keyring_register;
    51		if (!reg_keyring) {
    52			reg_keyring = keyring_alloc(".user_reg",
    53						    user_ns->owner, INVALID_GID,
  > 54						    init_task.cred,
    55						    KEY_POS_WRITE | KEY_POS_SEARCH |
    56						    KEY_USR_VIEW | KEY_USR_READ,
    57						    0,
    58						    NULL, NULL);
    59			if (!IS_ERR(reg_keyring))
    60				smp_store_release(&user_ns->user_keyring_register,
    61						  reg_keyring);
    62		}
    63	
    64		up_write(&user_ns->keyring_sem);
    65	
    66		/* We don't return a ref since the keyring is pinned by the user_ns */
    67		return reg_keyring;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
