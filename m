Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCDB376
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 04:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675051367; x=1706587367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uWRBDX06yfsvaLDQqXqjxqoiHRKTeZYlGFtkHLtLP9Y=;
  b=K8+/jz2ogpuhlBZRMTKHpH4X1Pr/pYI0tkfUd/RK9V4aRHCxtmfPnP1x
   mhROp1g66aG2QsVutnqPRhuMXuKfolwo8fMbtqSdwthK+vOdZRxvEGDHU
   031X0+p4066Bail7eZtqhjM2x++mGuyp3+zs37dPQ/ZVu0Xd7emQTrtz8
   PVtP0nIFIw1ZVugX+dHxpjjszn8Q+JK/UsFKtWtZ2enCmvat5R5GT7dcX
   aDzXkZzVAUDc+8WuuszNcZLF/PIa2+adNmdZy64Ir9IE9e6B4zsXNOtE9
   g7WQRZs7oADFZtOFaeoPvQddjIOg96nA1ISRc6HKMi6LiKRnyT1/RXfRw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="328746244"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="328746244"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 20:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="696264357"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="696264357"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Jan 2023 20:02:45 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMLNU-0003MA-1y;
	Mon, 30 Jan 2023 04:02:44 +0000
Date: Mon, 30 Jan 2023 12:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Venkata Prasad Potturu <quic_potturu@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: sound/soc/qcom/lpass-sc7280.c:419:34: warning:
 'sc7280_lpass_cpu_device_id' defined but not used
Message-ID: <202301301221.zDFityoS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d796c50f84ca79f1722bb131799e5a5710c4700
commit: b62c4e5fba2f910bc9f23ae152d11627e4c2f00f ASoC: qcom: lpass-sc7280: Add platform driver for lpass audio
date:   11 months ago
config: x86_64-buildonly-randconfig-r001-20230130 (https://download.01.org/0day-ci/archive/20230130/202301301221.zDFityoS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b62c4e5fba2f910bc9f23ae152d11627e4c2f00f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b62c4e5fba2f910bc9f23ae152d11627e4c2f00f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
