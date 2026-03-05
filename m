Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF55C86352
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701725; cv=none; b=gKS4KYWkyR+Vo4Aa+yAUS2MWcxTjB8uvo/IfucCXib6DXQbOV1jYAr/sIZC5AJSZLckC9e3IG3yRo90YHuPOssJvCeOu8NSS9X2vowqPZuWsh2erXAa+jYCxjuAVvZPyhJIoiYqshlAMcQqqqfioiGaZepIcTMiOJSn+QkifjrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701725; c=relaxed/simple;
	bh=IwSYHEIf8OTBQm2ff06A5eB5E+subvCoqbZsHtuFPMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=avTaQgfZ+vH6hs6ZburTv1NXi+Xn8VRvvezNkF25B/rDJrojIQgnwY6ioXO0Dw7tJ52yaZnv25FkUR7CF2mUFh3S7MRpDg3vWa+IM3Nr6w7PoQ/3HG1SUCecIFjTsUW5v53ZkmM8mIOqEMH5qvd0oulMj7PLKCI0gBi1dH1o0nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOeU7+FK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOeU7+FK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772701724; x=1804237724;
  h=date:from:to:cc:subject:message-id;
  bh=IwSYHEIf8OTBQm2ff06A5eB5E+subvCoqbZsHtuFPMY=;
  b=IOeU7+FKNwZBu30BMtOognji7ZY90uQJAxmaTZztryMtPDXtfNsIGaFq
   WP1WAlfLAKo6OqRdY/IpDC5DkGqwvbtieRjmMfeTEvoIbrsAjp5DiG2Uw
   A3neiclIrKNVaHlt6+r0f61yPNkX0z8I77FQ1rBBug+HSpMylBZOoyUPT
   KI7eyozqN4EHz1/DeYlq277ElwD3v74KVT4NNh6vLcUS58rXAVVsrQcYL
   Yt/LCosZbDFmrHBKd/jxWHwPLXYfUly7DXDtHyw8CJiyePvFm0mGdc179
   MYWWUQQNFVFD6+NA2XKLcdm9heUJJeyzMgqnpR0iBNyjTokNIUsqjhM8K
   g==;
X-CSE-ConnectionGUID: QxVbKJRASQ+4x1NMG9fUlg==
X-CSE-MsgGUID: g7LMU88mQH+ZZgPAOiilkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72808364"
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; 
   d="scan'208";a="72808364"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 01:08:43 -0800
X-CSE-ConnectionGUID: m0J3yC0RRaWLY4GCsy9oEw==
X-CSE-MsgGUID: Dv0Rr+1kQkKL3ho3AcEkqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; 
   d="scan'208";a="221515300"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2026 01:08:42 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy4hD-000000000Nq-2OMB;
	Thu, 05 Mar 2026 09:08:39 +0000
Date: Thu, 05 Mar 2026 17:07:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.6.y 683/683]
 security/apparmor/policy.c:116: warning: Function parameter or member 'kref'
 not described in 'aa_pdb_free_kref'
Message-ID: <202603051603.8VyNy0w5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.6.y
head:   682d8e2f892b73c2f574684c8dd6b625361b4c03
commit: 32928c1749e8a0162b168a5bb87c1b67e37281ff [683/683] apparmor: refcount the pdb
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603051603.8VyNy0w5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051603.8VyNy0w5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051603.8VyNy0w5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/policy.c:116: warning: Function parameter or member 'kref' not described in 'aa_pdb_free_kref'
>> security/apparmor/policy.c:116: warning: Excess function parameter 'kr' description in 'aa_pdb_free_kref'
   security/apparmor/policy.c:881: warning: Function parameter or member 'subj_cred' not described in 'aa_may_manage_policy'


vim +116 security/apparmor/policy.c

   110	
   111	/**
   112	 * aa_pdb_free_kref - free aa_policydb by kref (called by aa_put_pdb)
   113	 * @kr: kref callback for freeing of a dfa  (NOT NULL)
   114	 */
   115	void aa_pdb_free_kref(struct kref *kref)
 > 116	{
   117		struct aa_policydb *pdb = container_of(kref, struct aa_policydb, count);
   118	
   119		aa_free_pdb(pdb);
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
