Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6B4246788
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 03:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771125308; cv=none; b=KMn+OvtbwP37+ube/exOUeJtmFDl3Zo/NpEMpG8C5Rzketd4oufPSKFJgwUUrZTjOb2nLkkXczI4MWrEiQQ++p7/4lQsRBGex0LkWbcgb74LhUmHeJ3qr9sHk651DiA0fxrySvpwk8hz/xMwBNqi1lGSf+yVU04Vq8elu0dwzEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771125308; c=relaxed/simple;
	bh=1WQEf6iibb3vugZzECgYsYCSDskRS7hqBVDdKZLEHuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OmpZtv7ycQAVTgljFzzxrBoS7xOkvfnTIhyOy8g4zYiqjCaQefjCEXffdjvzi7q9xlokUSK7dpDievhXMlg02RqxVbtAflrOfjjyK/HWnJNRTkw2Ju+cZjeQI+wqalAT5b2t52/1kyaX4I/tJZpw5O2x8FVJXeJWnEET4KcO7cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ak9oHIY1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ak9oHIY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771125307; x=1802661307;
  h=date:from:to:cc:subject:message-id;
  bh=1WQEf6iibb3vugZzECgYsYCSDskRS7hqBVDdKZLEHuA=;
  b=Ak9oHIY1+yQ/R4m5Ue/zgMUoFEZyKCtR2fEVj7u8rfuGxikfaY8MWGu3
   7P27HMwP/HfaST7erw7k2HQeuEm7yrHjRcBL/mi/o0pVKddyxMLk4W7be
   /D5QmUY/KLxTb7h8ArpKns4KnhG2TEN8Tlmvx1Nm32dqaIWjHANR64aQi
   WYxfA5XHUbK/8lqEy+cG0Xu9nnf9Fh3vIo+BiAZ5hPUy7e4GQhkLrEAI/
   WEx93kY8vivsal4VHc+K5ZXQaz7lbxZASXZGzkCH6M0XarCxqtvJP3emq
   Or/04q96EFPjiGm6q41W8iE3ppkqofqnKyd8ubyqkzyY/vwf/Bpp/BYE0
   g==;
X-CSE-ConnectionGUID: 3FoPEj9QSHugZ41q25U05g==
X-CSE-MsgGUID: b1CEPD7zSWCkRR1XuV6e2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="59827093"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="59827093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 19:15:07 -0800
X-CSE-ConnectionGUID: JaVB1wJ7T46bBRdpSommNA==
X-CSE-MsgGUID: mGLH/nwEQaKjF5/WZdPMLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="212345483"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Feb 2026 19:15:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrSb9-00000000xDo-0Xlt;
	Sun, 15 Feb 2026 03:15:03 +0000
Date: Sun, 15 Feb 2026 11:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2]
 sound/soc/sof/intel/hda.c:1172:undefined reference to `codec_info_list'
Message-ID: <202602151132.VYT5SQHH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   002e9fb549542a83ae6df1edad74036e1bdcfec0
commit: dcf066e2640127f5a26ff2394968a8fe39220475 [0/2] UPSTREAM: ASoC: SOF: Intel: use sof_sdw as default SDW machine driver
config: i386-randconfig-016-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151132.VYT5SQHH-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151132.VYT5SQHH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151132.VYT5SQHH-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/sof/intel/hda.o: in function `find_acpi_adr_device':
>> sound/soc/sof/intel/hda.c:1172:(.text+0x6a1): undefined reference to `codec_info_list'
>> ld: sound/soc/sof/intel/hda.c:1172:(.text+0x6a6): undefined reference to `asoc_sdw_get_codec_info_list_count'
   ld: sound/soc/sof/intel/hda.c:1172:(.text+0x6c7): undefined reference to `asoc_sdw_get_codec_info_list_count'
>> ld: sound/soc/sof/intel/hda.c:1179:(.text+0x6e8): undefined reference to `codec_info_list'
   ld: sound/soc/sof/intel/hda.o: in function `devm_kmalloc_array':
>> include/linux/device/devres.h:59:(.text+0x6f1): undefined reference to `codec_info_list'
   ld: sound/soc/sof/intel/hda.o: in function `find_acpi_adr_device':
>> sound/soc/sof/intel/hda.c:1221:(.text+0x80d): undefined reference to `asoc_sdw_get_codec_info_list_count'
   ld: sound/soc/sof/intel/hda.c:1190:(.text+0x9cb): undefined reference to `codec_info_list'


vim +1172 sound/soc/sof/intel/hda.c

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
  1184			name_prefix = codec_info_list[i].name_prefix;
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
> 1221		if (i == asoc_sdw_get_codec_info_list_count()) {
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
