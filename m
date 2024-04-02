Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693115731E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712049543; cv=none; b=Wh2V60e0EIh0WoA/4Dk1JGZX4e5OYPxb31NqlyCPKabCxNQxN0H6CPkenWNsD6QUa5qVG3zOTBy7vl76zqIQ6+2u8Symz/1zEXl15YqnlotakrP/S+7+cnuO2b9yeMisPh+ZnrnaJbucf6S+Ml5taW+/z+Ai4UFO6Z5NyGR4gLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712049543; c=relaxed/simple;
	bh=ioHvAwjLF/KP+S7xsYCBQC8cXmlxpYuGFRch9UVnjmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GmaKm+FsvVIpniT8k1N0e8Rht2GhHX9j04XmlBavVJ84RlyK1ouvVBo2FiMfKjo18P1fh70TkIW+VXmt+Ws7aTdV8tLnLAW5+h837Xuqdsdfh9ju/929dkRuiFLmj16zo9heSK3jk8+/Npf8wg19AVZ1IK9DiBUxVb1nhGfZCks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+EiYl5I; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+EiYl5I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712049541; x=1743585541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ioHvAwjLF/KP+S7xsYCBQC8cXmlxpYuGFRch9UVnjmg=;
  b=b+EiYl5IBjfZa6K/m7ShDtEdWg7EKKrrnHcTguGCUBdPyeNjtCMCqfGL
   iyUvEL0rESMyf7O+fWh/tY6LQ0K4Xs7t7Ti3ctdluAP819r6MTJsvQNZn
   WiFN5GI9ZAg3fKTlaQjJUm+ACovBgNZdh3RWOwacmJv7Yny6DR/ocDM7y
   CrxD9zJ8OikEH+DlMtfZpurXQwtK5SnNh6gUtaTBsjnnRHlfDcfje+lxH
   +b2QDFrzECJZcN5wiQx801JxRUhibcpWBZWDWkBX6WvqH3TAHIEvyhO68
   2k0C+CoWNaoenaLNqDkMydmuQuhi+xVfFwuqP6stAH/tKtXMGFVEy4MLT
   Q==;
X-CSE-ConnectionGUID: A72Wbd0WS06cIcSJxPhHZg==
X-CSE-MsgGUID: xxWvM9V5T9aeuwL8j8gAlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="11026588"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="11026588"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 02:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="18057359"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2024 02:18:59 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rraID-00015B-2F;
	Tue, 02 Apr 2024 09:18:57 +0000
Date: Tue, 2 Apr 2024 17:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/2] llvm-objcopy: error: Link field
 value 0 in section .symtab_shndx is invalid
Message-ID: <202404021724.VI8elRzi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   f085398f0e8f47d8744f0c974f9a50d9850e85bb
commit: 353c3de3f112132e10d8649a97f0a03fad28c745 [1/2] ANDROID: thermal: Add vendor thermal_pm_notify_suspend function
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240402/202404021724.VI8elRzi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021724.VI8elRzi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021724.VI8elRzi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> llvm-objcopy: error: Link field value 0 in section .symtab_shndx is invalid

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
