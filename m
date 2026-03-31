Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06003E9F8B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946976; cv=none; b=c4isuy4L2+7iqCkUK+vpfCVvsOX7maVhRt9KY0lO697RNHjZp/oHIcRkKGCrF475om5lZ0AvDtzSV80JjnWlPFAZJE9hnqN1B3+0eJ+fkTwYUr3qlEEJ5r5nkMkvWUdMKRtIjUA1XGIE4JW/fE0Vn1OJPSllYBQkAdAn0A34ZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946976; c=relaxed/simple;
	bh=LEFPvWQm4xVCJUpAlulh7wLR7qyMF9zC+367hQ4F3Rs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ahY+DGQ6YiOoWe/Yuf6GsV/iMMF/rNebH8b68JDFbNzOvaFVtvNsyox/xc9lnuP+j0NoG+r08sVdt+6Jkreiu140gvADEybN0p6h5hO8QtCZzDVIzm4ekgb58FzJ4eYf0/8IiEiIMMsHjePvFycxcq4CHBbOtk02Q8OEWFl/7tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHhIjtIv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHhIjtIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774946975; x=1806482975;
  h=date:from:to:cc:subject:message-id;
  bh=LEFPvWQm4xVCJUpAlulh7wLR7qyMF9zC+367hQ4F3Rs=;
  b=bHhIjtIvBvZBQTIa/uxlzwCzpFWS4cuOc8q0+jOWkCMbZ3cQXiXSSlj+
   4xxupnf75SOiIM107GZAYtwbHiEJjRuc0rWFUpr0nU2QLTvKNIcqSK304
   8j3MOH13zTBo+CiNKhZ+2wAWxYBymzVsrPxjMADFSxKv8L8hbb14qMtJ7
   sTUXUxpmrfMHS4ZG2s2MJiOEJx5ed33U7wB9Qv1XSjpi0hHT/WIqyaCYX
   B3rR5cdztSkjlHnT5hZvtHq4/WPlWHe4MlZ1H2jvM3q7qzB1Al9drWms1
   SBQWXCsd68CIn/L9NGW2SCwu84WVLXZzKwWZnTP9D3nXGslZJvwcyzOuM
   g==;
X-CSE-ConnectionGUID: amu4OzQURuCs2mrlNvbZug==
X-CSE-MsgGUID: uQnbvDSjRniCviVY/3nVaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="98562393"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="98562393"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:49:35 -0700
X-CSE-ConnectionGUID: /18nKp8hSQyjWeILy7Ff5w==
X-CSE-MsgGUID: vH/8Kp/MQuaRsSlvZvwJEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226551877"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Mar 2026 01:49:33 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Umx-000000002RB-0fMf;
	Tue, 31 Mar 2026 08:49:31 +0000
Date: Tue, 31 Mar 2026 16:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2026-03 1/1]
 arch/x86/kernel/cpu/amd.c:1255:6: warning: no previous prototype for
 'amd_check_microcode'
Message-ID: <202603311621.iItgYblh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Borislav,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2026-03
head:   b1ccc7ba749c4d69ac7e52c690bdcc202de4d298
commit: ed9b87010aa84c157096f98c322491e9af8e8f07 [1/1] x86/cpu/amd: Add a Zenbleed fix
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260331/202603311621.iItgYblh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311621.iItgYblh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311621.iItgYblh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/amd.c:1255:6: warning: no previous prototype for 'amd_check_microcode' [-Wmissing-prototypes]
    1255 | void amd_check_microcode(void)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/amd_check_microcode +1255 arch/x86/kernel/cpu/amd.c

  1254	
> 1255	void amd_check_microcode(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
