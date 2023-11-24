Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB983A8E4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 20:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAuRXDP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700856293; x=1732392293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0B012thM3hHontujpgfzPBtgwpGpxnHbUfNuI2N7MY=;
  b=cAuRXDP1f14PSwbxQzIejTW8Twl3dJ4WSQ3LxwWib7DcHLXaD/et14FQ
   shMSw/Fu+ne3CMxI0Lj2xjBama83S4CB1Hm9hoWRgdBfwZCDzBB749whT
   nNqEM8h8akwx53hibNNevR95770aMHloM/NqVIZ+cnLQBPQvmT3kUHrsm
   3Niy4MTsGbjSCQ6vNu2IavpEeNIb+fvEOjvpdKhx7ozodnTBL/Q7EkU8g
   48SwqdRKu2t0JIrXXHY0FSrBwrR8a6nxPYqchUdco4p5HV9auJUkEYjQD
   /f0yrxEJONGizi3VsXcFE63QxEpgtzPyb/7iinQja5ZkpcKI4fzGuwksd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392225833"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="392225833"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 12:04:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="761031430"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="761031430"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 12:04:49 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6cPu-0003F0-25;
	Fri, 24 Nov 2023 20:04:46 +0000
Date: Sat, 25 Nov 2023 04:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: [linux-next:master 1430/2998]
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c:1106
 amdgpu_connector_dvi_detect() warn: inconsistent indenting
