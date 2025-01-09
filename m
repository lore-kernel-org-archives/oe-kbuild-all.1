Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908F814F98
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436919; cv=none; b=BZzgFMrcIcHdi3JJn/POHh196CI1d+L0xXu7twDJApwPOScIVzp+pFGAeIRBKG1wS+LhpBcw4FIQxETpFK6cq87G1o3DVpkG2VBfXnjYdnyDISc035Buckh/9qK6P+WRKUH+qy0D1uIxozzVl+RkMbA7D2xOUBIU9ZmDVGvS6B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436919; c=relaxed/simple;
	bh=dI0CPTCabNtpB1SNnVyIVdes3Tems3mA5jWPeU+VbsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rgZYBwY6JTInFjsksdJbmmz2AAyxP7YLkNiXt2da1mPsMj4EVWSjgpmsLXGEqywVacqmY9qy4zILfdktZgoFH/EeSBb+36O0h+ye3YFosnQwgeyOIE3n8//GmPNvwoJuUf2F7wFBRZQ6O2eug1AZmJvDs3ShbdKrLfhKci1XpaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3irNWuu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3irNWuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736436918; x=1767972918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dI0CPTCabNtpB1SNnVyIVdes3Tems3mA5jWPeU+VbsE=;
  b=I3irNWuu8aYskcJnUN5siq0bAbpJ+d2O3qmkIvDuu86M0QpRCom/YJ98
   5dOkqsi5asG87SuJnr+ekzQUSKgrSLBFmObgUe4QeW0+HUmBigKtTGrTL
   aptHyImnJ29QhLeZ3F7VWn1JcPhFq93ZtV4sYOPXn80nfJqXNGQhGH9jc
   y9YlNfei2y6MoM4dPeI23J/Qo635euCwLLJALqwefrXkmfO23k+Z01+J9
   bNSuvLoeBYxlTyawPkTWAXT1zF3tt9MqJswXMhUUXsmsCX8kHB5aUV1Tr
   z0ow7XAR5acr0HiJdVWbL7IvDQykbGoFO7fc5YMELXtkwB6dEaA1fdlTX
   Q==;
X-CSE-ConnectionGUID: lbH4/eeHSYGcDD/yTMdE+w==
X-CSE-MsgGUID: hqm8eKuaRU+vyLOn7KIWig==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40383715"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40383715"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 07:35:16 -0800
X-CSE-ConnectionGUID: I9bvyJtwSqqGCAK4xHAW8A==
X-CSE-MsgGUID: OBpfjqAFSuG4vkZL7yVBMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="134276256"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jan 2025 07:35:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVuYy-000HkM-2w;
	Thu, 09 Jan 2025 15:35:12 +0000
Date: Thu, 9 Jan 2025 23:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mic:landlock-audit 28/30] security/landlock/domain.c:298: warning:
 Function parameter or struct member 'hierarchy' not described in
 'landlock_read_domain_exe'
Message-ID: <202501092342.r8oAvPSm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git landlock-audit
head:   9d5e76001aa2870f21940d375b404079564c1fa5
commit: b63a3ab444dc9ca6a49711189d4d46ced69d73d3 [28/30] audit,landlock: Add AUDIT_EXE_LANDLOCK_DENY rule type
config: x86_64-randconfig-002-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092342.r8oAvPSm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092342.r8oAvPSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092342.r8oAvPSm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/landlock/domain.c:298: warning: Function parameter or struct member 'hierarchy' not described in 'landlock_read_domain_exe'


vim +298 security/landlock/domain.c

   280	
   281	/**
   282	 * landlock_read_domain_exe - Read the domain creator's exe information
   283	 *
   284	 * @ino: Returned inode number, only set if the returned value is true.
   285	 * @dev: Returned device number, only set if the returned value is true.
   286	 *
   287	 * Returns: True if the underlying exe's inode is still alive (i.e. its
   288	 * superblock was not unmounted).
   289	 *
   290	 * To avoid a race condition, the caller must make sure that the compared
   291	 * object could not be changed in the check window.  audit_filter() and
   292	 * audit_filter_rules() dereference the compared audit entry in an RCU
   293	 * read-side critical section, which means that the related checked ino/dev
   294	 * stays consistent (see audit_update_watch()).
   295	 */
   296	bool landlock_read_domain_exe(const struct landlock_hierarchy *const hierarchy,
   297				      ino_t *const ino, dev_t *const dev)
 > 298	{
   299		if (!hierarchy || WARN_ON_ONCE(!ino || !dev))
   300			return false;
   301	
   302		/*
   303		 * If the underlying inode does not exist, this means that the inode's
   304		 * superblock was unmounted, and @ino and @dev do not identify the same
   305		 * file.  Similarly, a removed inode leads to the related audit rule
   306		 * removal, see audit_watch_handle_event()'s handling of
   307		 * FS_DELETE_SELF|FS_UNMOUNT|FS_MOVE_SELF.
   308		 *
   309		 * If the underlying inode exists, this means that the returned @ino
   310		 * and @dev may match an audit rule.
   311		 */
   312		if (!READ_ONCE(hierarchy->details->exe_object->underobj))
   313			return false;
   314	
   315		*ino = hierarchy->details->exe_ino;
   316		*dev = hierarchy->details->exe_dev;
   317		return true;
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
