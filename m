Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C958A31C59B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 13:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471314; cv=none; b=ivSk963JplzExKGZouASCEPhRG/cTzlvg0JAbcqX94P4BwnraNXnHr21Se5x1DUyl2D2Fjl+caCOTkPmEjJ3QY3NN+5lTBJoH3002IjWeh/gJcm4W6bfyKrYbYV/8YELaSqi24HZG2VaZQOcryzZbcv1HL+2+iYYELMSMheBgWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471314; c=relaxed/simple;
	bh=+sXizUim+YoWWHqe7g/6RkkSsyfSRbNanbqQPKtK4bU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cg5pc7mwH24wHzZ850cdKzxy2b11iPOiZ3imYed7HN1RynQ/J/CMyuR7OB00fP2YdVCDtqEA696jdUNbh+hhwixAcJDYwDKKfsygWA0YX+YLOFMyr5SVmr6lhiEgEOp+KKhHJf7AQaDF+Tac6cFlMgy/tP9drHyyBbDXjm6ya6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQy+Md7y; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQy+Md7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763471311; x=1795007311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+sXizUim+YoWWHqe7g/6RkkSsyfSRbNanbqQPKtK4bU=;
  b=RQy+Md7yvirhohWoMu3UW4L4iBxB2Xm6kNeBVXFP0SknmB6bNsp/P5bt
   hlpD9QYHMULstLy/EByGUuuiDc8xiYrswIYoEYHhaIevkNVqQ3vP07JFe
   pFKlLRtZXgheYp/JSZ6f1M6Uai9OdyzYSIoCuzWzApIrweQ+1eKodzEwG
   K3Yd0tXCIPwvjA8cUi9y/paSGD+lNuEzVLwm334Tqy0+fRyaUXextJK6e
   XLbUoS59m6/7jcbFnqqL3+NIWFDmRug3QgF/fFaSReC8HPoHeqD3y5Mh6
   FNAmjhyHxzv19JIumA8JotwnNLHV6cr3x5zgMkjCF60thUpFo63Cieyi0
   g==;
X-CSE-ConnectionGUID: ecSy6fMuTGSLkEsCs7RE0w==
X-CSE-MsgGUID: YZlkHOt2R+SnqkuT0wB39w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69361078"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="69361078"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 05:08:31 -0800
X-CSE-ConnectionGUID: +9KaQE2iT7iG+DjyBEmQCQ==
X-CSE-MsgGUID: z0iAsBu1RQSiBvga1Yy6RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221412554"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2025 05:08:29 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLLRb-0001kV-1x;
	Tue, 18 Nov 2025 13:08:27 +0000
Date: Tue, 18 Nov 2025 21:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3214/3214] block/blk-ioinf.c:233:6: warning: no
 previous prototype for 'ioinf_done'
Message-ID: <202511182153.2rP8BCJI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   09c1ca7bc68f566c176a3647d87ed91e455d90f3
commit: a63e78514d119d4ee6525e1cc3a0aca4a2b29cbd [3214/3214] blk-ioinf: introduce inflight-based IO QoS controller
config: x86_64-randconfig-r111-20251118 (https://download.01.org/0day-ci/archive/20251118/202511182153.2rP8BCJI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511182153.2rP8BCJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511182153.2rP8BCJI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-ioinf.c:233:6: warning: no previous prototype for 'ioinf_done' [-Wmissing-prototypes]
     233 | void ioinf_done(struct ioinf *inf, struct ioinf_rq_wait *rqw)
         |      ^~~~~~~~~~
>> block/blk-ioinf.c:461:5: warning: no previous prototype for 'ioinf_calc_budget' [-Wmissing-prototypes]
     461 | u32 ioinf_calc_budget(struct ioinf_rq_wait *rqw)
         |     ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/ioinf_done +233 block/blk-ioinf.c

   232	
 > 233	void ioinf_done(struct ioinf *inf, struct ioinf_rq_wait *rqw)
   234	{
   235		int inflight;
   236	
   237		if (!inf->params.enabled)
   238			return;
   239	
   240		inflight = atomic_dec_return(&rqw->inflight);
   241		if (inflight >= (int)rqw->hinflight)
   242			return;
   243	
   244		if (!READ_ONCE(inf->waking) && atomic_read(&rqw->sleepers)) {
   245			WRITE_ONCE(inf->waking, true);
   246			hrtimer_start(&inf->wakeup_timer, 0, HRTIMER_MODE_REL);
   247		}
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
