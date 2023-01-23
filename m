Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355FEEA5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674484572; x=1706020572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=obLeg3qaEJbSiwFXem2fQTQ/H+xe52OkSBbUedgp+pc=;
  b=MgUOTnneyw8a9ohpJsKu9PoGzY6LwfsIc0VuyytGqjFO9bGjyVhFQdVk
   sUfLZ+MF2pQ9rf2gqS0dHmAPhAQjS0cVHxRz6Z5iFYulARxquVn6Qyjio
   16w+N6pciuhszIKo4MPgwoBtSMCbqQvi0ro72iuVuOQv8ck5eQwYtnCDL
   IdkXeWuvoGJeCgMyrmhxhW7DyKPwydHMh1mY2VQpqnA3Y/QMeO1xpA4rQ
   dmMveevZoDTnW6ay6nYPbCWa0yAJOq7VxaoauklUghnF8fMxCgI5wq/d6
   Hyj9iooCAfwnYzqDbisskGlZBKlldZbRaCs6ts6AshQKLajhvDkFg0zaC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="412278740"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="412278740"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:36:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="769841804"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="769841804"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2023 06:36:10 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJxvd-0005hM-2f;
	Mon, 23 Jan 2023 14:36:09 +0000
Date: Mon, 23 Jan 2023 22:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] clk: qcom: add compile test to MSM8996 CPU clocks
Message-ID: <202301232241.QhBjKpMk-lkp@intel.com>
References: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20230123]
[cannot apply to clk/clk-next v6.2-rc5 v6.2-rc4 v6.2-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/clk-qcom-restrict-drivers-per-ARM-ARM64/20230123-175058
patch link:    https://lore.kernel.org/r/20230123094925.54824-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 1/2] clk: qcom: add compile test to MSM8996 CPU clocks
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230123/202301232241.QhBjKpMk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d29037042801a8c1c53b9029a16d7a5a1cdd2bda
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/clk-qcom-restrict-drivers-per-ARM-ARM64/20230123-175058
        git checkout d29037042801a8c1c53b9029a16d7a5a1cdd2bda
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/clk/ drivers/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/kryo-l2-accessors.c:8:10: fatal error: asm/sysreg.h: No such file or directory
       8 | #include <asm/sysreg.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
--
   drivers/clk/qcom/clk-cpu-8996.c: In function 'qcom_cpu_clk_msm8996_acd_init':
>> drivers/clk/qcom/clk-cpu-8996.c:534:16: error: implicit declaration of function 'read_cpuid_mpidr' [-Werror=implicit-function-declaration]
     534 |         hwid = read_cpuid_mpidr();
         |                ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +8 drivers/soc/qcom/kryo-l2-accessors.c

6d0efeb14bbe23 Ilia Lin 2020-07-03  @8  #include <asm/sysreg.h>
6d0efeb14bbe23 Ilia Lin 2020-07-03   9  #include <soc/qcom/kryo-l2-accessors.h>
6d0efeb14bbe23 Ilia Lin 2020-07-03  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
