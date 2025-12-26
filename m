Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9363A1E8C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 00:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766708264; cv=none; b=WLj94xrX6PCjNRjM8LPg1XZsHSdn2mVNn+pXD6DRBjHYGYFosOQUtShaQbNcX1ehThRh9J0LyEAHXTp4rTVwZIWuKcgMhXQ7bOKtdLPp+Uu65eSpFV6pfB7kfgAmJvwMS/MatK3vImY4IdisfcQcY0kVuJYhy25ivNAPZYGR/ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766708264; c=relaxed/simple;
	bh=imyO/xis54EO1E86tUpaYZu10KHWlymYGd9DAKpHjl0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hQpJiBlCAoTjEYjpRVof5Ik9GJfPXUOsVijOhD8emqkEwEYGRnrmHvLF2dz0vsWQDMuw083J8rx+bdlI2bhhZnNfcJzQfHIAEShUyPtXL8zZ+yZMcOJwGQkQRrKgImVEBtF5iQJTlgtb4iDB7OZrCOYDheElkEvCT+5MHFg58FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffwFbbt/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffwFbbt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766708263; x=1798244263;
  h=date:from:to:cc:subject:message-id;
  bh=imyO/xis54EO1E86tUpaYZu10KHWlymYGd9DAKpHjl0=;
  b=ffwFbbt/d3gZ8pPlMjCJGNWGD0CrR987Yn/ChXowghJoGKQO5SDejJoX
   Mn/RceIM6hwTBb1XPI7dklfJEmyQR6zPd6UrRaE7Sqr+WtwlldJFs1ABY
   hYBbllWnz0R5pUcyhYbz2RihtXWLph5es7kvR0t1LNW0IbANChFDSJ0oL
   oj9mPrMvmimkq3+eWfjkLAweTjoz4w8iu0KsGvpR32a/w0HGOgKz7zlob
   oBb7jLbXqk6140z4zw5T0GOyHdCTP9StcrPqn9BrktX+uB+OBik0AXh5u
   P4WxMO+4X7ml2OZllDO3QoDhA7WqSpLkJojuv1DW8X3PlrrLRTfymdDBq
   A==;
X-CSE-ConnectionGUID: hV3slQUOSmOWXAa8w2qFPw==
X-CSE-MsgGUID: LTPysj7eRgKAAFZZRUwHqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="67684112"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="67684112"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 16:17:42 -0800
X-CSE-ConnectionGUID: CMqSsmsCTNe3wZOkTu2TWw==
X-CSE-MsgGUID: HuH6C9y5RX+aS6xx3K3yzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="201213323"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Dec 2025 16:17:40 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYvWU-000000004Yr-2iEZ;
	Fri, 26 Dec 2025 00:17:38 +0000
Date: Fri, 26 Dec 2025 08:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 0/13]
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:1151:19: sparse: sparse: cast
 to restricted __le16
Message-ID: <202512260835.0bNBpUcu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: eb673fa0fa02b70db5a6e93a9ea2087a11ffb37c [0/13] wifi: mt76: mt7921: fix country count limitation for CLC
config: x86_64-randconfig-121-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260835.0bNBpUcu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260835.0bNBpUcu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260835.0bNBpUcu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:1151:19: sparse: sparse: cast to restricted __le16
>> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:1151:19: sparse: sparse: cast from restricted __le32

vim +1151 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c

  1119	
  1120	static
  1121	int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
  1122				 enum environment_cap env_cap,
  1123				 struct mt7921_clc *clc,
  1124				 u8 idx)
  1125	{
  1126		struct sk_buff *skb;
  1127		struct {
  1128			u8 ver;
  1129			u8 pad0;
  1130			__le16 len;
  1131			u8 idx;
  1132			u8 env;
  1133			u8 acpi_conf;
  1134			u8 pad1;
  1135			u8 alpha2[2];
  1136			u8 type[2];
  1137			u8 rsvd[64];
  1138		} __packed req = {
  1139			.ver = 1,
  1140			.idx = idx,
  1141			.env = env_cap,
  1142			.acpi_conf = mt792x_acpi_get_flags(&dev->phy),
  1143		};
  1144		int ret, valid_cnt = 0;
  1145		u16 buf_len = 0;
  1146		u8 *pos;
  1147	
  1148		if (!clc)
  1149			return 0;
  1150	
> 1151		buf_len = le16_to_cpu(clc->len) - sizeof(*clc);
  1152		pos = clc->data;
  1153		while (buf_len > 16) {
  1154			struct mt7921_clc_rule *rule = (struct mt7921_clc_rule *)pos;
  1155			u16 len = le16_to_cpu(rule->len);
  1156			u16 offset = len + sizeof(*rule);
  1157	
  1158			pos += offset;
  1159			buf_len -= offset;
  1160			if (rule->alpha2[0] != alpha2[0] ||
  1161			    rule->alpha2[1] != alpha2[1])
  1162				continue;
  1163	
  1164			memcpy(req.alpha2, rule->alpha2, 2);
  1165			memcpy(req.type, rule->type, 2);
  1166	
  1167			req.len = cpu_to_le16(sizeof(req) + len);
  1168			skb = __mt76_mcu_msg_alloc(&dev->mt76, &req,
  1169						   le16_to_cpu(req.len),
  1170						   sizeof(req), GFP_KERNEL);
  1171			if (!skb)
  1172				return -ENOMEM;
  1173			skb_put_data(skb, rule->data, len);
  1174	
  1175			ret = mt76_mcu_skb_send_msg(&dev->mt76, skb,
  1176						    MCU_CE_CMD(SET_CLC), false);
  1177			if (ret < 0)
  1178				return ret;
  1179			valid_cnt++;
  1180		}
  1181	
  1182		if (!valid_cnt)
  1183			return -ENOENT;
  1184	
  1185		return 0;
  1186	}
  1187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
