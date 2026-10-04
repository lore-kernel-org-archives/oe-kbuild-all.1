Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DB43EA949
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 04:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791087276; cv=none; b=HWl+r9JLwJaciF2CvFwR2P2GUuOWaFUhRmwXmnex+eb+o3b+8q9iCz9phYK0RRGbPsO9EXOCgeXwIc0O+Pv7VxLMK8nTjJlwqpPcytooGR0UURGIHkW8ZY+bba1zPYMkENG2r8/Sv5YVFVqYGreMyHI8lZv8gA89DqD293Y666k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791087276; c=relaxed/simple;
	bh=9DPoS3qVj8pymreFqgf7xLSp+VRcDeIyMCFiqHz8R9Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iy9M91ZHdJ6NO6QlrPAHt6bZUNkLU5z9fHERXQn4dZ/wuCCVaXfKh1DqzOdRGr+wt79ygGgbWNRZEUSHHG05LLHp1UqRH9tk5uJnd+ULetNBda5YUYc3iHDLGrioYAALy2h14Xq9C3WbwJhd8YDutnTKewLeYgDlojlQeseDXKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrkMPsw7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrkMPsw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791087274; x=1822623274;
  h=date:from:to:cc:subject:message-id;
  bh=9DPoS3qVj8pymreFqgf7xLSp+VRcDeIyMCFiqHz8R9Q=;
  b=mrkMPsw7334O+eYHs6QEClpgew+ZqjygxH6E164dwjHmqmsCBocira59
   KWzPo4eL4wlGCY6wCsbCEdyjGqGO3YihL5C5JucGRL6TMn7vZfwxd4qzR
   10mkoqGtUq+BhRv231GPrbwIq9fkxGNaXpBZRyaX0p7cdRmouUQ6gyT+u
   V+nnYMuinMveVpQbRStWviiTZCVPkgc2gtjX2vwfhJtUL8e9ROHz4mUoL
   5Olak5KDB/JGN0WdkeJ3RIJatCyv5H4C9a/EU+OrD2P6pczaP6bs52zwk
   eM0rBjMvVkGZ36iAu+CDH9VrIP+gZC2biHX4kjiU1xh2ChkG7XtDuBABE
   w==;
X-CSE-ConnectionGUID: Q/CpdXLDTKO/Wh3HZyTKiA==
X-CSE-MsgGUID: sihyDJbOQs2tKjQzLMW1dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="79355420"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="79355420"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 21:14:34 -0700
X-CSE-ConnectionGUID: a5qJzyutRqKRwjCx8MiDIg==
X-CSE-MsgGUID: tWOY2w2HRLWwXyKp8c5l4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="276087562"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 03 Oct 2026 21:14:33 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDDcM-000000000C9-1AIY;
	Sun, 04 Oct 2026 04:14:30 +0000
Date: Sun, 04 Oct 2026 06:13:55 +0200
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [kees:dev/v7.3-rc2/seq_buf/v3 4/11] ERROR: modpost:
 lib/tests/seq_buf_kunit.ko: symbol 'seq_buf_path' undefined!
Message-ID: <202610040655.KkLzJORH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.3-rc2/seq_buf/v3
head:   8d1fbf6cc110c3086db3d4e02f50ca3027355228
commit: dc1b6d17fc089e7054a63f94235d2299b27c75f6 [4/11] seq_buf: Clear what a writer did not claim when a seq_buf overflows
config: i386-randconfig-2200-20261003 (https://download.01.org/0day-ci/archive/20261004/202610040655.KkLzJORH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610040655.KkLzJORH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610040655.KkLzJORH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: lib/tests/seq_buf_kunit.ko: symbol 'seq_buf_putmem' undefined!
>> ERROR: modpost: lib/tests/seq_buf_kunit.ko: symbol 'seq_buf_path' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
