Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19AD1581E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726506864; cv=none; b=l3ERVqza75WA3sf0Myki3xjQJ6o3j63ikS3pm3WsCjxwmhOQL7DFR165LEScPTcQKsWr1qHIdSQNDte9IBgyTzfoedyg51lUjIcqBql1NBDfMPn4COI34YIe8QtlOeGP88wjqll2xKKJntEbRt6XtP+WISaMSflErJJB6nlZbrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726506864; c=relaxed/simple;
	bh=tNIT6Rb3/4W6G1/vE+8uamflUt841Fq23pEoqT2qlRc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hMcwrGl66PFd/BJmX1Wi/vBj9EvVaZpXfGKqGrQPJgebhGumnpr1h2VX/dC3/NI+SVEVbJIAD2yydabGO4xOLT+8Tz6ETzUuUzqUoT3CrwU4MXb5ovT5OL57zVfNWy+xyLgNHUF1r347fFDi5i2NOO9Lzsjdm1wnykmCIfr+mcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mf37IbLj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mf37IbLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726506863; x=1758042863;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tNIT6Rb3/4W6G1/vE+8uamflUt841Fq23pEoqT2qlRc=;
  b=mf37IbLj38YhAzouh1vnCMoGDwclzuUHdxMXgWVE1ENYfhw7Pad5g9TQ
   6FPuhylAbLyGs2G2JhwW8Jo5+w2JbkEMxSYn1AUI9QYNhBr5ORqVweLbc
   P2L5yaPNR4bN/iTiEzWun6xuV8SZ2QdN5pdXndgididh02JJuXssvv7q6
   1TGeDXXdajtlDN5bqItdk/b8yJJ5umxuk0bPK2js2SU0xZvlg9gXWQVr2
   2eo8VaLMXg3fyMqzittiHq0Jy25zbrN6FhISvHPfYpbISH3feBMBdkvi0
   yWT1CzxiDmQCXEe5vFxvcdYWTx8UnIvs51xRs0tyREymEdhpM+uc0ZN1F
   Q==;
X-CSE-ConnectionGUID: 7EekCPv+TNyUllJjAh5Qtg==
X-CSE-MsgGUID: wzlVP+L5Tle3YRdVQG1AQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="28257143"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="28257143"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 10:14:20 -0700
X-CSE-ConnectionGUID: 096CF7RqRcKM28G1Dc798w==
X-CSE-MsgGUID: tOBmnKXcS4G+RsX11CMcSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68915531"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2024 10:14:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqFIm-000AKm-2O;
	Mon, 16 Sep 2024 17:14:16 +0000
Date: Tue, 17 Sep 2024 01:13:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	MD Danish Anwar <danishanwar@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 45/69]
 drivers/net/ethernet/ti/icssg_prueth.c:2087: warning: Function parameter or
 member 'bpf' not described in 'emac_xdp_setup'
Message-ID: <202409170113.pJkuP6JI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   829eefbd4a1ba5b21fb43beeba454fd5dc23bb80
commit: 78264a1200f8382c460803badd7d458e47ef8736 [45/69] net: ethernet: ti: icssg_prueth: Add AF_XDP support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240917/202409170113.pJkuP6JI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170113.pJkuP6JI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170113.pJkuP6JI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/ti/icssg_prueth.c:2087: warning: Function parameter or member 'bpf' not described in 'emac_xdp_setup'
>> drivers/net/ethernet/ti/icssg_prueth.c:2087: warning: Excess function parameter 'prog' description in 'emac_xdp_setup'
>> drivers/net/ethernet/ti/icssg_prueth.c:2106: warning: Function parameter or member 'bpf' not described in 'emac_ndo_bpf'
>> drivers/net/ethernet/ti/icssg_prueth.c:2106: warning: Excess function parameter 'xdp' description in 'emac_ndo_bpf'


vim +2087 drivers/net/ethernet/ti/icssg_prueth.c

  2080	
  2081	/**
  2082	 * emac_xdp_setup - add/remove an XDP program
  2083	 * @emac: emac device
  2084	 * @prog: XDP program
  2085	 **/
  2086	static int emac_xdp_setup(struct prueth_emac *emac, struct netdev_bpf *bpf)
> 2087	{
  2088		struct bpf_prog *prog = bpf->prog;
  2089	
  2090		if (!emac->xdpi.prog && !prog)
  2091			return 0;
  2092	
  2093		WRITE_ONCE(emac->xdp_prog, prog);
  2094	
  2095		xdp_attachment_setup(&emac->xdpi, bpf);
  2096	
  2097		return 0;
  2098	}
  2099	
  2100	/**
  2101	 * emac_ndo_bpf - implements ndo_bpf for icssg_prueth
  2102	 * @ndev: network adapter device
  2103	 * @xdp: XDP command
  2104	 **/
  2105	static int emac_ndo_bpf(struct net_device *ndev, struct netdev_bpf *bpf)
> 2106	{
  2107		struct prueth_emac *emac = netdev_priv(ndev);
  2108	
  2109		switch (bpf->command) {
  2110		case XDP_SETUP_PROG:
  2111			return emac_xdp_setup(emac, bpf);
  2112		default:
  2113			return -EINVAL;
  2114		}
  2115	}
  2116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
