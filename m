Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99301B2182
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740229863; cv=none; b=EklCYgArIvkM/TO0xWjX4kH48ikpnHNdHZ+zagDXGq5smKQIu61m9gofaJ7VBGOsqnKVh7n2bPMBh3u826tx8PQrzhZKA6rGg8IWe6I/y8OKFHRj6KKs42h+/Y6scUtcwb4nlwTO21ked5dIhrcqfNIyw1rvmdnyHNCnbye3Q18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740229863; c=relaxed/simple;
	bh=HNezDl7QnHeK6UKUxGgqfQtINn8omKBZrCUijJfbi6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=plckL1CE3iA/hjvjlxUyDquCBDedJYYlmJxSG2Jb1FviV6GGxi4zaUhP9fzc2qiGqCd6mq+p97QD+V5wNU75v+M/kxMMFwfwElmvUL6kya31u++MYRaJXrBUXQd7NWhQp+AJIh1Lx6VgxqEeC95J1WqtNwbOei9W3pYNXm+gRhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMfEAaP0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMfEAaP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740229861; x=1771765861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HNezDl7QnHeK6UKUxGgqfQtINn8omKBZrCUijJfbi6A=;
  b=nMfEAaP0KnBwKuKE61Zg7puqKocnbY8T0Adjia6KYWhU0SZsx8ggFtzo
   4X9GhEwaZzi3H/xONys/KfSXYS0W7PKH/1V9JJ7pnVuJ8wxcRtdcfUo5v
   Ow16xhO/4VrOYhYkXwVHLw48zzqCj56uc2Dp6zzT7Up0SHVaOSi0iXRy+
   mEaH4X1+GBSI6pvgaQOo97aob9ZPtGyhXLlzdsGmSyaGRPxcpIlse/8Zt
   YVMW1JQYe3LRx1Y4dcEQCxfAyIM0kdkyLbYcSFZlcTCtaAmj07izn++ES
   CGujBRWXYqFnz5zLQQs7QvFbMr3RDAKj6czyxymNsUJ8C8BXFAnio+R0T
   Q==;
X-CSE-ConnectionGUID: QNfs88fdTPGaQNMm3bMQwQ==
X-CSE-MsgGUID: vgIIm5iYSl6xirQwzVOE7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40229808"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="40229808"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 05:11:00 -0800
X-CSE-ConnectionGUID: Uan20aq4R1WTILOi2deLmA==
X-CSE-MsgGUID: pEYD+1pwTQqQoqsuwqo0Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="120536558"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Feb 2025 05:10:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlpHU-0006aJ-08;
	Sat, 22 Feb 2025 13:10:56 +0000
Date: Sat, 22 Feb 2025 21:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 23/42]
 security/selinux/avc.c:1518: warning: Function parameter or struct member
 'ad' not described in 'cred_tsid_has_perm'
