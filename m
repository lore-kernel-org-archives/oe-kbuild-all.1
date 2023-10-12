Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA37C2B5C1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 23:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZZUQnVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697152987; x=1728688987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fYSG4sqWrIC/2C2Ao8u1hyYEpig6sxUSVbww+LIg5f0=;
  b=kZZUQnVGaLTT0B8XxvMJAnWcre981t0dswfuPfHupLn2TIBKfyuiPgTJ
   UG1EEJ+G5kDSuYTFSLLdmDo37f7/16qKnmKVVcUwo3KM6tYN4ATQ8e8YZ
   Eg9o3VkL+yXxoHZpBayuyhgzyZ1NDm+k1LTNhmnX6dHBP/TjsdVBsSByA
   /xApHg0CZNkSKUL09AKn7WKlX3igd4mh5kdI79XfDoeTvG4RV4LJjnKRw
   RxDKaeb66cg77JM6/tw1WV67BSm48G7MMZL3lMd9phyYdwIgsj+Vzo5Um
   egY67wLUZOT5pHbhEdXUDDdmVUbZ/ORzfPpZG2IR1Aa4oTEp0m25LOmCz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471299404"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="471299404"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 16:22:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928179846"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="928179846"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Oct 2023 16:22:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr50D-00042J-0v;
	Thu, 12 Oct 2023 23:22:01 +0000
Date: Fri, 13 Oct 2023 07:21:25 +0800
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
Subject: Re: [PATCH v3 11/15] firmware: qcom: qseecom: convert to using the
 TZ allocator
Message-ID: <202310130731.YHBtmaQU-lkp@intel.com>
References: <20231009153427.20951-12-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009153427.20951-12-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231009]
[cannot apply to arm64/for-next/core krzk-dt/for-next linus/master v6.6-rc5 v6.6-rc4 v6.6-rc3 v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/firmware-qcom-move-Qualcomm-code-into-its-own-directory/20231009-233826
base:   next-20231009
patch link:    https://lore.kernel.org/r/20231009153427.20951-12-brgl%40bgdev.pl
patch subject: [PATCH v3 11/15] firmware: qcom: qseecom: convert to using the TZ allocator
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310130731.YHBtmaQU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130731.YHBtmaQU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130731.YHBtmaQU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/qcom/qcom_qseecom_uefisecapp.c: In function 'qcom_uefisecapp_probe':
>> drivers/firmware/qcom/qcom_qseecom_uefisecapp.c:767:67: error: 'SZ_256K' undeclared (first use in this function)
     767 |         qcuefi->mempool = devm_qcom_tzmem_pool_new(&aux_dev->dev, SZ_256K);
         |                                                                   ^~~~~~~
   drivers/firmware/qcom/qcom_qseecom_uefisecapp.c:767:67: note: each undeclared identifier is reported only once for each function it appears in


vim +/SZ_256K +767 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c

   745	
   746	static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
   747					 const struct auxiliary_device_id *aux_dev_id)
   748	{
   749		struct qcuefi_client *qcuefi;
   750		int status;
   751	
   752		qcuefi = devm_kzalloc(&aux_dev->dev, sizeof(*qcuefi), GFP_KERNEL);
   753		if (!qcuefi)
   754			return -ENOMEM;
   755	
   756		qcuefi->client = container_of(aux_dev, struct qseecom_client, aux_dev);
   757	
   758		auxiliary_set_drvdata(aux_dev, qcuefi);
   759		status = qcuefi_set_reference(qcuefi);
   760		if (status)
   761			return status;
   762	
   763		status = efivars_register(&qcuefi->efivars, &qcom_efivar_ops);
   764		if (status)
   765			qcuefi_set_reference(NULL);
   766	
 > 767		qcuefi->mempool = devm_qcom_tzmem_pool_new(&aux_dev->dev, SZ_256K);
   768		if (IS_ERR(qcuefi->mempool))
   769			return PTR_ERR(qcuefi->mempool);
   770	
   771		return status;
   772	}
   773	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
