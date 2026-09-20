Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0733986F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Sep 2026 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789890926; cv=none; b=rv0YrGglmRC/LcsPFw/T4kr7Cu6BsL0Uyl7l+8xxtZjfIeK3A1cEco9n+hUsHXBpXkRp5DszYWW+vzR8r83BoJfh8YscxRycMRWGZIztrTfbksA26u+UZxz5lfaUdYHu5mBVbpeJTIjf/YODeAzuexaXcDSeAhrV9F9CYv7WghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789890926; c=relaxed/simple;
	bh=kUv71L7jcfpl5j+u6/GEwpFTRu97KFEJdWIvfSbFlNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ctfvi1xLlMmePbmhCgCsLH4LVJUILemU+J96x3QA5o1IJWn8psiJS0+dsOrgBJ23ww8B1zFPNQzJ1p7R28eW402UDX3LrpRUYxyNMfn9gV1Bdqe9QxamLAqdsG2VB+oGWMtPDPLZfsRyJoXaY77npuoqiUWygSnlOce5osbvVYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8p9krcm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8p9krcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789890923; x=1821426923;
  h=date:from:to:cc:subject:message-id;
  bh=kUv71L7jcfpl5j+u6/GEwpFTRu97KFEJdWIvfSbFlNg=;
  b=P8p9krcm3aLp4m/mdmrtopOepwO9+yGwuGWl/E447gAI8xtYCSgpJq8g
   RUtyX5L3pyzO9Jr8BiEjLkFgRDl0BPctLoMS3JFkOFj4W6faKBSDDOB/a
   F06+SWWetF/i021WF+vjTZKfJfbFHaesz/XYez56t3qSdCXyHvQOi+PR9
   yWafWMJPblloLDrnHRdAHFavJx0oyFUFUAGdnEdQ23zHvIDJYFVnrAIMO
   dzopZ72sHuklJ0a+xbfdpxoQArp7mfqohz5b3WRClMzdD8WfLzx8TQtBz
   FNu8J92PC2BHfc5J6g1LCQO+ZikkubaB3uLbp7hsFmkizKFRIzRxEnNnO
   w==;
X-CSE-ConnectionGUID: sHRGUTMCSDmG+10xpwKJEQ==
X-CSE-MsgGUID: EVmErMbBRwS4++TW9SP48w==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="94224019"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="94224019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 00:55:23 -0700
X-CSE-ConnectionGUID: Rlm0cG5kReOlOfOoKYv6lA==
X-CSE-MsgGUID: NA6L1WHiSvC1fHm53tPdrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="268747359"
Received: from igk-lkp-server01.igk.intel.com (HELO 24469cc966a8) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 20 Sep 2026 00:55:20 -0700
Received: from kbuild by 24469cc966a8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8COG-0000000005b-485E;
	Sun, 20 Sep 2026 07:55:12 +0000
