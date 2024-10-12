Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EF14A4DC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 22:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728771504; cv=none; b=joXS4x0e099b03DhqHdu2sO8Ci6R6ChBZ5STi9w7awfzwKPrE/vGmlOVtptqiG3xqW3vrpLXKUMhnBdcHL2amaR9o/Q3CFqbWiEjTQUk4+LQxF3TuXUN2kRZm6TJezjxa5Yp0PvxPlSMr+m0LbH5A6nUgoseKCYp12hG51TroEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728771504; c=relaxed/simple;
	bh=aq8ZKJS51m7Oi/1vSa3SVbYkRM3HKWrSnyY8rACIqPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jnI+IxTUhUgRRvOG6yBZFxEf2clbeb0llG0zw8D0S4/8nzywx9k1IkHwUFmQaRz15MQNKgnoXt46kKwN4j5gnZ+b2Z2PIiPK1ktjkIhU0F4FnVF33pDX7yS869sc2FLqOZ3gnlfsSazeyCwzmVwVzi3z2YDSv67BoPjfojvOP6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLCFXXvj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLCFXXvj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728771503; x=1760307503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aq8ZKJS51m7Oi/1vSa3SVbYkRM3HKWrSnyY8rACIqPA=;
  b=KLCFXXvjczbydpYb3JW5+heKVwxc22e2A1sF7YPtp6qsogtZah4zD756
   MUXuIfsGgMN5henvKUFQaY2NMA/Jh9kdrd0evgA4e8o2Eg3j2NxShj4xv
   mjPLFxhl4zuKbSR/y0dBxkSkpRwdxY0LtYAr4Utmx/OUiov+fRUclKLcr
   iZhTURhvM8JpRiqkpT4k4DEoB7+2TaGfT+RrlJaWteLL+qVJkXUgn4ylu
   +StSndp/6hiQKlOvCfzd21jGjtvmK65FVvZ+auY65lQUGYfW1trblkGOp
   9ADi92mklhiGWCxRuozu3rm/8tSgGslenRhpfwi90Prl9gJqK+OsWe2s/
   A==;
X-CSE-ConnectionGUID: lrN10in7QdyOD/0epWZKtw==
X-CSE-MsgGUID: RxnkWcrKQHC7sbmlXwxkqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28023508"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28023508"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 15:18:22 -0700
X-CSE-ConnectionGUID: fEucvuanStGKfRZUNteirg==
X-CSE-MsgGUID: z9r64zU3TgCiDs3fo0S4SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77542484"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Oct 2024 15:18:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szkRG-000Dmq-2s;
	Sat, 12 Oct 2024 22:18:18 +0000
Date: Sun, 13 Oct 2024 06:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6218/30000] kismet: WARNING: unmet
 direct dependencies detected for GPIOLIB_IRQCHIP when selected by
 PINCTRL_MSM
Message-ID: <202410130608.5EKqwSnl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   171355878e09938c06396498f584662e3eddcdbc
commit: 5edcc7517c2a97a1bf87fbe00aab8321c760f11a [6218/30000] ANDROID: pinctrl: qcom: Allow pinctrl-msm code to be loadable as a module
config: i386-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_MSM-0-0 (https://download.01.org/0day-ci/archive/20241013/202410130608.5EKqwSnl-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410130608.5EKqwSnl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130608.5EKqwSnl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_MSM
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
     Selected by [y]:
     - SND_SOC_STORM [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
