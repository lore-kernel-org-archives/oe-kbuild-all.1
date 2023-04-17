Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74059848E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 18:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681754586; x=1713290586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NiywolP3IeUIa8VfpIaUT5vTVN52GkeINXKV5c29gCM=;
  b=YPMZLyJwFIeYu0so3eVup4eky2T7JZLGMDIvh2HP+2nnH0wS7DiLL/fr
   HU3qO9VHh2MsVFSMujHUetokPlHWSkGaXRap2wDy4JLMmpMtYt9pCXoiZ
   zSq+Be9eMBTAwGJMLwYyxzD3bGYNWjCl0kRzWWtgh5qasS/phupyfl7no
   PYoaVlRBCvYIn1m6S4HiDnqwE1ZOqwtXtRK1RgOxgY+4epRopuKP6pmyU
   vGOIRVrKv8dms6TDQ3f32quofI5+xYhzBunc0UHELY7Cm4eu7/U+sa8QH
   lbCHxNI369ADn1OmgVN/mimApX7htnQQ3Ls09Ap9QVCZtmuy2oc+dtVoN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="372844406"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="372844406"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 11:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="865078950"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="865078950"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Apr 2023 11:03:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poTBs-000ccB-2O;
	Mon, 17 Apr 2023 18:03:00 +0000
Date: Tue, 18 Apr 2023 02:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Subject: Re: [PATCH V4 2/3] soc: qcom: boot_stat: Add Driver Support for Boot
 Stats
Message-ID: <202304180101.Wxf2Jbjq-lkp@intel.com>
References: <2ef76ce292c059c144e559123a9a54201ae2d0cf.1681742910.git.quic_schowdhu@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ef76ce292c059c144e559123a9a54201ae2d0cf.1681742910.git.quic_schowdhu@quicinc.com>

Hi Souradeep,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Souradeep-Chowdhury/dt-bindings-sram-qcom-imem-Add-Boot-Stat-region-within-IMEM/20230417-231510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/2ef76ce292c059c144e559123a9a54201ae2d0cf.1681742910.git.quic_schowdhu%40quicinc.com
patch subject: [PATCH V4 2/3] soc: qcom: boot_stat: Add Driver Support for Boot Stats
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230418/202304180101.Wxf2Jbjq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c8808184261e004f0b258e469415e4eea9c5ad9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Souradeep-Chowdhury/dt-bindings-sram-qcom-imem-Add-Boot-Stat-region-within-IMEM/20230417-231510
        git checkout 4c8808184261e004f0b258e469415e4eea9c5ad9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/soc/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180101.Wxf2Jbjq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/qcom/boot_stats.c:76:6: warning: no previous prototype for 'boot_stats_remove' [-Wmissing-prototypes]
      76 | void boot_stats_remove(struct platform_device *pdev)
         |      ^~~~~~~~~~~~~~~~~


vim +/boot_stats_remove +76 drivers/soc/qcom/boot_stats.c

    75	
  > 76	void boot_stats_remove(struct platform_device *pdev)
    77	{
    78		struct bs_data *drvdata = platform_get_drvdata(pdev);
    79	
    80		debugfs_remove_recursive(drvdata->dbg_dir);
    81		iounmap(drvdata->b_stats);
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
