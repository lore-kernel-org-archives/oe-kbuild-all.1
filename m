Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2B91EB44
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 19:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720467869; cv=none; b=WtCSQedDnAhbotf1gb8+g55Au+i0oI9yq1qfGt0S0yLcp1l6zh6ZV9TGCrFdn3migw9F6MCf7EoIoR25X4Ucco4qvb+656YxSthG+vISNYYRZ1NQ5AFWWEN8lVTRD+WGp21OxRd9IZg4nIttuSxdn86pEOeNggdrN9RxvmRpr7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720467869; c=relaxed/simple;
	bh=Rq+cEc5tIf/J1KKVmPtBTggR7/fEvYmsAaNtclxYdFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nmi9s2SjuFOWdSSzj1lZ5Z28kHdnXfoITNd1pcsN/QMUYouqV7rB3gDRiSeOgnUrhMp3wvApxb6KleU4gXM23FkA9EHK3p9p0twnCRMVZkIPvhGPEAWriAw2SdXOddzb64JJcsn/SeW/vtpXOSLyKFkNIkfrY7VJ/TMU1rS5wnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVWKm6xf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVWKm6xf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720467867; x=1752003867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rq+cEc5tIf/J1KKVmPtBTggR7/fEvYmsAaNtclxYdFw=;
  b=mVWKm6xfZJF8jjkI09L2TAZ8FSuUEpMeD6fiXW5/Nl8QpxRsirBeKqtL
   TMv6rUAxb2QSRcOBlUM6O3aSBnL0feSgguGVuTAe+h7iYWfgO4I9PJZKa
   PUpZibiRTXVBKqw+FXEpAnaNBRTIZf7hQV7O+xqu6XL0dF39TxUjF5/PE
   ixdDfQxu9ghL+8V4Q/IcpL/DWIJ7waF4tJSGJq2zxS1s++/N1sj6PSGqz
   J7xSX8MFlgFx1aXDRfg/BxNk4QskzOCbH4zKY/D+v2h2+C/aOgQ2G+EM2
   myfCMjBd4DyrGykyaa0SPevYm4O583H0Bn4JH+8vwhG0GTSeihPTTT71h
   A==;
X-CSE-ConnectionGUID: MWmG/mwpRaWks/GXg5rQ8g==
X-CSE-MsgGUID: X7zFaU2mREujaK3Zd4GRcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21502518"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="21502518"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 12:44:27 -0700
X-CSE-ConnectionGUID: +TNWNgKARn69Ax8b7OzKQA==
X-CSE-MsgGUID: UGAGC+1rTGKL9QPy/OzSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="52790459"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jul 2024 12:44:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQuHf-000Vzm-03;
	Mon, 08 Jul 2024 19:44:23 +0000
Date: Tue, 9 Jul 2024 03:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "gu.huiguang" <guhuiguang@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 4037/10605]
 drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2911:41: warning: '%d' directive
 output may be truncated writing between 1 and 11 bytes into a region of size
 between 3 and 18
