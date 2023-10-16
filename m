Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A517D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 02:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9J0RgWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697423683; x=1728959683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/r47gQmJh4ILT5TdjtJ8Po44vb4rux8n6laLq5vp7uY=;
  b=U9J0RgWmS5R/s7bOPKa54sobZz7GLGn3yFbwupG/jf69KHwl0PTh7y51
   Veeqa16XUIvxDa6LYItp0i75aqCX6sgafgazNCqspnIhosIAY6BGMdtKi
   Sf7PSNyY25DVXNdBOeK5N0tRRDPgEEBUverhJsnlg9KjJBNViHeYiekAA
   nxg4oETdg0TfZZJUKOiq341dA6EH6Hy2e9VzIb6gtmhcFIB7YWyui1Ks+
   kw4L4xWel8C18dqw6AL8kVj3wmTDpeI1aBJqSMbQRGVTj0enuoFD0cKWg
   12MwXs6IUFK7MSjB/xl+babJB4ksNjNhYkwVn14SI8ftvrTHxVkOYmWSk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389294277"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="389294277"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 19:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825832757"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="825832757"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2023 19:34:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsDRF-00081h-0C;
	Mon, 16 Oct 2023 02:34:37 +0000
Date: Mon, 16 Oct 2023 10:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Venkata Prasad Potturu <quic_potturu@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: sound/soc/qcom/lpass-sc7280.c:419:34: warning:
 'sc7280_lpass_cpu_device_id' defined but not used
Message-ID: <202310161030.CHFngnbd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Srinivasa,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58720809f52779dc0f08e53e54b014209d13eebb
commit: b62c4e5fba2f910bc9f23ae152d11627e4c2f00f ASoC: qcom: lpass-sc7280: Add platform driver for lpass audio
date:   1 year, 8 months ago
config: i386-buildonly-randconfig-002-20231016 (https://download.01.org/0day-ci/archive/20231016/202310161030.CHFngnbd-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310161030.CHFngnbd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161030.CHFngnbd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/lpass-sc7280.c:419:34: warning: 'sc7280_lpass_cpu_device_id' defined but not used [-Wunused-const-variable=]
     419 | static const struct of_device_id sc7280_lpass_cpu_device_id[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sc7280_lpass_cpu_device_id +419 sound/soc/qcom/lpass-sc7280.c

   418	
 > 419	static const struct of_device_id sc7280_lpass_cpu_device_id[] = {
   420		{.compatible = "qcom,sc7280-lpass-cpu", .data = &sc7280_data},
   421		{}
   422	};
   423	MODULE_DEVICE_TABLE(of, sc7280_lpass_cpu_device_id);
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
