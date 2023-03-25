Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F015C2F2A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Mar 2023 16:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679761030; x=1711297030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vrcn0rGVgrXIQf6tSvf4FE1wbGH838j2OtTvkbDyXDw=;
  b=FzcmW4q+Gfmp+iGjQiU34wtfqLnS3vovFCvSLrD0YO/BKDv/huv01vQ2
   84ByNc2jjur+T/YASzE7aMfFqEu9B55SlznVEsHS/3+vy0pMT14M5GwQX
   3Fdxu+DnvDNWth9ZQQ78qcrkoKbkiruNJncVxPMeqs2FhVA4X/3lEpG5s
   Oh9U5NRxW9wQwOBm6r6Kux4yFPDYIt87IQK3NGa6mKPGX1KIcY62oJWOY
   DompPOxc2VrLtVqXj00SexdfxLzTLLSV2aSoUxZ8A5qdL5bzK03rcMNdw
   +CrTOVn7nHR3iQhjkf6l8uZ++peMUx9gGA5eIxGUmKCrJCQFfjlEczsGc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="404914158"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="404914158"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 09:17:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="685520387"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="685520387"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Mar 2023 09:17:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pg6Zn-000GNO-0v;
	Sat, 25 Mar 2023 16:17:07 +0000
Date: Sun, 26 Mar 2023 00:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dylan Van Assche <me@dylanvanassche.be>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Dylan Van Assche <me@dylanvanassche.be>
Subject: Re: [PATCH 2/4] dts: arm64: qcom: sdm845: add SLPI FastRPC support
Message-ID: <202303260005.DW8hkIxU-lkp@intel.com>
References: <20230325135114.21688-3-me@dylanvanassche.be>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325135114.21688-3-me@dylanvanassche.be>

Hi Dylan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.3-rc3 next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dylan-Van-Assche/dts-arm64-qcom-sdm845-add-SLPI-remoteproc/20230325-215354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230325135114.21688-3-me%40dylanvanassche.be
patch subject: [PATCH 2/4] dts: arm64: qcom: sdm845: add SLPI FastRPC support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230326/202303260005.DW8hkIxU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/df03f51210d03566bf0d35a56633d55e3c57b5ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dylan-Van-Assche/dts-arm64-qcom-sdm845-add-SLPI-remoteproc/20230325-215354
        git checkout df03f51210d03566bf0d35a56633d55e3c57b5ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303260005.DW8hkIxU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/sdm845.dtsi:3360.4-5 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
