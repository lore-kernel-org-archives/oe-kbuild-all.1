Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E5134B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 11:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689764738; x=1721300738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lqPMmv8M10HlNolBgp653qSVYTh89TergptkrLWqzYo=;
  b=i9tUlGalAqacHyp2H/7ZKd/1KmvGyDB4jzSEejEgvitQzlr1m6SyQND9
   6XsIHfcN1owrBhC6wZlhhTL2r9gz4AuFwMXsNvcOqto/Lhdb8HtdOiBhl
   ZJ76xfypRdJqCT06FL10EvudnId9QRuAPy+zknn4wPDmI3a/9ZCthDy4k
   xEg3yt18GLRbBrM6u8sPYZhp37RrmbWkGd4LLyAILn98IUnEHVttKPJrj
   cZ6n0klN8uE3/XldmiG5Y7Z5iB0QTy7EW0WBvl1WlKwBNz8OGhoS932eD
   c0PszmX1c114ifPGVKksIG2IGwPMKyVHyHRfq7Zrt3Gj8jYid/d/vgEYK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="346023051"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="346023051"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 04:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="867422501"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2023 04:05:15 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM4zX-0004hf-2P;
	Wed, 19 Jul 2023 11:05:12 +0000
Date: Wed, 19 Jul 2023 19:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org,
	mathieu.poirier@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, quic_eberman@quicinc.com,
	kvalo@kernel.org, loic.poulain@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
	quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
	quic_anusha@quicinc.com
Subject: Re: [V3,09/11] remoteproc: qcom: Add Hexagon based multipd rproc
 driver
Message-ID: <202307191844.WyywUs6s-lkp@intel.com>
References: <20230718120501.3205661-10-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718120501.3205661-10-quic_mmanikan@quicinc.com>

Hi Manikanta,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230718]
[also build test WARNING on v6.5-rc2]
[cannot apply to remoteproc/rproc-next clk/clk-next robh/for-next linus/master v6.5-rc2 v6.5-rc1 v6.4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Mylavarapu/dt-bindings-remoteproc-qcom-Add-support-for-multipd-model/20230718-202747
base:   next-20230718
patch link:    https://lore.kernel.org/r/20230718120501.3205661-10-quic_mmanikan%40quicinc.com
patch subject: [V3,09/11] remoteproc: qcom: Add Hexagon based multipd rproc driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230719/202307191844.WyywUs6s-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191844.WyywUs6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191844.WyywUs6s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/qcom_q6v5_mpd.c:112:4: warning: no previous prototype for 'qcom_get_pd_asid' [-Wmissing-prototypes]
     112 | u8 qcom_get_pd_asid(struct rproc *rproc)
         |    ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SM_GCC_8350
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_VIDEOCC_8350 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8450
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8550
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]


vim +/qcom_get_pd_asid +112 drivers/remoteproc/qcom_q6v5_mpd.c

   105	
   106	/**
   107	 * qcom_get_pd_asid() - get the pd asid number from PD spawn bit
   108	 * @rproc:	rproc handle
   109	 *
   110	 * Returns asid on success
   111	 */
 > 112	u8 qcom_get_pd_asid(struct rproc *rproc)
   113	{
   114		struct q6_wcss *wcss = rproc->priv;
   115		u8 bit = wcss->q6.spawn_bit;
   116	
   117		return bit / 8;
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
