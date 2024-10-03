Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542851A7250
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 17:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727975686; cv=none; b=B3lRsktlaFg0cZyWk+Y4SJadHll6j92cl0M3iprI3xOgU9vpVC0ZJCa+jUQwqftn4LIiEJswHS8LABU598jZQPt5TTGz5ekRKIHG5Ru9nYsHvOZK5laeF5JNrnIHO7QCwFkNOcD8LQQeSXj+QJ6iQpnPkDZtYVsDGvoHWuiUBbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727975686; c=relaxed/simple;
	bh=MSCeBK/kdXeYC3RMxKb0pwEB+AhpTK5T5ab9sKS6+r4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=th3RTAqTdnXyXJFMVVQgBwROo1GbwinHVxCK41shxw/pA4Zh7mLLaWRQyJK9wa0ZXuHO+TgCKFFQV5RWdNYCIJ+9vvIeJDFsSVQrKUPVDaN2M6QT2PFoVjFo3hiRDnh2jqiVaVL/r/52Bfzxg3NAlfjKGY7MvIfhEcLxsLBigwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXGmtKeP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXGmtKeP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727975685; x=1759511685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSCeBK/kdXeYC3RMxKb0pwEB+AhpTK5T5ab9sKS6+r4=;
  b=WXGmtKePJoGH2OkBRb7YAFnDbNGDsz5JMd778BsIVWlJ/rmZ6+CPq/Fk
   2R/JUMRzd+AthJrkqdrv+A+7+YCvzVtOnMs0zKEBT2tNoffQHS41Utr67
   DpVgpKZq8mL6b6w3/bzZ03T84GKq33SR3beOzrAKEAGlZIRyE1IsxRIKC
   eH5OnMSjM2gxVbOoKTRWHV/FCaxEGTpd8aU+R3r3jJ49rWWrR/UZsiPxP
   pHyzuwQu91kr7vjarPCbUXY2DjlDVKwXlqwLqGN7KyQCpMGFes5YBHdDF
   5mrt75o+GxQtiXZaohxQVqgW5S8GBl0+S0xiYgq9Od913JCimEnmaEemY
   g==;
X-CSE-ConnectionGUID: mTE/YIMXTuWEmgXNLuyRdQ==
X-CSE-MsgGUID: 3ey5c/+XR3Ky02NHjDOmSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38545024"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="38545024"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 10:14:44 -0700
X-CSE-ConnectionGUID: +nxXw/jVRFqReNyZ6i07Cw==
X-CSE-MsgGUID: AK5nu1JJTWWTSavqEOPgMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="79388584"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Oct 2024 10:14:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swPPV-0000i6-1r;
	Thu, 03 Oct 2024 17:14:41 +0000
Date: Fri, 4 Oct 2024 01:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rt 32/23317] warning: (DEBUG_ATOMIC_SLEEP)
 selects PREEMPT_COUNT which has unmet direct dependencies (COLDFIRE)
Message-ID: <202410040129.6G7gXlet-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   43fa17560b718bc4454ab8d291b6995033041456
commit: 328021d20b5d3df6eebf5c6707811ff8082f35c0 [32/23317] rt: Provide PREEMPT_RT_BASE config switch
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241004/202410040129.6G7gXlet-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040129.6G7gXlet-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040129.6G7gXlet-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: (DEBUG_ATOMIC_SLEEP) selects PREEMPT_COUNT which has unmet direct dependencies (COLDFIRE)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
