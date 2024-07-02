Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCC5523D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719948156; cv=none; b=WmAltbWpb/LJXtz4QkwCZ2S9DZ7DMFRZ6/uczk+hfshFN8UAj+VhB/9F29IiirWRBMBM/jJcLOjJr4YFTgGK6ta3emjVeFkZYA+HNiqFht/pV5bs/2cYoIeUXPxvUdCXWG+bXlONtulj6J3HhDZ1FouTwrFMe0j2tncoCKP9u2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719948156; c=relaxed/simple;
	bh=5kGDYkKbKmBgnrvyWtpET9/BfVjZOFrGuIYfHnUyif8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/yxIWuDQI1BMOwm1KgOFCwMXFZRvnIM6cic/Jf4wScxarmv/7rUYz9ER1swYYOVNjRca0gsU/9lq3jzlpRgdjVxTIfzIh1a0xotvY9Z1G1FCr33T+qtOr6Ho3jbo9b9ForsnzzMYKkae3aCRxUR1y6CYyJ8lkJ/Dc/rFAnQYrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwKpKkzw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwKpKkzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719948153; x=1751484153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5kGDYkKbKmBgnrvyWtpET9/BfVjZOFrGuIYfHnUyif8=;
  b=jwKpKkzw5pglVk6uY/jIeU0aFJXDrTQUplqMlXKqbMEja+yleS0785Az
   B0k+xG8jvV67Xp9T7ogOkefqTpj/OpthGHsHlAokcYJ3jXzx/tAcgCHb1
   KjGxzcIkQTLi+ENV28ZCyGbGnBPpaXYBWHmDJ0xumlVqaq92mE1IW1EuA
   yDzb+llLaBdxakRJIIstTaWCavS6PU6K3h90f3VLMaGNASvqMdqP10sRa
   3FhfKgZnh8+UzrerSWtGkOKMxnvQjNWukJiDGZpLSrqGDfv9IgD6Yxf4C
   +UfhStGNEUxdJGsyh1uMHenwLcqR9w+oIWuDYXA4IXVm9gRLXaFpnjmK/
   A==;
X-CSE-ConnectionGUID: LKznbzx4S+y5JtEDRa2Skw==
X-CSE-MsgGUID: xBzpp06JQPi9jCvnE0fzXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20047986"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="20047986"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 12:22:32 -0700
X-CSE-ConnectionGUID: mucJ5F3TSTm3JhYxknE10w==
X-CSE-MsgGUID: bAM2udvSSb6FKaW+9AuKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="76734674"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2024 12:22:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOj5A-000OZc-0S;
	Tue, 02 Jul 2024 19:22:28 +0000
Date: Wed, 3 Jul 2024 03:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 3/5] drm/panel: panel-jadard-jd9365da-h3: use wrapped
 MIPI DCS functions
Message-ID: <202407030221.tvdUptkM-lkp@intel.com>
References: <20240628124444.28152-4-lvzhaoxiong@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628124444.28152-4-lvzhaoxiong@huaqin.corp-partner.google.com>