Date: Sun, 20 Sep 2026 09:54:57 +0200
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [linux-next:master 4309/8449]
 drivers/firmware/qcom/qcom_scm.c:779:undefined reference to
 `qcom_tzmem_alloc'
Message-ID: <202609200900.rQlnFh04-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
commit: 8fecd3194de338bdc0c57597be61fdcf33e1832d [4309/8449] firmware: QCOM interfaces should depend on ARCH_QCOM
config: x86_64-randconfig-2100-20260919 (https://download.01.org/0day-ci/archive/20260920/202609200900.rQlnFh04-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609200900.rQlnFh04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609200900.rQlnFh04-lkp@intel.com/

Note: the linux-next/master HEAD 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: drivers/firmware/qcom/qcom_scm.o: in function `__qcom_scm_pas_get_rsc_table':
>> drivers/firmware/qcom/qcom_scm.c:779:(.text+0x2ea4): undefined reference to `qcom_tzmem_alloc'
>> ld: drivers/firmware/qcom/qcom_scm.c:783:(.text+0x2ebd): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.c:785:(.text+0x2ed5): undefined reference to `qcom_tzmem_to_phys'
>> ld: drivers/firmware/qcom/qcom_scm.c:810:(.text+0x2fba): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_lmh_dcvsh':
   drivers/firmware/qcom/qcom_scm.c:1999:(.text+0x314a): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:2011:(.text+0x325a): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `__free_qcom_tzmem':
>> include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x329f): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_ice_set_key':
   drivers/firmware/qcom/qcom_scm.c:1555:(.text+0x353f): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:1561:(.text+0x3563): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `__free_qcom_tzmem':
   include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x35b3): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_derive_sw_secret':
   drivers/firmware/qcom/qcom_scm.c:1612:(.text+0x36df): undefined reference to `qcom_tzmem_alloc'
>> ld: drivers/firmware/qcom/qcom_scm.c:1618:(.text+0x3732): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:1625:(.text+0x375a): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.c:1627:(.text+0x376c): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `__free_qcom_tzmem':
   include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x37f1): undefined reference to `qcom_tzmem_free'
>> ld: include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x37fe): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_generate_ice_key':
   drivers/firmware/qcom/qcom_scm.c:1661:(.text+0x3911): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:1667:(.text+0x392a): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `__free_qcom_tzmem':
   include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x39a5): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_prepare_ice_key':
   drivers/firmware/qcom/qcom_scm.c:1704:(.text+0x3adf): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:1710:(.text+0x3b32): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:1717:(.text+0x3b5a): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.c:1719:(.text+0x3b6c): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `__free_qcom_tzmem':
   include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x3bf1): undefined reference to `qcom_tzmem_free'
   ld: include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x3bfe): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_import_ice_key':
   drivers/firmware/qcom/qcom_scm.c:1757:(.text+0x3d1f): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:1763:(.text+0x3d72): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:1770:(.text+0x3d9a): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.c:1772:(.text+0x3dac): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `__free_qcom_tzmem':
   include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x3e31): undefined reference to `qcom_tzmem_free'
   ld: include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x3e3e): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_pas_prep_and_init_image':
   drivers/firmware/qcom/qcom_scm.c:640:(.text+0x47ef): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:645:(.text+0x4816): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.c:649:(.text+0x486e): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `__qcom_scm_pas_get_rsc_table2':
   drivers/firmware/qcom/qcom_scm.c:846:(.text+0x4ff7): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:870:(.text+0x5116): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.c:876:(.text+0x5146): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.c:879:(.text+0x5154): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_assign_mem':
   drivers/firmware/qcom/qcom_scm.c:1370:(.text+0x55a2): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:1375:(.text+0x55c2): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `__free_qcom_tzmem':
   include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x591c): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_qseecom_app_get_id':
   drivers/firmware/qcom/qcom_scm.c:2212:(.text+0x6d6e): undefined reference to `qcom_tzmem_alloc'
   ld: drivers/firmware/qcom/qcom_scm.c:2224:(.text+0x6db7): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `__free_qcom_tzmem':
   include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x6ea3): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_qseecom_app_send':
>> drivers/firmware/qcom/qcom_scm.c:2271:(.text+0x6fa0): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.c:2272:(.text+0x6fab): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `qcom_scm_probe':
>> drivers/firmware/qcom/qcom_scm.c:2853:(.text+0x82c3): undefined reference to `qcom_tzmem_enable'
>> ld: drivers/firmware/qcom/qcom_scm.c:2863:(.text+0x836c): undefined reference to `devm_qcom_tzmem_pool_new'
   ld: drivers/firmware/qcom/qcom_scm.o: in function `__qcom_scm_pas_metadata_release':
>> drivers/firmware/qcom/qcom_scm.c:710:(.text+0x8abc): undefined reference to `qcom_tzmem_free'
   ld: drivers/firmware/qcom/qcom_scm-smc.o: in function `__scm_smc_call':
>> drivers/firmware/qcom/qcom_scm-smc.c:187:(.text+0x3b8a): undefined reference to `qcom_tzmem_alloc'
>> ld: drivers/firmware/qcom/qcom_scm-smc.c:207:(.text+0x3ced): undefined reference to `qcom_tzmem_to_phys'
   ld: drivers/firmware/qcom/qcom_scm-smc.o: in function `__free_qcom_tzmem':
   include/linux/firmware/qcom/qcom_tzmem.h:61:(.text+0x3ee9): undefined reference to `qcom_tzmem_free'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_SCM
   Depends on [n]: ARCH_QCOM || COMPILE_TEST [=n]
   Selected by [y]:
   - QCOM_MDT_LOADER [=y]


