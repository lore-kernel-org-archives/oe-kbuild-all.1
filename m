Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795258;
	b=5kljHUWUG6k22tt0nqH3itKVasOB+9Q7xp3Gv1XKnsybqUsdnU/E+gWulmaDXYtdM7/L
	 Sxk8p2IGnsH+4JXfNH5x0aEBP3JrKpKyWo8ELFdYYlUsvIwo12Eaue7PZO6ymvWYIMflb
	 xecEWnlwFqth+Do9gt2MIQlYgtR1kie0TsfuKIU3nAZtPV+KcxtHve2kwAXqGEfOIQqZh
	 GG373pvmMa/lg/WRDuzruQMwHLWU/m+5u7SWmxUhnKPQPbjvQ9aPy5kJMEVCXNsLZuvxa
	 6ByfrZVhNbcsIheFuWTzD0HgoXg9T1VYfUjctPs45FrBvCJQN6L1IGG2UyRE+SU004A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795258;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=I48bc5Ga0cZbQ6Yh109l+2Cd4sOHBKpYc/VLDeVcCvc=;
	b=dSQRKuVjTPkav80IXv8ZMwBafGgw/T9CW+DnfjCg0Elu9/7Xjq9oYkcOGpCTvSEeJHfO
	 Ccanq256Ju8gBx9DjU6LL1oiou6hjlEZ/QEurj+AbGTq+HFLtgYzvLNOTqtwe7nxQkctx
	 Luwy56TQQap+d1wA9+gOemCyc+GohqBXJkhV+r8vSfn4MRcsMTOSiUIIWTN0/0CwVsYx9
	 qrnfAsWTTdDiNTboukFIzJt772OyY9Rv/vZGHeOPUumtr29ubwAhBIsWxftI1ceIpX/kh
	 ARUi6lQxPKZTIx/BwxNhFWCtJO8RFL0PjHEGXdQ0xPBx0KZJ8fgFCuVHAaADCUnneRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kwyJWG5H;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88884606A696
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 16:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88884606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kwyJWG5H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795795258; x=1827331258;
  h=date:from:to:cc:subject:message-id;
  bh=ZtmAdPTtDM35k9of5IuCZv5uFXYwAyt+tx/2OmRNMQQ=;
  b=kwyJWG5H7/GqsfsUnMkFTNzv+Alaao/apj0inTBpYpRSYCN1DgIqyDeN
   g6ULSy0GNrm4wcvct8XuOSF9WhEGXG291nCBgXXWOiggyNsw8lbMwCZul
   rCgecdb+yMNPEMO1HEV7GPJYQbzdKzcmVekkXzq8CxchD4s0HmVy2ImMB
   4I5sid7ZttDM2QXOuV58FE25JkDlNDfTF2eq+KQgmbEo24aOGALVnzkh5
   0GG8wfIqMFPKugQxo1GkzUFaIq+a4U/PJGCP56gEbRO+VoTdOcShfH1L4
   Vj8Y8wL6QPBLWKQMl8fJYAiMQaRcRh8Jpv807LLxe7MKI1MXwsXYGO0m4
   A==;
X-CSE-ConnectionGUID: x7NI3uU3RwiwB4x6VswiGA==
X-CSE-MsgGUID: FrtdUyd+THeZ7GO408j81A==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4759922"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4759922"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 08:00:42 -0800
X-CSE-ConnectionGUID: buXkoIQGS2uPng3wuM9vaA==
X-CSE-MsgGUID: +yY2CoKTTAqPRPsNxQihMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12836819"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Nov 2026 08:00:40 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWyNJ-000000000Dr-2qVA;
	Fri, 27 Nov 2026 16:00:37 +0000
