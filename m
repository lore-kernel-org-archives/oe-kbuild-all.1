Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C875C101C6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 19:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XN5tJqux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703790433; x=1735326433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3oGG2N+upEE5WhA/kjXRq83aKvIZhc1M8Frw5h9M0wo=;
  b=XN5tJquxUnCxjF3oUSVg5/z1uHG3xrN5VIC7dcN8oMjouX4tNTvvbz+D
   sK/Pi8tYa2nWJlYaYEfjwaFWrFbzrq7ysD6fErYMse8H/IPuXVQy06Uh/
   7zBn8TcNpb7QI5AH81cVUHK+25RwjTQqysDIUWiR7erY3lPBOzVe2iOF6
   3snDGIRmgXN6qg/Gn0xp4iuWCkfdGVhphk2OUk/IQg0NAhvgwm2ECtL8E
   WOEma3QBNGq3f3kHEFcI5ygbORBLo0t1zXWGuL4zQS7H8uRgIMcm2yY3v
   iXdmvUo2Al6snpgOMQxDCPVIoDfS4d+Dx3LkGnwFb77yFz1x4f9vUwKHB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="482759495"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="482759495"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 11:07:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="728388751"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="728388751"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Dec 2023 11:07:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIvim-000Gkj-1c;
	Thu, 28 Dec 2023 19:07:08 +0000
Date: Fri, 29 Dec 2023 03:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 5028/10295] kismet: WARNING: unmet direct
 dependencies detected for SC_GCC_8280XP when selected by SC_CAMCC_8280XP
Message-ID: <202312290358.boTFampM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20d857259d7d10cd0d5e8b60608455986167cfad
commit: ff93872a9c6168992ee41f2da9d9c3b8a6f8a8e5 [5028/10295] clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC
config: arm-kismet-CONFIG_SC_GCC_8280XP-CONFIG_SC_CAMCC_8280XP-0-0 (https://download.01.org/0day-ci/archive/20231229/202312290358.boTFampM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231229/202312290358.boTFampM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312290358.boTFampM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SC_GCC_8280XP when selected by SC_CAMCC_8280XP
   
   WARNING: unmet direct dependencies detected for SC_GCC_8280XP
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SC_CAMCC_8280XP [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
