Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176D2FE0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N11sq64s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697741726; x=1729277726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=muoQl/lN6lC1+v3SwrbfIr4axdlSLi28WAN6YQlY0e0=;
  b=N11sq64sDeduY52D3jgWrTciapm5SiJxy1mz9/ACRNIkk8HGsHOoBH/2
   ROL3HuAFtMo/AXH561K17v+Wro1KZ2iqDEEx/ze1p6ZuUSZyIeejhUl24
   26qbMfwtjG2uiYJINW1qP9bw4VS+SxWmDl171wJtchaN9dhwLp45kPkrI
   ON+0PxHNm9SPOsKzZoOm8g+dUfcIqKtCmfPh9V5BTsnKrM5Is/MgFmKEY
   Igud2bF53GLcFsAHb3zxlPnH9p6vzIj+t9ljORMgy34Dt3O+wU6uiwiBp
   lPwOvdqYzoIxDJHclLQYqb+BHj9YOHS96PGuJyJSostS6JBU35mS4pMeo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="4940396"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="4940396"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 11:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733683346"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="733683346"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Oct 2023 11:55:24 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtYAz-0002TC-2V;
	Thu, 19 Oct 2023 18:55:21 +0000
Date: Fri, 20 Oct 2023 02:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Georgia Garcia <georgia.garcia@canonical.com>
Subject: [jj-apparmor:apparmor-next 29/35] security/apparmor/policy.c:116:
 warning: Function parameter or member 'kref' not described in
 'aa_pdb_free_kref'
Message-ID: <202310200247.hu6ZWZo5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   157a3537d6bc28ceb9a11fc8cb67f2152d860146
commit: 98b824ff8984fd523fc264fbb13208098ab09da3 [29/35] apparmor: refcount the pdb
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200247.hu6ZWZo5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200247.hu6ZWZo5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200247.hu6ZWZo5-lkp@intel.com/

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
