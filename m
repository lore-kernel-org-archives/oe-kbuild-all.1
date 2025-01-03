Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0EB43173
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 02:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735870312; cv=none; b=cCKUuZm57JbstTWD2Ux8mjicJCxKD/D6C7lq3vVXcE6rVs09IBQBfNvNI/Y5ycNs8039XpJ+Rc9+hZt5I0wC+1j7yM0Drt50U6U8bQR8KL78gPuPJKzlIeZvtANOqPDwQHSJOQTlqbzJ9b5m24LL8kMLQ/73tcek+uR6N44DfM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735870312; c=relaxed/simple;
	bh=IuLwKFcusNSOFFXrkyzunaRbYTjqPoWIFRUAA5kfR8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMfxLyv00Dlmx18SUAY7+/tJlO4GbN9Awj9xiuxX5ueJUGFc8rx0mmcG2RUWjhhBJpwszM2a5krlM9w0aEoHhmxw3N2srJUtD+ZEHaxcYaEPu0gMN71SZ4Rp4/n37axZsZxj5z8O93VgEpkknrreNxGby2w2v8puWR+znGzEtrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hmtn9GsZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hmtn9GsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735870311; x=1767406311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IuLwKFcusNSOFFXrkyzunaRbYTjqPoWIFRUAA5kfR8o=;
  b=Hmtn9GsZiHPeADBLokRg0poTc2I8CnaW6A0qoIGJFn1tjV75uuGSzczv
   AkSZeVZ5N4h03nEiAmmfAYfDTSVaF6RcVLzYSDj+9x20ZAq7AB3ZtcEph
   xVpep/C0RHCDTR2OjWbSYYeAbPM74lpJY4LgzHqaHeAt+Wq+4NHbE0kqW
   q3o+EEifqForh2qU9UwAuPi2V5pBMCa2loqEuzz0acUq5hSv6UHgZt0M+
   P2rBOkmPJYt58sUcIY7/eOsIIeEfRZUBotJUeQTNpY9x8RGAswZj4+Obf
   GO1M5VfxxEa29l2VvpYkKxbQWfuZuUPusW3q9UkVl6E6I91vOT8R4GYNw
   w==;
X-CSE-ConnectionGUID: yvp0klOjRDacddZZW9hEPA==
X-CSE-MsgGUID: HcURHnf7S5OKHzEu1cWlrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="46606585"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="46606585"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 18:11:49 -0800
X-CSE-ConnectionGUID: DSiPbWRSTae2NIc80Mu2LQ==
X-CSE-MsgGUID: 4c44VAO1QSillhYpC82EjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="132520913"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jan 2025 18:11:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTXA9-00094e-0j;
	Fri, 03 Jan 2025 02:11:45 +0000
Date: Fri, 3 Jan 2025 10:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: net/8021q/vlan.c:238:46: warning: '%.4i' directive output may be
 truncated writing between 4 and 5 bytes into a region of size between 0 and
 15
