Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E028B79F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692629965; x=1724165965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9U2WH4DwRrp4v8v8A6/BhiUepjDETRp0adS6QJ+BGYI=;
  b=O5tiFGtpzr6Swvg1sFJ1Iiz+fBhQy7F6egTZabhAhPmtl/ej13YGChni
   Pn28K0GfmWKeeFmCjiA/JwOpDSoI4urofJnUMnn5XQAENjf6dDDLRD6XV
   088Ucvs518WDp7Iwu133FaOSaf9Nrg1AO8CWc5ENwZv++FrbuAhqbYWA1
   ckCnIJt4KO83SdwlW0erKPDP1Meg6Zw9QRifa3NxirIOMRe2wGBfm8PAL
   TOR4K+aGWcufhd5NPsvzcs9bEP99MvVVLc4fzka66HMJEbSdpdUUKrISf
   OkLVX4c1PFz13DlrO+4FJzkznQc06/O9Aj2Ra4uYwTMPHD1/9nxlGQWBe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376359235"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="376359235"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 07:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="712821531"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="712821531"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 07:59:21 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY6NF-0000bk-0f;
	Mon, 21 Aug 2023 14:59:21 +0000
Date: Mon, 21 Aug 2023 22:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>
Subject: [linux-next:master 9894/11453] drivers/mfd/cs42l43.c:1138:12:
 warning: 'cs42l43_runtime_resume' defined but not used
Message-ID: <202308212225.fGjY1rr6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: ace6d14481386ec6c1b63cc2b24c71433a583dc2 [9894/11453] mfd: cs42l43: Add support for cs42l43 core driver
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20230821/202308212225.fGjY1rr6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212225.fGjY1rr6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212225.fGjY1rr6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/cs42l43.c:1138:12: warning: 'cs42l43_runtime_resume' defined but not used [-Wunused-function]
    1138 | static int cs42l43_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/cs42l43.c:1124:12: warning: 'cs42l43_runtime_suspend' defined but not used [-Wunused-function]
    1124 | static int cs42l43_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/cs42l43.c:1106:12: warning: 'cs42l43_resume' defined but not used [-Wunused-function]
    1106 | static int cs42l43_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/mfd/cs42l43.c:1076:12: warning: 'cs42l43_suspend' defined but not used [-Wunused-function]
    1076 | static int cs42l43_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/cs42l43_runtime_resume +1138 drivers/mfd/cs42l43.c

  1075	
> 1076	static int cs42l43_suspend(struct device *dev)
  1077	{
  1078		struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
  1079		int ret;
  1080	
  1081		/*
  1082		 * Don't care about being resumed here, but the driver does want
  1083		 * force_resume to always trigger an actual resume, so that register
  1084		 * state for the MCU/GPIOs is returned as soon as possible after system
  1085		 * resume. force_resume will resume if the reference count is resumed on
  1086		 * suspend hence the get_noresume.
  1087		 */
  1088		pm_runtime_get_noresume(dev);
  1089	
  1090		ret = pm_runtime_force_suspend(dev);
  1091		if (ret) {
  1092			dev_err(cs42l43->dev, "Failed to force suspend: %d\n", ret);
  1093			pm_runtime_put_noidle(dev);
  1094			return ret;
  1095		}
  1096	
  1097		pm_runtime_put_noidle(dev);
  1098	
  1099		ret = cs42l43_power_down(cs42l43);
  1100		if (ret)
  1101			return ret;
  1102	
  1103		return 0;
  1104	}
  1105	
> 1106	static int cs42l43_resume(struct device *dev)
  1107	{
  1108		struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
  1109		int ret;
  1110	
  1111		ret = cs42l43_power_up(cs42l43);
  1112		if (ret)
  1113			return ret;
  1114	
  1115		ret = pm_runtime_force_resume(dev);
  1116		if (ret) {
  1117			dev_err(cs42l43->dev, "Failed to force resume: %d\n", ret);
  1118			return ret;
  1119		}
  1120	
  1121		return 0;
  1122	}
  1123	
> 1124	static int cs42l43_runtime_suspend(struct device *dev)
  1125	{
  1126		struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
  1127	
  1128		/*
  1129		 * Whilst the driver doesn't power the chip down here, going into runtime
  1130		 * suspend lets the SoundWire bus power down, which means the driver
  1131		 * can't communicate with the device any more.
  1132		 */
  1133		regcache_cache_only(cs42l43->regmap, true);
  1134	
  1135		return 0;
  1136	}
  1137	
> 1138	static int cs42l43_runtime_resume(struct device *dev)
  1139	{
  1140		struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
  1141		unsigned int reset_canary;
  1142		int ret;
  1143	
  1144		ret = cs42l43_wait_for_attach(cs42l43);
  1145		if (ret)
  1146			return ret;
  1147	
  1148		ret = regmap_read(cs42l43->regmap, CS42L43_RELID, &reset_canary);
  1149		if (ret) {
  1150			dev_err(cs42l43->dev, "Failed to check reset canary: %d\n", ret);
  1151			goto err;
  1152		}
  1153	
  1154		if (!reset_canary) {
  1155			/*
  1156			 * If the canary has cleared the chip has reset, re-handle the
  1157			 * MCU and mark the cache as dirty to indicate the chip reset.
  1158			 */
  1159			ret = cs42l43_mcu_update(cs42l43);
  1160			if (ret)
  1161				goto err;
  1162	
  1163			regcache_mark_dirty(cs42l43->regmap);
  1164		}
  1165	
  1166		ret = regcache_sync(cs42l43->regmap);
  1167		if (ret) {
  1168			dev_err(cs42l43->dev, "Failed to restore register cache: %d\n", ret);
  1169			goto err;
  1170		}
  1171	
  1172		return 0;
  1173	
  1174	err:
  1175		regcache_cache_only(cs42l43->regmap, true);
  1176	
  1177		return ret;
  1178	}
  1179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