vim +779 drivers/firmware/qcom/qcom_scm.c

3a99f121fe0bfa drivers/firmware/qcom_scm.c      Bjorn Andersson    2022-01-27  705  
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  706  static void __qcom_scm_pas_metadata_release(struct device *dev,
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  707  					    struct qcom_pas_context *ctx)
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  708  {
b019925838bca1 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  709  	if (ctx->use_tzmem)
b019925838bca1 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05 @710  		qcom_tzmem_free(ctx->ptr);
b019925838bca1 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  711  	else
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  712  		dma_free_coherent(dev, ctx->size, ctx->ptr, ctx->phys);
3a99f121fe0bfa drivers/firmware/qcom_scm.c      Bjorn Andersson    2022-01-27  713  
3a99f121fe0bfa drivers/firmware/qcom_scm.c      Bjorn Andersson    2022-01-27  714  	ctx->ptr = NULL;
3a99f121fe0bfa drivers/firmware/qcom_scm.c      Bjorn Andersson    2022-01-27  715  }
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  716  
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  717  void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  718  {
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  719  	__qcom_scm_pas_metadata_release(__scm->dev,
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  720  					(struct qcom_pas_context *)ctx);
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  721  }
2784e3b0cc028f drivers/firmware/qcom_scm.c      Guru Das Srinagesh 2023-07-27  722  EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
3a99f121fe0bfa drivers/firmware/qcom_scm.c      Bjorn Andersson    2022-01-27  723  
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  724  static int __qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  725  				    phys_addr_t addr, phys_addr_t size)
f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson    2015-09-23  726  {
f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson    2015-09-23  727  	int ret;
57d3b816718c1c drivers/firmware/qcom_scm.c      Elliot Berman      2020-01-07  728  	struct qcom_scm_desc desc = {
57d3b816718c1c drivers/firmware/qcom_scm.c      Elliot Berman      2020-01-07  729  		.svc = QCOM_SCM_SVC_PIL,
57d3b816718c1c drivers/firmware/qcom_scm.c      Elliot Berman      2020-01-07  730  		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
57d3b816718c1c drivers/firmware/qcom_scm.c      Elliot Berman      2020-01-07  731  		.arginfo = QCOM_SCM_ARGS(3),
69054348cc1c2d drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  732  		.args[0] = pas_id,
57d3b816718c1c drivers/firmware/qcom_scm.c      Elliot Berman      2020-01-07  733  		.args[1] = addr,
57d3b816718c1c drivers/firmware/qcom_scm.c      Elliot Berman      2020-01-07  734  		.args[2] = size,
57d3b816718c1c drivers/firmware/qcom_scm.c      Elliot Berman      2020-01-07  735  		.owner = ARM_SMCCC_OWNER_SIP,
57d3b816718c1c drivers/firmware/qcom_scm.c      Elliot Berman      2020-01-07  736  	};
57d3b816718c1c drivers/firmware/qcom_scm.c      Elliot Berman      2020-01-07  737  	struct qcom_scm_res res;
f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson    2015-09-23  738  
f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson    2015-09-23  739  	ret = qcom_scm_clk_enable();
f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson    2015-09-23  740  	if (ret)
f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson    2015-09-23  741  		return ret;
f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson    2015-09-23  742  
65b7ebda502861 drivers/firmware/qcom_scm.c      Sibi Sankar        2022-05-23  743  	ret = qcom_scm_bw_enable();
65b7ebda502861 drivers/firmware/qcom_scm.c      Sibi Sankar        2022-05-23  744  	if (ret)
0c50b7fcf2773b drivers/firmware/qcom/qcom_scm.c Gabor Juhos        2024-03-04  745  		goto disable_clk;
65b7ebda502861 drivers/firmware/qcom_scm.c      Sibi Sankar        2022-05-23  746  
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  747  	ret = qcom_scm_call(dev, &desc, &res);
65b7ebda502861 drivers/firmware/qcom_scm.c      Sibi Sankar        2022-05-23  748  	qcom_scm_bw_disable();
0c50b7fcf2773b drivers/firmware/qcom/qcom_scm.c Gabor Juhos        2024-03-04  749  
0c50b7fcf2773b drivers/firmware/qcom/qcom_scm.c Gabor Juhos        2024-03-04  750  disable_clk:
f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson    2015-09-23  751  	qcom_scm_clk_disable();
f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson    2015-09-23  752  
57d3b816718c1c drivers/firmware/qcom_scm.c      Elliot Berman      2020-01-07  753  	return ret ? : res.result[0];
f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson    2015-09-23  754  }
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  755  
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  756  int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  757  {
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  758  	return __qcom_scm_pas_mem_setup(__scm->dev, pas_id, addr, size);
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  759  }
2784e3b0cc028f drivers/firmware/qcom_scm.c      Guru Das Srinagesh 2023-07-27  760  EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
f01e90fe34f563 drivers/firmware/qcom_scm.c      Bjorn Andersson    2015-09-23  761  
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  762  static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  763  					  void *input_rt_tzm,
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  764  					  size_t input_rt_size,
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  765  					  size_t *output_rt_size)
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  766  {
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  767  	struct qcom_scm_desc desc = {
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  768  		.svc = QCOM_SCM_SVC_PIL,
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  769  		.cmd = QCOM_SCM_PIL_PAS_GET_RSCTABLE,
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  770  		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_VAL, QCOM_SCM_RO, QCOM_SCM_VAL,
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  771  					 QCOM_SCM_RW, QCOM_SCM_VAL),
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  772  		.args[0] = pas_id,
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  773  		.owner = ARM_SMCCC_OWNER_SIP,
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  774  	};
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  775  	struct qcom_scm_res res;
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  776  	void *output_rt_tzm;
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  777  	int ret;
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  778  
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05 @779  	output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  780  	if (!output_rt_tzm)
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  781  		return ERR_PTR(-ENOMEM);
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  782  
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05 @783  	desc.args[1] = qcom_tzmem_to_phys(input_rt_tzm);
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  784  	desc.args[2] = input_rt_size;
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  785  	desc.args[3] = qcom_tzmem_to_phys(output_rt_tzm);
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  786  	desc.args[4] = *output_rt_size;
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  787  
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  788  	/*
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  789  	 * Whether SMC fail or pass, res.result[2] will hold actual resource table
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  790  	 * size.
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  791  	 *
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  792  	 * If passed 'output_rt_size' buffer size is not sufficient to hold the
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  793  	 * resource table TrustZone sends, response code in res.result[1] as
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  794  	 * RSCTABLE_BUFFER_NOT_SUFFICIENT so that caller can retry this SMC call
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  795  	 * with output_rt_tzm buffer with res.result[2] size however, It should not
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  796  	 * be of unresonable size.
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  797  	 */
5c1a2975d23c51 drivers/firmware/qcom/qcom_scm.c Sumit Garg         2026-07-02  798  	ret = qcom_scm_call(dev, &desc, &res);
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  799  	if (!ret && res.result[2] > SZ_1G) {
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  800  		ret = -E2BIG;
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  801  		goto free_output_rt;
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  802  	}
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  803  
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  804  	*output_rt_size = res.result[2];
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  805  	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  806  		ret = -EOVERFLOW;
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  807  
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  808  free_output_rt:
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  809  	if (ret)
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05 @810  		qcom_tzmem_free(output_rt_tzm);
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  811  
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  812  	return ret ? ERR_PTR(ret) : output_rt_tzm;
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  813  }
8b9d2050cfa0c2 drivers/firmware/qcom/qcom_scm.c Mukesh Ojha        2026-01-05  814  

:::::: The code at line 779 was first introduced by commit
:::::: 8b9d2050cfa0c22c05622df103e366933fc045ed firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table

:::::: TO: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
