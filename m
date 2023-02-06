Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51066108
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675714093; x=1707250093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qsv6gioKjy1Sd9lJV+H8Q0h2vdKLq9InvcAdQyjldE=;
  b=GeyoSPs7zQOib0s9LCcMbhqezps9t9ETBRFhh9Ju5eNtq+XqLUHVgbjH
   Vwx7Qz7vSBj5gKulnAUS8E9HHHB1Zv00NN1HNvvYj8bWwxtOlQc2Kydpw
   Gr6h4O4PSYDUD9XmAKQhZ+iihW4ShtALlaA8I8gdH3snrt1U0uPsx5lUU
   J7YjS9tJEaZJR1Ic+NpZJF8/aumBZiUY6YebPn/oAqtGpyVamoltXf+ls
   0uPRpVOU1/Nwvhd8lokhMKTZ0FzN28uzP/a5KvOug4m7Wf4CP0OKzOrj9
   nDPUzvWWvfmij+3S+76fjZXDoYKNX6O/RkLTCK5tibldkAokDDPffRvj4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="327938172"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327938172"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 12:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="755363267"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="755363267"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2023 12:08:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP7md-0002l8-0u;
	Mon, 06 Feb 2023 20:08:11 +0000
Date: Tue, 7 Feb 2023 04:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>
Subject: [wens:mtk-test 39/52]
 drivers/gpu/drm/display/drm_dp_typec_helper.c:60:5: error: redefinition of
 'drm_dp_register_typec_switches'
Message-ID: <202302070403.EaBqS9jd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-test
head:   cfc53cc80cb4a15e1a5bcf606093e83b670c3d27
commit: 8ba70bf505a687a7701d3bd45ebeb442fe24f8cd [39/52] drm/display: Add Type-C switch helpers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230207/202302070403.EaBqS9jd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?id=8ba70bf505a687a7701d3bd45ebeb442fe24f8cd
        git remote add wens https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git
        git fetch --no-tags wens mtk-test
        git checkout 8ba70bf505a687a7701d3bd45ebeb442fe24f8cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/drm/display/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_dp_typec_helper.c:60:5: error: redefinition of 'drm_dp_register_typec_switches'
      60 | int drm_dp_register_typec_switches(struct device *dev, struct fwnode_handle *port,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/display/drm_dp_typec_helper.c:4:
   include/drm/display/drm_dp_helper.h:788:19: note: previous definition of 'drm_dp_register_typec_switches' with type 'int(struct device *, struct fwnode_handle *, struct drm_dp_typec_switch_desc *, void *, int (*)(struct typec_mux_dev *, struct typec_mux_state *))'
     788 | static inline int drm_dp_register_typec_switches(
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/display/drm_dp_typec_helper.c:107:6: error: redefinition of 'drm_dp_unregister_typec_switches'
     107 | void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/display/drm_dp_helper.h:785:20: note: previous definition of 'drm_dp_unregister_typec_switches' with type 'void(struct drm_dp_typec_switch_desc *)'
     785 | static inline void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM
   Depends on [n]: !MMU [=y]
   Selected by [y]:
   - SUN20I_PPU [=y] && (ARCH_SUNXI || COMPILE_TEST [=y])


vim +/drm_dp_register_typec_switches +60 drivers/gpu/drm/display/drm_dp_typec_helper.c

    44	
    45	/**
    46	 * drm_dp_register_typec_switches() - register Type-C switches
    47	 * @dev: Device that registers Type-C switches
    48	 * @port: Device node for the switch
    49	 * @switch_desc: A Type-C switch descriptor
    50	 * @data: Private data for the switches
    51	 * @mux_set: Callback function for typec_mux_set
    52	 *
    53	 * This function registers USB Type-C switches for DP bridges that can switch
    54	 * the output signal between their output pins.
    55	 *
    56	 * Currently only mode switches are implemented, and the function assumes the
    57	 * given @port device node has endpoints with "mode-switch" property.
    58	 * The port number is determined by the "reg" property of the endpoint.
    59	 */
  > 60	int drm_dp_register_typec_switches(struct device *dev, struct fwnode_handle *port,
    61					   struct drm_dp_typec_switch_desc *switch_desc,
    62					   void *data, typec_mux_set_fn_t mux_set)
    63	{
    64		struct fwnode_handle *sw;
    65		int ret;
    66	
    67		fwnode_for_each_child_node(port, sw) {
    68			if (fwnode_property_present(sw, "mode-switch"))
    69				switch_desc->num_typec_switches++;
    70		}
    71	
    72		if (!switch_desc->num_typec_switches) {
    73			dev_dbg(dev, "No Type-C switches node found\n");
    74			return 0;
    75		}
    76	
    77		switch_desc->typec_ports = devm_kcalloc(
    78			dev, switch_desc->num_typec_switches,
    79			sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
    80	
    81		if (!switch_desc->typec_ports)
    82			return -ENOMEM;
    83	
    84		/* Register switches for each connector. */
    85		fwnode_for_each_child_node(port, sw) {
    86			if (!fwnode_property_present(sw, "mode-switch"))
    87				continue;
    88			ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
    89			if (ret)
    90				goto err_unregister_typec_switches;
    91		}
    92	
    93		return 0;
    94	
    95	err_unregister_typec_switches:
    96		fwnode_handle_put(sw);
    97		drm_dp_unregister_typec_switches(switch_desc);
    98		dev_err(dev, "Failed to register mode switch: %d\n", ret);
    99		return ret;
   100	}
   101	EXPORT_SYMBOL(drm_dp_register_typec_switches);
   102	
   103	/**
   104	 * drm_dp_unregister_typec_switches() - unregister Type-C switches
   105	 * @switch_desc: A Type-C switch descriptor
   106	 */
 > 107	void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
