Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D2115E9B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 03:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713151539; cv=none; b=J52BFZltOL9XIpJ3+BawF/NdyIhxDr4YUwVJ4+aER9epps67v4BgYUwLdzyiqts8ZqOVGqvLIomBgCDEPssXo5sGOYEtgtc/AEDRFW9BntOtYKN+NUBKJZOFgQ6rT7AWYL2MwcJKbpL6kySGljP2MM9fxxGIxKGCFSGYSpKBmTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713151539; c=relaxed/simple;
	bh=ZLCbvjiQEE/vVt0+Pq5hZI52O+Uv0kTTRzQOd4Hsk4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YctlMD+UYTzSoKsgyzvzZnmVFZbucqIpUFF4JVF0C5Nh7MtMOYh3Uk0bqY6rlF53OrgKNofTN2cOmA4egsJ05zknfP2y++Nktyf22krGxDtfYLCgxGpLBLt/WICA30ulzH7mTkM8rvP8mWvN7HXWEFCMK+jRrHilzvdEwe94vEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9l78Q2t; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9l78Q2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713151538; x=1744687538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZLCbvjiQEE/vVt0+Pq5hZI52O+Uv0kTTRzQOd4Hsk4s=;
  b=Y9l78Q2tnzQCfMTo6+mmHeKzisdRtZkCcd5UgMFSX9Y0T/wurOSFoO8Q
   lcIfVCI9qc8Ufz8QPHNkr9Ei3q5nRLeOPh117cfpPcM5QVNRCEBdvl8q4
   h/OUVgSFEJvaIrSFXGO5xpWyEP4jZhumMrtquF6azhhOPK5d9ZQTJJcnI
   kRAWCHlFSDydwlqkFQdX2t96Mpg3b82F0v5AEj5rQ4/j74sLccgYDGEH3
   7a4XZKM8uvBLGSL0pYnP7r3DLayokDAocaJhBbr6ncj/L9k58VhG1r2Eu
   iQJa1vjFCdwOT1jr8X9vJ9VHgRc6bFcowj/04N3nvT6RIolzqAXM0+fjt
   Q==;
X-CSE-ConnectionGUID: vjaXSu7LQWeIyTqKmwTMkA==
X-CSE-MsgGUID: YEcsz54aTiqxKseuRZFaWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8379539"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8379539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 20:25:37 -0700
X-CSE-ConnectionGUID: 0NDtvt6VTQeMO1LzXKfV3A==
X-CSE-MsgGUID: TyRCVgE4SNS69nZRYrlwRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="22198355"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 14 Apr 2024 20:25:36 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwCxg-0003wu-2L;
	Mon, 15 Apr 2024 03:25:05 +0000
Date: Mon, 15 Apr 2024 11:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-r4-mt76 28/30]
 drivers/net/wireless/mediatek/Kconfig:16: can't open file
 "drivers/net/wireless/mediatek/mt76_r4/Kconfig"
Message-ID: <202404151146.HMIi2wFH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-r4-mt76
head:   6db64c8bb7677e3efb47ec465d384a5d12104316
commit: 60b08ce2a46db43df611883b23db830b26fbedc2 [28/30] mt76: add mt76 submodule for r4 (bpi-source)
config: x86_64-rhel-8.3 (attached as .config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151146.HMIi2wFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151146.HMIi2wFH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/Kconfig:16: can't open file "drivers/net/wireless/mediatek/mt76_r4/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
   make[2]: *** [Makefile:688: oldconfig] Error 2
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/net/wireless/mediatek/Kconfig:16: can't open file "drivers/net/wireless/mediatek/mt76_r4/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1
   make[2]: *** [Makefile:688: olddefconfig] Error 2
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +16 drivers/net/wireless/mediatek/Kconfig

  > 16	source "drivers/net/wireless/mediatek/mt76_r4/Kconfig"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
