Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A9B2AEEE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727547631; cv=none; b=ICgnB9FJAcjDrpLqXUmabIiBZK2vCPBBYpG0jyxI02p9ZMDE6hEaUKkINbeAS8gQ6cz9z6jNcPgm9ULWKPlIrf+sOCy7KYbSaVnREW3Z+cJmhNiyBG6hXYIG8m34r436TI/9i2F/c53L2ZEVUvGl5h4or+nG903bllK5LtV3Nbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727547631; c=relaxed/simple;
	bh=y2M0Pl7F0ktTXx8iTyvIfT9w8PnjOwWzd3yuuASlSYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJf8yk1wgeWWYFs9SHBccqxFoK53wGkAWmIBszhMqmQv5IR9OZa8mEHWAWbC6p1ki3zLGWRSNRn3h+uAgRt1/QvgNxG/edgxphb0vFZKqVC0P6MrvIFQ0gtwCrbrLMex8r1ZKTw/3LTnyv8ks59jzeCwIRFqEwPhdROvKUEjJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXZwZwO6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXZwZwO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727547628; x=1759083628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y2M0Pl7F0ktTXx8iTyvIfT9w8PnjOwWzd3yuuASlSYM=;
  b=nXZwZwO6UH72VAz+0pdz/TF9QVmTl+C+cIyR9wVHV3f6J458+UaNt1oZ
   ObnnF7Z5rFaAWurhWMGvsMAcwW8r4uOTjeqAYZTXksnaOydtbLnTImGWX
   E61Eht4kGFjQW8OGBcuBbFEJWYLaZpkJ/vewgxIgju3MSHsrzUai268va
   YL3c8gatmEarfygv5ip6Z5QJGVxjRYfpwVbfgZYaeDVyzX7aA0gMsY8tK
   8tSOwaYfEKzywPdRs8M46vgjXrJxFwAX3+QlhKbnuciin1Xa9f3cLu48E
   o8bJ0jInEUYnS+d5lQrEJcWZfme/u/qb4txCpGGy/yo5if0gGLITC5eaH
   g==;
X-CSE-ConnectionGUID: 6Jyyrrt7RP+Btk3KJmqaEQ==
X-CSE-MsgGUID: Q4HjVWNgRMS9ujSLR9PCag==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26849866"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26849866"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 11:20:27 -0700
X-CSE-ConnectionGUID: 8FSJkUgwR56RgK9E/JLulw==
X-CSE-MsgGUID: XDJjSFBdTfW4qnBY5rZcUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73655985"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Sep 2024 11:20:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suc3M-000NW7-0W;
	Sat, 28 Sep 2024 18:20:24 +0000
Date: Sun, 29 Sep 2024 02:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5904/16788]
 arch/arm/mach-imx/pm-rpmsg.c:141:6: warning: no previous prototype for
 'pm_shutdown_notify_m4'
