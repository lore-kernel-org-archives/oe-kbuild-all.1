Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F491E486
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 22:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705616378; cv=none; b=CjTFdmvkgTxkgdhJONXJcINzB2KZ2/4rk0GYW8calCG+TnT3r5h/gAAqL+nmQ/q1cm94fSVPKrUFzWudllcgS2tEgSVIPWof+OP3Wvqo0mEzb0XAFwOpWoIozs5XHsyECnBV0F4u8bFUOXyTxzojbC81QVUdeFL30MDJ2eFuHaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705616378; c=relaxed/simple;
	bh=6emG1MjuhSCKJVf+ksRJZ6H3KRvSNxPWDiHQBMc/jvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OkaBgXilcopy6AYZk3XVBK5IDDfSt1XuQrgNe+FBdCsyKFr7dicQzvlofGjdfI5zZt9kQDDmwdfDRdffqEdQSI2mYrF5Gtq6w+LyqT6qbIshQHOdJLPikO9ZvaU7oGVOy01M6RqEgljFS2ONjT1JmtAs22Huq0yBLsVlE2xlcj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGObgzXB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGObgzXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705616376; x=1737152376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6emG1MjuhSCKJVf+ksRJZ6H3KRvSNxPWDiHQBMc/jvU=;
  b=CGObgzXBP6WF3GvBXlX1lqteAVrDd/jyMOn0kEcCeQdXXcsUcyalCgeg
   W9m/QMOCLRb3lxUGysYibhtJ8XNqTtXLhkOB4y0/7EwYrqL9DQ8HVDvCt
   M0HzLlcPGNx0pams8TsykCZyUcZ67rnFbAr4ZbnwwXmWUlLoDT1XNKckL
   coSuZW1vlcqPgx56XCQqc8SZE5twp59c0sC2wI7hpNr3ll4YSrdoO0ct7
   Tv7HYB4Bv01jUatw0AprDiHFtMbkOoi7ssfwltdMf7ILSZ4/GwZkJQQcB
   tdTpY9WmcqBJhODjB8bfbH57V+wKUSh5prssU18Jhetqe4s8FxhEMY8k3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7992366"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7992366"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 14:19:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="875204465"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="875204465"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2024 14:19:34 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQajU-0003Ne-29;
	Thu, 18 Jan 2024 22:19:32 +0000
Date: Fri, 19 Jan 2024 06:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
 15603/15673] drivers/spmi/spmi-pmic-arb.c:193: warning: Function parameter
 or struct member 'masters' not described in 'spmi_pmic_arb'
Message-ID: <202401190604.s9WsqorW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
head:   5cac1bb64a0300d340c5e369489c731b30aa5e79
commit: e21b73fba00f3539873c978ceaa948061687684f [15603/15673] spmi: pmic-arb: Add support for multi-master
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240119/202401190604.s9WsqorW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190604.s9WsqorW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190604.s9WsqorW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spmi/spmi-pmic-arb.c:193: warning: Function parameter or struct member 'core' not described in 'spmi_pmic_arb'
   drivers/spmi/spmi-pmic-arb.c:193: warning: Function parameter or struct member 'core_size' not described in 'spmi_pmic_arb'
   drivers/spmi/spmi-pmic-arb.c:193: warning: Function parameter or struct member 'mapping_table_valid' not described in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Function parameter or struct member 'masters' not described in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Function parameter or struct member 'masters_count' not described in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Excess struct member 'intr' description in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Excess struct member 'cnfg' description in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Excess struct member 'irq' description in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Excess struct member 'min_apid' description in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Excess struct member 'max_apid' description in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Excess struct member 'base_apid' description in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Excess struct member 'apid_count' description in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Excess struct member 'domain' description in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Excess struct member 'ppid_to_apid' description in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Excess struct member 'last_apid' description in 'spmi_pmic_arb'
>> drivers/spmi/spmi-pmic-arb.c:193: warning: Excess struct member 'apid_data' description in 'spmi_pmic_arb'
   drivers/spmi/spmi-pmic-arb.c:254: warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_read_data'
   drivers/spmi/spmi-pmic-arb.c:268: warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_write_data'


vim +193 drivers/spmi/spmi-pmic-arb.c

