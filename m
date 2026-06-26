Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812134207A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 03:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782445999; cv=none; b=JhhJj1WtuQElSDfOPR8FADro6/a1WxkOlXbS3zvsH1gRwpfJ6rE7ywkVpsQCpkezKahK3/LLtovCWTLaUol99SBhLrTsG39i2pF+QMZIIiqz/txoW/F2fB2Hl58pONeED8pYCprZkbQJRwY5X9ImA8HBYnpDMAtRJ3+Mwqpdw3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782445999; c=relaxed/simple;
	bh=8VupaubR3PEnlbbaaQJ4MaQGdZObzfM03ctyf9Il/Ho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YO/487kXRi++yr6YAwX8g1mAkezmrxZs3TQrK0Tl2AKM0pnscsSzLKvhHELagnDeb3RoBMDlXx5wixklStX1V90XegkiJkQImD+lCNJwkFmgMwfHHKE9w2D5C0F/UCANz+ZD+3dgTLAxu+XuUrkUKaTSspzBG4bIPKWAvFqCYJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GU9ZumZh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GU9ZumZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782445998; x=1813981998;
  h=date:from:to:cc:subject:message-id;
  bh=8VupaubR3PEnlbbaaQJ4MaQGdZObzfM03ctyf9Il/Ho=;
  b=GU9ZumZhPyb25o7hZL2kmyHgfLjCCsHpVK6suZZtP3rI4/sepymuCULN
   BugpjGV1+jrkUw1kEOYkE4XqfL6lwn8n7rixuLYDAyAxu+xKnJZeQ6Rl5
   JQgAIJK2vUXXXhVWEtzAalmVm/ClQ2HM1U0JiQkAbJlqV6An+GACbd5H9
   Lg/1v3ljPMALMg/m+B0XzQmvmSsS9HZ0VW2au0oppUlHU1edXuVYis9x+
   3Bk8ZdW1jt2T9M6E+mS4Lyz3BgPoq4kJjkV9GxakyCSf3LRXEYcAsi7gR
   AClA4PrzgKZTIXIck7CF4SCZzha+IzzkH2CS1Q1qJzhqZTDlj5ZPsXb9Q
   w==;
X-CSE-ConnectionGUID: 1LUJ0HzwTlCOmQCsb9lkXg==
X-CSE-MsgGUID: WViBTkpSSxihgcP6dlP88Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100672301"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="100672301"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 20:53:14 -0700
X-CSE-ConnectionGUID: 0+HlbfuBSjSnrd+Kle8w7w==
X-CSE-MsgGUID: KQVWBkdZRYCsCx2CNqDjUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="250828972"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2026 20:53:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcxcL-000000004lF-1z94;
	Fri, 26 Jun 2026 03:53:08 +0000
Date: Fri, 26 Jun 2026 11:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Collins <david.collins@oss.qualcomm.com>
Subject: [superna9999:topic/sm8x50/icc-read-rpmh 3/6] Warning:
 drivers/regulator/qcom-rpmh-regulator.c:177 struct member 'status' not
 described in 'rpmh_vreg'
Message-ID: <202606261135.vOH2vR4C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/superna9999/linux topic/sm8x50/icc-read-rpmh
head:   d934df4387d7d1afc984852d93b9bcd7f0542a05
commit: 324c5ff8b3db3314e1e99295db8086aa0a9d08c8 [3/6] regulator: qcom-rpmh: Add support to read regulator settings
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260626/202606261135.vOH2vR4C-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606261135.vOH2vR4C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606261135.vOH2vR4C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/regulator/qcom-rpmh-regulator.c:177 struct member 'status' not described in 'rpmh_vreg'
>> Warning: drivers/regulator/qcom-rpmh-regulator.c:177 struct member 'status' not described in 'rpmh_vreg'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
