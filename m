Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731F82BB13
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 05:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761198668; cv=none; b=X1K+hlSKHmlytKp8OY2l6p7uCR1k1gXb1OVG+FjoJdIotio7UDyynWcA3o7Va5nhZwk/4rtIFrmPW7E2REY41eCosshITvSpleM66Q4BaB6V6WOqcG0TkjrfQB7+Og8d9MBw5whdexoJ59OgzYyBs7rohS8rMDbmswMbEBrIVZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761198668; c=relaxed/simple;
	bh=+yx6SQIysKEkkUdDgXxDqcnSrPlRjXpfKmb1PrN370Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fz70IL+WnSjK4u9FMvJTWEQCdFp3SPFUcZ4nR8eyCNbFL/0eZHCpomdvSlPzqcjZHTOJf0jRLVMA6GVb6gyDz254O5EvD8MTjgyJAPXc6ecgn8FGHVH24vISLbEH9NOq5PF4C895t30YtJB7a0nYqXGpJ7uBy+iaelEp3cp2Bhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJTNA+0n; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJTNA+0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761198667; x=1792734667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+yx6SQIysKEkkUdDgXxDqcnSrPlRjXpfKmb1PrN370Y=;
  b=oJTNA+0nCmnaj9VYszHjl335JKkG/hyEyBAf9cSKX8ur/JWrtFQXvX6W
   +Rpp+xP3gf6HQf7rPyGYNc8+jemLY8EDYmBcCmdlW8ryhehub1NgxZGmK
   o8rNkvpK1RAtxbCjMhkixrhjG6I0HTzc9euN8UMh+Y6KjWvX0WOS93paQ
   kq3QpTWDH86XlXZ1jTu84qd54Jkm0C93iEV2jyrzWswXv1DItRxN0HyMW
   oIKNJcaS1+UZS+lZAZjhZ5NN0vaW2SlrkNm2KqWdpkEABSwhTBfj5eshe
   dGxQNiA8jKPHnKKKn0DRTvBt5gEdSE9UsN/EHW+vJjJjrGFbrUJ62jglf
   A==;
X-CSE-ConnectionGUID: faeisnbvRKKwMN33J6BAGQ==
X-CSE-MsgGUID: nPvlBGu/TguElj4/PTVtAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74796136"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="74796136"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 22:51:04 -0700
X-CSE-ConnectionGUID: HZxoXvX2QaC8242Zfu6+Aw==
X-CSE-MsgGUID: 8QsvDuovQFqsCZCn+yWsFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="188355158"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Oct 2025 22:51:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBoDW-000D4j-07;
	Thu, 23 Oct 2025 05:50:38 +0000
Date: Thu, 23 Oct 2025 13:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: [ulfh-pm:next 11/17]
 drivers/pmdomain/mediatek/mtk-pm-domains.c:124:30: error: storage size of
 'res' isn't known
Message-ID: <202510231317.ZZxNaFG0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git next
head:   652451186a929be91002a246ab5c4947b46cb0fb
commit: df4e9ec1ed8604380fa4508300dd0e6d60ddf4f4 [11/17] pmdomain: mediatek: Add support for secure HWCCF infra power on
config: x86_64-buildonly-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231317.ZZxNaFG0-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231317.ZZxNaFG0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231317.ZZxNaFG0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pmdomain/mediatek/mtk-pm-domains.c: In function 'scpsys_sec_infra_power_on':
>> drivers/pmdomain/mediatek/mtk-pm-domains.c:124:30: error: storage size of 'res' isn't known
     124 |         struct arm_smccc_res res;
         |                              ^~~
>> drivers/pmdomain/mediatek/mtk-pm-domains.c:127:9: error: implicit declaration of function 'arm_smccc_smc' [-Werror=implicit-function-declaration]
     127 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
         |         ^~~~~~~~~~~~~
   In file included from drivers/pmdomain/mediatek/mtk-pm-domains.c:18:
>> include/linux/soc/mediatek/mtk_sip_svc.h:22:9: error: implicit declaration of function 'ARM_SMCCC_CALL_VAL' [-Werror=implicit-function-declaration]
      22 |         ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pmdomain/mediatek/mtk-pm-domains.c:55:41: note: in expansion of macro 'MTK_SIP_SMC_CMD'
      55 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
         |                                         ^~~~~~~~~~~~~~~
   drivers/pmdomain/mediatek/mtk-pm-domains.c:127:23: note: in expansion of macro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
     127 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/soc/mediatek/mtk_sip_svc.h:22:28: error: 'ARM_SMCCC_FAST_CALL' undeclared (first use in this function)
      22 |         ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
         |                            ^~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/mediatek/mtk-pm-domains.c:55:41: note: in expansion of macro 'MTK_SIP_SMC_CMD'
      55 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
         |                                         ^~~~~~~~~~~~~~~
   drivers/pmdomain/mediatek/mtk-pm-domains.c:127:23: note: in expansion of macro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
     127 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/soc/mediatek/mtk_sip_svc.h:22:28: note: each undeclared identifier is reported only once for each function it appears in
      22 |         ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
         |                            ^~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/mediatek/mtk-pm-domains.c:55:41: note: in expansion of macro 'MTK_SIP_SMC_CMD'
      55 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
         |                                         ^~~~~~~~~~~~~~~
   drivers/pmdomain/mediatek/mtk-pm-domains.c:127:23: note: in expansion of macro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
     127 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/soc/mediatek/mtk_sip_svc.h:18:41: error: 'ARM_SMCCC_SMC_32' undeclared (first use in this function)
      18 | #define MTK_SIP_SMC_CONVENTION          ARM_SMCCC_SMC_32
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/soc/mediatek/mtk_sip_svc.h:22:49: note: in expansion of macro 'MTK_SIP_SMC_CONVENTION'
      22 |         ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/mediatek/mtk-pm-domains.c:55:41: note: in expansion of macro 'MTK_SIP_SMC_CMD'
      55 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
         |                                         ^~~~~~~~~~~~~~~
   drivers/pmdomain/mediatek/mtk-pm-domains.c:127:23: note: in expansion of macro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
     127 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/soc/mediatek/mtk_sip_svc.h:23:28: error: 'ARM_SMCCC_OWNER_SIP' undeclared (first use in this function)
      23 |                            ARM_SMCCC_OWNER_SIP, fn_id)
         |                            ^~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/mediatek/mtk-pm-domains.c:55:41: note: in expansion of macro 'MTK_SIP_SMC_CMD'
      55 | #define MTK_SIP_KERNEL_HWCCF_CONTROL    MTK_SIP_SMC_CMD(0x540)
         |                                         ^~~~~~~~~~~~~~~
   drivers/pmdomain/mediatek/mtk-pm-domains.c:127:23: note: in expansion of macro 'MTK_SIP_KERNEL_HWCCF_CONTROL'
     127 |         arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pmdomain/mediatek/mtk-pm-domains.c:124:30: warning: unused variable 'res' [-Wunused-variable]
     124 |         struct arm_smccc_res res;
         |                              ^~~
   drivers/pmdomain/mediatek/mtk-pm-domains.c:129:1: warning: control reaches end of non-void function [-Wreturn-type]
     129 | }
         | ^
   cc1: some warnings being treated as errors


vim +124 drivers/pmdomain/mediatek/mtk-pm-domains.c

   121	
   122	static int scpsys_sec_infra_power_on(bool on)
   123	{
 > 124		struct arm_smccc_res res;
   125		unsigned long cmd = on ? 1 : 0;
   126	
 > 127		arm_smccc_smc(MTK_SIP_KERNEL_HWCCF_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
   128		return res.a0;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
