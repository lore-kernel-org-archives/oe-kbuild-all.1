Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECEA179
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 01:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691285221; x=1722821221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GRpAhJkEhN7nS9oOlDc5w8+/P+VLo1lOS3+XmrWyN0=;
  b=e2nGSfvsB+KTYKunC7+eRN3C44+UdBVAaIVfQAe8AWwnJ5pmVBn5isGU
   KbIkIBzdSzNIloHQbTGrLWwmbZS6vFd6wSESmeMR4v816nT4Kco0ecjZi
   k6iPIdHYlls2boWDrPp5fOJ6ZO4jHKb/r0ZVEqPyczknY8cXeZ0lsIPxB
   NEUgoYdUWvEEDrBAZ56rSd5UJctW5jFxCjwZ+pCslNSHX/OHjM6BpVTsO
   P5fPRlbrbIOGSQ5ieOM3PXpcpDOER54nyPpR4HhA9XvDRPr50rudAzYUv
   WkgidU2ebDvF92xDExNyhhLmkrSzl4hyOVj/AJ1GwBml1W6PBgLGYDT9D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="370342122"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="370342122"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 18:27:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="844555630"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="844555630"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2023 18:26:59 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSSXq-0003yZ-1Q;
	Sun, 06 Aug 2023 01:26:58 +0000
Date: Sun, 6 Aug 2023 09:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.4/isp/v2 32/47]
 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:476:55: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202308060906.FQALghtZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.4/isp/v2
head:   fa6e05c138b9be3efb409e6a5a913ac9ad342a8d
commit: e4f0aebd1ac235c8960d3c23c34d5ddd775ed46a [32/47] staging: vc04_services: Add new vc-sm-cma driver
config: s390-randconfig-r082-20230806 (https://download.01.org/0day-ci/archive/20230806/202308060906.FQALghtZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308060906.FQALghtZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308060906.FQALghtZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:476:55: sparse: sparse: Using plain integer as NULL pointer
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:505:59: sparse: sparse: Using plain integer as NULL pointer
--
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c: note: in included file:
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.h:37:21: sparse: sparse: dubious one-bit signed bitfield

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
