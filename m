Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137E7222565
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 00:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785199348; cv=none; b=ZHOXEYcGhChIYie8bABDNKOvAfP5rJyciGmY70BnEJRZ+wIt/QImfGTlZGMkCcNYglzW6h/qjr7UhHoiUWvD6toQP8ammWPMRJJVgYi7JTmFWLQ+gxWgC8ACqbOEpcV/BJN+o7prX0XkM0sg/qYfWIgkmkiMHiagGj7Pyyy3+C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785199348; c=relaxed/simple;
	bh=eCVauW4nCIYU7bjCGsjInh5gignDQYcJjaGiVXUHR2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i2Sb23qaIeqSPgXx3q1B0oTBuxVT//M15h9BWtvxlGIt3KL6SkhVps96egj98Ohjwq+uplv5Am5LT1zFt35ITqwBXBvLMc8IuabyE4epNJAPWJYO98c8EXZXiNfJjhCCDV/HZMu9Ga46ISr8eYwnMYYIPO0gocqifNKcKgt92S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lulVhEWT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lulVhEWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785199346; x=1816735346;
  h=date:from:to:cc:subject:message-id;
  bh=eCVauW4nCIYU7bjCGsjInh5gignDQYcJjaGiVXUHR2Y=;
  b=lulVhEWTQGoMHNqq+EfT23JY7OP6qAZurvd7qzvETnzRwsjK8Oiw7GZr
   vabQ/l558D9mGxdGWERhWlizisV95lTrJcp/z13Damnlyl0C4JVmfdodu
   CA6dV6LO/Mjz/ETiyBq/y3gRioDfn9nRP83Xs4BjAvITu0VB6bUCTnx6Y
   HIPQO2JocxQ6tLNMYDNZv9VP3RDJr00xCEJrCVnqoY94X8VrFhEpz35I1
   U1uFjrzk/+9cwbtCIyipBdGH9BSrwv1ErYPiktjVGKByNkQNv0R+V4H11
   Q/1dxo6KVKrUpey8TcI4CWlLciCyrZvCbOTVnUlMsp/fUcJ/NzaeJkPFu
   Q==;
X-CSE-ConnectionGUID: fbSTLmVaRwCcYw8628DnZg==
X-CSE-MsgGUID: Bwn5ChoCStqUwNtpmmyBQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84754862"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="84754862"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 17:42:25 -0700
X-CSE-ConnectionGUID: A5pH+/LKQTmKka8sO+ff0A==
X-CSE-MsgGUID: KaQIKpFZQieQTa7VB2utAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="282888919"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jul 2026 17:42:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woVtl-00000000dlL-3ubm;
	Tue, 28 Jul 2026 00:42:21 +0000
Date: Tue, 28 Jul 2026 08:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 164/164]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5651:13: warning: variable
 'flags' set but not used
Message-ID: <202607280819.klT9zkgX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   23918d7eab97daf57988a8a538a870c4e862b525
commit: 9f04fd76bc18f52ae96c6487be54d8c8bedca353 [164/164] net: pcs: mtk-lynxi: add phya tx rx clock path
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260728/202607280819.klT9zkgX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280819.klT9zkgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280819.klT9zkgX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_sgmii_init':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5651:13: warning: variable 'flags' set but not used [-Wunused-but-set-variable=]
    5651 |         u32 flags = 0;
         |             ^~~~~


vim +/flags +5651 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  5646	
  5647	static int mtk_sgmii_init(struct mtk_eth *eth)
  5648	{
  5649		struct device_node *np;
  5650		struct regmap *regmap;
> 5651		u32 flags = 0;
  5652		int i;
  5653	
  5654		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5655			np = of_parse_phandle(eth->dev->of_node, "mediatek,sgmiisys", i);
  5656			if (!np)
  5657				break;
  5658	
  5659			regmap = syscon_node_to_regmap(np);
  5660			if (IS_ERR(regmap)) {
  5661				of_node_put(np);
  5662	
  5663			if (of_property_read_bool(np->parent, "mediatek,phya_trx_ck"))
  5664				flags |= MTK_SGMII_FLAG_PHYA_TRX_CK;
  5665	
  5666			of_node_put(np);
  5667	
  5668			if (IS_ERR(regmap))
  5669				return PTR_ERR(regmap);
  5670			}
  5671	
  5672			eth->sgmii_pcs[i] = mtk_pcs_lynxi_create(eth->dev,
  5673								 of_fwnode_handle(np),
  5674								 regmap,
  5675								 eth->soc->ana_rgc3);
  5676			of_node_put(np);
  5677		}
  5678	
  5679		return 0;
  5680	}
  5681	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
