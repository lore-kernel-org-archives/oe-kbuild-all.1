Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABEE1E531
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 20:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719953438; cv=none; b=fbD0c80bxy+0hWvVK3RKUWvs5wteyE2TKJQwK3E/u+5wunV+g1rF36NGDHfTkPeh7IgleeHwnRYzSyl94xMLb9bqC0kmqRhng63w7xlJS+a2bt9eIC4wfqXjpr+HEFqtJQYVSbxvhqXc2OUZqpf1HqWbcNvnYBqPpX545ttGtOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719953438; c=relaxed/simple;
	bh=Cwjnx+FEMBTIDR9PXutb59mpUIGT8Yev/6uO67BsYq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLl1qcbxMXQDNlapm8YCPrxjcZzh1vI5oClIHx0ySmSzG/5RSIj60eow/I9yDJPunDNtOkfO/aKAKj+115ltUrFIZLDgWl/Uzpho53Xly2jTPrdkLzlmUmmNE/GbC8LG+Z4H871FX6SXxhJK0oDIOwXY+zlm2zRmWYf0LhHE/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpA/QU08; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpA/QU08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719953436; x=1751489436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cwjnx+FEMBTIDR9PXutb59mpUIGT8Yev/6uO67BsYq4=;
  b=mpA/QU08JG9uRXQcGaLZvM60Av2yOLgv7xUiXyYIk4FpAL47BXgUrf8Z
   sG95zT/KqV2hC+zzWzYRVnP2Ads7+om5weTTtIXPSLu7eF9XBwB53p4w2
   +8lK/yiPyIzppDMkIAXeW+LEaKSRu1wZLezzVgQ+mhdzRT6JVd/Bz+DYv
   1EzY9gPOUPWnuBedrT0fqxm+dZ4Z/zgVaZmpAGMbHfLekPgIP4HxTEGPu
   Xc75uKdnRVIhjhq5XTCuruPtwxjh2bAR+MCeJ2Hhx4KE4omcGMN+7RoBg
   StK75pIsS4HrU2YL30I1dboJ4LUcOiyKAW6aeBJ/DuZ83sxDOC/BhsmZc
   Q==;
X-CSE-ConnectionGUID: oMf2LpyAQqSg+JlZNb1OTg==
X-CSE-MsgGUID: bfQiCJXkQuOw1XD3zJMkkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17029640"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="17029640"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 13:50:35 -0700
X-CSE-ConnectionGUID: FCUCoOy9RXyeajDlEVzHfA==
X-CSE-MsgGUID: j6VE4eBnT1OtzjVWdLMx8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="76755902"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2024 13:50:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOkSN-000OeE-0d;
	Tue, 02 Jul 2024 20:50:31 +0000
Date: Wed, 3 Jul 2024 04:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 4/5] drm/panel: jd9365da: Support for kd101ne3-40ti
 MIPI-DSI panel
Message-ID: <202407030411.VeCz1hxD-lkp@intel.com>
References: <20240628124444.28152-5-lvzhaoxiong@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628124444.28152-5-lvzhaoxiong@huaqin.corp-partner.google.com>

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
patch link:    https://lore.kernel.org/r/20240628124444.28152-5-lvzhaoxiong%40huaqin.corp-partner.google.com
patch subject: [PATCH v6 4/5] drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel
config: arm-randconfig-002-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030411.VeCz1hxD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030411.VeCz1hxD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030411.VeCz1hxD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'jadard_enable':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:59:16: error: variable 'dsi_ctx' has initializer but incomplete type
      59 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:59:52: error: 'struct mipi_dsi_multi_context' has no member named 'dsi'
      59 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                    ^~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:59:58: warning: excess elements in struct initializer
      59 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                          ^~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:59:58: note: (near initialization for 'dsi_ctx')
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:59:39: error: storage size of 'dsi_ctx' isn't known
      59 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:63:9: error: implicit declaration of function 'mipi_dsi_dcs_exit_sleep_mode_multi'; did you mean 'mipi_dsi_dcs_exit_sleep_mode'? [-Werror=implicit-function-declaration]
      63 |         mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mipi_dsi_dcs_exit_sleep_mode
>> drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:66:17: error: implicit declaration of function 'mipi_dsi_msleep'; did you mean 'mipi_dsi_dcs_nop'? [-Werror=implicit-function-declaration]
      66 |                 mipi_dsi_msleep(&dsi_ctx, jadard->desc->exit_sleep_to_display_on_delay_ms);
         |                 ^~~~~~~~~~~~~~~
         |                 mipi_dsi_dcs_nop
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:68:9: error: implicit declaration of function 'mipi_dsi_dcs_set_display_on_multi'; did you mean 'mipi_dsi_dcs_set_display_on'? [-Werror=implicit-function-declaration]
      68 |         mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mipi_dsi_dcs_set_display_on
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:59:39: warning: unused variable 'dsi_ctx' [-Wunused-variable]
      59 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'jadard_disable':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:79:16: error: variable 'dsi_ctx' has initializer but incomplete type
      79 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:79:52: error: 'struct mipi_dsi_multi_context' has no member named 'dsi'
      79 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                    ^~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:79:58: warning: excess elements in struct initializer
      79 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                          ^~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:79:58: note: (near initialization for 'dsi_ctx')
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:79:39: error: storage size of 'dsi_ctx' isn't known
      79 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:84:9: error: implicit declaration of function 'mipi_dsi_dcs_set_display_off_multi'; did you mean 'mipi_dsi_dcs_set_display_off'? [-Werror=implicit-function-declaration]
      84 |         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mipi_dsi_dcs_set_display_off
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:89:9: error: implicit declaration of function 'mipi_dsi_dcs_enter_sleep_mode_multi'; did you mean 'mipi_dsi_dcs_enter_sleep_mode'? [-Werror=implicit-function-declaration]
      89 |         mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mipi_dsi_dcs_enter_sleep_mode
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:79:39: warning: unused variable 'dsi_ctx' [-Wunused-variable]
      79 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'radxa_display_8hd_ad002_init_cmds':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:191:16: error: variable 'dsi_ctx' has initializer but incomplete type
     191 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:191:52: error: 'struct mipi_dsi_multi_context' has no member named 'dsi'
     191 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                    ^~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:191:58: warning: excess elements in struct initializer
     191 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                          ^~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:191:58: note: (near initialization for 'dsi_ctx')
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:191:39: error: storage size of 'dsi_ctx' isn't known
     191 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:193:9: error: implicit declaration of function 'mipi_dsi_dcs_write_seq_multi'; did you mean 'mipi_dsi_dcs_write_seq'? [-Werror=implicit-function-declaration]
     193 |         mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mipi_dsi_dcs_write_seq
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:191:39: warning: unused variable 'dsi_ctx' [-Wunused-variable]
     191 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'cz101b4001_init_cmds':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:391:16: error: variable 'dsi_ctx' has initializer but incomplete type
     391 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:391:52: error: 'struct mipi_dsi_multi_context' has no member named 'dsi'
     391 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                    ^~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:391:58: warning: excess elements in struct initializer
     391 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                          ^~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:391:58: note: (near initialization for 'dsi_ctx')
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:391:39: error: storage size of 'dsi_ctx' isn't known
     391 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:391:39: warning: unused variable 'dsi_ctx' [-Wunused-variable]
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'kingdisplay_kd101ne3_init_cmds':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:616:16: error: variable 'dsi_ctx' has initializer but incomplete type
     616 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:616:52: error: 'struct mipi_dsi_multi_context' has no member named 'dsi'
     616 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                    ^~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:616:58: warning: excess elements in struct initializer
     616 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                                          ^~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:616:58: note: (near initialization for 'dsi_ctx')
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:616:39: error: storage size of 'dsi_ctx' isn't known
     616 |         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
         |                                       ^~~~~~~
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:616:39: warning: unused variable 'dsi_ctx' [-Wunused-variable]
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'radxa_display_8hd_ad002_init_cmds':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:364:1: warning: control reaches end of non-void function [-Wreturn-type]
     364 | };
         | ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'kingdisplay_kd101ne3_init_cmds':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:811:1: warning: control reaches end of non-void function [-Wreturn-type]
     811 | };
         | ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'cz101b4001_init_cmds':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:589:1: warning: control reaches end of non-void function [-Wreturn-type]
     589 | };
         | ^
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c: In function 'jadard_disable':
   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:95:1: warning: control reaches end of non-void function [-Wreturn-type]


vim +66 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c

    55	
    56	static int jadard_enable(struct drm_panel *panel)
    57	{
    58		struct jadard *jadard = panel_to_jadard(panel);
  > 59		struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
    60	
    61		msleep(120);
    62	
    63		mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
    64	
    65		if (jadard->desc->exit_sleep_to_display_on_delay_ms)
  > 66			mipi_dsi_msleep(&dsi_ctx, jadard->desc->exit_sleep_to_display_on_delay_ms);
    67	
    68		mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
    69	
    70		if (jadard->desc->display_on_delay_ms)
    71			mipi_dsi_msleep(&dsi_ctx, jadard->desc->display_on_delay_ms);
    72	
    73		return dsi_ctx.accum_err;
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
