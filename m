Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44410156D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687267158; x=1718803158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0l4OdthOaIPgXTDOdKWItaDMuLHZPsvFauXp2FjAnIM=;
  b=NrMgSEG1uRkUOV1UYCcSswqNMOz3Gzi8TPAjFTZk2QMnmIZTvlbyiZj6
   nTrnQaFf/t+UHy1zg+FPc/pBjF7QA6VAd6EADC+uOsni/0TxLy+KXqeBG
   UY4nmbC/cm7wiUl/VAJZIJ8OPrgH5DO6oJ5eiFCOo91fvBBd8++PX14Lo
   ZVZXYdCeTnbLnZPIM2USrzu/TmNMx5HzRz3zKGXu7YqFu20D08wyhw5qK
   R1YObF/fJFHbcHY/bgkOcU0e2N9GZ3Ts160lf+Yy728GzoSmTGKY0p8ef
   /iFNUnFLVNblqz2E635oJyp0NfEaOC9du0vm5nXw0kxvweLfVPNS6odjM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="344596512"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="344596512"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="717232295"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="717232295"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2023 06:19:13 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBbGK-0005to-1q;
	Tue, 20 Jun 2023 13:19:12 +0000
Date: Tue, 20 Jun 2023 21:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jyan Chou <jyanchou@realtek.com>, jh80.chung@samsung.com,
	adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, jyanchou@realtek.com,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	james.tai@realtek.com
Subject: Re: [PATCH] CMDQ feature is introduced to eMMC standard in v5.1,
 which can be used to improve performance.
Message-ID: <202306202123.jfw85iPk-lkp@intel.com>
References: <20230616063731.17591-1-jyanchou@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616063731.17591-1-jyanchou@realtek.com>

Hi Jyan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.4-rc7 next-20230620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jyan-Chou/CMDQ-feature-is-introduced-to-eMMC-standard-in-v5-1-which-can-be-used-to-improve-performance/20230616-143849
base:   linus/master
patch link:    https://lore.kernel.org/r/20230616063731.17591-1-jyanchou%40realtek.com
patch subject: [PATCH] CMDQ feature is introduced to eMMC standard in v5.1, which can be used to improve performance.
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230620/202306202123.jfw85iPk-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306202123.jfw85iPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306202123.jfw85iPk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/dw_mmc_cqe.c:232:10: error: 'const struct cqhci_host_ops' has no member named 'setup_tran_desc'
     232 |         .setup_tran_desc = dw_mci_cqe_setup_tran_desc,
         |          ^~~~~~~~~~~~~~~
>> drivers/mmc/host/dw_mmc_cqe.c:232:28: error: initialization of 'void (*)(struct cqhci_host *, u32,  int)' {aka 'void (*)(struct cqhci_host *, unsigned int,  int)'} from incompatible pointer type 'void (*)(struct mmc_data *, struct cqhci_host *, u8 *, int)' {aka 'void (*)(struct mmc_data *, struct cqhci_host *, unsigned char *, int)'} [-Werror=incompatible-pointer-types]
     232 |         .setup_tran_desc = dw_mci_cqe_setup_tran_desc,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/dw_mmc_cqe.c:232:28: note: (near initialization for 'dw_mci_cqhci_host_ops.write_l')
   drivers/mmc/host/dw_mmc_cqe.c: In function 'dw_mci_cqe_read_rsp':
   drivers/mmc/host/dw_mmc_cqe.c:283:37: warning: variable 'rsp_tmp' set but not used [-Wunused-but-set-variable]
     283 |                                 u32 rsp_tmp[4];
         |                                     ^~~~~~~
   drivers/mmc/host/dw_mmc_cqe.c: In function 'dw_mci_cqe_err_handle':
   drivers/mmc/host/dw_mmc_cqe.c:766:41: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     766 |                                         if (err == -DW_MCI_NOT_READY)
         |                                         ^~
   drivers/mmc/host/dw_mmc_cqe.c:769:49: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     769 |                                                 break;
         |                                                 ^~~~~
   In file included from include/linux/debugfs.h:16,
                    from drivers/mmc/host/dw_mmc_cqe.c:12:
   drivers/mmc/host/dw_mmc_cqe.c: At top level:
   drivers/mmc/host/dw_mmc_cqe.c:97:23: warning: 'dw_mci_cqe_req_fops' defined but not used [-Wunused-const-variable=]
      97 | DEFINE_SHOW_ATTRIBUTE(dw_mci_cqe_req);
         |                       ^~~~~~~~~~~~~~
   include/linux/seq_file.h:202:37: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     202 | static const struct file_operations __name ## _fops = {                 \
         |                                     ^~~~~~
   cc1: some warnings being treated as errors


vim +232 drivers/mmc/host/dw_mmc_cqe.c

   228	
   229	static const struct cqhci_host_ops dw_mci_cqhci_host_ops = {
   230		.enable = dw_mci_cqe_enable,
   231		.dumpregs = dw_mci_cqe_dumpregs,
 > 232		.setup_tran_desc = dw_mci_cqe_setup_tran_desc,
   233	};
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
