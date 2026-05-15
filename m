Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A083EF66B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 22:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883835; cv=none; b=Qc3cYJgvS/pnDUWiGgYTuYDJUWrpndgArus6JY+MMAd4gjySO6TGTc8qI/KXPHXlQLY97YNjhcmw1Gz3/UcJQEYyfUZzBqJ49T464ZTMi4mkLk5C6Kg8xCmAzRyLWmoaurDce9KkJwtdWNdL0vo8XEXq/wlbpZjfNta4l7+WLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883835; c=relaxed/simple;
	bh=dW+1G7Hhxyv+6WnD3BeDyN8NgKyH2/SEdKg4Krwg0zM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eT971MYnSLg70tlwGna98B9XbOZk8RODvrcm0Y4KaqkuMReI6jAoB4tJ4wr7VtreCWLaHq5Qc/Y1d9xWr+v+kuoMgI5v04VxIq2ZXgiv6P+7ppsNkJ5zyAv/jGMkw4hrk568l8pVpsQbO57iOUnQlwC1Z/gx+46ObiNphGHFQxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Os/IW7A8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Os/IW7A8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778883833; x=1810419833;
  h=date:from:to:cc:subject:message-id;
  bh=dW+1G7Hhxyv+6WnD3BeDyN8NgKyH2/SEdKg4Krwg0zM=;
  b=Os/IW7A8Nqx4SY6XkSv927y5OU4TApT84zow5HQ1kt4MBdSjZOKs3WTV
   DaZTUm0wAVQXaSIFjvX4wkaoqKltZudBRZE7fGYW+kO2VE8hQy6zHxn/t
   CcqMRMEX77O0wpD9heSszwkRxud/L7hOTgJP+U6qm2zCckwPBQ2s1Ig4n
   gQQq6q98l5HogKJwxGhXCxqbYwa+VHP5XoeQnZBxvmUbEcmWeRXhiSvdH
   soetIWPHRFSa9zKraGAp4+zqFgi7SegcxoF2iTyXivspahB+veg3Yvt3d
   QF1wBD7aWvDG6AikLjSrqPG6PPLo3QaHA9pLpLTOm/8h+Ptzo2+tWj/BL
   w==;
X-CSE-ConnectionGUID: OVH/dFbpSCmJm7rrW5eIQQ==
X-CSE-MsgGUID: Bl3ohw7bTRaoxN/306upwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83459628"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="83459628"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 15:23:51 -0700
X-CSE-ConnectionGUID: otq5iO6OSDq5ihGPR5rrlA==
X-CSE-MsgGUID: kmquwie6S3+7ecYWUtNflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="238934018"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 May 2026 15:23:51 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO0we-000000000A1-28TV;
	Fri, 15 May 2026 22:23:48 +0000
Date: Sat, 16 May 2026 06:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 6/7] fs/nfsd/nfsctl.c:2469:1: warning:
 label 'out' defined but not used
Message-ID: <202605160606.osC9p2ZA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   32078d4509258ed0a8083fd51e4da9525663c611
commit: 97de12fd081f4f4883c2b529338d815425bda778 [6/7] nfsd: implement server-stats-get netlink handler
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260516/202605160606.osC9p2ZA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160606.osC9p2ZA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160606.osC9p2ZA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfsd/nfsctl.c: In function 'nfsd_nl_server_stats_get_dumpit':
>> fs/nfsd/nfsctl.c:2469:1: warning: label 'out' defined but not used [-Wunused-label]
    2469 | out:
         | ^~~


vim +/out +2469 fs/nfsd/nfsctl.c

  2467	
  2468		cb->args[0] = -1;
> 2469	out:
  2470		return skb->len;
  2471	
  2472	err_cancel:
  2473		genlmsg_cancel(skb, hdr);
  2474		return ret;
  2475	}
  2476	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
