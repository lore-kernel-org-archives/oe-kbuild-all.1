Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5231741D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 07:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728976661; cv=none; b=Ai7fmb51tWdRyEQzVY3n9EWuV+SmnuhvrLV/LVFTKUMX5ZRObXtCrhZZ4sH7wLhxAdvTSjiWN+/9Ml0LoFmZRugN02zyOjJxemfkw0t4p1cHhYiGh/GPJpyHEWcoa+Vfo8x42wT5NcrjAfFeJKC6OXyNbV4oGUbp1AC6gvvNgyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728976661; c=relaxed/simple;
	bh=2ueVBIjenYEUex968OO32Kx+M/i9oTYnxUte4X4wwjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mD42M1q33CsjAKWk6y/uja8FnpsV2gbadoxhR9SoUsA2kezv62SNKZCZDl1Q5bs57GDwE5xv1SwvnNmeGy8dmsiyhK7g4nUR8GLlrcznppd2zc3d8LQfdfXaI5HM87vKAkVbUH1W6FNV357IDEAm9tWgZD67f/DGBrbGdfu1wDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dl5DHxMQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dl5DHxMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728976659; x=1760512659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ueVBIjenYEUex968OO32Kx+M/i9oTYnxUte4X4wwjo=;
  b=dl5DHxMQ9KRjOXCTt4L3DxEqIUrXm2epRvHDTyOs+5esxypzYizbjl6h
   J+eI+cgFSm7Ta0HMcRVCXczOGfUjDVhyFx1+94VNzA+NVM+dXKf/pHts1
   zfZdC06mH2o3AqBNAiLFuKvbTkgVmPX3+DQxTHwUCCYEi9sAmsqNxi9A9
   XS6HpQjUWQB4g0HtAXC0nlM2IlPW63vW+CLFrddLOWleNRCKtrwoSjHO5
   xOuWCHLY8GdUkogU1w8ubPe03fnmZn8Kraf+olkSzsb9pD0YV/m7S4RRh
   T7oyVBBe8pppRip5CXUzMIus6djfQWyGryTj9qAAQX/g8KhE0Y9q9eJFN
   w==;
X-CSE-ConnectionGUID: IyxmtEocQrOwmIBorlzriQ==
X-CSE-MsgGUID: TV1Ch/UTTi+AAmgmYR8HTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32269675"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="32269675"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 00:17:36 -0700
X-CSE-ConnectionGUID: 7eGpaCbNQISFoUYTa/1Avw==
X-CSE-MsgGUID: onGDvGWaQBeSbq24hBUc9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="115250234"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2024 00:17:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0boD-000HkV-0s;
	Tue, 15 Oct 2024 07:17:33 +0000
Date: Tue, 15 Oct 2024 15:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip-rt-rebase 188/440] kismet: WARNING: unmet
 direct dependencies detected for AX45MP_L2_CACHE when selected by
 ARCH_R9A07G043
Message-ID: <202410151539.Hlw4TezN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rt-rebase
head:   08788bbb26e6f92122914516e7d36ade297a3f3e
commit: 5f6eeb7dbc55b8b2859a8776e825e68b6b2e5730 [188/440] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
config: riscv-kismet-CONFIG_AX45MP_L2_CACHE-CONFIG_ARCH_R9A07G043-0-0 (https://download.01.org/0day-ci/archive/20241015/202410151539.Hlw4TezN-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241015/202410151539.Hlw4TezN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151539.Hlw4TezN-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE when selected by ARCH_R9A07G043
   WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
     Depends on [n]: ERRATA_ANDES [=y] && MMU [=n] && ARCH_R9A07G043 [=y]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]
   
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
     Depends on [n]: RISCV_DMA_NONCOHERENT [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
