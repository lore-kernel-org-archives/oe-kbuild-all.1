Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F51317CA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 07:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694244719; x=1725780719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GHkumJT5rfHETg72U8uQxeHDc5b9Lm+VCA8laoFzbF0=;
  b=Sv2XSMqNpzyB9S25qBCF8HPxpoXMaFj8uAJYZ2YVg6AI/kT5rrEbXp3O
   +9ecn8rwgtA9lam5kSR8ykLNl/l/5OhGvsT3/B/x0dac6SRSBbBjlM6G6
   rhAfHBwCULgR7jf9dVv6EvhsQGipNdBFqfEUKktJZ30SAPXZJ5W4LovGy
   z4dVbh4KHTvCqtuPTN1Td1il3IBvHGXQh3cl1dSx2FuumFtSGrs5fMgjT
   F4B/FZXivGP71xmm9cZK/6367Dvu6EhSSp0JKCYqbUTMyARc04m5tb7uf
   ee0Oxxg+zbF1ZkQTCmvC9VVIrKy83UZ3iFKISe8kDMYB6alG2ioPvlK27
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377711875"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="377711875"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 00:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="812798586"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="812798586"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2023 00:31:52 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qesRa-000352-00;
	Sat, 09 Sep 2023 07:31:50 +0000
Date: Sat, 9 Sep 2023 15:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 80/88]
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:1139:28: warning: variable
 'type' set but not used
Message-ID: <202309091553.V0w2vFiy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   dcd62291d3f1ba328303b1617495fa4542117fc1
commit: fd76a81787aec016955dcd36f13da3943510b0d1 [80/88] WIPdrm/nouveau/disp/r535: initial support
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230909/202309091553.V0w2vFiy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091553.V0w2vFiy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091553.V0w2vFiy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c: In function 'r535_outp_new':
>> drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:1139:28: warning: variable 'type' set but not used [-Wunused-but-set-variable]
    1139 |         enum nvkm_ior_type type;
         |                            ^~~~


vim +/type +1139 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c

  1134	
  1135	static int
  1136	r535_outp_new(struct nvkm_disp *disp, u32 id)
  1137	{
  1138		NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS *ctrl;
> 1139		enum nvkm_ior_type type;
  1140		enum nvkm_ior_proto proto;
  1141		struct dcb_output dcbE = {};
  1142		struct nvkm_conn *conn;
  1143		struct nvkm_outp *outp;
  1144		u8 locn, link = 0;
  1145		int ret;
  1146	
  1147		ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
  1148					    NV0073_CTRL_CMD_SPECIFIC_OR_GET_INFO, sizeof(*ctrl));
  1149		if (IS_ERR(ctrl))
  1150			return PTR_ERR(ctrl);
  1151	
  1152		ctrl->subDeviceInstance = 0;
  1153		ctrl->displayId = BIT(id);
  1154	
  1155		ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
  1156		if (IS_ERR(ctrl))
  1157			return PTR_ERR(ctrl);
  1158	
  1159		switch (ctrl->type) {
  1160		case NV0073_CTRL_SPECIFIC_OR_TYPE_NONE:
  1161			return 0;
  1162		case NV0073_CTRL_SPECIFIC_OR_TYPE_SOR:
  1163			switch (ctrl->protocol) {
  1164			case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_A:
  1165				proto = TMDS;
  1166				link = 1;
  1167				break;
  1168			case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_B:
  1169				proto = TMDS;
  1170				link = 2;
  1171				break;
  1172			case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DUAL_TMDS:
  1173				proto = TMDS;
  1174				link = 3;
  1175				break;
  1176			case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_A:
  1177				proto = DP;
  1178				link = 1;
  1179				break;
  1180			case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_B:
  1181				proto = DP;
  1182				link = 2;
  1183				break;
  1184			default:
  1185				WARN_ON(1);
  1186				return -EINVAL;
  1187			}
  1188	
  1189			type = SOR;
  1190			break;
  1191		default:
  1192			WARN_ON(1);
  1193			return -EINVAL;
  1194		}
  1195	
  1196		locn = ctrl->location;
  1197		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
  1198	
  1199		conn = r535_conn_new(disp, id);
  1200		if (IS_ERR(conn))
  1201			return PTR_ERR(conn);
  1202	
  1203		switch (proto) {
  1204		case TMDS: dcbE.type = DCB_OUTPUT_TMDS; break;
  1205		case   DP: dcbE.type = DCB_OUTPUT_DP; break;
  1206		default:
  1207			WARN_ON(1);
  1208			return -EINVAL;
  1209		}
  1210	
  1211		dcbE.location = locn;
  1212		dcbE.connector = conn->index;
  1213		dcbE.heads = disp->head.mask;
  1214		dcbE.i2c_index = 0xff;
  1215		dcbE.link = dcbE.sorconf.link = link;
  1216	
  1217		if (proto == TMDS) {
  1218			ret = nvkm_outp_new_(&r535_tmds, disp, id, &dcbE, &outp);
  1219			if (ret)
  1220				return ret;
  1221		} else {
  1222			NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS *ctrl;
  1223			bool mst, wm;
  1224	
  1225			ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
  1226						    NV0073_CTRL_CMD_DP_GET_CAPS, sizeof(*ctrl));
  1227			if (IS_ERR(ctrl))
  1228				return PTR_ERR(ctrl);
  1229	
  1230			ctrl->sorIndex = ~0;
  1231	
  1232			ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
  1233			if (IS_ERR(ctrl))
  1234				return PTR_ERR(ctrl);
  1235	
  1236			switch (NVVAL_GET(ctrl->maxLinkRate, NV0073_CTRL_CMD, DP_GET_CAPS, MAX_LINK_RATE)) {
  1237			case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_1_62:
  1238				dcbE.dpconf.link_bw = 0x06;
  1239				break;
  1240			case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_2_70:
  1241				dcbE.dpconf.link_bw = 0x0a;
  1242				break;
  1243			case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_5_40:
  1244				dcbE.dpconf.link_bw = 0x14;
  1245				break;
  1246			case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_8_10:
  1247				dcbE.dpconf.link_bw = 0x1e;
  1248				break;
  1249			default:
  1250				dcbE.dpconf.link_bw = 0x00;
  1251				break;
  1252			}
  1253	
  1254			mst = ctrl->bIsMultistreamSupported;
  1255			wm = ctrl->bHasIncreasedWatermarkLimits;
  1256			nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
  1257	
  1258			if (WARN_ON(!dcbE.dpconf.link_bw))
  1259				return -EINVAL;
  1260	
  1261			dcbE.dpconf.link_nr = 4;
  1262	
  1263			ret = nvkm_outp_new_(&r535_dp, disp, id, &dcbE, &outp);
  1264			if (ret)
  1265				return ret;
  1266	
  1267			outp->dp.mst = mst;
  1268			outp->dp.increased_wm = wm;
  1269		}
  1270	
  1271	
  1272		outp->conn = conn;
  1273		list_add_tail(&outp->head, &disp->outps);
  1274		return 0;
  1275	}
  1276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
