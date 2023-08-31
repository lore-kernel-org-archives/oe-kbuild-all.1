Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB9410FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 01:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693446274; x=1724982274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aNYOaaHIwUrNU2TzfE9sdqJb02H63glZu4F32bH+mJ8=;
  b=GXD3uWg/U3NeAjG4GHGZfE5Oo69EjwO09i+vmevMCg6fkdO5NrD3eo1G
   Eu0ftPGCtCd9HoUWKa8/NnDVs91bXnzsBcuX75byNjpO9jBp60gX6QoIu
   WAvv/f7wGI57h7Jg8qeyagKoqmKK4c3HdCFVZmmNwUPtyXBa40Ua0G/HV
   UjoC9K7chYBeZY+WfKwj3OnJfqAHbsd49IRkDkZNJOaAW8WXCbDphO8yJ
   kyuYJmMpUFv9slAdsJgrt1GhkEgCaqcjO1kf9/ihR6jETPK1AhsQ+y72t
   rPSXyvs2FGBhkiurjr1jLoCga6GPewD/ig5AUx0OvAdmyT+KEuwmmImm3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379540165"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="379540165"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 18:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739293308"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="739293308"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Aug 2023 18:44:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbWjS-000ASV-2d;
	Thu, 31 Aug 2023 01:44:28 +0000
Date: Thu, 31 Aug 2023 09:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3831/24603]
 drivers/soc/fsl/dpio/dpio-service.c:846: warning: Function parameter or
 member 'prio' not described in 'dpaa2_io_service_enqueue_orp_qd'
Message-ID: <202308310904.7SuGC0P3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 6367f0caf383534f1e1e40acedae2c6c53bdf5b1 [3831/24603] soc: fsl: dpio: Add Support for Order Restoration
config: arm64-randconfig-r013-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310904.7SuGC0P3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310904.7SuGC0P3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310904.7SuGC0P3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/fsl/dpio/dpio-service.c:846: warning: Function parameter or member 'prio' not described in 'dpaa2_io_service_enqueue_orp_qd'
>> drivers/soc/fsl/dpio/dpio-service.c:846: warning: Function parameter or member 'qdbin' not described in 'dpaa2_io_service_enqueue_orp_qd'
--
>> drivers/soc/fsl/dpio/qbman-portal.c:559: warning: Function parameter or member 'respond_success' not described in 'qbman_eq_desc_set_orp'
>> drivers/soc/fsl/dpio/qbman-portal.c:559: warning: Excess function parameter 'response_success' description in 'qbman_eq_desc_set_orp'


vim +846 drivers/soc/fsl/dpio/dpio-service.c

   820	
   821	/**
   822	 * dpaa2_io_service_enqueue_orp_qd() - Enqueue a frame to a queueing destination
   823	 * with order restoration
   824	 * @d: the given DPIO service.
   825	 * @qdid: the given queuing destination id.
   826	 * @fd: the frame descriptor which is enqueued.
   827	 * @orpid: the order restoration point ID
   828	 * @seqnum: the order sequence number
   829	 * @last: must be set for the final frame if seqnum is shared (spilt frame)
   830	 *
   831	 * Performs an enqueue to a frame queue using the specified order restoration
   832	 * point. The QMan device will ensure the order of frames placed on the
   833	 * queue will be ordered as per the sequence number.
   834	 *
   835	 * In the case a frame is split it is possible to enqueue using the same
   836	 * sequence number more than once. The final frame in a shared sequence number
   837	 * most be indicated by setting last = 1. For non shared sequence numbers
   838	 * last = 1 must always be set.
   839	 *
   840	 * Return 0 for successful enqueue, or -EBUSY if the enqueue ring is not ready,
   841	 * or -ENODEV if there is no dpio service.
   842	 */
   843	int dpaa2_io_service_enqueue_orp_qd(struct dpaa2_io *d, u32 qdid, u8 prio,
   844					    u16 qdbin, const struct dpaa2_fd *fd,
   845					    u16 orpid, u16 seqnum, int last)
 > 846	{
   847		struct qbman_eq_desc ed;
   848	
   849		d = service_select(d);
   850		if (!d)
   851			return -ENODEV;
   852		qbman_eq_desc_clear(&ed);
   853		qbman_eq_desc_set_orp(&ed, 0, orpid, seqnum, !last);
   854		qbman_eq_desc_set_qd(&ed, qdid, qdbin, prio);
   855		return qbman_swp_enqueue(d->swp, &ed, fd);
   856	}
   857	EXPORT_SYMBOL_GPL(dpaa2_io_service_enqueue_orp_qd);
   858	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
