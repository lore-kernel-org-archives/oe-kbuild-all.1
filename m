Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D52AE77
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581241; cv=none; b=a2n4cCUzItsWM/DNOMzrWnpUUxmGmREYK+rFQ+Hlxfqx4JePmLlM7QdQvBrm/3CqYzD66arMVumrLVpNsxp7tIOk5GZKMd+Je2MDo1fTkGBq4WHkcltoyNUOY3+77/TjKLKivFQ0igYlcYE8WHydT3nsXW/UegIKolo72awtDPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581241; c=relaxed/simple;
	bh=gIE6MwH3D4GmffYqwAik+RCda6KbxzF08P7t34FEoVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uwj9pAoCj0AAVam7KBEKaOdx7OIAovUuvolPuZaAl0yvCkGPp7KhDMoM+Pif2lQSnyGnPWlKGU9uqUk7Sej3dEL3GeNg+L1s5tgpYtQNyRExdzRH+w7hvetDo0VQWRFVSVgWwYNbRcKlBitGY6mLPEkpOaCh7fm7VtNRdiX87oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/jvmHic; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/jvmHic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743581239; x=1775117239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gIE6MwH3D4GmffYqwAik+RCda6KbxzF08P7t34FEoVs=;
  b=T/jvmHicHBftEuBT0EM1ss0USOKLwRcVWFtlbXzhkmR64zgP5JzcR4F0
   wSw2cI/LmjiEKu3Kl2y0pMCqBQ6Ip50ZxnbpWmdWMMrtngfsK2tdX9Nk8
   PfI4UQ47XDdefaGmMAXJmC1yVT9Ofc79ADB2AmmAtN6KgGfechLTtD9/X
   yXl7q0j06ZaYdCaClyY9/XL3gXryW10SOdDHQLgyoDMtDxVUTUarrSmKz
   YX487Stoqo1WI3c+mp3k5dzspe1Cy8uOAfHlQ+ERoq30DI4c7yDlH7XQ0
   RzTUvvBz1uEtA42EhjssIIJTA+dL2Na4Y84rtRRsUfJ2qV3m1Lu7Jio2i
   w==;
X-CSE-ConnectionGUID: 6Lfl+ShfRmGF4NdQkE3/5A==
X-CSE-MsgGUID: Mcxz3TVrQEua2QjuQB7cFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48801036"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="48801036"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 01:07:16 -0700
X-CSE-ConnectionGUID: e9vCZx0HQ1aW5rwJdIkgow==
X-CSE-MsgGUID: e+0+HqZTTf2EmY6iNJqGew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="131487946"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Apr 2025 01:07:16 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzt7x-000AYk-1E;
	Wed, 02 Apr 2025 08:07:13 +0000
Date: Wed, 2 Apr 2025 16:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Laibin Qiu <qiulaibin@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1537/1537] kernel/seccomp.o: warning:
 objtool: do_seccomp()+0xa8a: unreachable instruction
Message-ID: <202504021615.GKzmsAcB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7951fd324625a8af5097e1476cdc8c33c6009b48
commit: e5d58f5ee731b2ff4e5c801cb875c804c63593e4 [1537/1537] seccomp: Invalidate seccomp mode to catch death failures
config: x86_64-buildonly-randconfig-004-20250331 (https://download.01.org/0day-ci/archive/20250402/202504021615.GKzmsAcB-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021615.GKzmsAcB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021615.GKzmsAcB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/seccomp.c:190: warning: Function parameter or member 'ret' not described in 'ACTION_ONLY'
   kernel/seccomp.c:190: warning: Excess function parameter 'sd' description in 'ACTION_ONLY'
   kernel/seccomp.c:190: warning: Excess function parameter 'match' description in 'ACTION_ONLY'
   kernel/seccomp.c:320: warning: Function parameter or member 'flags' not described in 'seccomp_sync_threads'
>> kernel/seccomp.o: warning: objtool: do_seccomp()+0xa8a: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
