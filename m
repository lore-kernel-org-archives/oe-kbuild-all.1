Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C96B85C4A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 12:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761567422; cv=none; b=e94eaBAUUpBkhBNd23HCJom/rkPgFQngzjgtnc3JaNpOsh0SEh+CDHZi6wbhgDdrRFwlVaYZEQlBebrarRUiF7PHyd13QY+aHHEXh4xcU1i16dwPiIQ24l/c3bb6SISeyHiowvOdIWclhOtrRGX87IYEE0WhI5LzI5flBF86jYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761567422; c=relaxed/simple;
	bh=oaiSG6EgRF1Tp1dI76c0NX0p6GnuCpK5Cp/p7gl+w7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yjq2czJ/PK2iT0ZyBmBnCdWJ5esf6VO4AdfB1yAVCyM7muLlBQmC6e9zMQJbjeL0nagUsu3CG/bgZSbrkOyPGUK2ZpHzXcSpJO63WbxhmjoKhY8HXBDFgXEkLJzUhdWzMPHetPztyoFD6mzMPbHF6sP/3jivm+v4Ouh0KpVwM1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qwl0MxM6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qwl0MxM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761567421; x=1793103421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oaiSG6EgRF1Tp1dI76c0NX0p6GnuCpK5Cp/p7gl+w7A=;
  b=Qwl0MxM6uKRB/rRrVzHyVjwoj95MYMLFlLeycnJKFB8/NsvF9W+9vshl
   siUNl9LnfaAVGKxNRt0ejS/A1oPLGEcXYE3I7dknagEmhY3W+VHL1n14Z
   uzV8lTReJiSWpfS5XCtfE4iT9vjYqJQQYoXZlsEsiZVcfhewpGYYYudOC
   SmQ7eSYvf9DpMAMt7AZKLTbTcGCGoPamxwsGo+ZgKIgog/XfxuDm+Vicl
   vak8I5tXea9WbOf9hre0+inl3LHsDidg7xqS9tcPLGiBRpTM9D3C4SYRJ
   S9JfyypGKR26kFLUjgmFZ3WpN8r+vdDHni/GDbKysj4ykmLx8epVZ1BE2
   A==;
X-CSE-ConnectionGUID: b3JGGhR5RVSMiDUyrJdzgw==
X-CSE-MsgGUID: gOLRIzH/QmqOEvxPXgGu7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63736991"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63736991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 05:17:00 -0700
X-CSE-ConnectionGUID: QydQK/lSTV+WbihV4qpOYg==
X-CSE-MsgGUID: pooXMKzoTCubM/1YRPNkzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184207836"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2025 05:16:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDM9a-000GlV-30;
	Mon, 27 Oct 2025 12:16:52 +0000
Date: Mon, 27 Oct 2025 20:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Simon Trimmer <simont@opensource.cirrus.com>
Subject: [linux-next:master 986/4376]
 sound/soc/sof/intel/hda.c:1179:undefined reference to `codec_info_list'
Message-ID: <202510272037.nf7xzQxk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
commit: 5226d19d4cae5398caeb93a6052bfb614e0099c7 [986/4376] ASoC: SOF: Intel: use sof_sdw as default SDW machine driver
config: i386-randconfig-015-20251027 (https://download.01.org/0day-ci/archive/20251027/202510272037.nf7xzQxk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510272037.nf7xzQxk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510272037.nf7xzQxk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/sof/intel/hda.o: in function `find_acpi_adr_device':
>> sound/soc/sof/intel/hda.c:1179:(.text.unlikely+0x95): undefined reference to `codec_info_list'
   ld: sound/soc/sof/intel/hda.o: in function `devm_kmalloc_array':
>> include/linux/device/devres.h:59:(.text.unlikely+0xa3): undefined reference to `codec_info_list'
   ld: sound/soc/sof/intel/hda.o: in function `find_acpi_adr_device':
   sound/soc/sof/intel/hda.c:1176:(.text.unlikely+0xc0): undefined reference to `codec_info_list'
>> ld: sound/soc/sof/intel/hda.c:1172:(.text.unlikely+0xca): undefined reference to `asoc_sdw_get_codec_info_list_count'
>> ld: sound/soc/sof/intel/hda.c:1184:(.text.unlikely+0xf1): undefined reference to `codec_info_list'
   ld: sound/soc/sof/intel/hda.c:1190:(.text.unlikely+0x113): undefined reference to `codec_info_list'
   ld: sound/soc/sof/intel/hda.c:1221:(.text.unlikely+0x226): undefined reference to `asoc_sdw_get_codec_info_list_count'


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
