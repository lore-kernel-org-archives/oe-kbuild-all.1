Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69A63A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 05:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675922327; x=1707458327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ovfN+cfUJv25UMenR8+YgdvvaKM+gqzw3X+ZZ82sHmM=;
  b=IxUPXk85ZmjFgNhXZizUtc8vN1EzNuwVfEILKfMvJCn4RRZCXhiYZclH
   JzMVxnu7TVItm9crLDk4PwYFpv8KcgZJ0qdc2yEslqszO2U4T37omCeTO
   Kqd8A7lMvgUz9jHARx0d5Mkb8dJsi65Is5OD9yLrCHuc/REc5YNVccklI
   9ln62FmEe518lwthsUViFFjzRTD6B58teoq8jgJbJ7F1n2r5TSCBWdTG7
   Ce46bjzmY5wIQomRPKVnFuubJ9W4fcbBdTig7Iob92CXXQqdnPQuoSmUw
   xZaXpExBnr/IHrnZ805avv+8orS+rsv+8XS5vALnKGz4CO+WeB1am4qPc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="327716869"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="327716869"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 21:56:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="776346202"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="776346202"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2023 21:56:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPzuy-0004rU-1I;
	Thu, 09 Feb 2023 05:56:24 +0000
Date: Thu, 9 Feb 2023 13:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 9862/11577]
 drivers/soc/qcom/pmic_glink_altmode.c:418:33: error: 'struct drm_bridge' has
 no member named 'of_node'
Message-ID: <202302091343.ZmoXukx8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20f513df926fac0594a3b65f79d856bd64251861
commit: 080b4e24852b1d5b66929f69344e6c3eeb963941 [9862/11577] soc: qcom: pmic_glink: Introduce altmode support
config: alpha-randconfig-s043-20230209 (https://download.01.org/0day-ci/archive/20230209/202302091343.ZmoXukx8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=080b4e24852b1d5b66929f69344e6c3eeb963941
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 080b4e24852b1d5b66929f69344e6c3eeb963941
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/soc/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302091343.ZmoXukx8-lkp@intel.com

Note: the linux-next/master HEAD 20f513df926fac0594a3b65f79d856bd64251861 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/soc/qcom/pmic_glink_altmode.c: In function 'pmic_glink_altmode_sc8180xp_notify':
   drivers/soc/qcom/pmic_glink_altmode.c:223:13: warning: variable 'svid' set but not used [-Wunused-but-set-variable]
     223 |         u16 svid;
         |             ^~~~
   drivers/soc/qcom/pmic_glink_altmode.c: In function 'pmic_glink_altmode_probe':
>> drivers/soc/qcom/pmic_glink_altmode.c:418:33: error: 'struct drm_bridge' has no member named 'of_node'
     418 |                 alt_port->bridge.of_node = to_of_node(fwnode);
         |                                 ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
   Depends on [n]: NET [=n]
   Selected by [m]:
   - QCOM_PDR_HELPERS [=m]


vim +418 drivers/soc/qcom/pmic_glink_altmode.c

   366	
   367	static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
   368					    const struct auxiliary_device_id *id)
   369	{
   370		struct pmic_glink_altmode_port *alt_port;
   371		struct pmic_glink_altmode *altmode;
   372		struct typec_altmode_desc mux_desc = {};
   373		const struct of_device_id *match;
   374		struct fwnode_handle *fwnode;
   375		struct device *dev = &adev->dev;
   376		u32 port;
   377		int ret;
   378	
   379		altmode = devm_kzalloc(dev, sizeof(*altmode), GFP_KERNEL);
   380		if (!altmode)
   381			return -ENOMEM;
   382	
   383		altmode->dev = dev;
   384	
   385		match = of_match_device(pmic_glink_altmode_of_quirks, dev->parent);
   386		if (match)
   387			altmode->owner_id = (unsigned long)match->data;
   388		else
   389			altmode->owner_id = PMIC_GLINK_OWNER_USBC_PAN;
   390	
   391		INIT_WORK(&altmode->enable_work, pmic_glink_altmode_enable_worker);
   392		init_completion(&altmode->pan_ack);
   393		mutex_init(&altmode->lock);
   394	
   395		device_for_each_child_node(dev, fwnode) {
   396			ret = fwnode_property_read_u32(fwnode, "reg", &port);
   397			if (ret < 0) {
   398				dev_err(dev, "missing reg property of %pOFn\n", fwnode);
   399				return ret;
   400			}
   401	
   402			if (port >= ARRAY_SIZE(altmode->ports)) {
   403				dev_warn(dev, "invalid connector number, ignoring\n");
   404				continue;
   405			}
   406	
   407			if (altmode->ports[port].altmode) {
   408				dev_err(dev, "multiple connector definition for port %u\n", port);
   409				return -EINVAL;
   410			}
   411	
   412			alt_port = &altmode->ports[port];
   413			alt_port->altmode = altmode;
   414			alt_port->index = port;
   415			INIT_WORK(&alt_port->work, pmic_glink_altmode_worker);
   416	
   417			alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
 > 418			alt_port->bridge.of_node = to_of_node(fwnode);
   419			alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
   420			alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
   421	
   422			ret = devm_drm_bridge_add(dev, &alt_port->bridge);
   423			if (ret)
   424				return ret;
   425	
   426			alt_port->dp_alt.svid = USB_TYPEC_DP_SID;
   427			alt_port->dp_alt.mode = USB_TYPEC_DP_MODE;
   428			alt_port->dp_alt.active = 1;
   429	
   430			mux_desc.svid = USB_TYPEC_DP_SID;
   431			mux_desc.mode = USB_TYPEC_DP_MODE;
   432			alt_port->typec_mux = fwnode_typec_mux_get(fwnode, &mux_desc);
   433			if (IS_ERR(alt_port->typec_mux))
   434				return dev_err_probe(dev, PTR_ERR(alt_port->typec_mux),
   435						     "failed to acquire mode-switch for port: %d\n",
   436						     port);
   437	
   438			ret = devm_add_action_or_reset(dev, pmic_glink_altmode_put_mux,
   439						       alt_port->typec_mux);
   440			if (ret)
   441				return ret;
   442	
   443			alt_port->typec_switch = fwnode_typec_switch_get(fwnode);
   444			if (IS_ERR(alt_port->typec_switch))
   445				return dev_err_probe(dev, PTR_ERR(alt_port->typec_switch),
   446						     "failed to acquire orientation-switch for port: %d\n",
   447						     port);
   448	
   449			ret = devm_add_action_or_reset(dev, pmic_glink_altmode_put_switch,
   450						       alt_port->typec_switch);
   451			if (ret)
   452				return ret;
   453		}
   454	
   455		altmode->client = devm_pmic_glink_register_client(dev,
   456								  altmode->owner_id,
   457								  pmic_glink_altmode_callback,
   458								  pmic_glink_altmode_pdr_notify,
   459								  altmode);
   460		return PTR_ERR_OR_ZERO(altmode->client);
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
