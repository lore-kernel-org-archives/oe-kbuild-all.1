Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA453D989
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h72IWwTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702300998; x=1733836998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JD1SYZ7llkilT9HyFuEPXd+fMLESo4XavFhjpIT59lE=;
  b=h72IWwTFHEXfAtckzWE9INj+acPoqwebYqLekhxcA+eH8jhJISUfuNPG
   zCSbXHKlhD5fPcjgckbMHdcsE3N8DZDYVcuzJSdKJDZyR5GcJuK2h7FY/
   FFIvQKiXo22caISI5CM8A6jb7qaE3gt7RVFyiMWFnF29Vd003z5xQVaQ8
   ORN4qRZYbW3DVBiPFCkb//WB1uVD+FigExT+QysLgWXvPI+jRDRHhqPzM
   J/h2AmnlNplhuju206bxaNxuF59yYRv1aed07SUA6wWYKsWGR0UNRBSfe
   /kH15XHKWmRUaRNHRQma8+9AWRpy+OvpkdYNzdLRUXPX2GAg+59pnZOKZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="8000760"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="8000760"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 05:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="773058741"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="773058741"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 11 Dec 2023 05:23:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCgFd-000I3D-1M;
	Mon, 11 Dec 2023 13:23:13 +0000
Date: Mon, 11 Dec 2023 21:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 60/62]
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:1285:19: sparse: sparse:
 cast to restricted __le16
Message-ID: <202312112104.Zkc3QUHr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   0318b308805ea665679297c3f24b243c1b39b292
commit: f7c70874120cb7daafe0754f270d8313cb9bb208 [60/62] wifi: mt76: mt7921: fix country count limitation for CLC
config: csky-randconfig-r113-20231211 (https://download.01.org/0day-ci/archive/20231211/202312112104.Zkc3QUHr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312112104.Zkc3QUHr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312112104.Zkc3QUHr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:1285:19: sparse: sparse: cast to restricted __le16
>> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:1285:19: sparse: sparse: cast from restricted __le32

vim +1285 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c

  1242	
  1243	static
  1244	int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
  1245				 enum environment_cap env_cap,
  1246				 struct mt7921_clc *clc,
  1247				 u8 idx)
  1248	{
  1249	#define CLC_CAP_EVT_EN BIT(0)
  1250	#define CLC_CAP_DTS_EN BIT(1)
  1251		struct sk_buff *skb, *ret_skb = NULL;
  1252		struct {
  1253			u8 ver;
  1254			u8 pad0;
  1255			__le16 len;
  1256			u8 idx;
  1257			u8 env;
  1258			u8 acpi_conf;
  1259			u8 cap;
  1260			u8 alpha2[2];
  1261			u8 type[2];
  1262			u8 env_6g;
  1263			u8 mtcl_conf;
  1264			u8 rsvd[62];
  1265		} __packed req = {
  1266			.ver = 1,
  1267			.idx = idx,
  1268			.env = env_cap,
  1269			.env_6g = dev->phy.power_type,
  1270			.acpi_conf = mt792x_acpi_get_flags(&dev->phy),
  1271			.mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, alpha2),
  1272		};
  1273		int ret, valid_cnt = 0;
  1274		u16 buf_len = 0;
  1275		u8 *pos;
  1276	
  1277		if (!clc)
  1278			return 0;
  1279	
  1280		if (dev->phy.chip_cap & MT792x_CHIP_CAP_CLC_EVT_EN)
  1281			req.cap |= CLC_CAP_EVT_EN;
  1282		if (mt76_find_power_limits_node(&dev->mt76))
  1283			req.cap |= CLC_CAP_DTS_EN;
  1284	
> 1285		buf_len = le16_to_cpu(clc->len) - sizeof(*clc);
  1286		pos = clc->data;
  1287		while (buf_len > 16) {
  1288			struct mt7921_clc_rule *rule = (struct mt7921_clc_rule *)pos;
  1289			u16 len = le16_to_cpu(rule->len);
  1290			u16 offset = len + sizeof(*rule);
  1291	
  1292			pos += offset;
  1293			buf_len -= offset;
  1294			if (rule->alpha2[0] != alpha2[0] ||
  1295			    rule->alpha2[1] != alpha2[1])
  1296				continue;
  1297	
  1298			memcpy(req.alpha2, rule->alpha2, 2);
  1299			memcpy(req.type, rule->type, 2);
  1300	
  1301			req.len = cpu_to_le16(sizeof(req) + len);
  1302			skb = __mt76_mcu_msg_alloc(&dev->mt76, &req,
  1303						   le16_to_cpu(req.len),
  1304						   sizeof(req), GFP_KERNEL);
  1305			if (!skb)
  1306				return -ENOMEM;
  1307			skb_put_data(skb, rule->data, len);
  1308	
  1309			ret = mt76_mcu_skb_send_and_get_msg(&dev->mt76, skb,
  1310							    MCU_CE_CMD(SET_CLC),
  1311							    !!(req.cap & CLC_CAP_EVT_EN),
  1312							    &ret_skb);
  1313			if (ret < 0)
  1314				return ret;
  1315	
  1316			if (ret_skb) {
  1317				struct mt7921_clc_info_tlv *info;
  1318	
  1319				info = (struct mt7921_clc_info_tlv *)(ret_skb->data + 4);
  1320				dev->phy.clc_chan_conf = info->chan_conf;
  1321				dev_kfree_skb(ret_skb);
  1322			}
  1323	
  1324			valid_cnt++;
  1325		}
  1326	
  1327		if (!valid_cnt)
  1328			return -ENOENT;
  1329	
  1330		return 0;
  1331	}
  1332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
