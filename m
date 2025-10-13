Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FE8B663
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 03:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760326274; cv=none; b=Oqw8xMWRURgyEmHztHpLeTAsjCDNyy0+rWbrqRtXu8LTh1DbRMQhls+1VEnQnq8Hd5QyoeJQba6aKMLHn5zwi4TXRlLtMh9bfUNa4a5ccDPbDQR/FeoGTRCEUd3W7fu74OVNG9gRWiB2yAOmPy4pfbR5Dd/BJaweZHxLf8TY5Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760326274; c=relaxed/simple;
	bh=KnYE6weAc1td4czfl1ddirXT+QJrJoorKAygkOLN6EU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NuSZ8BEVKed97HHjRMFZZY8WIsLqfH08YR1p8ayHg5jcb5OqKenEER7y2lEXzclmUL+NLAjOLhF4z7ktpOAoVxsLO6JpydwzzVM+6CPkOrxMKLH9J7bUvQaW7KicmcFLguTV7HbISJYwqmeGlYprwtmtmuDa5qK2eWTeSHDOAJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5F2vzRZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5F2vzRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760326270; x=1791862270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KnYE6weAc1td4czfl1ddirXT+QJrJoorKAygkOLN6EU=;
  b=Y5F2vzRZqTZGKfJLLRwa+v5dyPm7m/Ex5LITQEPrTY+ZOZjlzjePFwrL
   l/cZi1s4DMms/p/5xLra8NfF1rtdjVt2DKEOs9QFUXdW3KPFRJFR28riG
   k1ADEecWRThRhDaSDsMv8LHb7kz+YAljI8kzSWm5YKwAsLsleDboprksE
   Spt5pimRsk7CwktoDDl06KFEC0o7lhCTLQUA45B5pEFAsc5VBnmntwVW3
   b8WlX7jJpt1EVqu8kw+01FFSTVKG5G/Mp+M2z3KcpWDeHNh78dQw5a0dA
   nwviDWhJjSG1fwHT7dg1+2PoD0K+VEEBxlWAcVKaGli/i/QPYy2kNuaFz
   w==;
X-CSE-ConnectionGUID: 1teuvGz9QImfEUb6n5M/8w==
X-CSE-MsgGUID: 8kX0OiGCQiS8Oek3HmQPog==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62350697"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="62350697"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 20:31:09 -0700
X-CSE-ConnectionGUID: K4A1q6EcQE6POU2HhAQyjg==
X-CSE-MsgGUID: /d1yiR7kQQuJ/0tU+nYLeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="186579367"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Oct 2025 20:31:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v89H8-00008p-1l;
	Mon, 13 Oct 2025 03:31:06 +0000
Date: Mon, 13 Oct 2025 11:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 110/114] drivers/net/phy/as21xxx.c:549
 aeon_ipc_send_cmd() warn: unsigned 'val' is never less than zero.
Message-ID: <202510131130.ikcvWpTP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   03a2d4a9a273dee05ce257bd5b673d647742564d
commit: 936e993c16c5c695eb2ce063a5a11f122a580727 [110/114] net: phy: as21: try the driver from mtk-sdk
config: nios2-randconfig-r071-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131130.ikcvWpTP-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510131130.ikcvWpTP-lkp@intel.com/

New smatch warnings:
drivers/net/phy/as21xxx.c:549 aeon_ipc_send_cmd() warn: unsigned 'val' is never less than zero.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
drivers/net/phy/as21xxx.c:557 aeon_ipc_send_cmd() warn: unsigned 'val' is never less than zero.
drivers/net/phy/as21xxx.c:1178 aeon_c45_an_config_aneg() error: uninitialized symbol 'changed'.

vim +/val +549 drivers/net/phy/as21xxx.c

   512	
   513	static int aeon_ipc_send_cmd(struct phy_device *phydev,
   514				     struct as21xxx_priv *priv,
   515				     u16 cmd, u16 *ret_sts)
   516	{
   517		bool curr_parity;
   518		int ret;
   519		unsigned int val;
   520	
   521		/* The IPC sync by using a single parity bit.
   522		 * Each CMD have alternately this bit set or clear
   523		 * to understand correct flow and packet order.
   524		 */
   525		curr_parity = priv->parity_status;
   526		if (priv->parity_status)
   527			cmd |= AEON_IPC_CMD_PARITY;
   528	
   529		/* Always update parity for next packet */
   530		priv->parity_status = !priv->parity_status;
   531	
   532		ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_IPC_CMD, cmd);
   533		if (ret)
   534			return ret;
   535	
   536		/* Wait for packet to be processed */
   537		usleep_range(AEON_IPC_DELAY, AEON_IPC_DELAY + 5000);
   538	
   539		/* With no ret_sts, ignore waiting for packet completion
   540		 * (ipc parity bit sync)
   541		 */
   542		if (!ret_sts)
   543			return 0;
   544	
   545		/* Exit condition logic:
   546		 * - Wait for parity bit equal
   547		 * - Wait for status success, error OR ready
   548		 */
 > 549		ret = read_poll_timeout(aeon_cl45_read, val,
   550					(FIELD_GET(AEON_IPC_STS_PARITY, val) == curr_parity &&
   551					(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_RCVD &&
   552					(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_PROCESS &&
   553					(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_BUSY) ||
   554					(val < 0),
   555					10000, 2000000, false,
   556					phydev, MDIO_MMD_VEND1, VEND1_IPC_STS);
   557		if (val < 0)
   558			ret = val;
   559	
   560		if (ret)
   561			phydev_err(phydev, "%s fail to polling status failed: %d\n", __func__, ret);
   562		*ret_sts = val;
   563	
   564		if ((val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_SUCCESS)
   565			return -EFAULT;
   566	
   567		return 0;
   568	}
   569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
