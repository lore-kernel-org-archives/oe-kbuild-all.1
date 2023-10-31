Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E8029CE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 23:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJg2MxXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698796385; x=1730332385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLtv+B5XMSR1KQ3893n0b7sapa1FncyDSogdPKtUPtk=;
  b=oJg2MxXkOnv+FGyy8TKdb6OumEg7hVdepniN//thwVLo741oc4W7+HU4
   zpKpH6J7PCdhGju6TwFlI8XUGsTqYRpmxZFAFmViNgQcw5URdySdObtXK
   huPJjtnGfR2/Do+sueoe7EaZlP6qhIs6p2naE47QZ8Zp56XSOzmo71Yd1
   SIfZ1UNQhgP7jbK/KmHeC3M7N8Pv2Kv026kJC8TF04ojAPlzCiLZEaEIc
   ioMMNCiTXRHV9in1NiQi63k8G2xWVmyxYOsMVO3cFJkY68n0JRAJASHvZ
   FBAlZ0r6zkPxXiByOMciLDPDyCiqX1qBVQybNVbBxcVKI0Iown2V90Hhj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="419516375"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="419516375"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 16:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1092168371"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="1092168371"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 Oct 2023 16:53:03 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxyXd-0000T2-0B;
	Tue, 31 Oct 2023 23:53:01 +0000
Date: Wed, 1 Nov 2023 07:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_clear_tmp1 39/46]
 drivers/net/ethernet/rocker/rocker_ofdpa.c:2246:8: error: use of undeclared
 label 'found'
Message-ID: <202311010733.5hB1cUtH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_clear_tmp1
head:   62bfd93b1d4bc92cd171973923c45a2b011f1c5c
commit: a14c9e467cd8a8b101ae6d03bbe974b878087292 [39/46] ethernet: rocker: optimize ofdpa_port_internal_vlan_id_get()
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231101/202311010733.5hB1cUtH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010733.5hB1cUtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010733.5hB1cUtH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/rocker/rocker_ofdpa.c:2246:8: error: use of undeclared label 'found'
    2246 |                 goto found;
         |                      ^
   1 error generated.


vim +/found +2246 drivers/net/ethernet/rocker/rocker_ofdpa.c

3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2225  
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2226  static __be16 ofdpa_port_internal_vlan_id_get(struct ofdpa_port *ofdpa_port,
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2227  					      int ifindex)
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2228  {
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2229  	struct ofdpa *ofdpa = ofdpa_port->ofdpa;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2230  	struct ofdpa_internal_vlan_tbl_entry *entry;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2231  	struct ofdpa_internal_vlan_tbl_entry *found;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2232  	unsigned long lock_flags;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2233  	int i;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2234  
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2235  	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2236  	if (!entry)
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2237  		return 0;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2238  
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2239  	entry->ifindex = ifindex;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2240  
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2241  	spin_lock_irqsave(&ofdpa->internal_vlan_tbl_lock, lock_flags);
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2242  
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2243  	found = ofdpa_internal_vlan_tbl_find(ofdpa, ifindex);
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2244  	if (found) {
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2245  		kfree(entry);
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16 @2246  		goto found;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2247  	}
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2248  
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2249  	found = entry;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2250  	hash_add(ofdpa->internal_vlan_tbl, &found->entry, found->ifindex);
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2251  
a14c9e467cd8a8 Yury Norov 2023-10-21  2252  	i = find_and_set_bit(ofdpa->internal_vlan_bitmap, OFDPA_N_INTERNAL_VLANS);
a14c9e467cd8a8 Yury Norov 2023-10-21  2253  	if (i < OFDPA_N_INTERNAL_VLANS)
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2254  		found->vlan_id = htons(OFDPA_INTERNAL_VLAN_ID_BASE + i);
a14c9e467cd8a8 Yury Norov 2023-10-21  2255  	else
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2256  		netdev_err(ofdpa_port->dev, "Out of internal VLAN IDs\n");
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2257  
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2258  	found->ref_count++;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2259  	spin_unlock_irqrestore(&ofdpa->internal_vlan_tbl_lock, lock_flags);
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2260  
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2261  	return found->vlan_id;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2262  }
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  2263  

:::::: The code at line 2246 was first introduced by commit
:::::: 3fbcdbf3f1cbe86fc11856ec268470d7d7bd459b rocker: move OF-DPA stuff into separate file

:::::: TO: Jiri Pirko <jiri@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
