Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85656AB84
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kaa8Rxhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701805608; x=1733341608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ogYaXSnNaALL7g0Rl/0fHKeKEBc4K9OlKvcSb+pXsO0=;
  b=Kaa8Rxhgg/oMdLWE2pOmlNkFz9g8nbbx9Y3dmbF10O9umqWk4skOROpn
   JI5ruK+3bYGnNWAUtBdyyO7Gjymyd115pxiDBI55FDV39PscgqJQOGhzW
   TS0aYE3Rf/uqRIrbBlooOK75KzoYty5Wq0HnhCzNf/F2OjqRGZya7ioV9
   Ouj9v6srXvqfwiNAw8qEtm7CO2NasGIPBLGT7jRh+FMcMB1qHgz22oIKt
   fh5UHTmwiXdjvH6VSq/gSZ6xE6AFGcuypGSZ3W7Rha8NXEs0YuMEenEnS
   2T93nZ0D1kaaKSH2ie1kFkbOf0RADoVx0UJXYVHSQAH6FxLanCb0Z4GxV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393681732"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="393681732"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 11:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841584432"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="841584432"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 11:46:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAbNU-0009dm-0f;
	Tue, 05 Dec 2023 19:46:44 +0000
Date: Wed, 6 Dec 2023 03:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 939/4884]
 drivers/soc/qcom/pmic_pdcharger_ulog.c:57:34: sparse: sparse: incorrect type
 in initializer (different base types)
Message-ID: <202312060355.M0eJtq4X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: 086fdb48bc65d6fde0f0e7d42dbfb3c00ea52628 [939/4884] soc: qcom: add ADSP PDCharger ULOG driver
config: i386-randconfig-061-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060355.M0eJtq4X-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060355.M0eJtq4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060355.M0eJtq4X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/pmic_pdcharger_ulog.c:57:34: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] owner @@     got int @@
   drivers/soc/qcom/pmic_pdcharger_ulog.c:57:34: sparse:     expected restricted __le32 [usertype] owner
   drivers/soc/qcom/pmic_pdcharger_ulog.c:57:34: sparse:     got int
>> drivers/soc/qcom/pmic_pdcharger_ulog.c:58:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/soc/qcom/pmic_pdcharger_ulog.c:58:33: sparse:     expected restricted __le32 [usertype] type
   drivers/soc/qcom/pmic_pdcharger_ulog.c:58:33: sparse:     got int
>> drivers/soc/qcom/pmic_pdcharger_ulog.c:59:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] opcode @@     got int @@
   drivers/soc/qcom/pmic_pdcharger_ulog.c:59:35: sparse:     expected restricted __le32 [usertype] opcode
   drivers/soc/qcom/pmic_pdcharger_ulog.c:59:35: sparse:     got int

vim +57 drivers/soc/qcom/pmic_pdcharger_ulog.c

    52	
    53	static int pmic_pdcharger_ulog_request(struct pmic_pdcharger_ulog *pg)
    54	{
    55		struct get_ulog_req_msg req_msg = {
    56			.hdr = {
  > 57				.owner = MSG_OWNER_CHG_ULOG,
  > 58				.type = MSG_TYPE_REQ_RESP,
  > 59				.opcode = GET_CHG_ULOG_REQ
    60			},
    61			.log_size = MAX_ULOG_SIZE
    62		};
    63	
    64		return pmic_pdcharger_ulog_write_async(pg, &req_msg, sizeof(req_msg));
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