Message-ID: <202502222113.HpsjkKpA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   8e33da6864e173556431920c74deb653617db98e
commit: b8a2002fcf91b914b8e8b94e36c25c47c873423b [23/42] selinux: rename cred_has_perm*() to cred_tsid_has_perm*()
config: i386-buildonly-randconfig-001-20250222 (https://download.01.org/0day-ci/archive/20250222/202502222113.HpsjkKpA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502222113.HpsjkKpA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502222113.HpsjkKpA-lkp@intel.com/

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
>> security/selinux/avc.c:1518: warning: Function parameter or struct member 'ad' not described in 'cred_tsid_has_perm'
>> security/selinux/avc.c:1518: warning: Excess function parameter 'auditdata' description in 'cred_tsid_has_perm'
   security/selinux/avc.c:1605: warning: Function parameter or struct member 'ad' not described in 'cred_ssid_has_perm'
   security/selinux/avc.c:1605: warning: Excess function parameter 'auditdata' description in 'cred_ssid_has_perm'
   security/selinux/avc.c:1657: warning: Function parameter or struct member 'ad' not described in 'cred_other_has_perm'
   security/selinux/avc.c:1657: warning: Excess function parameter 'auditdata' description in 'cred_other_has_perm'


vim +1518 security/selinux/avc.c

a1cd8aa391eebc6 Stephen Smalley 2024-09-24  1496  
77119259f8191e6 Stephen Smalley 2024-09-30  1497  
77119259f8191e6 Stephen Smalley 2024-09-30  1498  /**
b8a2002fcf91b91 Stephen Smalley 2024-09-30  1499   * cred_tsid_has_perm - Check and audit permissions on a (cred, tsid) pair
77119259f8191e6 Stephen Smalley 2024-09-30  1500   * @cred: subject credentials
77119259f8191e6 Stephen Smalley 2024-09-30  1501   * @tsid: target security identifier
77119259f8191e6 Stephen Smalley 2024-09-30  1502   * @tclass: target security class
77119259f8191e6 Stephen Smalley 2024-09-30  1503   * @requested: requested permissions, interpreted based on @tclass
77119259f8191e6 Stephen Smalley 2024-09-30  1504   * @auditdata: auxiliary audit data
77119259f8191e6 Stephen Smalley 2024-09-30  1505   *
77119259f8191e6 Stephen Smalley 2024-09-30  1506   * Check permissions between a cred @cred and a target SID @tsid for
77119259f8191e6 Stephen Smalley 2024-09-30  1507   * @cred's namespace and all ancestors to determine whether the
77119259f8191e6 Stephen Smalley 2024-09-30  1508   * @requested permissions are granted, interpreting the permissions based
77119259f8191e6 Stephen Smalley 2024-09-30  1509   * on @tclass.
77119259f8191e6 Stephen Smalley 2024-09-30  1510   * Audit the granting or denial of permissions in accordance with the policy.
77119259f8191e6 Stephen Smalley 2024-09-30  1511   * Return %0 if all @requested permissions are granted, -%EACCES if any
77119259f8191e6 Stephen Smalley 2024-09-30  1512   * permissions are denied, or another -errno upon other errors.
77119259f8191e6 Stephen Smalley 2024-09-30  1513   * DO NOT USE when checking permissions between two creds (or tasks);
77119259f8191e6 Stephen Smalley 2024-09-30  1514   * use cred_other_has_perm() or cred_task_has_perm() instead.
77119259f8191e6 Stephen Smalley 2024-09-30  1515   */
b8a2002fcf91b91 Stephen Smalley 2024-09-30  1516  int cred_tsid_has_perm(const struct cred *cred, u32 tsid, u16 tclass,
ea5452c91df1901 Stephen Smalley 2024-09-25  1517  		       u32 requested, struct common_audit_data *ad)
ea5452c91df1901 Stephen Smalley 2024-09-25 @1518  {
ea5452c91df1901 Stephen Smalley 2024-09-25  1519  	struct task_security_struct *tsec;
ea5452c91df1901 Stephen Smalley 2024-09-25  1520  	struct selinux_state *state;
ea5452c91df1901 Stephen Smalley 2024-09-25  1521  	u32 ssid;
ea5452c91df1901 Stephen Smalley 2024-09-25  1522  	int rc;
ea5452c91df1901 Stephen Smalley 2024-09-25  1523  
ea5452c91df1901 Stephen Smalley 2024-09-25  1524  	do {
ea5452c91df1901 Stephen Smalley 2024-09-25  1525  		tsec = selinux_cred(cred);
ea5452c91df1901 Stephen Smalley 2024-09-25  1526  		ssid = tsec->sid;
ea5452c91df1901 Stephen Smalley 2024-09-25  1527  		state = tsec->state;
ea5452c91df1901 Stephen Smalley 2024-09-25  1528  		rc = avc_has_perm(state, ssid, tsid, tclass, requested, ad);
ea5452c91df1901 Stephen Smalley 2024-09-25  1529  		if (rc)
ea5452c91df1901 Stephen Smalley 2024-09-25  1530  			return rc;
ea5452c91df1901 Stephen Smalley 2024-09-25  1531  
ea5452c91df1901 Stephen Smalley 2024-09-25  1532  		cred = tsec->parent_cred;
ea5452c91df1901 Stephen Smalley 2024-09-25  1533  	} while (cred);
ea5452c91df1901 Stephen Smalley 2024-09-25  1534  
ea5452c91df1901 Stephen Smalley 2024-09-25  1535  	return 0;
ea5452c91df1901 Stephen Smalley 2024-09-25  1536  }
ea5452c91df1901 Stephen Smalley 2024-09-25  1537  

:::::: The code at line 1518 was first introduced by commit
:::::: ea5452c91df190178ee46d0274c2ed059004579b selinux: introduce cred_has_perm()

:::::: TO: Stephen Smalley <stephen.smalley.work@gmail.com>
:::::: CC: Stephen Smalley <stephen.smalley.work@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
