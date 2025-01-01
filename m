Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BF18827
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 11:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735732258; cv=none; b=JVP21sRFkWivbnMSctgXFLn35RPDAtCbXV2lNDQsCS3HoEw6oXE35/T0KRjWNzUlizObljpnqJEwRnbYp5oEVQ3+vYATbqVHyNwyhURugwwTJmIQHSOlX/TbKCYY/KjhReGLT9Ig429VW4oiAe6TWNk9ysH4VTpyVViwWGplHnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735732258; c=relaxed/simple;
	bh=sjkS8FNXOgA+lh5re5cmt2GNPTIxmDZtMUFi2s4dcEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sVgJoyDE+saw2jp3RIfwJCEqBYXJYG5b5rQm0idIkTxMRfRBKkm7qxlcmtg2ZJqtMiQRPPyM4FtCex9NuY9lkmfHLlCz5+WM2K2N85Kt3oDPCBE8Y+5mxFN3ZtzciSGPG8y4NJuEFg5th+QRMz5eRvtooOAOsKN2BSNAbpQ/AtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9XxvO3r; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9XxvO3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735732257; x=1767268257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjkS8FNXOgA+lh5re5cmt2GNPTIxmDZtMUFi2s4dcEY=;
  b=G9XxvO3rEf2gwpFZiyz1eOg3OV8OnwXv7IaMVnsSNMfI4MHRtFcS2nr5
   Kzu7ZRCXOe/pImgOzG+z5YqDpUihSQlry/ZDleFSQjblf3dajklF0Fm4S
   MdgDBQzYa7EGPkYIeDrNlFyz/Xv5wmifCFlqPwy65XbgropeRuiO8aoVh
   V4Znh++AAFZV3k3YRH+smXtG6tk4+MsgT/G1Rw5z4N3SQ5QxeUgqQx73K
   /GhyU5NtWejHK9RfKAzACN8I05P8TQ6sBom7IDYaADL0f0i20iXNPvXMg
   GR/k/fzDT/UsfdjoS/cPom8BUwoCPPkxfPYECw6ZGPYwALok+uw+kqqHh
   A==;
X-CSE-ConnectionGUID: LeYFnLtZQ8CVU1ylMmmezA==
X-CSE-MsgGUID: rMYdaY5yRWK7O5Ta2bCctg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36101853"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="36101853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 03:50:56 -0800
X-CSE-ConnectionGUID: iyQqn6iiRnW4NsP9J2mZOQ==
X-CSE-MsgGUID: BTxJEZQqTnuoluxbHwW8kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101088076"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jan 2025 03:50:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSxFU-0007mk-1a;
	Wed, 01 Jan 2025 11:50:52 +0000
Date: Wed, 1 Jan 2025 19:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>
Subject: security/landlock/fs.c:719: warning: Function parameter or struct
 member '' not described in 'collect_domain_accesses'
Message-ID: <202501011904.VXOMzLe7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: b91c3e4ea756b12b7d992529226edce1cfd854d7 landlock: Add support for file reparenting with LANDLOCK_ACCESS_FS_REFER
date:   2 years, 7 months ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250101/202501011904.VXOMzLe7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011904.VXOMzLe7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011904.VXOMzLe7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 478.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 478.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 478.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 478.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 478.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 478.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 478.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 478.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 478.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 478.
   security/landlock/fs.c:478: warning: Function parameter or struct member '' not described in 'check_access_path_dual'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 478.
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 478.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 478.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 478.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 478.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 478.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 478.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 478.
   Use of uninitialized value $parameterlist[3] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 478.
   Use of uninitialized value $parameterlist[6] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 478.
   security/landlock/fs.c:478: warning: Excess function parameter 'layer_masks_parent1' description in 'check_access_path_dual'
   security/landlock/fs.c:478: warning: Excess function parameter 'layer_masks_parent2' description in 'check_access_path_dual'
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 719.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 719.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 719.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 719.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 719.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 719.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 719.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 719.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 719.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 719.
>> security/landlock/fs.c:719: warning: Function parameter or struct member '' not described in 'collect_domain_accesses'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 719.
   Use of uninitialized value $parameterlist[3] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 719.
>> security/landlock/fs.c:719: warning: Excess function parameter 'layer_masks_dom' description in 'collect_domain_accesses'


vim +719 security/landlock/fs.c

   693	
   694	/**
   695	 * collect_domain_accesses - Walk through a file path and collect accesses
   696	 *
   697	 * @domain: Domain to check against.
   698	 * @mnt_root: Last directory to check.
   699	 * @dir: Directory to start the walk from.
   700	 * @layer_masks_dom: Where to store the collected accesses.
   701	 *
   702	 * This helper is useful to begin a path walk from the @dir directory to a
   703	 * @mnt_root directory used as a mount point.  This mount point is the common
   704	 * ancestor between the source and the destination of a renamed and linked
   705	 * file.  While walking from @dir to @mnt_root, we record all the domain's
   706	 * allowed accesses in @layer_masks_dom.
   707	 *
   708	 * This is similar to check_access_path_dual() but much simpler because it only
   709	 * handles walking on the same mount point and only check one set of accesses.
   710	 *
   711	 * Returns:
   712	 * - true if all the domain access rights are allowed for @dir;
   713	 * - false if the walk reached @mnt_root.
   714	 */
   715	static bool collect_domain_accesses(
   716		const struct landlock_ruleset *const domain,
   717		const struct dentry *const mnt_root, struct dentry *dir,
   718		layer_mask_t (*const layer_masks_dom)[LANDLOCK_NUM_ACCESS_FS])
 > 719	{
   720		unsigned long access_dom;
   721		bool ret = false;
   722	
   723		if (WARN_ON_ONCE(!domain || !mnt_root || !dir || !layer_masks_dom))
   724			return true;
   725		if (is_nouser_or_private(dir))
   726			return true;
   727	
   728		access_dom = init_layer_masks(domain, LANDLOCK_MASK_ACCESS_FS,
   729					      layer_masks_dom);
   730	
   731		dget(dir);
   732		while (true) {
   733			struct dentry *parent_dentry;
   734	
   735			/* Gets all layers allowing all domain accesses. */
   736			if (unmask_layers(find_rule(domain, dir), access_dom,
   737					  layer_masks_dom)) {
   738				/*
   739				 * Stops when all handled accesses are allowed by at
   740				 * least one rule in each layer.
   741				 */
   742				ret = true;
   743				break;
   744			}
   745	
   746			/* We should not reach a root other than @mnt_root. */
   747			if (dir == mnt_root || WARN_ON_ONCE(IS_ROOT(dir)))
   748				break;
   749	
   750			parent_dentry = dget_parent(dir);
   751			dput(dir);
   752			dir = parent_dentry;
   753		}
   754		dput(dir);
   755		return ret;
   756	}
   757	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
