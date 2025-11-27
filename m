Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3623305077
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 19:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271770; cv=none; b=VUaten0LYTezj/Jxd+t+5n3BhjBUPmYplTeSqPjaSd7c9lknNOq5u/WyFOJZ2JkU8D4ZPWyBPCgBp29CwIyoK3Ue7P2aNzbiDIPrifipJ+Z02uQJPSUUDFFUSHMP9aEnbHlLwc2MRpUzKla9vo4v3jJxZeHHNEuPr18QDS3c4pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271770; c=relaxed/simple;
	bh=IoJDqo3p2KUZ6CfHm4PkzJhsZADgqOzfnts8yppvMng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ryxbfgKlg/yBc+2GQCkO72XIHVvZqUON0Pygz4wNJF5e5z5kp2S++v9+E42wmZn8WhDAiMqlTvVgcgpbYMBnL1nx/aXdhYhyvQGnZ6O6G3w4iChlIQ5kfrO8k5ZO+CEfRGjma8AN4+KH+FCLuCJw+qGJRUlQBin42IA62G/zjHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MU3ajGpo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MU3ajGpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764271768; x=1795807768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IoJDqo3p2KUZ6CfHm4PkzJhsZADgqOzfnts8yppvMng=;
  b=MU3ajGpoo3eZjhRejpLTLC22Vy8c7XfF43Wcn6NZ2Fbh4yduiLW80UFg
   DksL+JAx6CaeJKlUdQKGHXTJSJlgsxsMRuM2cuCiBz8QUBYXmCx4b1v9q
   EG/HHX8A1KXKFNfBlCxYGE3cJHRvgHW0FrO++DlYLrQAfNj8c8UwTJzpe
   /q7EhMjkpIhJChiFBFUBMzd6ASJ2uU13g0JDRC6qvmvn/xFON97s8lYBD
   z+mBt14Ng2HMg0sF6lZpd7Ydep0AwhCPRx7/5RGqsPJHCdIT/SeDNL9K+
   GLh73aJPrXuCZX43Z0VveqcN0OxN2FIQasNkPqVGMciM0T1o55oF+pghv
   g==;
X-CSE-ConnectionGUID: isbOw80hTbu/E9vOtNcTGQ==
X-CSE-MsgGUID: I5YI1gJaSP6xYDgmOJdW6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="53887358"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="53887358"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 11:29:28 -0800
X-CSE-ConnectionGUID: fadmlSSgRNuSAaw7Dnv61A==
X-CSE-MsgGUID: yU2C/FaKSR+ZZk22kjhrzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="194095708"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Nov 2025 11:29:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOhgC-000000005a4-2EiN;
	Thu, 27 Nov 2025 19:29:24 +0000
Date: Fri, 28 Nov 2025 03:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Subject: [linux-next:master 12118/12398] kernel/liveupdate/luo_core.c:402
 luo_ioctl() warn: unsigned 'nr' is never less than zero.
Message-ID: <202511280300.6pvBmXUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: b30a1fee674c8446bebd9e399b267ac824093bc8 [12118/12398] liveupdate: luo_core: add user interface
config: x86_64-randconfig-161-20251127 (https://download.01.org/0day-ci/archive/20251128/202511280300.6pvBmXUS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280300.6pvBmXUS-lkp@intel.com/

smatch warnings:
kernel/liveupdate/luo_core.c:402 luo_ioctl() warn: unsigned 'nr' is never less than zero.

vim +/nr +402 kernel/liveupdate/luo_core.c

   392	
   393	static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
   394	{
   395		const struct luo_ioctl_op *op;
   396		struct luo_ucmd ucmd = {};
   397		union ucmd_buffer buf;
   398		unsigned int nr;
   399		int err;
   400	
   401		nr = _IOC_NR(cmd);
 > 402		if (nr < LIVEUPDATE_CMD_BASE ||
   403		    (nr - LIVEUPDATE_CMD_BASE) >= ARRAY_SIZE(luo_ioctl_ops)) {
   404			return -EINVAL;
   405		}
   406	
   407		ucmd.ubuffer = (void __user *)arg;
   408		err = get_user(ucmd.user_size, (u32 __user *)ucmd.ubuffer);
   409		if (err)
   410			return err;
   411	
   412		op = &luo_ioctl_ops[nr - LIVEUPDATE_CMD_BASE];
   413		if (op->ioctl_num != cmd)
   414			return -ENOIOCTLCMD;
   415		if (ucmd.user_size < op->min_size)
   416			return -EINVAL;
   417	
   418		ucmd.cmd = &buf;
   419		err = copy_struct_from_user(ucmd.cmd, op->size, ucmd.ubuffer,
   420					    ucmd.user_size);
   421		if (err)
   422			return err;
   423	
   424		return op->execute(&ucmd);
   425	}
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
