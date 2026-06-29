Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C68370D5F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782756976; cv=none; b=eK7lIrBRPEZalpBET5NGIO3xy6w25uTD10gfRLpgMjG0BLnf/vDog3f0j1rKF/V9333c14mwKZuqaO0TRbOBGo2K7BmNnoTG2eKwcd8BgGDWOhOzG1KNqBDolNHEszt7RsBiYDsp6NiBE1G9vr0zFF9JeYzvqC1ANP+N/3KNGQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782756976; c=relaxed/simple;
	bh=2X9fNHvlbAchTTuFCFyiZD2OTf4bQOEO3S+tgJCvwo0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZU5SEbfbQ3LScmXPqKSAzfXBgNyGCw4+SIVhWbwO0sERq1I2O8+un+PYXsUi7XmsLHRI+VDfO4NfRGdvLjxXORf3uGfDIdWF3YMD/GpWaYjZoFUQMci4t3KFuqy8HdQIjMKazJXbY/eYRn8Az8+NQqkNyOkdB87+v8hNlwo2lOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOdQWhv+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOdQWhv+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782756975; x=1814292975;
  h=date:from:to:cc:subject:message-id;
  bh=2X9fNHvlbAchTTuFCFyiZD2OTf4bQOEO3S+tgJCvwo0=;
  b=LOdQWhv+UrLr0NM3AyNbsizHL7o+Kgiz1ouNt2gIhnmeuIuMbnP5rNEF
   6J+zzKyllx5pMXPSsnFde6FEfgi+s7fBwAwsExU9g+78S4bZ642iRbcNr
   9Jk3aG3wL1/oSnf8einpwkchI9hzwVtgsNhHJklYQsbXlL9G3wa+dVdwt
   Iil4ewNO4hj5UhwbNNHk4Mab0ohwPqnd3xONnep3o+q3MEZSm5ldGm+75
   LYerQ2rvKySOKjkXmdLcZy6Ekj8y1izI5BQic6JW90bsg/sin16U2WMiG
   bc6t0RAdnZ26Z0orXZL+Vny9AKBILzDzD/dGOLWndD8y7+H03q9/YUfao
   Q==;
X-CSE-ConnectionGUID: S6doUSrOR7S4KzGljzR3Gg==
X-CSE-MsgGUID: 6uzeF95AS5mhEWJyYUENqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106256633"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="106256633"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 11:15:58 -0700
X-CSE-ConnectionGUID: F2O7Ac+9RXmNhz6yOqmrxg==
X-CSE-MsgGUID: 5tVLX2jKSma/3cVpfbMe6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="251629116"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Jun 2026 11:15:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weGWP-000000007e1-310R;
	Mon, 29 Jun 2026 18:15:53 +0000
Date: Tue, 30 Jun 2026 02:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 223/332]
 fs/bcachefs/data/reconcile/trigger.c:27:5-8: Unneeded variable: "ret". Return
 "0" on line 42
Message-ID: <202606300207.Uc8YEeYC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: de374d7b7296203619ba70f976867051cebaf41b [223/332] bcachefs: Break up reconcile.c
config: arc-randconfig-r061-20260629 (https://download.01.org/0day-ci/archive/20260630/202606300207.Uc8YEeYC-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300207.Uc8YEeYC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/reconcile/trigger.c:27:5-8: Unneeded variable: "ret". Return "0" on line 42
--
>> fs/bcachefs/data/reconcile/work.c:207:21-22: Unneeded semicolon

vim +27 fs/bcachefs/data/reconcile/trigger.c

    21	
    22	int bch2_extent_reconcile_validate(struct bch_fs *c,
    23					   struct bkey_s_c k,
    24					   struct bkey_validate_context from,
    25					   const struct bch_extent_reconcile *r)
    26	{
  > 27		int ret = 0;
    28	
    29		bkey_fsck_err_on(r->pending && !r->need_rb,
    30				 c, extent_reconcile_bad_pending,
    31				 "pending incorrectly set");
    32	
    33		bkey_fsck_err_on(r->hipri && !(r->need_rb & BIT(BCH_REBALANCE_data_replicas)),
    34				 c, extent_reconcile_bad_hipri,
    35				 "hipri incorrectly set");
    36	
    37		bkey_fsck_err_on(!r->data_replicas,
    38				 c, extent_reconcile_bad_replicas,
    39				 "bad replicas");
    40	
    41	fsck_err:
  > 42		return ret;
    43	}
    44	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
