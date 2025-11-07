Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4334C22FDE8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762518926; cv=none; b=LRwc3s+3P6xyByEw8/yiRRX0fHulD/ojLCMbuDIT6rIb/Rhc/RVtUrM/4VXwm0UXb8WBZfN682IwGO4n06fPSY2Dq+wB9oXei1n/9KM0g5Rw3frkMpEerT3uGHhH6ZbhtcT4WAdYpsF23XAHYs6M6jbViwYG2hsJqhKijZO0DZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762518926; c=relaxed/simple;
	bh=pLvyc6ULa1v695GetHGUdiROaStRRQQOXfCptfmJOIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLA0sg2cu+h8NtBvSUKEip2jIRb3k1iF+RQfpridfI2n1Cx8hEQGVneVmMYhbr5ckwmOMUpFYB/v+Wk7EVPM+oq/H+pPXjdz9YnGxtdl4+SXXM3a411z4HI1eurb9FAfKZQ6ecKG7lddIehpxuISAGDuEhps25qsLQRNwhjrUZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMWjt4ko; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMWjt4ko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762518924; x=1794054924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pLvyc6ULa1v695GetHGUdiROaStRRQQOXfCptfmJOIw=;
  b=EMWjt4ko5WXt1cBoqGvGsz+SI+xx5SzCQn61FLEK5NgFIdcI4Fb5utB7
   st97erggfWUeeX8qnpy2QHX7H0P0XMsUebXwMo/5GwyCB9Dj0A6K5fvdb
   vhKwBAby8SFoaeqXGksrb7keal42yT1SyzjIzbi+G9QpJNzkIlO0x6GPM
   8/ZK1AeKhD/cIE2CR7VZjrATm0ft4eXHsy0mE034bK2oqPCaZZfyvTzaD
   RQm6/F2IlAzasZ7tJBqRlrg9WPIxeOBTnhrc4JW55qtzD/RAs2KEr5tPY
   DhONuFkX1C/QlEF9XSL4AtTK4DuWirfBvPOVz9b4QW1RchyECFo819iKm
   Q==;
X-CSE-ConnectionGUID: Ztez7fkeRZuR1iHMhhHMhg==
X-CSE-MsgGUID: uHP2O9dnRgaEslOwKxknjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64366232"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="64366232"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 04:35:23 -0800
X-CSE-ConnectionGUID: S3hEEPnoR2KOgXNSJ0TPYQ==
X-CSE-MsgGUID: HUnYLZnkTjGvJmL3f7Es0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="218682271"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2025 04:35:23 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vHLgW-000000003NG-1J9i;
	Fri, 07 Nov 2025 12:35:20 +0000
Date: Fri, 7 Nov 2025 13:35:01 +0100
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [linux-next:master 6287/7207] kernel/rcu/refscale.c:187:1: error:
 type defaults to 'int' in declaration of 'DEFINE_STATIC_SRCU_FAST'
Message-ID: <202511071343.DLlwkGcN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c0826a5d9aa4d52206dd89976858457a2a8a7ed
commit: 04f65881ec76959989d5218440085bb0a5042b01 [6287/7207] refscale: Exercise DEFINE_STATIC_SRCU_FAST() and init_srcu_struct_fast()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251107/202511071343.DLlwkGcN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511071343.DLlwkGcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071343.DLlwkGcN-lkp@intel.com/

Note: the linux-next/master HEAD 9c0826a5d9aa4d52206dd89976858457a2a8a7ed builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   kernel/rcu/refscale.c:187:1: warning: data definition has no type or storage class
     187 | DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/refscale.c:187:1: error: type defaults to 'int' in declaration of 'DEFINE_STATIC_SRCU_FAST' [-Wimplicit-int]
>> kernel/rcu/refscale.c:187:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   kernel/rcu/refscale.c: In function 'srcu_fast_sync_scale_init':
>> kernel/rcu/refscale.c:222:22: error: 'srcu_fast_refctl_scale' undeclared (first use in this function); did you mean 'srcu_refctl_scale'?
     222 |         srcu_ctlp = &srcu_fast_refctl_scale;
         |                      ^~~~~~~~~~~~~~~~~~~~~~
         |                      srcu_refctl_scale
   kernel/rcu/refscale.c:222:22: note: each undeclared identifier is reported only once for each function it appears in


vim +187 kernel/rcu/refscale.c

   184	
   185	// Definitions for SRCU ref scale testing.
   186	DEFINE_STATIC_SRCU(srcu_refctl_scale);
 > 187	DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
   188	static struct srcu_struct *srcu_ctlp = &srcu_refctl_scale;
   189	
   190	static void srcu_ref_scale_read_section(const int nloops)
   191	{
   192		int i;
   193		int idx;
   194	
   195		for (i = nloops; i >= 0; i--) {
   196			idx = srcu_read_lock(srcu_ctlp);
   197			srcu_read_unlock(srcu_ctlp, idx);
   198		}
   199	}
   200	
   201	static void srcu_ref_scale_delay_section(const int nloops, const int udl, const int ndl)
   202	{
   203		int i;
   204		int idx;
   205	
   206		for (i = nloops; i >= 0; i--) {
   207			idx = srcu_read_lock(srcu_ctlp);
   208			un_delay(udl, ndl);
   209			srcu_read_unlock(srcu_ctlp, idx);
   210		}
   211	}
   212	
   213	static const struct ref_scale_ops srcu_ops = {
   214		.init		= rcu_sync_scale_init,
   215		.readsection	= srcu_ref_scale_read_section,
   216		.delaysection	= srcu_ref_scale_delay_section,
   217		.name		= "srcu"
   218	};
   219	
   220	static bool srcu_fast_sync_scale_init(void)
   221	{
 > 222		srcu_ctlp = &srcu_fast_refctl_scale;
   223		return true;
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
