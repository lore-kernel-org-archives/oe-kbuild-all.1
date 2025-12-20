Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09B31ACED5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 17:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766252916; cv=none; b=MsN8n1bGtON1b2Ug1JG5FV4GUXlwbQ93aEnaznWZOzccS2gmdkPoApgrZ7Wb5sKobxeCJeeduGaYKBgBLDPnZYgAJoVFZM65hULqAEj6PDYndJ2mAurAmRXZdAmwQlCMeIwOHoZyP5e35sh7YLvoSIJxDvfFUh9tbsH0+/hjR30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766252916; c=relaxed/simple;
	bh=l8+V/f/9DA+2Ct/Akb041Oein8l3MVyldf62iLMC9oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XzzB08hnNR/HlkDWzbVHMgnobGNheJlVl7o2FxMIQV3aMHfwj+4DGttWJP85ETgDQ3TfzMzl8c0WiTtQkLDFCSipLnuoMc1qEB781iOpEK1/ux9a0T9IlXUhx/V1ni+/JX3KWGfhpj2Dft3t3iiW7H5SXUixoepdSIZ0moFA4mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuhTRJT0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuhTRJT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766252915; x=1797788915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l8+V/f/9DA+2Ct/Akb041Oein8l3MVyldf62iLMC9oQ=;
  b=HuhTRJT0JOPI2IjbxfCmyArul9Xpz4O4lWEbJwuA2xvfBxx9EXA4NjAF
   LemLMLKM7iKjqOV1Uz4J890yPUu5pm2gYONbyrLafyaDCJpHbAOD3ZctT
   UUe8LiLxaKZMA9XIfPJbbpFhOrgftjKgKx0OmH/2HoVuriWtTak8G69r/
   P+EDnp0cEy0BFGjGz01AuBiqLIIr2DrOQUuQDxD4EtVv+fjgsS6o+ZSWl
   tP2pFRaIYLuxd1R4rDsEpNe+PQuRUk2A+BfcxENebWwvz7hqM3yg5QgMM
   xk6zQa7nlAAr3Ypilj7zwogh2soc/eGZ5PMeeHEn3AMVbqfY0bXGwks9q
   w==;
X-CSE-ConnectionGUID: MhbdyBwLTjK63OUUmCbyNQ==
X-CSE-MsgGUID: AjfBrWswRMGxTLZdmsa8pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="55754534"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="55754534"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:48:34 -0800
X-CSE-ConnectionGUID: MyU5MJZOR0m3AMait1GMUA==
X-CSE-MsgGUID: qywbsHVBSFmkhzgZn0eq6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199050247"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 09:48:33 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX14B-000000004yG-2izX;
	Sat, 20 Dec 2025 17:48:31 +0000
Date: Sun, 21 Dec 2025 01:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:spec 129/131] Warning: kernel/sys.c:3251 expecting prototype
 for sys_setfsuid(). Prototype was for __sys_setfsuid() instead
Message-ID: <202512210109.XLq48weY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: d905125c2e0652ca410fcece9b90b862974f9e53 [129/131] kernel/api: add API specification for sys_setfsuid
config: m68k-stmark2_defconfig (https://download.01.org/0day-ci/archive/20251221/202512210109.XLq48weY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210109.XLq48weY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210109.XLq48weY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/sys.c:1998 expecting prototype for sys_setuid(). Prototype was for __sys_setuid() instead
>> Warning: kernel/sys.c:3251 expecting prototype for sys_setfsuid(). Prototype was for __sys_setfsuid() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
