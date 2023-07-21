Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FEC1ED44
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 23:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689981337; x=1721517337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hbGF2N14W1Y8K9NgRN0jqsTdkTp75B7W9ZI/RXWPG3w=;
  b=nUqt8DVjpjalNK+mjVYUpK37icTr95SWWGEp0ZB/4lJEXbVljl9IizDh
   Sz2QokPfNU6QF8dfyaW6bypjNYmvH2+37PLgUsEXvzRv5uLF7EfsHJxtO
   m5kFDQ2I9rbSrd3sRkiRIwQyggh3HBbnQPH+TnD8pY2vL14cOeNAm9f2K
   n99pfVC50uHINZLVr8CirVaA/V4zt1qlWyyqqSlb1fhRpwhHg194vSiy8
   yAZn5HoeXJC5YX3Uk4niDDVM+aktUByJ56yl7J/IGY+BVoQkxLLyD2Oxp
   s4/62tA/9vh6C/6rDoXQTUkPfOW4Z/3DmJAHe7IntKRn7LP+mkYuuWEpQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346737638"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="346737638"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 16:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="754654503"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="754654503"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Jul 2023 16:15:29 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMzLM-0007kK-1O;
	Fri, 21 Jul 2023 23:15:28 +0000
Date: Sat, 22 Jul 2023 07:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kathiravan T <quic_kathirav@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
	quic_sjaganat@quicinc.com, quic_anusha@quicinc.com,
	quic_saahtoma@quicinc.com,
	Poovendhan Selvaraj <quic_poovendh@quicinc.com>,
	Kathiravan T <quic_kathirav@quicinc.com>
Subject: Re: [PATCH V5 3/3] firmware: scm: Modify only the download bits in
 TCSR register
Message-ID: <202307220736.M9yPz2Cs-lkp@intel.com>
References: <20230720070408.1093698-4-quic_kathirav@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720070408.1093698-4-quic_kathirav@quicinc.com>

Hi Kathiravan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.5-rc2 next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kathiravan-T/firmware-qcom_scm-provide-a-read-modify-write-function/20230720-150657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20230720070408.1093698-4-quic_kathirav%40quicinc.com
patch subject: [PATCH V5 3/3] firmware: scm: Modify only the download bits in TCSR register
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230722/202307220736.M9yPz2Cs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220736.M9yPz2Cs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220736.M9yPz2Cs-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/qcom_scm.c: In function 'qcom_scm_set_download_mode':
>> drivers/firmware/qcom_scm.c:459:48: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     459 |                                                FIELD_PREP(QCOM_DOWNLOAD_MODE_MASK, val));
         |                                                ^~~~~~~~~~
   cc1: some warnings being treated as errors

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


vim +/FIELD_PREP +459 drivers/firmware/qcom_scm.c

   443	
   444	static void qcom_scm_set_download_mode(bool enable)
   445	{
   446		bool avail;
   447		int val;
   448		int ret = 0;
   449	
   450		avail = __qcom_scm_is_call_available(__scm->dev,
   451						     QCOM_SCM_SVC_BOOT,
   452						     QCOM_SCM_BOOT_SET_DLOAD_MODE);
   453		if (avail) {
   454			ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
   455		} else if (__scm->dload_mode_addr) {
   456			val = enable ? QCOM_DOWNLOAD_FULLDUMP : QCOM_DOWNLOAD_NODUMP;
   457			ret = qcom_scm_io_update_field(__scm->dload_mode_addr,
   458						       QCOM_DOWNLOAD_MODE_MASK,
 > 459						       FIELD_PREP(QCOM_DOWNLOAD_MODE_MASK, val));
   460		} else {
   461			dev_err(__scm->dev,
   462				"No available mechanism for setting download mode\n");
   463		}
   464	
   465		if (ret)
   466			dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
   467	}
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
