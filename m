Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A8FFC11
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 03:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710040135; cv=none; b=H7clPfwuizzDY5G9+HKIpglZPpNiycYe6e8Ml+ZbTekx0nhpGG+3EbRlUEiIuYCWGem+zQJNwJJPB8GhxWOeCi1SuG6S/XS2IZK/Dx7+g8AUju/SktJa/eKVUVLMgBLGIHvoc/z8IE3yprU28+sBEgra/MC4MLaRMi7yNIYYTmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710040135; c=relaxed/simple;
	bh=klreHmtBdyRToAbiDqfJxt31wAHPQGXx3n/kJ6keFbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OiZ8OeSetakmbevqLvtbz3NRWJqvo+0qZsH6q/hxpJWUXCKmx1BPU09/nYxgOGul9G+Y+zd0da1Sz75rACFkR8EsSenFbdFJEkDX+1p2zJl2S8Kg2DRGqZTMKL1Try1TtG4B39fI62wfmn6LAimnyzJSwquLuY9UxPLkA7JE/+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsSdt4mK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsSdt4mK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710040133; x=1741576133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=klreHmtBdyRToAbiDqfJxt31wAHPQGXx3n/kJ6keFbI=;
  b=EsSdt4mK+0pzOx5i026cww2QPFDFuh2ARz3O5FLByNbv1uJq3iREhH27
   ErrJEq0eCwNZSmT8NuNguYHlX/lBBwn3RsPlKh+Ct6Z5HhZnfAn1onHqy
   ZJyP177qHYys6bxTi04c3eiFCcBPKQkWRm6nRB/xCqcEG5yuPgsrU0VWZ
   EDIPUZ0W5b28L3phubrsXGl41KdYOpnjiYemftXeaPPX0KBIDU+OpyvQh
   Cy/NhbHgyscYu2vf8pmhUe81r5a0WQF+YIsiX8AMNRE35gfFTBWLh4A0b
   FY9moxSZtFKiwsnNCgTl+YJETtoldGDOikmEcExPN8vIV9B2SOD2x3A2X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="8544584"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="8544584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 19:08:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="48291178"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Mar 2024 19:08:51 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj9YO-0007rv-1v;
	Sun, 10 Mar 2024 03:08:48 +0000
Date: Sun, 10 Mar 2024 11:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 4112/30000] ERROR:
 "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!
Message-ID: <202403101103.CDFZMerF-lkp@intel.com>
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
head:   43a5ead9254d686c58a74762bc6e25438b2f8dd0
commit: 3ebeb5687243e405fbf34032249cada998ee4779 [4112/30000] FROMGIT: power: supply: Allow charger manager can be built as a module
config: i386-buildonly-randconfig-001-20240308 (https://download.01.org/0day-ci/archive/20240310/202403101103.CDFZMerF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101103.CDFZMerF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403101103.CDFZMerF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
