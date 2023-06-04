Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D16E2CA9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 20:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685911698; x=1717447698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZctWNoEBx645vTiJ+MNYzwdow9zEH4sC/bYLvc84DwQ=;
  b=ntUCoJJNDC+uF5Iod0uDnGTOtYp/O2P7akoqVbcHDuuZRLi+VnSUEool
   lkzGRVaOC/pkykTATUrP4vej9Bn7TaaRYiDrTSHpJD2O+UMk5K26tY3/A
   cNsnvgFKVT+aMS064ZNxdzzqjTof5aI0+MqgG/IYAExUqx1kMOMrbhlJd
   rH5gcP62SvDF8nw138A5JUit1WcJvlCqFwGLHh4VxQ9MvgqlsYk4vCyzr
   yo4aMTiCswsUa0kQfcXg0ph33qNR/RusHCUmAZgPG4NnlZSz+l8LDTL25
   duNTgxVfmX7jfe+oqOGaenTZE5u9VfXmKLPM5CQ8UCRrbx6K32/hJywoy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="355081078"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="355081078"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 13:48:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="882678859"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="882678859"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Jun 2023 13:48:15 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5ue7-0003RL-0L;
	Sun, 04 Jun 2023 20:48:15 +0000
Date: Mon, 5 Jun 2023 04:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Malli C <mallikarjuna.chilakala@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Dutta, Ranjan" <ranjan.dutta@intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 3805/30000]
 drivers/net/ethernet/intel/igc/igc_ptp.c:450:21: sparse: sparse: cast to
 restricted __be32
Message-ID: <202306050425.NB45j9xu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   5610fff176c8ff3eb470b8270294bc7a7acb4a15
commit: 3bce8064b0275876d2b536798d1a5603c1a5594f [3805/30000] igc: Add support for PTP getcrosststamp()
config: x86_64-randconfig-s021-20230604 (https://download.01.org/0day-ci/archive/20230605/202306050425.NB45j9xu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/linux-intel-lts/commit/3bce8064b0275876d2b536798d1a5603c1a5594f
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/dovetail-xenomai
        git checkout 3bce8064b0275876d2b536798d1a5603c1a5594f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/ drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306050425.NB45j9xu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/igc/igc_ptp.c:450:21: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/intel/igc/igc_ptp.c:450:21: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/intel/igc/igc_ptp.c:450:21: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/intel/igc/igc_ptp.c:450:21: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/intel/igc/igc_ptp.c:450:21: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/intel/igc/igc_ptp.c:450:21: sparse: sparse: cast to restricted __be32

vim +450 drivers/net/ethernet/intel/igc/igc_ptp.c

   434	
   435	static void igc_ptm_gather_report(struct igc_adapter *adapter)
   436	{
   437		struct igc_hw *hw = &adapter->hw;
   438		u32 t2_curr_h, t2_curr_l;
   439		ktime_t t1, t2_curr;
   440	
   441		t1 = ktime_set(rd32(IGC_PTM_T1_TIM0_H),
   442			       rd32(IGC_PTM_T1_TIM0_L));
   443	
   444		t2_curr_l = rd32(IGC_PTM_CURR_T2_L);
   445		t2_curr_h = rd32(IGC_PTM_CURR_T2_H);
   446	
   447		/* FIXME: There's an ambiguity on what endianness some PCIe PTM
   448		 * messages should use. Find a more robust way to handle this.
   449		 */
 > 450		t2_curr_h = be32_to_cpu(t2_curr_h);
   451	
   452		t2_curr = ((s64)t2_curr_h << 32 | t2_curr_l);
   453	
   454		wr32(IGC_PTM_STAT, IGC_PTM_STAT_VALID);
   455	
   456		mutex_lock(&adapter->ptm_time_lock);
   457	
   458		/* Because get_device_system_crosststamp() requires that the
   459		 * historic timestamp is before the PTM device/host
   460		 * timestamps, we keep track of the current and previous
   461		 * snapshot (historic timestamp).
   462		 */
   463		memcpy(&adapter->prev_snapshot,
   464		       &adapter->curr_snapshot, sizeof(adapter->prev_snapshot));
   465		ktime_get_snapshot(&adapter->curr_snapshot);
   466	
   467		adapter->ptm_device_time = t1;
   468		adapter->ptm_host_time = igc_device_tstamp_to_system(t2_curr);
   469		mutex_unlock(&adapter->ptm_time_lock);
   470	
   471		mod_delayed_work(system_wq, &adapter->ptm_report,
   472				 msecs_to_jiffies(IGC_PTM_CYCLE_TIME_MSECS));
   473	}
   474	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
