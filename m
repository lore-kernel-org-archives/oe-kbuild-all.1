Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B844339A1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 20:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738612998; cv=none; b=Aq3FqV2uXH2Ap8wnu0wQhXmOn74Oz4xVx2rsEK8YzLgMqRh2C0XlxbTkncFtjaslimuTiEYmXKo0dkSgwsECV7Oy6X74cwYNATN6woup4XTIXPvQS1oI9zxZ0CAsiNXSQ+icmNTF7mLT6Agbp/NdFYZ8A7zmWXykgPzQcAqjuio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738612998; c=relaxed/simple;
	bh=btTnQUGbsXU2/rqlwNXVlzHu8fQ9WhzZufRTZijCdcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QmZDO/8gVYdvd4BxPit+/NzRwTBPUzzT/fMW877mYu1nsrqL6yvOEO5fwZjPvvwlUed4rop53pQGfbdpB30dAzyqo9Lgaay18IdB1NK++kbxQzS2s9qPU6sVsyantJ0jUetHc4d8DKg/Up1qW/4dQQI1Xk1teE8JqXt6cNY4ZYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8juIiz+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8juIiz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738612996; x=1770148996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=btTnQUGbsXU2/rqlwNXVlzHu8fQ9WhzZufRTZijCdcU=;
  b=h8juIiz+iaj/Uml4ibqaTcCYON4mMAv27J6g0tM3HCLlefdToqreDVLq
   vM2TrA+yTWw1htk/BnNs/yUJUUxsykPNmfKS18r6jKw+Np0AaZ6te3T3t
   dfQ+nWJ3fUZpJTbQQv3VxQazxomXlC5clzaOo4EI3EqqJxIhpyCHfl305
   Z24N56+xS/hdx1DpjUXWEOEn1ksd9AlIA9gUBBbBhsnvvRoWcTNXbFkEz
   YrcZeBGCDSq0dkQuGn++bYMLaKToOW/pu777FH6XdbNLoZw3xo34in0ih
   Onbry/5g48/RH8/DQiKgJqMT+GotTnN5qy2RBS7UuiBdp6exBQI3jHiMa
   g==;
X-CSE-ConnectionGUID: 1qSCeEpHTFib4+ClirjXqQ==
X-CSE-MsgGUID: BZF6PUUBSTqkxOHQ0giKgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42774006"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="42774006"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 12:03:16 -0800
X-CSE-ConnectionGUID: xp5z/y1eRlu/eJPRMz7hSQ==
X-CSE-MsgGUID: E5IDPXBlTf2Iu0MCGgSy+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133637454"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2025 12:03:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf2f2-000rQP-1W;
	Mon, 03 Feb 2025 20:03:12 +0000
Date: Tue, 4 Feb 2025 04:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 57/57]
 drivers/regulator/mt6363-regulator.c:254:34: warning: 'mt_volt_range3'
 defined but not used
Message-ID: <202502040305.qWrYkd8E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6175b263c04ce3f5cf949719af87547964ae77fd
commit: 11792abed5949b15f434d0a53e21e51d5c56e28c [57/57] CHROMIUM: pmic: Add MT8196 SPMI and PMIC driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250204/202502040305.qWrYkd8E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040305.qWrYkd8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040305.qWrYkd8E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/mt6363-regulator.c:254:34: warning: 'mt_volt_range3' defined but not used [-Wunused-const-variable=]
     254 | static const struct linear_range mt_volt_range3[] = {
         |                                  ^~~~~~~~~~~~~~
--
>> drivers/regulator/mt6373-regulator.c:173:34: warning: 'mt_volt_range2' defined but not used [-Wunused-const-variable=]
     173 | static const struct linear_range mt_volt_range2[] = {
         |                                  ^~~~~~~~~~~~~~
>> drivers/regulator/mt6373-regulator.c:169:34: warning: 'mt_volt_range1' defined but not used [-Wunused-const-variable=]
     169 | static const struct linear_range mt_volt_range1[] = {
         |                                  ^~~~~~~~~~~~~~
>> drivers/regulator/mt6373-regulator.c:165:34: warning: 'mt_volt_range0' defined but not used [-Wunused-const-variable=]
     165 | static const struct linear_range mt_volt_range0[] = {
         |                                  ^~~~~~~~~~~~~~
--
>> drivers/spmi/spmi-mtk-pmif.c:460:20: warning: no previous prototype for 'get_current_time_ms' [-Wmissing-prototypes]
     460 | unsigned long long get_current_time_ms(void)
         |                    ^~~~~~~~~~~~~~~~~~~


vim +/mt_volt_range3 +254 drivers/regulator/mt6363-regulator.c

   253	
 > 254	static const struct linear_range mt_volt_range3[] = {
   255		REGULATOR_LINEAR_RANGE(400000, 0, 127, 6250),
   256	};
   257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
