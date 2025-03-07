Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF85167DAC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 02:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741313802; cv=none; b=dFiLvt/aNCtrDT/ILBy3a7dJGn9UJ7rJyZNk0SPcug4Yx5lGo+v8fkmqhpbXXncys4AL82TptX/OmvV53jWaccyoB5DDhXC9SnWLBm0uxnx6hATzBkFSv/jFOU0t0pw3CYsXGklr+SqgJfs62x7oPQzpE2W+XmcsgFgTzqYxfGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741313802; c=relaxed/simple;
	bh=cB4YRs23x6RuPuKAocIVL7EKY6hk5TV85DUOQ4A2jWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7VZ7Q5j1NQnP4oruh/QVPmYhkvUDOc+EnM32CMyY+l6FMvVTFMusNwx5trZ4x74D2DnuaF2ntgNErp03LIbXx3L9VksJHttz7Hu9+9CwcmHeyckq8cFnehAFsZ2YmSy+Qy6F/ESDijKLscjrxE/PjUkzya+/i2QjeMt1cWJXp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgPMGIlF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgPMGIlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741313801; x=1772849801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cB4YRs23x6RuPuKAocIVL7EKY6hk5TV85DUOQ4A2jWg=;
  b=kgPMGIlFHVhSmxItqHdrTpF03fo0hmAMpf+IUSGIdM8aVCb7FOctk6gv
   XuJQ1qH3dtRHjANEv6Y2QgbRRbQH+OiposEnMQgfP2KbAEjEXEUIiTRa3
   ceVz+Bo6LinwyEUqXgAYjTQDwJ9pOX0Kz1VSm6uBn846q59tWLzhy4vXO
   GuVALyLlu56J7+sO8FoW8tVDZN98yyYn4oIpjFg0l1dWiqDD7xi2eUM3c
   vwkxHgL6k18Hb1ymeb6vydimHryQH4ave8CgOHrynTj45DgQ0G5q+xKLO
   BqXj3++ej+VIhpg0aq9SZSwZzOdcgUcIKkjtTOMrEGaPg9htx4ITp46U9
   w==;
X-CSE-ConnectionGUID: Uw4KWjMuT9+sQMP48fBx1Q==
X-CSE-MsgGUID: h717rxKaQsepDBW8lBL1JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41603429"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="41603429"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 18:16:40 -0800
X-CSE-ConnectionGUID: yafWQQVfQQGHB7BjSuiD9w==
X-CSE-MsgGUID: nZngRlC0TE+GJS6rE4rQeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119715698"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2025 18:16:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqNGP-000Nw2-0A;
	Fri, 07 Mar 2025 02:16:37 +0000
Date: Fri, 7 Mar 2025 10:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 1/2] net: phylink: add functions to
 block/unblock rx clock stop
Message-ID: <202503070916.gDJMqkeF-lkp@intel.com>
References: <E1tpt2t-005UNB-MC@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tpt2t-005UNB-MC@rmk-PC.armlinux.org.uk>

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-phylink-add-functions-to-block-unblock-rx-clock-stop/20250306-060346
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1tpt2t-005UNB-MC%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 1/2] net: phylink: add functions to block/unblock rx clock stop
config: riscv-randconfig-001-20250307 (https://download.01.org/0day-ci/archive/20250307/202503070916.gDJMqkeF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070916.gDJMqkeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070916.gDJMqkeF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/phy/phylink.c: In function 'phylink_rx_clk_stop_block':
>> drivers/net/phy/phylink.c:2613:23: warning: statement with no effect [-Wunused-value]
    2613 |             pl->config->eee_rx_clk_stop_enable)
         |             ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/phylink.c:2613:47: error: expected ';' before ')' token
    2613 |             pl->config->eee_rx_clk_stop_enable)
         |                                               ^
         |                                               ;
>> drivers/net/phy/phylink.c:2611:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    2611 |         if (pl->mac_rx_clk_stop_blocked++ == 0 &&
         |         ^~
   drivers/net/phy/phylink.c:2613:47: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    2613 |             pl->config->eee_rx_clk_stop_enable)
         |                                               ^
>> drivers/net/phy/phylink.c:2613:47: error: expected statement before ')' token


vim +2613 drivers/net/phy/phylink.c

  2595	
  2596	
  2597	void phylink_rx_clk_stop_block(struct phylink *pl)
  2598	{
  2599		ASSERT_RTNL();
  2600	
  2601		if (pl->mac_rx_clk_stop_blocked == U8_MAX) {
  2602			phylink_warn(pl, "%s called too many times - ignoring\n",
  2603				     __func__);
  2604			dump_stack();
  2605			return;
  2606		}
  2607	
  2608		/* Disable PHY receive clock stop if this is the first time this
  2609		 * function has been called and clock-stop was previously enabled.
  2610		 */
> 2611		if (pl->mac_rx_clk_stop_blocked++ == 0 &&
  2612		    pl->mac_supports_eee_ops && pl->phydev)
> 2613		    pl->config->eee_rx_clk_stop_enable)
  2614			phy_eee_rx_clock_stop(pl->phydev, false);
  2615	}
  2616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
