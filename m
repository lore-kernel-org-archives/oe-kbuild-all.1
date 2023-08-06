Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4D6179
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 01:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691287021; x=1722823021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tR5taOUYEuLswZQpVdBu6RTJCh9RNCsYgMcTB5itf/w=;
  b=fCKljttUUE0d4ZKCZtlKb7L174EBQRTyMFRGZc+8SsiyBDnWCYWFAhiT
   uBnIXR8/4nkQ/XCXTt/AQUp3SB8S/HSYrq6NU0x8odA1YimOdKgJoK3lX
   zc9ozdR87R0f+JeH6rRrc+U6glt95eCUj8d5tSg55BZrS6TeMB+FiuCP9
   0quxtNRyzbW17c6hA9n6SdfaMD4itdBkTc3VhUMLfLJ8+kjPz2Ct1F/Cv
   9xCWgtHz8gNWerXLB1TNKl/SN7zX3QtXGi265J2Daw9Ra+31QxKnK0jxe
   OJNZK/D41bpXtJ/+OFvOvdPwCd30y4bdTucmT06A9653IkZrOp7ucLw+N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="373098286"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="373098286"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 18:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="873832289"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2023 18:57:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qST0s-0003z5-28;
	Sun, 06 Aug 2023 01:56:58 +0000
Date: Sun, 6 Aug 2023 09:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.4/isp/v2 36/47]
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1790:36: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202308060913.BnyQs5gT-lkp@intel.com>
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
commit: 89de60b566277334c7e687ccba345c1a4aba12f9 [36/47] staging: mmal-vchiq: Use vc-sm-cma to support zero copy
config: s390-randconfig-r082-20230806 (https://download.01.org/0day-ci/archive/20230806/202308060913.BnyQs5gT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308060913.BnyQs5gT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308060913.BnyQs5gT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1790:36: sparse: sparse: Using plain integer as NULL pointer
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:470:48: sparse: sparse: non size-preserving integer to pointer cast

vim +1790 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c

  1773	
  1774	int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
  1775	{
  1776		struct mmal_msg_context *msg_context = buf->msg_context;
  1777	
  1778		if (msg_context)
  1779			release_msg_context(msg_context);
  1780		buf->msg_context = NULL;
  1781	
  1782		if (buf->vcsm_handle) {
  1783			int ret;
  1784	
  1785			pr_debug("%s: vc_sm_cma_free on handle %p\n", __func__,
  1786				 buf->vcsm_handle);
  1787			ret = vc_sm_cma_free(buf->vcsm_handle);
  1788			if (ret)
  1789				pr_err("%s: vcsm_free failed, ret %d\n", __func__, ret);
> 1790			buf->vcsm_handle = 0;
  1791		}
  1792	
  1793		return 0;
  1794	}
  1795	EXPORT_SYMBOL_GPL(mmal_vchi_buffer_cleanup);
  1796	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
