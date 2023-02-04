Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB523DC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675544638; x=1707080638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q/5pLaw551fsATdlNZfQaQTyEmYHyiqwz2XzQFpdnDI=;
  b=M4l4WBrwQ2Xn+494Rdl5w4gxLdCgGVtujmXKqxmjPjAniIzQ+WWcvoxi
   qSZI/522Jht8BbcZTqtUdVStdFj/pdJFD6pUbXpIelVSWJ8YQS0mWOZH8
   jre196rfsRXrrZaPhyMP46xRgp0PeCcSfgYVCFJWth+rcuHZ86bx4nmPz
   ZNqD90tPwXkxd15boKWigJ1yzG6L0KyDLHV56IH0Aq1hhSmS5JM9mkEA8
   FhT2CDCqtOdP0GruXp/m3kWbiGNp+FAigM7og8Ge4Pkb7Gj4+Aoblp0uD
   zFt9OxJiCwdkEKfCyjwl6oIepUcdaiWOp3MVgvS01nfluhuXmiqFc2tBR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="308626467"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="308626467"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 13:03:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="911522731"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="911522731"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Feb 2023 13:03:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOPhU-0001Wl-0W;
	Sat, 04 Feb 2023 21:03:56 +0000
Date: Sun, 5 Feb 2023 05:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 3164/20208]
 drivers/firmware/imx/imx-scu.c:228:43: warning: cast from pointer to integer
 of different size
Message-ID: <202302050530.CsQmb5IC-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: d0d51c6537d06c23e9fceeb69b5e2f8275caadd7 [3164/20208] LF-202-1 firmware: imx: scu: use hvc for dom0
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230205/202302050530.CsQmb5IC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/d0d51c6537d06c23e9fceeb69b5e2f8275caadd7
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout d0d51c6537d06c23e9fceeb69b5e2f8275caadd7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/firmware/imx/ drivers/net/ethernet/freescale/fman/ drivers/pwm/ drivers/staging/ drivers/tty/serial/ net/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

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
https://github.com/intel/lkp-tests
