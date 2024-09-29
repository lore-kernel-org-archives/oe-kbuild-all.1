Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3169A8F6D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 19:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727639516; cv=none; b=g7vxwmo8MPqmnDptTpFtVGWMaeDcqIcaAE9oBNF+o8U/zQxMDJqVtaKwsMTqipPcwVDxquuIhH7vm8P/a00lAbO3YW8Ucsk56++p5cYdJnKOzkJ3ZetfmpLXDItufGD/EgWq7hTVcmbUWG5Ko7QwNwrE0oDv7PzEh4pSnTUg+6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727639516; c=relaxed/simple;
	bh=lOc/iVdY2Tj77rNzxXPc2Jvg1XW4Z9VTdwy1ieRrkAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j478PNtVkKzyFRII/Sxqo8dgUe+XInkY7z60IuUZpM89md0/anvzyrAB32tqwEKSuI3oilgxE/UiodxTgnEIhTIalPxSKsxxdTfsxSdxvt6EAim4pvljNIGMQxiwuCbq1QdaYjxLbJ0l2Ui8qCZWI9Zv5gNWBEpKt4w/dSbX1VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVbLP+JM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVbLP+JM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727639514; x=1759175514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lOc/iVdY2Tj77rNzxXPc2Jvg1XW4Z9VTdwy1ieRrkAk=;
  b=mVbLP+JMwE8yIFN3aIrryQn+7aXVvhuuIh1ayOOlENgwEYr3GibFcC1m
   IiqtpzD++a3SnP3/1z+sboR5y5MIzABM0BkoSD9MgxwqvjwVmDK4mAfgp
   QuLTY+nUyBy4t/dvVKUrzdaVNGYOjRB/bwzxZ1yBKtYCxQ6PnmI05XZp8
   xXhRpj78lj0wAbKalbqLLpsoZLyBC3pt9f7PF2rAvOwZJNH5MI2hYcXCl
   SQwEBJ/MjslIFAsI5Fkl+xfkh/7EPTUwRb/QRvBoyqrLVKOGDJpFYmYJv
   EMzKIq/c2VW7ZLw7xYGFTs3WDIeb+C8sSmp2tww59dTCfyhGBFUdrXYSf
   g==;
X-CSE-ConnectionGUID: XFi9Z3RmRIS6Q7RLNALobQ==
X-CSE-MsgGUID: y0c2MN1uTmyQA7rLaIuJ5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37395236"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="37395236"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 12:51:51 -0700
X-CSE-ConnectionGUID: tUsm3VeGQbWGBt/jFEmwmQ==
X-CSE-MsgGUID: Q4hF9opdQ4uk4h5k9fK8Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="78030605"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Sep 2024 12:51:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suzxM-000Oe7-12;
	Sun, 29 Sep 2024 19:51:48 +0000
Date: Mon, 30 Sep 2024 03:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Duanqiang Wen <duanqiangwen@net-swift.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 13419/30000]
 drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2658:30: warning: unused
 variable 'adapter'
Message-ID: <202409300306.EInsH8lZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0988d5e5eb47d35a2babb4c0d6b6b81aa0fccbd3
commit: a5961b4bc6ce09a70902686ecc848a47493a9251 [13419/30000] openeuler: net: ngbe: add ngbe module support
config: x86_64-randconfig-015-20240929 (https://download.01.org/0day-ci/archive/20240930/202409300306.EInsH8lZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300306.EInsH8lZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300306.EInsH8lZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_main.c:23:
   drivers/net/ethernet/netswift/ngbe/ngbe.h: In function 'ngbe_misc_isb':
   drivers/net/ethernet/netswift/ngbe/ngbe.h:741:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     741 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: At top level:
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:139:6: warning: no previous prototype for 'ngbe_service_event_schedule' [-Wmissing-prototypes]
     139 | void ngbe_service_event_schedule(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: In function 'ngbe_tx_timeout':
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:401:14: warning: variable 'real_tx_hang' set but not used [-Wunused-but-set-variable]
     401 |         bool real_tx_hang = false;
         |              ^~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: In function 'ngbe_addr_list_itr':
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2658:30: warning: unused variable 'adapter' [-Wunused-variable]
    2658 |         struct ngbe_adapter *adapter = hw->back;
         |                              ^~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: At top level:
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3159:6: warning: no previous prototype for 'ngbe_configure_isb' [-Wmissing-prototypes]
    3159 | void ngbe_configure_isb(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3173:6: warning: no previous prototype for 'ngbe_configure_port' [-Wmissing-prototypes]
    3173 | void ngbe_configure_port(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3529:6: warning: no previous prototype for 'ngbe_disable_device' [-Wmissing-prototypes]
    3529 | void ngbe_disable_device(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3644:5: warning: no previous prototype for 'ngbe_init_shared_code' [-Wmissing-prototypes]
    3644 | s32 ngbe_init_shared_code(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5791:5: warning: no previous prototype for 'ngbe_skb_pad_nonzero' [-Wmissing-prototypes]
    5791 | int ngbe_skb_pad_nonzero(struct sk_buff *skb, int pad)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: In function 'ngbe_mii_ioctl':
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5989:20: warning: variable 'devad' set but not used [-Wunused-but-set-variable]
    5989 |         int prtad, devad, ret = 0;
         |                    ^~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5989:13: warning: variable 'prtad' set but not used [-Wunused-but-set-variable]
    5989 |         int prtad, devad, ret = 0;
         |             ^~~~~


vim +/adapter +2658 drivers/net/ethernet/netswift/ngbe/ngbe_main.c

  2652	
  2653	static u8 *ngbe_addr_list_itr(struct ngbe_hw *hw,
  2654				       u8 **mc_addr_ptr, u32 *vmdq)
  2655	{
  2656		struct netdev_hw_addr *mc_ptr;
  2657		u8 *addr = *mc_addr_ptr;
> 2658		struct ngbe_adapter *adapter = hw->back;
  2659	
  2660		/* VMDQ_P implicitely uses the adapter struct when CONFIG_PCI_IOV is
  2661		 * defined, so we have to wrap the pointer above correctly to prevent
  2662		 * a warning.
  2663		 */
  2664		*vmdq = VMDQ_P(0);
  2665	
  2666		mc_ptr = container_of(addr, struct netdev_hw_addr, addr[0]);
  2667		if (mc_ptr->list.next) {
  2668			struct netdev_hw_addr *ha;
  2669	
  2670			ha = list_entry(mc_ptr->list.next, struct netdev_hw_addr, list);
  2671			*mc_addr_ptr = ha->addr;
  2672		} else {
  2673			*mc_addr_ptr = NULL;
  2674		}
  2675	
  2676		return addr;
  2677	}
  2678	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
