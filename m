Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09023392
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 02:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692930707; x=1724466707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9UAyYVo8GcwbrXP5ALpyboyLmrzRKu/CBuKr6JfZHw=;
  b=CfLd7vhHr+BVgLbO/ZqjcW/HRK6u4mtvI+e9CcMf2HvAQBAk7c/ia1Re
   G6vZYmD9p+gvNY3fXUiym956Va1dE90sXzVdTKrPKZEGsjMmv7Ibd7bqj
   ca1MeCXODz5OfFTEShaluldkqdV5pXFGwWcQhkwDugMeBo88qKiWFs0ab
   8c8jGa/HSd/5T6H6KqOZYIUO8zYORDpjwRi9/y2eIvUbbOEbrbGfiBr0z
   zkHLNWgNVN2NmRB7N+V6TICCkZBQCtg1InYB8E0zaddhpqnrSxITaxMf0
   yQGBbhBqnCz0U/d8G0eXXBBuV4gwq8c7BDWkLjVgXqAASd0raYBLgoXpO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="373485912"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="373485912"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 19:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827418677"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="827418677"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2023 19:31:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZMbr-00038z-00;
	Fri, 25 Aug 2023 02:31:39 +0000
Date: Fri, 25 Aug 2023 10:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.5-rc7 64/129]
 drivers/firmware/qcom_qseecom_uefisecapp.c:172: warning: Function parameter
 or member 'guid_offset' not described in 'qsee_rsp_uefi_get_next_variable'
Message-ID: <202308251028.BnSdu23P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.5-rc7
head:   68f425346397c1806f828d4ee58e9468c924f408
commit: e54a5193d61abc174dff575a57c7530d0b62863f [64/129] firmware: Add support for Qualcomm UEFI Secure Application
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230825/202308251028.BnSdu23P-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251028.BnSdu23P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251028.BnSdu23P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/qcom_qseecom_uefisecapp.c:172: warning: Function parameter or member 'guid_offset' not described in 'qsee_rsp_uefi_get_next_variable'


vim +172 drivers/firmware/qcom_qseecom_uefisecapp.c

   149	
   150	/**
   151	 * struct qsee_rsp_uefi_get_next_variable - Response for the
   152	 * GetNextVariableName command.
   153	 * @command_id:  The ID of the command. Should be
   154	 *               %QSEE_CMD_UEFI_GET_NEXT_VARIABLE.
   155	 * @length:      Length of the response in bytes, including this struct and any
   156	 *               parameters (name, GUID) stored after it as well as any padding
   157	 *               thereof for alignment.
   158	 * @status:      Status of this command.
   159	 * @guid_size:   Size of the GUID parameter in bytes, i.e. sizeof(efi_guid_t).
   160	 * @name_offset: Offset from the start of this struct to where the variable
   161	 *               name is stored (as utf-16 string), in bytes.
   162	 * @name_size:   Size of the name parameter in bytes, including null-terminator.
   163	 */
   164	struct qsee_rsp_uefi_get_next_variable {
   165		u32 command_id;
   166		u32 length;
   167		u32 status;
   168		u32 guid_offset;
   169		u32 guid_size;
   170		u32 name_offset;
   171		u32 name_size;
 > 172	} __packed;
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
