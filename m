Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0CE30DED1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 05:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786857439; cv=none; b=st9e4WRnvjD9HWxuiybBwCZEuQhxkjzQ7RgUxd2j/JcR8OfS4HD9Utt/CQr8Im6PfyDdwvdD7pY/CMYp2GIYpcFcIkt+CYY6/aE/zb8tVnJK2SvIv9mmMoqJ19P0ngW9ZzjS/6PIP84wrDCPvCn+Qylva1QpvvZIwhPPkJlTVIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786857439; c=relaxed/simple;
	bh=mdYGd1UxScaAFy6cTbeTcGaDcvwFtTZdhjC3b16zUpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AW5AmbMooitwsJza7V/dH/H/Nx3tSCIMQZqMUqddW7Zvzju/XGXFf36pzbRURNWMLk4qi/uiRFuJj3Wtmi5z+QfTw3OJUZu1bBVNm9h5/eRkwRgpxQUanULgqgZVEdBbKcJSO5XovV68wmg1Ysk5CXxzbNPNLNHRVlpRhZ/nALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sn4JwwNy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sn4JwwNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786857438; x=1818393438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mdYGd1UxScaAFy6cTbeTcGaDcvwFtTZdhjC3b16zUpY=;
  b=Sn4JwwNy81qNLx/JUfmyGov/Wo5gDSLVlK2mpyzCVUZ6T3gT/o4Mshxq
   6GGF61LiQIuJcCMwOIVdFspx8//2q7ycloSiNCi11gLfETPjm4bZx+awj
   w3B7X8wbzYJ+yEPxFaVIlBX2eDpK2TsoB3iqOdnIlrHY8AqmfV6Wf6Xna
   ZLVzN7ozrNcSevG3XWSsLGZ4t0achEj3e7qnM76/RZATPGKTZJ5JlJU/U
   OGFpWCQnlArLv1fnAAMQnnk8FvgR5u9Rm/dUx/X0/AOU6QyaDseDhkBgu
   On4k+0aAazGEVrv1Z4VnxonFKl1Tp56BJVWKcHf9QKq7JN5XatY/qSBDz
   g==;
X-CSE-ConnectionGUID: ecFYl2/MT2+3uT3pM4a4+w==
X-CSE-MsgGUID: yihZTQtBS8OHRdj+QnZmbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87391588"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87391588"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 22:17:17 -0700
X-CSE-ConnectionGUID: VIcR6O5RTbyWX6zjXsGbzQ==
X-CSE-MsgGUID: TnQrTUaQQzSD++q1EtkBGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="288079861"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Aug 2026 22:17:16 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvTFC-00000000ckM-0tTZ;
	Sun, 16 Aug 2026 05:17:14 +0000
Date: Sun, 16 Aug 2026 13:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2] sched/proxy: Defer donor commit until after proxy
 resolution
Message-ID: <202608161357.Jthx08U8-lkp@intel.com>
References: <20260713-sched-proxy-v2-1-729170082633@zohomail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-sched-proxy-v2-1-729170082633@zohomail.com>

Hi Xukai,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tip/master peterz-queue/sched/core linus/master v7.2-rc7]
[cannot apply to tip/auto-latest next-20260814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xukai-Wang/sched-proxy-Defer-donor-commit-until-after-proxy-resolution/20260814-163837
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260713-sched-proxy-v2-1-729170082633%40zohomail.com
patch subject: [PATCH RFC v2] sched/proxy: Defer donor commit until after proxy resolution
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20260816/202608161357.Jthx08U8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161357.Jthx08U8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161357.Jthx08U8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:5103:13: warning: 'zap_balance_callbacks' defined but not used [-Wunused-function]
    5103 | static void zap_balance_callbacks(struct rq *rq)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/zap_balance_callbacks +5103 kernel/sched/core.c

31cb1bc0dc9488 Rodrigo Siqueira 2017-12-15  5092  
48fda62de67a1e John Stultz      2026-03-24  5093  /*
48fda62de67a1e John Stultz      2026-03-24  5094   * Only called from __schedule context
48fda62de67a1e John Stultz      2026-03-24  5095   *
48fda62de67a1e John Stultz      2026-03-24  5096   * There are some cases where we are going to re-do the action
48fda62de67a1e John Stultz      2026-03-24  5097   * that added the balance callbacks. We may not be in a state
48fda62de67a1e John Stultz      2026-03-24  5098   * where we can run them, so just zap them so they can be
48fda62de67a1e John Stultz      2026-03-24  5099   * properly re-added on the next time around. This is similar
48fda62de67a1e John Stultz      2026-03-24  5100   * handling to running the callbacks, except we just don't call
48fda62de67a1e John Stultz      2026-03-24  5101   * them.
48fda62de67a1e John Stultz      2026-03-24  5102   */
48fda62de67a1e John Stultz      2026-03-24 @5103  static void zap_balance_callbacks(struct rq *rq)
48fda62de67a1e John Stultz      2026-03-24  5104  {
48fda62de67a1e John Stultz      2026-03-24  5105  	struct balance_callback *next, *head;
48fda62de67a1e John Stultz      2026-03-24  5106  	bool found = false;
48fda62de67a1e John Stultz      2026-03-24  5107  
48fda62de67a1e John Stultz      2026-03-24  5108  	lockdep_assert_rq_held(rq);
48fda62de67a1e John Stultz      2026-03-24  5109  
48fda62de67a1e John Stultz      2026-03-24  5110  	head = rq->balance_callback;
48fda62de67a1e John Stultz      2026-03-24  5111  	while (head) {
48fda62de67a1e John Stultz      2026-03-24  5112  		if (head == &balance_push_callback)
48fda62de67a1e John Stultz      2026-03-24  5113  			found = true;
48fda62de67a1e John Stultz      2026-03-24  5114  		next = head->next;
48fda62de67a1e John Stultz      2026-03-24  5115  		head->next = NULL;
48fda62de67a1e John Stultz      2026-03-24  5116  		head = next;
48fda62de67a1e John Stultz      2026-03-24  5117  	}
48fda62de67a1e John Stultz      2026-03-24  5118  	rq->balance_callback = found ? &balance_push_callback : NULL;
48fda62de67a1e John Stultz      2026-03-24  5119  }
48fda62de67a1e John Stultz      2026-03-24  5120  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
