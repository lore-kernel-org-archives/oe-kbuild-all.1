Received: from sonic311-32.consmr.mail.ir2.yahoo.com (sonic311-32.consmr.mail.ir2.yahoo.com [77.238.176.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCE724525
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 05:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048; t=1692855572; bh=5uxnCEtd0CsmtaJOUIA2SEqpNKJML/sabi/d1yMSA2Y=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=k2vkv2aLdPNwaSXUa7XC98+ms6Xz636E8AYRfiq/KFU0W+hVnvtIx2fA+YMMLK5sZOJGY1RVrYVCQz0jDxZrOGahH3AfEyV4IJ3F7r2JNJT8ITTEh3W8b3VYnz6hXzP13Wns9KfuDSMWgaAwbwCDRTtI6VTN/GVdmjtsKtQGfdm3x+n1uk27be1YCeky1fl6WKY4HZCbRCY1kr66ogKqKM2Y+7In4FRaUtLiDxuqmtsWdSHmh2jLOKH9SplnJ0cSgLMhUTgs15UnkOxITUMwtjf7pqhrVI6Mj94mkS9Wbksnv/iIH+EVnhViDxw2ru7dV4o8YXu0Jdz5z2G8Ukd4+A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1692855572; bh=IzifiKky/dIKJejIcPQszN5Htt1ONFn47PMflZKZ9Jk=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=rg3jeYcCACoFxwfYmbmUZEqlDh6FQPwU/UqOG3VeXXGsjInTwzlDkhwbmDUghtbYYzDmV1h/MGtHAmMhP5grGQ9W+EZedTNkYVbQUIDF3nHRZi+7EV9nSjD+oFn61AK9Ayvh5+VkDg/zmSSNyPpqVstgCA60peeOIuq+S+ja+UFJMrMP+4gLmHrWMDQmP5G9+KgzJUMOIZ4H5Yu/7iA2dYXhFzpUNrGZ9ydaE3hws8kLd8ZaNjxd6ZQ+rOEYszV+k8yGSwgTiJsj+oS2L2lhh9i9iPYBWLJ3LZLU6MQzDZWi4/Yoc1YrZPMRX2LVimvasm+4APLEfp+KlPcqn+QWQw==
X-YMail-OSG: 4GFccNwVM1kq1EMtABbfhqmAOguUJzmj3itxasI5yvBEw8CddIxs4CbiK9Z7XLR
 FNMKwCJHWUim_cdDzQ1YVt3FiHG12dVsdFdYwrv18wEpPUndWP.n1RnyMhkIvE1QH0gFtkfsE1pU
 jXWOOCp9lmH4gwaAA012OLeCJ7Hi1nXXKn6GKw0Iyc_Z9CKo1Mi0FeLUd9HunL91E4n0hF_rEmwx
 XE6B9Q8mG5PbkVxWQbB2XzsJas7xXiPhb81OKywNBFXh51iECdGCMYEBj8vkrnKHWIYt5XBRlKSr
 crGgMkVj0NRaKu_pkO4xHjCaSX4.nS1W3.rjR8fUmLqZ8JlKc0ZNtnNjo70V9LJ5zoC1WrEahg6F
 qJkjuWxRlAaKHPco8EUeeTOrQViJm10eroVXru4DpnY23XI1x0OvlyHbKj851Tsi4aXI5dpqUjfV
 Uk.EsChcERMhouvHKhGOoTVTywPoJJB9zsB96y6vVszmL.jj87r4FiUJngLqywdzXuJbuCgpcyQL
 A6tSMyQXEUS5r7pBvP2OlIfCm08S3Y8ogM9nbpiWC4.TKPQvzM13aLA718OVQG6dCGV_k9W5uv60
 wSRSI7.oywmnTzIuk_7yNR51KvLiCT_Om3JS3yg5pkISnlKE2hQGchIrcKFF9fqGCdpaFOMSZ4_y
 4gR7xtOS26izBlNdWCtkwxeLTCveACm4PUFXsh.qw83CaVb9TE76c3FtgIQNQe09TB9xcjVy8rhT
 ndixZmB9qw5V3ZTFQtqLWw5UCxk2abHIJ7HzU8FkipSq4xdwhmg_0WMgLvJx1lw2Xzw0YzWH_Rba
 LKwBjtJyq7M_TnSfoVQ4Tv5gbMJPiKFJp1Jco9LppuJRFqctctwf6x3V6vWphB6WOR20GRJDZaWH
 v6rVn_KA_L3FV4qDOh4a5SYqzrAKz5CPO9xCvMwzcTy5Wc7Wrzgx5jFvBQkt5rf7VBC0Q0ulrHTN
 thCrBuLI1gaKXouXM1e3_6YqH7Tl_zYgkgAB.eV_I_kNiaVbJn4wwfeGHUagSEld6gjCF4mUKLs3
 sNJrWiElEYbGPVkXavO2csoCOPbw4.j3MjWOS8MGgGneSgnIIUQNQqHd4h5v2y0T1Lsl26s6Lrab
 j4h11w1xDSnruPdUBvD8KN.LB45GafBTU04ZMfgV5xXhRb9ZeFBTfjQn14KhNVAS5umQCUKLRUvY
 S.TkTm9QhI9jVvdHUXEbxd4L8LYKcQqXYJKAcIDXRRmMWSLiVEwjSHGBd2goMpo2pO0t1FQCQKhj
 P6UYfcdt_POL.FxaahLgYO8Vr9NK_G_Fgs_6PBppzvaA2inpgxOdcOqxgfBs3WJO1QfWkKzXts78
 a8Ge4mrA8N3yWKpY4.jVk6QFAbLatS5sXrpo_.a2HLhZTvhJqK2rvqqCs_u15Wvujmktxfw.gPlv
 F0vMJAYYwox3Q82FF8.ywdGfWxVVSHQDbeZPVujFAvEa6CERjiepEsBV.mG7t6MtIukbYVbPAJSK
 jqUPYgVL2ff2VkNQyPp4y7cvHp3WkaXLxACNkO5YvT6r6U.jkZnY4gEOmnEdDcvBLBF4jKgF.IX_
 Dfh5Xf.F10fh5lTRgtHJMd0VUOZFio5Nz_AylqF4guNc.dit5xy790vvv026OpiuaEhqjJnUfAoU
 AY.DJMFYq3fgLO3iAg3bOjdAbcnH9Uh3anjdrjjq813NEIoG6Ee2XKGJoOid2CkJoSmlbspKHi0d
 _rEsc8YBQoaVlB9OthzzyGITuuWxJbRjmZF6HtDLoPujNvk2lbXQvBoLmebU_rdQJXxSVU_wq9EC
 KGB9keQB.ueaKxrGjx3k_5YZ5qT.O3leGcGXs.gOyAmCqot.Ko2BdyErah4D9Voe.YuyEzOesBG.
 no5p8CuSij5QCrOjTEgmGGa9DdCZX2sKaEZt4UoQMc_IhuhjX6qg2hO9xBham3NOiD6Cb3LfEWgB
 71wpWHANSwMXH4Tti3KZNEbjeCP_cvPdrwKkkaUHCO15VCG9NpsN6fGjUygihf2xCvcfRokNYkeu
 8_j.ysQvE7P2JatdMLWoYzpoHL3E90jh_WvWPGcKlIgzh_SXGiQLrUIC4cIQO3.lPjCcNiuQaQrT
 U_.Dbfn8lNO30DtD.2SMGPx6008.3_Q1.8ocPUqjghvA5..X9TqsblYgM_VL3idYfmM7hIHSUkgf
 ZyR8M.lplzUU2Km7T8W_7eOtkUrxh3_ElJuHEQxpWA0RBlkk7AiNqD6st4tmn0LLLDvsyF2HThdV
 EIXp8lMnE3.plxOEd2qL1gfQDpGnQsTG5bGUAO9GILsFCU4wjL.RXru8HgaOFBBiOIPaTSqqhMEw
 gWdIYbx9XhcfBDX0-
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: e849988b-d08e-46d7-a5ab-24dd1027e453
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ir2.yahoo.com with HTTP; Thu, 24 Aug 2023 05:39:32 +0000
Received: by hermes--production-ir2-5cc57b9c45-6bc74 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a4a3656efb1f42af993926ec81695d88;
          Thu, 24 Aug 2023 05:39:30 +0000 (UTC)
Message-ID: <333a1ce0-6c97-1896-b612-5580124aebbb@rocketmail.com>
Date: Thu, 24 Aug 2023 07:39:29 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [linux-next:master 10528/12208]
 drivers/power/supply/rt5033_charger.c:696: undefined reference to
 `extcon_find_edev_by_node'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, Lee Jones
 <lee@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Sebastian Reichel <sre@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>
References: <202308240723.O2rW0InU-lkp@intel.com>
Content-Language: en-US
From: Jakob Hauser <jahau@rocketmail.com>
In-Reply-To: <202308240723.O2rW0InU-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21732 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Dear all,

On 24.08.23 01:18, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
> commit: 12cc585f36b8dffa68b809c2d23a9bd73ee6ffd2 [10528/12208] power: supply: rt5033_charger: Add cable detection and USB OTG supply
> config: x86_64-randconfig-r011-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240723.O2rW0InU-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240723.O2rW0InU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308240723.O2rW0InU-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     ld: vmlinux.o: in function `rt5033_charger_probe':
>>> drivers/power/supply/rt5033_charger.c:696: undefined reference to `extcon_find_edev_by_node'
>>> ld: drivers/power/supply/rt5033_charger.c:710: undefined reference to `devm_extcon_register_notifier_all'
>     ld: vmlinux.o: in function `rt5033_charger_extcon_work':
>>> drivers/power/supply/rt5033_charger.c:578: undefined reference to `extcon_get_state'
> 
> 
> vim +696 drivers/power/supply/rt5033_charger.c
> 
>     567	
>     568	static void rt5033_charger_extcon_work(struct work_struct *work)
>     569	{
>     570		struct rt5033_charger *charger =
>     571			container_of(work, struct rt5033_charger, extcon_work);
>     572		struct extcon_dev *edev = charger->edev;
>     573		int connector, state;
>     574		int ret;
>     575	
>     576		for (connector = EXTCON_USB_HOST; connector <= EXTCON_CHG_USB_PD;
>     577		     connector++) {
>   > 578			state = extcon_get_state(edev, connector);
>     579			if (state == 1)
>     580				break;
>     581		}
>     582	
>     583		/*
>     584		 * Adding a delay between extcon notification and extcon action. This
>     585		 * makes extcon action execution more reliable. Without the delay the
>     586		 * execution sometimes fails, possibly because the chip is busy or not
>     587		 * ready.
>     588		 */
>     589		msleep(100);
>     590	
>     591		switch (connector) {
>     592		case EXTCON_CHG_USB_SDP:
>     593			ret = rt5033_charger_set_mivr(charger);
>     594			if (ret) {
>     595				dev_err(charger->dev, "failed to set USB mode\n");
>     596				break;
>     597			}
>     598			dev_info(charger->dev, "USB mode. connector type: %d\n",
>     599				 connector);
>     600			break;
>     601		case EXTCON_CHG_USB_DCP:
>     602		case EXTCON_CHG_USB_CDP:
>     603		case EXTCON_CHG_USB_ACA:
>     604		case EXTCON_CHG_USB_FAST:
>     605		case EXTCON_CHG_USB_SLOW:
>     606		case EXTCON_CHG_WPT:
>     607		case EXTCON_CHG_USB_PD:
>     608			ret = rt5033_charger_set_charging(charger);
>     609			if (ret) {
>     610				dev_err(charger->dev, "failed to set charging\n");
>     611				break;
>     612			}
>     613			dev_info(charger->dev, "charging. connector type: %d\n",
>     614				 connector);
>     615			break;
>     616		case EXTCON_USB_HOST:
>     617			ret = rt5033_charger_set_otg(charger);
>     618			if (ret) {
>     619				dev_err(charger->dev, "failed to set OTG\n");
>     620				break;
>     621			}
>     622			dev_info(charger->dev, "OTG enabled\n");
>     623			break;
>     624		default:
>     625			ret = rt5033_charger_set_disconnect(charger);
>     626			if (ret) {
>     627				dev_err(charger->dev, "failed to set disconnect\n");
>     628				break;
>     629			}
>     630			dev_info(charger->dev, "disconnected\n");
>     631			break;
>     632		}
>     633	
>     634		power_supply_changed(charger->psy);
>     635	}
>     636	
>     637	static int rt5033_charger_extcon_notifier(struct notifier_block *nb,
>     638						  unsigned long event, void *param)
>     639	{
>     640		struct rt5033_charger *charger =
>     641			container_of(nb, struct rt5033_charger, extcon_nb);
>     642	
>     643		schedule_work(&charger->extcon_work);
>     644	
>     645		return NOTIFY_OK;
>     646	}
>     647	
>     648	static const struct power_supply_desc rt5033_charger_desc = {
>     649		.name = "rt5033-charger",
>     650		.type = POWER_SUPPLY_TYPE_USB,
>     651		.properties = rt5033_charger_props,
>     652		.num_properties = ARRAY_SIZE(rt5033_charger_props),
>     653		.get_property = rt5033_charger_get_property,
>     654	};
>     655	
>     656	static int rt5033_charger_probe(struct platform_device *pdev)
>     657	{
>     658		struct rt5033_charger *charger;
>     659		struct power_supply_config psy_cfg = {};
>     660		struct device_node *np_conn, *np_edev;
>     661		int ret;
>     662	
>     663		charger = devm_kzalloc(&pdev->dev, sizeof(*charger), GFP_KERNEL);
>     664		if (!charger)
>     665			return -ENOMEM;
>     666	
>     667		platform_set_drvdata(pdev, charger);
>     668		charger->dev = &pdev->dev;
>     669		charger->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>     670		mutex_init(&charger->lock);
>     671	
>     672		psy_cfg.of_node = pdev->dev.of_node;
>     673		psy_cfg.drv_data = charger;
>     674	
>     675		charger->psy = devm_power_supply_register(&pdev->dev,
>     676							  &rt5033_charger_desc,
>     677							  &psy_cfg);
>     678		if (IS_ERR(charger->psy))
>     679			return dev_err_probe(&pdev->dev, PTR_ERR(charger->psy),
>     680					     "Failed to register power supply\n");
>     681	
>     682		charger->chg = rt5033_charger_dt_init(charger);
>     683		if (IS_ERR_OR_NULL(charger->chg))
>     684			return PTR_ERR(charger->chg);
>     685	
>     686		ret = rt5033_charger_reg_init(charger);
>     687		if (ret)
>     688			return ret;
>     689	
>     690		/*
>     691		 * Extcon support is not vital for the charger to work. If no extcon
>     692		 * is available, just emit a warning and leave the probe function.
>     693		 */
>     694		np_conn = of_parse_phandle(pdev->dev.of_node, "richtek,usb-connector", 0);
>     695		np_edev = of_get_parent(np_conn);
>   > 696		charger->edev = extcon_find_edev_by_node(np_edev);
>     697		if (IS_ERR(charger->edev)) {
>     698			dev_warn(&pdev->dev, "no extcon device found in device-tree\n");
>     699			goto out;
>     700		}
>     701	
>     702		ret = devm_work_autocancel(&pdev->dev, &charger->extcon_work,
>     703					   rt5033_charger_extcon_work);
>     704		if (ret) {
>     705			dev_err(&pdev->dev, "failed to initialize extcon work\n");
>     706			return ret;
>     707		}
>     708	
>     709		charger->extcon_nb.notifier_call = rt5033_charger_extcon_notifier;
>   > 710		ret = devm_extcon_register_notifier_all(&pdev->dev, charger->edev,
>     711							&charger->extcon_nb);
>     712		if (ret) {
>     713			dev_err(&pdev->dev, "failed to register extcon notifier\n");
>     714			return ret;
>     715		}
>     716	out:
>     717		return 0;
>     718	}
>     719	
> 

I don't know why this happens. The patch [1] contains "#include 
<linux/extcon.h>", where the mentioned functions are referenced [2].

Could it be related to the conditions "#if IS_ENABLED(CONFIG_EXTCON)" 
and "#else /* CONFIG_EXTCON */" within "include/linux/extcon.h"? And 
that CONFIG_EXTCON maybe is not enabled in x86_64_defconfig [3]?

Btw. because a number of issues with that patch arose, Lee Jones 
withdrew the pull request of that patch for the merge window to 6.6-rc1 [4].

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/power/supply/rt5033_charger.c?h=next-20230824&id=12cc585f36b8dffa68b809c2d23a9bd73ee6ffd2
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/linux/extcon.h?h=next-20230824
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/x86/configs/x86_64_defconfig?h=next-20230824
[4] 
https://lore.kernel.org/linux-pm/cover.1684182964.git.jahau@rocketmail.com/T/#m3b7a4e487f402e0b817c617f58abf51f856831db

Kind regards,
Jakob
