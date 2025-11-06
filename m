Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B0F1DA0E1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 05:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762407549; cv=none; b=CfLBDg14nlUOeIKOcA+76M22L0If3evfODOasSr9JvGPvwIk3/aGswUWB8yKbJ1c/knTcC9JFlSJa233+9wjCpBzXS9d77ri1gvM6ZagKfZ2ik00CxjnhdXgjzF2q6CsQu4jk1uxedVrlDh9nk+IJNcpDjJjyyGiFtNSYAYPyow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762407549; c=relaxed/simple;
	bh=xUSFkh2nUnulgrcqG/MVCMfIC6YNeiExkbVWXYGEldc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EedtspnrcNEJmLRNsZ4ogy81PoFYLI3Mh6lN/1rCh1MoL94RQH0R+UpD+airvRUZVm/KAXh64SfdwO/lxynI7U7uW2DIMK+vOCcZLUeIOoFqfeLNtw0THaG487n2/cWQxbKmhP+nt7qiL1KOgxNL9sbCs3rO2w31K6vMEzvpAIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ugvww/af; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ugvww/af"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762407548; x=1793943548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUSFkh2nUnulgrcqG/MVCMfIC6YNeiExkbVWXYGEldc=;
  b=Ugvww/afgmgTK4QDV+dpsZhXi7AiCU36iOOnnPH7eKhudKmJXyPygOtW
   0IHVdgazjXSE4KC0DbAiT0Wc51/aVoaFDXGYRcMP86R7+tGzX7+ML0PT4
   qedcBP4CP50p9s1NYwL29qszK5eC8n/bJ7X+xcu4Oyp8ZANhkeRiYRQa5
   DWi3rjMyH2NieoqAfWluL6dvO7ZJGLkE5kdKPpFrjeZs0hwBkYzJHvfa2
   inxL4LZ2nCkNSjWpNTDeZbQ4ToA0YxiLUF02MY9lak5fhjNw7VG2X6cpp
   jtpar3s8Vojktk90kNjvUUg5hPGdJuP0i3imMvKT3mJIjmINrlHKaZe6/
   w==;
X-CSE-ConnectionGUID: JJpwM3B3RzuwDNWAC05bXg==
X-CSE-MsgGUID: lVwsUwMiTceMGBBOt1DCcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="68395534"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="68395534"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 21:39:07 -0800
X-CSE-ConnectionGUID: gRp2rJssR5GT4TVf3MoSAw==
X-CSE-MsgGUID: daGnPbevS8aq5XGvp2I/bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="187377834"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2025 21:39:06 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGsi3-000TWm-0i;
	Thu, 06 Nov 2025 05:39:00 +0000
Date: Thu, 6 Nov 2025 13:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [rcu:rcu/refscale 8/8] kernel/rcu/refscale.c:189:1: error: type
 defaults to 'int' in declaration of 'DEFINE_STATIC_SRCU_FAST_UPDOWN'
Message-ID: <202511061355.ciNv7SrV-lkp@intel.com>
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
commit: 0c990a8562a127b71e72eec4b9b92ba0f602510c [8/8] refscale: Add SRCU-fast-updown readers
config: s390-randconfig-002-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061355.ciNv7SrV-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061355.ciNv7SrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061355.ciNv7SrV-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/refscale.c:188:1: warning: data definition has no type or storage class
     188 | DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
         | ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/refscale.c:188:1: error: type defaults to 'int' in declaration of 'DEFINE_STATIC_SRCU_FAST' [-Wimplicit-int]
   kernel/rcu/refscale.c:188:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   kernel/rcu/refscale.c:189:1: warning: data definition has no type or storage class
     189 | DEFINE_STATIC_SRCU_FAST_UPDOWN(srcu_fast_updown_refctl_scale);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/refscale.c:189:1: error: type defaults to 'int' in declaration of 'DEFINE_STATIC_SRCU_FAST_UPDOWN' [-Wimplicit-int]
   kernel/rcu/refscale.c:189:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   kernel/rcu/refscale.c: In function 'srcu_fast_sync_scale_init':
   kernel/rcu/refscale.c:224:22: error: 'srcu_fast_refctl_scale' undeclared (first use in this function); did you mean 'srcu_refctl_scale'?
     224 |         srcu_ctlp = &srcu_fast_refctl_scale;
         |                      ^~~~~~~~~~~~~~~~~~~~~~
         |                      srcu_refctl_scale
   kernel/rcu/refscale.c:224:22: note: each undeclared identifier is reported only once for each function it appears in
   kernel/rcu/refscale.c: In function 'srcu_fast_updown_sync_scale_init':
>> kernel/rcu/refscale.c:260:22: error: 'srcu_fast_updown_refctl_scale' undeclared (first use in this function); did you mean 'srcu_fast_updown_sync_scale_init'?
     260 |         srcu_ctlp = &srcu_fast_updown_refctl_scale;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      srcu_fast_updown_sync_scale_init
   kernel/rcu/refscale.c: In function 'srcu_fast_updown_ref_scale_read_section':
