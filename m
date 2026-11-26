Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715303;
	b=y32WM7CpxIidMmYmaZazuJLHnrFCTULLf/XxoLa/GoTxf1vanrixFEq/8qIAzE2lkb+r
	 B2X5s09K//kL7A4jxss8aRWLOHSxl29At2kcNxa97VNU8QcvnspL5G7KzdcpsrD0znH/k
	 EFomeLaE3L8BsfJ1Fd3vNQmacSizVr8v4LfKVZQeuZasq2utwtkQ/2sfRi66BxJhT2cZ8
	 ceClNcOW03cI5a514cSGJ6LgydnMuQaaaUar9RmcgHbkzuOMFlUySGNmYKmkV1zpeu3xv
	 oiXNPWII3Gf649J1y5JJ/NnGx+sIK0cg2TiRF8SsZOtnPwMn6w11aEX5TBy53HtZeyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715303;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iBfH5LmdniSXDM9WjrLhOPvNWX+kFuFLHay1i8Z/NxU=;
	b=380G/HZWL2NAYsGi3EcE2FCXjiNhOCoui1SzJPljCSd1X/VoWY4sk3ymtojOrboeLF1P
	 NQiTjpHtAFGd7pK2sLJkkWbH+YpULEGKYEEKHT0GKtvdL579QR45xFbF5iD0CFk4wPG92
	 GzOHZrqHPrXweoYtP7ZDVKuExs039Dj17InMtPm2DomRHQjWLrXhPSjn+IRqnEOb2dg3s
	 tlyiLjCPeo0a7/mUG8hENiBdbjCE7xQTfOB0G6KKdhH634UTFDjV4yMrr/3R8MOfLAOw1
	 HnEocwk0PZ2Rphe4eYL+QfquUS8o97z2iQJCt8/t0mWR+VxJDtyee/i209+p0AGNMPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ye042TuG;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B533606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 17:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B533606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ye042TuG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795715301; x=1827251301;
  h=date:from:to:cc:subject:message-id;
  bh=0ecQpSRTMiz8iY4nq14mAI63Pb603DqTNrArF1YbhVo=;
  b=Ye042TuGz90K+o0GlmvbMcwRfgzbWm2a8Q80+gGCPUFNhH6gjuIjEYjE
   SIkvK8OdShhw9DmRp78xJpzAd22h4c6Nr5IO9E+lcmXZ+lxe6SXfSXc8t
   caq/JsZTOn/MsS3uQnEOJsHV+vBqMc5/zVSBtKFeIj2+GqlJsPjZRFVmC
   vdUIX+r0iZSVjsaJ0rpLrZQjM/rQOVGL1jwzicmWyBDMQ1AN3ihoK12Vr
   P/YleUwmffNxy7w7Ro/lhpxI7O3uEthDmazgmvm4aUrex0EpunXf5a9R8
   EU75xs4Gye6NlDG2mQ3NqtrjTsvDW3+oxZKYzMWbZxIZ79FVkKViK/NJt
   A==;
X-CSE-ConnectionGUID: 5RujP3LMT3WSKn1/Bi3JQQ==
X-CSE-MsgGUID: NTpYPTBcShmsRAO5hCqbew==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4649008"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4649008"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 09:48:20 -0800
X-CSE-ConnectionGUID: N8bZUE28R2+WRvEv3K32kg==
X-CSE-MsgGUID: 1ovxg8BcRra/EzH+kBjhRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12003339"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2026 09:48:18 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWdZw-00000000094-2m8j;
	Thu, 26 Nov 2026 17:48:16 +0000
Date: Thu, 26 Nov 2026 18:47:41 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 65/65]
 drivers/firmware/qcom_scm.c:367: warning: Function parameter or member
 'flags' not described in 'qcom_scm_cpu_power_down'
