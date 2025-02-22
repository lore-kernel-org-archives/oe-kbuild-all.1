Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C086614037F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 15:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740238018; cv=none; b=cOioRpuI4mfizz25hajdrn51MPHKPvn1GKDuNFIaXa6JDDTrw2f8ZenPkMdzf6kHhkGc9YEMWr7SOEI4ZVXoSxq68+XTV6pQqMB+nLqrhfkoWCqvVyzAFqpMOw3UY+y/lIohKO5dTkea4NqEpRcDBf9EC+RP/+iH9FD3hW6CxNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740238018; c=relaxed/simple;
	bh=y7v+RZ5tHqMLwvZeLp1a0iFRrKCgs9iAd9kgnuu0/0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DSz/oa9v7ZBHiP20jUhf0mzZZ10xVcwycLPb+aDO0tL9YEkojoThTycZyB9pGs7qSELujfHsZ39CLjzPl/2z1el3re/z3cp2qNFote6AppZGX81TPO5geI24hVVGgETDnMetd6pqh64wE2n/XN78LrbbrkVL/p17KvvRg4RmvwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghKmTGtn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghKmTGtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740238016; x=1771774016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7v+RZ5tHqMLwvZeLp1a0iFRrKCgs9iAd9kgnuu0/0I=;
  b=ghKmTGtnCqSOHS9TFptzeeEUkJ4DzgsO3KRCuSZJ0tvFESVXwNvEaI52
   yHI+jHp02jlTnKg/Ajf6dZtQ/SiSVV0cNSSCvBUuWyBpI0H9nyuNad0z7
   2qyiIrK0I5+zSFSHflbGu9nS/vXT6UrNdiytiO/2XY2KDsUzCKVR0Uo56
   uq4MJciP+jrkjiNRAaHUzUH/AGeUd2Pk7RvVqDst4Wk2vGYUzsQOBfTD+
   7o4ygJ2nskQDU2keQJ8THpuWi9BROsS3Mg313vFpOlzcOYulnhrWjZ3Fr
   IpdZeWAm1bP6qzKc3q73DruARvS1Ozk9fpi5/XAfazcig2L/Fny/vfS2H
   Q==;
X-CSE-ConnectionGUID: khhHYW31Rqy4Z6N3Pd4I1Q==
X-CSE-MsgGUID: Oy4kYUzqTnekBF9xxBc8WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="41058701"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="41058701"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 07:26:55 -0800
X-CSE-ConnectionGUID: qjkmixOeStqf8QvYE1TZNQ==
X-CSE-MsgGUID: NIo1RSbnTr+xFxaFlLy3Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146535880"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Feb 2025 07:26:54 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlrP1-0006fr-2L;
	Sat, 22 Feb 2025 15:26:51 +0000
Date: Sat, 22 Feb 2025 23:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 35/42]
 security/selinux/avc.c:1606: warning: Function parameter or struct member
 'ad' not described in 'cred_obj_has_perm'
