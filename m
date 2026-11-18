Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030954;
	b=AIycdSNv2nNCinxbPICyuusOoG4h3kiKsFq3dpKKO/FRacJHIamVbFGzNwySEh/uPlqw
	 4ZkrALehGYtieNTlkGTMagO1TE/gGfG7bg6xdtXNO41MBOEnZVx7XtcBCOofB3GI3u6X8
	 PELkKzjkhShn5QGUpF/E3BGO9Fv2xyTjBSpFMq0PMWzIccZGI+kohjqihz6aPXkZX+xmv
	 57LjGalNFjp9UUzldgPHEHRcy3IXQ7WW8J+K5qlKGDEO3ttBA/h8K17k8BTDqRW7m4F2x
	 QAZlk5v4R193FJ//oQ194Y+r2CS7IXnUnbSlxDWTe5GrX7GZkzEJ57MMrA48sS4AThw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030954;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=68Slr/bzqIyJIbxaVhd4mkuOD1AIXKhx/E+pd8yGKpc=;
	b=jubKrNUaHHayOqL6QNe+Hd9yBwchb7/FuiCWsre09g6okqnDR0cdqcrAEbO3cARUnKJf
	 mwvrj2mgEBxsRFAWMZe0ihwMbY3u4pAVHoLeNw/gsvMcGeUlNdvo3Xbodvp/mBUU1LFhR
	 IrFV61G6aVDJNpnpaf46jHNjEzc7Ts39vbWrWi3Id0IXIQ5rNTI8SvBiiSabkA0Awq4cb
	 30lMXys2NnGpkWMcLJoj16Sux9Xar6/CobQMyng57DIKqzZ3XaSIz7PV9xIqe3RO/qPoy
	 zrX2optfTr6nYRo6TfR3sWdx3hDreHv5GxlUtqBDQ3CGuxJ+eQncaTtGtx20Ssbu/KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dIQwkzPX;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B38606A900
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 19:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B38606A900
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dIQwkzPX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795030954; x=1826566954;
  h=date:from:to:cc:subject:message-id;
  bh=iCYWeHrqtc15AJayS4/ZY0IijWe3nAVKQJToV6Vk0Fo=;
  b=dIQwkzPXUw/Em4JKIJa6eUuVpgv8wC3EY5NWKAsU4iGERy9R370YIIxa
   mqJz0Gt9MTdyXaeYU1vyVHRQFt3GW0A5bfz1xLNQpTZGvdP0F174FyvqJ
   lhH7bcwwZayM6x9jE0ldA6d+B26Sh/TlB18b72p0C6R2br+m2D+21OHg8
   XLZ7Bp/qyWESws7zJmgt8Y1nU715zbKAQAgf7/GJVUr0/UNj9Zg575kTM
   Km0ySafFWSU6n8+CWSH1+DjujoaLFhFh2lJk0kSBMjAtzUXVmus3o7wG8
   8y2ag5OdFQLRVAE06zNhK2RP9oXmJVEJuSQdzvU3K7ZElYNOKcrhIl61M
   g==;
X-CSE-ConnectionGUID: 7D8hYPAnQ1OBKHI99LLa4Q==
X-CSE-MsgGUID: cf1gjOKDS4aEsGUrpJoEYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3743835"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3743835"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 11:42:33 -0800
X-CSE-ConnectionGUID: +/xhiwAdQYaGO3RSSes4Bw==
X-CSE-MsgGUID: VjOPVdCbS/OsQp3TfnDi0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10026783"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Nov 2026 11:42:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTlY5-000000003SR-1u0F;
	Wed, 18 Nov 2026 19:42:29 +0000
Date: Wed, 18 Nov 2026 20:42:09 +0100
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8650/el2-integ 2/36]
 drivers/input/misc/pm8941-pwrkey.c:406:65: error: implicit declaration of
 function 'is_kernel_in_hyp_mode'
