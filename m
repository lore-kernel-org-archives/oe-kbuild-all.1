Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D993090CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155602; cv=none; b=FNtIy1IUAotTzKAtJm6XNfiyAB0SnRLOrHM9Z+VRCOOVrUgkXpG6vSrcWMxuc9s+trgg4wTpjh68uN1fCpLnrVrGFECxUuUoJtrRMF7gZtEsRo+g5u6q+bPyf95aYkD6yUna+oNdm2u+GycqCpoZaQY/4ScX1vm96+Xb0mpJMKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155602; c=relaxed/simple;
	bh=HcwXFR0BZU04L0TE60XkSDcUfw0nCPDh63QT4nmIVHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/UblSAlzfzjjqzoad1GgMr8lTYwx0NtpU21KvkGI9Y7o5LciooTi28gJq18J18kzDT5u533LJsyGDqj10I6L0wd/VOwWtE4KJXgtIgf+4s9YLLIapI9ZBnWi9GQOvANssftG4060zc+D31sG/x95gJ8DCVxKoeN0ryrFIFwbO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjiLlalT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjiLlalT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773155602; x=1804691602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HcwXFR0BZU04L0TE60XkSDcUfw0nCPDh63QT4nmIVHA=;
  b=gjiLlalT/boxA3+sgACovCj3oarpVSf9b7Tunn0coeHuFWck+5soiG3C
   j2EdABDLHiIEmcmhLx2gcI+4HrSPIkuJWoz9eSa1fGDRWKRipQP6+FbtX
   lrvkGrFSQGNSnsNYovpfyttk+ZYt17eRzhvlanhm+Oi8tFmkNz5Bz92jg
   WULCkX1aUnVT3NOevanOYC+5dwaMwZzDcoDX9qKu/WYN1SOT6vj4tGqjv
   lx0HaaLAVH5ca+SYCEy62vYQ9ANoezwyZdB6dw6omIQdC7BWKGbyCh1TM
   Hl3JRWeh9xsDKoKYki6H1+keIekCe4SBj1rBte/ItlWoEOLyt+jYVsBLW
   Q==;
X-CSE-ConnectionGUID: f3cbb9zyRaOvUG6cDyde1g==
X-CSE-MsgGUID: DK532LTeRTy05qnpwQIOTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73905997"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="73905997"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 08:13:18 -0700
X-CSE-ConnectionGUID: cs0c6UAnT/afM9ucvlIxLA==
X-CSE-MsgGUID: 1H3Lok8/QfmhajCA3HQBiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220327038"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Mar 2026 08:13:13 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzylh-0000000027E-3rVa;
	Tue, 10 Mar 2026 15:13:09 +0000
Date: Tue, 10 Mar 2026 23:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Frank Wunderlich <frankwu@gmx.de>, Chad Monroe <chad@monroe.io>,
	Cezary Wilmanski <cezary.wilmanski@adtran.com>,
	Liang Xu <lxu@maxlinear.com>,
	"Benny (Ying-Tsan) Weng" <yweng@maxlinear.com>,
	Jose Maria Verdu Munoz <jverdu@maxlinear.com>,
	Avinash Jayaraman <ajayaraman@maxlinear.com>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH net-next v2 2/2] net: dsa: mxl862xx: implement bridge
 offloading
Message-ID: <202603102342.ymeQ8hLm-lkp@intel.com>
References: <f6fb8c9c6d38585c0efce72b3d1aebe923277d5a.1773102942.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6fb8c9c6d38585c0efce72b3d1aebe923277d5a.1773102942.git.daniel@makrotopia.org>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/dsa-tag_mxl862xx-set-dsa_default_offload_fwd_mark/20260310-084425
base:   net-next/main
patch link:    https://lore.kernel.org/r/f6fb8c9c6d38585c0efce72b3d1aebe923277d5a.1773102942.git.daniel%40makrotopia.org
patch subject: [PATCH net-next v2 2/2] net: dsa: mxl862xx: implement bridge offloading
config: sh-randconfig-001-20260310 (https://download.01.org/0day-ci/archive/20260310/202603102342.ymeQ8hLm-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603102342.ymeQ8hLm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603102342.ymeQ8hLm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/mxl862xx/mxl862xx.c: In function 'mxl862xx_port_fdb_add':
>> drivers/net/dsa/mxl862xx/mxl862xx.c:655:9: error: implicit declaration of function 'ether_addr_copy'; did you mean 'inetpeer_addr_cmp'? [-Wimplicit-function-declaration]
     655 |         ether_addr_copy(param.mac, addr);
         |         ^~~~~~~~~~~~~~~
         |         inetpeer_addr_cmp


vim +655 drivers/net/dsa/mxl862xx/mxl862xx.c

   640	
   641	static int mxl862xx_port_fdb_add(struct dsa_switch *ds, int port,
   642					 const unsigned char *addr, u16 vid, struct dsa_db db)
   643	{
   644		struct mxl862xx_mac_table_add param = { };
   645		int fid = mxl862xx_get_fid(ds, db), ret;
   646		struct mxl862xx_priv *priv = ds->priv;
   647	
   648		if (fid < 0)
   649			return fid;
   650	
   651		param.port_id = cpu_to_le32(port);
   652		param.static_entry = true;
   653		param.fid = cpu_to_le16(fid);
   654		param.tci = cpu_to_le16(FIELD_PREP(MXL862XX_TCI_VLAN_ID, vid));
 > 655		ether_addr_copy(param.mac, addr);
   656	
   657		ret = MXL862XX_API_WRITE(priv, MXL862XX_MAC_TABLEENTRYADD, param);
   658		if (ret)
   659			dev_err(ds->dev, "failed to add FDB entry on port %d\n", port);
   660	
   661		return ret;
   662	}
   663	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
