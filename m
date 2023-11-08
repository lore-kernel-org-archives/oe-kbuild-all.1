Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D17655
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 02:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5EOhYUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699410902; x=1730946902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lIQhC7POCcImWvUOeBOHOOcj+sBmsQejKlKpslScH84=;
  b=B5EOhYUVDl7RvKPgSXTl8LnrJVF7WaFFTZ0KaqjRbw0LW766ZSn10xlg
   eaK4Wrbdb1g87ETx5fK3NLKktpn+Ux5MwlSalMLDj9rrXPm4q5Hq5N7Q9
   qid8bjIYh/omZxMtrNBDNH+CPXJxfhNaKOHSdb7Mp1OPzon7oDpEPVsOS
   FCkxaN0Y2XuiaTkIGYpmWBt7qa/4vZhYbbtBxVdMWi5LrXhBe/0/eUdBh
   Tje85udLMuZCy5mxUVqbucFlozLRQMAt+sMbSscOlpwpaKjsvq7UOQNh4
   08ZLpPubKyC+s5wNU4SPMeroYxmkhqk5vTmXJamanW8PupzinipNwE/88
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="374716881"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="374716881"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 18:35:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="828822431"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="828822431"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Nov 2023 18:34:57 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0YP9-0007ZI-0E;
	Wed, 08 Nov 2023 02:34:55 +0000
Date: Wed, 8 Nov 2023 10:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mao Jinlong <quic_jinlmao@quicinc.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>
Subject: Re: [PATCH v1 1/2] coresight: Add remote etm support
Message-ID: <202311081053.fWRkXGH0-lkp@intel.com>
References: <20231107060939.13449-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107060939.13449-2-quic_jinlmao@quicinc.com>

Hi Mao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231107]
[cannot apply to robh/for-next linus/master v6.6 v6.6-rc7 v6.6-rc6 v6.6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/coresight-Add-remote-etm-support/20231107-141331
base:   next-20231107
patch link:    https://lore.kernel.org/r/20231107060939.13449-2-quic_jinlmao%40quicinc.com
patch subject: [PATCH v1 1/2] coresight: Add remote etm support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231108/202311081053.fWRkXGH0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081053.fWRkXGH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081053.fWRkXGH0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-remote-etm.c:312:12: warning: no previous prototype for 'remote_etm_init' [-Wmissing-prototypes]
     312 | int __init remote_etm_init(void)
         |            ^~~~~~~~~~~~~~~
>> drivers/hwtracing/coresight/coresight-remote-etm.c:318:13: warning: no previous prototype for 'remote_etm_exit' [-Wmissing-prototypes]
     318 | void __exit remote_etm_exit(void)
         |             ^~~~~~~~~~~~~~~


vim +/remote_etm_init +312 drivers/hwtracing/coresight/coresight-remote-etm.c

   311	
 > 312	int __init remote_etm_init(void)
   313	{
   314		return platform_driver_register(&remote_etm_driver);
   315	}
   316	module_init(remote_etm_init);
   317	
 > 318	void __exit remote_etm_exit(void)
   319	{
   320		platform_driver_unregister(&remote_etm_driver);
   321	}
   322	module_exit(remote_etm_exit);
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
