Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD112BE65B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763224346; cv=none; b=UGPE6c+JSXuYHV32XgIfcOuj5oHqR2/nS2w3UVakQQc9q8m7pGPH3e4FiYnvk3nU4YJlI9aCSausRpeisULPmfhPa455zVYctYQwdpQwxnisVojoEsvlf5c0cPrUy5u2cdYOg4QU1YFL1sSFvm+ODw+OypL1Gf3sgAqeZK8RHsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763224346; c=relaxed/simple;
	bh=6KDweEmqFB8B+Yat65BmDhOoQcWLPS7SLWSksDqctXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0qfBCT5xSeJXPTzPfJiEYIcYHakahdGkVuQxQotrsac2iWa33hwtyWTnRQGUmMNQQdTmqGhPfL6MmNx926wIIPAfzXDeU/sUzS4E0++7g7z2khlWJm1nOb/dro/o2B8lgdNn4oR+j7xLSHCyOCkC9F8sqlATrAvKPwKT5DAiyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InPXGmcY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InPXGmcY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763224345; x=1794760345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6KDweEmqFB8B+Yat65BmDhOoQcWLPS7SLWSksDqctXk=;
  b=InPXGmcY0okpJv2ErURyWKLkGtF/+TspT3yvLk4NZG3El/xM+61x3RS1
   yXwrU1T1OLkGoIqlUQrHODzJ05whMQE4QXn8imzzWz2VKLaf4/AVmfrnm
   ROu6OWQqzkp2tpBT2XPbYe3bRPU9k6USq7d7w8Iu4LyVehrHGYGu+c/p1
   sV/3cnltLR47W/CB1qPevDgV1Tr20ePIu+Q8TQHfowtNat2iPEDnOlP8+
   7O0F4mdDXdU94J4MiIULMLvoA58zy5Cjahv6JullgfiGx+q6xtihQR4yD
   imEiAn2iveHVLzOGqGs0FVJQZbcJZPOZgipvohE54llyeJ6juCfmnB3K3
   A==;
X-CSE-ConnectionGUID: uMVKoVSlT46v6nAuKGJ3Ug==
X-CSE-MsgGUID: Gsx0X2kARn+XGyhClE8vGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="68914314"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="68914314"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 08:32:25 -0800
X-CSE-ConnectionGUID: 1PmpnifIQmCkZI0NO5A52Q==
X-CSE-MsgGUID: 935XoSFlRJiEdF0IxYmu7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="220714327"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Nov 2025 08:32:23 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKJCG-000863-2L;
	Sat, 15 Nov 2025 16:32:20 +0000
Date: Sun, 16 Nov 2025 00:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3195/3195] block/blk-ioinf.c:233:6: warning: no
 previous prototype for function 'ioinf_done'
Message-ID: <202511160039.06UP1LhU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3abd440f300fe9312974a2d65499ca4ff872363a
commit: a63e78514d119d4ee6525e1cc3a0aca4a2b29cbd [3195/3195] blk-ioinf: introduce inflight-based IO QoS controller
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251116/202511160039.06UP1LhU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160039.06UP1LhU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511160039.06UP1LhU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-ioinf.c:233:6: warning: no previous prototype for function 'ioinf_done' [-Wmissing-prototypes]
     233 | void ioinf_done(struct ioinf *inf, struct ioinf_rq_wait *rqw)
         |      ^
   block/blk-ioinf.c:233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     233 | void ioinf_done(struct ioinf *inf, struct ioinf_rq_wait *rqw)
         | ^
         | static 
>> block/blk-ioinf.c:461:5: warning: no previous prototype for function 'ioinf_calc_budget' [-Wmissing-prototypes]
     461 | u32 ioinf_calc_budget(struct ioinf_rq_wait *rqw)
         |     ^
   block/blk-ioinf.c:461:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     461 | u32 ioinf_calc_budget(struct ioinf_rq_wait *rqw)
         | ^
         | static 
   2 warnings generated.


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
