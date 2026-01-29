Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A0A37F74C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680371; cv=none; b=Ns+DF4jGwEHZzuz5LrQN4Hzu5X9ZWoRNXtw0H6Hd+M1o8lrtyKVeDg2UyreEqFfUTea8Aee5Z7kmY+b/T2n6YAivlnm4MFFlo/yjw63io0iUlOnuZY+7HangcSy6BNZ0vOUOCLdCQCe+rdscman5JqYE7oQ/BIeDU8n7pfmJKkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680371; c=relaxed/simple;
	bh=5e0YQDo5od0Cy0Xl/FAAlWeYDVauvAtd17Is12AQ+xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOBT9QIgC7yM8hKy7JUnpUTubq51pKZ6Nrbn1BumAPEP2qjL/Fj5/bl+zpvmdO4E8PfR5lzfY/5Thp1EFjyK4KY5sJDsmvTQ2wSbiLJ8e8ZiqDIHUZrrVU6oh3UKP7YjqTLhkyfXYtoasaJZK5pjOCQIPz8mcvnvsYNQl4jdrYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkcCmKst; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkcCmKst"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769680369; x=1801216369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5e0YQDo5od0Cy0Xl/FAAlWeYDVauvAtd17Is12AQ+xs=;
  b=SkcCmKstF6+ObtVuB3quPoRCG6iF3SX8LwNS4NXhJ81J8zL/V6+0IwNd
   9ZYqYYVWfR2YsxckkAA1Jy0D546B9vRNo8kHihDBvDB67uEBgysbzImDH
   ATkBMdCS++Mon0jevVwJbDWnvmbjbxlIfEC54Y9GRWNxkefyJYOsRQhWy
   pL2SYxVcOL7QhMWcGRonQlPVcUbZBqdggJqMV7u3MDnI+SV2lgR2w9jnL
   XVBZ3MdajLgi9+7y2chMlDyxUR57LayMXLCQI9eNLNoNh2YgUnakwPNMm
   ko+ZJrlEnS30tp1PG9UXB/5goE5NTLezP6IjLbzIDCMXFCMa44GM+sS9o
   A==;
X-CSE-ConnectionGUID: pgESPC8xQA+lXWReCA4HaQ==
X-CSE-MsgGUID: BlGBREl1SV2J0vEfd8/WsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70109452"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70109452"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 01:52:48 -0800
X-CSE-ConnectionGUID: SIqb1MJWTBSCAW9wgMAZBQ==
X-CSE-MsgGUID: ERqmvZfJSsGT6y0Xbi5g/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="207775245"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jan 2026 01:52:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlOhg-00000000bL8-3nNC;
	Thu, 29 Jan 2026 09:52:44 +0000
Date: Thu, 29 Jan 2026 17:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC
 address across unconditional reset
Message-ID: <202601291755.GWRFP8Fz-lkp@intel.com>
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/net-stmmac-Preserve-bootloader-MAC-address-across-unconditional-reset/20260127-012707
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260126172503.238724-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC address across unconditional reset
config: xtensa-randconfig-001-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291755.GWRFP8Fz-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291755.GWRFP8Fz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291755.GWRFP8Fz-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/net/ethernet/stmicro/stmmac/stmmac_main.o: in function `__vlan_hwaccel_push_inside':
>> include/linux/skbuff.h:4559: undefined reference to `stmmac_bus_clks_config'
   xtensa-linux-ld: drivers/net/ethernet/stmicro/stmmac/stmmac_main.o: in function `__vlan_hwaccel_push_inside':
>> include/linux/if_vlan.h:527: undefined reference to `stmmac_bus_clks_config'
   xtensa-linux-ld: drivers/net/ethernet/stmicro/stmmac/stmmac_main.o: in function `stmmac_has_ip_ethertype':
   include/linux/skbuff.h:4300: undefined reference to `stmmac_bus_clks_config'


vim +4559 include/linux/skbuff.h

de8f3a83b0a0fd Daniel Borkmann 2017-09-25  4556  
de8f3a83b0a0fd Daniel Borkmann 2017-09-25  4557  static inline void skb_metadata_set(struct sk_buff *skb, u8 meta_len)
de8f3a83b0a0fd Daniel Borkmann 2017-09-25  4558  {
de8f3a83b0a0fd Daniel Borkmann 2017-09-25 @4559  	skb_shinfo(skb)->meta_len = meta_len;
de8f3a83b0a0fd Daniel Borkmann 2017-09-25  4560  }
de8f3a83b0a0fd Daniel Borkmann 2017-09-25  4561  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
