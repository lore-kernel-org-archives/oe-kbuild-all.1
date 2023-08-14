Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A2BBA45
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692025370; x=1723561370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p3xrgiIlrlcuJG2Xhg7NpAfu0bInawNdZUsj6u+3K8M=;
  b=PK792YBvDqoOit0vJEjRjn/50ZJrAGsMCOrOPgzoglyU3PmtoN8nuMz6
   TbDH6yKeQVbFZfN/ujLf8MecmirJrjZXjpIhJXQeeSVDDLp//YNlvZ9ym
   RZY4HAFwBzdTT07maEucShQJ6aFG+gOz7Ch+sYBSzJ2LjtdgTfT0n7N0m
   v2qjQBBUISy+dUAYY0L/Rv6QLfzNR48x06rmv+eOpbwlvEX2SlINzP4kc
   K67OOWGEKnnUhA3kvXnry6yz8y3JgcsfaqL0hLkN9U+8ZtzQl/pKcPt8Z
   tDtiBOvpdkZ8QprqR0nUOCVHYWgnoH2NaPT7zHtr7iyssuZSGXHq4O9jZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372050953"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="372050953"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 08:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="907264969"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="907264969"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Aug 2023 08:02:11 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVZ58-0000Ch-2g;
	Mon, 14 Aug 2023 15:02:10 +0000
Date: Mon, 14 Aug 2023 23:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:net-queue 147/150] drivers/net/phy/phylink.c:643:23: warning:
 variable 'capabilities' set but not used
Message-ID: <202308142233.JIJX2Djn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git net-queue
head:   77db594bd684ae74e357f861f7a071ba916cede8
commit: 6e413410e0bef70786948c71d28c39755a98d5e8 [147/150] net: phylink: provide mac_get_caps()
config: i386-randconfig-r005-20230814 (https://download.01.org/0day-ci/archive/20230814/202308142233.JIJX2Djn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142233.JIJX2Djn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308142233.JIJX2Djn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/phylink.c: In function 'phylink_validate_mac_and_pcs':
   drivers/net/phy/phylink.c:693:62: error: 'capabilties' undeclared (first use in this function); did you mean 'capabilities'?
     693 |                 phylink_validate_mask_caps(supported, state, capabilties);
         |                                                              ^~~~~~~~~~~
         |                                                              capabilities
   drivers/net/phy/phylink.c:693:62: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/phy/phylink.c:643:23: warning: variable 'capabilities' set but not used [-Wunused-but-set-variable]
     643 |         unsigned long capabilities;
         |                       ^~~~~~~~~~~~


vim +/capabilities +643 drivers/net/phy/phylink.c

   638	
   639	static int phylink_validate_mac_and_pcs(struct phylink *pl, unsigned int mode,
   640						unsigned long *supported,
   641						struct phylink_link_state *state)
   642	{
 > 643		unsigned long capabilities;
   644		struct phylink_pcs *pcs;
   645		int ret;
   646	
   647		/* Get the PCS for this interface mode */
   648		if (pl->using_mac_select_pcs) {
   649			pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
   650			if (IS_ERR(pcs))
   651				return PTR_ERR(pcs);
   652		} else {
   653			pcs = pl->pcs;
   654		}
   655	
   656		if (pcs) {
   657			/* The PCS, if present, must be setup before phylink_create()
   658			 * has been called. If the ops is not initialised, print an
   659			 * error and backtrace rather than oopsing the kernel.
   660			 */
   661			if (!pcs->ops) {
   662				phylink_err(pl, "interface %s: uninitialised PCS\n",
   663					    phy_modes(state->interface));
   664				dump_stack();
   665				return -EINVAL;
   666			}
   667	
   668			/* Validate the link parameters with the PCS */
   669			if (pcs->ops->pcs_validate) {
   670				ret = pcs->ops->pcs_validate(pcs, mode, supported,
   671							     state);
   672				if (ret < 0 || phylink_is_empty_linkmode(supported))
   673					return -EINVAL;
   674	
   675				/* Ensure the advertising mask is a subset of the
   676				 * supported mask.
   677				 */
   678				linkmode_and(state->advertising, state->advertising,
   679					     supported);
   680			}
   681		}
   682	
   683		/* Then validate the link parameters with the MAC */
   684		if (pl->mac_ops->validate) {
   685			pl->mac_ops->validate(pl->config, supported, state);
   686		} else {
   687			if (pl->mac_ops->mac_get_caps)
   688				capabilities = pl->mac_ops->mac_get_caps(pl->config,
   689								state->interface);
   690			else
   691				capabilities = pl->config->mac_capabilities;
   692	
 > 693			phylink_validate_mask_caps(supported, state, capabilties);
   694		}
   695	
   696		return phylink_is_empty_linkmode(supported) ? -EINVAL : 0;
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