Message-ID: <202502222318.2f2ygMSQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   8e33da6864e173556431920c74deb653617db98e
commit: 211533f0f5ee0a6424d42082f37da03d397f1ae8 [35/42] selinux: split cred_ssid_has_perm() into two cases
config: i386-buildonly-randconfig-001-20250222 (https://download.01.org/0day-ci/archive/20250222/202502222318.2f2ygMSQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502222318.2f2ygMSQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502222318.2f2ygMSQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/selinux/avc.c:1286: warning: Function parameter or struct member 'ad' not described in 'cred_task_has_perm'
   security/selinux/avc.c:1286: warning: Excess function parameter 'auditdata' description in 'cred_task_has_perm'
   security/selinux/avc.c:1342: warning: Function parameter or struct member 'ad' not described in 'task_obj_has_perm'
   security/selinux/avc.c:1342: warning: Excess function parameter 'auditdata' description in 'task_obj_has_perm'
   security/selinux/avc.c:1401: warning: Function parameter or struct member 'base_perm' not described in 'cred_has_extended_perms'
   security/selinux/avc.c:1401: warning: Function parameter or struct member 'ad' not described in 'cred_has_extended_perms'
   security/selinux/avc.c:1401: warning: Excess function parameter 'auditdata' description in 'cred_has_extended_perms'
   security/selinux/avc.c:1440: warning: Function parameter or struct member 'ad' not described in 'cred_self_has_perm'
   security/selinux/avc.c:1440: warning: Excess function parameter 'auditdata' description in 'cred_self_has_perm'
   security/selinux/avc.c:1518: warning: Function parameter or struct member 'ad' not described in 'cred_tsid_has_perm'
   security/selinux/avc.c:1518: warning: Excess function parameter 'auditdata' description in 'cred_tsid_has_perm'
>> security/selinux/avc.c:1606: warning: Function parameter or struct member 'ad' not described in 'cred_obj_has_perm'
>> security/selinux/avc.c:1606: warning: Excess function parameter 'auditdata' description in 'cred_obj_has_perm'
   security/selinux/avc.c:1645: warning: Function parameter or struct member 'ad' not described in 'cred_ssid_has_perm'
   security/selinux/avc.c:1645: warning: Excess function parameter 'auditdata' description in 'cred_ssid_has_perm'
   security/selinux/avc.c:1710: warning: Function parameter or struct member 'ad' not described in 'cred_other_has_perm'
   security/selinux/avc.c:1710: warning: Excess function parameter 'auditdata' description in 'cred_other_has_perm'
   security/selinux/avc.c:1755: warning: Function parameter or struct member 'ad' not described in 'selinux_state_has_perm'
   security/selinux/avc.c:1755: warning: Excess function parameter 'auditdata' description in 'selinux_state_has_perm'


vim +1606 security/selinux/avc.c

ea5452c91df1901 Stephen Smalley 2024-09-25  1584  
77119259f8191e6 Stephen Smalley 2024-09-30  1585  /**
211533f0f5ee0a6 Stephen Smalley 2024-10-07  1586   * cred_obj_has_perm - Check and audit permissions on a (ssid, tsid) pair
77119259f8191e6 Stephen Smalley 2024-09-30  1587   * @cred: subject credentials
77119259f8191e6 Stephen Smalley 2024-09-30  1588   * @ssid: source security identifier
77119259f8191e6 Stephen Smalley 2024-09-30  1589   * @tsid: target security identifier
77119259f8191e6 Stephen Smalley 2024-09-30  1590   * @tclass: target security class
77119259f8191e6 Stephen Smalley 2024-09-30  1591   * @requested: requested permissions, interpreted based on @tclass
77119259f8191e6 Stephen Smalley 2024-09-30  1592   * @auditdata: auxiliary audit data
77119259f8191e6 Stephen Smalley 2024-09-30  1593   *
77119259f8191e6 Stephen Smalley 2024-09-30  1594   * Check permissions between a source SID @ssid and a target SID @tsid for
77119259f8191e6 Stephen Smalley 2024-09-30  1595   * @cred's namespace and all ancestors to determine whether the
77119259f8191e6 Stephen Smalley 2024-09-30  1596   * @requested permissions are granted.
77119259f8191e6 Stephen Smalley 2024-09-30  1597   * Audit the granting or denial of permissions in accordance with the policy.
77119259f8191e6 Stephen Smalley 2024-09-30  1598   * Return %0 if all @requested permissions are granted, -%EACCES if any
77119259f8191e6 Stephen Smalley 2024-09-30  1599   * permissions are denied, or another -errno upon other errors.
77119259f8191e6 Stephen Smalley 2024-09-30  1600   * DO NOT USE when checking permissions involving cred/task SIDs; this
77119259f8191e6 Stephen Smalley 2024-09-30  1601   * helper is only for object-to-object checks.
77119259f8191e6 Stephen Smalley 2024-09-30  1602   */
211533f0f5ee0a6 Stephen Smalley 2024-10-07  1603  int cred_obj_has_perm(const struct cred *cred, u32 ssid, u32 tsid,
211533f0f5ee0a6 Stephen Smalley 2024-10-07  1604  		      u16 tclass, u32 requested,
211533f0f5ee0a6 Stephen Smalley 2024-10-07  1605  		      struct common_audit_data *ad)
f7b87de4186db2b Stephen Smalley 2024-09-27 @1606  {
f7b87de4186db2b Stephen Smalley 2024-09-27  1607  	struct task_security_struct *tsec;
f7b87de4186db2b Stephen Smalley 2024-09-27  1608  	struct selinux_state *state;
f7b87de4186db2b Stephen Smalley 2024-09-27  1609  	int rc;
f7b87de4186db2b Stephen Smalley 2024-09-27  1610  
f7b87de4186db2b Stephen Smalley 2024-09-27  1611  	do {
f7b87de4186db2b Stephen Smalley 2024-09-27  1612  		tsec = selinux_cred(cred);
f7b87de4186db2b Stephen Smalley 2024-09-27  1613  		state = tsec->state;
f7b87de4186db2b Stephen Smalley 2024-09-27  1614  		rc = avc_has_perm(state, ssid, tsid, tclass, requested, ad);
f7b87de4186db2b Stephen Smalley 2024-09-27  1615  		if (rc)
f7b87de4186db2b Stephen Smalley 2024-09-27  1616  			return rc;
f7b87de4186db2b Stephen Smalley 2024-09-27  1617  
f7b87de4186db2b Stephen Smalley 2024-09-27  1618  		cred = tsec->parent_cred;
f7b87de4186db2b Stephen Smalley 2024-09-27  1619  	} while (cred);
f7b87de4186db2b Stephen Smalley 2024-09-27  1620  
f7b87de4186db2b Stephen Smalley 2024-09-27  1621  	return 0;
f7b87de4186db2b Stephen Smalley 2024-09-27  1622  }
f7b87de4186db2b Stephen Smalley 2024-09-27  1623  

:::::: The code at line 1606 was first introduced by commit
:::::: f7b87de4186db2b1cb21bc7239f9a08e60f5dfb0 selinux: introduce cred_ssid_has_perm() and cred_other_has_perm()

:::::: TO: Stephen Smalley <stephen.smalley.work@gmail.com>
:::::: CC: Stephen Smalley <stephen.smalley.work@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
