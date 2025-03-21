Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6191C462D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742596819; cv=none; b=FrKQ+n2V+WpbaA4zYx7YmG9CLtFGSACmN1DsJERTFwUaQVzCw+xODpSUDiZ7PfkBK2Y+swf4Qwd48fyAtuQgivLI+wf86A/X/3H2RUm7M7+Y2vdjN+CiPBlwS0K+chGPl9bhhSmtdiVexEuhuSDaQI57Onf88xONAM3yYWsf4kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742596819; c=relaxed/simple;
	bh=GvzF43dQJVeJR8yp9lzeCXCXgeXXTaBshKMa+OGoPfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M5P5KvLWmMww65K7ImTrCMc/n5SZN1QuNiXtz8U/UZrppi6fx7F5webC41LP9jVqPfxPZzIML/HPjWuraMKCGvLflvgkZGK6yPYnbaKKVMBBbBoLsssb8ou//NSEo1J+t+tYp1UqjLRDrl0wfhIalYCTDw5eWP+eTU6tEamHNHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVv2Y4pm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVv2Y4pm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742596817; x=1774132817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GvzF43dQJVeJR8yp9lzeCXCXgeXXTaBshKMa+OGoPfs=;
  b=XVv2Y4pmZlcfgWblRFh9I1FGOV6moA8YTTVOeqTZtBnvMojHRrUatTvb
   7o7EP5q+ig4+jOffFEHIEPKGwJtOp7eJ+j/gPwa/1bhhrRrmKmIhR0g8J
   yCcme4XO0HOX1t7Pkby/xOAcly/txUXxE3MFKWaCcpcMI5C8kS+4to7hS
   q+5s60v5oFy7jLHw5OSWsoS9RNJI/q6Mu/8IapHQwyZxKxBVH0Qjtu7F+
   BZDV3DRvEEq4bs2vbg7XLL2H22kl+PT3eQGbTudYYjfHLYtm/ME/paw7V
   04z5SmnU21o69oYIwACCwGsz2dQRxk62E7JvFkroHwTxv3JtJ2nWuP5BG
   w==;
X-CSE-ConnectionGUID: N+43F7RlSRuZhpItES5RXg==
X-CSE-MsgGUID: /cjKNmF4Tu6EwVjg01PaOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="69229045"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="69229045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 15:40:17 -0700
X-CSE-ConnectionGUID: /EfTYZLqTtGJaLBXx5JaXg==
X-CSE-MsgGUID: ESlzrTY9QXGrtuLPTovIAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="124043563"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Mar 2025 15:40:16 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvl2D-0001kJ-1s;
	Fri, 21 Mar 2025 22:40:13 +0000
Date: Sat, 22 Mar 2025 06:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 5/5] mm/migrate.c:2779: warning:
 Function parameter or struct member 'folio' not described in
 'promotion_candidate'
Message-ID: <202503220608.cRFEllb9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   a83d4b477373194ebc680bcd0123bfbbc010dddb
commit: a83d4b477373194ebc680bcd0123bfbbc010dddb [5/5] migrate,sysfs: add pagecache promotion
config: csky-randconfig-001-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220608.cRFEllb9-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220608.cRFEllb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220608.cRFEllb9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate.c:2779: warning: Function parameter or struct member 'folio' not described in 'promotion_candidate'


vim +2779 mm/migrate.c

  2767	
  2768	/**
  2769	 * promotion_candidate: report a promotion candidate folio
  2770	 *
  2771	 * The folio will be isolated from LRU if selected, and task_work will
  2772	 * putback the folio on promotion failure.
  2773	 *
  2774	 * Candidates may not be promoted and may be returned to the LRU.
  2775	 *
  2776	 * Takes a folio reference that will be released in task work.
  2777	 */
  2778	void promotion_candidate(struct folio *folio)
> 2779	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
