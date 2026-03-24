Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6F4277017
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 05:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774329305; cv=none; b=OtpGGjIizOu47NHnjUpbhI+AcrCJZZFBoJtly+FLc3m5NR07KomUinhsqAjcbyLKctmkjx+kC2VmO8aDzdiIYIp2RWE3NTM5plRZuukqFDsnQEdAhSoT0ffdYAkld6xKQ2hNPYpBsEWCq47GvHfJ4vYZ0A2d54PG+vG4b5J0ivU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774329305; c=relaxed/simple;
	bh=3sS/pnLr1RzDDwIcaLiOO8O2SEF8iF67bGhf1wzmj2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Imx6OnImWKahMF7RO9Bwb7jklS7fUV8td/0isB1D8y/GkOzR83Bm5SL1kVhPYHSqCd+3lAasO6IOgjf4rtQU1MOwctcVLC5IrHewgM4sOYtO6VV4UbsSy1vcykuwmB66vqKohw66tERm4YKmuMQmS3QyuA60BxI7JmX6Pzi+zG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvG2HR4u; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvG2HR4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774329305; x=1805865305;
  h=date:from:to:cc:subject:message-id;
  bh=3sS/pnLr1RzDDwIcaLiOO8O2SEF8iF67bGhf1wzmj2E=;
  b=HvG2HR4u1IpjZGK2s4EuJLcDcllp1Uax+NjNBsCD4j1UEqq/emWPBMLk
   lgeO0wzCRjIJtl2AAj0SUJ9LaF6N9JbhFLwuARqKtTkYk0Q1yaxzr81F+
   0qrxzh2pW2XFR0IwvuKFbTNSEgJ3pAtf1CBfF2TSIJB61KwiiCgFVSzMg
   oTuQqx6cZS9KkHpyXwdDexDuVsCJyWq43iiMw9sAHfM3f6WdQQHTQ/OiS
   GOgmbP42SCR/ib9bjPzzsh8ryBCBcFHCGGnVAcicgYcJMUhrYfETq+L+r
   aqkXmNGVK3wy7UuaIZrEu7tEP/fCyHOQgMzpNypIEme8Ue1QFdN0EzzD0
   w==;
X-CSE-ConnectionGUID: ywi7R6RiRIOr+ox3R4awoQ==
X-CSE-MsgGUID: ZkxSbEcyQ6uZKfwZFcDQqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75531362"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75531362"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 22:15:02 -0700
X-CSE-ConnectionGUID: O6uag6QVSx+wc4lbHcD70g==
X-CSE-MsgGUID: pBrJFoyhTZeMZWChdRli5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228994436"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2026 22:15:00 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4u6U-000000003sv-0e1d;
	Tue, 24 Mar 2026 05:14:58 +0000
Date: Tue, 24 Mar 2026 13:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-mxl 36/113]
 drivers/net/phy/as21xxx/as21xxx.c:787 aeon_ipc_send_cmd() warn: unsigned
 'val' is never less than zero.
Message-ID: <202603241331.whb3q86U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-mxl
head:   033a14af21b86a958a82e31fe31bab10b2905445
commit: 0149f22beab1fcc445c1336b4617fd46f3a68aa4 [36/113] net: phy: add as21xx downstream driver from 6.19 (1.9.1)
config: um-randconfig-r072-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241331.whb3q86U-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241331.whb3q86U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241331.whb3q86U-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: drivers/net/phy/phylink.o: in function `phylink_create':
>> drivers/net/phy/phylink.c:2074:(.text+0x6cc): undefined reference to `register_fwnode_pcs_notifier'
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: drivers/net/phy/phylink.o: in function `pcs_provider_notify':
>> drivers/net/phy/phylink.c:1982:(.text+0x1c2c): undefined reference to `fwnode_phylink_pcs_get_from_fwnode'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

smatch warnings:
drivers/net/phy/as21xxx/as21xxx.c:787 aeon_ipc_send_cmd() warn: unsigned 'val' is never less than zero.

vim +/val +787 drivers/net/phy/as21xxx/as21xxx.c

   745	
   746	static int aeon_ipc_send_cmd(struct phy_device *phydev,
   747				     struct as21xxx_priv *priv,
   748				     u16 cmd, u16 *ret_sts)
   749	{
   750		bool curr_parity;
   751		int ret;
   752		unsigned int val;
   753	
   754		/* The IPC sync by using a single parity bit.
   755		 * Each CMD have alternately this bit set or clear
   756		 * to understand correct flow and packet order.
   757		 */
   758		curr_parity = priv->parity_status;
   759		if (priv->parity_status)
   760			cmd |= AEON_IPC_CMD_PARITY;
   761		/* Always update parity for next packet */
   762		priv->parity_status = !priv->parity_status;
   763	
   764		ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_IPC_CMD, cmd);
   765		if (ret)
   766			return ret;
   767	
   768		/* Wait for packet to be processed */
   769		usleep_range(AEON_IPC_DELAY, AEON_IPC_DELAY + 5000);
   770		/* With no ret_sts, ignore waiting for packet completion
   771		 * (ipc parity bit sync)
   772		 */
   773		if (!ret_sts)
   774			return 0;
   775		/* Exit condition logic:
   776		 * - Wait for parity bit equal
   777		 * - Wait for status success, error OR ready
   778		 */
   779		ret = read_poll_timeout(phy_read_mmd, val,
   780					(FIELD_GET(AEON_IPC_STS_PARITY, val) == curr_parity &&
   781					(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_RCVD &&
   782					(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_PROCESS &&
   783					(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_BUSY) ||
   784					(val < 0),
   785					10000, 2000000, false,
   786					phydev, MDIO_MMD_VEND1, VEND1_IPC_STS);
 > 787		if (val < 0)
   788			ret = val;
   789		if (ret)
   790			phydev_err(phydev, "%s fail to polling status failed: %d\n", __func__, ret);
   791		*ret_sts = val;
   792		if ((val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_SUCCESS)
   793			return -EINVAL;
   794	
   795		return 0;
   796	}
   797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
