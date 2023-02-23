Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A123D15B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 01:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677115964; x=1708651964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4CvkmocTTuGUh3nirXaM09sxSu6LfENeyR6ivNXLb9U=;
  b=AR7vgxYwPdah3AAm8kMaRAy2RvdHLjbokZQoZ13rtRVRyOghpr+H+QqI
   cj3RJZPRdhEggWVjQJL5Ti0ujPCZgDKpRf9pwZ2eC9L7FiAPqHdnGP6Ri
   Zh7onj8X+WgUrRbf95n4TTrpQ9SLb4F3XA8FsFELaqo+qKtOEmeH6jrtK
   mN8sa7qAjrx/04XwUSyAMsja51Yjo7VXroxhU7baB7OpVsgatNT1Ig3tA
   QRJqgmDVE2mRy7xDRVOjwtpILXwnqgKjKU6gzVsfMPS9RNrpwdUO6+VLC
   PjHVBd4PAxLpBGR0WUb+AElF5tEdSSQ1/KHQy82h+c2uQ0GcgyjhTXw7i
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312714399"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="312714399"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 17:32:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="674322431"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="674322431"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2023 17:32:40 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV0TQ-0000t5-06;
	Thu, 23 Feb 2023 01:32:40 +0000
Date: Thu, 23 Feb 2023 09:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:hdaudio/extended-multi-link 32/55]
 sound/soc/sof/ipc4-topology.c:854:3: warning: variable 'ext_size' is
 uninitialized when used here
Message-ID: <202302230902.sxgFw5lW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound hdaudio/extended-multi-link
head:   f423930a1ce99bb84fac6fa397fc486113748ab0
commit: ef1635223211aa75afab254fc4865b1d13471267 [32/55] ASoC: SOF: ipc4-topology: Add support for base config extension
config: mips-randconfig-r034-20230222 (https://download.01.org/0day-ci/archive/20230223/202302230902.sxgFw5lW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/plbossart/sound/commit/ef1635223211aa75afab254fc4865b1d13471267
        git remote add plbossart-sound https://github.com/plbossart/sound
        git fetch --no-tags plbossart-sound hdaudio/extended-multi-link
        git checkout ef1635223211aa75afab254fc4865b1d13471267
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302230902.sxgFw5lW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/ipc4-topology.c:854:3: warning: variable 'ext_size' is uninitialized when used here [-Wuninitialized]
                   ext_size += struct_size(base_cfg_ext, pin_formats,
                   ^~~~~~~~
   sound/soc/sof/ipc4-topology.c:852:15: note: initialize the variable 'ext_size' to silence this warning
                   u32 ext_size;
                               ^
                                = 0
   1 warning generated.


vim +/ext_size +854 sound/soc/sof/ipc4-topology.c

   815	
   816	/*
   817	 * Add the process modules support. The process modules are defined as snd_soc_dapm_effect modules.
   818	 */
   819	static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
   820	{
   821		struct snd_soc_component *scomp = swidget->scomp;
   822		struct sof_ipc4_fw_module *fw_module;
   823		struct sof_ipc4_process *process;
   824		void *cfg;
   825		int ret;
   826	
   827		process = kzalloc(sizeof(*process), GFP_KERNEL);
   828		if (!process)
   829			return -ENOMEM;
   830	
   831		swidget->private = process;
   832	
   833		ret = sof_ipc4_get_audio_fmt(scomp, swidget, &process->available_fmt,
   834					     &process->base_config);
   835		if (ret)
   836			goto err;
   837	
   838		ret = sof_ipc4_widget_setup_msg(swidget, &process->msg);
   839		if (ret)
   840			goto err;
   841	
   842		/* parse process init module payload config type from module info */
   843		fw_module = swidget->module_info;
   844		process->init_config = FIELD_GET(SOF_IPC4_MODULE_INIT_CONFIG_MASK,
   845						 fw_module->man4_module_entry.type);
   846	
   847		process->ipc_config_size = sizeof(struct sof_ipc4_base_module_cfg);
   848	
   849		/* allocate memory for base config extension if needed */
   850		if (process->init_config == SOF_IPC4_MODULE_INIT_CONFIG_TYPE_BASE_CFG_WITH_EXT) {
   851			struct sof_ipc4_base_module_cfg_ext *base_cfg_ext;
   852			u32 ext_size;
   853	
 > 854			ext_size += struct_size(base_cfg_ext, pin_formats,
   855						swidget->num_input_pins + swidget->num_output_pins);
   856	
   857			base_cfg_ext = kzalloc(ext_size, GFP_KERNEL);
   858			if (!base_cfg_ext) {
   859				ret = -ENOMEM;
   860				goto free_available_fmt;
   861			}
   862	
   863			base_cfg_ext->num_input_pin_fmts = swidget->num_input_pins;
   864			base_cfg_ext->num_output_pin_fmts = swidget->num_output_pins;
   865			process->base_config_ext = base_cfg_ext;
   866			process->base_config_ext_size = ext_size;
   867			process->ipc_config_size += ext_size;
   868		}
   869	
   870		cfg = kzalloc(process->ipc_config_size, GFP_KERNEL);
   871		if (!cfg) {
   872			ret = -ENOMEM;
   873			goto free_base_cfg_ext;
   874		}
   875	
   876		process->ipc_config_data = cfg;
   877	
   878		sof_ipc4_widget_update_kcontrol_module_id(swidget);
   879	
   880		return 0;
   881	free_base_cfg_ext:
   882		kfree(process->base_config_ext);
   883		process->base_config_ext = NULL;
   884	free_available_fmt:
   885		sof_ipc4_free_audio_fmt(&process->available_fmt);
   886	err:
   887		kfree(process);
   888		swidget->private = NULL;
   889		return ret;
   890	}
   891	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
