Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7A519F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679568091; x=1711104091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ECBo5nXzp7yKrrIvIT2vya4+rrfWKNQRNTuIco/UAY=;
  b=CCBCt7LDje8mstBWrZjLGynFFbJImQhsC5Dz44I3PTVqaeYLemExdwEx
   XFguR5HIvGkeniRr0SfywEqBVwN+bM8UjQVAzXrr4HQaY6qAIhEuvLbUC
   EjB7EBlxY7bdCIv3mqrU13I5LyQNHOnlP6/bcnZV7K6MR7uQEb4HWhLEg
   ApCiPVnXWXeGy1VFsW33lS8ELrIssDZREMkXdJCFrUbsxJpgUeXJRAxnb
   09VDFG+iTb89OjPIEJvKj9AY6XozrIT/lGA54t7l0yPLpNotMjACXwjwe
   2m3eVtA3cwhoGrqMJzNbAA+0r7aUif2LmuZyClfKd77AnNbNGhsPqLASF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319840814"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319840814"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 03:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746671508"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="746671508"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 03:41:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfINl-000EFo-1w;
	Thu, 23 Mar 2023 10:41:21 +0000
Date: Thu, 23 Mar 2023 18:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Kathiravan T <quic_kathirav@quicinc.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5332: add support for the
 RDP468 variant
Message-ID: <202303231817.8ZgIUk1u-lkp@intel.com>
References: <20230323044929.8694-3-quic_kathirav@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323044929.8694-3-quic_kathirav@quicinc.com>

Hi Kathiravan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20230322]
[cannot apply to robh/for-next v6.3-rc3 v6.3-rc2 v6.3-rc1 linus/master v6.3-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kathiravan-T/arm-qcom-document-MI01-6-board-based-on-IPQ5332-family/20230323-125035
patch link:    https://lore.kernel.org/r/20230323044929.8694-3-quic_kathirav%40quicinc.com
patch subject: [PATCH 2/2] arm64: dts: qcom: ipq5332: add support for the RDP468 variant
config: arm64-randconfig-s032-20230322 (https://download.01.org/0day-ci/archive/20230323/202303231817.8ZgIUk1u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/4ffc03616fd37a138e119e0e8ee38944b2f7d99d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kathiravan-T/arm-qcom-document-MI01-6-board-based-on-IPQ5332-family/20230323-125035
        git checkout 4ffc03616fd37a138e119e0e8ee38944b2f7d99d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231817.8ZgIUk1u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts:31.1-12 Label or path blsp1_spi0 not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
