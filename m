Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F838DD8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 12:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119924; cv=none; b=MZRxZykNGjpdIXsUum5fF+9Uq3BhXJEynXQrEF9PRCT9qRMMIyvZku5pp2MtzJ79jXZWJp8Rg3nxqKCUhNoNQdyJBFwttczn2aD4ZSUK3bhGMNT/M3dSoSzqCFJLMX22Lds/6zAKfvUgY0GmUA1duaeeXUzTX+XYk7xB2I/P70U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119924; c=relaxed/simple;
	bh=gVtx6hxDs642FhbDCSyTm+lYeZFqy/m+hS1IaT4UbFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AehEyGLTyRAF0Ud5T7VeJkmzMHwBj61ovmHc26eKgO1ggQpNpFvxBnzhviGbIOZtFeDnp+Tc7hVOnoMXjvxMurKHE7eIgnbtCYA6L0PUxGiTt/fk/3wnkgPDyvAfI2L+u5OdgoeKm5GmTqTBYvXOAZLp+GbBcgNuV1JpIit3QwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Di5HJt1K; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Di5HJt1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730119922; x=1761655922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gVtx6hxDs642FhbDCSyTm+lYeZFqy/m+hS1IaT4UbFY=;
  b=Di5HJt1Kpx3Y6du3gN7tgI3CFhVcvaRNCBl5hW9EJPSdbEmkjceRnl2s
   DOCT1LbBnL2TIOjtVwSP0CQDKbrYdFhtkKG37gjNE3AETW+NbjBziXn9H
   DlYMj3rVB6geBIxgM8CqMHvrYQ4zEXSjD1CViOOjW3+tlDIJoq4vkcZxL
   rnR7fQFJNbe28b2xO9KuVuip1f94JPuW1qwTxCgeprViZVjfkvr0ij6e3
   Kpy+N9xlEeqOr0hPCjfKqpBoxkfJu5f+Wym6njj6eFhAIqHZQZjgWVFT0
   uapi3RhCXkSpZoyZrMCoCosAigW1KdZHxslQ+CV5TabnbK4VpAWYcLzQC
   w==;
X-CSE-ConnectionGUID: shds9GJ7TQ6hqBdSCN766w==
X-CSE-MsgGUID: QKo8cjwpRca6skMkRGqInA==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29616438"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="29616438"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 05:52:01 -0700
X-CSE-ConnectionGUID: n7ScY+jAQz2b7xK9EXZLOQ==
X-CSE-MsgGUID: 9AyDxDJ2TpyQqSh0/Hy93A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="112442432"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Oct 2024 05:52:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5PDy-000cRm-1n;
	Mon, 28 Oct 2024 12:51:58 +0000
Date: Mon, 28 Oct 2024 20:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20444/23875]
 arch/arm64/kernel/cpufeature.c:1287:9: error: 'a32_elf_hwcap2' undeclared;
 did you mean 'elf_hwcap'?
Message-ID: <202410282030.pKjQvIBc-lkp@intel.com>
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
head:   858328aa50984206eb1dfc7218a03c5cc0165d3f
commit: 6dfc76f160cb5e8bf25cb85d4763cdc3144bfda8 [20444/23875] arm64: errata: Remove AES hwcap for COMPAT tasks
config: arm64-randconfig-004-20241027 (https://download.01.org/0day-ci/archive/20241028/202410282030.pKjQvIBc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410282030.pKjQvIBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410282030.pKjQvIBc-lkp@intel.com/

All errors (new ones prefixed by >>):

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
