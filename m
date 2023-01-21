Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4242561
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674309387; x=1705845387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LkRbzJM3YhCcxKZNSVb59ShMEXO+X3FSZIT5rXO306M=;
  b=gl+psRPtQLnuoCQkUEt4zjPrr2bU+Lg50mPZrBiLhItsyxjN/wogaITD
   5n2q9PRRU+/b/jarcISiYJtIXG9p+xWihofFCss2U6f4B6KDuGEc2A9c+
   AsrP90o7lADXJ8xGeNzzmpZaFc9my9mp2Awi9DWZC95EMmV4NI38dy52R
   W9eT/hBuc8RXwNSbCWEDpYHjq2zvKJ6RiTBw68m8BJPsB909laNqmiHqg
   pEkrxJg025K0g5ieudT3z3oArHdDF+2mlC64GckFpwqWotdxcpRkJF+Rc
   VJB8hWcT4lDKsuIWSUxmFeGurkvfPTf0pqBe6unPoRqkbmwCodqiqKOny
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="313676030"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="313676030"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 05:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834742323"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="834742323"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Jan 2023 05:56:24 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJEM3-00048I-1u;
	Sat, 21 Jan 2023 13:56:23 +0000
Date: Sat, 21 Jan 2023 21:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@chromium.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chia-I Wu <olvaffe@gmail.com>
Subject: [linux-next:master 4530/6912] kismet: WARNING: unmet direct
 dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND when selected by
 DRM_MSM
Message-ID: <202301212110.oYohOWBT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d514392f17fd4d386cfadde7f849d97db4ca1fb0
commit: 6563f60f14cbb3dcbdc4e1d8469fc0fbaaa80544 [4530/6912] drm/msm/gpu: Add devfreq tuning debugfs
config: csky-kismet-CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND-CONFIG_DRM_MSM-0-0 (https://download.01.org/0day-ci/archive/20230121/202301212110.oYohOWBT-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6563f60f14cbb3dcbdc4e1d8469fc0fbaaa80544
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6563f60f14cbb3dcbdc4e1d8469fc0fbaaa80544
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND --selectors CONFIG_DRM_MSM -a=csky
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=csky olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND when selected by DRM_MSM
   
   WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
     Depends on [n]: PM_DEVFREQ [=n]
     Selected by [y]:
     - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=y] || QCOM_COMMAND_DB [=y]=n)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