Message-ID: <202407090319.Lo3bXFwf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0dba2ca16050e1ea7b068850b6fa440dbeb6665b
commit: 5deaf74c4b3edcf88f67f18aa352690deb9dc212 [4037/10605] drivers: initial support for rnpm drivers from Mucse Technology
config: loongarch-randconfig-002-20240709 (https://download.01.org/0day-ci/archive/20240709/202407090319.Lo3bXFwf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090319.Lo3bXFwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090319.Lo3bXFwf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:256:6: warning: no previous prototype for 'rnpm_pf_service_event_schedule' [-Wmissing-prototypes]
     256 | void rnpm_pf_service_event_schedule(struct rnpm_pf_adapter *pf_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1137:5: warning: no previous prototype for 'rnpm_rx_ring_reinit' [-Wmissing-prototypes]
    1137 | int rnpm_rx_ring_reinit(struct rnpm_adapter *adapter, struct rnpm_ring *rx_ring)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: In function 'rnpm_clean_rx_irq':
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2015:14: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    2015 |         bool xdp_xmit = false;
         |              ^~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: At top level:
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2207:6: warning: no previous prototype for 'rnpm_write_eitr' [-Wmissing-prototypes]
    2207 | void rnpm_write_eitr(struct rnpm_q_vector *q_vector, bool is_rxframe)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3013:5: warning: no previous prototype for 'rnpm_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3013 | int rnpm_xmit_nop_frame_ring(struct rnpm_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3037:5: warning: no previous prototype for 'rnpm_xmit_nop_frame_ring_temp' [-Wmissing-prototypes]
    3037 | int rnpm_xmit_nop_frame_ring_temp(struct rnpm_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3909:6: warning: no previous prototype for 'rnpm_vlan_stags_flag' [-Wmissing-prototypes]
    3909 | void rnpm_vlan_stags_flag(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4031:6: warning: no previous prototype for 'control_mac_rx' [-Wmissing-prototypes]
    4031 | void control_mac_rx(struct rnpm_adapter *adapter, bool on)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5803:6: warning: no previous prototype for 'rnpm_pf_service_timer' [-Wmissing-prototypes]
    5803 | void rnpm_pf_service_timer(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5821:6: warning: no previous prototype for 'rnpm_service_timer' [-Wmissing-prototypes]
    5821 | void rnpm_service_timer(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5962:21: warning: no previous prototype for 'wait_all_port_resetting' [-Wmissing-prototypes]
    5962 | __maybe_unused void wait_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5974:21: warning: no previous prototype for 'clean_all_port_resetting' [-Wmissing-prototypes]
    5974 | __maybe_unused void clean_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6185:5: warning: no previous prototype for 'rnpm_check_mc_addr' [-Wmissing-prototypes]
    6185 | int rnpm_check_mc_addr(struct rnpm_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6211:6: warning: no previous prototype for 'update_pf_vlan' [-Wmissing-prototypes]
    6211 | void update_pf_vlan(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6262:6: warning: no previous prototype for 'rnpm_pf_service_task' [-Wmissing-prototypes]
    6262 | void rnpm_pf_service_task(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7528:6: warning: no previous prototype for 'rnpm_clear_udp_tunnel_port' [-Wmissing-prototypes]
    7528 | void rnpm_clear_udp_tunnel_port(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7692:6: warning: no previous prototype for 'rnpm_assign_netdev_ops' [-Wmissing-prototypes]
    7692 | void rnpm_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7785:6: warning: no previous prototype for 'rnpm_fix_queue_number' [-Wmissing-prototypes]
    7785 | void rnpm_fix_queue_number(struct rnpm_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8760:5: warning: no previous prototype for 'rnpm_can_rpu_start' [-Wmissing-prototypes]
    8760 | int rnpm_can_rpu_start(struct rnpm_pf_adapter *pf_adapter)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: In function 'rnpm_request_msix_irqs':
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2911:41: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 3 and 18 [-Wformat-truncation=]
    2911 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                         ^~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2911:34: note: directive argument in the range [-2147483643, 2147483646]
    2911 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                  ^~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2911:34: note: directive argument in the range [0, 65535]
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2910:25: note: 'snprintf' output between 10 and 39 bytes into a destination of size 24
    2910 |                         snprintf(q_vector->name, sizeof(q_vector->name) - 1,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2911 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2912 |                                  q_vector->v_idx);
         |                                  ~~~~~~~~~~~~~~~~


vim +2911 drivers/net/ethernet/mucse/rnpm/rnpm_main.c

  2887	
  2888	/**
  2889	 * rnpm_request_msix_irqs - Initialize MSI-X interrupts
  2890	 * @adapter: board private structure
  2891	 *
  2892	 * rnpm_request_msix_irqs allocates MSI-X vectors and requests
  2893	 * interrupts from the kernel.
  2894	 **/
  2895	static int rnpm_request_msix_irqs(struct rnpm_adapter *adapter)
  2896	{
  2897		struct net_device *netdev = adapter->netdev;
  2898		int err;
  2899		int i = 0;
  2900		int cpu;
  2901	
  2902		DPRINTK(IFUP, INFO, "num_q_vectors:%d\n", adapter->num_q_vectors);
  2903	
  2904		for (i = 0; i < adapter->num_q_vectors; i++) {
  2905			struct rnpm_q_vector *q_vector = adapter->q_vector[i];
  2906			struct msix_entry *entry = &adapter->msix_entries[i];
  2907	
  2908			// rnpm_dbg("use irq %d\n", entry->entry);
  2909			if (q_vector->tx.ring && q_vector->rx.ring) {
  2910				snprintf(q_vector->name, sizeof(q_vector->name) - 1,
> 2911					 "%s-%s-%d-%d", netdev->name, "TxRx", i,
  2912					 q_vector->v_idx);
  2913			} else {
  2914				WARN(!(q_vector->tx.ring && q_vector->rx.ring),
  2915				     "%s vector%d tx rx is null, v_idx:%d\n",
  2916				     netdev->name, i, q_vector->v_idx);
  2917				/* skip this unused q_vector */
  2918				continue;
  2919			}
  2920			err = request_irq(entry->vector, &rnpm_msix_clean_rings, 0,
  2921					  q_vector->name, q_vector);
  2922			if (err) {
  2923				e_err(probe,
  2924				      "%s:request_irq failed for MSIX interrupt:%d Error: %d\n",
  2925				      netdev->name, entry->vector, err);
  2926				goto free_queue_irqs;
  2927			}
  2928			/* register for affinity change notifications */
  2929			q_vector->affinity_notify.notify = rnpm_irq_affinity_notify;
  2930			q_vector->affinity_notify.release = rnpm_irq_affinity_release;
  2931			irq_set_affinity_notifier(entry->vector,
  2932						  &q_vector->affinity_notify);
  2933			/* Spread affinity hints out across online CPUs.
  2934			 *
  2935			 * get_cpu_mask returns a static constant mask with
  2936			 * a permanent lifetime so it's ok to pass to
  2937			 * irq_set_affinity_hint without making a copy.
  2938			 */
  2939			cpu = cpumask_local_spread(q_vector->v_idx, -1);
  2940			irq_set_affinity_hint(entry->vector, get_cpu_mask(cpu));
  2941		}
  2942	
  2943		return 0;
  2944	
  2945	free_queue_irqs:
  2946		while (i) {
  2947			i--;
  2948			irq_set_affinity_hint(adapter->msix_entries[i].vector, NULL);
  2949			irq_set_affinity_notifier(adapter->msix_entries[i].vector,
  2950						  NULL);
  2951			irq_set_affinity_hint(adapter->msix_entries[i].vector, NULL);
  2952			free_irq(adapter->msix_entries[i].vector, adapter->q_vector[i]);
  2953		}
  2954	
  2955		kfree(adapter->msix_entries);
  2956		adapter->msix_entries = NULL;
  2957		return err;
  2958	}
  2959	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
