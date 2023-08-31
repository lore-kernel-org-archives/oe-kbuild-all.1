Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA9211CB6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 19:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693510266; x=1725046266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9aVTqtZ813kEng4b9JmB5GGTU3wTaCWsUMDf/VZYKIE=;
  b=adT6d4HAyJrLJ7Lj2PIRB1CxwNovsM1AMHsyUePxwbKMcyaJXWDqXbfq
   sFvU43HIs8ym84BnOQWHVXckOzhHz5vz+rxM/GNi65qqfZ82bk20D45MH
   PiHJN1zI8EJP5Go8JvkCttEXDJR5wofcCBAu2yhDa+RdgnBirKr1rfkj/
   neohNi19fZ6SQlFDYp1KRg/rngFRc54yXFkTx0HRcxbux47R6qWKgsTYw
   NEuq8+K4a6tCXqT+N5nAMcu+1+71rVMwitMVjgMHQ/c+4chfwUdgA4J9B
   j5okypjJS2eLLN8oluKyFnD74bLi/YkWQGacogoV39K63g1kR3WnWpawr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407037792"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="407037792"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 12:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986374587"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="986374587"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2023 12:31:03 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbnNd-0000U3-2u;
	Thu, 31 Aug 2023 19:31:01 +0000
Date: Fri, 1 Sep 2023 03:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3164/24603]
 drivers/firmware/imx/imx-scu.c:228:43: warning: cast from pointer to integer
 of different size
Message-ID: <202309010330.bgbpDATe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: d0d51c6537d06c23e9fceeb69b5e2f8275caadd7 [3164/24603] LF-202-1 firmware: imx: scu: use hvc for dom0
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230901/202309010330.bgbpDATe-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010330.bgbpDATe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010330.bgbpDATe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/firmware/imx/ipc.h:11,
                    from drivers/firmware/imx/imx-scu.c:12:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from drivers/firmware/imx/imx-scu.c:10:
   drivers/firmware/imx/imx-scu.c: In function 'imx_scu_call_rpc':
>> drivers/firmware/imx/imx-scu.c:228:43: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     228 |                 arm_smccc_hvc(FSL_HVC_SC, (uint64_t)msg, !have_resp, 0, 0, 0,
         |                                           ^
   include/linux/arm-smccc.h:360:44: note: in definition of macro 'arm_smccc_hvc'
     360 | #define arm_smccc_hvc(...) __arm_smccc_hvc(__VA_ARGS__, NULL)
         |                                            ^~~~~~~~~~~


vim +228 drivers/firmware/imx/imx-scu.c

   203	
   204	/*
   205	 * RPC command/response
   206	 */
   207	int imx_scu_call_rpc(struct imx_sc_ipc *sc_ipc, void *msg, bool have_resp)
   208	{
   209		uint8_t saved_svc, saved_func;
   210		struct imx_sc_rpc_msg *hdr;
   211		struct arm_smccc_res res;
   212		int ret;
   213	
   214		if (WARN_ON(!sc_ipc || !msg))
   215			return -EINVAL;
   216	
   217		mutex_lock(&sc_ipc->lock);
   218		reinit_completion(&sc_ipc->done);
   219	
   220		if (have_resp) {
   221			sc_ipc->msg = msg;
   222			saved_svc = ((struct imx_sc_rpc_msg *)msg)->svc;
   223			saved_func = ((struct imx_sc_rpc_msg *)msg)->func;
   224		}
   225		sc_ipc->count = 0;
   226		sc_ipc->rx_size = 0;
   227		if (xen_initial_domain()) {
 > 228			arm_smccc_hvc(FSL_HVC_SC, (uint64_t)msg, !have_resp, 0, 0, 0,
   229				      0, 0, &res);
   230			if (res.a0)
   231				printk("Error FSL_HVC_SC %ld\n", res.a0);
   232	
   233			ret = res.a0;
   234	
   235		} else {
   236			ret = imx_scu_ipc_write(sc_ipc, msg);
   237			if (ret < 0) {
   238				dev_err(sc_ipc->dev, "RPC send msg failed: %d\n", ret);
   239				goto out;
   240			}
   241	
   242			if (have_resp) {
   243				if (!wait_for_completion_timeout(&sc_ipc->done,
   244								 MAX_RX_TIMEOUT)) {
   245					dev_err(sc_ipc->dev, "RPC send msg timeout\n");
   246					mutex_unlock(&sc_ipc->lock);
   247					return -ETIMEDOUT;
   248				}
   249	
   250				/* response status is stored in hdr->func field */
   251				hdr = msg;
   252				ret = hdr->func;
   253	
   254				/*
   255				 * Some special SCU firmware APIs do NOT have return value
   256				 * in hdr->func, but they do have response data, those special
   257				 * APIs are defined as void function in SCU firmware, so they
   258				 * should be treated as return success always.
   259				 */
   260				if ((saved_svc == IMX_SC_RPC_SVC_MISC) &&
   261					(saved_func == IMX_SC_MISC_FUNC_UNIQUE_ID ||
   262					 saved_func == IMX_SC_MISC_FUNC_GET_BUTTON_STATUS))
   263					ret = 0;
   264			}
   265		}
   266	
   267	out:
   268		sc_ipc->msg = NULL;
   269		mutex_unlock(&sc_ipc->lock);
   270	
   271		dev_dbg(sc_ipc->dev, "RPC SVC done\n");
   272	
   273		return imx_sc_to_linux_errno(ret);
   274	}
   275	EXPORT_SYMBOL(imx_scu_call_rpc);
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
