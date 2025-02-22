Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC57886325
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740234225; cv=none; b=K+9fAkVrhdsKVtoV3q5Dz6Y380cThX/sHaOdye/mDXzX5t1iZaAvBlx2wofMpQUgffrvHWQGiw5NCSSIzEWc7eJerpihJrEK0Uc2VzIHAlIpKjgY8mzwsxqAMdaq3VPIjkx4CAHndS7AjdGgU0buhVrrmEMy5OP7Eb8/FFXJhb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740234225; c=relaxed/simple;
	bh=SAf3Tua6Zx0S9SzNeRLFwfwrB45puuR2Gul/P3B58vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sxcxlcbwM6r9L3bCCg1Tr4qqTTyajVfWuGDfKQReUhNOn8/upy5bQnQRFWXrFy/xrZr89oQQKGR/b7ERX50ksoEUJAhMWIQoMCbx6wJGec/ngBo62x1PdeCJe4FvDL4uUg9MtBs4OsbcjaHVhhi6CS5bZOG0z4ONxMipHRzLct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+pHG8f0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+pHG8f0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740234223; x=1771770223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SAf3Tua6Zx0S9SzNeRLFwfwrB45puuR2Gul/P3B58vQ=;
  b=G+pHG8f02n+oGiq1hp4oTArAebTTEL/XTADy2aqxPDSsnwHWzTkJ17T9
   Rbv30WHHUbz3TzYxijMvgZL68cRUmrS4qH/t5d5Qy5tYYLns1O424hAFF
   Iicl0wljUiAv3Whz8+FCaHiDhO3gaL2TNOoK9jr3Smwq5KjLHhzOnhvlt
   14u8GIk7IrrqxpaAh3h3EuNn002iLnX3g5UWf476wP+JB/d9gdpoW4Rdp
   cgSf1CXamDy+/3Iz3benk8qnJG0EzhlYWgt0mqyrrfLPxEks+fGEoM+5E
   EfinfCcgueuMTRQuxVXDVL/qjQLU5norGo6Wndb0J7Xc3iICOxt708umL
   Q==;
X-CSE-ConnectionGUID: HQXgwHukTeihrqo2/y456g==
X-CSE-MsgGUID: bMj5CPBUQpmLTEyGQzQhQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51678776"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="51678776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 06:23:42 -0800
X-CSE-ConnectionGUID: 1xqz+WX2SLKiowOwnFm41g==
X-CSE-MsgGUID: 6uI9N0UUQ3OH2QgMwMVEJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115822289"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Feb 2025 06:23:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlqPr-0006dj-0Q;
	Sat, 22 Feb 2025 14:23:39 +0000
Date: Sat, 22 Feb 2025 22:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 25/42]
 security/selinux/avc.c:1702: warning: Function parameter or struct member
 'ad' not described in 'selinux_state_has_perm'
Message-ID: <202502222200.gY1Nc4mE-lkp@intel.com>
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
commit: 19bcce85ceea977b7ba60990b0cbb3a1fe4a7d4b [25/42] selinux: introduce selinux_state_has_perm()
config: i386-buildonly-randconfig-001-20250222 (https://download.01.org/0day-ci/archive/20250222/202502222200.gY1Nc4mE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502222200.gY1Nc4mE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502222200.gY1Nc4mE-lkp@intel.com/

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
   security/selinux/avc.c:1605: warning: Function parameter or struct member 'ad' not described in 'cred_ssid_has_perm'
   security/selinux/avc.c:1605: warning: Excess function parameter 'auditdata' description in 'cred_ssid_has_perm'
   security/selinux/avc.c:1657: warning: Function parameter or struct member 'ad' not described in 'cred_other_has_perm'
   security/selinux/avc.c:1657: warning: Excess function parameter 'auditdata' description in 'cred_other_has_perm'
>> security/selinux/avc.c:1702: warning: Function parameter or struct member 'ad' not described in 'selinux_state_has_perm'
>> security/selinux/avc.c:1702: warning: Excess function parameter 'auditdata' description in 'selinux_state_has_perm'


vim +1702 security/selinux/avc.c

  1679	
  1680	/**
  1681	 * selinux_state_has_perm - Check and audit permissions on a (ssid, tsid) pair
  1682	 * @state: SELinux state
  1683	 * @ssid: source security identifier
  1684	 * @tsid: target security identifier
  1685	 * @tclass: target security class
  1686	 * @requested: requested permissions, interpreted based on @tclass
  1687	 * @auditdata: auxiliary audit data
  1688	 *
  1689	 * Check permissions between a source SID @ssid and a target SID @tsid for
  1690	 * @state and all ancestors to determine whether the @requested permissions
  1691	 * are granted, interpreting the permissions based on @tclass.
  1692	 * For the ancestor checks, use the SID of the creator of the namespace
  1693	 * as the source SID of the check.
  1694	 * Audit the granting or denial of permissions in accordance with the policy.
  1695	 * Return %0 if all @requested permissions are granted, -%EACCES if any
  1696	 * permissions are denied, or another -errno upon other errors.
  1697	 * DO NOT USE when a cred is available; use cred_*_has_perm() instead.
  1698	 */
  1699	int selinux_state_has_perm(struct selinux_state *state, u32 ssid, u32 tsid,
  1700				   u16 tclass, u32 requested,
  1701				   struct common_audit_data *ad)
> 1702	{
  1703		int rc;
  1704	
  1705		do {
  1706			rc = avc_has_perm(state, ssid, tsid, tclass, requested, ad);
  1707			if (rc)
  1708				return rc;
  1709	
  1710			ssid = state->creator_sid;
  1711			state = state->parent;
  1712		} while (state);
  1713	
  1714		return 0;
  1715	}
  1716	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
