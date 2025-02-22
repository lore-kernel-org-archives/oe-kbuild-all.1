Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ED81E990D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740217679; cv=none; b=PoHWZCyZ9Pe0qjAY8hps5GGvfUXVDIWzJ5fbQepGsztcQwgWL5nE1bQnIfPxs8/t4wNOQurlFfCzxT2RU8TL3Q8Sw/smeq4tJ/wdlZ4zb8HvCEswNLuFYUutJ2wJyZ7zuSPPJC+h6Dk1TndXMFmhJxUD4WqeJqJ3rLktyc/SUws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740217679; c=relaxed/simple;
	bh=VC9MqGt/+SBpJQtov8Ohq1KFhi74ngxeUN8u8OR1yx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lMrVogwJfcxTMkmpRz1Pb4plZmBXsKIWrMaa5+8TG1MBVH7hUBjSrnrQfyVH1lanajxsm6mlrGT/6nKQ+UrSxSP40v2di9yyE7Spzc3B57sdbhvpZj0XELwMHSEgFS+ud+avi04D5nkV/0rj7W7tRCVtQX4bc/eqQZJCxNjsXhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmXQLz2O; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmXQLz2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740217677; x=1771753677;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VC9MqGt/+SBpJQtov8Ohq1KFhi74ngxeUN8u8OR1yx8=;
  b=RmXQLz2O79Zf09BC3GQN5/wrp+bayJFAOCbMVoK/7V64ZexqXd0j1+rf
   qKsaCH3cMRNudjcknzQPGazE4dPLvDdlV/HQQVSrd8W4p3TGBUx4SWIHU
   Ega1NKrjDRVeKDPNM8kpPfu+LCceRkviAfpgbvJvbbb0+l4IszE9IrJfj
   AhBu2oVvO++4AYCfbZekTsZV3phxGxTcLroYnBngDyFewgloGkuywsUCy
   phAL2dSVV+Ubp04QjIL6QCz6MwmqaAvxzHoHw/ARyKeF/z30swWt6+uXA
   mUbFsW11n/R0B+n+NdE8T4hSAGvLdYxY2Uu+3hgEN0VWv/1MTAXUpH1Ck
   g==;
X-CSE-ConnectionGUID: r2oYGuWpQxyrzicFjm9L6A==
X-CSE-MsgGUID: 4WCGIFW5RFyyxLwaqlDk/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41156783"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="41156783"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 01:47:56 -0800
X-CSE-ConnectionGUID: 65oFwDcxSA2AEXWVPrpbng==
X-CSE-MsgGUID: zNiZ6OaAQQiUZyylcip9Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="146435191"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Feb 2025 01:47:55 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlm6y-0006SN-1h;
	Sat, 22 Feb 2025 09:47:52 +0000
Date: Sat, 22 Feb 2025 17:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 11/42]
 security/selinux/ss/services.c:3351: warning: expecting prototype for
 security_net_peersid_resolve(). Prototype was for
 selinux_ss_net_peersid_resolve() instead
Message-ID: <202502221736.Nu0taZX4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   8e33da6864e173556431920c74deb653617db98e
commit: 1f558f32ef4677c3e01f4c7c5676f5c3f0bb7f06 [11/42] selinux: wrap security server interfaces to use the global SID table
config: i386-buildonly-randconfig-001-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221736.Nu0taZX4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221736.Nu0taZX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221736.Nu0taZX4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/selinux/ss/services.c:3351: warning: expecting prototype for security_net_peersid_resolve(). Prototype was for selinux_ss_net_peersid_resolve() instead


vim +3351 security/selinux/ss/services.c

