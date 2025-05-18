Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AF04B1E76
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565665; cv=none; b=P3wbxgUVtgNftmNdiw3gTg0GdWcDlviceOecKkDq5ZSvJRjFFzGesmomMtZ2RiQoSszFLoz5noDfx/Vz1Yey585fpz+ybkznOfZoDJKp+F7lTQ8SRQgEYNsDDgr4BUaT5YTxhJXnwybdVaHSl10zzbo3NxoVQkjskxIDe9beMtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565665; c=relaxed/simple;
	bh=ICLa78jq8Dxj2QVI2+/MP9SucnV+xArhpAIH9jmYfHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L25OcGqOJlQ77Owu2BXX6lnsgJ4CMVaWDxll2toAxkTyan1nbnW/ile/mOwn7hrULSi71LFQHDTgmIdTWy+qG1FDD46VwW5C/LC2AXegDYbkVXY2FStXXDL80b1DSCGHCGFrS3g9TvtnB38v5ku9yzxA9iLT/QkACJyOMrP/v/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTzFCjI2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTzFCjI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747565663; x=1779101663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ICLa78jq8Dxj2QVI2+/MP9SucnV+xArhpAIH9jmYfHg=;
  b=DTzFCjI2b/17AQRGfezt5WYeF4uUBzj+5KfcTlF+IfklPbHBD2gPeNYp
   6MPEFkj8rpSa6gNqAPi/KTCTbD5mA/g3AoeUw0c6EYqm7wXdJTNVfkjEc
   v3SQ3ZnBknpxKYGOiBmJ/eumDJX9rJlo8wXhoyv9cVxIH0Dv2fEh7F89M
   iCEzNpFvp999nRj0wIG7CNT8zkaEzr0iQnOsoxi6wMabCVvEGn8SeaDdV
   1X0clB4SnBOz4xLZKXa4y0uVxaRC+BjuJvTAk4ZZ/zxGgzAvi+pgqWEGW
   u/fHte2mzHgo44Rtp505gHj5eS/F6Vj06zdOszqe3r/V8tQ/mmKcXlC/S
   Q==;
X-CSE-ConnectionGUID: Iofy2pxXRguXI1zt/OaTvw==
X-CSE-MsgGUID: wcdRHqD3QyufNh3o50vMrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49634332"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49634332"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 03:54:23 -0700
X-CSE-ConnectionGUID: 7WLB4qGcTZ+5oBxJ9Ke7Pg==
X-CSE-MsgGUID: 41z4tH9oTR+NiF1YNyydFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139154385"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2025 03:54:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGbes-000Kkz-30;
	Sun, 18 May 2025 10:54:18 +0000
Date: Sun, 18 May 2025 18:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Sven Peter <sven@svenpeter.dev>
Subject: [asahilinux:sven/atcphy 29/31] drivers/usb/typec/tipd/core.c:720:34:
 sparse: sparse: cast to restricted __le16
Message-ID: <202505181857.NVLANqSD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sven/atcphy
head:   bb58cc6399a58218b8b5204a9fadf26f07c7f0f3
commit: bd20465a75dc504f3c11925e3c2968f4fa6baedf [29/31] usb: typec: tipd: WIP
config: sh-randconfig-r132-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181857.NVLANqSD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250518/202505181857.NVLANqSD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181857.NVLANqSD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/typec/tipd/core.c:720:34: sparse: sparse: cast to restricted __le16
>> drivers/usb/typec/tipd/core.c:720:34: sparse: sparse: cast from restricted __le32
>> drivers/usb/typec/tipd/core.c:720:34: sparse: sparse: cast to restricted __le16
>> drivers/usb/typec/tipd/core.c:720:34: sparse: sparse: cast from restricted __le32
>> drivers/usb/typec/tipd/core.c:720:34: sparse: sparse: cast to restricted __le16
>> drivers/usb/typec/tipd/core.c:720:34: sparse: sparse: cast from restricted __le32
>> drivers/usb/typec/tipd/core.c:720:34: sparse: sparse: cast to restricted __le16
>> drivers/usb/typec/tipd/core.c:720:34: sparse: sparse: cast from restricted __le32