Message-ID: <202311250244.C3mKQnhy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8c9660f6515396aba78d1168d2e17951d653ebf2
commit: 8a1de314d1890793bbf9e77542574ceda007564e [1430/2998] drm/amdgpu: Refactor 'amdgpu_connector_dvi_detect' in amdgpu_connectors.c
config: x86_64-randconfig-161-20231123 (https://download.01.org/0day-ci/archive/20231125/202311250244.C3mKQnhy-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250244.C3mKQnhy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250244.C3mKQnhy-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c:1106 amdgpu_connector_dvi_detect() warn: inconsistent indenting

vim +1106 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c

  1019	
  1020	/*
  1021	 * DVI is complicated
  1022	 * Do a DDC probe, if DDC probe passes, get the full EDID so
  1023	 * we can do analog/digital monitor detection at this point.
  1024	 * If the monitor is an analog monitor or we got no DDC,
  1025	 * we need to find the DAC encoder object for this connector.
  1026	 * If we got no DDC, we do load detection on the DAC encoder object.
  1027	 * If we got analog DDC or load detection passes on the DAC encoder
  1028	 * we have to check if this analog encoder is shared with anyone else (TV)
  1029	 * if its shared we have to set the other connector to disconnected.
  1030	 */
  1031	static enum drm_connector_status
  1032	amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
  1033	{
  1034		struct drm_device *dev = connector->dev;
  1035		struct amdgpu_device *adev = drm_to_adev(dev);
  1036		struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
  1037		const struct drm_encoder_helper_funcs *encoder_funcs;
  1038		int r;
  1039		enum drm_connector_status ret = connector_status_disconnected;
  1040		bool dret = false, broken_edid = false;
  1041	
  1042		if (!drm_kms_helper_is_poll_worker()) {
  1043			r = pm_runtime_get_sync(connector->dev->dev);
  1044			if (r < 0) {
  1045				pm_runtime_put_autosuspend(connector->dev->dev);
  1046				return connector_status_disconnected;
  1047			}
  1048		}
  1049	
  1050		if (amdgpu_connector->detected_hpd_without_ddc) {
  1051			force = true;
  1052			amdgpu_connector->detected_hpd_without_ddc = false;
  1053		}
  1054	
  1055		if (!force && amdgpu_connector_check_hpd_status_unchanged(connector)) {
  1056			ret = connector->status;
  1057			goto exit;
  1058		}
  1059	
  1060		if (amdgpu_connector->ddc_bus) {
  1061			dret = amdgpu_display_ddc_probe(amdgpu_connector, false);
  1062	
  1063			/* Sometimes the pins required for the DDC probe on DVI
  1064			 * connectors don't make contact at the same time that the ones
  1065			 * for HPD do. If the DDC probe fails even though we had an HPD
  1066			 * signal, try again later
  1067			 */
  1068			if (!dret && !force &&
  1069			    amdgpu_display_hpd_sense(adev, amdgpu_connector->hpd.hpd)) {
  1070				DRM_DEBUG_KMS("hpd detected without ddc, retrying in 1 second\n");
  1071				amdgpu_connector->detected_hpd_without_ddc = true;
  1072				schedule_delayed_work(&adev->hotplug_work,
  1073						      msecs_to_jiffies(1000));
  1074				goto exit;
  1075			}
  1076		}
  1077		if (dret) {
  1078			amdgpu_connector->detected_by_load = false;
  1079			amdgpu_connector_free_edid(connector);
  1080			amdgpu_connector_get_edid(connector);
  1081	
  1082			if (!amdgpu_connector->edid) {
  1083				DRM_ERROR("%s: probed a monitor but no|invalid EDID\n",
  1084						connector->name);
  1085				ret = connector_status_connected;
  1086				broken_edid = true; /* defer use_digital to later */
  1087			} else {
  1088				amdgpu_connector->use_digital =
  1089					!!(amdgpu_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
  1090	
  1091				/* some oems have boards with separate digital and analog connectors
  1092				 * with a shared ddc line (often vga + hdmi)
  1093				 */
  1094				if ((!amdgpu_connector->use_digital) && amdgpu_connector->shared_ddc) {
  1095					amdgpu_connector_free_edid(connector);
  1096					ret = connector_status_disconnected;
  1097				} else {
  1098					ret = connector_status_connected;
  1099				}
  1100	
  1101				/* This gets complicated.  We have boards with VGA + HDMI with a
  1102				 * shared DDC line and we have boards with DVI-D + HDMI with a shared
  1103				 * DDC line.  The latter is more complex because with DVI<->HDMI adapters
  1104				 * you don't really know what's connected to which port as both are digital.
  1105				 */
> 1106				 amdgpu_connector_shared_ddc(&ret, connector, amdgpu_connector);
  1107			}
  1108		}
  1109	
  1110		if ((ret == connector_status_connected) && (amdgpu_connector->use_digital == true))
  1111			goto out;
  1112	
  1113		/* DVI-D and HDMI-A are digital only */
  1114		if ((connector->connector_type == DRM_MODE_CONNECTOR_DVID) ||
  1115		    (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA))
  1116			goto out;
  1117	
  1118		/* if we aren't forcing don't do destructive polling */
  1119		if (!force) {
  1120			/* only return the previous status if we last
  1121			 * detected a monitor via load.
  1122			 */
  1123			if (amdgpu_connector->detected_by_load)
  1124				ret = connector->status;
  1125			goto out;
  1126		}
  1127	
  1128		/* find analog encoder */
  1129		if (amdgpu_connector->dac_load_detect) {
  1130			struct drm_encoder *encoder;
  1131	
  1132			drm_connector_for_each_possible_encoder(connector, encoder) {
  1133				if (encoder->encoder_type != DRM_MODE_ENCODER_DAC &&
  1134				    encoder->encoder_type != DRM_MODE_ENCODER_TVDAC)
  1135					continue;
  1136	
  1137				encoder_funcs = encoder->helper_private;
  1138				if (encoder_funcs->detect) {
  1139					if (!broken_edid) {
  1140						if (ret != connector_status_connected) {
  1141							/* deal with analog monitors without DDC */
  1142							ret = encoder_funcs->detect(encoder, connector);
  1143							if (ret == connector_status_connected) {
  1144								amdgpu_connector->use_digital = false;
  1145							}
  1146							if (ret != connector_status_disconnected)
  1147								amdgpu_connector->detected_by_load = true;
  1148						}
  1149					} else {
  1150						enum drm_connector_status lret;
  1151						/* assume digital unless load detected otherwise */
  1152						amdgpu_connector->use_digital = true;
  1153						lret = encoder_funcs->detect(encoder, connector);
  1154						DRM_DEBUG_KMS("load_detect %x returned: %x\n",
  1155							      encoder->encoder_type, lret);
  1156						if (lret == connector_status_connected)
  1157							amdgpu_connector->use_digital = false;
  1158					}
  1159					break;
  1160				}
  1161			}
  1162		}
  1163	
  1164	out:
  1165		/* updated in get modes as well since we need to know if it's analog or digital */
  1166		amdgpu_connector_update_scratch_regs(connector, ret);
  1167	
  1168	exit:
  1169		if (!drm_kms_helper_is_poll_worker()) {
  1170			pm_runtime_mark_last_busy(connector->dev->dev);
  1171			pm_runtime_put_autosuspend(connector->dev->dev);
  1172		}
  1173	
  1174		return ret;
  1175	}
  1176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
