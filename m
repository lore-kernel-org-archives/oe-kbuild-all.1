Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B4C18032
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQpkOMzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704271775; x=1735807775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p1efVa0+lqG/UerpnYyBuzCAnLJ55v/kocU9k8R4VRU=;
  b=AQpkOMzwCbbSizXsrPVAfxkSoPk/svlT1/Mnb7u4ZpEfdvfd3bCPowzb
   SUuYwqnagNDO64J4LsmZoG10YR3isbZMsVftedptiJBx9BhRgcO83PiKP
   t4wTq6CpIcQujM0pc/ERh7Y6wFZDRWcsXfb+hLn/KSrXEPdS95hkgqB//
   wYSHkYCw6FujMZKFFc04xrK8uqNvzqBKNj6sbJqD8fJu/Ydj5k8+C4BBg
   TpSJRr/YVIdMtRT5Afg2p+PH885vrgIPWv5I9gZpEy8ytColMM0yjIvNu
   Ohjcb8Pb8rY0ydgYthJ24Lm9npAhjqaOewiO6tSD1AGLttUZOHRMKpwwO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="483165843"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="483165843"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 00:49:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="808774487"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="808774487"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2024 00:49:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKwwM-000LrY-1l;
	Wed, 03 Jan 2024 08:49:30 +0000
Date: Wed, 3 Jan 2024 16:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/6] accel/habanalabs/gaudi2: move HMMU page tables to
 device memory
Message-ID: <202401031652.SW1sPQ73-lkp@intel.com>
References: <20240102150654.522555-5-ogabbay@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102150654.522555-5-ogabbay@kernel.org>

Hi Oded,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-misc/drm-misc-next linus/master v6.7-rc8 next-20240103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oded-Gabbay/accel-habanalabs-gaudi2-add-interrupt-affinity-for-user-interrupts/20240102-231007
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20240102150654.522555-5-ogabbay%40kernel.org
patch subject: [PATCH 5/6] accel/habanalabs/gaudi2: move HMMU page tables to device memory
config: x86_64-randconfig-123-20240103 (https://download.01.org/0day-ci/archive/20240103/202401031652.SW1sPQ73-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401031652.SW1sPQ73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401031652.SW1sPQ73-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/habanalabs/gaudi2/gaudi2.c:2311:6: warning: no previous prototype for 'gaudi2_is_edma_queue_id' [-Wmissing-prototypes]
    2311 | bool gaudi2_is_edma_queue_id(u32 queue_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/habanalabs/gaudi2/gaudi2.c:2311:6: sparse: sparse: symbol 'gaudi2_is_edma_queue_id' was not declared. Should it be static?

vim +/gaudi2_is_edma_queue_id +2311 drivers/accel/habanalabs/gaudi2/gaudi2.c

  2310	
> 2311	bool gaudi2_is_edma_queue_id(u32 queue_id)
  2312	{
  2313	
  2314		switch (queue_id) {
  2315		case GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0...GAUDI2_QUEUE_ID_DCORE0_EDMA_1_3:
  2316		case GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0...GAUDI2_QUEUE_ID_DCORE1_EDMA_1_3:
  2317		case GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0...GAUDI2_QUEUE_ID_DCORE2_EDMA_1_3:
  2318		case GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0...GAUDI2_QUEUE_ID_DCORE3_EDMA_1_3:
  2319			return true;
  2320		default:
  2321			return false;
  2322		}
  2323	}
  2324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
