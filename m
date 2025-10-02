Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D4626B0AE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759422990; cv=none; b=AqPRrzBQJcJ7551+OUlcQLEQxy//pm4Cv4EypKQxaXB2sGoLauaQAjCFujTasLhkFXfrucLLwQYmleyxXQEIAVY35+zduGt/tCbcuCWloCSh+4q4nukspFnSnz8N5m7f6jxO1Kwgfwamr1XCUw/UEZaO7R2Smh6pywDc/dYrwm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759422990; c=relaxed/simple;
	bh=Zb7h89lgPOn8c172+A/n5Q5lt4U0hpLYsx3WuzgzP40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aBkOq5SkUVxwDZHx3N5kkEylLKu03sB+zqSkw6OumMRjMSGrdXLgU7/H0q+jdNf28cnCkF6mXVmJcETb+1wU8I8MxUa7rzpSo1BwP/yny0LQRU9Xm3fyEk0qcC0MOTlS9sGXMN2QfJ5qo97GTpHcDazxrn+0oY54XSuu6yJRspk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjDs9lfH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjDs9lfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759422989; x=1790958989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zb7h89lgPOn8c172+A/n5Q5lt4U0hpLYsx3WuzgzP40=;
  b=CjDs9lfHhrCkwrbs+FI+g9R3/6efo4MZx4IRfvhO5hoNE59MFSY8SKnv
   qc5v59lzCYlSMnk34L3YJmuCuvwOKxvwMkU6RDl2qEfQrln1ABCmyhkeX
   EtYBrQaXlWCOohimXe/QeCbUJkGmIHmPkeqArcbW/Fz0sg1F5AEAOyt6X
   X1V/hoMVFQ5EgvaFeTaQFdril8cLDEGR1oVAf+fToLvOhPt0523sjT0x8
   C+Sn0o+UWCuoft8FJFIms+QGOFCMSllAAXN1udrNzNoxd0iLVvCDDnie7
   a0v/jAIW62hiBoxMO7RHAsSebesjoN5BM4fite7Ycp/TskYJ0oTP+HGYl
   Q==;
X-CSE-ConnectionGUID: shTg85eXRiOxMe2T+eLRNA==
X-CSE-MsgGUID: PeDVyokzSCyEBWzaFg/+XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="65349809"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="65349809"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 09:36:28 -0700
X-CSE-ConnectionGUID: GNK6IhkURQCT9Nmw1Y7T3Q==
X-CSE-MsgGUID: 38wVCRAVSb2OlxQK7ZBrAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="210051039"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2025 09:36:26 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4MI4-0003wx-1R;
	Thu, 02 Oct 2025 16:36:24 +0000
Date: Fri, 3 Oct 2025 00:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core-v3 17/34] Warning:
 kernel/workqueue.c:6925 function parameter 'hk' not described in
 'workqueue_unbound_housekeeping_update'
Message-ID: <202510030052.STQgaKhA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core-v3
head:   ace129ea3a19c90ffa37f0e8090dbe154a5a82d2
commit: d37424061de577660285e83f6eae04b1bbd919a4 [17/34] cpuset: Propagate cpuset isolation update to workqueue through housekeeping
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251003/202510030052.STQgaKhA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030052.STQgaKhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510030052.STQgaKhA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/workqueue.c:6925 function parameter 'hk' not described in 'workqueue_unbound_housekeeping_update'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
