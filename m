Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE37E270EDF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776416365; cv=none; b=ozKVqImnkHmWKD2PPFGKLgmsjxHNDM6KG4osaKP3rOpglX/p3XVtsjDCO5nvWQX+iVLF5pe4tzVcMeuTQT2i/eCkpHtaSmJLbsB4g9mOH+tvzndy+b+stC8TGerjRwgFmSYhgkNnuOhKZ47GAxs4ChZX/Yasx52YTFpIWV6JdeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776416365; c=relaxed/simple;
	bh=qAgYbtwekCqYEKLnoIom06W9lHafLGUXXNibP+Ro5gc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QlFWWUOWSnH0Hy0do+KororuMxwFkPSbmvMIKwR/uXEbUzuYw085+GAdPm49B16uFGRxcSV3P4Y2fOB9egjRgX25cprhje0v82GycQTkOGNma9uDDZOQ/9Rg4LEaD11Y+TfiHbHZO/W+uJWBkWmvLgfYQFBdbz6k/Y2LDIgTqZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrhG+SC8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrhG+SC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776416364; x=1807952364;
  h=date:from:to:cc:subject:message-id;
  bh=qAgYbtwekCqYEKLnoIom06W9lHafLGUXXNibP+Ro5gc=;
  b=QrhG+SC8wAD0aIp+H5NPF9H+2UfrUH77PMvHeviWGIu2M0ShyDdVaTtg
   fBwfBqSmbKMpzKH+huNFtkz3DBCKnZWXGjgU2MChXK7kTiel6TegTDvss
   w8FXPlFKO4X+KmDQGtGffZdZ6l14RkyRkfQlfgIVbcLU3GfbPdBDie6ZF
   hFfRF2h1P2i93bDGvJSucax3wwkQs2NGg6TTLyLBIIjiAsiwk0V3AbVCI
   pWyrlQvt3HV+Pr3wJ+5pjWZ+VMH3kLeux3DNORxFbznk7nTfvxGTKJmZo
   /OemKSkM1pcrINujOpXRY6A2/MkpONuymykgj3gcaXBQMPpoJBCj9H7RM
   Q==;
X-CSE-ConnectionGUID: W0FN+VF0RIixHqMp01bgXg==
X-CSE-MsgGUID: tjwISLT0R5meIlsicaqHxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88048391"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="88048391"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 01:59:24 -0700
X-CSE-ConnectionGUID: nT6SJysMSWyMOfoWWJtn7Q==
X-CSE-MsgGUID: vmVQ15slSFW0jjg7Ow4SNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="234975067"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Apr 2026 01:59:22 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDf2m-0000000009Z-14sA;
	Fri, 17 Apr 2026 08:59:20 +0000
Date: Fri, 17 Apr 2026 16:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3] Warning:
 drivers/tty/n_gsm.c:4175 function parameter 'dlci' not described in
 'gsm_modem_send_initial_msc'
Message-ID: <202604171658.S0L0bb0H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Seppo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   27ab235e014269ff44817beda997780356467583
commit: 3cf0b3c243e56bc43be560617416c1d9f301f44c [3/3] tty: n_gsm: Don't block input queue by waiting MSC
config: x86_64-randconfig-071-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171658.S0L0bb0H-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171658.S0L0bb0H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3cf0b3c243e5 ("tty: n_gsm: Don't block input queue by waiting MSC")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604171658.S0L0bb0H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/tty/n_gsm.c:4175 function parameter 'dlci' not described in 'gsm_modem_send_initial_msc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
