Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3081C11720
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVPFd6pK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697194514; x=1728730514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6WveLtsYI69Fg61covrfqt1mQPEu1ayQ1JtkNTkX/sg=;
  b=GVPFd6pKVOuGFMvNHxX8N6Z4lSqfaliKKHrAIYhJL72MTFkcQHyT6xu4
   cTpVhahC8N7bghb9ngLjsNzzly9C2RmbdkP/lnk3d2Y/HvQxyFO+aw/jx
   ScJ+rUfYPt9qg/hgYpKb96Qhmw2KkmvWMJn7/xNMZaNZvdUf+GJ7caB8A
   plNBnBzePg1DsXZ52oS+bz+UxUstV/DlJ+6aKIBlelqxlVACtnWFukb6y
   oO5IaWhDdX774grfnIDhq5wUi5y3oFNoY+O71JHnRJPG3ZGCxLJ894TzO
   S2/l8NzasoEVfebP2G26COlh61f/Q8VuQlPEGY4l0bzRwK+OsIF57QUSM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364518344"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="364518344"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731326361"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="731326361"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2023 03:55:12 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrFp0-0004ev-02;
	Fri, 13 Oct 2023 10:55:10 +0000
Date: Fri, 13 Oct 2023 18:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2489/30000]
 drivers/soc/fsl/dpio/dpio-service.c:774: warning: Function parameter or
 member 'prio' not described in 'dpaa2_io_service_enqueue_orp_qd'
Message-ID: <202310131854.Eop34RHR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: d8cfff80220b06d2875dc32ace37fb7d453624d7 [2489/30000] soc: fsl: dpio: Add Support for Order Restoration
config: powerpc64-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131854.Eop34RHR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131854.Eop34RHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131854.Eop34RHR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/fsl/dpio/dpio-service.c:774: warning: Function parameter or member 'prio' not described in 'dpaa2_io_service_enqueue_orp_qd'
>> drivers/soc/fsl/dpio/dpio-service.c:774: warning: Function parameter or member 'qdbin' not described in 'dpaa2_io_service_enqueue_orp_qd'


vim +774 drivers/soc/fsl/dpio/dpio-service.c

   748	
   749	/**
   750	 * dpaa2_io_service_enqueue_orp_qd() - Enqueue a frame to a queueing destination
   751	 * with order restoration
   752	 * @d: the given DPIO service.
   753	 * @qdid: the given queuing destination id.
   754	 * @fd: the frame descriptor which is enqueued.
   755	 * @orpid: the order restoration point ID
   756	 * @seqnum: the order sequence number
   757	 * @last: must be set for the final frame if seqnum is shared (spilt frame)
   758	 *
   759	 * Performs an enqueue to a frame queue using the specified order restoration
   760	 * point. The QMan device will ensure the order of frames placed on the
   761	 * queue will be ordered as per the sequence number.
   762	 *
   763	 * In the case a frame is split it is possible to enqueue using the same
   764	 * sequence number more than once. The final frame in a shared sequence number
   765	 * most be indicated by setting last = 1. For non shared sequence numbers
   766	 * last = 1 must always be set.
   767	 *
   768	 * Return 0 for successful enqueue, or -EBUSY if the enqueue ring is not ready,
   769	 * or -ENODEV if there is no dpio service.
   770	 */
   771	int dpaa2_io_service_enqueue_orp_qd(struct dpaa2_io *d, u32 qdid, u8 prio,
   772					    u16 qdbin, const struct dpaa2_fd *fd,
   773					    u16 orpid, u16 seqnum, int last)
 > 774	{
   775		struct qbman_eq_desc ed;
   776	
   777		d = service_select(d);
   778		if (!d)
   779			return -ENODEV;
   780		qbman_eq_desc_clear(&ed);
   781		qbman_eq_desc_set_orp(&ed, 0, orpid, seqnum, !last);
   782		qbman_eq_desc_set_qd(&ed, qdid, qdbin, prio);
   783		return qbman_swp_enqueue(d->swp, &ed, fd);
   784	}
   785	EXPORT_SYMBOL_GPL(dpaa2_io_service_enqueue_orp_qd);
   786	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
