Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E37344DA6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092619; cv=none; b=MlGadtUbuBuCaVvmQbZfw2bBrv+51RYxlo4DqsbXxGPU7gxKFL8l9I5BVYK0Cnj+OkRVKfPYGQy1bDcSXG3ky6ylFo6wVLqyb6m2EjTbwFfLhVBmFhX+OpYMAfRuyrGYUapc+8KjjL2YoOlf2E3cDs/XjmMOsy8queN/9Yz1hLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092619; c=relaxed/simple;
	bh=Fzb0ixKAdUF4LvkFVjDc0FLmGKvT+716o1mLXLz2jNY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SPpDMLeek5VB59tWfpDVsbNJakDuPoXOJ10UX2UK6k3KpOYr8fESKlz9rMfAifyhhoxyA0u1CHDMcCGbc6bbTGMT1H6VOy3WeBiLFMf/XL+5dh6vOYxhsSdSAZdm3aCN2wf/L1IzU7617/78mmyJthlj+E/sNDbWqVeyrDYhuEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yhjb/AEq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yhjb/AEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773092618; x=1804628618;
  h=date:from:to:cc:subject:message-id;
  bh=Fzb0ixKAdUF4LvkFVjDc0FLmGKvT+716o1mLXLz2jNY=;
  b=Yhjb/AEqZ7E5evbwFLYMJ/mQnSLo9nXtoZSnRJEhMPfISC4Dvc03DXfw
   Q48BEjHT2pSW90Jl8FM3p6fgsE+FDr7qtOkNXsyN8oSGEag5feynTrlGq
   q8T4QmJ2+D9i2EOFwznPY9fLok/chB/VAZoPO5Z3hhyWqqqcXWhLwsVcQ
   1o8t2rsRFKAMLectDGlaIM89dz7LoQS/g93dVoRYNMADf+9g5WjMyHWKE
   9tUi0BUVnQxyiTNiI3EV+w8NDVVR4AvwumvlINigH5sDXPsLSG3pKQcXb
   h8ghe8Cy5bDCBeE3FoOqewKe8g8OOQ3SWrmgxDulQsK2IZERStqexx9YK
   g==;
X-CSE-ConnectionGUID: t5TUC7XhRtarGXwHWY/UCw==
X-CSE-MsgGUID: fqeVpx14RPqxqOrdbWZ5RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85216279"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="85216279"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 14:43:37 -0700
X-CSE-ConnectionGUID: nSn0xKOTQ4i7OiDcW7i6Gw==
X-CSE-MsgGUID: l346rFDKS7aAKh87dba4ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="223995478"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Mar 2026 14:43:35 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vziNw-000000000rw-2lNv;
	Mon, 09 Mar 2026 21:43:32 +0000
Date: Tue, 10 Mar 2026 05:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chiara Meiohas <cmeiohas@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
 Maher Sanalla <msanalla@nvidia.com>, Edward Srouji <edwards@nvidia.com>
Subject: [leon-rdma:fw-lsm-hook-v2 2/4] security/security.c:5392:1:
 error: expected identifier or '(' before '{' token
Message-ID: <202603100543.SBaUfuzS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git fw-lsm-hook-v2
head:   6ecd3e51800ae840af7be672077ab1e9d0af365e
commit: 59b61e265be95f103df6fa7a195c287b7604dd67 [2/4] lsm: add hook for firmware command validation
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260310/202603100543.SBaUfuzS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100543.SBaUfuzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100543.SBaUfuzS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/security.c:5392:1: error: expected identifier or '(' before '{' token
    5392 | {
         | ^


vim +5392 security/security.c

  5375	
  5376	/**
  5377	 * security_fw_validate_cmd() - Validate a firmware command
  5378	 * @in: pointer to the firmware command input buffer
  5379	 * @in_len: length of the firmware command input buffer
  5380	 * @dev: device associated with the command
  5381	 * @class_id: class of the firmware command
  5382	 * @id: device identifier, specific to the command @class_id
  5383	 *
  5384	 * Check permissions before sending a firmware command generated by
  5385	 * userspace to the device.
  5386	 *
  5387	 * Return: Returns 0 if permission is granted.
  5388	 */
  5389	int security_fw_validate_cmd(const void *in, size_t in_len,
  5390				     const struct device *dev,
  5391				     enum fw_cmd_class class_id, u32 id);
> 5392	{
  5393		if (class_id >= FW_CMD_CLASS_MAX)
  5394			return -EINVAL;
  5395	
  5396		return call_int_hook(fw_validate_cmd, in, in_len, dev, class_id, id);
  5397	}
  5398	EXPORT_SYMBOL_GPL(security_fw_validate_cmd);
  5399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