Message-ID: <20261126184547.1MVE3CDW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Dmitry,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   36e3098ebf6d37570aab9dc5f8f4d24bd5ffdd06
commit: 32240232b2a3b2dd7b0178f93381cad91c062475 [65/65] thermal/drivers/qcom: Make LMH select QCOM_SCM
config: arm-randconfig-r2106-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126184547.1MVE3CDW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126184547.1MVE3CDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126184547.1MVE3CDW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/qcom_scm.c:198: warning: Function parameter or member 'res' not described in 'qcom_scm_call'
   drivers/firmware/qcom_scm.c:198: warning: Excess function parameter 'svc_id' description in 'qcom_scm_call'
   drivers/firmware/qcom_scm.c:198: warning: Excess function parameter 'cmd_id' description in 'qcom_scm_call'
   drivers/firmware/qcom_scm.c:226: warning: Excess function parameter 'svc_id' description in 'qcom_scm_call_atomic'
   drivers/firmware/qcom_scm.c:226: warning: Excess function parameter 'cmd_id' description in 'qcom_scm_call_atomic'
>> drivers/firmware/qcom_scm.c:367: warning: Function parameter or member 'flags' not described in 'qcom_scm_cpu_power_down'


vim +367 drivers/firmware/qcom_scm.c

9a434cee773ae15 Elliot Berman      2020-01-07  185  
9a434cee773ae15 Elliot Berman      2020-01-07  186  /**
9a434cee773ae15 Elliot Berman      2020-01-07  187   * qcom_scm_call() - Invoke a syscall in the secure world
9a434cee773ae15 Elliot Berman      2020-01-07  188   * @dev:	device
9a434cee773ae15 Elliot Berman      2020-01-07  189   * @svc_id:	service identifier
9a434cee773ae15 Elliot Berman      2020-01-07  190   * @cmd_id:	command identifier
9a434cee773ae15 Elliot Berman      2020-01-07  191   * @desc:	Descriptor structure containing arguments and return values
9a434cee773ae15 Elliot Berman      2020-01-07  192   *
9a434cee773ae15 Elliot Berman      2020-01-07  193   * Sends a command to the SCM and waits for the command to finish processing.
9a434cee773ae15 Elliot Berman      2020-01-07  194   * This should *only* be called in pre-emptible context.
9a434cee773ae15 Elliot Berman      2020-01-07  195   */
9a434cee773ae15 Elliot Berman      2020-01-07  196  static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
9a434cee773ae15 Elliot Berman      2020-01-07  197  			 struct qcom_scm_res *res)
9a434cee773ae15 Elliot Berman      2020-01-07 @198  {
9a434cee773ae15 Elliot Berman      2020-01-07  199  	might_sleep();
9a434cee773ae15 Elliot Berman      2020-01-07  200  	switch (__get_convention()) {
9a434cee773ae15 Elliot Berman      2020-01-07  201  	case SMC_CONVENTION_ARM_32:
9a434cee773ae15 Elliot Berman      2020-01-07  202  	case SMC_CONVENTION_ARM_64:
9a434cee773ae15 Elliot Berman      2020-01-07  203  		return scm_smc_call(dev, desc, res, false);
9a434cee773ae15 Elliot Berman      2020-01-07  204  	case SMC_CONVENTION_LEGACY:
9a434cee773ae15 Elliot Berman      2020-01-07  205  		return scm_legacy_call(dev, desc, res);
9a434cee773ae15 Elliot Berman      2020-01-07  206  	default:
9a434cee773ae15 Elliot Berman      2020-01-07  207  		pr_err("Unknown current SCM calling convention.\n");
9a434cee773ae15 Elliot Berman      2020-01-07  208  		return -EINVAL;
9a434cee773ae15 Elliot Berman      2020-01-07  209  	}
9a434cee773ae15 Elliot Berman      2020-01-07  210  }
9a434cee773ae15 Elliot Berman      2020-01-07  211  
9a434cee773ae15 Elliot Berman      2020-01-07  212  /**
9a434cee773ae15 Elliot Berman      2020-01-07  213   * qcom_scm_call_atomic() - atomic variation of qcom_scm_call()
9a434cee773ae15 Elliot Berman      2020-01-07  214   * @dev:	device
9a434cee773ae15 Elliot Berman      2020-01-07  215   * @svc_id:	service identifier
9a434cee773ae15 Elliot Berman      2020-01-07  216   * @cmd_id:	command identifier
9a434cee773ae15 Elliot Berman      2020-01-07  217   * @desc:	Descriptor structure containing arguments and return values
9a434cee773ae15 Elliot Berman      2020-01-07  218   * @res:	Structure containing results from SMC/HVC call
9a434cee773ae15 Elliot Berman      2020-01-07  219   *
9a434cee773ae15 Elliot Berman      2020-01-07  220   * Sends a command to the SCM and waits for the command to finish processing.
9a434cee773ae15 Elliot Berman      2020-01-07  221   * This can be called in atomic context.
9a434cee773ae15 Elliot Berman      2020-01-07  222   */
9a434cee773ae15 Elliot Berman      2020-01-07  223  static int qcom_scm_call_atomic(struct device *dev,
9a434cee773ae15 Elliot Berman      2020-01-07  224  				const struct qcom_scm_desc *desc,
9a434cee773ae15 Elliot Berman      2020-01-07  225  				struct qcom_scm_res *res)
9a434cee773ae15 Elliot Berman      2020-01-07  226  {
9a434cee773ae15 Elliot Berman      2020-01-07  227  	switch (__get_convention()) {
9a434cee773ae15 Elliot Berman      2020-01-07  228  	case SMC_CONVENTION_ARM_32:
9a434cee773ae15 Elliot Berman      2020-01-07  229  	case SMC_CONVENTION_ARM_64:
9a434cee773ae15 Elliot Berman      2020-01-07  230  		return scm_smc_call(dev, desc, res, true);
9a434cee773ae15 Elliot Berman      2020-01-07  231  	case SMC_CONVENTION_LEGACY:
9a434cee773ae15 Elliot Berman      2020-01-07  232  		return scm_legacy_call_atomic(dev, desc, res);
9a434cee773ae15 Elliot Berman      2020-01-07  233  	default:
9a434cee773ae15 Elliot Berman      2020-01-07  234  		pr_err("Unknown current SCM calling convention.\n");
9a434cee773ae15 Elliot Berman      2020-01-07  235  		return -EINVAL;
9a434cee773ae15 Elliot Berman      2020-01-07  236  	}
9a434cee773ae15 Elliot Berman      2020-01-07  237  }
9a434cee773ae15 Elliot Berman      2020-01-07  238  
9d11af8b06a811c Stephen Boyd       2021-02-23  239  static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
9a434cee773ae15 Elliot Berman      2020-01-07  240  					 u32 cmd_id)
9a434cee773ae15 Elliot Berman      2020-01-07  241  {
9a434cee773ae15 Elliot Berman      2020-01-07  242  	int ret;
9a434cee773ae15 Elliot Berman      2020-01-07  243  	struct qcom_scm_desc desc = {
9a434cee773ae15 Elliot Berman      2020-01-07  244  		.svc = QCOM_SCM_SVC_INFO,
9a434cee773ae15 Elliot Berman      2020-01-07  245  		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
9a434cee773ae15 Elliot Berman      2020-01-07  246  		.owner = ARM_SMCCC_OWNER_SIP,
9a434cee773ae15 Elliot Berman      2020-01-07  247  	};
9a434cee773ae15 Elliot Berman      2020-01-07  248  	struct qcom_scm_res res;
9a434cee773ae15 Elliot Berman      2020-01-07  249  
9a434cee773ae15 Elliot Berman      2020-01-07  250  	desc.arginfo = QCOM_SCM_ARGS(1);
9a434cee773ae15 Elliot Berman      2020-01-07  251  	switch (__get_convention()) {
9a434cee773ae15 Elliot Berman      2020-01-07  252  	case SMC_CONVENTION_ARM_32:
9a434cee773ae15 Elliot Berman      2020-01-07  253  	case SMC_CONVENTION_ARM_64:
9a434cee773ae15 Elliot Berman      2020-01-07  254  		desc.args[0] = SCM_SMC_FNID(svc_id, cmd_id) |
9a434cee773ae15 Elliot Berman      2020-01-07  255  				(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
9a434cee773ae15 Elliot Berman      2020-01-07  256  		break;
9a434cee773ae15 Elliot Berman      2020-01-07  257  	case SMC_CONVENTION_LEGACY:
9a434cee773ae15 Elliot Berman      2020-01-07  258  		desc.args[0] = SCM_LEGACY_FNID(svc_id, cmd_id);
9a434cee773ae15 Elliot Berman      2020-01-07  259  		break;
9a434cee773ae15 Elliot Berman      2020-01-07  260  	default:
9a434cee773ae15 Elliot Berman      2020-01-07  261  		pr_err("Unknown SMC convention being used\n");
df84a4f710451fd Guru Das Srinagesh 2021-10-11  262  		return false;
9a434cee773ae15 Elliot Berman      2020-01-07  263  	}
9a434cee773ae15 Elliot Berman      2020-01-07  264  
9a434cee773ae15 Elliot Berman      2020-01-07  265  	ret = qcom_scm_call(dev, &desc, &res);
9a434cee773ae15 Elliot Berman      2020-01-07  266  
9d11af8b06a811c Stephen Boyd       2021-02-23  267  	return ret ? false : !!res.result[0];
9a434cee773ae15 Elliot Berman      2020-01-07  268  }
9a434cee773ae15 Elliot Berman      2020-01-07  269  
a353e4a06f24235 Lina Iyer          2015-03-02  270  /**
65f0c90b7d46854 Elliot Berman      2020-01-07  271   * qcom_scm_set_warm_boot_addr() - Set the warm boot address for cpus
a353e4a06f24235 Lina Iyer          2015-03-02  272   * @entry: Entry point function for the cpus
a353e4a06f24235 Lina Iyer          2015-03-02  273   * @cpus: The cpumask of cpus that will use the entry point
a353e4a06f24235 Lina Iyer          2015-03-02  274   *
65f0c90b7d46854 Elliot Berman      2020-01-07  275   * Set the Linux entry point for the SCM to transfer control to when coming
65f0c90b7d46854 Elliot Berman      2020-01-07  276   * out of a power down. CPU power down may be executed on cpuidle or hotplug.
a353e4a06f24235 Lina Iyer          2015-03-02  277   */
65f0c90b7d46854 Elliot Berman      2020-01-07  278  int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
a353e4a06f24235 Lina Iyer          2015-03-02  279  {
57d3b816718c1cf Elliot Berman      2020-01-07  280  	int ret;
57d3b816718c1cf Elliot Berman      2020-01-07  281  	int flags = 0;
57d3b816718c1cf Elliot Berman      2020-01-07  282  	int cpu;
57d3b816718c1cf Elliot Berman      2020-01-07  283  	struct qcom_scm_desc desc = {
57d3b816718c1cf Elliot Berman      2020-01-07  284  		.svc = QCOM_SCM_SVC_BOOT,
57d3b816718c1cf Elliot Berman      2020-01-07  285  		.cmd = QCOM_SCM_BOOT_SET_ADDR,
57d3b816718c1cf Elliot Berman      2020-01-07  286  		.arginfo = QCOM_SCM_ARGS(2),
57d3b816718c1cf Elliot Berman      2020-01-07  287  	};
57d3b816718c1cf Elliot Berman      2020-01-07  288  
57d3b816718c1cf Elliot Berman      2020-01-07  289  	/*
57d3b816718c1cf Elliot Berman      2020-01-07  290  	 * Reassign only if we are switching from hotplug entry point
57d3b816718c1cf Elliot Berman      2020-01-07  291  	 * to cpuidle entry point or vice versa.
57d3b816718c1cf Elliot Berman      2020-01-07  292  	 */
57d3b816718c1cf Elliot Berman      2020-01-07  293  	for_each_cpu(cpu, cpus) {
57d3b816718c1cf Elliot Berman      2020-01-07  294  		if (entry == qcom_scm_wb[cpu].entry)
57d3b816718c1cf Elliot Berman      2020-01-07  295  			continue;
57d3b816718c1cf Elliot Berman      2020-01-07  296  		flags |= qcom_scm_wb[cpu].flag;
57d3b816718c1cf Elliot Berman      2020-01-07  297  	}
57d3b816718c1cf Elliot Berman      2020-01-07  298  
57d3b816718c1cf Elliot Berman      2020-01-07  299  	/* No change in entry function */
57d3b816718c1cf Elliot Berman      2020-01-07  300  	if (!flags)
57d3b816718c1cf Elliot Berman      2020-01-07  301  		return 0;
57d3b816718c1cf Elliot Berman      2020-01-07  302  
57d3b816718c1cf Elliot Berman      2020-01-07  303  	desc.args[0] = flags;
57d3b816718c1cf Elliot Berman      2020-01-07  304  	desc.args[1] = virt_to_phys(entry);
57d3b816718c1cf Elliot Berman      2020-01-07  305  
57d3b816718c1cf Elliot Berman      2020-01-07  306  	ret = qcom_scm_call(__scm->dev, &desc, NULL);
57d3b816718c1cf Elliot Berman      2020-01-07  307  	if (!ret) {
57d3b816718c1cf Elliot Berman      2020-01-07  308  		for_each_cpu(cpu, cpus)
57d3b816718c1cf Elliot Berman      2020-01-07  309  			qcom_scm_wb[cpu].entry = entry;
57d3b816718c1cf Elliot Berman      2020-01-07  310  	}
57d3b816718c1cf Elliot Berman      2020-01-07  311  
57d3b816718c1cf Elliot Berman      2020-01-07  312  	return ret;
a353e4a06f24235 Lina Iyer          2015-03-02  313  }
65f0c90b7d46854 Elliot Berman      2020-01-07  314  EXPORT_SYMBOL(qcom_scm_set_warm_boot_addr);
2ce76a6ad32fa07 Lina Iyer          2015-03-02  315  
2ce76a6ad32fa07 Lina Iyer          2015-03-02  316  /**
65f0c90b7d46854 Elliot Berman      2020-01-07  317   * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
2ce76a6ad32fa07 Lina Iyer          2015-03-02  318   * @entry: Entry point function for the cpus
2ce76a6ad32fa07 Lina Iyer          2015-03-02  319   * @cpus: The cpumask of cpus that will use the entry point
2ce76a6ad32fa07 Lina Iyer          2015-03-02  320   *
65f0c90b7d46854 Elliot Berman      2020-01-07  321   * Set the cold boot address of the cpus. Any cpu outside the supported
65f0c90b7d46854 Elliot Berman      2020-01-07  322   * range would be removed from the cpu present mask.
2ce76a6ad32fa07 Lina Iyer          2015-03-02  323   */
65f0c90b7d46854 Elliot Berman      2020-01-07  324  int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
2ce76a6ad32fa07 Lina Iyer          2015-03-02  325  {
57d3b816718c1cf Elliot Berman      2020-01-07  326  	int flags = 0;
57d3b816718c1cf Elliot Berman      2020-01-07  327  	int cpu;
57d3b816718c1cf Elliot Berman      2020-01-07  328  	int scm_cb_flags[] = {
57d3b816718c1cf Elliot Berman      2020-01-07  329  		QCOM_SCM_FLAG_COLDBOOT_CPU0,
57d3b816718c1cf Elliot Berman      2020-01-07  330  		QCOM_SCM_FLAG_COLDBOOT_CPU1,
57d3b816718c1cf Elliot Berman      2020-01-07  331  		QCOM_SCM_FLAG_COLDBOOT_CPU2,
57d3b816718c1cf Elliot Berman      2020-01-07  332  		QCOM_SCM_FLAG_COLDBOOT_CPU3,
57d3b816718c1cf Elliot Berman      2020-01-07  333  	};
57d3b816718c1cf Elliot Berman      2020-01-07  334  	struct qcom_scm_desc desc = {
57d3b816718c1cf Elliot Berman      2020-01-07  335  		.svc = QCOM_SCM_SVC_BOOT,
57d3b816718c1cf Elliot Berman      2020-01-07  336  		.cmd = QCOM_SCM_BOOT_SET_ADDR,
57d3b816718c1cf Elliot Berman      2020-01-07  337  		.arginfo = QCOM_SCM_ARGS(2),
57d3b816718c1cf Elliot Berman      2020-01-07  338  		.owner = ARM_SMCCC_OWNER_SIP,
57d3b816718c1cf Elliot Berman      2020-01-07  339  	};
57d3b816718c1cf Elliot Berman      2020-01-07  340  
d775dab9a4a8f12 Junlin Yang        2021-03-11  341  	if (!cpus || cpumask_empty(cpus))
57d3b816718c1cf Elliot Berman      2020-01-07  342  		return -EINVAL;
57d3b816718c1cf Elliot Berman      2020-01-07  343  
57d3b816718c1cf Elliot Berman      2020-01-07  344  	for_each_cpu(cpu, cpus) {
57d3b816718c1cf Elliot Berman      2020-01-07  345  		if (cpu < ARRAY_SIZE(scm_cb_flags))
57d3b816718c1cf Elliot Berman      2020-01-07  346  			flags |= scm_cb_flags[cpu];
57d3b816718c1cf Elliot Berman      2020-01-07  347  		else
57d3b816718c1cf Elliot Berman      2020-01-07  348  			set_cpu_present(cpu, false);
57d3b816718c1cf Elliot Berman      2020-01-07  349  	}
57d3b816718c1cf Elliot Berman      2020-01-07  350  
57d3b816718c1cf Elliot Berman      2020-01-07  351  	desc.args[0] = flags;
57d3b816718c1cf Elliot Berman      2020-01-07  352  	desc.args[1] = virt_to_phys(entry);
57d3b816718c1cf Elliot Berman      2020-01-07  353  
57d3b816718c1cf Elliot Berman      2020-01-07  354  	return qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
2ce76a6ad32fa07 Lina Iyer          2015-03-02  355  }
65f0c90b7d46854 Elliot Berman      2020-01-07  356  EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
767b0235dd47659 Lina Iyer          2015-03-02  357  
767b0235dd47659 Lina Iyer          2015-03-02  358  /**
767b0235dd47659 Lina Iyer          2015-03-02  359   * qcom_scm_cpu_power_down() - Power down the cpu
767b0235dd47659 Lina Iyer          2015-03-02  360   * @flags - Flags to flush cache
767b0235dd47659 Lina Iyer          2015-03-02  361   *
767b0235dd47659 Lina Iyer          2015-03-02  362   * This is an end point to power down cpu. If there was a pending interrupt,
767b0235dd47659 Lina Iyer          2015-03-02  363   * the control would return from this function, otherwise, the cpu jumps to the
767b0235dd47659 Lina Iyer          2015-03-02  364   * warm boot entry point set for this cpu upon reset.
767b0235dd47659 Lina Iyer          2015-03-02  365   */
767b0235dd47659 Lina Iyer          2015-03-02  366  void qcom_scm_cpu_power_down(u32 flags)
767b0235dd47659 Lina Iyer          2015-03-02 @367  {
57d3b816718c1cf Elliot Berman      2020-01-07  368  	struct qcom_scm_desc desc = {
57d3b816718c1cf Elliot Berman      2020-01-07  369  		.svc = QCOM_SCM_SVC_BOOT,
57d3b816718c1cf Elliot Berman      2020-01-07  370  		.cmd = QCOM_SCM_BOOT_TERMINATE_PC,
57d3b816718c1cf Elliot Berman      2020-01-07  371  		.args[0] = flags & QCOM_SCM_FLUSH_FLAG_MASK,
57d3b816718c1cf Elliot Berman      2020-01-07  372  		.arginfo = QCOM_SCM_ARGS(1),
57d3b816718c1cf Elliot Berman      2020-01-07  373  		.owner = ARM_SMCCC_OWNER_SIP,
57d3b816718c1cf Elliot Berman      2020-01-07  374  	};
57d3b816718c1cf Elliot Berman      2020-01-07  375  
57d3b816718c1cf Elliot Berman      2020-01-07  376  	qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
767b0235dd47659 Lina Iyer          2015-03-02  377  }
767b0235dd47659 Lina Iyer          2015-03-02  378  EXPORT_SYMBOL(qcom_scm_cpu_power_down);
9626b6993b2e6fa jilai wang         2015-04-10  379  

:::::: The code at line 367 was first introduced by commit
:::::: 767b0235dd476596c0d4154839ae6880bec71b3c firmware: qcom: scm: Support cpu power down through SCM

:::::: TO: Lina Iyer <lina.iyer@linaro.org>
:::::: CC: Kumar Gala <galak@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
