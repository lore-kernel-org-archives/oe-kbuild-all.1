Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3337F742
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 18:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683509; cv=none; b=BoOl2lTRKNpguB9fQTYI3rY7T0yFdGgjQnaY/bzmwjsZXOBxeARtrUY3WbEwYbVZAuS0u+Z7SBqCvKlHe+IiwLragDWwOgNtFQakaRJ7I/5sOfoZPhGfMVoIY9xy3Nnihac4wKCW21fotLCwCpo/gpUmuAHrb9rtl9Z/CdKhKmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683509; c=relaxed/simple;
	bh=QxIlZAK6vl48kaeE+X1DpbkkgRt0RDbtldX6hQWivhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xzkb93rUSoCnXGXivlMYAEZ5OLFqejY2lZvHi1Wb+2LtCeLi9kTjof/RXFGQoyw4qEH0bBYtIHKwdlh9d3jnARwI+FQyRv1FAYQV/muBUCgGN3xltGf/ctB5jF2JKm944MIVnsfBLshX/qq5ep1G2Pl5GDV3QCP3XMNXib6JyyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRsMhUXv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRsMhUXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787683508; x=1819219508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QxIlZAK6vl48kaeE+X1DpbkkgRt0RDbtldX6hQWivhc=;
  b=GRsMhUXvX1dfwkjOzE3zMNNQsQTfKxVZZfbYJH72XY6hSVBLIgbXDo9k
   7r7wmZ1fgHUfpu6MrYI4gLITs2IUdeRSPoqPloGNzpbNlTzebqSoiaor9
   LAawRgQQalnsMnjsjrewKPVIBqTn1BiVe2xLP/S3Lp9dugoW68x+9xcrH
   cxDj2P/P0DL+5V9SJyoyrZ8DcnsZ7huooo/0Oica9Vj60HuZgoZ2R2mz7
   h4vqHxd1K11edmqf1rZSqUK1wPnA5htkTo5ZK/1YmYj7QqJRnVc8QoWZ1
   wcb+A+kKkw8gO9+HwWnbyioGL3vKBopriT7kgd4GZCaYcrXusU84hrUYc
   w==;
X-CSE-ConnectionGUID: HYb4pUQwRKmZZVHS+RaVzA==
X-CSE-MsgGUID: lBUZvlAVRWeMD0E+yD+QXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99684723"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="99684723"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 11:45:08 -0700
X-CSE-ConnectionGUID: EKU5+02eT5+OlWdlEicYeg==
X-CSE-MsgGUID: iJaSD1HfQCe+4l+loLNqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="261221097"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2026 11:45:06 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyw8t-000000000Az-3pFK;
	Tue, 25 Aug 2026 18:45:03 +0000
Date: Tue, 25 Aug 2026 20:44:42 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:m-5 34/106] Warning: lib/dynamic_debug.c:739 expecting
 prototype for param_set_dyndbg_classes(). Prototype was for
 param_set_dyndbg_module_classes() instead
Message-ID: <202608252035.G9MeO4QE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git m-5
head:   f4586ca88dc640ffb7dea6725f1b347cd3c51bf9
commit: 6e37c6703e07f0acb7eeddc1cd997bdedc3d5c70 [34/106] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260825/202608252035.G9MeO4QE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608252035.G9MeO4QE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608252035.G9MeO4QE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/dynamic_debug.c:739 expecting prototype for param_set_dyndbg_classes(). Prototype was for param_set_dyndbg_module_classes() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
