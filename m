Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB92E46BF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 02:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708481166; cv=none; b=f13jlpoD6MFQIiIbTi8sPke+zAwqvIm6t+00TETohuLNfnp0HU+sHbv6tAssGWJqyLEUbJOFc6cCTWX67DUaz1SbWpyhIWVs7Cft5kaNFMMONo4vyw3R1wADKkTMDgJul+RrCYwNsm/10sri6CyjISci25sGvSZiWOTeYhg/n70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708481166; c=relaxed/simple;
	bh=AvtVs+7CaY40o8kqQu7wBqAnocgyqs/DfYWwkUsv2nE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gK0X+MYbwLdL3KGp5Mjpwy3VtTe91pVXcSI0ImB7ZkpuNjDHrIiZBwqqjQXWVv9v6HvN6HEkW2UYpncZdzlIVU6adk1QjW1XcBLWkNj96f3vv/evcb/YaLzQHWbysTizWb3ubA+Xtu9BpL9gNKgaF3XMA3QAzfh86zDeEqEkFbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEwIN6pV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEwIN6pV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708481164; x=1740017164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AvtVs+7CaY40o8kqQu7wBqAnocgyqs/DfYWwkUsv2nE=;
  b=UEwIN6pVJKiW/uzEr/bMIxIrbac32syzNu3rZk4KJso4hcgqR0LfsZj/
   IvIyxoxKB828sTGhJsUXRsySYuHEqXAguatazUOprnsJvA7+gxNwKpwr+
   9z1cM1TSTrrn91fdZG10FKqdmUAuGan9MsJ5YIshAa4fu76q/jkf4ZU8s
   haxZEgsFyEiYWwgEM9rsQI3J9Ps4tyuZJ0WPQd2/pcl8OZJk1HQqfWJKm
   QFvJFkQphR0qL6mw9WIe5crjJFTEIZt2Izz4+XoFhMB/bq31vP3ZAjEvv
   mwWVn8+9bdguR/t8vLIxRBSB1qJ/ZYk5mhJD4c2dCXup4SJK43uZYNVvv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2744229"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2744229"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 18:06:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5211417"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Feb 2024 18:06:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcbzJ-0004wO-1O;
	Wed, 21 Feb 2024 02:05:42 +0000
Date: Wed, 21 Feb 2024 10:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:drivers-for-6.9 21/22] drivers/soc/qcom/spm.c:388:12: warning:
 'spm_get_cpu' defined but not used
Message-ID: <202402211020.ONTSdlzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-6.9
head:   aa05f47474c02d38d88c32c633a551911c6fdc40
commit: 6496dba142f4461360cae263126965e4ac761ab9 [21/22] soc: qcom: spm: add support for voltage regulator
config: powerpc-randconfig-r092-20230811 (https://download.01.org/0day-ci/archive/20240221/202402211020.ONTSdlzc-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402211020.ONTSdlzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402211020.ONTSdlzc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/qcom/spm.c:388:12: warning: 'spm_get_cpu' defined but not used [-Wunused-function]
     388 | static int spm_get_cpu(struct device *dev)
         |            ^~~~~~~~~~~
>> drivers/soc/qcom/spm.c:322:35: warning: 'spm_reg_ops' defined but not used [-Wunused-const-variable=]
     322 | static const struct regulator_ops spm_reg_ops = {
         |                                   ^~~~~~~~~~~


vim +/spm_get_cpu +388 drivers/soc/qcom/spm.c

   321	
 > 322	static const struct regulator_ops spm_reg_ops = {
   323		.set_voltage_sel	= spm_set_voltage_sel,
   324		.get_voltage_sel	= spm_get_voltage_sel,
   325		.list_voltage		= regulator_list_voltage_linear_range,
   326		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
   327	};
   328	
   329	static void smp_set_vdd_v1_1(void *data)
   330	{
   331		struct spm_driver_data *drv = data;
   332		unsigned int vctl, data0, data1, avs_ctl, sts;
   333		unsigned int vlevel, volt_sel;
   334		bool avs_enabled;
   335	
   336		volt_sel = drv->volt_sel;
   337		vlevel = volt_sel | 0x80; /* band */
   338	
   339		avs_ctl = spm_register_read(drv, SPM_REG_AVS_CTL);
   340		vctl = spm_register_read(drv, SPM_REG_VCTL);
   341		data0 = spm_register_read(drv, SPM_REG_PMIC_DATA_0);
   342		data1 = spm_register_read(drv, SPM_REG_PMIC_DATA_1);
   343	
   344		avs_enabled = avs_ctl & SPM_1_1_AVS_CTL_AVS_ENABLED;
   345	
   346		/* If AVS is enabled, switch it off during the voltage change */
   347		if (avs_enabled) {
   348			avs_ctl &= ~SPM_1_1_AVS_CTL_AVS_ENABLED;
   349			spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
   350		}
   351	
   352		/* Kick the state machine back to idle */
   353		spm_register_write(drv, SPM_REG_RST, 1);
   354	
   355		vctl = FIELD_SET(vctl, SPM_VCTL_VLVL, vlevel);
   356		data0 = FIELD_SET(data0, SPM_PMIC_DATA_0_VLVL, vlevel);
   357		data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MIN_VSEL, volt_sel);
   358		data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MAX_VSEL, volt_sel);
   359	
   360		spm_register_write(drv, SPM_REG_VCTL, vctl);
   361		spm_register_write(drv, SPM_REG_PMIC_DATA_0, data0);
   362		spm_register_write(drv, SPM_REG_PMIC_DATA_1, data1);
   363	
   364		if (read_poll_timeout_atomic(spm_register_read,
   365					     sts, sts == vlevel,
   366					     1, 200, false,
   367					     drv, SPM_REG_STS1)) {
   368			dev_err_ratelimited(drv->dev, "timeout setting the voltage (%x %x)!\n", sts, vlevel);
   369			goto enable_avs;
   370		}
   371	
   372		if (avs_enabled) {
   373			unsigned int max_avs = volt_sel;
   374			unsigned int min_avs = max(max_avs, 4U) - 4;
   375	
   376			avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MIN_VLVL, min_avs);
   377			avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MAX_VLVL, max_avs);
   378			spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
   379		}
   380	
   381	enable_avs:
   382		if (avs_enabled) {
   383			avs_ctl |= SPM_1_1_AVS_CTL_AVS_ENABLED;
   384			spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
   385		}
   386	}
   387	
 > 388	static int spm_get_cpu(struct device *dev)
   389	{
   390		int cpu;
   391		bool found;
   392	
   393		for_each_possible_cpu(cpu) {
   394			struct device_node *cpu_node, *saw_node;
   395	
   396			cpu_node = of_cpu_device_node_get(cpu);
   397			if (!cpu_node)
   398				continue;
   399	
   400			saw_node = of_parse_phandle(cpu_node, "qcom,saw", 0);
   401			found = (saw_node == dev->of_node);
   402			of_node_put(saw_node);
   403			of_node_put(cpu_node);
   404	
   405			if (found)
   406				return cpu;
   407		}
   408	
   409		/* L2 SPM is not bound to any CPU, voltage setting is not supported */
   410	
   411		return -EOPNOTSUPP;
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
