Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED215136353
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 03:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734406690; cv=none; b=pGk7vVhUtpUmgH5MpU+izLIFgpaiG2sVKcUtBVdFpTwwBLZDQ4JCQhCZJXAhEKsP1kz1riqvwOeovfRIwViypZtMz49PqbtjeQREqlrTRdKhNhR5GxRt4gu+PJShdeIL4+UZyRy8RU5bn36rTk8+5WAf1i4nJQzX1dtOYcipuSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734406690; c=relaxed/simple;
	bh=hamjGFVmq9uLCiJtbVlj7wwNBZ8V1m58Nwb78KXrwLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZyRFromcm0lyxbWZD7DmKwfGnkI8wRCkb7Mss/wUPxhsegdfYJP4U8PafUkIfwUTSnAdSOV97DpAtYZA41WQvcqUEhiuzWHZn7e3DaisXiVJpvcbEamJtAkT8monZysdkWf0AobiVgeb2qwZRiOOvIRp/3hdiQu7dBCvBBLjTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5agoKO8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5agoKO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734406688; x=1765942688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hamjGFVmq9uLCiJtbVlj7wwNBZ8V1m58Nwb78KXrwLU=;
  b=Z5agoKO8nVY6ilxIidKEV9SbQAUfmsT0/OY7K8UtOlp+nmOlRMlNVfy4
   wJzdCb0fHN4UfRFtX9noU0BFV4QacEsikJwV64eg4ILG3Y8w2tzrDZbPm
   p9SYFxH+uppPR027yNdL/ilp15e2qWEnpAJOgCYNr86lj6/cSMGtIdvNq
   MT9aBRoR5o02qxrJPEYND0UcpEkjMzH6zgCu1uBbXqVN1Z1u09agryP9A
   /GKp0kUts1ovpD3TmAVcJiR9hiJo5F0ykUQsctrbCOJ1o9g69Kk276DEE
   5XiXcchsatGIZiyjP+MeRKcT8aJLcDxnQOQL7qTNBvPglR1QgC/EcgHnC
   w==;
X-CSE-ConnectionGUID: JWrjWYc5QGq15NT+2qKOMg==
X-CSE-MsgGUID: fFIIHxURRE2EPRCJ7ffnuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46228954"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="46228954"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 19:38:06 -0800
X-CSE-ConnectionGUID: pQLyknIoQd6iFgiKk8THvA==
X-CSE-MsgGUID: 8nTkNSBjTYiNOcCUXaUqAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; 
   d="scan'208";a="97851288"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2024 19:38:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNOPL-000EgO-1M;
	Tue, 17 Dec 2024 03:38:03 +0000
Date: Tue, 17 Dec 2024 11:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 415/415]
 arch/arm64/kernel/cpufeature.c:1287:9: error: 'a32_elf_hwcap2' undeclared;
 did you mean 'elf_hwcap'?
Message-ID: <202412171157.Byg5cMtg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c61b557e10db1fc3739c4004839a13ab61992e3e
commit: 6dfc76f160cb5e8bf25cb85d4763cdc3144bfda8 [415/415] arm64: errata: Remove AES hwcap for COMPAT tasks
config: arm64-randconfig-r112-20240401 (https://download.01.org/0day-ci/archive/20241217/202412171157.Byg5cMtg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241217/202412171157.Byg5cMtg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412171157.Byg5cMtg-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/cpufeature.c:1287:9: sparse: sparse: undefined identifier 'a32_elf_hwcap2'
   arch/arm64/kernel/cpufeature.c: In function 'elf_hwcap_fixup':
>> arch/arm64/kernel/cpufeature.c:1287:9: error: 'a32_elf_hwcap2' undeclared (first use in this function); did you mean 'elf_hwcap'?
    1287 |         a32_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
         |         ^~~~~~~~~~~~~~
         |         elf_hwcap
   arch/arm64/kernel/cpufeature.c:1287:9: note: each undeclared identifier is reported only once for each function it appears in


vim +1287 arch/arm64/kernel/cpufeature.c

  1282	
  1283	static void elf_hwcap_fixup(void)
  1284	{
  1285	#ifdef CONFIG_ARM64_ERRATUM_1742098
  1286	    if (cpus_have_const_cap(ARM64_WORKAROUND_1742098))
> 1287	        a32_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
  1288	#endif /* ARM64_ERRATUM_1742098 */
  1289	}
  1290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
