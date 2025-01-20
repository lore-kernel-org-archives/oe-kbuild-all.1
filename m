Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CCE191489
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366052; cv=none; b=Hf6WuvQccqPhQ0qsDKBqbN/KiOuY74bQmsetVLQfO5743faIplOjW2VNtX7v99CJrH/P//PN3DZ/1etqM4R0e8nSm9bnChOA9fUT7d06yCQL6wuvKnCjAFQ2s+HMenmThmuO7re5lHFozJ/49KnF07ylYpJnvpHYdk+7EnPByA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366052; c=relaxed/simple;
	bh=0kuBZY0EonnimpspWaoT0ucAPv464OPSutZ6au1FKG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KvY4zWPwPjLYHtZwom3bK7L/kdsugCKz+xAa3KE0kLC6gGz8HNZ2HAZ2rlfwqXaRc+CmXywe4C/Tfwqs97PWUsfgv77KJZVzUEsNdA3iTCSxk6DVAyF60ZbYOoYktQ7aGeljzYSW2/88hbCxw+Jci2E6RU7osaL+xEekJkT9Arw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrekLvK6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrekLvK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737366050; x=1768902050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0kuBZY0EonnimpspWaoT0ucAPv464OPSutZ6au1FKG8=;
  b=jrekLvK6ZC6NrmdT/AD1JaMlpiD9rKqhKqkWq8PQuU4m+NrplSiiYzDp
   G0YaIfOZ3ddwMKPU/XsY9v0WSOU8YgrMxmsVnuhVRiK2Y8U5G8R3CWaVA
   y7uwNCH9L1AWTUr5CN5GmdIzDTSv184GGbY7SzpPs3mw4N+/JXuV2Wbto
   e3OL625Hq+0v/ZxInLGL9Nwi+s/nKsyiq2jFsSGCH9VfKPkF0L0755B6D
   7wqZT1Uiulnj4gnrqXMjCDILEEqwXSJQuN0s24dVB9WuhgP1iWbkAB6bo
   5whOOOXf8F57tUKP688cEx1S3iR2cyjwxeX0dlQc/qxeI5Wew71Cukpjz
   Q==;
X-CSE-ConnectionGUID: mJ6eGJS3RymD2neQdr7/Qg==
X-CSE-MsgGUID: Nv65ZEBBSzi+RE8SWBd4kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41668819"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="41668819"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 01:40:49 -0800
X-CSE-ConnectionGUID: itG9TvvCQW62FbMtF5WZ6w==
X-CSE-MsgGUID: SjjH3OMiSXe8h4UgPiIjLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106251004"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Jan 2025 01:40:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZoGz-000WPj-14;
	Mon, 20 Jan 2025 09:40:45 +0000
Date: Mon, 20 Jan 2025 17:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: net/8021q/vlan.c:241:46: warning: '%.4i' directive output may be
 truncated writing between 4 and 5 bytes into a region of size between 0 and
 15
