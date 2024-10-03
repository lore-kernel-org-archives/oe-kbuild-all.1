Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD671B969
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727956531; cv=none; b=So6me9yOsdfQnTLaMRdfUXDnapXkaEPsUD/WrfXKuGFQlyJGWqA9Tvp6pR7Buw/+9mik+Fmz7n0e7AqyFPm097bF1UwM4kWo1XTBg45qjUpQ5UIFkQysAGjm/rcpM/qVEC/2W7vQXvia0/j7bOhUHyM97v/RtL+R01MZ4N5uHs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727956531; c=relaxed/simple;
	bh=LAdsI2y5Y9A9igUDpEa9r0QDX9pvxR+c+XRcjSOHzmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KPOIIO8pUWi7sLeEHnFaPcdjHLGLg1pL6GO27h4mJpgGcKWWJhV1qb/a9+X3QtoHfefLsMlfTkPjnPMsOWgrKV1SOJHulNjvdGM8RsxzKBxJB7pSGYq1HgAvSZXh5+Tf8vtG2nLkmGn4r2aHUCV6PyXsO5HfnygvYCQnADG53ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnRwb8xf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnRwb8xf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727956530; x=1759492530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LAdsI2y5Y9A9igUDpEa9r0QDX9pvxR+c+XRcjSOHzmQ=;
  b=NnRwb8xf1kSP//vPa3sZlr5ixRQvaLaLddF8TZbAITRo+3efH/D8U6fa
   cM/7bDGuhgbooIGxwf7kltO2h6YKLR7C+yi0o8QSgt62n+YsuRsX1VT4c
   nRQK2VPsA/1NPFHWRG9AyFCLE2aWZ/EfPD/d7hiNpj0r2ejf0uLmeL+q7
   KJqr/lDwVj4Aoc4QdXvXJ8dCKbysl7Wu69BXV1F5651CIFF6leUgTkd7l
   ndHyMXXz3UzC+wBuugBn+e750Zu0s2IARo7C1EE2WG4gwOC2pOJoXp7Bn
   RzoHFpRTdq6+1fP+LhZXxKbzl2d36CSWLq4jS0P360iu7EzFAKhUjPIMo
   Q==;
X-CSE-ConnectionGUID: nNZObK3tTTaALk7f+lwLhQ==
X-CSE-MsgGUID: mdcgAXrtTZCCHa7R8kjGBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27032540"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27032540"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:55:29 -0700
X-CSE-ConnectionGUID: uhHpsdf6T2eUjSZo/cjO6A==
X-CSE-MsgGUID: pCRbOLiGQBGT4Z7msCi8wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74337508"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Oct 2024 04:55:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swKQX-0000MY-1w;
	Thu, 03 Oct 2024 11:55:25 +0000
Date: Thu, 3 Oct 2024 19:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4742/16788]
 drivers/soc/fsl/dpio/dpio-service.c:963: warning: Function parameter or
 member 'prio' not described in 'dpaa2_io_service_enqueue_orp_qd'
Message-ID: <202410031908.KiRFCHuK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 17c0d9cd215642294ab5c25e970f6b2ff65e980a [4742/16788] soc: fsl: dpio: Add Support for Order Restoration
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241003/202410031908.KiRFCHuK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031908.KiRFCHuK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031908.KiRFCHuK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/fsl/dpio/dpio-service.c:963: warning: Function parameter or member 'prio' not described in 'dpaa2_io_service_enqueue_orp_qd'
>> drivers/soc/fsl/dpio/dpio-service.c:963: warning: Function parameter or member 'qdbin' not described in 'dpaa2_io_service_enqueue_orp_qd'


vim +963 drivers/soc/fsl/dpio/dpio-service.c

   937	
   938	/**
   939	 * dpaa2_io_service_enqueue_orp_qd() - Enqueue a frame to a queueing destination
   940	 * with order restoration
   941	 * @d: the given DPIO service.
   942	 * @qdid: the given queuing destination id.
   943	 * @fd: the frame descriptor which is enqueued.
   944	 * @orpid: the order restoration point ID
   945	 * @seqnum: the order sequence number
   946	 * @last: must be set for the final frame if seqnum is shared (spilt frame)
   947	 *
   948	 * Performs an enqueue to a frame queue using the specified order restoration
   949	 * point. The QMan device will ensure the order of frames placed on the
   950	 * queue will be ordered as per the sequence number.
   951	 *
   952	 * In the case a frame is split it is possible to enqueue using the same
   953	 * sequence number more than once. The final frame in a shared sequence number
   954	 * most be indicated by setting last = 1. For non shared sequence numbers
   955	 * last = 1 must always be set.
   956	 *
   957	 * Return 0 for successful enqueue, or -EBUSY if the enqueue ring is not ready,
   958	 * or -ENODEV if there is no dpio service.
   959	 */
   960	int dpaa2_io_service_enqueue_orp_qd(struct dpaa2_io *d, u32 qdid, u8 prio,
   961					    u16 qdbin, const struct dpaa2_fd *fd,
   962					    u16 orpid, u16 seqnum, int last)
 > 963	{
   964		struct qbman_eq_desc ed;
   965	
   966		d = service_select(d);
   967		if (!d)
   968			return -ENODEV;
   969		qbman_eq_desc_clear(&ed);
   970		qbman_eq_desc_set_orp(&ed, 0, orpid, seqnum, !last);
   971		qbman_eq_desc_set_qd(&ed, qdid, qdbin, prio);
   972		return qbman_swp_enqueue(d->swp, &ed, fd);
   973	}
   974	EXPORT_SYMBOL_GPL(dpaa2_io_service_enqueue_orp_qd);
   975	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
