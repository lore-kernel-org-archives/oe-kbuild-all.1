Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ED626299
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762941339; cv=none; b=MZwrjQORt4rMxbvyDeqJHsB+7cmdD86+sFGDMiti1Ffgo0e77UMKqElDZLZJ3JyGyyTwFmeqIiZMqz994cAH8Bict7LxLdda6bBShdY3yddEuYcx5RNnJZ2MqW5y9ACqruIRqiVD3JnzZd4HaEqzoxPWQ978SqrC8+Jfle5awEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762941339; c=relaxed/simple;
	bh=Wm5vBJR5vbns1T0gfTUjijCJL6Zz3oSf6kJ4C/CqBKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNm/zqkHUt3VWdGGygigloyJLxDpvixduHWSWaXd+cSthA2lsf6jMYqbogmWhhQXehwOOJ1eEh+pfPCw87tI5/SZDpbkNKrjm1X7BFQ0HSuUeGMMaPxVgWsK2GZMLX/kUMu+AWq29bDzeDodEZIFrpHJARQmJdJWM+rZpxLJz/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/BcJt7U; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/BcJt7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941337; x=1794477337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wm5vBJR5vbns1T0gfTUjijCJL6Zz3oSf6kJ4C/CqBKU=;
  b=c/BcJt7UmG0kDwtVWqrbQhN+9Y1G8FWaIYzDzqkj/jB4WTvRxOm8i2Zc
   PCibC8ArLGNo93WsO6T3orzexa6Y8n7DdmaSxWUgiJokQk7V6ePnZwn4D
   2wn1jmOc7UjI8WROV4CGLulUWGEYj+dlAArdcfvf6D8fPjhWO0PPc6GgO
   BFZv0c1C9ifTyRoNzFMsECrHoe+ath/+CF2qsIt/Ts83oGhVfb2b9ccjO
   e7986Nvw+wlNglzs03o/E4CTznl8bvzt1jDN+mvpSKDVG+KxHZZWmwMiq
   9CJOzTGXTbzD6OoVSMoxIhXYshVO4f0Qx6sxlS02fJloXh+YrhfqgR0kT
   w==;
X-CSE-ConnectionGUID: G0rK3U3xQ06G8zlZysZ2Nw==
X-CSE-MsgGUID: 7U5OKTZyTtmRNht0EZYeOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68851142"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="68851142"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 01:55:37 -0800
X-CSE-ConnectionGUID: OaNcgPYjQeSnw84bjkpKDg==
X-CSE-MsgGUID: H14Q2XOpShuPE/0GYASqkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="193306790"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Nov 2025 01:55:36 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ7Zd-00046l-1W;
	Wed, 12 Nov 2025 09:55:33 +0000
Date: Wed, 12 Nov 2025 17:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 186/186] drivers/scsi/gdth.o:
 warning: objtool: gdth_copy_internal_data()+0x3dd: unreachable instruction
Message-ID: <202511121744.fUD91V73-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   0ba688b1ab1cc6720a64ab4b191df51796352997
commit: fca16257ca2966b34ef1689ef101170bf932e835 [186/186] UPSTREAM: ubsan: remove UBSAN_MISC in favor of individual options
config: x86_64-randconfig-121-20251112 (https://download.01.org/0day-ci/archive/20251112/202511121744.fUD91V73-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121744.fUD91V73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121744.fUD91V73-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/gdth.o: warning: objtool: gdth_copy_internal_data()+0x3dd: unreachable instruction

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
