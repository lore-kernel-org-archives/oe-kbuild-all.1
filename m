Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC912E4D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712253247; cv=none; b=A9dLmbNsbIcNs+paY/cvFr/ihyiHJFtdsCwPAM4gfC6nqj/0+kcWbhq/e1bfgQmU7JnJAnJ7qkHypoOdDgInAwz+1TJxH3bqPd72TbnSajD1EMefF8hqNvJLby9bgpr09vQa3wn99y96RfTOTKq4v9D1Edxg/3CcyEFCwfB2r58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712253247; c=relaxed/simple;
	bh=jo8GBsA4pItGc0CGsBUze6CxJcnbxFAhnCx8G1FbYtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gnrQ0Ow3bzPkLMWJF5i4+06FODiTlavjIjBJoxiIhukHDgfpOeZ0q584iwm/A+vubtWC6vRfxTkoypoh3eZZu8acY3k+8C14Ejk4FrQurcNSy+H9r/oR2k4rZAsiAigIQ3QdwG052fWN5xvEOTWjcqG7Kb3IwVcfTlBVaQnjg3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLb9spQ7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLb9spQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712253245; x=1743789245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jo8GBsA4pItGc0CGsBUze6CxJcnbxFAhnCx8G1FbYtE=;
  b=ZLb9spQ74ZeGlLK8yVdOemCzn1dQUtz6SPKF6yXTPN5DLWGwliXMd/wT
   IgM3aekCNhgIiUNO2fbT5m/FhQACx7WvxxWhAEiGGyooGrpI8P3l/Gc7+
   MCczYeUdOs2Pq05vzSJpNWK7CA0nXEu21gBiGmJ1zi2ClbaDrec+Qu2uS
   pMqUu+6jo7Xthf69ESWj74aeRN63s/FLjG8ScftRnmmgh9UfxX7A1LFxy
   82VcCued7mhRr+IxEmYaI2Uh2U58zOvNciU7IOjGA1ikGV04KKQwUmdvS
   pVIPUzbrg5cVXe8pRXtjuHlORex+gGIUQm37kRcUMenYcYjSXOJFJy0jv
   w==;
X-CSE-ConnectionGUID: jze0KpMyTVC3fKsRs/PXiQ==
X-CSE-MsgGUID: cS/W3TGCR6u3smDgLnZZGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="30025429"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="30025429"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 10:54:05 -0700
X-CSE-ConnectionGUID: p83L0XQOSgqw6BflnfP1nA==
X-CSE-MsgGUID: dzv1oc/zQkKE3dyprPV7fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18774718"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Apr 2024 10:54:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsRHl-0001L8-1D;
	Thu, 04 Apr 2024 17:54:01 +0000
Date: Fri, 5 Apr 2024 01:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20444/22045]
 arch/arm64/kernel/cpufeature.c:1287:9: error: 'a32_elf_hwcap2' undeclared;
 did you mean 'elf_hwcap'?
Message-ID: <202404050118.HPvTb5SP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e89315eb08769716cbf7e08f49672222cf0eca47
commit: 6dfc76f160cb5e8bf25cb85d4763cdc3144bfda8 [20444/22045] arm64: errata: Remove AES hwcap for COMPAT tasks
config: arm64-randconfig-r112-20240401 (https://download.01.org/0day-ci/archive/20240405/202404050118.HPvTb5SP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240405/202404050118.HPvTb5SP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050118.HPvTb5SP-lkp@intel.com/

Note: the openeuler/openEuler-1.0-LTS HEAD e89315eb08769716cbf7e08f49672222cf0eca47 builds fine.
      It only hurts bisectability.

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