Hi Zhaoxiong,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.10-rc6]
[cannot apply to next-20240702]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhaoxiong-Lv/drm-panel-jd9365da-Modify-the-method-of-sending-commands/20240630-000444
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240628124444.28152-4-lvzhaoxiong%40huaqin.corp-partner.google.com
patch subject: [PATCH v6 3/5] drm/panel: panel-jadard-jd9365da-h3: use wrapped MIPI DCS functions
config: arm-randconfig-002-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030221.tvdUptkM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030221.tvdUptkM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030221.tvdUptkM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'jadard_enable':
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:50:16: error: variable 'dsi_ctx' has initializer but incomplete type
      50 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:50:52: error: 'struct mipi_dsi_multi_context' has no member named 'dsi'
      50 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                    ^~~
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:50:58: warning: excess elements in struct initializer
      50 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                          ^~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:50:58: note: (near initialization for 'dsi_ctx')
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:50:39: error: storage size of 'dsi_ctx' isn't known
      50 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:54:9: error: implicit declaration of function 'mipi_dsi_dcs_exit_sleep_mode_multi'; did you mean 'mipi_dsi_dcs_exit_sleep_mode'? [-Werror=implicit-function-declaration]
      54 |         mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mipi_dsi_dcs_exit_sleep_mode
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:56:9: error: implicit declaration of function 'mipi_dsi_dcs_set_display_on_multi'; did you mean 'mipi_dsi_dcs_set_display_on'? [-Werror=implicit-function-declaration]
      56 |         mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mipi_dsi_dcs_set_display_on
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:50:39: warning: unused variable 'dsi_ctx' [-Wunused-variable]
      50 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'jadard_disable':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:64:16: error: variable 'dsi_ctx' has initializer but incomplete type
      64 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:64:52: error: 'struct mipi_dsi_multi_context' has no member named 'dsi'
      64 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                    ^~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:64:58: warning: excess elements in struct initializer
      64 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                          ^~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:64:58: note: (near initialization for 'dsi_ctx')
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:64:39: error: storage size of 'dsi_ctx' isn't known
      64 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:66:9: error: implicit declaration of function 'mipi_dsi_dcs_set_display_off_multi'; did you mean 'mipi_dsi_dcs_set_display_off'? [-Werror=implicit-function-declaration]
      66 |         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mipi_dsi_dcs_set_display_off
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:68:9: error: implicit declaration of function 'mipi_dsi_dcs_enter_sleep_mode_multi'; did you mean 'mipi_dsi_dcs_enter_sleep_mode'? [-Werror=implicit-function-declaration]
      68 |         mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mipi_dsi_dcs_enter_sleep_mode
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:64:39: warning: unused variable 'dsi_ctx' [-Wunused-variable]
      64 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'radxa_display_8hd_ad002_init_cmds':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:149:16: error: variable 'dsi_ctx' has initializer but incomplete type
     149 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:149:52: error: 'struct mipi_dsi_multi_context' has no member named 'dsi'
     149 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                    ^~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:149:58: warning: excess elements in struct initializer
     149 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                          ^~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:149:58: note: (near initialization for 'dsi_ctx')
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:149:39: error: storage size of 'dsi_ctx' isn't known
     149 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:151:9: error: implicit declaration of function 'mipi_dsi_dcs_write_seq_multi'; did you mean 'mipi_dsi_dcs_write_seq'? [-Werror=implicit-function-declaration]
     151 |         mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mipi_dsi_dcs_write_seq
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:149:39: warning: unused variable 'dsi_ctx' [-Wunused-variable]
     149 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'cz101b4001_init_cmds':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:349:16: error: variable 'dsi_ctx' has initializer but incomplete type
     349 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:349:52: error: 'struct mipi_dsi_multi_context' has no member named 'dsi'
     349 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                    ^~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:349:58: warning: excess elements in struct initializer
     349 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                          ^~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:349:58: note: (near initialization for 'dsi_ctx')
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:349:39: error: storage size of 'dsi_ctx' isn't known
     349 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:349:39: warning: unused variable 'dsi_ctx' [-Wunused-variable]
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'radxa_display_8hd_ad002_init_cmds':
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:322:1: warning: control reaches end of non-void function [-Wreturn-type]
     322 | };
         | ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'cz101b4001_init_cmds':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:547:1: warning: control reaches end of non-void function [-Wreturn-type]
     547 | };
         | ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'jadard_disable':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:71:1: warning: control reaches end of non-void function [-Wreturn-type]
      71 | }
         | ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'jadard_enable':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:59:1: warning: control reaches end of non-void function [-Wreturn-type]
      59 | }
         | ^
   cc1: some warnings being treated as errors