Date: Fri, 27 Nov 2026 16:59:42 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 sound/soc/sof/intel/hda.c:1179:undefined reference to `codec_info_list'
Message-ID: <20261127165703.nq1u31ec-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b38025ea3e69ef15148e9c5eb6973b879eb604e2
commit: dcf066e2640127f5a26ff2394968a8fe39220475 [1/1] UPSTREAM: ASoC: SOF: Intel: use sof_sdw as default SDW machine driver
config: i386-randconfig-r2307-20261126 (https://download.01.org/0day-ci/archive/20261127/20261127165703.nq1u31ec-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127165703.nq1u31ec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127165703.nq1u31ec-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/sof/intel/hda.o: in function `find_acpi_adr_device':
>> sound/soc/sof/intel/hda.c:1179:(.text.unlikely+0x164): undefined reference to `codec_info_list'
   ld: sound/soc/sof/intel/hda.o: in function `devm_kmalloc_array':
>> include/linux/device/devres.h:59:(.text.unlikely+0x172): undefined reference to `codec_info_list'
   ld: sound/soc/sof/intel/hda.o: in function `find_acpi_adr_device':
   sound/soc/sof/intel/hda.c:1176:(.text.unlikely+0x18e): undefined reference to `codec_info_list'
>> ld: sound/soc/sof/intel/hda.c:1172:(.text.unlikely+0x196): undefined reference to `asoc_sdw_get_codec_info_list_count'
>> ld: sound/soc/sof/intel/hda.c:1184:(.text.unlikely+0x1bb): undefined reference to `codec_info_list'
   ld: sound/soc/sof/intel/hda.c:1190:(.text.unlikely+0x1e1): undefined reference to `codec_info_list'
   ld: sound/soc/sof/intel/hda.c:1221:(.text.unlikely+0x282): undefined reference to `asoc_sdw_get_codec_info_list_count'


vim +1179 sound/soc/sof/intel/hda.c

  1148	
  1149	static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
  1150								    struct sdw_slave *sdw_device,
  1151								    struct snd_soc_acpi_link_adr *link,
  1152								    int *amp_index)
  1153	{
  1154		struct snd_soc_acpi_adr_device *adr_dev;
  1155		const char *name_prefix = "";
  1156		int index = link->num_adr;
  1157		bool is_amp = true; /* Set it to false if the codec wiah any NON-AMP DAI type */
  1158		int ep_index = 0;
  1159		int i, j;
  1160	
  1161		link->mask = BIT(sdw_device->bus->link_id);
  1162		/* index is 0 based, we need allocate index + 1 for the array size */
  1163		if (!index)
  1164			adr_dev = devm_kzalloc(dev, sizeof(*adr_dev), GFP_KERNEL);
  1165		else
  1166			adr_dev = devm_krealloc(dev, (struct snd_soc_acpi_adr_device *)link->adr_d,
  1167						(index + 1) * sizeof(*adr_dev), GFP_KERNEL);
  1168	
  1169		if (!adr_dev)
  1170			return NULL;
  1171	
> 1172		for (i = 0; i < asoc_sdw_get_codec_info_list_count(); i++) {
  1173			struct snd_soc_acpi_endpoint *endpoints;
  1174			int amp_group_id = 1;
  1175	
  1176			if (sdw_device->id.part_id != codec_info_list[i].part_id)
  1177				continue;
  1178	
> 1179			endpoints = devm_kcalloc(dev, codec_info_list[i].dai_num,
  1180						 sizeof(struct snd_soc_acpi_endpoint), GFP_KERNEL);
  1181			if (!endpoints)
  1182				return NULL;
  1183	
> 1184			name_prefix = codec_info_list[i].name_prefix;
  1185			/*
  1186			 * This should not happen, but add a paranoid check to avoid NULL pointer
  1187			 * dereference
  1188			 */
  1189			if (!name_prefix) {
  1190				dev_err(dev, "codec_info_list name_prefix of part id %#x is missing\n",
  1191					codec_info_list[i].part_id);
  1192				return NULL;
  1193			}
  1194			for (j = 0; j < codec_info_list[i].dai_num; j++) {
  1195				/* Check if the endpoint is present by the SDCA DisCo table */
  1196				if (!is_endpoint_present(sdw_device, &codec_info_list[i],
  1197							 codec_info_list[i].dais[j].dai_type))
  1198					continue;
  1199	
  1200				endpoints[ep_index].num = ep_index;
  1201				if (codec_info_list[i].dais[j].dai_type == SOC_SDW_DAI_TYPE_AMP) {
  1202					/* Assume all amp are aggregated */
  1203					endpoints[ep_index].aggregated = 1;
  1204					endpoints[ep_index].group_id = amp_group_id;
  1205					endpoints[ep_index].group_position = *amp_index;
  1206					/* Set group id = 2 for feedback capture endpoint */
  1207					amp_group_id++;
  1208				} else {
  1209					endpoints[ep_index].aggregated = 0;
  1210					endpoints[ep_index].group_id = 0;
  1211					endpoints[ep_index].group_position = 0;
  1212					is_amp = false;
  1213				}
  1214				ep_index++;
  1215			}
  1216			adr_dev[index].endpoints = endpoints;
  1217			adr_dev[index].num_endpoints = ep_index;
  1218			break;
  1219		}
  1220	
  1221		if (i == asoc_sdw_get_codec_info_list_count()) {
  1222			dev_err(dev, "part id %#x is not supported\n", sdw_device->id.part_id);
  1223			return NULL;
  1224		}
  1225	
  1226		adr_dev[index].adr = ((u64)sdw_device->id.class_id & 0xFF) |
  1227				((u64)sdw_device->id.part_id & 0xFFFF) << 8 |
  1228				((u64)sdw_device->id.mfg_id & 0xFFFF) << 24 |
  1229				((u64)(sdw_device->id.unique_id & 0xF) << 40) |
  1230				((u64)(sdw_device->id.sdw_version & 0xF) << 44) |
  1231				((u64)(sdw_device->bus->link_id & 0xF) << 48);
  1232	
  1233		if (!is_amp) {
  1234			/* For non-amp codecs, get name_prefix from codec_info_list[] */
  1235			adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s", name_prefix);
  1236			goto done_name_prefix;
  1237		}
  1238	
  1239		/*
  1240		 * The name_prefix comes from codec_info_list which has a name_prefix per codec.
  1241		 * And we need to give a unique name_prefix for each amp and should be backwards
  1242		 * compatible to the existing acpi match tables to not break existing UCMs.
  1243		 * For the common name_prefix, we append the amp index to it. However, for the
  1244		 * "Left" name_prefix, we convert the second amp name_prefix to "Right" and
  1245		 * for the third and further amps, we set the name_prefix to "AMP<amp_index>".
  1246		 */
  1247		if (!strcmp(name_prefix, "Left")) {
  1248			switch (*amp_index) {
  1249			case 1:
  1250				adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL,
  1251									    "%s", "Left");
  1252				break;
  1253			case 2:
  1254				adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL,
  1255									    "%s", "Right");
  1256				break;
  1257			default:
  1258				/* Set the name_fix to AMP<amp_index> if there are more than 2 amps */
  1259				adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
  1260									    "AMP", *amp_index);
  1261				break;
  1262			}
  1263		} else {
  1264			adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
  1265								    name_prefix,
  1266								    *amp_index);
  1267		}
  1268		(*amp_index)++;
  1269	
  1270	done_name_prefix:
  1271		if (!adr_dev[index].name_prefix) {
  1272			dev_err(dev, "failed to allocate memory for name_prefix\n");
  1273			return NULL;
  1274		}
  1275	
  1276		dev_dbg(dev, "adr[%d] 0x%llx link id %d name_prefix \"%s\" is found\n",
  1277			index, adr_dev[index].adr, sdw_device->bus->link_id, adr_dev[index].name_prefix);
  1278	
  1279		link->num_adr++;
  1280	
  1281		return adr_dev;
  1282	}
  1283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