>> kernel/rcu/refscale.c:270:23: error: implicit declaration of function 'srcu_read_lock_fast_updown'; did you mean 'srcu_read_lock_fast_notrace'? [-Wimplicit-function-declaration]
     270 |                 scp = srcu_read_lock_fast_updown(srcu_ctlp);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       srcu_read_lock_fast_notrace
>> kernel/rcu/refscale.c:270:21: error: assignment to 'struct srcu_ctr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     270 |                 scp = srcu_read_lock_fast_updown(srcu_ctlp);
         |                     ^
>> kernel/rcu/refscale.c:271:17: error: implicit declaration of function 'srcu_read_unlock_fast_updown'; did you mean 'srcu_read_unlock_fast_notrace'? [-Wimplicit-function-declaration]
     271 |                 srcu_read_unlock_fast_updown(srcu_ctlp, scp);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 srcu_read_unlock_fast_notrace
   kernel/rcu/refscale.c: In function 'srcu_fast_updown_ref_scale_delay_section':
   kernel/rcu/refscale.c:281:21: error: assignment to 'struct srcu_ctr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     281 |                 scp = srcu_read_lock_fast_updown(srcu_ctlp);
         |                     ^


vim +189 kernel/rcu/refscale.c

   185	
   186	// Definitions for SRCU ref scale testing.
   187	DEFINE_STATIC_SRCU(srcu_refctl_scale);
   188	DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
 > 189	DEFINE_STATIC_SRCU_FAST_UPDOWN(srcu_fast_updown_refctl_scale);
   190	static struct srcu_struct *srcu_ctlp = &srcu_refctl_scale;
   191	
   192	static void srcu_ref_scale_read_section(const int nloops)
   193	{
   194		int i;
   195		int idx;
   196	
   197		for (i = nloops; i >= 0; i--) {
   198			idx = srcu_read_lock(srcu_ctlp);
   199			srcu_read_unlock(srcu_ctlp, idx);
   200		}
   201	}
   202	
   203	static void srcu_ref_scale_delay_section(const int nloops, const int udl, const int ndl)
   204	{
   205		int i;
   206		int idx;
   207	
   208		for (i = nloops; i >= 0; i--) {
   209			idx = srcu_read_lock(srcu_ctlp);
   210			un_delay(udl, ndl);
   211			srcu_read_unlock(srcu_ctlp, idx);
   212		}
   213	}
   214	
   215	static const struct ref_scale_ops srcu_ops = {
   216		.init		= rcu_sync_scale_init,
   217		.readsection	= srcu_ref_scale_read_section,
   218		.delaysection	= srcu_ref_scale_delay_section,
   219		.name		= "srcu"
   220	};
   221	
   222	static bool srcu_fast_sync_scale_init(void)
   223	{
   224		srcu_ctlp = &srcu_fast_refctl_scale;
   225		return true;
   226	}
   227	
   228	static void srcu_fast_ref_scale_read_section(const int nloops)
   229	{
   230		int i;
   231		struct srcu_ctr __percpu *scp;
   232	
   233		for (i = nloops; i >= 0; i--) {
   234			scp = srcu_read_lock_fast(srcu_ctlp);
   235			srcu_read_unlock_fast(srcu_ctlp, scp);
   236		}
   237	}
   238	
   239	static void srcu_fast_ref_scale_delay_section(const int nloops, const int udl, const int ndl)
   240	{
   241		int i;
   242		struct srcu_ctr __percpu *scp;
   243	
   244		for (i = nloops; i >= 0; i--) {
   245			scp = srcu_read_lock_fast(srcu_ctlp);
   246			un_delay(udl, ndl);
   247			srcu_read_unlock_fast(srcu_ctlp, scp);
   248		}
   249	}
   250	
   251	static const struct ref_scale_ops srcu_fast_ops = {
   252		.init		= srcu_fast_sync_scale_init,
   253		.readsection	= srcu_fast_ref_scale_read_section,
   254		.delaysection	= srcu_fast_ref_scale_delay_section,
   255		.name		= "srcu-fast"
   256	};
   257	
   258	static bool srcu_fast_updown_sync_scale_init(void)
   259	{
 > 260		srcu_ctlp = &srcu_fast_updown_refctl_scale;
   261		return true;
   262	}
   263	
   264	static void srcu_fast_updown_ref_scale_read_section(const int nloops)
   265	{
   266		int i;
   267		struct srcu_ctr __percpu *scp;
   268	
   269		for (i = nloops; i >= 0; i--) {
 > 270			scp = srcu_read_lock_fast_updown(srcu_ctlp);
 > 271			srcu_read_unlock_fast_updown(srcu_ctlp, scp);
   272		}
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
