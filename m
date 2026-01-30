Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ED933E37C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 18:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797707; cv=none; b=opwWDT7r5UOGeFsjzIynqzUWGynYPC39Wo7nPgtT2Xiwe/bzsC6NTkJudb0VNlsEh23hqk7i4ltFhzoUyO8QqKKJQNmCD4RNm8gWcx2pywXdgOfF7TA/FzyEGjUBzuTJ2SQHU0pWiPCQO5YDlxGT3i5DFPDkZutR26T4kyWo/Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797707; c=relaxed/simple;
	bh=zP+TojOPsrEIh1sAou2Q6k2jvaiK2MydLJM2v9Gbda0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wp947RzAIHtRX1ZjhS9Q2pxJyhCqmblV2lIz4Vd9laH80XHvDM2kYXw1FgFV10WgReECAQDZ/xtS63TWoVnWpyCwVZGHmhCaCXmQL3PXqoRXigyYTsBUp9yYBXqzRY4i3lBU0aMZKe/wREvXgzyPw3EvcxR/PX9RNFOcnyvE5+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+s2lC30; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+s2lC30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769797707; x=1801333707;
  h=date:from:to:cc:subject:message-id;
  bh=zP+TojOPsrEIh1sAou2Q6k2jvaiK2MydLJM2v9Gbda0=;
  b=S+s2lC30jWnLD6ccKg9+Yeabp0vhFwfgVQRGwJdcjn/UKlZ/60lYa4Oe
   xfuRTzK/elMpIB95cfp+0YSFWe+Aly/gyEPlZx6+yhavtG6KFskxAj7u1
   zl7cF6LgGCvRvmSv8A23+q5MubLhfjerPsxKGNDcicRhFgtAU0eSsSHM0
   w5XPNHsMjZELOfnfhhDsSLd5WZiPcLk8tvYLyIe4sY1aIvKXGKhd5gnVO
   N0YRKM+/GgADNDb5UE3OnnHlQu3Iax3vlFSkHViNTIAmYUqvDmkQujaXw
   L9q0q7NkBJ0QIVOXtvgBWQRJLzbOzVOQbJDT7f2vsMl+ldItyZG3O8ZoM
   A==;
X-CSE-ConnectionGUID: EaP2DF6DSFCipyoqhoYPRA==
X-CSE-MsgGUID: b1oAzoZ0SDiBv5uOMnmCUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71089791"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71089791"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 10:28:26 -0800
X-CSE-ConnectionGUID: UwwGCez7Tk+3tTBFN0ckRg==
X-CSE-MsgGUID: qkQWXWgTSoKXRsS+q5aG2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="208174009"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Jan 2026 10:28:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vltED-00000000dDs-3Awc;
	Fri, 30 Jan 2026 18:28:21 +0000
Date: Sat, 31 Jan 2026 02:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 85/101] hppa-linux-ld:
 fs/xfs/xfs_trace.o(.text+0x3ffc4): cannot reach
 0000bb70_trace_handle_return+0, recompile with -ffunction-sections
Message-ID: <202601310235.NuaAOMbm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   a71b4fbb5f9908b0e1a9ad21faac5475d08987e8
commit: 1823c63572618b0c9012398c45905299655773e5 [85/101] fuse_trace: let the kernel handle KILL_SUID/KILL_SGID for iomap filesystems
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260131/202601310235.NuaAOMbm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310235.NuaAOMbm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310235.NuaAOMbm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffc4): cannot reach 0000bb70_trace_handle_return+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffc4): cannot handle R_PARISC_PCREL17F for trace_handle_return
   hppa-linux-ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
