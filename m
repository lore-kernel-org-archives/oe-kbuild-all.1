Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4861F03D7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097358; cv=none; b=uEKPraDseYQ1pSMz4H5Hb9o1jb9KJWV+Sh0Y27a6c8aKAMMSBfQQioAMrZEhR/fwNDkBTsinpx0FsUCN7mUVZAJUGdKPATCMv3ybJQQyUlBuqJZiCwM0mVMHjBdZoovh58rE8ttJYzoOY5GEKJDowfFx3cM8Tvzo64SU0o/Vk7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097358; c=relaxed/simple;
	bh=89IT+QTLa+ab0iqAML6c9w4BrH05tIiuFwIbOAv1Yhk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hSjThYYH9M5Yn/AmUldbPdA7WtK7qnk3Rm11mAhmAamzn+T/X00s1dQUUwLc2yXZaOC0Dg2Yr5hc8Y8kubxr2l6h41qUns8/D1hTPPFF7iRIi2fUSquAWI/yXXgSlNDyMqICBcY+PdxTDRfHga1SViysR0xhLn7T3ciOgUNP2rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBFaqzV9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBFaqzV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773097356; x=1804633356;
  h=date:from:to:cc:subject:message-id;
  bh=89IT+QTLa+ab0iqAML6c9w4BrH05tIiuFwIbOAv1Yhk=;
  b=JBFaqzV9guZl4ARMeA5Zbg44e1SU6mcPJyvXDS8miecD9RAbX0u9YgiA
   crIki8/ThhpGvUfzl7MtFBo+rHKBgqE4VQRDGyfWuJfr3Q2tJzghfYuRM
   K9wLUevKee3yg+4Ob41fZ1GTnfNN1pZGKGb4np2aqlyJj1Wnv7skhOuVK
   DbBlOL6oP4IH/JgGiXVFX2ArQqTNGSuAkRJoJ3AY29CPAE2cjX87yP1QL
   5HaEsDZ+sSL/LXHhIDs3IanyRs1caQtYFDQ/keoTsE9PczjWfhQkTKBME
   76sI7rVg6sW++yGte9wnFNc8Rk5tWtmxWT2kHLkOSCPZPzT2pNk8kfIR7
   w==;
X-CSE-ConnectionGUID: eOYv7aDFRjq6cZz7w0KfSg==
X-CSE-MsgGUID: LQzQtLShQfqLontLbniiIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74248069"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="74248069"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 16:02:36 -0700
X-CSE-ConnectionGUID: BWtdSPqeSNSqhrie+e49IQ==
X-CSE-MsgGUID: 9ciiLq9ESLuM6/KPMl83yg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 09 Mar 2026 16:02:34 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzjcO-000000002xW-0yFU;
	Mon, 09 Mar 2026 23:02:32 +0000
Date: Tue, 10 Mar 2026 00:02:00 +0100
From: kernel test robot <lkp@intel.com>
To: Chiara Meiohas <cmeiohas@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
 Maher Sanalla <msanalla@nvidia.com>, Edward Srouji <edwards@nvidia.com>
Subject: [leon-rdma:fw-lsm-hook-v2 2/4] security/security.c:5392:1:
 error: expected identifier or '(' before '{' token
Message-ID: <202603100003.SLtKXwVj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git fw-lsm-hook-v2
head:   6ecd3e51800ae840af7be672077ab1e9d0af365e
commit: 59b61e265be95f103df6fa7a195c287b7604dd67 [2/4] lsm: add hook for firmware command validation
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260310/202603100003.SLtKXwVj-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100003.SLtKXwVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100003.SLtKXwVj-lkp@intel.com/

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
