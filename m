Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E967A1A708
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfeKpXL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704294499; x=1735830499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o8skylzCL/sYU0R4KRJQ2VgT5LMpCDubjGV11/oZBk0=;
  b=VfeKpXL0HP4gG1ftG/fbvV20Y2w/zhVT/gBF6oLEsXQOEcBs37Aw88Ve
   gEjnHaFz4ME6oy1mXXyoUGHTG+jXKpaf3lOdKfWxaJzmI0Z8RD0oO04T7
   6DkAQPSJv+092vSnuUP+YTdW0hVOfhg/lUAIi6uqwT7uctJhu7V/UWyA2
   Dk+Cmmf/H1w2T/uyd0OMChbIJloXESbN8t/2d16Uvv2OGZG0X4FDfLo13
   1Kb1V5ZzDHJsSF0TrHcOMO0sofUMTkEWVUOZTBsNLzdeh5AVi1uqNRdD9
   thWxjH/f/7verwn8HCLAJ2KbWghDCjj6MAwxWdtmr+0fxHy6N7r6rjxrJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="400831524"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="400831524"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 07:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="814283834"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="814283834"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Jan 2024 07:08:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL2qs-000MCV-1I;
	Wed, 03 Jan 2024 15:08:14 +0000
Date: Wed, 3 Jan 2024 23:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/6] accel/habanalabs/gaudi2: add interrupt affinity for
 user interrupts
Message-ID: <202401032248.pehaQ8sz-lkp@intel.com>
References: <20240102150654.522555-2-ogabbay@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102150654.522555-2-ogabbay@kernel.org>

Hi Oded,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on linus/master v6.7-rc8]
[cannot apply to drm-misc/drm-misc-next next-20240103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oded-Gabbay/accel-habanalabs-gaudi2-add-interrupt-affinity-for-user-interrupts/20240102-231007
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20240102150654.522555-2-ogabbay%40kernel.org
patch subject: [PATCH 2/6] accel/habanalabs/gaudi2: add interrupt affinity for user interrupts
config: x86_64-randconfig-121-20240103 (https://download.01.org/0day-ci/archive/20240103/202401032248.pehaQ8sz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401032248.pehaQ8sz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401032248.pehaQ8sz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/habanalabs/common/device.c: In function 'hl_init_cpu_for_irq':
>> drivers/accel/habanalabs/common/device.c:2814:40: error: 'struct device' has no member named 'numa_node'
    2814 |         int numa_node = hdev->pdev->dev.numa_node, i;
         |                                        ^


vim +2814 drivers/accel/habanalabs/common/device.c

  2810	
  2811	void hl_init_cpu_for_irq(struct hl_device *hdev)
  2812	{
  2813		struct cpumask *available_mask = &hdev->irq_affinity_mask;
> 2814		int numa_node = hdev->pdev->dev.numa_node, i;
  2815		static struct cpumask cpu_mask;
  2816	
  2817		if (numa_node < 0)
  2818			return;
  2819	
  2820		if (!cpumask_and(&cpu_mask, cpumask_of_node(numa_node), cpu_online_mask)) {
  2821			dev_err(hdev->dev, "No available affinities in current numa node\n");
  2822			return;
  2823		}
  2824	
  2825		/* Remove HT siblings */
  2826		for_each_cpu(i, &cpu_mask)
  2827			cpumask_set_cpu(cpumask_first(topology_sibling_cpumask(i)), available_mask);
  2828	}
  2829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
