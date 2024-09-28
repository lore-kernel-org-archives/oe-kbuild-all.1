Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0607E1DDC9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727545770; cv=none; b=Ha4P1P7ZqIE4QAQL6uSv1CnpXCZJTLsJiJPXHKNnJsqbIixTwFkGARVC6W2sSxH8/Mp+2+VJoXJtANxnUFsXh2MCcC2AeGxcjz2QiWlgGR/Pxfw6EgJK/ekDWaWuRqCYljDgT2iaitiXMKsa3Lscl8WntGQVs10AdulCUBzKiho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727545770; c=relaxed/simple;
	bh=vUnqHeGqMujiP4uxhCQ5qwP6D39sFgD16lQnTFx5ATI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fnFYnhv9r38Yvn1UJqKY48q3g1/rUkBhEf1DPsv9k5gbK7zei7vGjEbMvZZV+B/eXxzCSIqWfTypkGDzsZi4/Erb+gbLHiVaMUDRz7suSrkUlAuybTzotcv2zQbi8RV9viX4jaxvFw48j6r9PMSuH6I7mzqoUS0TzDbv8S1zPCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbTHXPp2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbTHXPp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727545768; x=1759081768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vUnqHeGqMujiP4uxhCQ5qwP6D39sFgD16lQnTFx5ATI=;
  b=UbTHXPp2Ms2/egvE/tcG7ro/CaA/3vIZAH6THNb0osLhB0aEQ1Rovshm
   LpuJ0KkL48aH/jdl7XAz1OjcNt6ORwJ53B6Qx8B+OSbav/8drRlN02Peq
   nFd3A0dcDHaMKjA6xzjM3NNqW8RTQe807Xx+2bUsORudC9+761BAV5Veb
   wDeeTDK8ff+vrenl++jEarj61IrzOUnwoL94y8UOo6X1uIYlm1IdnGDLo
   bFe2UrSCZqyHXqv8bNMNuUrZ3Mq/ONAX3nwnPT0NcdRa2l+nE59N01TfV
   KCIDaXmlIFeXyyv8g1pDcOo5MZIIAHUrN0DCIwrK3vLFzVGPt1Dq/s2BS
   g==;
X-CSE-ConnectionGUID: niDvTKRWTmSN2qFwfFF3sA==
X-CSE-MsgGUID: I+aQOHf8TaKg5X4LWypo/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26184865"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26184865"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 10:49:27 -0700
X-CSE-ConnectionGUID: 5s2Ij7SDRX2qx8lsSV4/Fg==
X-CSE-MsgGUID: r+9B/SOlRvaPpMD818bDDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77787947"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Sep 2024 10:49:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1subZL-000NVH-1z;
	Sat, 28 Sep 2024 17:49:23 +0000
Date: Sun, 29 Sep 2024 01:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4910/16788]
 drivers/firmware/imx/imx-scu.c:229:43: warning: cast from pointer to integer
 of different size
Message-ID: <202409290150.hTqdngcf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: d20eba5cec72e286405dbbd00fc35f18d95cfada [4910/16788] LF-202-1 firmware: imx: scu: use hvc for dom0
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290150.hTqdngcf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290150.hTqdngcf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290150.hTqdngcf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/imx/imx-scu.c:10:
   drivers/firmware/imx/imx-scu.c: In function 'imx_scu_call_rpc':
>> drivers/firmware/imx/imx-scu.c:229:43: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     229 |                 arm_smccc_hvc(FSL_HVC_SC, (uint64_t)msg, !have_resp, 0, 0, 0,
         |                                           ^
   include/linux/arm-smccc.h:386:44: note: in definition of macro 'arm_smccc_hvc'
     386 | #define arm_smccc_hvc(...) __arm_smccc_hvc(__VA_ARGS__, NULL)
         |                                            ^~~~~~~~~~~


vim +229 drivers/firmware/imx/imx-scu.c

   204	
   205	/*
   206	 * RPC command/response
   207	 */
   208	int imx_scu_call_rpc(struct imx_sc_ipc *sc_ipc, void *msg, bool have_resp)
   209	{
   210		uint8_t saved_svc, saved_func;
   211		struct imx_sc_rpc_msg *hdr;
   212		struct arm_smccc_res res;
   213		int ret;
   214	
   215		if (WARN_ON(!sc_ipc || !msg))
   216			return -EINVAL;
   217	
   218		mutex_lock(&sc_ipc->lock);
   219		reinit_completion(&sc_ipc->done);
   220	
   221		if (have_resp) {
   222			sc_ipc->msg = msg;
   223			saved_svc = ((struct imx_sc_rpc_msg *)msg)->svc;
   224			saved_func = ((struct imx_sc_rpc_msg *)msg)->func;
   225		}
   226		sc_ipc->count = 0;
   227		sc_ipc->rx_size = 0;
   228		if (xen_initial_domain()) {
 > 229			arm_smccc_hvc(FSL_HVC_SC, (uint64_t)msg, !have_resp, 0, 0, 0,
   230				      0, 0, &res);
   231			if (res.a0)
   232				printk("Error FSL_HVC_SC %ld\n", res.a0);
   233	
   234			ret = res.a0;
   235	
   236		} else {
   237			ret = imx_scu_ipc_write(sc_ipc, msg);
   238			if (ret < 0) {
   239				dev_err(sc_ipc->dev, "RPC send msg failed: %d\n", ret);
   240				goto out;
   241			}
   242	
   243			if (have_resp) {
   244				if (!wait_for_completion_timeout(&sc_ipc->done,
   245								 MAX_RX_TIMEOUT)) {
   246					dev_err(sc_ipc->dev, "RPC send msg timeout\n");
   247					mutex_unlock(&sc_ipc->lock);
   248					return -ETIMEDOUT;
   249				}
   250	
   251				/* response status is stored in hdr->func field */
   252				hdr = msg;
   253				ret = hdr->func;
   254	
   255				/*
   256				 * Some special SCU firmware APIs do NOT have return value
   257				 * in hdr->func, but they do have response data, those special
   258				 * APIs are defined as void function in SCU firmware, so they
   259				 * should be treated as return success always.
   260				 */
   261				if ((saved_svc == IMX_SC_RPC_SVC_MISC) &&
   262					(saved_func == IMX_SC_MISC_FUNC_UNIQUE_ID ||
   263					 saved_func == IMX_SC_MISC_FUNC_GET_BUTTON_STATUS))
   264					ret = 0;
   265			}
   266		}
   267	
   268	out:
   269		sc_ipc->msg = NULL;
   270		mutex_unlock(&sc_ipc->lock);
   271	
   272		dev_dbg(sc_ipc->dev, "RPC SVC done\n");
   273	
   274		return imx_sc_to_linux_errno(ret);
   275	}
   276	EXPORT_SYMBOL(imx_scu_call_rpc);
   277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
