Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D010A1F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 05:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709357600; cv=none; b=WOvGGvDQ7NY5vKY/ZnsnmILImw9tYd6xfZSFJU9In4getyOTeJqmAzVAqiPY14bUnWnV8NEakYOmOVQD4/SKcHadFbQCqh+dTeezPJxh+2i8+J5qTW9PtL1k1T8sv3fCj99kikVT4tVpYbYo8VjLHgc/59TjSEe2u5OzQ3e6sGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709357600; c=relaxed/simple;
	bh=WA0HhIwp6O3PQAAOqa5/b4g56fYs4usH7xrDHq0aY1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mdDLDf3t5vYh56qtw+fTc/H2x/BbbU/TH50iuoR8fsq42QVEjjXXjCDe7tobm5HfKYKd1uXL0aNWle7jH+TBOT5Hhhh+kKj/PWHlfQ2XsGkjJcxKKYC5fMUHMDoLxPwj04x5NFYqYGwhAfUFGL7WqS1ABEqp3raW7suvckGPyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ew18/nHu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ew18/nHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709357597; x=1740893597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WA0HhIwp6O3PQAAOqa5/b4g56fYs4usH7xrDHq0aY1k=;
  b=Ew18/nHuX1GisLDz0pqFQhp1Toz0GRxbfeXXPqnFfl7A0fVFRayS6kf1
   jE0NI0vbtuO//YNic0unh8lOrBvXFdh4MyVthtJyxo9NKRUkHeb6RMxSY
   6VJ1fPxq1PkffpfPmXZ0JbolWbvywQvBGmMmhuxXSDB2075OctZJ3Rvc0
   jO7F7yxzRsZpFf7ZC422R9g+bY16gMdkqpguHfLqkmSkiUQ9fw9OpoKim
   oOWJGrFmim1SE13BejnSQKB1mPkiv3pUIMwpmYz79DQcjqcu6l35euiqD
   1P6Qpil3q9CI+WI4A0oU6L6FnjE3Yrf/fWLhdDPzs7TTzjSyEXxYiPWaw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="15348964"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="15348964"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 21:33:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8829251"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Mar 2024 21:33:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgHzl-000ELZ-1q;
	Sat, 02 Mar 2024 05:33:13 +0000
Date: Sat, 2 Mar 2024 13:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2431/3767]
 drivers/net/dsa/sja1105/sja1105_main.o: warning: objtool: sja1105_fast_age()
 falls through to next function sja1105et_fdb_add.cold()
Message-ID: <202403021321.7y53Xl0J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   236cb940335e3542c9d5ac16b5d8546a0cbbdfc1
commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b [2431/3767] make OPTIMIZE_INLINING config editable
config: x86_64-randconfig-073-20240301 (https://download.01.org/0day-ci/archive/20240302/202403021321.7y53Xl0J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021321.7y53Xl0J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021321.7y53Xl0J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/sja1105/sja1105_main.o: warning: objtool: sja1105_fast_age() falls through to next function sja1105et_fdb_add.cold()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
