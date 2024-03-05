Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713061EA74
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 23:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709682609; cv=none; b=nfO1SunT2KDTiVW1EJ6/R4QWZJhQS7TYEwyIOd9jqrnHrNWVk5tzqSqsRepdPy4Iz+l2RLPhADxdvwQWU5kT28lMpIonTtaScvNU3b4rdKU5Ym/tdljte55UDssf/S7fwk4Trx6SnmRXozdGjm5h44RVAVnqiX5NZLq/83KGIEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709682609; c=relaxed/simple;
	bh=SXGWmB7sAfeAgLSuK+XBezJoNaOJgWj1e8GhXVR0dDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jFAfv/PAjB2+XH1rGJ8ag+z71VUR/jbBxs/u+6NUFGVDh3YyvxhnhV+RfbTMLhVDHR+jFug4vNbf23O7eIdMSYc2MCA/+bk2LoqBShEwVR05NcqCe8q7Kng/Qv0W1f+cGu6JgOzklD7PPzmnxgy5M42RBVtrTGviac7E5oWEaSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbSwJdg8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbSwJdg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709682606; x=1741218606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SXGWmB7sAfeAgLSuK+XBezJoNaOJgWj1e8GhXVR0dDw=;
  b=UbSwJdg8XT0W/24rJUWSSCWoOzEjJlSvD/6V/8sHrXzAZA0rDtEFLVM7
   nq3jZJmvTeNC5dOq09BSTvR0Yxdw+Y5Fh8pYDRlcpA3Vv8iSSPFLOsrGm
   R2/kU9WEyzb45D+Ihm0TqqOwgA5Pfvde7QGa2XvUmrue6fiECu++H5DHr
   vwq9jOm12x7nnoJrLUQJhygEvGKWB7Alrobw7hWZhtitsSUJ4bJWzDtdf
   XxispUcprCIRojBvwBnIp0PivcYHWNsvdsyifdYsrst+ZQHmK/TeEP9gB
   r5hRmLXENeFbRV3o7iDwpqh19yH4S3R7+joeTupjeihxXhipA71vjgyVI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="14918288"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="14918288"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 15:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9509948"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2024 15:50:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rheXp-0003l4-1D;
	Tue, 05 Mar 2024 23:50:01 +0000
Date: Wed, 6 Mar 2024 07:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.8/isp/v2 1/22]
 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:476:55: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202403060746.y7FwXi5T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.8/isp/v2
head:   429a9c05cc5a81e4f62c163c2e8bbdc600cf6b91
commit: 364969482811f5f21a5c14a8213c5297b027da5e [1/22] staging: vc04_services: Add new vc-sm-cma driver
config: alpha-randconfig-r132-20240305 (https://download.01.org/0day-ci/archive/20240306/202403060746.y7FwXi5T-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240306/202403060746.y7FwXi5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060746.y7FwXi5T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:476:55: sparse: sparse: Using plain integer as NULL pointer
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:505:59: sparse: sparse: Using plain integer as NULL pointer
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +476 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c

   471	
   472	int vc_sm_cma_vchi_free(struct sm_instance *handle, struct vc_sm_free_t *msg,
   473				u32 *cur_trans_id)
   474	{
   475		return vc_sm_cma_vchi_send_msg(handle, VC_SM_MSG_TYPE_FREE,
 > 476					   msg, sizeof(*msg), 0, 0, cur_trans_id, 0);
   477	}
   478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
