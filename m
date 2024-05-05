Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D971D540
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714917065; cv=none; b=FuLwbqyceDNFE1JH+m0y8XkCroZMG/eNqOfXqetR0nfAXpC1uay9FBeygBpFjSr5R9QRMvH94Wt2agqDKvxdNdjERdkNMVLgRz71krTnuKTiCZGjije1MfsJIwTRB00YiGUyN8V8HuchJqL5cIDRNY1dz604qCoxNxF2seu7LMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714917065; c=relaxed/simple;
	bh=BJLOAIkEPJk3O3poEQBhkLWF4C8ZrHu4ildOno4JSvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BDpELdTP/Q5zCgCFg52wcmjsQgPZGRG02Nz2Yc0ghHXQugGub/eWmOj0cVgSqZJgwy/ry4ucL7zOLbC3v+A9iEYGkmRbHwwIHdoEode71OplmDpqw7pzF67QZxAAbNtgpP9zjF1+fqAwCdmT2LN5Ed7wNyBaKUZmMOahzUPUivU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqZFAQwY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqZFAQwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714917062; x=1746453062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BJLOAIkEPJk3O3poEQBhkLWF4C8ZrHu4ildOno4JSvk=;
  b=nqZFAQwY16P3FacXofU/vWQKpI1zdJtAX/rTQciVEPvq6rOQUruOTdYU
   tXmD0dcrXPcGHesxU+ErDErqRspjHGE91SCA9Q7d699V1nWLQto3Z8Sci
   B3jG07MlKH4mJNZn30oAdxDtXwEsDrjs/pYWQCkVKhQwFtUcNdvfHhJ5H
   yILTSfov0EPozpMHVZB/eImEmMAhKaCtDDWXO9Wxm3vY6n6jjISx1U7Q9
   7fZyPhdLpfzoJKnEFTqZm5Ntp2FSyAynYifdZWWjjK2BWZ7TSlOuvYVic
   HnNXInlXFp6Hpdcw70uxG5SJcGn40YhIy2zUvwAZMqu0NNrk/1HWqJFVv
   A==;
X-CSE-ConnectionGUID: H1vEyllpR8+ss+GPSl25xw==
X-CSE-MsgGUID: Q5zcOqIdToumFW9m6JKGrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10592661"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="10592661"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 06:51:01 -0700
X-CSE-ConnectionGUID: ut3FrbilSdKQXw0bX/EWhA==
X-CSE-MsgGUID: pqD+dmaWQHC9i4tAGIdzEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="32720850"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 May 2024 06:51:00 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3cGX-0000Fu-17;
	Sun, 05 May 2024 13:50:57 +0000
Date: Sun, 5 May 2024 21:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 8796/10967]
 drivers/net/dsa/realtek/rtl8366rb.c:953:undefined reference to
 `led_init_default_state_get'
Message-ID: <202405052115.cnbey0X4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9221b2819b8a4196eecf5476d66201be60fbcf29
commit: 32d617005475a71ebcc4ec8b2791e8d1481e9a10 [8796/10967] net: dsa: realtek: add LED drivers for rtl8366rb
config: parisc-randconfig-r033-20220123 (https://download.01.org/0day-ci/archive/20240505/202405052115.cnbey0X4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405052115.cnbey0X4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405052115.cnbey0X4-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/net/dsa/realtek/rtl8366rb.o: in function `rtl8366rb_setup_led':
>> drivers/net/dsa/realtek/rtl8366rb.c:953:(.text+0x1648): undefined reference to `led_init_default_state_get'
>> hppa-linux-ld: drivers/net/dsa/realtek/rtl8366rb.c:980:(.text+0x178c): undefined reference to `devm_led_classdev_register_ext'
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized


vim +953 drivers/net/dsa/realtek/rtl8366rb.c

   927	
   928	static int rtl8366rb_setup_led(struct realtek_priv *priv, struct dsa_port *dp,
   929				       struct fwnode_handle *led_fwnode)
   930	{
   931		struct rtl8366rb *rb = priv->chip_data;
   932		struct led_init_data init_data = { };
   933		enum led_default_state state;
   934		struct rtl8366rb_led *led;
   935		u32 led_group;
   936		int ret;
   937	
   938		ret = fwnode_property_read_u32(led_fwnode, "reg", &led_group);
   939		if (ret)
   940			return ret;
   941	
   942		if (led_group >= RTL8366RB_NUM_LEDGROUPS) {
   943			dev_warn(priv->dev, "Invalid LED reg %d defined for port %d",
   944				 led_group, dp->index);
   945			return -EINVAL;
   946		}
   947	
   948		led = &rb->leds[dp->index][led_group];
   949		led->port_num = dp->index;
   950		led->led_group = led_group;
   951		led->priv = priv;
   952	
 > 953		state = led_init_default_state_get(led_fwnode);
   954		switch (state) {
   955		case LEDS_DEFSTATE_ON:
   956			led->cdev.brightness = 1;
   957			rb8366rb_set_port_led(led, 1);
   958			break;
   959		case LEDS_DEFSTATE_KEEP:
   960			led->cdev.brightness =
   961				rb8366rb_get_port_led(led);
   962			break;
   963		case LEDS_DEFSTATE_OFF:
   964		default:
   965			led->cdev.brightness = 0;
   966			rb8366rb_set_port_led(led, 0);
   967		}
   968	
   969		led->cdev.max_brightness = 1;
   970		led->cdev.brightness_set_blocking =
   971			rtl8366rb_cled_brightness_set_blocking;
   972		init_data.fwnode = led_fwnode;
   973		init_data.devname_mandatory = true;
   974	
   975		init_data.devicename = kasprintf(GFP_KERNEL, "Realtek-%d:0%d:%d",
   976						 dp->ds->index, dp->index, led_group);
   977		if (!init_data.devicename)
   978			return -ENOMEM;
   979	
 > 980		ret = devm_led_classdev_register_ext(priv->dev, &led->cdev, &init_data);
   981		if (ret) {
   982			dev_warn(priv->dev, "Failed to init LED %d for port %d",
   983				 led_group, dp->index);
   984			return ret;
   985		}
   986	
   987		return 0;
   988	}
   989	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
