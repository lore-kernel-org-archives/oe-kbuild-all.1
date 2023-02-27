Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B082846F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 20:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677528902; x=1709064902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x7lylInmqkZRWUU7uPUdkYFTLTcl5+0ukRJVzQ5L98E=;
  b=D+WleWCJCpV8ZiP+T5ep728QYGXWh5hRKnCs0Co7WO6ewIowlI9G74JC
   XjMBGfdpG728zstGFf6xTznL/muAmcTtmdS9CF/er5xDcwt3l6cD8Vr+C
   fKk6D1l2Pca102WI13wtxgEbmN5Sz4PctoAR6gd4wBRZO1QtLDrwPGWyU
   Imn7kQGR5ZZRtQnPDuvzjKSKGd51pdS3tpF1ts12byFXrKzqHsM/Z5DAD
   sNhKWFmZ73r8V7/yJMjQLh91KjCA3ocLUKBpzRTnoBS3Pz66dBrK0U0xc
   GQsT/dxcmpcTGi7tiAN5Xe+jlwxR4jXAl02c3gGRxsIM7+7cKeOUX9qqG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="335444973"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="335444973"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 12:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="704150945"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="704150945"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Feb 2023 12:14:58 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWjti-0004kV-0H;
	Mon, 27 Feb 2023 20:14:58 +0000
Date: Tue, 28 Feb 2023 04:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 24/583]
 drivers/gpu/drm/vc4/vc4_hdmi.c:562:5: warning: no previous prototype for
 function 'vc4_hdmi_connector_get_property'
Message-ID: <202302280418.UTQ02tZO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: c9f8918a5153ff76ca64371f8117809fbd7e68a6 [24/583] drm/vc4_hdmi: Add Broadcast RGB property to allow override of RGB range
config: arm-randconfig-r046-20230227 (https://download.01.org/0day-ci/archive/20230228/202302280418.UTQ02tZO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/l1k/linux/commit/c9f8918a5153ff76ca64371f8117809fbd7e68a6
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout c9f8918a5153ff76ca64371f8117809fbd7e68a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/vc4/ drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280418.UTQ02tZO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_hdmi.c:562:5: warning: no previous prototype for function 'vc4_hdmi_connector_get_property' [-Wmissing-prototypes]
   int vc4_hdmi_connector_get_property(struct drm_connector *connector,
       ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:562:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vc4_hdmi_connector_get_property(struct drm_connector *connector,
   ^
   static 
>> drivers/gpu/drm/vc4/vc4_hdmi.c:592:5: warning: no previous prototype for function 'vc4_hdmi_connector_set_property' [-Wmissing-prototypes]
   int vc4_hdmi_connector_set_property(struct drm_connector *connector,
       ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:592:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vc4_hdmi_connector_set_property(struct drm_connector *connector,
   ^
   static 
   2 warnings generated.


vim +/vc4_hdmi_connector_get_property +562 drivers/gpu/drm/vc4/vc4_hdmi.c

   551	
   552	/**
   553	 * vc4_hdmi_connector_atomic_get_property - hook for
   554	 *						connector->atomic_get_property.
   555	 * @connector: Connector to get the property for.
   556	 * @state: Connector state to retrieve the property from.
   557	 * @property: Property to retrieve.
   558	 * @val: Return value for the property.
   559	 *
   560	 * Returns the atomic property value for a digital connector.
   561	 */
 > 562	int vc4_hdmi_connector_get_property(struct drm_connector *connector,
   563					    const struct drm_connector_state *state,
   564					    struct drm_property *property,
   565					    uint64_t *val)
   566	{
   567		struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
   568		const struct vc4_hdmi_connector_state *vc4_conn_state =
   569					const_conn_state_to_vc4_hdmi_conn_state(state);
   570	
   571		if (property == vc4_hdmi->broadcast_rgb_property) {
   572			*val = vc4_conn_state->broadcast_rgb;
   573		} else {
   574			DRM_DEBUG_ATOMIC("Unknown property [PROP:%d:%s]\n",
   575					 property->base.id, property->name);
   576			return -EINVAL;
   577		}
   578	
   579		return 0;
   580	}
   581	
   582	/**
   583	 * vc4_hdmi_connector_atomic_set_property - hook for
   584	 *						connector->atomic_set_property.
   585	 * @connector: Connector to set the property for.
   586	 * @state: Connector state to set the property on.
   587	 * @property: Property to set.
   588	 * @val: New value for the property.
   589	 *
   590	 * Sets the atomic property value for a digital connector.
   591	 */
 > 592	int vc4_hdmi_connector_set_property(struct drm_connector *connector,
   593					    struct drm_connector_state *state,
   594					    struct drm_property *property,
   595					    uint64_t val)
   596	{
   597		struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
   598		struct vc4_hdmi_connector_state *vc4_conn_state =
   599					conn_state_to_vc4_hdmi_conn_state(state);
   600	
   601		if (property == vc4_hdmi->broadcast_rgb_property) {
   602			vc4_conn_state->broadcast_rgb = val;
   603			return 0;
   604		}
   605	
   606		DRM_DEBUG_ATOMIC("Unknown property [PROP:%d:%s]\n",
   607				 property->base.id, property->name);
   608		return -EINVAL;
   609	}
   610	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