Message-ID: <202501201730.uNIUmoe3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: 925da92ba5cb0c82d07cdd5049a07e40f54e9c44 rcu: Avoid unneeded function call in rcu_read_unlock()
date:   3 years, 4 months ago
config: sparc-randconfig-r122-20240116 (https://download.01.org/0day-ci/archive/20250120/202501201730.uNIUmoe3-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201730.uNIUmoe3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201730.uNIUmoe3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/8021q/vlan.c: In function 'vlan_ioctl_handler':
   net/8021q/vlan.c:253:46: warning: '%i' directive output may be truncated writing between 1 and 5 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                              ^~
   In function 'register_vlan_device',
       inlined from 'vlan_ioctl_handler' at net/8021q/vlan.c:628:9:
   net/8021q/vlan.c:253:42: note: directive argument in the range [0, 65535]
     253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                          ^~~~~~~
   net/8021q/vlan.c:253:17: note: 'snprintf' output between 3 and 22 bytes into a destination of size 16
     253 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan.c: In function 'vlan_ioctl_handler':
>> net/8021q/vlan.c:241:46: warning: '%.4i' directive output may be truncated writing between 4 and 5 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                              ^~~~
   In function 'register_vlan_device',
       inlined from 'vlan_ioctl_handler' at net/8021q/vlan.c:628:9:
   net/8021q/vlan.c:241:42: note: directive argument in the range [0, 65535]
     241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                          ^~~~~~~~~
   net/8021q/vlan.c:241:17: note: 'snprintf' output between 6 and 22 bytes into a destination of size 16
     241 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +241 net/8021q/vlan.c

e89fe42cd03c8f Patrick McHardy   2007-06-13  216  
c1d3ee9925ca71 Patrick McHardy   2007-06-13  217  /*  Attach a VLAN device to a mac address (ie Ethernet Card).
2ae0bf69b716d0 Patrick McHardy   2007-06-13  218   *  Returns 0 if the device was created or a negative error code otherwise.
c1d3ee9925ca71 Patrick McHardy   2007-06-13  219   */
9bb8582efb5555 Patrick McHardy   2008-07-08  220  static int register_vlan_device(struct net_device *real_dev, u16 vlan_id)
c1d3ee9925ca71 Patrick McHardy   2007-06-13  221  {
c1d3ee9925ca71 Patrick McHardy   2007-06-13  222  	struct net_device *new_dev;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  223  	struct vlan_dev_priv *vlan;
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  224  	struct net *net = dev_net(real_dev);
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  225  	struct vlan_net *vn = net_generic(net, vlan_net_id);
c1d3ee9925ca71 Patrick McHardy   2007-06-13  226  	char name[IFNAMSIZ];
2ae0bf69b716d0 Patrick McHardy   2007-06-13  227  	int err;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  228  
9bb8582efb5555 Patrick McHardy   2008-07-08  229  	if (vlan_id >= VLAN_VID_MASK)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  230  		return -ERANGE;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  231  
33fa382324ebd1 David Ahern       2018-05-17  232  	err = vlan_check_real_dev(real_dev, htons(ETH_P_8021Q), vlan_id,
33fa382324ebd1 David Ahern       2018-05-17  233  				  NULL);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  234  	if (err < 0)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  235  		return err;
c1d3ee9925ca71 Patrick McHardy   2007-06-13  236  
^1da177e4c3f41 Linus Torvalds    2005-04-16  237  	/* Gotta set up the fields for the device. */
7a17a2f79f54a9 Pavel Emelyanov   2008-04-16  238  	switch (vn->name_type) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  239  	case VLAN_NAME_TYPE_RAW_PLUS_VID:
^1da177e4c3f41 Linus Torvalds    2005-04-16  240  		/* name will look like:	 eth1.0005 */
9bb8582efb5555 Patrick McHardy   2008-07-08 @241  		snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  243  	case VLAN_NAME_TYPE_PLUS_VID_NO_PAD:
^1da177e4c3f41 Linus Torvalds    2005-04-16  244  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  245  		 * Name will look like:	 vlan5
^1da177e4c3f41 Linus Torvalds    2005-04-16  246  		 */
9bb8582efb5555 Patrick McHardy   2008-07-08  247  		snprintf(name, IFNAMSIZ, "vlan%i", vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  248  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  249  	case VLAN_NAME_TYPE_RAW_PLUS_VID_NO_PAD:
^1da177e4c3f41 Linus Torvalds    2005-04-16  250  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  251  		 * Name will look like:	 eth0.5
^1da177e4c3f41 Linus Torvalds    2005-04-16  252  		 */
9bb8582efb5555 Patrick McHardy   2008-07-08  253  		snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  254  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  255  	case VLAN_NAME_TYPE_PLUS_VID:
^1da177e4c3f41 Linus Torvalds    2005-04-16  256  		/* Put our vlan.VID in the name.
^1da177e4c3f41 Linus Torvalds    2005-04-16  257  		 * Name will look like:	 vlan0005
^1da177e4c3f41 Linus Torvalds    2005-04-16  258  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  259  	default:
9bb8582efb5555 Patrick McHardy   2008-07-08  260  		snprintf(name, IFNAMSIZ, "vlan%.4i", vlan_id);
3ff50b7997fe06 Stephen Hemminger 2007-04-20  261  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  262  
c835a677331495 Tom Gundersen     2014-07-14  263  	new_dev = alloc_netdev(sizeof(struct vlan_dev_priv), name,
c835a677331495 Tom Gundersen     2014-07-14  264  			       NET_NAME_UNKNOWN, vlan_setup);
5dd8d1e9eb8b51 Arjan van de Ven  2006-07-03  265  
^1da177e4c3f41 Linus Torvalds    2005-04-16  266  	if (new_dev == NULL)
2ae0bf69b716d0 Patrick McHardy   2007-06-13  267  		return -ENOBUFS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  268  
65d292a2ef2df6 Pavel Emelyanov   2008-04-16  269  	dev_net_set(new_dev, net);
^1da177e4c3f41 Linus Torvalds    2005-04-16  270  	/* need 4 bytes for extra VLAN header info,
^1da177e4c3f41 Linus Torvalds    2005-04-16  271  	 * hope the underlying device can handle it.
^1da177e4c3f41 Linus Torvalds    2005-04-16  272  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  273  	new_dev->mtu = real_dev->mtu;
^1da177e4c3f41 Linus Torvalds    2005-04-16  274  
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  275  	vlan = vlan_dev_priv(new_dev);
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  276  	vlan->vlan_proto = htons(ETH_P_8021Q);
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  277  	vlan->vlan_id = vlan_id;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  278  	vlan->real_dev = real_dev;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  279  	vlan->dent = NULL;
0c0667a8548ef2 Wang Sheng-Hui    2013-08-03  280  	vlan->flags = VLAN_FLAG_REORDER_HDR;
^1da177e4c3f41 Linus Torvalds    2005-04-16  281  
07b5b17e157b70 Patrick McHardy   2007-06-13  282  	new_dev->rtnl_link_ops = &vlan_link_ops;
42ab19ee902929 David Ahern       2017-10-04  283  	err = register_vlan_dev(new_dev, NULL);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  284  	if (err < 0)
42429aaee5eb44 Patrick McHardy   2007-06-13  285  		goto out_free_newdev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  286  
2ae0bf69b716d0 Patrick McHardy   2007-06-13  287  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  288  
^1da177e4c3f41 Linus Torvalds    2005-04-16  289  out_free_newdev:
^1da177e4c3f41 Linus Torvalds    2005-04-16  290  	free_netdev(new_dev);
2ae0bf69b716d0 Patrick McHardy   2007-06-13  291  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  292  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  293  

:::::: The code at line 241 was first introduced by commit
:::::: 9bb8582efb555521c7eec595ebd34e835ddc34b8 vlan: TCI related type and naming cleanups

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
