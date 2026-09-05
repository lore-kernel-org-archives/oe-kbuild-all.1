Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F712E736F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 12:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611201; cv=none; b=ch1kOizFVH2TaQjSJVB2CajmzZruonqZ5vakovs2aVpdGxPkLe6NBxZxnk4WyZvDBnu8FsJY9z9Dhw2/6Lf7gblBQEElL8dBtI8BEJR3FelFsbOraMI5K0fnkNsSoqjKmR/xN2PjyBfE610DunoMbsjqW9uVnHn7dd2gqHlsSN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611201; c=relaxed/simple;
	bh=+r26P7YTAVyyqoFRIoXNSonrfV++UaM6h+GYdOVx29M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=amMkClIFYepW5MFA3pK6fAPNXNDHLgDqto615phFH7YH5gakwWb//Y05Q/ggf9DCJOIyM1SsZ81MuyeFVaajqHjEs7L/UqRliRyIT3SaZLua7P9yQNU4JbznO+2Q7sVxvRZm/RpMzAO9BbDLo1Z4PAeKfZ7Ikl8j48i8Kw2bEL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9vtrSRo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9vtrSRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788611199; x=1820147199;
  h=date:from:to:cc:subject:message-id;
  bh=+r26P7YTAVyyqoFRIoXNSonrfV++UaM6h+GYdOVx29M=;
  b=i9vtrSRo4n0m6QAWDIw5mmJsv2eurHPho655HcAx00L1OwfMhyda5nQc
   AHFcR4Bq+540U/CDFjlr7SyivGCoumFYMVsMvEraImFVaqtOIjzLFDNhr
   TKZ9ZoXdAoO+EwiobiCr90DZ+WqGYDBnYByOqkq4H4ciZraS6MVf+ehZd
   DA6vRitc126kLh3Ngpp3jhnh9ChvNcKQNFfUXFV2a9UHA3rXyGqUIHtlU
   WfJ/L8wBQ+lRVwcYcxISQNb4MAukGRGAGPf81++bvRK6xXiZ99KpAkmos
   Vf69b7cM2pn0f748yLzo2qF8yTE+cu3PCrl5yLAlBQbC9sLTcpvC3UMGT
   Q==;
X-CSE-ConnectionGUID: Q4VItf/0T7aqdWHVjCgFkw==
X-CSE-MsgGUID: Tf3Oc95GTr6JHTGycMKUuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="76649626"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="76649626"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 05:26:39 -0700
X-CSE-ConnectionGUID: XCo5mDr+Sm+ihs6JH0g14g==
X-CSE-MsgGUID: KK7Fvyi/So+AlVESFBOqJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="270259205"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Sep 2026 05:26:37 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2pTe-000000000Tx-2Zkv;
	Sat, 05 Sep 2026 12:26:34 +0000
Date: Sat, 05 Sep 2026 20:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>
Subject: [paulmckrcu:dev 27/42] kernel/rcu/srcutree.c:913
 srcu_gp_start() warn: inconsistent indenting
Message-ID: <202609052019.8XxNMFvN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev
head:   3fe004c1cd8588480a29f9577427cf8a9daa32d1
commit: a6b38e2d5585400c21ee2429683f2ab7ec0e1cf8 [27/42] srcutree: Add an atomic Tree SRCU
config: x86_64-randconfig-161-20260904 (https://download.01.org/0day-ci/archive/20260905/202609052019.8XxNMFvN-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609052019.8XxNMFvN-lkp@intel.com/

smatch warnings:
kernel/rcu/srcutree.c:913 srcu_gp_start() warn: inconsistent indenting
kernel/rcu/srcutree.c:2148 synchronize_srcu_atomic() warn: inconsistent indenting

vim +913 kernel/rcu/srcutree.c

   905	
   906	/*
   907	 * Start an SRCU grace period.
   908	 */
   909	static void srcu_gp_start(struct srcu_struct *ssp)
   910	{
   911		int state;
   912	
 > 913		/*&&&&*/pr_alert("%s() start: ->srcu_gp_seq: %lx ->srcu_gp_seq_needed: %lx\n", __func__, ssp->srcu_sup->srcu_gp_seq, ssp->srcu_sup->srcu_gp_seq_needed);
   914		lockdep_assert_held(&ACCESS_PRIVATE(ssp->srcu_sup, lock));
   915		WARN_ON_ONCE(ULONG_CMP_GE(ssp->srcu_sup->srcu_gp_seq, ssp->srcu_sup->srcu_gp_seq_needed));
   916		WRITE_ONCE(ssp->srcu_sup->srcu_gp_start, jiffies);
   917		WRITE_ONCE(ssp->srcu_sup->srcu_n_exp_nodelay, 0);
   918		smp_mb(); /* Order prior store to ->srcu_gp_seq_needed vs. GP start. */
   919		rcu_seq_start(&ssp->srcu_sup->srcu_gp_seq);
   920		state = rcu_seq_state(ssp->srcu_sup->srcu_gp_seq);
   921		WARN_ON_ONCE(state != SRCU_STATE_SCAN1);
   922	}
   923	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