08554d6b33e60aa Venkat Yekkirala   2006-07-24  3324  
220deb966ea51e0 Paul Moore         2008-01-29  3325  /**
220deb966ea51e0 Paul Moore         2008-01-29  3326   * security_net_peersid_resolve - Compare and resolve two network peer SIDs
bda968686f89b55 Stephen Smalley    2024-07-30  3327   * @state: SELinux state
220deb966ea51e0 Paul Moore         2008-01-29  3328   * @nlbl_sid: NetLabel SID
220deb966ea51e0 Paul Moore         2008-01-29  3329   * @nlbl_type: NetLabel labeling protocol type
220deb966ea51e0 Paul Moore         2008-01-29  3330   * @xfrm_sid: XFRM SID
e9fd7292935906c Paul Moore         2020-11-18  3331   * @peer_sid: network peer sid
220deb966ea51e0 Paul Moore         2008-01-29  3332   *
220deb966ea51e0 Paul Moore         2008-01-29  3333   * Description:
220deb966ea51e0 Paul Moore         2008-01-29  3334   * Compare the @nlbl_sid and @xfrm_sid values and if the two SIDs can be
220deb966ea51e0 Paul Moore         2008-01-29  3335   * resolved into a single SID it is returned via @peer_sid and the function
220deb966ea51e0 Paul Moore         2008-01-29  3336   * returns zero.  Otherwise @peer_sid is set to SECSID_NULL and the function
220deb966ea51e0 Paul Moore         2008-01-29  3337   * returns a negative value.  A table summarizing the behavior is below:
220deb966ea51e0 Paul Moore         2008-01-29  3338   *
220deb966ea51e0 Paul Moore         2008-01-29  3339   *                                 | function return |      @sid
220deb966ea51e0 Paul Moore         2008-01-29  3340   *   ------------------------------+-----------------+-----------------
220deb966ea51e0 Paul Moore         2008-01-29  3341   *   no peer labels                |        0        |    SECSID_NULL
220deb966ea51e0 Paul Moore         2008-01-29  3342   *   single peer label             |        0        |    <peer_label>
220deb966ea51e0 Paul Moore         2008-01-29  3343   *   multiple, consistent labels   |        0        |    <peer_label>
220deb966ea51e0 Paul Moore         2008-01-29  3344   *   multiple, inconsistent labels |    -<errno>     |    SECSID_NULL
220deb966ea51e0 Paul Moore         2008-01-29  3345   *
220deb966ea51e0 Paul Moore         2008-01-29  3346   */
1f558f32ef4677c Stephen Smalley    2024-09-05  3347  int selinux_ss_net_peersid_resolve(struct selinux_state *state,
bda968686f89b55 Stephen Smalley    2024-07-30  3348  				 u32 nlbl_sid, u32 nlbl_type,
220deb966ea51e0 Paul Moore         2008-01-29  3349  				 u32 xfrm_sid,
220deb966ea51e0 Paul Moore         2008-01-29  3350  				 u32 *peer_sid)
220deb966ea51e0 Paul Moore         2008-01-29 @3351  {
1b8b31a2e6120b7 Stephen Smalley    2020-08-19  3352  	struct selinux_policy *policy;
461698026ffa740 Stephen Smalley    2020-08-07  3353  	struct policydb *policydb;
461698026ffa740 Stephen Smalley    2020-08-07  3354  	struct sidtab *sidtab;
220deb966ea51e0 Paul Moore         2008-01-29  3355  	int rc;
220deb966ea51e0 Paul Moore         2008-01-29  3356  	struct context *nlbl_ctx;
220deb966ea51e0 Paul Moore         2008-01-29  3357  	struct context *xfrm_ctx;
220deb966ea51e0 Paul Moore         2008-01-29  3358  
4b02b524487622c Eric Paris         2010-11-23  3359  	*peer_sid = SECSID_NULL;
4b02b524487622c Eric Paris         2010-11-23  3360  
220deb966ea51e0 Paul Moore         2008-01-29  3361  	/* handle the common (which also happens to be the set of easy) cases
220deb966ea51e0 Paul Moore         2008-01-29  3362  	 * right away, these two if statements catch everything involving a
220deb966ea51e0 Paul Moore         2008-01-29  3363  	 * single or absent peer SID/label */
220deb966ea51e0 Paul Moore         2008-01-29  3364  	if (xfrm_sid == SECSID_NULL) {
220deb966ea51e0 Paul Moore         2008-01-29  3365  		*peer_sid = nlbl_sid;
220deb966ea51e0 Paul Moore         2008-01-29  3366  		return 0;
220deb966ea51e0 Paul Moore         2008-01-29  3367  	}
220deb966ea51e0 Paul Moore         2008-01-29  3368  	/* NOTE: an nlbl_type == NETLBL_NLTYPE_UNLABELED is a "fallback" label
220deb966ea51e0 Paul Moore         2008-01-29  3369  	 * and is treated as if nlbl_sid == SECSID_NULL when a XFRM SID/label
220deb966ea51e0 Paul Moore         2008-01-29  3370  	 * is present */
220deb966ea51e0 Paul Moore         2008-01-29  3371  	if (nlbl_sid == SECSID_NULL || nlbl_type == NETLBL_NLTYPE_UNLABELED) {
220deb966ea51e0 Paul Moore         2008-01-29  3372  		*peer_sid = xfrm_sid;
220deb966ea51e0 Paul Moore         2008-01-29  3373  		return 0;
220deb966ea51e0 Paul Moore         2008-01-29  3374  	}
220deb966ea51e0 Paul Moore         2008-01-29  3375  
bda968686f89b55 Stephen Smalley    2024-07-30  3376  	if (!selinux_initialized(state))
37ea433c66070fc Stephen Smalley    2020-08-19  3377  		return 0;
37ea433c66070fc Stephen Smalley    2020-08-19  3378  
1b8b31a2e6120b7 Stephen Smalley    2020-08-19  3379  	rcu_read_lock();
bda968686f89b55 Stephen Smalley    2024-07-30  3380  	policy = rcu_dereference(state->policy);
1b8b31a2e6120b7 Stephen Smalley    2020-08-19  3381  	policydb = &policy->policydb;
1b8b31a2e6120b7 Stephen Smalley    2020-08-19  3382  	sidtab = policy->sidtab;
461698026ffa740 Stephen Smalley    2020-08-07  3383  
aa8e712cee93d52 Stephen Smalley    2018-03-01  3384  	/*
aa8e712cee93d52 Stephen Smalley    2018-03-01  3385  	 * We don't need to check initialized here since the only way both
220deb966ea51e0 Paul Moore         2008-01-29  3386  	 * nlbl_sid and xfrm_sid are not equal to SECSID_NULL would be if the
aa8e712cee93d52 Stephen Smalley    2018-03-01  3387  	 * security server was initialized and state->initialized was true.
aa8e712cee93d52 Stephen Smalley    2018-03-01  3388  	 */
461698026ffa740 Stephen Smalley    2020-08-07  3389  	if (!policydb->mls_enabled) {
461698026ffa740 Stephen Smalley    2020-08-07  3390  		rc = 0;
461698026ffa740 Stephen Smalley    2020-08-07  3391  		goto out;
461698026ffa740 Stephen Smalley    2020-08-07  3392  	}
220deb966ea51e0 Paul Moore         2008-01-29  3393  
4b02b524487622c Eric Paris         2010-11-23  3394  	rc = -EINVAL;
aa8e712cee93d52 Stephen Smalley    2018-03-01  3395  	nlbl_ctx = sidtab_search(sidtab, nlbl_sid);
220deb966ea51e0 Paul Moore         2008-01-29  3396  	if (!nlbl_ctx) {
b54c85c15a7bf1a peter enderborg    2018-06-12  3397  		pr_err("SELinux: %s:  unrecognized SID %d\n",
744ba35e455b0d5 Eric Paris         2008-04-17  3398  		       __func__, nlbl_sid);
4b02b524487622c Eric Paris         2010-11-23  3399  		goto out;
220deb966ea51e0 Paul Moore         2008-01-29  3400  	}
4b02b524487622c Eric Paris         2010-11-23  3401  	rc = -EINVAL;
aa8e712cee93d52 Stephen Smalley    2018-03-01  3402  	xfrm_ctx = sidtab_search(sidtab, xfrm_sid);
220deb966ea51e0 Paul Moore         2008-01-29  3403  	if (!xfrm_ctx) {
b54c85c15a7bf1a peter enderborg    2018-06-12  3404  		pr_err("SELinux: %s:  unrecognized SID %d\n",
744ba35e455b0d5 Eric Paris         2008-04-17  3405  		       __func__, xfrm_sid);
4b02b524487622c Eric Paris         2010-11-23  3406  		goto out;
220deb966ea51e0 Paul Moore         2008-01-29  3407  	}
83e7e18eed6e06c Christian Göttsche 2024-12-16  3408  	rc = (mls_context_equal(nlbl_ctx, xfrm_ctx) ? 0 : -EACCES);
4b02b524487622c Eric Paris         2010-11-23  3409  	if (rc)
4b02b524487622c Eric Paris         2010-11-23  3410  		goto out;
220deb966ea51e0 Paul Moore         2008-01-29  3411  
220deb966ea51e0 Paul Moore         2008-01-29  3412  	/* at present NetLabel SIDs/labels really only carry MLS
220deb966ea51e0 Paul Moore         2008-01-29  3413  	 * information so if the MLS portion of the NetLabel SID
220deb966ea51e0 Paul Moore         2008-01-29  3414  	 * matches the MLS portion of the labeled XFRM SID/label
220deb966ea51e0 Paul Moore         2008-01-29  3415  	 * then pass along the XFRM SID as it is the most
220deb966ea51e0 Paul Moore         2008-01-29  3416  	 * expressive */
220deb966ea51e0 Paul Moore         2008-01-29  3417  	*peer_sid = xfrm_sid;
4b02b524487622c Eric Paris         2010-11-23  3418  out:
1b8b31a2e6120b7 Stephen Smalley    2020-08-19  3419  	rcu_read_unlock();
220deb966ea51e0 Paul Moore         2008-01-29  3420  	return rc;
220deb966ea51e0 Paul Moore         2008-01-29  3421  }
220deb966ea51e0 Paul Moore         2008-01-29  3422  

:::::: The code at line 3351 was first introduced by commit
:::::: 220deb966ea51e0dedb6a187c0763120809f3e64 SELinux: Better integration between peer labeling subsystems

:::::: TO: Paul Moore <paul.moore@hp.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
