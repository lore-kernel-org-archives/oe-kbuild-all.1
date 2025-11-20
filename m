Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EB3313278
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 22:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763676388; cv=none; b=eqFbynCTvvcIWGYe/otJzelEuZzup7SZNsBoRW2QNFHNmlHrGkpdEluolWgDTFcFZ17uGgAjLlcsDZulizxtyVzRu4wRRdxlhkmkU0qvjWmEHp4cIR0pdxtsoJprkU1lbhHiuIqhDXeF6cRTxAmOpoaxo5A/bBrWRw934GMOWFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763676388; c=relaxed/simple;
	bh=hzi8aaoUg/dSwIxpGlF8BJZhWyYAp3GYmlz/WFAduTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9KzZLMtxMp7v3Ii3rwYDFaO/LjHi/pNCxtOsvWbsCIMhGry/cB5TWMi44J6ie7cTGXplbsBkoWNj8Ty/LtAsFcwN0AAi6ibxRcxApXdvKv4Jy230dKC2bLUuGqUzRYGIliz8QKxj67sx7ltUwyT7VZFbu+Yyzjn0p24XvyYoKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4nHI9+W; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4nHI9+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763676387; x=1795212387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hzi8aaoUg/dSwIxpGlF8BJZhWyYAp3GYmlz/WFAduTk=;
  b=a4nHI9+WUFt6YxX4laYiesNsh4RqTx08fd09AdXPlstXcNKL+OiR/yoT
   FkQfzyJd6WML9L+yWa9C/rnt+EQrjN6bez4+6Mec387giPCD+jgRkdTTm
   HdPC4fmkrZggPxc/GveS68jI1AuGo04J8xd47Gitdf8HjvmybqSx5gAMk
   etPhCAx5DrCPoB5k+8ilZLlzlTxKt0dgSDJVspdttPoiyyWvWUZ0w2PHs
   lbFXQvguQt0hXLNgkfCGHkz2eJEhbuKOMaeDI3l6QuNG2/LTR7glLJrAz
   2KOboAYH6qgChov5vih+OimkvKtmuXXeoreFUTuOtYUjpxBOxGJxtXqBk
   g==;
X-CSE-ConnectionGUID: jOjpnhdTQz2lW+b854+WEQ==
X-CSE-MsgGUID: y420XxHASayoljPb1mqkQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65641445"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="65641445"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:06:27 -0800
X-CSE-ConnectionGUID: beTHXX0vRx6vF3cUHWiDsw==
X-CSE-MsgGUID: sOarvwDxQOOt2BquBOcyNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="191349799"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Nov 2025 14:06:25 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMCnH-0004d1-1N;
	Thu, 20 Nov 2025 22:06:23 +0000
Date: Fri, 21 Nov 2025 06:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 84/84]
 drivers/vfio/vfio_main.c:1313:21: warning: no previous prototype for
 'vfio_device_from_file'
Message-ID: <202511210602.rXz0soBU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   b50a1ecd74a062da29b39ebc3f3a1906e759b2dd
commit: 1927abdd408e097dbc683767690cbbb2d4d574ad [84/84] NVIDIA: SAUCE: vfio/nvgrace-gpu: register device memory for poison handling
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251121/202511210602.rXz0soBU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210602.rXz0soBU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210602.rXz0soBU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/vfio_main.c:1313:21: warning: no previous prototype for 'vfio_device_from_file' [-Wmissing-prototypes]
    1313 | struct vfio_device *vfio_device_from_file(struct file *file)
         |                     ^~~~~~~~~~~~~~~~~~~~~


vim +/vfio_device_from_file +1313 drivers/vfio/vfio_main.c

  1312	
> 1313	struct vfio_device *vfio_device_from_file(struct file *file)
  1314	{
  1315		struct vfio_device_file *df = file->private_data;
  1316	
  1317		if (file->f_op != &vfio_device_fops)
  1318			return NULL;
  1319		return df->device;
  1320	}
  1321	EXPORT_SYMBOL_GPL(vfio_device_from_file);
  1322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
