Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE3328B77
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525588; cv=none; b=O+Gq02/xTeOJDbs9QYOizH9j+Q3/rrPVXydo8eS3a8KgOS4K1aygB7NAIwabMnAq6UP/PT4Wst8ZGLUL85q/piQmlgayZjY46kk7FKVmT4tjuZdy+U03ACGiqkv7/2cHz5No4Jo9ClCGJWx6u+SqAD3Ct5E/Z6ckMvoJEYOllgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525588; c=relaxed/simple;
	bh=dUa9o26Vs8kLdXFsrboXh9yf/RNDjaNv6+Y9qBSypoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bz1keu1zPuyTZS6d+CA2L5YD9LtpBkEBwDxIPsDzo03nLUPWgbdjmdCvxXR7nnMUvp3LIQR1t9hBpOqKrM6rcx5ZTWa9ljsmLo1Hz0jQ91nFtOJFGZlylSQLjffaQl7PqbA+OZ2y62bcDjt+epOmKVW7cgFaAgSOhzQ/oyOXGVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjQ9HZKU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjQ9HZKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762525587; x=1794061587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dUa9o26Vs8kLdXFsrboXh9yf/RNDjaNv6+Y9qBSypoc=;
  b=CjQ9HZKUdSHw8qXiLNdM+MPdKOSIB0I4ngYHkTjOzX3mvB1+2m5gn9eF
   bBQL3mhy7v2MiGb0UfEDuVeu8AGrY2xSwWaJ+J2duPlAwgkfylDOqV6XH
   FgCI1oq6ZzHlqO++FhJ4ZFqN/pxi5zJebZ6kJ50Wkkc+3hWC3R7gTXMYw
   l3h8XDSEUY8dDXOW+mFKvYpO6TyGi3qRG5EdNHMezifllPWIywxtw1J4j
   JP9WnKsF+lBy59zFkTMUb8D3nog9M91TLrTEECYFWWaWej1JodKYgele/
   PMTzWoBoYaq3VdSZ7tSeZDg+850GAwBfX6ph2FFFCbuK0ncoeU2K4f6rY
   w==;
X-CSE-ConnectionGUID: vwElchVpQZSsN8s8/0wjgQ==
X-CSE-MsgGUID: QFeSm05fR4qFFEl6YVzjqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75284310"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="75284310"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 06:26:26 -0800
X-CSE-ConnectionGUID: yh1WfbAFQU+VmX1GGxwQCQ==
X-CSE-MsgGUID: Mkh8SQQUR/OhmkQ4gK6FRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="218791870"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 07 Nov 2025 06:26:24 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vHNPy-000000003QS-2vvX;
	Fri, 07 Nov 2025 14:26:22 +0000
Date: Fri, 7 Nov 2025 15:25:54 +0100
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [linux-next:master 6294/7207] kernel/rcu/refscale.c:189:1: error:
 type defaults to 'int' in declaration of 'DEFINE_STATIC_SRCU_FAST_UPDOWN'
Message-ID: <202511071535.60uarkvF-lkp@intel.com>
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
commit: 0c990a8562a127b71e72eec4b9b92ba0f602510c [6294/7207] refscale: Add SRCU-fast-updown readers
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251107/202511071535.60uarkvF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511071535.60uarkvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071535.60uarkvF-lkp@intel.com/

Note: the linux-next/master HEAD 9c0826a5d9aa4d52206dd89976858457a2a8a7ed builds fine.
      It may have been fixed somewhere.

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
>> kernel/rcu/refscale.c:270:21: error: assignment to '__seg_gs struct srcu_ctr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     270 |                 scp = srcu_read_lock_fast_updown(srcu_ctlp);
         |                     ^
>> kernel/rcu/refscale.c:271:17: error: implicit declaration of function 'srcu_read_unlock_fast_updown'; did you mean 'srcu_read_unlock_fast_notrace'? [-Wimplicit-function-declaration]
     271 |                 srcu_read_unlock_fast_updown(srcu_ctlp, scp);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 srcu_read_unlock_fast_notrace
   kernel/rcu/refscale.c: In function 'srcu_fast_updown_ref_scale_delay_section':
   kernel/rcu/refscale.c:281:21: error: assignment to '__seg_gs struct srcu_ctr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
