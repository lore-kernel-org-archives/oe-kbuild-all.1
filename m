Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226F75822A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712050804; cv=none; b=PHSJTsn0E3zvDPsZatt27m1oey8CP5yqV3ROToAE4jaXQIKhaNbH+cdHI4tmk8lhuPQcRzoSfpsw6UNUg6iBNuxC2TlnAvfjWAH3+N4PbLDF1UZ9K1R5MIRkGLDvF8abU2gnzAzIY21vxnjNqw8Ix2mZVjDv9c8QpO448JzeWwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712050804; c=relaxed/simple;
	bh=dGYAqLCmPvCjOqvuW4Bkn3Fq1mzzLguzhZ/RHHcnMRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P3hlq5nIfY5ZSZLpQkDLtCc6xBVeN+Cs997SQjjIOvAG6nPPuoStIMSCg/Oi2y0PmEN35LRJdC0/49kh57yXaDOOBGcL3SV4SyfHbx98OjoMY716J8K9nTp7JTKcn7ajRFYK0E4UOWQLpYQuHMe2cDaNpLPwJpI6pkc3bVaUi8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=du2bRy5+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="du2bRy5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712050803; x=1743586803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dGYAqLCmPvCjOqvuW4Bkn3Fq1mzzLguzhZ/RHHcnMRc=;
  b=du2bRy5+lK1ikGS47T0eHXna+PHFcAAG1LvcAXHBwRwm1gwou+Xb7SQp
   CaPLmSS9QJduFlsoNVHb3wJD9YMUWIJ1Vrncv895PiIOtQrAFR4TMQB95
   PUxVRWgGd8qdoYJbLqmfnRn5oKEj4+ad7cNvRAtqFSaNCm0oIIsbKvkBV
   oDZBt26f7V9Ye3pnP7+y0pcZJbTSiuXc0k/IKzoOHDKLriFsTbQreU7qi
   nHwDmjgFwtK8cunxhMOMncDrLNYH9JD7d8yxd68HDYClQrFml6RGMzSXs
   ghzst84PhovVnLsuedwAow7aSp1LsPYflpxLtAox0H2aWsQU4+UVqI3ZD
   w==;
X-CSE-ConnectionGUID: A53auI9URfe5VhKPoaaF5A==
X-CSE-MsgGUID: nmK0iPwDTJuM6+QK/xMCpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7079333"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7079333"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 02:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="18083963"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Apr 2024 02:40:00 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rracX-00015d-2x;
	Tue, 02 Apr 2024 09:39:57 +0000
Date: Tue, 2 Apr 2024 17:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [linux-next:master 2055/3220] ERROR: modpost:
 "__drm_atomic_helper_private_obj_duplicate_state"
 [drivers/gpu/drm/display/drm_display_helper.ko] undefined!
Message-ID: <202404021700.LbyYZGFd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0b832517f627ead3388c6f0c74e8ac10ad5774b
commit: d674858ff979550a0e97b4ac766f2640f0d9d7e7 [2055/3220] drm/display: Make all helpers visible and switch to depends on
config: powerpc-stx_gp3_defconfig (https://download.01.org/0day-ci/archive/20240402/202404021700.LbyYZGFd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021700.LbyYZGFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021700.LbyYZGFd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/cramfs/cramfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/isofs/isofs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/scsi_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cdrom/cdrom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
>> ERROR: modpost: "__drm_atomic_helper_private_obj_duplicate_state" [drivers/gpu/drm/display/drm_display_helper.ko] undefined!
>> ERROR: modpost: "drm_kms_helper_hotplug_event" [drivers/gpu/drm/display/drm_display_helper.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
