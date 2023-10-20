Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDAF1D693
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 22:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eto8c462"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697842718; x=1729378718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aEPV/k3NY8uJOB/dkexMNXWNSU+79ekJlzkbVmpGyH0=;
  b=eto8c462cwbXuX89B3JduVFZqUHKJGzN124TRDZS9faBv47aLT0ZLiQ3
   XRi0F5zOQtRSfFxfN8dirK3kExw13FE7te7+uUQGQD7tMLKE5vZUpEeva
   nyCeS12aK9Tml+O5PfgB72nuUe+CofPy2G3DSfoT+/JtrGUjWK9h9E+wR
   05WV1YEcHmYgSl+DjJkzb0q2PeEauR+fbu89Rhj2Lg4VMgoU0fXKiMLuw
   046EY7D432xcjtyXVzuTHV0hJcfTSUIbVHM57ziZcxdfj54TWSmWis7py
   LURAnR6EgKhMNFZPltk1XsI6hvmpXZIwTWNb0xC+DAKEmaw/DNQYraUBG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="417720314"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="417720314"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 15:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="1088877862"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="1088877862"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Oct 2023 15:58:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtyRr-00044C-0v;
	Fri, 20 Oct 2023 22:58:31 +0000
Date: Sat, 21 Oct 2023 06:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v5 01/15] firmware: qcom: move Qualcomm code into its own
 directory
Message-ID: <202310210628.teHKnfqS-lkp@intel.com>
References: <20231017092732.19983-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017092732.19983-2-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231017]
[cannot apply to arm64/for-next/core krzk-dt/for-next linus/master v6.6-rc6 v6.6-rc5 v6.6-rc4 v6.6-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/firmware-qcom-move-Qualcomm-code-into-its-own-directory/20231017-173059
base:   next-20231017
patch link:    https://lore.kernel.org/r/20231017092732.19983-2-brgl%40bgdev.pl
patch subject: [PATCH v5 01/15] firmware: qcom: move Qualcomm code into its own directory
config: x86_64-buildonly-randconfig-003-20231021 (https://download.01.org/0day-ci/archive/20231021/202310210628.teHKnfqS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210628.teHKnfqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210628.teHKnfqS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/qcom/qcom_scm.c:1652:34: warning: 'qcom_scm_qseecom_allowlist' defined but not used [-Wunused-const-variable=]
    1652 | static const struct of_device_id qcom_scm_qseecom_allowlist[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/qcom_scm_qseecom_allowlist +1652 drivers/firmware/qcom/qcom_scm.c

00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1647  
00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1648  /*
00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1649   * We do not yet support re-entrant calls via the qseecom interface. To prevent
00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1650   + any potential issues with this, only allow validated machines for now.
00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1651   */
00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27 @1652  static const struct of_device_id qcom_scm_qseecom_allowlist[] = {
00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1653  	{ .compatible = "lenovo,thinkpad-x13s", },
00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1654  	{ }
00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1655  };
00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1656  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
