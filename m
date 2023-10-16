Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244B215491
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 07:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ah3ThXZn"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39G4qF6R113977;
	Sun, 15 Oct 2023 23:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697431935;
	bh=rOD+UJEGwIXXuaIuWSogMg77uvD/bZ9SzQ1ieBYT5aY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ah3ThXZnuLIZXtl6Ux9ErqCUp4Gnr4UuxwMtq6sFujKq/F2LqT0RAHKGcnleJ/vD7
	 jh7U1Nvf1Zd2RYYH7Hr0BlruT97NDtwcCwlbdg/gS9iK+kgoa+gqTOSn+Fs8FtJQJ3
	 qJOtC/nHTqf1EAElpd5taDeByTyCFco64ZKMzymI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39G4qFds097458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 15 Oct 2023 23:52:15 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 15
 Oct 2023 23:52:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 15 Oct 2023 23:52:15 -0500
Received: from [10.249.135.225] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39G4qDiZ028395;
	Sun, 15 Oct 2023 23:52:14 -0500
Message-ID: <ef283c6d-5074-8748-ea4b-7e85e3d6a833@ti.com>
Date: Mon, 16 Oct 2023 10:22:12 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [EXTERNAL] Re: [PATCH] net: ti: icssg-prueth: Fix tx_total_bytes
 count
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, MD Danish Anwar <danishanwar@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>
References: <20231011063700.1824093-1-danishanwar@ti.com>
 <202310142105.gb7k82oJ-lkp@intel.com>
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <202310142105.gb7k82oJ-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 10/14/2023 7:26 PM, kernel test robot wrote:
> Hi MD,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.6-rc5 next-20231013]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/MD-Danish-Anwar/net-ti-icssg-prueth-Fix-tx_total_bytes-count/20231011-143912
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20231011063700.1824093-1-danishanwar%40ti.com
> patch subject: [PATCH] net: ti: icssg-prueth: Fix tx_total_bytes count
> config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310142105.gb7k82oJ-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142105.gb7k82oJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310142105.gb7k82oJ-lkp@intel.com/
> 

I had already posted the fix for this in the next revision (v2) of the
patch, even before this warning email was generated.

v2: https://lore.kernel.org/all/20231012064626.977466-1-danishanwar@ti.com/

> All errors (new ones prefixed by >>):
> 
>    drivers/net/ethernet/ti/icssg/icssg_stats.c: In function 'emac_update_hardware_stats':
>>> drivers/net/ethernet/ti/icssg/icssg_stats.c:33:30: error: 'icssg_ethtool_stats' undeclared (first use in this function); did you mean 'icssg_ethtool_ops'?
>       33 |                 if (!strncmp(icssg_ethtool_stats[i].name, "tx_good_frames", ETH_GSTRING_LEN))
>          |                              ^~~~~~~~~~~~~~~~~~~
>          |                              icssg_ethtool_ops
>    drivers/net/ethernet/ti/icssg/icssg_stats.c:33:30: note: each undeclared identifier is reported only once for each function it appears in
> 
> 
> vim +33 drivers/net/ethernet/ti/icssg/icssg_stats.c
> 
>     15	
>     16	void emac_update_hardware_stats(struct prueth_emac *emac)
>     17	{
>     18		struct prueth *prueth = emac->prueth;
>     19		int slice = prueth_emac_slice(emac);
>     20		u32 base = stats_base[slice];
>     21		u32 tx_pkt_cnt = 0;
>     22		u32 val;
>     23		int i;
>     24	

>     25		for (i = 0; i < ARRAY_SIZE(icssg_all_stats); i++) {
>     26			regmap_read(prueth->miig_rt,
>     27				    base + icssg_all_stats[i].offset,
>     28				    &val);
>     29			regmap_write(prueth->miig_rt,
>     30				     base + icssg_all_stats[i].offset,
>     31				     val);
>     32	
>   > 33			if (!strncmp(icssg_ethtool_stats[i].name, "tx_good_frames", ETH_GSTRING_LEN))
>     34				tx_pkt_cnt = val;
>     35	
>     36			emac->stats[i] += val;
>     37			if (!strncmp(icssg_ethtool_stats[i].name, "tx_total_bytes", ETH_GSTRING_LEN))
>     38				emac->stats[i] -= tx_pkt_cnt * 8;
>     39		}
>     40	}
>     41	
> 

-- 
Thanks and Regards,
Md Danish Anwar
