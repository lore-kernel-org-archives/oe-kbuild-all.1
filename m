Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C96116
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 14:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683641235; x=1715177235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FRtig0kLjAATP66RGEd0cQ+yL/wUNEXNEjDY53Sgycc=;
  b=XzK9Szvu5vOkI1FV6y0fa48GhahDp7YqdZd2qgs600mPvL0VZOkMtl/i
   0F/el0IZ6llWafu14ISDIMuRI1uTMYv1XjR4X4CTuJXPJflC88Pn+THYO
   WSFPvSeNEkbL/lrKuEVuePEofUnekPTw4LbJZwK3bUE+1FsTwCcQ2ej/6
   Chs4fXTjaL4LaAzxCI2Lyv/aQFszZvZhLEKZerX3Jy/YPrgCinT6XgOM7
   DFyQuM9UD0fuDSmq6zpoxuaG9et3tOn1EuJH+Q3gdrCgI73TPSAdfYmcF
   uMqwMPHidnDEAOgfxpYAlRnP91jYbQnRv1oO+oy64hJIbzAGSFHReTjeM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="347397533"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="347397533"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 07:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="649343928"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="649343928"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 May 2023 07:06:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwNzM-0002C1-1N;
	Tue, 09 May 2023 14:06:48 +0000
Date: Tue, 9 May 2023 22:06:13 +0800
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
Subject: Re: [PATCH V6 2/3] soc: qcom: boot_stat: Add Driver Support for Boot
 Stats
Message-ID: <202305092107.0Wy1eeCn-lkp@intel.com>
References: <35863b47c04c2edd7ae49c57d23682aba6111d4f.1683628357.git.quic_schowdhu@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35863b47c04c2edd7ae49c57d23682aba6111d4f.1683628357.git.quic_schowdhu@quicinc.com>

Hi Souradeep,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next linus/master v6.4-rc1 next-20230509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Souradeep-Chowdhury/dt-bindings-sram-qcom-imem-Add-Boot-Stat-region-within-IMEM/20230509-185332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/35863b47c04c2edd7ae49c57d23682aba6111d4f.1683628357.git.quic_schowdhu%40quicinc.com
patch subject: [PATCH V6 2/3] soc: qcom: boot_stat: Add Driver Support for Boot Stats
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230509/202305092107.0Wy1eeCn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7883e99da179c8b49f6834b84a91259b03679e56
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Souradeep-Chowdhury/dt-bindings-sram-qcom-imem-Add-Boot-Stat-region-within-IMEM/20230509-185332
        git checkout 7883e99da179c8b49f6834b84a91259b03679e56
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/soc/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305092107.0Wy1eeCn-lkp@intel.com/

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
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
