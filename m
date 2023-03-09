Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D06321E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678353080; x=1709889080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Jat29QFN3ln1FSKjTbC/X658JAjs7j0pOXGn/ibt1M=;
  b=JbXl1O0jNOwJPgtc74v6UWov1t/YkmZkjrb1K5g8Os5Wc0oPvtT1l0/i
   DzLsjIDvb5ckpurLQmRCjXWAQSGcMvYB7GVaFaLQ4Axpl7ZBg+A73YKmC
   OGKUAH9qcpaIcOP3Yw58mbcjcIktrRs/najwHpWGtDDo1B95jyGVjtE+u
   9PMPC8NvjJf4LduLGJrCv+q7ak323oJGihJ3qo3bx/PBDZKxhe6d7LZoH
   2cnnak+P0y0DfeU0hiqL5YoN0clTC3KFBI0+PjXq4oIkqAjfudOY/45Fl
   hxd42O4k0Ue7NeZgUDmn8r/L2ft3HlI1kh5x2k0xmHVJpWzVCcybGCx9v
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333867675"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="333867675"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 01:11:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820535670"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="820535670"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2023 01:11:18 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paCIv-0002pj-2F;
	Thu, 09 Mar 2023 09:11:17 +0000
Date: Thu, 9 Mar 2023 17:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 5/7] scsi: ufs: ufs-qcom: Switch to the new ICE API
Message-ID: <202303091636.YScXypO8-lkp@intel.com>
References: <20230308155838.1094920-6-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308155838.1094920-6-abel.vesa@linaro.org>

Hi Abel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on robh/for-next]
[also build test WARNING on mkp-scsi/for-next jejb-scsi/for-next linus/master v6.3-rc1 next-20230309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-soc-qcom-Add-schema-for-Inline-Crypto-Engine/20230309-000152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230308155838.1094920-6-abel.vesa%40linaro.org
patch subject: [RFC PATCH v2 5/7] scsi: ufs: ufs-qcom: Switch to the new ICE API
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230309/202303091636.YScXypO8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/bb84d6d7e112dd442be7821917a4f66fc42fe33a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abel-Vesa/dt-bindings-soc-qcom-Add-schema-for-Inline-Crypto-Engine/20230309-000152
        git checkout bb84d6d7e112dd442be7821917a4f66fc42fe33a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/ufs/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091636.YScXypO8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/host/ufs-qcom.c:1408:5: warning: no previous prototype for 'ufs_qcom_program_key' [-Wmissing-prototypes]
    1408 | int ufs_qcom_program_key(struct ufs_hba *hba,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/ufs_qcom_program_key +1408 drivers/ufs/host/ufs-qcom.c

  1406	
  1407	#ifdef CONFIG_SCSI_UFS_CRYPTO
> 1408	int ufs_qcom_program_key(struct ufs_hba *hba,
  1409				 const union ufs_crypto_cfg_entry *cfg, int slot)
  1410	{
  1411		struct ufs_qcom_host *host = ufshcd_get_variant(hba);
  1412		union ufs_crypto_cap_entry cap;
  1413		bool config_enable =
  1414			cfg->config_enable & UFS_CRYPTO_CONFIGURATION_ENABLE;
  1415	
  1416		/* Only AES-256-XTS has been tested so far. */
  1417		cap = hba->crypto_cap_array[cfg->crypto_cap_idx];
  1418		if (cap.algorithm_id != UFS_CRYPTO_ALG_AES_XTS ||
  1419			cap.key_size != UFS_CRYPTO_KEY_SIZE_256)
  1420			return -EINVAL;
  1421	
  1422		if (config_enable)
  1423			return qcom_ice_program_key(host->ice,
  1424						    cfg->crypto_cap_idx,
  1425						    QCOM_ICE_CRYPTO_ALG_AES_XTS,
  1426						    QCOM_ICE_CRYPTO_KEY_SIZE_256,
  1427						    cfg->crypto_key,
  1428						    cfg->data_unit_size, slot);
  1429		else
  1430			return qcom_ice_evict_key(host->ice, slot);
  1431	}
  1432	#endif
  1433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
