Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C0C1FB5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 07:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677138725; x=1708674725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VhxGIRqNOmtycFujc2LEJ8M/k4RkVkWvNjtyDLnNXQI=;
  b=B7R+D8Qs64IlXcbPaUSJ1xQ8LTYA0dqmxddKEemWs9K5ErdiSoBnEekU
   got7mrL95lzmWUHyO5LtwaSlRXcIy2SBtc2K8T/eG2tWBFE2Ry0IU+tkV
   20wXBQAWkDUUlAc61m4d81c9N51oV3VW893ebmsVJK0c/MtO23Me5AhXt
   alzaUxOQlltIOFC3oWfqZOuTfdPIcKkhMmQshLQBZcv1uXSbRqIbCqDmu
   ZK1+o8GxFzqxtXGZeSWV5uRVmP9MGriDx371/seftvpTSHZ8wdop0NuhY
   EJ86c1xRtXSEhWmQ+tNoXHVPo5gjs5pmVcLODqqRv85SJc/mLyN3CUuAi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="360634855"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="360634855"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 23:52:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="741171845"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="741171845"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2023 23:51:52 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV6OO-00019f-0T;
	Thu, 23 Feb 2023 07:51:52 +0000
Date: Thu, 23 Feb 2023 15:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Kardatzke <jkardatzke@chromium.org>,
	op-tee@lists.trustedfirmware.org
Cc: oe-kbuild-all@lists.linux.dev,
	Jeffrey Kardatzke <jkardatzke@google.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tee: optee: Add SMC for loading OP-TEE image
Message-ID: <202302231536.Vn2DNHd4-lkp@intel.com>
References: <20230222092409.1.I8e7f9b01d9ac940507d78e15368e200a6a69bedb@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222092409.1.I8e7f9b01d9ac940507d78e15368e200a6a69bedb@changeid>

Hi Jeffrey,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2 next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Kardatzke/tee-optee-Add-SMC-for-loading-OP-TEE-image/20230223-012817
patch link:    https://lore.kernel.org/r/20230222092409.1.I8e7f9b01d9ac940507d78e15368e200a6a69bedb%40changeid
patch subject: [PATCH] tee: optee: Add SMC for loading OP-TEE image
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230223/202302231536.Vn2DNHd4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c19d72729a3c17aefd43e283bbfe3dd5abd2b26b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jeffrey-Kardatzke/tee-optee-Add-SMC-for-loading-OP-TEE-image/20230223-012817
        git checkout c19d72729a3c17aefd43e283bbfe3dd5abd2b26b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231536.Vn2DNHd4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tee/optee/smc_abi.c:1425:34: error: conflicting types for '__unused'; have 'void (*)(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  struct arm_smccc_res *)'
    1425 |                 optee_invoke_fn *__unused) {
         |                 ~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/tee/optee/smc_abi.c:1424:57: note: previous definition of '__unused' with type 'struct platform_device *'
    1424 | static inline int optee_load_fw(struct platform_device *__unused,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~


vim +1425 drivers/tee/optee/smc_abi.c

  1362	
  1363	static int optee_load_fw(struct platform_device *pdev,
  1364				 optee_invoke_fn *invoke_fn)
  1365	{
  1366		const struct firmware *fw = NULL;
  1367		struct arm_smccc_res res;
  1368		phys_addr_t data_pa;
  1369		u8 *data_buf = NULL;
  1370		u64 data_size;
  1371		u32 data_pa_high, data_pa_low;
  1372		u32 data_size_high, data_size_low;
  1373		int rc;
  1374	
  1375		rc = request_firmware(&fw, OPTEE_FW_IMAGE, &pdev->dev);
  1376		if (rc) {
  1377			/*
  1378			 * The firmware in the rootfs will not be accessible until we
  1379			 * are in the SYSTEM_RUNNING state, so return EPROBE_DEFER until
  1380			 * that point.
  1381			 */
  1382			if (system_state < SYSTEM_RUNNING)
  1383				return -EPROBE_DEFER;
  1384			goto fw_err;
  1385		}
  1386	
  1387		data_size = fw->size;
  1388		/*
  1389		 * This uses the GFP_DMA flag to ensure we are allocated memory in the
  1390		 * 32-bit space since TF-A cannot map memory beyond the 32-bit boundary.
  1391		 */
  1392		data_buf = kmalloc(fw->size, GFP_KERNEL | GFP_DMA);
  1393		if (!data_buf) {
  1394			rc = -ENOMEM;
  1395			goto fw_err;
  1396		}
  1397		memcpy(data_buf, fw->data, fw->size);
  1398		data_pa = virt_to_phys(data_buf);
  1399		reg_pair_from_64(&data_pa_high, &data_pa_low, data_pa);
  1400		reg_pair_from_64(&data_size_high, &data_size_low, data_size);
  1401		goto fw_load;
  1402	
  1403	fw_err:
  1404		pr_warn("image loading failed\n");
  1405		data_pa_high = data_pa_low = data_size_high = data_size_low = 0;
  1406	
  1407	fw_load:
  1408		/*
  1409		 * Always invoke the SMC, even if loading the image fails, to indicate
  1410		 * to EL3 that we have passed the point where it should allow invoking
  1411		 * this SMC.
  1412		 */
  1413		invoke_fn(OPTEE_SMC_CALL_LOAD_IMAGE, data_size_high, data_size_low,
  1414			  data_pa_high, data_pa_low, 0, 0, 0, &res);
  1415		if (!rc)
  1416			rc = res.a0;
  1417		if (fw)
  1418			release_firmware(fw);
  1419		kfree(data_buf);
  1420	
  1421		return rc;
  1422	}
  1423	#else
  1424	static inline int optee_load_fw(struct platform_device *__unused,
> 1425			optee_invoke_fn *__unused) {
  1426		return 0;
  1427	}
  1428	#endif
  1429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
