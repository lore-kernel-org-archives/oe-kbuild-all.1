Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4EC10EC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 05:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693287808; x=1724823808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=doP6dRVl8TIqv+BbaBA/DZ8wc0fnPygEh4IubS9nmKM=;
  b=Bq6QG/EOODXMmOlVXWADzGARD5KkQgkAIGE+aML7aFHBS+aFQJ32UVwC
   QR1OWeDoAaBla7eeW3oYnaqPcDeWMcR4bcLx1UiKOODh8Imn1dnzw21wL
   ChIpiqrXYSGfh0P6Cf76svp7A12heW8WxmCHfns2OO1ctFPvBV8y2KNam
   gzoXQ3Ie3TLZ/P+GcmD4jgRfEOI+Kd9Jn2q0uCfEnFduwBdeAUmRABT9i
   fquHQRsdsUYOK+lcW4cYlZKdq/LE0Sf18pjr+YubAcj0f0LlhWX+bwjY0
   LPN1w18Lxf/fWSq6VvmNhwYBVdEiovDnOYPtG01O/qdYou2s6ANDEmCVb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="374174106"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="374174106"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 22:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="985206308"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="985206308"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2023 22:43:21 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qarVZ-0008RX-0S;
	Tue, 29 Aug 2023 05:43:21 +0000
Date: Tue, 29 Aug 2023 13:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 07/11] firmware: qcom-scm: use SHM bridge if available
Message-ID: <202308291337.PSyslzRx-lkp@intel.com>
References: <20230828192507.117334-8-bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828192507.117334-8-bartosz.golaszewski@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm64/for-next/core linus/master v6.5]
[cannot apply to next-20230828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/firmware-qcom-scm-drop-unneeded-extern-specifiers/20230829-032930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230828192507.117334-8-bartosz.golaszewski%40linaro.org
patch subject: [PATCH 07/11] firmware: qcom-scm: use SHM bridge if available
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230829/202308291337.PSyslzRx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291337.PSyslzRx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291337.PSyslzRx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/firmware/qcom_scm-smc.o: in function `__scm_smc_call':
>> qcom_scm-smc.c:(.text+0x39c): undefined reference to `qcom_shm_bridge_free'
>> arm-linux-gnueabi-ld: qcom_scm-smc.c:(.text+0x3f0): undefined reference to `qcom_shm_bridge_alloc'
>> arm-linux-gnueabi-ld: qcom_scm-smc.c:(.text+0x53c): undefined reference to `qcom_shm_bridge_free'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
