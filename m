Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CC042050
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766310960; cv=none; b=WOKeVD4pn4jjLsjPQxeaxbZdV9iw4vRy2GAqu5GylJWPpboZXJ9Q3lpEuI6j5RMFYf1EhtERHJBQCfTy0ojGQb8EENF18JmnF0EpHXMzDelJ9qQSelHPf2Yzvlte8ChQHsfNl8Xk9rb9FCePkMj64B79JMGbfXVM9M7Ee9ZFXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766310960; c=relaxed/simple;
	bh=zFcm1C47GuN6VHb7EUQ1wJByQ+u/Qt0u0H3rKPBN05g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EBW/yEE7FPJAi3HINOqThTZVqCLeUAZQQRZsOXnnPb8HRukiLDxGZUWMibP891XdeWUM1afvnEaDYz/Iw2CVpLFMhVTblsHW0C6QeSeMBwddgQMAaAj3xcc5tLhoyLjeKx1Rn5fsE0jdCxR3Vw3hw46ar52c4m3vfYbwICXhsiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtxBCQTq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtxBCQTq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766310959; x=1797846959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zFcm1C47GuN6VHb7EUQ1wJByQ+u/Qt0u0H3rKPBN05g=;
  b=VtxBCQTqu+5lFWnHw6QJMTaip5VGYKMc3KH/ZYqAUA7a6KyLBgPv8gBf
   wnlb4+MSmuf6AadXZnX8JaVc3WYMaedaUTynbYwDCY64xcezgjZRXuHny
   zZx4yngCv6Yas048bcKt/V9iPYWFPqmn6gJk9ptdNJDO5/NcaQGowp71z
   7Jycsia+1+q+K4sSl8U0aoXRuaU1o/ljtDPs1J1nyN1e9+w2w4T26grWG
   msXGNj1aNl1iLjQe9l5LmuVp/4a0HclFYeHd6KXKriR9irVM3T5xqjuM1
   rv3qkP6ZDROAg5VEIMUOoGoDlXgCK466qaHxyXjSvS6Qx/QUFk7pdEpa+
   Q==;
X-CSE-ConnectionGUID: qWJD4zIOQsmsoxaQ0AwlxA==
X-CSE-MsgGUID: TXJtcYgZS0WBRjUJpxWXEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79567364"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79567364"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 01:55:58 -0800
X-CSE-ConnectionGUID: TOmsbnVlSTi8h2rT+H3iNQ==
X-CSE-MsgGUID: ycbzPmJPRfywE9dswfnxig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="222754962"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2025 01:55:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXGAN-0000000050K-1uoO;
	Sun, 21 Dec 2025 09:55:55 +0000
Date: Sun, 21 Dec 2025 10:55:04 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for GPIO_SWNODE_UNDEFINED when selected by
 GKI_HIDDEN_GPIO_CONFIGS
Message-ID: <202512211041.QvN7dGAn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: a9941c3487c04548801b67e356636d615668c152 [12/12] ANDROID: GKI: x86: Add GPIO_SWNODE_UNDEFINED to hidden gpio
config: x86_64-kismet-CONFIG_GPIO_SWNODE_UNDEFINED-CONFIG_GKI_HIDDEN_GPIO_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211041.QvN7dGAn-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211041.QvN7dGAn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211041.QvN7dGAn-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_SWNODE_UNDEFINED when selected by GKI_HIDDEN_GPIO_CONFIGS
   WARNING: unmet direct dependencies detected for GPIO_SWNODE_UNDEFINED
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - GKI_HIDDEN_GPIO_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
