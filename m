Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5AE15A8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 00:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733098645; cv=none; b=lCnAJ6gGjpoRZZrlBCi2HI+dnQ/d9V5F1MouOfMuk/+pmIVHam9aq+lDvFRQUFZ/gfgMjNqMb4vIzfcjlq15mbaz2Mfqd6pNMt7Vg9W98oCS8hwas6teD5iEBfpxtThqzirQjZ2aQ48xYdzufl4rLCwvM3WE20PTZf+2Gk4VaDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733098645; c=relaxed/simple;
	bh=FQVah17WS7MNNMuGVp53K3dPGJ07qm6irqmQJUgVeHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBtZqtHe8z3uWmfKCdtRxo3yLrkCHy2bDZ7VWoJt4xEn79MtMbCfdguaEeEVzZ4ARFR1sg895G1+fTt1YYa+inSV26DC3MKapOeUflahakjEOTO4og+Gr45t+TGTj0o/3Tce+YQpg4F2Hv5S1oakUCEZg8h2zfD3ofJnPtLnJxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUG9rfBU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUG9rfBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733098644; x=1764634644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQVah17WS7MNNMuGVp53K3dPGJ07qm6irqmQJUgVeHk=;
  b=aUG9rfBU2cfUYybBciWKzPTEwyt738ijKG1Yxjuu8sQhHFsnKMewmwBd
   aoiN900Qpl//H2C+2v99WF31XNqoPyUcffDXH28X3esrGQGyfuyJnbCZ0
   Fsd+6G4e10+rCk3KdkG4eypxpFr6PKxWnEIrL9PNLySGzKlA38d0WFnpX
   H9/lkZB7RCQj2HKFYYHmZmubw6G+Bb2P1VfhDdr/cBhGJvCVzeisHIDQ1
   n4EDQ61WOIAyiFdV1ORdug/PfchnXLYOGzgBVexW7rbiIDWinJmtupHFc
   Si88n0QiksnGKPQ6IORomlDTEn8NAPN0NJhNynQkBOxyUOELoyF2ozIPt
   g==;
X-CSE-ConnectionGUID: YUx6fk8xT1SdbNYSxgekbQ==
X-CSE-MsgGUID: SE8T3294RTuD+sTmE08E1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33498774"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33498774"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 16:17:23 -0800
X-CSE-ConnectionGUID: M99TVKw+SLuHR2qTNkocpw==
X-CSE-MsgGUID: TWcBEqHjQEakI7yR7vtTTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="92849335"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Dec 2024 16:17:22 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHu73-0001xN-11;
	Mon, 02 Dec 2024 00:16:47 +0000
Date: Mon, 2 Dec 2024 08:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1112/30000] ERROR:
 "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!
Message-ID: <202412020806.vATaLYEJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baolin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   05b689dfc67563b57267808131968156dbdea1e3
commit: 3ebeb5687243e405fbf34032249cada998ee4779 [1112/30000] FROMGIT: power: supply: Allow charger manager can be built as a module
config: i386-buildonly-randconfig-003-20241112 (https://download.01.org/0day-ci/archive/20241202/202412020806.vATaLYEJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020806.vATaLYEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020806.vATaLYEJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