Message-ID: <20261118203502.z3L3eOYA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/superna9999/linux topic/sm8650/el2-integ
head:   237d9f2f9294f587cd9e1ce7fd5124d71ea60d12
commit: 4bf6e743effcfb71eab2bdfe28614f486bced226 [2/36] input: misc: pm8941-pwrkey: allow reboot config when in EL2 on GEN3 PMICs
config: alpha-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118203502.z3L3eOYA-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118203502.z3L3eOYA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118203502.z3L3eOYA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/misc/pm8941-pwrkey.c: In function 'pm8941_pwrkey_probe':
>> drivers/input/misc/pm8941-pwrkey.c:406:65: error: implicit declaration of function 'is_kernel_in_hyp_mode' [-Werror=implicit-function-declaration]
     406 |             (pwrkey->data->allows_ps_hold_poff_config_in_el2 && is_kernel_in_hyp_mode())) {
         |                                                                 ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/is_kernel_in_hyp_mode +406 drivers/input/misc/pm8941-pwrkey.c

   251	
   252	static DEFINE_SIMPLE_DEV_PM_OPS(pm8941_pwr_key_pm_ops,
   253					pm8941_pwrkey_suspend, pm8941_pwrkey_resume);
   254	
   255	static int pm8941_pwrkey_probe(struct platform_device *pdev)
   256	{
   257		struct pm8941_pwrkey *pwrkey;
   258		bool pull_up, wakeup;
   259		struct device *parent;
   260		struct device_node *regmap_node;
   261		const __be32 *addr;
   262		u32 req_delay, mask, delay_shift;
   263		int error;
   264	
   265		if (of_property_read_u32(pdev->dev.of_node, "debounce", &req_delay))
   266			req_delay = 15625;
   267	
   268		if (req_delay > 2000000 || req_delay == 0) {
   269			dev_err(&pdev->dev, "invalid debounce time: %u\n", req_delay);
   270			return -EINVAL;
   271		}
   272	
   273		pull_up = of_property_read_bool(pdev->dev.of_node, "bias-pull-up");
   274	
   275		pwrkey = devm_kzalloc_obj(&pdev->dev, *pwrkey);
   276		if (!pwrkey)
   277			return -ENOMEM;
   278	
   279		pwrkey->dev = &pdev->dev;
   280		pwrkey->data = of_device_get_match_data(&pdev->dev);
   281	
   282		parent = pdev->dev.parent;
   283		regmap_node = pdev->dev.of_node;
   284		pwrkey->regmap = dev_get_regmap(parent, NULL);
   285		if (!pwrkey->regmap) {
   286			regmap_node = parent->of_node;
   287			/*
   288			 * We failed to get regmap for parent. Let's see if we are
   289			 * a child of pon node and read regmap and reg from its
   290			 * parent.
   291			 */
   292			pwrkey->regmap = dev_get_regmap(parent->parent, NULL);
   293			if (!pwrkey->regmap) {
   294				dev_err(&pdev->dev, "failed to locate regmap\n");
   295				return -ENODEV;
   296			}
   297		}
   298	
   299		addr = of_get_address(regmap_node, 0, NULL, NULL);
   300		if (!addr) {
   301			dev_err(&pdev->dev, "reg property missing\n");
   302			return -EINVAL;
   303		}
   304		pwrkey->baseaddr = be32_to_cpup(addr);
   305	
   306		if (pwrkey->data->has_pon_pbs) {
   307			/* PON_PBS base address is optional */
   308			addr = of_get_address(regmap_node, 1, NULL, NULL);
   309			if (addr)
   310				pwrkey->pon_pbs_baseaddr = be32_to_cpup(addr);
   311		}
   312	
   313		pwrkey->irq = platform_get_irq(pdev, 0);
   314		if (pwrkey->irq < 0)
   315			return pwrkey->irq;
   316	
   317		error = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_REV2,
   318				    &pwrkey->revision);
   319		if (error) {
   320			dev_err(&pdev->dev, "failed to read revision: %d\n", error);
   321			return error;
   322		}
   323	
   324		error = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_SUBTYPE,
   325				    &pwrkey->subtype);
   326		if (error) {
   327			dev_err(&pdev->dev, "failed to read subtype: %d\n", error);
   328			return error;
   329		}
   330	
   331		error = of_property_read_u32(pdev->dev.of_node, "linux,code",
   332					     &pwrkey->code);
   333		if (error) {
   334			dev_dbg(&pdev->dev,
   335				"no linux,code assuming power (%d)\n", error);
   336			pwrkey->code = KEY_POWER;
   337		}
   338	
   339		pwrkey->input = devm_input_allocate_device(&pdev->dev);
   340		if (!pwrkey->input) {
   341			dev_dbg(&pdev->dev, "unable to allocate input device\n");
   342			return -ENOMEM;
   343		}
   344	
   345		input_set_capability(pwrkey->input, EV_KEY, pwrkey->code);
   346	
   347		pwrkey->input->name = pwrkey->data->name;
   348		pwrkey->input->phys = pwrkey->data->phys;
   349	
   350		if (pwrkey->data->supports_debounce_config) {
   351			if (pwrkey->subtype >= PON_SUBTYPE_GEN2_PRIMARY) {
   352				mask = PON_DBC_DELAY_MASK_GEN2;
   353				delay_shift = PON_DBC_SHIFT_GEN2;
   354			} else {
   355				mask = PON_DBC_DELAY_MASK_GEN1;
   356				delay_shift = PON_DBC_SHIFT_GEN1;
   357			}
   358	
   359			req_delay = (req_delay << delay_shift) / USEC_PER_SEC;
   360			req_delay = ilog2(req_delay);
   361	
   362			error = regmap_update_bits(pwrkey->regmap,
   363						   pwrkey->baseaddr + PON_DBC_CTL,
   364						   mask,
   365						   req_delay);
   366			if (error) {
   367				dev_err(&pdev->dev, "failed to set debounce: %d\n",
   368					error);
   369				return error;
   370			}
   371		}
   372	
   373		error = pm8941_pwrkey_sw_debounce_init(pwrkey);
   374		if (error)
   375			return error;
   376	
   377		if (pwrkey->data->pull_up_bit) {
   378			error = regmap_update_bits(pwrkey->regmap,
   379						   pwrkey->baseaddr + PON_PULL_CTL,
   380						   pwrkey->data->pull_up_bit,
   381						   pull_up ? pwrkey->data->pull_up_bit :
   382							     0);
   383			if (error) {
   384				dev_err(&pdev->dev, "failed to set pull: %d\n", error);
   385				return error;
   386			}
   387		}
   388	
   389		error = devm_request_threaded_irq(&pdev->dev, pwrkey->irq,
   390						  NULL, pm8941_pwrkey_irq,
   391						  IRQF_ONESHOT,
   392						  pwrkey->data->name, pwrkey);
   393		if (error) {
   394			dev_err(&pdev->dev, "failed requesting IRQ: %d\n", error);
   395			return error;
   396		}
   397	
   398		error = input_register_device(pwrkey->input);
   399		if (error) {
   400			dev_err(&pdev->dev, "failed to register input device: %d\n",
   401				error);
   402			return error;
   403		}
   404	
   405		if (pwrkey->data->supports_ps_hold_poff_config ||
 > 406		    (pwrkey->data->allows_ps_hold_poff_config_in_el2 && is_kernel_in_hyp_mode())) {
   407			pwrkey->reboot_notifier.notifier_call = pm8941_reboot_notify;
   408			error = register_reboot_notifier(&pwrkey->reboot_notifier);
   409			if (error) {
   410				dev_err(&pdev->dev, "failed to register reboot notifier: %d\n",
   411					error);
   412				return error;
   413			}
   414		}
   415	
   416		wakeup = pwrkey->data->wakeup_source_default ||
   417			of_property_read_bool(pdev->dev.of_node, "wakeup-source");
   418	
   419		platform_set_drvdata(pdev, pwrkey);
   420		device_init_wakeup(&pdev->dev, wakeup);
   421	
   422		return 0;
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
