Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49FA296BCD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 17:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740279; cv=none; b=aGIlhVMzuTgGGkZMxklreagKcSGYJ3VJ1D6aEWz7cvYHSUudLF7qtktl6972jJPkHqlyaVZj1J41otNOXEpZhEy0K+mdkc+KtAp0Le+LQODVlbbcFEp2i2O4lfUPqJ2Yh4oipp2wN0C7DUk0YUsI8EITNWY0PCwKvILHTua3orE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740279; c=relaxed/simple;
	bh=TsAthRRgifjuCt+OxkJxE9VkDqlOdWlfu2gcbQokyPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GzyqrlvyWTeNw2GeIjqyYuJnyL9MISh6PgfqZ9T+7xRYf5FyXMroCqMDqF2qPrvfAUIH/EkR66YhZPUjbjWdyRJ4zWebDY/GL2cv9KStptLwIrbrSejLu3fFnRc6llyS+XmSyxnXq/vxy2e8Iuy42YlKpfKmsuYuU4RzzpqWaG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGwN8Vwa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGwN8Vwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784740276; x=1816276276;
  h=date:from:to:cc:subject:message-id;
  bh=TsAthRRgifjuCt+OxkJxE9VkDqlOdWlfu2gcbQokyPk=;
  b=XGwN8VwaeUkSLM/Jd9368oBxjFhTufVjMp4YgKe1ZzzU5NFktCjfGez8
   8eAO9MIBnruvXBVGiss1LuDoJvQMbMRDZFe2Y6/kP/JbMouJLH/gcILFt
   X14XSE3og2VHO2rTOHeB5+eSolCxu98DTHPhKG9+B/xI5bpoVSDhWabrY
   jQqKXnIzHvrHQAjQNsLMaDjuYe2yA2Rgrz+cnu8kTtm/C2J3qLWs+vxCC
   R5xgT+ftsBjXv+WLTShwe4FJM9kcNEySGk40kmcImg+iRK1Rfxhgqp9PZ
   rdJkFDd2YeASfGyJbGesZJocahDdgQX8KYkJvlU3c2swncNB/5WuP20Rz
   g==;
X-CSE-ConnectionGUID: kSmEaDTYQJaF/grioGuBWA==
X-CSE-MsgGUID: 2VhGIvjUQ/y51JXtbaD3yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85255951"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="85255951"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 10:11:13 -0700
X-CSE-ConnectionGUID: ZEN6J4uhS7i6lHriYPlaNw==
X-CSE-MsgGUID: ZSf9GCr/SvCpNTiLB5PCFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="254759423"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jul 2026 10:11:11 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmaTN-000000000W2-3NZx;
	Wed, 22 Jul 2026 17:11:09 +0000
Date: Wed, 22 Jul 2026 19:10:52 +0200
From: kernel test robot <lkp@intel.com>
To: linya14x <linx.yang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>
Subject: [intel-lts:6.18/linux 1/1] kismet: WARNING: unmet direct
 dependencies detected for V4L2_CCI_I2C when selected by VIDEO_LT6911UXC
Message-ID: <202607221915.BpvL7qn3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   af406d75818b912a1b72efa75a20f8bf3e9a3f01
commit: 616f6816d54ce9a0308ea9e7e2a038b6694133e0 [1/1] media: i2c: Add lt6911uxc driver
config: sh-kismet-CONFIG_V4L2_CCI_I2C-CONFIG_VIDEO_LT6911UXC-0-0 (https://download.01.org/0day-ci/archive/20260722/202607221915.BpvL7qn3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260722/202607221915.BpvL7qn3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607221915.BpvL7qn3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for V4L2_CCI_I2C when selected by VIDEO_LT6911UXC
   WARNING: unmet direct dependencies detected for V4L2_CCI_I2C
     Depends on [n]: MEDIA_SUPPORT [=y] && I2C [=n]
     Selected by [y]:
     - VIDEO_LT6911UXC [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && (ACPI || COMPILE_TEST [=y])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
