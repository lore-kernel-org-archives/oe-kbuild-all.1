Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CE0524D0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POIsoRT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700573935; x=1732109935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSzyROW+eg8j5VdX5osOYn/JezMBvb/pBdbyg2NLhRo=;
  b=POIsoRT8LzD2cIDmK2KzOfHqjQwUVaGlIJ3d/za7PmxPYCjI8z5zbczn
   0xa6vAtVLGlg1aBpcJpslT3l0lu5cLfCNkw5Yx8oAifsW/fx/be+nf2JD
   R64Ph2m3ySpyKoxA8DwFLLQSOKIA//fP5g+oETDx5erasb+dybVYx6+P5
   Cisigvxsl4+WGtV4vz5no4rbEwgGqdeePaRJRB4gFKK/hUJ5N6ywGiLL7
   mY+mXYhaGmGj6M0nvrPr+DCeajo7XWxvU2vVMannRJ/Xo7eIHJ/gip4dJ
   424cY9EWXkPeHAY9OGa9/upA86q2k+Iz6xbsAU2t64oqLOuwEJ2zUx3ir
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="390696966"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="390696966"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 05:38:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="766650343"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="766650343"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Nov 2023 05:38:18 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5QxD-0007ph-10;
	Tue, 21 Nov 2023 13:38:15 +0000
Date: Tue, 21 Nov 2023 21:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Foley <pefoley2@pefoley.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: arch/um/drivers/pcap_kern.c:18:6: sparse: sparse: symbol
 'pcap_init_kern' was not declared. Should it be static?
Message-ID: <202311212152.kqZWYPEr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: 2c4d3841a82b88ae8a7b518dc6206f84f68e705a um: Avoid pcap multiple definition errors
date:   9 months ago
config: um-randconfig-r133-20231121 (https://download.01.org/0day-ci/archive/20231121/202311212152.kqZWYPEr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311212152.kqZWYPEr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311212152.kqZWYPEr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/um/drivers/pcap_kern.c:18:6: sparse: sparse: symbol 'pcap_init_kern' was not declared. Should it be static?
   arch/um/drivers/pcap_kern.c:53:5: sparse: sparse: symbol 'pcap_setup' was not declared. Should it be static?

vim +/pcap_init_kern +18 arch/um/drivers/pcap_kern.c

    17	
  > 18	void pcap_init_kern(struct net_device *dev, void *data)
    19	{
    20		struct uml_net_private *pri;
    21		struct pcap_data *ppri;
    22		struct pcap_init *init = data;
    23	
    24		pri = netdev_priv(dev);
    25		ppri = (struct pcap_data *) pri->user;
    26		ppri->host_if = init->host_if;
    27		ppri->promisc = init->promisc;
    28		ppri->optimize = init->optimize;
    29		ppri->filter = init->filter;
    30	
    31		printk("pcap backend, host interface %s\n", ppri->host_if);
    32	}
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
