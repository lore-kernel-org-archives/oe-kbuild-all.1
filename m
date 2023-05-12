Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E72423D6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 19:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683920401; x=1715456401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oYw5r8hR87hJDnq03J6dMbdqVbJIN5U3WktNqH4vWlA=;
  b=fwY8rYGw5mUex14Op+od/0RBv7RWkeq1usz4GfIN2CXGTDDMAOofLJEO
   /qMsv0NrcKqNi14gv+Bv18YKEfkU84w+i7EQORzVnu44ePBP8DMmSo8VH
   CoOb/KssNXRkInvoqSIkLzolaD5iVNN1OecwYovnPSRAtaGmBfRGhrL8d
   xp5KFQH13rUH94FUIV30NGp+HOSXhP7xm1/Sf9WKoirggg/u7gnzNkzdu
   oJDOPQdIs3VG8dt5tewcU46cs8QcUcW6thHHDwPI1XLaawJxdigTVzXNO
   /dBMPB8iU6084WHCVLeGR+2b0a4pXMFYIgZxggjADRVDnYQjhlGXIpr5/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335394072"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335394072"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 12:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="694351039"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="694351039"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 May 2023 12:39:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxYcM-00054W-2Q;
	Fri, 12 May 2023 19:39:54 +0000
Date: Sat, 13 May 2023 03:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: Komal Bajaj <quic_kbajaj@quicinc.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Komal Bajaj <quic_kbajaj@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 06/10] soc: qcom: Add LLCC support for multi channel
 DDR
Message-ID: <202305130308.9zOC4OZC-lkp@intel.com>
References: <20230512122134.24339-7-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512122134.24339-7-quic_kbajaj@quicinc.com>

Hi Komal,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.4-rc1 next-20230512]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Komal-Bajaj/nvmem-qfprom-Add-support-for-secure-reading/20230512-202430
base:   linus/master
patch link:    https://lore.kernel.org/r/20230512122134.24339-7-quic_kbajaj%40quicinc.com
patch subject: [PATCH v3 06/10] soc: qcom: Add LLCC support for multi channel DDR
config: nios2-buildonly-randconfig-r001-20230509 (https://download.01.org/0day-ci/archive/20230513/202305130308.9zOC4OZC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/52808ee1c4720767ab330b371d356ffbd8fe7235
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Komal-Bajaj/nvmem-qfprom-Add-support-for-secure-reading/20230512-202430
        git checkout 52808ee1c4720767ab330b371d356ffbd8fe7235
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/soc/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130308.9zOC4OZC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/qcom/llcc-qcom.c: In function 'qcom_llcc_get_cfg_index':
>> drivers/soc/qcom/llcc-qcom.c:951:15: error: implicit declaration of function 'nvmem_cell_read_u8'; did you mean 'nvmem_cell_read_u64'? [-Werror=implicit-function-declaration]
     951 |         ret = nvmem_cell_read_u8(&pdev->dev, "multi_chan_ddr", cfg_index);
         |               ^~~~~~~~~~~~~~~~~~
         |               nvmem_cell_read_u64
   cc1: some warnings being treated as errors


vim +951 drivers/soc/qcom/llcc-qcom.c

   946	
   947	static int qcom_llcc_get_cfg_index(struct platform_device *pdev, u8 *cfg_index)
   948	{
   949		int ret = 0;
   950	
 > 951		ret = nvmem_cell_read_u8(&pdev->dev, "multi_chan_ddr", cfg_index);
   952		if (ret == -ENOENT) {
   953			*cfg_index = 0;
   954			return 0;
   955		}
   956	
   957		return ret;
   958	}
   959	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
