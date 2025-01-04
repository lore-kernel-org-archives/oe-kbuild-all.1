Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EABE1D5176
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 20:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736023704; cv=none; b=jWP3Y+IAx+E/9UaeLRt2hkiaMkIBPr1v0YCc06RMP3srWNsSYehVsq25LprWgyq5n6Jw5wQtVd6Z0SqOC6pYDGYCfHd6KNjNQOO8ENsMg2ic+V+1e115jORPZemrc8VCFEo86P6h52vr3086ZQvvtsFcjJtiSOlxsDEl2vNYylE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736023704; c=relaxed/simple;
	bh=L8eKTAZdTXI2BmiBlbRNnWVN+lG7rawp2JjIj+wIgTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4q9B6XVJ9plu8ld+dxIwOJtUaz4prVJeBOBQqounbPVwFH6NbIS7nEG6HmLv79lqE4wwImqa8rYvYiKMNo9aWlDAlrP7ZoEXluJbQ+IcOM3DKESzLlf+c5xZW8KbI8qX2joobiacjSK6ukuNscq3hjGu6IR2i+oSIGZCIdup68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHlFSVVR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHlFSVVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736023703; x=1767559703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L8eKTAZdTXI2BmiBlbRNnWVN+lG7rawp2JjIj+wIgTo=;
  b=MHlFSVVR8sdCOV3J3fQ27/Wj28D/SeM7g8YxoDfFU7SO6nzu/zhsANAX
   ClX6lOjCHB/xiNgnJc5FN40gA55D7S1gRXbEhBD48BhT7Gx7cLRYY0vEu
   YEXVRIYf/BbTm6gSJuoNf1Q8sHMkl2ALsN//Vu4ovWSO0TtokF/+CE89J
   TXH5zwnSA2iuP5sAwGsGv+fwjYGUPJAoVl2zZ7KzGwJgDtiw2ozN9Exu+
   pie0Qp6/fD3fAJJqCDB7m/i4ihBK0YC3nnrpdEU+09MHmQu70UMCDmeuC
   s9fqkOq/pwlw887VrfL+xJkje/c41s6NZvrN2/NjhJgf0c7FdzrRFAM6c
   A==;
X-CSE-ConnectionGUID: QtpTF8R2TQGILcf18/L0YQ==
X-CSE-MsgGUID: TUTl98tZQaWJI/0GQFixYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="39909796"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="39909796"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 12:48:22 -0800
X-CSE-ConnectionGUID: 5FmuznaBTtmfiMNbLigHgQ==
X-CSE-MsgGUID: VytGzLDhSbKIgWZgM/y36A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101925900"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jan 2025 12:48:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUB4E-000BBv-0R;
	Sat, 04 Jan 2025 20:48:18 +0000
Date: Sun, 5 Jan 2025 04:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Jun Li <jun.li@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: ERROR: modpost: "__bad_udelay" [drivers/pwm/pwm-imx27.ko] undefined!
Message-ID: <202501050459.Cj4jUIXd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: a25351e4c7740eb22561a3ee4ef17611c6f410b0 pwm: imx27: Workaround of the pwm output bug when decrease the duty cycle
date:   2 months ago
config: um-randconfig-r051-20250104 (https://download.01.org/0day-ci/archive/20250105/202501050459.Cj4jUIXd-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050459.Cj4jUIXd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050459.Cj4jUIXd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__bad_udelay" [drivers/pwm/pwm-imx27.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