e21b73fba00f35 Abel Vesa              2024-01-08  149  
39ae93e3a31d0c Kenneth Heitke         2014-02-12  150  /**
80c606a842e6b6 Randy Dunlap           2023-04-13  151   * struct spmi_pmic_arb - SPMI PMIC Arbiter object
39ae93e3a31d0c Kenneth Heitke         2014-02-12  152   *
d0c6ae41d12ad7 Gilad Avidov           2015-03-25  153   * @rd_base:		on v1 "core", on v2 "observer" register base off DT.
d0c6ae41d12ad7 Gilad Avidov           2015-03-25  154   * @wr_base:		on v1 "core", on v2 "chnls"    register base off DT.
39ae93e3a31d0c Kenneth Heitke         2014-02-12  155   * @intr:		address of the SPMI interrupt control registers.
39ae93e3a31d0c Kenneth Heitke         2014-02-12  156   * @cnfg:		address of the PMIC Arbiter configuration registers.
39ae93e3a31d0c Kenneth Heitke         2014-02-12  157   * @lock:		lock to synchronize accesses.
d0c6ae41d12ad7 Gilad Avidov           2015-03-25  158   * @channel:		execution environment channel to use for accesses.
67b563f1f25873 Josh Cartwright        2014-02-12  159   * @irq:		PMIC ARB interrupt.
67b563f1f25873 Josh Cartwright        2014-02-12  160   * @ee:			the current Execution Environment
231601cd22bd60 David Collins          2022-11-10  161   * @bus_instance:	on v7: 0 = primary SPMI bus, 1 = secondary SPMI bus
67b563f1f25873 Josh Cartwright        2014-02-12  162   * @min_apid:		minimum APID (used for bounding IRQ search)
67b563f1f25873 Josh Cartwright        2014-02-12  163   * @max_apid:		maximum APID
231601cd22bd60 David Collins          2022-11-10  164   * @base_apid:		on v7: minimum APID associated with the particular SPMI
231601cd22bd60 David Collins          2022-11-10  165   *			bus instance
231601cd22bd60 David Collins          2022-11-10  166   * @apid_count:		on v5 and v7: number of APIDs associated with the
231601cd22bd60 David Collins          2022-11-10  167   *			particular SPMI bus instance
67b563f1f25873 Josh Cartwright        2014-02-12  168   * @mapping_table:	in-memory copy of PPID -> APID mapping table.
67b563f1f25873 Josh Cartwright        2014-02-12  169   * @domain:		irq domain object for PMIC IRQ domain
67b563f1f25873 Josh Cartwright        2014-02-12  170   * @spmic:		SPMI controller object
d0c6ae41d12ad7 Gilad Avidov           2015-03-25  171   * @ver_ops:		version dependent operations.
231601cd22bd60 David Collins          2022-11-10  172   * @ppid_to_apid:	in-memory copy of PPID -> APID mapping table.
231601cd22bd60 David Collins          2022-11-10  173   * @last_apid:		Highest value APID in use
231601cd22bd60 David Collins          2022-11-10  174   * @apid_data:		Table of data for all APIDs
231601cd22bd60 David Collins          2022-11-10  175   * @max_periphs:	Number of elements in apid_data[]
39ae93e3a31d0c Kenneth Heitke         2014-02-12  176   */
111a10bf3e53ae Abhijeet Dharmapurikar 2017-05-10  177  struct spmi_pmic_arb {
d0c6ae41d12ad7 Gilad Avidov           2015-03-25  178  	void __iomem		*rd_base;
d0c6ae41d12ad7 Gilad Avidov           2015-03-25  179  	void __iomem		*wr_base;
987a9f128b8ad8 Stephen Boyd           2015-11-17  180  	void __iomem		*core;
987a9f128b8ad8 Stephen Boyd           2015-11-17  181  	resource_size_t		core_size;
39ae93e3a31d0c Kenneth Heitke         2014-02-12  182  	raw_spinlock_t		lock;
39ae93e3a31d0c Kenneth Heitke         2014-02-12  183  	u8			channel;
67b563f1f25873 Josh Cartwright        2014-02-12  184  	u8			ee;
231601cd22bd60 David Collins          2022-11-10  185  	u32			bus_instance;
987a9f128b8ad8 Stephen Boyd           2015-11-17  186  	u32			*mapping_table;
987a9f128b8ad8 Stephen Boyd           2015-11-17  187  	DECLARE_BITMAP(mapping_table_valid, PMIC_ARB_MAX_PERIPHS);
67b563f1f25873 Josh Cartwright        2014-02-12  188  	struct spmi_controller	*spmic;
d0c6ae41d12ad7 Gilad Avidov           2015-03-25  189  	const struct pmic_arb_ver_ops *ver_ops;
231601cd22bd60 David Collins          2022-11-10  190  	int			max_periphs;
e21b73fba00f35 Abel Vesa              2024-01-08  191  	struct spmi_pmic_master *masters;
e21b73fba00f35 Abel Vesa              2024-01-08  192  	int			masters_count;
d0c6ae41d12ad7 Gilad Avidov           2015-03-25 @193  };
d0c6ae41d12ad7 Gilad Avidov           2015-03-25  194  

:::::: The code at line 193 was first introduced by commit
:::::: d0c6ae41d12ad7b2ba271f279936327320b6671c spmi: pmic_arb: add support for hw version 2

:::::: TO: Gilad Avidov <gavidov@codeaurora.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