Message-ID: <202409290258.8qPNES3D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 1d17a88e61fdfb2e93f6a78def034b53fc021b0f [5904/16788] Merge branch 'rpmsg/next' into next
config: arm-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290258.8qPNES3D-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290258.8qPNES3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290258.8qPNES3D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/pm-rpmsg.c:141:6: warning: no previous prototype for 'pm_shutdown_notify_m4' [-Wmissing-prototypes]
     141 | void pm_shutdown_notify_m4(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/pm-rpmsg.c:158:6: warning: no previous prototype for 'pm_reboot_notify_m4' [-Wmissing-prototypes]
     158 | void pm_reboot_notify_m4(void)
         |      ^~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/pm-rpmsg.c:175:7: warning: no previous prototype for 'pm_heartbeat_off_notify_m4' [-Wmissing-prototypes]
     175 | void  pm_heartbeat_off_notify_m4(bool enter)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/pm-rpmsg.c:29:
   arch/arm/mach-imx/common.h:164:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     164 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:57.15-60.5: Warning (unit_address_vs_reg): /reserved-memory/vdev1vring3: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:312.22-335.4: Warning (unit_address_vs_reg): /bus@40800000/lcdif@40aa0000/display@0: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:217.24-232.5: Warning (simple_bus_reg): /bus@40000000/spi@402A0000: simple-bus unit address format error, expected "402a0000"
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:146.46-156.5: Warning (simple_bus_reg): /regulators/regulator-usb-otg1-vbus: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:158.34-168.5: Warning (simple_bus_reg): /regulators/regulator-vsd-3v3: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:170.31-179.5: Warning (simple_bus_reg): /regulators/sd1_regulator: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:178.19-183.5: Warning (unique_unit_address_if_enabled): /bus@40000000/mu@40220000: duplicate unit-address (also used in node /bus@40000000/nmi@40220000)
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:178.19-183.5: Warning (unique_unit_address_if_enabled): /bus@40000000/mu@40220000: duplicate unit-address (also used in node /bus@40000000/mu_lp@40220000)
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:185.21-190.5: Warning (unique_unit_address_if_enabled): /bus@40000000/nmi@40220000: duplicate unit-address (also used in node /bus@40000000/mu_lp@40220000)
--
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:57.15-60.5: Warning (unit_address_vs_reg): /reserved-memory/vdev1vring3: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:312.22-335.4: Warning (unit_address_vs_reg): /bus@40800000/lcdif@40aa0000/display@0: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:217.24-232.5: Warning (simple_bus_reg): /bus@40000000/spi@402A0000: simple-bus unit address format error, expected "402a0000"
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:146.46-156.5: Warning (simple_bus_reg): /regulators/regulator-usb-otg1-vbus: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:158.34-168.5: Warning (simple_bus_reg): /regulators/regulator-vsd-3v3: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:170.31-179.5: Warning (simple_bus_reg): /regulators/sd1_regulator: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:178.19-183.5: Warning (unique_unit_address_if_enabled): /bus@40000000/mu@40220000: duplicate unit-address (also used in node /bus@40000000/nmi@40220000)
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:178.19-183.5: Warning (unique_unit_address_if_enabled): /bus@40000000/mu@40220000: duplicate unit-address (also used in node /bus@40000000/mu_lp@40220000)
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:185.21-190.5: Warning (unique_unit_address_if_enabled): /bus@40000000/nmi@40220000: duplicate unit-address (also used in node /bus@40000000/mu_lp@40220000)
--
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:217.24-232.5: Warning (simple_bus_reg): /bus@40000000/spi@402A0000: simple-bus unit address format error, expected "402a0000"
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:178.19-183.5: Warning (unique_unit_address_if_enabled): /bus@40000000/mu@40220000: duplicate unit-address (also used in node /bus@40000000/nmi@40220000)
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:178.19-183.5: Warning (unique_unit_address_if_enabled): /bus@40000000/mu@40220000: duplicate unit-address (also used in node /bus@40000000/mu_lp@40220000)
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:185.21-190.5: Warning (unique_unit_address_if_enabled): /bus@40000000/nmi@40220000: duplicate unit-address (also used in node /bus@40000000/mu_lp@40220000)
--
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:57.15-60.5: Warning (unit_address_vs_reg): /reserved-memory/vdev1vring3: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:312.22-335.4: Warning (unit_address_vs_reg): /bus@40800000/lcdif@40aa0000/display@0: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evkb-sd1.dts:13.29-21.5: Warning (unit_address_vs_reg): /regulators/regulator@2: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:217.24-232.5: Warning (simple_bus_reg): /bus@40000000/spi@402A0000: simple-bus unit address format error, expected "402a0000"
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:146.46-156.5: Warning (simple_bus_reg): /regulators/regulator-usb-otg1-vbus: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:158.34-168.5: Warning (simple_bus_reg): /regulators/regulator-vsd-3v3: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:170.31-179.5: Warning (simple_bus_reg): /regulators/sd1_regulator: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evkb-sd1.dts:13.29-21.5: Warning (simple_bus_reg): /regulators/regulator@2: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:178.19-183.5: Warning (unique_unit_address_if_enabled): /bus@40000000/mu@40220000: duplicate unit-address (also used in node /bus@40000000/nmi@40220000)
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:178.19-183.5: Warning (unique_unit_address_if_enabled): /bus@40000000/mu@40220000: duplicate unit-address (also used in node /bus@40000000/mu_lp@40220000)
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:185.21-190.5: Warning (unique_unit_address_if_enabled): /bus@40000000/nmi@40220000: duplicate unit-address (also used in node /bus@40000000/mu_lp@40220000)
--
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:57.15-60.5: Warning (unit_address_vs_reg): /reserved-memory/vdev1vring3: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:312.22-335.4: Warning (unit_address_vs_reg): /bus@40800000/lcdif@40aa0000/display@0: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:217.24-232.5: Warning (simple_bus_reg): /bus@40000000/spi@402A0000: simple-bus unit address format error, expected "402a0000"
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:146.46-156.5: Warning (simple_bus_reg): /regulators/regulator-usb-otg1-vbus: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:158.34-168.5: Warning (simple_bus_reg): /regulators/regulator-vsd-3v3: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts:170.31-179.5: Warning (simple_bus_reg): /regulators/sd1_regulator: missing or empty reg/ranges property
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:217.24-232.5: Warning (avoid_unnecessary_addr_size): /bus@40000000/spi@402A0000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:178.19-183.5: Warning (unique_unit_address_if_enabled): /bus@40000000/mu@40220000: duplicate unit-address (also used in node /bus@40000000/nmi@40220000)
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:178.19-183.5: Warning (unique_unit_address_if_enabled): /bus@40000000/mu@40220000: duplicate unit-address (also used in node /bus@40000000/mu_lp@40220000)
>> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:185.21-190.5: Warning (unique_unit_address_if_enabled): /bus@40000000/nmi@40220000: duplicate unit-address (also used in node /bus@40000000/mu_lp@40220000)

vim +/pm_shutdown_notify_m4 +141 arch/arm/mach-imx/pm-rpmsg.c

d782cdcb857ea1 Robin Gong  2019-08-07  140  
d782cdcb857ea1 Robin Gong  2019-08-07 @141  void pm_shutdown_notify_m4(void)
d782cdcb857ea1 Robin Gong  2019-08-07  142  {
d782cdcb857ea1 Robin Gong  2019-08-07  143  	struct pm_rpmsg_data msg;
d782cdcb857ea1 Robin Gong  2019-08-07  144  
68519b1eac81b8 Jacky Bai   2021-12-15  145  	memset(&msg, 0, sizeof(msg));
d782cdcb857ea1 Robin Gong  2019-08-07  146  	msg.header.cate = IMX_RMPSG_LIFECYCLE;
d782cdcb857ea1 Robin Gong  2019-08-07  147  	msg.header.major = IMX_RMPSG_MAJOR;
d782cdcb857ea1 Robin Gong  2019-08-07  148  	msg.header.minor = IMX_RMPSG_MINOR;
d782cdcb857ea1 Robin Gong  2019-08-07  149  	msg.header.type = PM_RPMSG_TYPE;
d782cdcb857ea1 Robin Gong  2019-08-07  150  	msg.header.cmd = PM_RPMSG_MODE;
d782cdcb857ea1 Robin Gong  2019-08-07  151  	msg.data = PM_RPMSG_SHUTDOWN;
d782cdcb857ea1 Robin Gong  2019-08-07  152  	/* No ACK from M4 */
7a778aa626469e Peng Fan    2022-12-06  153  	local_irq_enable();
d782cdcb857ea1 Robin Gong  2019-08-07  154  	pm_send_message(&msg, &pm_rpmsg, false);
eeff332d6fc9b2 Anson Huang 2019-08-07  155  	imx7ulp_poweroff();
d782cdcb857ea1 Robin Gong  2019-08-07  156  }
d782cdcb857ea1 Robin Gong  2019-08-07  157  
d782cdcb857ea1 Robin Gong  2019-08-07 @158  void pm_reboot_notify_m4(void)
d782cdcb857ea1 Robin Gong  2019-08-07  159  {
d782cdcb857ea1 Robin Gong  2019-08-07  160  	struct pm_rpmsg_data msg;
d782cdcb857ea1 Robin Gong  2019-08-07  161  
68519b1eac81b8 Jacky Bai   2021-12-15  162  	memset(&msg, 0, sizeof(msg));
d782cdcb857ea1 Robin Gong  2019-08-07  163  	msg.header.cate = IMX_RMPSG_LIFECYCLE;
d782cdcb857ea1 Robin Gong  2019-08-07  164  	msg.header.major = IMX_RMPSG_MAJOR;
d782cdcb857ea1 Robin Gong  2019-08-07  165  	msg.header.minor = IMX_RMPSG_MINOR;
d782cdcb857ea1 Robin Gong  2019-08-07  166  	msg.header.type = PM_RPMSG_TYPE;
d782cdcb857ea1 Robin Gong  2019-08-07  167  	msg.header.cmd = PM_RPMSG_MODE;
d782cdcb857ea1 Robin Gong  2019-08-07  168  	msg.data = PM_RPMSG_REBOOT;
d782cdcb857ea1 Robin Gong  2019-08-07  169  
7a778aa626469e Peng Fan    2022-12-06  170  	pm_send_message(&msg, &pm_rpmsg, false);
5c72c1db5a5fbb Peng Fan    2022-12-06  171  	/* Give a grace period for failure to restart of 1s */
5c72c1db5a5fbb Peng Fan    2022-12-06  172  	mdelay(1000);
d782cdcb857ea1 Robin Gong  2019-08-07  173  }
d782cdcb857ea1 Robin Gong  2019-08-07  174  
d782cdcb857ea1 Robin Gong  2019-08-07 @175  void  pm_heartbeat_off_notify_m4(bool enter)
d782cdcb857ea1 Robin Gong  2019-08-07  176  {
d782cdcb857ea1 Robin Gong  2019-08-07  177  	struct pm_rpmsg_data msg;
d782cdcb857ea1 Robin Gong  2019-08-07  178  
68519b1eac81b8 Jacky Bai   2021-12-15  179  	memset(&msg, 0, sizeof(msg));
d782cdcb857ea1 Robin Gong  2019-08-07  180  	msg.header.cate = IMX_RMPSG_LIFECYCLE;
d782cdcb857ea1 Robin Gong  2019-08-07  181  	msg.header.major = IMX_RMPSG_MAJOR;
d782cdcb857ea1 Robin Gong  2019-08-07  182  	msg.header.minor = IMX_RMPSG_MINOR;
d782cdcb857ea1 Robin Gong  2019-08-07  183  	msg.header.type = PM_RPMSG_TYPE;
d782cdcb857ea1 Robin Gong  2019-08-07  184  	msg.header.cmd = PM_RPMSG_HEART_BEAT_OFF;
d782cdcb857ea1 Robin Gong  2019-08-07  185  	msg.data = enter ? 0 : 1;
d782cdcb857ea1 Robin Gong  2019-08-07  186  
d782cdcb857ea1 Robin Gong  2019-08-07  187  	pm_send_message(&msg, &pm_rpmsg, true);
d782cdcb857ea1 Robin Gong  2019-08-07  188  }
d782cdcb857ea1 Robin Gong  2019-08-07  189  

:::::: The code at line 141 was first introduced by commit
:::::: d782cdcb857ea1f53912c56dedf085cd78fd7068 ARM: mach-imx: add heartbeat driver for i.mx7ulp

:::::: TO: Robin Gong <yibin.gong@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
