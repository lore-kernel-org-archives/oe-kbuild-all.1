Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBD36FB6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 10:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693477126; x=1725013126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aAnvjK7Im18/R5Du6VjU/lwHKG1PkALVrAPons6tfvw=;
  b=iHfAWUcLbv+7jyJhwcIySzrLyNxwECURkLSgEhpESyX0QJWqHGvlFuPb
   UxNssw7yfjj0YrwKaTQT+Lo+uvAzeL/GmKfbBwNm+r+scNLmC8auatWd5
   LFybyHNUDHxfxEIA4jPL1Evobo1LH6k0EQsSJ0UH1mtygrU6KuBu8hexV
   S2aKVvW32NXyAelY4ZQ76V+Hjs9duNR5AoI8CJNJe1UZQ7LqrolZKuZOj
   AzywYnsmP86iWYgkSpE+CQql+Zbbn9qGHagtdm0PX2KBXbR+4dyoQ0my8
   VAmcyd6EJsFrSzluupkErpKHRyDfRyuZ3IgQMsOoGG741wdBm1B1DViCG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="439841242"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="439841242"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 03:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="733034913"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="733034913"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Aug 2023 03:18:44 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbel8-00001Z-1J;
	Thu, 31 Aug 2023 10:18:42 +0000
Date: Thu, 31 Aug 2023 18:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Utkarsh Patel <utkarsh.h.patel@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/5] platform/chrome: cros_ec_typec: Add Displayport
 Alternatemode 2.1 Support
Message-ID: <202308311857.Wl15vE5W-lkp@intel.com>
References: <20230830223950.1360865-5-utkarsh.h.patel@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830223950.1360865-5-utkarsh.h.patel@intel.com>

Hi Utkarsh,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus chrome-platform/for-next chrome-platform/for-firmware-next westeri-thunderbolt/next linus/master v6.5 next-20230830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Utkarsh-Patel/usb-typec-Add-Displayport-Alternate-Mode-2-1-Support/20230831-064225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230830223950.1360865-5-utkarsh.h.patel%40intel.com
patch subject: [PATCH v2 4/5] platform/chrome: cros_ec_typec: Add Displayport Alternatemode 2.1 Support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308311857.Wl15vE5W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311857.Wl15vE5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311857.Wl15vE5W-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/chrome/cros_ec_typec.c: In function 'cros_typec_enable_dp':
>> drivers/platform/chrome/cros_ec_typec.c:553:34: error: implicit declaration of function 'VDO_CABLE_SPEED'; did you mean 'TBT_CABLE_SPEED'? [-Werror=implicit-function-declaration]
     553 |                 u8 cable_speed = VDO_CABLE_SPEED(port->c_identity.vdo[0]);
         |                                  ^~~~~~~~~~~~~~~
         |                                  TBT_CABLE_SPEED
   cc1: some warnings being treated as errors


vim +553 drivers/platform/chrome/cros_ec_typec.c

   487	
   488	/* Spoof the VDOs that were likely communicated by the partner. */
   489	static int cros_typec_enable_dp(struct cros_typec_data *typec,
   490					int port_num,
   491					struct ec_response_usb_pd_control_v2 *pd_ctrl)
   492	{
   493		struct cros_typec_port *port = typec->ports[port_num];
   494		struct typec_displayport_data dp_data;
   495		u32 cable_tbt_vdo;
   496		u32 cable_dp_vdo;
   497		int ret;
   498	
   499		if (typec->pd_ctrl_ver < 2) {
   500			dev_err(typec->dev,
   501				"PD_CTRL version too old: %d\n", typec->pd_ctrl_ver);
   502			return -ENOTSUPP;
   503		}
   504	
   505		if (!pd_ctrl->dp_mode) {
   506			dev_err(typec->dev, "No valid DP mode provided.\n");
   507			return -EINVAL;
   508		}
   509	
   510		/* Status VDO. */
   511		dp_data.status = DP_STATUS_ENABLED;
   512		if (port->mux_flags & USB_PD_MUX_HPD_IRQ)
   513			dp_data.status |= DP_STATUS_IRQ_HPD;
   514		if (port->mux_flags & USB_PD_MUX_HPD_LVL)
   515			dp_data.status |= DP_STATUS_HPD_STATE;
   516	
   517		/* Configuration VDO. */
   518		dp_data.conf = DP_CONF_SET_PIN_ASSIGN(pd_ctrl->dp_mode);
   519		if (!port->state.alt) {
   520			port->state.alt = port->port_altmode[CROS_EC_ALTMODE_DP];
   521			ret = cros_typec_usb_safe_state(port);
   522			if (ret)
   523				return ret;
   524		}
   525	
   526		port->state.data = &dp_data;
   527		port->state.mode = TYPEC_MODAL_STATE(ffs(pd_ctrl->dp_mode));
   528	
   529		/* Get cable VDO for cables with DPSID to check DPAM2.1 is supported */
   530		cable_dp_vdo = cros_typec_get_cable_vdo(port, USB_TYPEC_DP_SID);
   531	
   532		/**
   533		 * Get cable VDO for thunderbolt cables and cables with DPSID but does not
   534		 * support DPAM2.1.
   535		 */
   536		cable_tbt_vdo = cros_typec_get_cable_vdo(port, USB_TYPEC_TBT_SID);
   537	
   538		if (cable_dp_vdo & DP_CAP_DPAM_VERSION) {
   539			dp_data.conf |= cable_dp_vdo;
   540		} else if (cable_tbt_vdo) {
   541			u8 cable_speed = TBT_CABLE_SPEED(cable_tbt_vdo);
   542	
   543			dp_data.conf |= cable_speed << DP_CONF_SIGNALLING_SHIFT;
   544	
   545			/* Cable Type */
   546			if (cable_tbt_vdo & TBT_CABLE_OPTICAL)
   547				dp_data.conf |= DP_CONF_CABLE_TYPE_OPTICAL << DP_CONF_CABLE_TYPE_SHIFT;
   548			else if (cable_tbt_vdo & TBT_CABLE_RETIMER)
   549				dp_data.conf |= DP_CONF_CABLE_TYPE_RE_TIMER << DP_CONF_CABLE_TYPE_SHIFT;
   550			else if (cable_tbt_vdo & TBT_CABLE_ACTIVE_PASSIVE)
   551				dp_data.conf |= DP_CONF_CABLE_TYPE_RE_DRIVER << DP_CONF_CABLE_TYPE_SHIFT;
   552		} else if (PD_IDH_PTYPE(port->c_identity.id_header) == IDH_PTYPE_PCABLE) {
 > 553			u8 cable_speed = VDO_CABLE_SPEED(port->c_identity.vdo[0]);
   554	
   555			dp_data.conf |= cable_speed << DP_CONF_SIGNALLING_SHIFT;
   556		}
   557	
   558		ret = cros_typec_retimer_set(port->retimer, port->state);
   559		if (!ret)
   560			ret = typec_mux_set(port->mux, &port->state);
   561	
   562		return ret;
   563	}
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