vim +/dsi_ctx +50 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c

    46	
    47	static int jadard_enable(struct drm_panel *panel)
    48	{
    49		struct jadard *jadard = panel_to_jadard(panel);
  > 50		struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
    51	
    52		msleep(120);
    53	
  > 54		mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
    55	
  > 56		mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
    57	
    58		return dsi_ctx.accum_err;
    59	}
    60	
    61	static int jadard_disable(struct drm_panel *panel)
    62	{
    63		struct jadard *jadard = panel_to_jadard(panel);
    64		struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
    65	
  > 66		mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
    67	
  > 68		mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
    69	
    70		return dsi_ctx.accum_err;
    71	}
    72	
    73	static int jadard_prepare(struct drm_panel *panel)
    74	{
    75		struct jadard *jadard = panel_to_jadard(panel);
    76		int ret;
    77	
    78		ret = regulator_enable(jadard->vccio);
    79		if (ret)
    80			return ret;
    81	
    82		ret = regulator_enable(jadard->vdd);
    83		if (ret)
    84			return ret;
    85	
    86		gpiod_set_value(jadard->reset, 1);
    87		msleep(5);
    88	
    89		gpiod_set_value(jadard->reset, 0);
    90		msleep(10);
    91	
    92		gpiod_set_value(jadard->reset, 1);
    93		msleep(130);
    94	
    95		ret = jadard->desc->init(jadard);
    96		if (ret)
    97			return ret;
    98	
    99		return 0;
   100	}
   101	
   102	static int jadard_unprepare(struct drm_panel *panel)
   103	{
   104		struct jadard *jadard = panel_to_jadard(panel);
   105	
   106		gpiod_set_value(jadard->reset, 1);
   107		msleep(120);
   108	
   109		regulator_disable(jadard->vdd);
   110		regulator_disable(jadard->vccio);
   111	
   112		return 0;
   113	}
   114	
   115	static int jadard_get_modes(struct drm_panel *panel,
   116				    struct drm_connector *connector)
   117	{
   118		struct jadard *jadard = panel_to_jadard(panel);
   119		const struct drm_display_mode *desc_mode = &jadard->desc->mode;
   120		struct drm_display_mode *mode;
   121	
   122		mode = drm_mode_duplicate(connector->dev, desc_mode);
   123		if (!mode) {
   124			DRM_DEV_ERROR(&jadard->dsi->dev, "failed to add mode %ux%ux@%u\n",
   125				      desc_mode->hdisplay, desc_mode->vdisplay,
   126				      drm_mode_vrefresh(desc_mode));
   127			return -ENOMEM;
   128		}
   129	
   130		drm_mode_set_name(mode);
   131		drm_mode_probed_add(connector, mode);
   132	
   133		connector->display_info.width_mm = mode->width_mm;
   134		connector->display_info.height_mm = mode->height_mm;
   135	
   136		return 1;
   137	}
   138	
   139	static const struct drm_panel_funcs jadard_funcs = {
   140		.disable = jadard_disable,
   141		.unprepare = jadard_unprepare,
   142		.prepare = jadard_prepare,
   143		.enable = jadard_enable,
   144		.get_modes = jadard_get_modes,
   145	};
   146	
   147	static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
   148	{
   149		struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
   150	
 > 151		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
   152		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
   153		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x65);
   154		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0xf8);
   155		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x03);
   156		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x01);
   157		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
   158		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x7e);
   159		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x00);
   160		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x65);
   161		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
   162		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
   163		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xb7);
   164		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
   165		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
   166		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xb7);
   167		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
   168		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
   169		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x19);
   170		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
   171		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
   172		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x01);
   173		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x01);
   174		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x70);
   175		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
   176		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
   177		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
   178		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
   179		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
   180		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
   181		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0f);
   182		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x28);
   183		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x04);
   184		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
   185		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x01);
   186		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0xa9);
   187		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x0a);
   188		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
   189		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x37);
   190		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
   191		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x78);
   192		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x63);
   193		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x54);
   194		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x49);
   195		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x45);
   196		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x38);
   197		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x3d);
   198		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x28);
   199		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
   200		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x41);
   201		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x43);
   202		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x62);
   203		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x50);
   204		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x57);
   205		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x49);
   206		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x44);
   207		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x37);
   208		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x23);
   209		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x10);
   210		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x78);
   211		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x63);
   212		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x54);
   213		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x49);
   214		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x45);
   215		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x38);
   216		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x3d);
   217		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x28);
   218		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
   219		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x41);
   220		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x43);
   221		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x62);
   222		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x50);
   223		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x57);
   224		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x49);
   225		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x44);
   226		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x37);
   227		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x23);
   228		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x10);
   229		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x02);
   230		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x47);
   231		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x47);
   232		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x45);
   233		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x45);
   234		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x4b);
   235		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x4b);
   236		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x49);
   237		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x49);
   238		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x41);
   239		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x1f);
   240		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x1f);
   241		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x1f);
   242		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x1f);
   243		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x1f);
   244		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x1f);
   245		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x5f);
   246		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x5f);
   247		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x57);
   248		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
   249		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x35);
   250		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x1f);
   251		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x1f);
   252		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x46);
   253		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x46);
   254		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x44);
   255		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x44);
   256		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x4a);
   257		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x4a);
   258		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x48);
   259		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x48);
   260		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x40);
   261		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x1f);
   262		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x1f);
   263		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x1f);
   264		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x1f);
   265		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x1f);
   266		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x1f);
   267		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x5f);
   268		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x5f);
   269		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x57);
   270		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
   271		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x35);
   272		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x1f);
   273		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x1f);
   274		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
   275		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
   276		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
   277		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x10);
   278		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x06);
   279		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x40);
   280		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
   281		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
   282		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
   283		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x01);
   284		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x02);
   285		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x03);
   286		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x6b);
   287		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x05);
   288		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x0c);
   289		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
   290		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x09);
   291		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x03);
   292		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x56);
   293		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
   294		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
   295		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
   296		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
   297		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
   298		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x00);
   299		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x00);
   300		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x06);
   301		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x7b);
   302		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x00);
   303		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xf8);
   304		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
   305		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xd5);
   306		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2e);
   307		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x12);
   308		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x03);
   309		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x00);
   310		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x00);
   311		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x03);
   312		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x7b);
   313		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x04);
   314		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
   315		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
   316		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x60);
   317		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x2a);
   318		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x59);
   319		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
   320	
   321		return dsi_ctx.accum_err;
   322	};
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
