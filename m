Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280ABA31
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 15:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694532977; x=1726068977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fp/Qk8s6cCDyfqTDQ5mev2eeB1MW2n+WTJmCVBqXL7A=;
  b=KsZ8BNfpzyLtsBonBpBJNPNkQFR5ryykPmfXbnbeYkVVzzDG3RA8bTw8
   B5fBUTD76V98CfKVaRPStdBpC0t1tnL6sBmOWxgsX7bPQeBghaValvRvP
   iMs/qMVna12TYDb+yYLQBfVPnBZzj2QIYS3Hh5awn6DMV6WiVCpblo/G9
   sKqAdqyrIkVJ6WckiqrMMhCfNJaAY4xM0PSIrUH/sI+iCM9qZ8FWZ8OvV
   GzeyCB4hKjdvjYQQi8ygOyxK8jBA/cKEQ67UbdlO0Mov1BiNxlAQ3Alse
   wnbyiq+w4fJOpyZ/jyrWmUb14+RZoys6Rw3JUt7yBM0FmpXLDUm+FdBME
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="357843353"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="357843353"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 08:36:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="886972890"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="886972890"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2023 08:35:47 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg5Qn-00007b-1U;
	Tue, 12 Sep 2023 15:36:02 +0000
Date: Tue, 12 Sep 2023 23:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm 5/6] drivers/char/tpm/tpm_tdx.c:884:32:
 warning: 'tdx_guest_ids' defined but not used
Message-ID: <202309122330.0cztZSUk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm
head:   f3da65595aa53304b251dc5e42ca72b55bb83bc9
commit: 6d4ad81993ed6f40f1f82c07cfe9fedf4b4d4722 [5/6] tpm: Add vTPM TDX support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309122330.0cztZSUk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122330.0cztZSUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122330.0cztZSUk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm_tdx.c:884:32: warning: 'tdx_guest_ids' defined but not used [-Wunused-const-variable=]
     884 | static const struct x86_cpu_id tdx_guest_ids[] = {
         |                                ^~~~~~~~~~~~~
--
>> drivers/char/tpm/tpm_tdx.c:175: warning: Function parameter or member 'tdvmcall_status' not described in 'tdx_tpm_msg_resp'
>> drivers/char/tpm/tpm_tdx.c:175: warning: Function parameter or member 'service_cmd_status' not described in 'tdx_tpm_msg_resp'
>> drivers/char/tpm/tpm_tdx.c:175: warning: Function parameter or member 'rsvd' not described in 'tdx_tpm_msg_resp'


vim +/tdx_guest_ids +884 drivers/char/tpm/tpm_tdx.c

   883	
 > 884	static const struct x86_cpu_id tdx_guest_ids[] = {
   885		X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
   886		{}
   887	};
   888	MODULE_DEVICE_TABLE(x86cpu, tdx_guest_ids);
   889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
