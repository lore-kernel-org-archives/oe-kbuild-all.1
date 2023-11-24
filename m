Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8172EAED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Te8NTfpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700839437; x=1732375437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hjHUasbUvdZyid1X5HvgmpQL0hPNRyInjUAbKjnNwBA=;
  b=Te8NTfpy9dUd5NuWWduejKS+3HofNnoDl4b9ofMC1EkdLwPCONHxNYzE
   /zVVZaAZsY3FJ8c0hmb34UE26AdFY5YLqU5u/fIn29C0FngvdJwsA/h9p
   sjIt2GxBHXIrNPrh1uvJ/+mTgOs+aC8wMZoCpqulsOUngEvJwRVeRDJlB
   3DCK/BtwULnH4EnjMJ1+0mVX8/Ab/8Ec6m7NlROT8S7pjAkmKIEvrsiqC
   mJHfkmLcRvFOR+E3B86JVJ7nQeiVFQhi67mx2Zz22rJ1vdxGUFCuGA/NB
   P0cg7qCfLFWhuacev5jpMebVFSXlrc0IbpGwWRN9CoALlutaFS4iLivHb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="456781782"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="456781782"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:23:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1014935597"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="1014935597"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 07:23:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Y20-0002wK-0N;
	Fri, 24 Nov 2023 15:23:48 +0000
Date: Fri, 24 Nov 2023 23:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH net-next v3 2/3] arm64: dts: qcom: sa8775p: enable Fault
 IRQ
Message-ID: <202311241629.yh1clHno-lkp@intel.com>
References: <66690488f08912698301a2c203d7c562798806a2.1700737841.git.quic_jsuraj@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66690488f08912698301a2c203d7c562798806a2.1700737841.git.quic_jsuraj@quicinc.com>

Hi Suraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Jaiswal/dt-bindings-net-qcom-ethqos-add-binding-doc-for-fault-IRQ-for-sa8775p/20231123-202252
base:   net-next/main
patch link:    https://lore.kernel.org/r/66690488f08912698301a2c203d7c562798806a2.1700737841.git.quic_jsuraj%40quicinc.com
patch subject: [PATCH net-next v3 2/3] arm64: dts: qcom: sa8775p: enable Fault IRQ
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231124/202311241629.yh1clHno-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241629.yh1clHno-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241629.yh1clHno-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/sa8775p.dtsi:2344.10-11 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
