Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226BDDBB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 07:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692258885; x=1723794885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UQmKIwqh/wtgUoyvc5dCNgfPVrdlQTGSAmf4kU2t33M=;
  b=j1z/8Dfkrp6VmHR+6BdXM97bXgZXPaUKgBpQLAreVRSvHia9cpgXdbPt
   DWHlcIWQIwYBKuxIbJXb/wCS3nTE7tU1r6qg0OlWgZ5RQidKCW3C5HsGw
   WpTkloTJOseeBtiUnoit6bF33lfd5Xd3fXAXkIGml2v7uYiR5cTl18tw7
   lp0+Vweq9m+WJTTtIxCGNwW/1BW0GC0cyeJpUdDjZ6T2xJny4wPrNzpQ4
   j2MV9K5TLndccfWdDTjuEnpeznnXq/osrdQQd2hcQLimrY1eNvudGMkH3
   e7EwaBUeWOfOAaZaiIZ2JnwxsyUxWHKcy8wquiIAwlBSHV112wZcKKsAM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="353058266"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="353058266"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:54:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848796713"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="848796713"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2023 00:54:39 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWXq3-0000vB-0H;
	Thu, 17 Aug 2023 07:54:39 +0000
Date: Thu, 17 Aug 2023 15:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: Re: [PATCH iwl-next] ice: store VF's pci_dev ptr in ice_vf
Message-ID: <202308171518.cvGLIHQ3-lkp@intel.com>
References: <20230816085454.235440-1-przemyslaw.kitszel@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816085454.235440-1-przemyslaw.kitszel@intel.com>

Hi Przemek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0ad204c4acb8ba1ed99564b001609e62547bc79d]

url:    https://github.com/intel-lab-lkp/linux/commits/Przemek-Kitszel/ice-store-VF-s-pci_dev-ptr-in-ice_vf/20230816-165953
base:   0ad204c4acb8ba1ed99564b001609e62547bc79d
patch link:    https://lore.kernel.org/r/20230816085454.235440-1-przemyslaw.kitszel%40intel.com
patch subject: [PATCH iwl-next] ice: store VF's pci_dev ptr in ice_vf
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230817/202308171518.cvGLIHQ3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171518.cvGLIHQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171518.cvGLIHQ3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_sriov.c:1727: warning: Function parameter or member 'pf' not described in 'ice_restore_all_vfs_msi_state'
>> drivers/net/ethernet/intel/ice/ice_sriov.c:1727: warning: Excess function parameter 'pdev' description in 'ice_restore_all_vfs_msi_state'


vim +1727 drivers/net/ethernet/intel/ice/ice_sriov.c

a54a0b24f4f5a3 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Nick Nunley     2020-07-13  1718  
a54a0b24f4f5a3 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Nick Nunley     2020-07-13  1719  /**
a54a0b24f4f5a3 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Nick Nunley     2020-07-13  1720   * ice_restore_all_vfs_msi_state - restore VF MSI state after PF FLR
a54a0b24f4f5a3 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Nick Nunley     2020-07-13  1721   * @pdev: pointer to a pci_dev structure
a54a0b24f4f5a3 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Nick Nunley     2020-07-13  1722   *
a54a0b24f4f5a3 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Nick Nunley     2020-07-13  1723   * Called when recovering from a PF FLR to restore interrupt capability to
a54a0b24f4f5a3 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Nick Nunley     2020-07-13  1724   * the VFs.
a54a0b24f4f5a3 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Nick Nunley     2020-07-13  1725   */
ab8f0331b8a892 drivers/net/ethernet/intel/ice/ice_sriov.c       Przemek Kitszel 2023-08-16  1726  void ice_restore_all_vfs_msi_state(struct ice_pf *pf)
a54a0b24f4f5a3 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Nick Nunley     2020-07-13 @1727  {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
