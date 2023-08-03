Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E3E7E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 09:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691055082; x=1722591082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BsJzHBdB/VQN254xR1iw2RvsjTkb6P4zw6vsIrJNMgE=;
  b=U3l8LSV1bb2etdmyGsXobrxWtrLBRiLmd+lR7wBeBiSovSrx3Y96pq1q
   DOWS5uwrP/6pGr5lvMftiXZZne+6qRG/EIQzmjo4FLg/oE2ADUY52OS/j
   grXnQ4FWCIZ3ODAGEIz6g166s5cdtOFhRSzKvd/SKfkepB1QmgQ/45CIS
   JLQmY1bi9FnRWvnxQH7Oq1NzxePu8XyP9uCUqBWeyI39FGx6UoKAnwSq5
   KmQrqhdKGsPb+RBmOsMe3rucbV2JYP4XzP2qNgKk5WdCumwhCaVB4dnqY
   UQP8U3C1yYxNv4RcwYBZNm5FNW55+YNZ4iAsijIhvvXbDiEMlJNKcXSak
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367280161"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="367280161"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 02:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="843519885"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="843519885"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2023 02:30:17 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRUeu-0001zn-1V;
	Thu, 03 Aug 2023 09:30:16 +0000
Date: Thu, 3 Aug 2023 17:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm: bridge: dw_hdmi: Add cec suspend/resume functions
Message-ID: <202308031730.j2kC4pU9-lkp@intel.com>
References: <20230721124415.1513223-1-Sandor.yu@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721124415.1513223-1-Sandor.yu@nxp.com>

Hi Sandor,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.5-rc4 next-20230803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sandor-Yu/drm-bridge-dw_hdmi-Add-cec-suspend-resume-functions/20230721-204732
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230721124415.1513223-1-Sandor.yu%40nxp.com
patch subject: [PATCH] drm: bridge: dw_hdmi: Add cec suspend/resume functions
config: riscv-randconfig-m031-20230730 (https://download.01.org/0day-ci/archive/20230803/202308031730.j2kC4pU9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031730.j2kC4pU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031730.j2kC4pU9-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c:332 dw_hdmi_cec_suspend() warn: inconsistent indenting

vim +332 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c

   326	
   327	static int __maybe_unused dw_hdmi_cec_suspend(struct device *dev)
   328	{
   329		struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
   330	
   331		/* store interrupt status/mask registers */
 > 332		 cec->regs_polarity = dw_hdmi_read(cec, HDMI_CEC_POLARITY);
   333		 cec->regs_mask = dw_hdmi_read(cec, HDMI_CEC_MASK);
   334		 cec->regs_mute_stat0 = dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0);
   335	
   336		return 0;
   337	}
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
