Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB2118C2C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765216615; cv=none; b=Cf64iqa1z+99L+PIABr/ppOsi/sr0Y1DTGFN2sXyN3WEtMo5gm2J0X+4SgeJ36GrrPUSXMgAiTOFIlIWWzKUO7ppPsep2OyNKe4ULDwGuCMoWgRbN4rOosJF2qy0t/A1g+jY6YVjbWj8DqVASoCQZ+QYlO2kjliV1CVsSeLlF7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765216615; c=relaxed/simple;
	bh=xAcpbuppwrzF7mCc7b28y/gD0DuxpdPRyk5UAYxukwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n6aipAgjqyTZ9SrKvHj7ou0NE4ZdWgnecsVzRB9bDaLWI+nLru7+diZhDZvAEvAEQYAJz/BblHZgL8MWYIlzzEBTuMoshhLeEXcQLz3rOqr1mctvyCArPSgTZcRSDMyIyuGTFoteC4nLemlg8V6g6MeIkxRgwX+I7e0vKyoburE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFsWTYdF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFsWTYdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765216613; x=1796752613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xAcpbuppwrzF7mCc7b28y/gD0DuxpdPRyk5UAYxukwQ=;
  b=lFsWTYdF+LbrHmOcfqkuax8lCiygRcHbvEq81CtZ+nSs9cQm/+DlRkPQ
   5pbEOzV2N66cFRR3JIP+eH3ARJ+VJP6VuiC7uEvf3xiAnr1oPyqOpAAoX
   BH58tLNW466soV381CVSndBj3ftiRHfPcTPEVfXjSckTVX9gWns9AvTnn
   GfWmn7vxMfLLI6KHrxSxs2Ml1/JKa9BNH1rWrjMDVWuQ5YeNp9rEQnmHP
   ww42OCKPsgLBm5M8UkIu2V4GFGG3LjowQmvyk12E/Az9ec+4jyPARUozZ
   9a/vejInuk9GpbrpUH79jzMOFA+FNOUUA+YotOs0OOMj0zUtN33uKgVIW
   A==;
X-CSE-ConnectionGUID: 9U0cq1ETTCOQxQmnSxkvag==
X-CSE-MsgGUID: niNYmP/jTPqd+HWIj/9Fog==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67328635"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="67328635"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 09:56:53 -0800
X-CSE-ConnectionGUID: fKV2g6mmS+OXxGPQwwG/VA==
X-CSE-MsgGUID: Y83F694IRP+N9D9+/ZV/mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="196275088"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Dec 2025 09:56:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSfTd-000000000h7-3ToV;
	Mon, 08 Dec 2025 17:56:49 +0000
Date: Tue, 9 Dec 2025 01:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/no-macro-conv 22/28] kernel/sysctl.c:1062:1:
 error: expected identifier or '(' before '{' token
Message-ID: <202512090100.6ckCluIb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/no-macro-conv
head:   2728b6e9ae21d434fa0398d74843da3ae11235a3
commit: 67e8f7821aa32fb3308bed04113e0106fbe45711 [22/28] sysctl: Return -ENOSYS from proc_douintvec_conv when CONFIG_PROC_SYSCTL=n
config: parisc-randconfig-002-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090100.6ckCluIb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090100.6ckCluIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090100.6ckCluIb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sysctl.c:1062:1: error: expected identifier or '(' before '{' token
    {
    ^


vim +1062 kernel/sysctl.c

  1057	
  1058	int proc_douintvec_conv(const struct ctl_table *table, int write, void *buffer,
  1059				size_t *lenp, loff_t *ppos,
  1060				int (*conv)(unsigned long *lvalp, unsigned int *valp,
  1061					    int write, const struct ctl_table *table));
> 1062	{
  1063		return -ENOSYS;
  1064	}
  1065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
