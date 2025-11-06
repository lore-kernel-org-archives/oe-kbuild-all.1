Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D8175BF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 04:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762404426; cv=none; b=ZWN9EDay2PFDez/1vReaCcyK1vk9jEmPKRkRZWpw8wVDuVYSW+iS0JbGaVZD0kftjcIMk4LRzmKtBfpXcSgYA6vCwOya3Gpp0PJbmi076Vu5odor1mATHGi7x3YnHTGXtw2nSC8I6G0S2TmGsamB6DTF4RIO/Cbs12mvo/B+VGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762404426; c=relaxed/simple;
	bh=PF678wk3avxtfa1CbZzYfj3hMvcCnmL1c85cHqXEKYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sThy3o4qsIqpyD4dgtu6DnqmzB9QFUyAPYKWhYXH5yZP7sfSG87j8ghMSLvxtzfUt9WAChFlqGtmP5VyLLX2WJ86ErkZ50oh5JMHn221KcutJyJniskUI064qfC6AYdjGfJdRXLbkJEDq7iKNyLQXseUC4OLUsv8GgSR0X/puus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XH7qEy8N; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XH7qEy8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762404425; x=1793940425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PF678wk3avxtfa1CbZzYfj3hMvcCnmL1c85cHqXEKYU=;
  b=XH7qEy8NHPcS1Rj7eZhDlYJIk51A1Lu9NitJCVCgg6EySK+Jirey1DL/
   kLqFS2byiEQ6beNUB6WcJadXQg7Q6FqXACL1zgn0HSLif0Qqz0FC61Gbw
   z6b0Pca0CTRQUsxuBE3MG+c1GYNxk1fMNIjEIixkkuPUCGUuqaHJekuTn
   jkKIu0yWkWbCxbZWEBH6KHGK5lMb/Q60RgjQ/5IhDZ/gYGdDEC+ghVmvZ
   5iAhXvAx+B+CUDB9vJEDQ7iCwHHz8uMUf7XP9EKqhXHBtEuXBOe3IoNZ5
   E44uLm33Lvptv3RxV3BsUbFRE38dnskRw+nlvsufbfrxII2t14IJtq8Kd
   Q==;
X-CSE-ConnectionGUID: nz/Tm/JLTEiUAtME2MuHrg==
X-CSE-MsgGUID: TRhfWiMNSfiAm9JG4kwVCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75884184"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="75884184"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 20:47:04 -0800
X-CSE-ConnectionGUID: sZgcCfu4R9Sn0yFCHAs7Xw==
X-CSE-MsgGUID: s1dQxjN4QFWVtyFqvekOPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="211120354"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2025 20:47:02 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGrti-000TUx-3A;
	Thu, 06 Nov 2025 04:46:59 +0000
Date: Thu, 6 Nov 2025 12:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [rcu:rcu/refscale 1/8] kernel/rcu/refscale.c:187:1: error: type
 defaults to 'int' in declaration of 'DEFINE_STATIC_SRCU_FAST'
Message-ID: <202511061200.W2WJavwd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/refscale
head:   0c990a8562a127b71e72eec4b9b92ba0f602510c
commit: 04f65881ec76959989d5218440085bb0a5042b01 [1/8] refscale: Exercise DEFINE_STATIC_SRCU_FAST() and init_srcu_struct_fast()
config: s390-randconfig-002-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061200.W2WJavwd-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061200.W2WJavwd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061200.W2WJavwd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/rcu/refscale.c:187:1: warning: data definition has no type or storage class
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
