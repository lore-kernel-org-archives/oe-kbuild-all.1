Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FBBF4FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 18:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690654027; x=1722190027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tT3wP+FAPv+fZuu7vI6KFd2fqjjxbQbUxunSx/zWWXg=;
  b=GTDzCUGuKa2R6qHz6AiR7XLDt8cB1GHN7RZzxQJ+KsVwEuvoYwrWC6vQ
   ML42jX883HkWwBieTsPEdB0pIPecIA5hexzF9pxI1PK8WaumnahpYmDKF
   HUBFdcyPTARakZwHHp4Wv0GwRv65DUdpRDajsGJEi7TTSy7ZYCC2w7j2d
   M9U0BmHmbsPI1URy3Hl1cGXv0r5VZXtYgxO757hq8Oee4Qo+5+68FJTjG
   yEGe2Y5Ud9wl5jfGZ4GI3XhyEEiNDseblPqVhMcXvzCuuVLK7ULbNLOT6
   HJJpzKmc1moNHf38pQav6zFmUDqVfVKSMrlMBGD54t0/G5uMQoR88W4XC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="353687292"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="353687292"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 11:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="727797369"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="727797369"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Jul 2023 11:07:01 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPoLE-0004EB-19;
	Sat, 29 Jul 2023 18:07:00 +0000
Date: Sun, 30 Jul 2023 02:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: support per-flow
 accounting on MT7988
Message-ID: <202307300133.j8MIsDCa-lkp@intel.com>
References: <801c89963e95e5ce8f1ab7dbda894dd9da0125cc.1690638748.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <801c89963e95e5ce8f1ab7dbda894dd9da0125cc.1690638748.git.daniel@makrotopia.org>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-ethernet-mtk_eth_soc-support-per-flow-accounting-on-MT7988/20230729-215634
base:   net-next/main
patch link:    https://lore.kernel.org/r/801c89963e95e5ce8f1ab7dbda894dd9da0125cc.1690638748.git.daniel%40makrotopia.org
patch subject: [PATCH net-next] net: ethernet: mtk_eth_soc: support per-flow accounting on MT7988
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230730/202307300133.j8MIsDCa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300133.j8MIsDCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307300133.j8MIsDCa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_ppe.c: In function 'mtk_mib_entry_read':
>> drivers/net/ethernet/mediatek/mtk_ppe.c:112:17: error: 'bytes_cnt_low' undeclared (first use in this function); did you mean 'byte_cnt_low'?
     112 |                 bytes_cnt_low = cnt_r0;
         |                 ^~~~~~~~~~~~~
         |                 byte_cnt_low
   drivers/net/ethernet/mediatek/mtk_ppe.c:112:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/mediatek/mtk_ppe.c:113:17: error: 'bytes_cnt_high' undeclared (first use in this function); did you mean 'byte_cnt_high'?
     113 |                 bytes_cnt_high = cnt_r1;
         |                 ^~~~~~~~~~~~~~
         |                 byte_cnt_high


vim +112 drivers/net/ethernet/mediatek/mtk_ppe.c

    92	
    93	static int mtk_mib_entry_read(struct mtk_ppe *ppe, u16 index, u64 *bytes, u64 *packets)
    94	{
    95		u32 byte_cnt_low, byte_cnt_high, pkt_cnt_low, pkt_cnt_high;
    96		u32 val, cnt_r0, cnt_r1, cnt_r2;
    97		int ret;
    98	
    99		val = FIELD_PREP(MTK_PPE_MIB_SER_CR_ADDR, index) | MTK_PPE_MIB_SER_CR_ST;
   100		ppe_w32(ppe, MTK_PPE_MIB_SER_CR, val);
   101	
   102		ret = mtk_ppe_mib_wait_busy(ppe);
   103		if (ret)
   104			return ret;
   105	
   106		cnt_r0 = readl(ppe->base + MTK_PPE_MIB_SER_R0);
   107		cnt_r1 = readl(ppe->base + MTK_PPE_MIB_SER_R1);
   108		cnt_r2 = readl(ppe->base + MTK_PPE_MIB_SER_R2);
   109	
   110		if (mtk_is_netsys_v3_or_greater(ppe->eth)) {
   111			/* 64 bit for each counter */
 > 112			bytes_cnt_low = cnt_r0;
 > 113			bytes_cnt_high = cnt_r1;
   114			pkt_cnt_low = cnt_r2;
   115			pkt_cnt_high = readl(ppe->base + MTK_PPE_MIB_SER_R3);
   116		} else {
   117			/* 48 bit for each counter */
   118			byte_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R0_BYTE_CNT_LOW, cnt_r0);
   119			byte_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R1_BYTE_CNT_HIGH, cnt_r1);
   120			pkt_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R1_PKT_CNT_LOW, cnt_r1);
   121			pkt_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R2_PKT_CNT_HIGH, cnt_r2);
   122		}
   123	
   124		*bytes = ((u64)byte_cnt_high << 32) | byte_cnt_low;
   125		*packets = (pkt_cnt_high << 16) | pkt_cnt_low;
   126	
   127		return 0;
   128	}
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