Message-ID: <202501031059.OHdpp0W8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: c269a24ce057abfc31130960e96ab197ef6ab196 net: make free_netdev() more lenient with unregistering devices
date:   4 years ago
config: alpha-randconfig-r026-20211101 (https://download.01.org/0day-ci/archive/20250103/202501031059.OHdpp0W8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031059.OHdpp0W8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031059.OHdpp0W8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/8021q/vlan.c: In function 'vlan_ioctl_handler':
   net/8021q/vlan.c:250:46: warning: '%i' directive output may be truncated writing between 1 and 5 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     250 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                              ^~
   In function 'register_vlan_device',
       inlined from 'vlan_ioctl_handler' at net/8021q/vlan.c:625:9:
   net/8021q/vlan.c:250:42: note: directive argument in the range [0, 65535]
     250 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                          ^~~~~~~
   net/8021q/vlan.c:250:17: note: 'snprintf' output between 3 and 22 bytes into a destination of size 16
     250 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan.c: In function 'vlan_ioctl_handler':
>> net/8021q/vlan.c:238:46: warning: '%.4i' directive output may be truncated writing between 4 and 5 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     238 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                              ^~~~
   In function 'register_vlan_device',
       inlined from 'vlan_ioctl_handler' at net/8021q/vlan.c:625:9:
   net/8021q/vlan.c:238:42: note: directive argument in the range [0, 65535]
     238 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                          ^~~~~~~~~
   net/8021q/vlan.c:238:17: note: 'snprintf' output between 6 and 22 bytes into a destination of size 16
     238 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +238 net/8021q/vlan.c

e89fe42cd03c8f Patrick McHardy   2007-06-13  213  
c1d3ee9925ca71 Patrick McHardy   2007-06-13  214  /*  Attach a VLAN device to a mac address (ie Ethernet Card).
2ae0bf69b716d0 Patrick McHardy   2007-06-13  215   *  Returns 0 if the device was created or a negative error code otherwise.
c1d3ee9925ca71 Patrick McHardy   2007-06-13  216   */
9bb8582efb5555 Patrick McHardy   2008-07-08  217  static int register_vlan_device(struct net_device *real_dev, u16 vlan_id)
c1d3ee9925ca71 Patrick McHardy   2007-06-13  218  {
c1d3ee9925ca71 Patrick McHardy   2007-06-13  219  	struct net_device *new_dev;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  220  	struct vlan_dev_priv *vlan;
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  221  	struct net *net = dev_net(real_dev);
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  222  	struct vlan_net *vn = net_generic(net, vlan_net_id);
c1d3ee9925ca71 Patrick McHardy   2007-06-13  223  	char name[IFNAMSIZ];
2ae0bf69b716d0 Patrick McHardy   2007-06-13  224  	int err;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  225  
9bb8582efb5555 Patrick McHardy   2008-07-08  226  	if (vlan_id >= VLAN_VID_MASK)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  227  		return -ERANGE;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  228  
33fa382324ebd1 David Ahern       2018-05-17  229  	err = vlan_check_real_dev(real_dev, htons(ETH_P_8021Q), vlan_id,
33fa382324ebd1 David Ahern       2018-05-17  230  				  NULL);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  231  	if (err < 0)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  232  		return err;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  233  
^1da177e4c3f41 Linus Torvalds    2005-04-16  234  	/* Gotta set up the fields for the device. */
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  235  	switch (vn->name_type) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  236  	case VLAN_NAME_TYPE_RAW_PLUS_VID:
^1da177e4c3f41 Linus Torvalds    2005-04-16  237  		/* name will look like:	 eth1.0005 */
9bb8582efb5555 Patrick McHardy   2008-07-08 @238  		snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  239  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  240  	case VLAN_NAME_TYPE_PLUS_VID_NO_PAD:
^1da177e4c3f41 Linus Torvalds    2005-04-16  241  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  		 * Name will look like:	 vlan5
^1da177e4c3f41 Linus Torvalds    2005-04-16  243  		 */
9bb8582efb5555 Patrick McHardy   2008-07-08  244  		snprintf(name, IFNAMSIZ, "vlan%i", vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  245  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  246  	case VLAN_NAME_TYPE_RAW_PLUS_VID_NO_PAD:
^1da177e4c3f41 Linus Torvalds    2005-04-16  247  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  248  		 * Name will look like:	 eth0.5
^1da177e4c3f41 Linus Torvalds    2005-04-16  249  		 */
9bb8582efb5555 Patrick McHardy   2008-07-08  250  		snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  251  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  252  	case VLAN_NAME_TYPE_PLUS_VID:
^1da177e4c3f41 Linus Torvalds    2005-04-16  253  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  254  		 * Name will look like:	 vlan0005
^1da177e4c3f41 Linus Torvalds    2005-04-16  255  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  256  	default:
9bb8582efb5555 Patrick McHardy   2008-07-08  257  		snprintf(name, IFNAMSIZ, "vlan%.4i", vlan_id);
3ff50b7997fe06 Stephen Hemminger 2007-04-20  258  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  259  
c835a677331495 Tom Gundersen     2014-07-14  260  	new_dev = alloc_netdev(sizeof(struct vlan_dev_priv), name,
c835a677331495 Tom Gundersen     2014-07-14  261  			       NET_NAME_UNKNOWN, vlan_setup);
5dd8d1e9eb8b51 Arjan van de Ven  2006-07-03  262  
^1da177e4c3f41 Linus Torvalds    2005-04-16  263  	if (new_dev == NULL)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  264  		return -ENOBUFS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  265  
65d292a2ef2df6 Pavel Emelyanov   2008-04-16  266  	dev_net_set(new_dev, net);
^1da177e4c3f41 Linus Torvalds    2005-04-16  267  	/* need 4 bytes for extra VLAN header info,
^1da177e4c3f41 Linus Torvalds    2005-04-16  268  	 * hope the underlying device can handle it.
^1da177e4c3f41 Linus Torvalds    2005-04-16  269  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  270  	new_dev->mtu = real_dev->mtu;
^1da177e4c3f41 Linus Torvalds    2005-04-16  271  
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  272  	vlan = vlan_dev_priv(new_dev);
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  273  	vlan->vlan_proto = htons(ETH_P_8021Q);
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  274  	vlan->vlan_id = vlan_id;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  275  	vlan->real_dev = real_dev;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  276  	vlan->dent = NULL;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  277  	vlan->flags = VLAN_FLAG_REORDER_HDR;
^1da177e4c3f41 Linus Torvalds    2005-04-16  278  
07b5b17e157b70 Patrick McHardy   2007-06-13  279  	new_dev->rtnl_link_ops = &vlan_link_ops;
42ab19ee902929 David Ahern       2017-10-04  280  	err = register_vlan_dev(new_dev, NULL);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  281  	if (err < 0)
42429aaee5eb44 Patrick McHardy   2007-06-13  282  		goto out_free_newdev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  283  
2ae0bf69b716d0 Patrick McHardy   2007-06-13  284  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  285  
^1da177e4c3f41 Linus Torvalds    2005-04-16  286  out_free_newdev:
^1da177e4c3f41 Linus Torvalds    2005-04-16  287  	free_netdev(new_dev);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  288  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  289  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  290  

:::::: The code at line 238 was first introduced by commit
:::::: 9bb8582efb555521c7eec595ebd34e835ddc34b8 vlan: TCI related type and naming cleanups

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
