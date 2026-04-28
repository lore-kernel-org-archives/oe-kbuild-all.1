Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE3A2C15AC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 07:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362340; cv=none; b=F0RMgBrJezfMI/4H2mybEA1pF4JKERvoKGGRiwLttGlVZ94L6w29QjIVPHxraSw0aifnc5rR5gzgeFehsPHA4GlkHomb02AKXX4uJc9PL6FmNaKaKU08BKaZ+9H8BrriMr91qe16i97r1YRRwQojFhKYzr1mxK8s+Ed2ba51e9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362340; c=relaxed/simple;
	bh=DGWkBh66PQZ1fPaAfryHdtcQRLA889JB+5/QW7P3k84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5RjbMVTjxRQ5wMk3E838D0jCnL4kxN8tNroZn54L3LMgXEu0gr5lQdleXcB/P9LIEo67rTbp+5gyB+eXVWvFfADu005aIuMpUuZE9CtjvI8VR9jwp/I9uu8HzRpTmFgZfZtAdB4H5GMRhgRE+UQlT/nBdpoWINk9L9uFAwHWds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWQ49R1A; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWQ49R1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777362339; x=1808898339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DGWkBh66PQZ1fPaAfryHdtcQRLA889JB+5/QW7P3k84=;
  b=CWQ49R1Ay6tTLFAh37Qem2sR0bpoKCUSm9Yg4VCjfpR3ABv4/8dMiEgS
   Y5Gwax7e7+1Jv0w/JszJg6boPTcqnWYUnm5MlnSGjBzshxSaYS1envH57
   2T/GnTC5YunKTQLE5cvq2vgRMdjI6c+qOffOk3b3FJDzCIgrWklRyrpDZ
   PAZ1Ll5ELhPMyByPbOG4Yb/fUQ9GcrLJuB4y+vr96Q5Av10uH0igJ5tWy
   GQj6+HG19hJmTJrOw2J4cl3XBxwjBSJLX5Zh2WknAAF+BYpDrK0iarsfO
   q3Hkuy2mzmL47wHuOKwFccZm/6Sr77zQIW/ZumLqsuHJodt2ALjTHNtAt
   w==;
X-CSE-ConnectionGUID: qaLws/osQMumQF/DOMStsw==
X-CSE-MsgGUID: NfIon85BRN2a9bDseOTr6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78455128"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78455128"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 00:45:38 -0700
X-CSE-ConnectionGUID: vtbRBdWASy+6i0A6iWIP/w==
X-CSE-MsgGUID: j8IDDywPR/KcwmzKyzegrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="238904536"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Apr 2026 00:45:38 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHd8Q-000000009cW-3nTh;
	Tue, 28 Apr 2026 07:45:34 +0000
Date: Tue, 28 Apr 2026 15:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] rhashtable: Bounce deferred worker kick through
 irq_work when insecure_elasticity is set
Message-ID: <202604281553.zt7WUfFH-lkp@intel.com>
References: <67fedbf2-914b-44f7-9422-1fe97d833705@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67fedbf2-914b-44f7-9422-1fe97d833705@kernel.org>

Hi Tejun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v7.0]
[also build test ERROR on linus/master]
[cannot apply to tj-sched-ext/for-7.1-fixes next-20260427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tejun-Heo/rhashtable-Bounce-deferred-worker-kick-through-irq_work-when-insecure_elasticity-is-set/20260426-103416
base:   v7.0
patch link:    https://lore.kernel.org/r/67fedbf2-914b-44f7-9422-1fe97d833705%40kernel.org
patch subject: [RFC PATCH] rhashtable: Bounce deferred worker kick through irq_work when insecure_elasticity is set
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260428/202604281553.zt7WUfFH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604281553.zt7WUfFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604281553.zt7WUfFH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/rhashtable.c:25:
   include/linux/rhashtable.h: In function 'rhashtable_kick_deferred_worker':
>> include/linux/rhashtable.h:768:18: error: 'struct rhashtable_params' has no member named 'insecure_elasticity'
     768 |         if (ht->p.insecure_elasticity)
         |                  ^
   lib/rhashtable.c: In function 'rhashtable_init_noprof':
>> lib/rhashtable.c:1095:18: error: 'struct rhashtable_params' has no member named 'insecure_elasticity'
    1095 |         if (ht->p.insecure_elasticity)
         |                  ^
   lib/rhashtable.c: In function 'rhashtable_free_and_destroy':
   lib/rhashtable.c:1162:18: error: 'struct rhashtable_params' has no member named 'insecure_elasticity'
    1162 |         if (ht->p.insecure_elasticity)
         |                  ^
--
   In file included from lib/test_rhashtable.c:20:
   include/linux/rhashtable.h: In function 'rhashtable_kick_deferred_worker':
>> include/linux/rhashtable.h:768:18: error: 'struct rhashtable_params' has no member named 'insecure_elasticity'
     768 |         if (ht->p.insecure_elasticity)
         |                  ^


vim +768 include/linux/rhashtable.h

   757	
   758	/*
   759	 * Kick the deferred rehash worker. With insecure_elasticity the caller may
   760	 * hold a raw spinlock. schedule_work() under a raw spinlock records
   761	 * caller_lock -> pool->lock -> pi_lock -> rq->__lock. If any of these
   762	 * locks is acquired in the reverse direction elsewhere, the cycle closes.
   763	 * Bounce through irq_work so schedule_work() runs from hard IRQ context
   764	 * with the caller's lock no longer held.
   765	 */
   766	static void rhashtable_kick_deferred_worker(struct rhashtable *ht)
   767	{
 > 768		if (ht->p.insecure_elasticity)
   769			irq_work_queue(&ht->run_irq_work);
   770		else
   771			schedule_work(&ht->run_work);
   772	}
   773	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
