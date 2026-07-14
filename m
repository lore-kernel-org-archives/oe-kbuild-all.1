Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3102B328B7F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 18:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053479; cv=none; b=cuqMQQhdTytsbAHcxcVbUS8PKKKrNWe5BcrLUORLBSuaNGdgZa2My0vE5Hnjq6YvyV2KM5++HkkrWA9rfEVSkFqUgnPEYkHTx7pCtQgeUVJpF3dq3jrMF+q7gf7BFQFOhFnYjv6aU3iAnrno0XUixSjj1hhHxhC8LaGRj/zuiW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053479; c=relaxed/simple;
	bh=mTeUQrJe1QuU3EIxl066EOZZb+GyGXwCuw5XZrn2CAg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JADiY764io8kJ+496hiTsAOS5h/4BbM+QUmb3tPYR2UXUOaIHBEbOLUvp4KTxas8j7kR7TKi44RiEvKPrExk/FL0QriagucJzVPRhuaEbKGJ3JohO/xtgEQwJijCPPGWPysFcMuTU+5rVa8s/9s72Pl7HIaaI6+MpU/7Iq7pICk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBifBRit; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBifBRit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784053476; x=1815589476;
  h=date:from:to:cc:subject:message-id;
  bh=mTeUQrJe1QuU3EIxl066EOZZb+GyGXwCuw5XZrn2CAg=;
  b=nBifBRitAMmk+OWbgx79PoFi9d89DSb73qVICUf+se80JXkJqX3eVeuQ
   iQpyazDuHJyShGY3RYedltS9YcZS7VJoYbChaBwwJ6I8wy660K/DnbPu0
   z28NERsYBjP+gC43nvT+REdqhNTVpu3jBLkK7Q0ndvW1412tGJlNxjtty
   KVuizR+qT6i1CPsBmXX518PbQYWTLfb2x1Igj2m0HbBvFXQzHOjT1ucj7
   oQWTCfQpumuqzyB6Flglz4LiN4GGTz9pStPsdbxUj3FZVVak/DSUkmOCW
   bXtFjzxx7BTOuiAF0WhaHpWTNkleICTt85a4sJYydUG+cUpKMTbjGLWZd
   g==;
X-CSE-ConnectionGUID: wgnPWTY5TOqGdSDaWFHFww==
X-CSE-MsgGUID: o03hNG6cQLufacaZfECmcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="107479137"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="107479137"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 11:24:34 -0700
X-CSE-ConnectionGUID: gIUOAx46Q365Tg+U8ZDfhA==
X-CSE-MsgGUID: KahPNSUCQ4GPKaIvrer1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="279216730"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jul 2026 11:24:33 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjhnz-0000000043P-1pZR;
	Tue, 14 Jul 2026 18:24:31 +0000
Date: Tue, 14 Jul 2026 20:23:48 +0200
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/linux/usb/usbnet.h:313:33: warning:
 'cdc_ether_ethtool_ops' defined but not used
Message-ID: <202607142001.FNZl5LGw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/net-usb-centralize-usbnet_cdc_zte_rx_fixup-in-usbnet/20260714-200029
head:   01c24668a6e35556ec573ceb5a3b709515946bc4
commit: be5b49f1b5e430f22aa334fd97bc86ef6c2374a0 net: usb: move exported symbols from cdc_ether to usbnet
date:   6 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260714/202607142001.FNZl5LGw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142001.FNZl5LGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142001.FNZl5LGw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/usb/asix.h:25,
                    from drivers/net/usb/asix_devices.c:10:
>> include/linux/usb/usbnet.h:313:33: warning: 'cdc_ether_ethtool_ops' defined but not used [-Wunused-const-variable=]
     313 | static const struct ethtool_ops cdc_ether_ethtool_ops = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/usb/usbnet.h:19:17: warning: 'mbm_guid' defined but not used [-Wunused-const-variable=]
      19 | static const u8 mbm_guid[16] = {
         |                 ^~~~~~~~


vim +/cdc_ether_ethtool_ops +313 include/linux/usb/usbnet.h

   311	
   312	/* We need to override usbnet_*_link_ksettings in bind() */
 > 313	static const struct ethtool_ops cdc_ether_ethtool_ops = {
   314		.get_link		= usbnet_get_link,
   315		.nway_reset		= usbnet_nway_reset,
   316		.get_drvinfo		= usbnet_get_drvinfo,
   317		.get_msglevel		= usbnet_get_msglevel,
   318		.set_msglevel		= usbnet_set_msglevel,
   319		.get_ts_info		= ethtool_op_get_ts_info,
   320		.get_link_ksettings	= usbnet_get_link_ksettings_internal,
   321		.set_link_ksettings	= NULL,
   322	};
   323	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