vim +720 drivers/usb/typec/tipd/core.c

   644	
   645	static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status *st)
   646	{
   647		struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
   648	
   649		if (st->data_status & TPS_DATA_STATUS_USB_DATA_ROLE)
   650			cd321x->state.data_role = TYPEC_DEVICE;
   651		else
   652			cd321x->state.data_role = TYPEC_HOST;
   653	
   654		if (!(st->data_status & TPS_DATA_STATUS_DATA_CONNECTION)) {
   655			if (cd321x->state.mode == TYPEC_STATE_SAFE)
   656				return;
   657			cd321x->state.alt = NULL;
   658			cd321x->state.mode = TYPEC_STATE_SAFE;
   659			cd321x->state.data = NULL;
   660			typec_mux_set(cd321x->mux, &cd321x->state);
   661		} else if (st->data_status & TPS_DATA_STATUS_DP_CONNECTION) {
   662			struct typec_displayport_data dp_data;
   663			unsigned long mode;
   664	
   665			switch(TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT(st->data_status)) {
   666			case TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT_A:
   667			    mode = TYPEC_DP_STATE_A;
   668		            break;
   669			case TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT_B:
   670			    mode = TYPEC_DP_STATE_B;
   671		            break;
   672			case TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT_C:
   673			    mode = TYPEC_DP_STATE_C;
   674		            break;
   675			case TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT_D:
   676			    mode = TYPEC_DP_STATE_D;
   677		            break;
   678			case TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT_E:
   679			    mode = TYPEC_DP_STATE_E;
   680		            break;
   681			case TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT_F:
   682			    mode = TYPEC_DP_STATE_F;
   683		            break;
   684			default:
   685			    dev_err(tps->dev, "Invalid DP pin assignment\n");
   686			    return;
   687			}
   688	
   689			if(cd321x->state.alt == cd321x->port_altmode_dp &&
   690			   cd321x->state.mode == mode) {
   691				return;
   692			}
   693	
   694			dp_data.status = le32_to_cpu(st->dp_sid_status.status_rx);
   695			dp_data.conf = le32_to_cpu(st->dp_sid_status.configure);
   696			cd321x->state.alt = cd321x->port_altmode_dp;
   697			cd321x->state.data = &dp_data;
   698			cd321x->state.mode = mode;
   699			typec_mux_set(cd321x->mux, &cd321x->state);
   700		} else if (st->data_status & TPS_DATA_STATUS_TBT_CONNECTION) {
   701			struct typec_thunderbolt_data tbt_data;
   702	
   703			if(cd321x->state.alt == cd321x->port_altmode_tbt &&
   704			   cd321x->state.mode == TYPEC_TBT_MODE)
   705				return;
   706	
   707			tbt_data.cable_mode = le16_to_cpu(st->intel_vid_status.cable_mode);
   708			tbt_data.device_mode = le16_to_cpu(st->intel_vid_status.device_mode);
   709			tbt_data.enter_vdo = le16_to_cpu(st->intel_vid_status.enter_vdo);
   710			cd321x->state.alt = cd321x->port_altmode_tbt;
   711			cd321x->state.mode = TYPEC_TBT_MODE;
   712			cd321x->state.data = &tbt_data;
   713			typec_mux_set(cd321x->mux, &cd321x->state);
   714		} else if (st->data_status & CD321X_DATA_STATUS_USB4_CONNECTION) {
   715			struct enter_usb_data eusb_data;
   716	
   717			if(cd321x->state.alt == NULL && cd321x->state.mode == TYPEC_MODE_USB4)
   718				return;
   719	
 > 720			eusb_data.eudo = le16_to_cpu(st->usb4_status.eudo);
   721			eusb_data.active_link_training =
   722				!!(st->data_status & TPS_DATA_STATUS_ACTIVE_LINK_TRAIN);
   723	
   724			cd321x->state.alt = NULL;
   725			cd321x->state.data = &eusb_data;
   726			cd321x->state.mode = TYPEC_MODE_USB4;
   727			typec_mux_set(cd321x->mux, &cd321x->state);
   728		} else {
   729			if (cd321x->state.alt == NULL && cd321x->state.mode == TYPEC_STATE_USB)
   730				return;
   731			cd321x->state.alt = NULL;
   732			cd321x->state.mode = TYPEC_STATE_USB;
   733			cd321x->state.data = NULL;
   734			typec_mux_set(cd321x->mux, &cd321x->state);
   735		}
   736	}
   737	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
