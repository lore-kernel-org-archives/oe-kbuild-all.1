Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414FE213127
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729893576; cv=none; b=OArPWoQo1XxW15RY/WzQ1OyIm+wrU9CTAlFNgtWU5S1Rdj/IsCbTcsfiUVTnvof9B2j3QhwG5mM9J8eNjG2CPqZZqYE4N8ofuuCJIXRtU8W9kP5RH0nBA2AkOP5bbMQQ4wg3xPJdqg2mANi3z8g6lxcPgkFOqTVTt3oeclcyiyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729893576; c=relaxed/simple;
	bh=K+YFBsyvc51iKVAdeHQKfnLQJRElw5hC4SXoLuPeM+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tPPixxzaBg8Tj5Ckur4p2HJnpTu9UWO+KnKB924JvNmgNKoJ/6VmW4W14BVw1ENN/a1/SqXnuehCpDqHuer1RwrCaQtnlTCvSvJ+dGaXZGijd7h8W/+W4flJeUQ+EwG0zLFrr9NrgvcmlaA/WLT/G9L5E0gURHUrQ9acDzQaNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbirtSsr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbirtSsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729893574; x=1761429574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K+YFBsyvc51iKVAdeHQKfnLQJRElw5hC4SXoLuPeM+k=;
  b=bbirtSsr8TL0NWq5V3CyLjxpbDSeEUeKYlJopafkq2A0ufmKpb3v2kDK
   f534Ce73qyiKLwGpX3yMDyUzGb7m9yXz5f7RqhEhy3IkzKXhQkE937fFD
   2waqsyKKiDkJoFu+TKCWlSJjrJ/fdiceJpuAjpd69lr1Z2XD14NQMAFQT
   ZmenyxE1jpwsRsxXL+xea/x7E6rZxwvOIo6lksTx5Yic+T/KxAMmGPJEY
   qqDTj0jcgVLDjq4yrjW9+GAu4MLRq54O9jaunWOJA5NSUXmLHDAgNOG2Q
   Dy7WPy97rZPWJVl12oOhS3HxXrwMd3ag6BMm5ZuLH5SD4tD8Z6/vSJNFH
   g==;
X-CSE-ConnectionGUID: ghNG5NzbS1uzZaTOe1FVnw==
X-CSE-MsgGUID: 48GALl+rQTC4Gst6w/U5Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40965938"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="40965938"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:59:33 -0700
X-CSE-ConnectionGUID: PNw/36txSDu/lr8CCP70Cw==
X-CSE-MsgGUID: Rl9RJREBTcyVMVcNGjyqNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="80686026"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2024 14:59:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4SLB-000Ywf-2l;
	Fri, 25 Oct 2024 21:59:29 +0000
Date: Sat, 26 Oct 2024 05:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Shih <victor.shih@genesyslogic.com.tw>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Ben Chuang <ben.chuang@genesyslogic.com.tw>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: [ulfh-mmc:next 48/61] drivers/mmc/host/sdhci-uhs2.c:649:36: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202410260525.ZUuPhMJz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   3c0946b6a378fb92658aabcda5c70ea3e83143bf
commit: 9cbb2358bb1f17b61bf75cbebc2c9746b3a29e32 [48/61] mmc: sdhci-uhs2: add request() and others
config: x86_64-randconfig-r131-20241025 (https://download.01.org/0day-ci/archive/20241026/202410260525.ZUuPhMJz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260525.ZUuPhMJz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260525.ZUuPhMJz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/host/sdhci-uhs2.c:649:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 @@
   drivers/mmc/host/sdhci-uhs2.c:649:36: sparse:     expected unsigned int [usertype] val
   drivers/mmc/host/sdhci-uhs2.c:649:36: sparse:     got restricted __be32
>> drivers/mmc/host/sdhci-uhs2.c:73:16: sparse: sparse: cast to restricted __be16
>> drivers/mmc/host/sdhci-uhs2.c:73:16: sparse: sparse: cast to restricted __be16
>> drivers/mmc/host/sdhci-uhs2.c:73:16: sparse: sparse: cast to restricted __be16

vim +649 drivers/mmc/host/sdhci-uhs2.c

   630	
   631	static void __sdhci_uhs2_send_command(struct sdhci_host *host, struct mmc_command *cmd)
   632	{
   633		int i, j;
   634		int cmd_reg;
   635	
   636		i = 0;
   637		sdhci_writel(host,
   638			     ((u32)cmd->uhs2_cmd->arg << 16) |
   639					(u32)cmd->uhs2_cmd->header,
   640			     SDHCI_UHS2_CMD_PACKET + i);
   641		i += 4;
   642	
   643		/*
   644		 * Per spec, payload (config) should be MSB before sending out.
   645		 * But we don't need convert here because had set payload as
   646		 * MSB when preparing config read/write commands.
   647		 */
   648		for (j = 0; j < cmd->uhs2_cmd->payload_len / sizeof(u32); j++) {
 > 649			sdhci_writel(host, *(cmd->uhs2_cmd->payload + j), SDHCI_UHS2_CMD_PACKET + i);
   650			i += 4;
   651		}
   652	
   653		for ( ; i < SDHCI_UHS2_CMD_PACK_MAX_LEN; i += 4)
   654			sdhci_writel(host, 0, SDHCI_UHS2_CMD_PACKET + i);
   655	
   656		DBG("UHS2 CMD packet_len = %d.\n", cmd->uhs2_cmd->packet_len);
   657		for (i = 0; i < cmd->uhs2_cmd->packet_len; i++)
   658			DBG("UHS2 CMD_PACKET[%d] = 0x%x.\n", i,
   659			    sdhci_readb(host, SDHCI_UHS2_CMD_PACKET + i));
   660	
   661		cmd_reg = FIELD_PREP(SDHCI_UHS2_CMD_PACK_LEN_MASK, cmd->uhs2_cmd->packet_len);
   662		if ((cmd->flags & MMC_CMD_MASK) == MMC_CMD_ADTC)
   663			cmd_reg |= SDHCI_UHS2_CMD_DATA;
   664		if (cmd->opcode == MMC_STOP_TRANSMISSION)
   665			cmd_reg |= SDHCI_UHS2_CMD_CMD12;
   666	
   667		/* UHS2 Native ABORT */
   668		if ((cmd->uhs2_cmd->header & UHS2_NATIVE_PACKET) &&
   669		    (uhs2_dev_cmd(cmd) == UHS2_DEV_CMD_TRANS_ABORT))
   670			cmd_reg |= SDHCI_UHS2_CMD_TRNS_ABORT;
   671	
   672		/* UHS2 Native DORMANT */
   673		if ((cmd->uhs2_cmd->header & UHS2_NATIVE_PACKET) &&
   674		    (uhs2_dev_cmd(cmd) == UHS2_DEV_CMD_GO_DORMANT_STATE))
   675			cmd_reg |= SDHCI_UHS2_CMD_DORMANT;
   676	
   677		DBG("0x%x is set to UHS2 CMD register.\n", cmd_reg);
   678	
   679		sdhci_writew(host, cmd_reg, SDHCI_UHS2_CMD);
   680	}
   681	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
