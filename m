Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7AA20D4FC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607137; cv=none; b=GU1w7LXcLTfs0tozUMUs27zs+o5Y/NuOuocrSfCTblEFvGVjKwk/WqcrlQBu1Cxq7bvhWUwOIHs8hj9mz4lXa6BVxAYrHnMYc2KkJD6xp3dIsqfv5UCj1HapBL8MiWEQ418BhFmbI1KdnjYxd28CU0xxZMWJmD2PVNFqJsJnLog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607137; c=relaxed/simple;
	bh=4GewxgBvBLnT/lRtMUdluZO2nn5I8jLksLAN0aGV62Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oY3617LjVdpzCIEmQN4dmhZhDYTpj12u7psqoUaQboGkVuvzirZ8ZyfOBNqK7cIQScKRThDXnCARYmzgph2UagI8gzS62eJcVnLWJ/vKwgulWm4lcbzDg6Qy0d7gPV8EdRTIvrqHMHsrSSkrt3V1sSyNTS/vbOQXsp6f/qUaZTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0Ut/u+4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0Ut/u+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746607135; x=1778143135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4GewxgBvBLnT/lRtMUdluZO2nn5I8jLksLAN0aGV62Y=;
  b=G0Ut/u+4K9ysM++exxehY7Xlx18uRfqlmSP9ZwLH+alO70nh4U0C2iwO
   0xYjM/99wbkf3ipPWHdxvZFBqQgK5RRc9FENopOXl07o7xmNyGLY7whuf
   NaC62tQXCYI+nmhMHrerAhbgtW/ZzXVcSmyKW4cqWT6MlJyIuir3e0V/Q
   gTwImsO7rQGoMumW6uZM5wRSLcyCZsU50Cz9A3FXxzJQEWnnxaR/gbkLk
   buPAf+KISC0+Y3gZ7tQPqBtYkGl9n0TEFx9cUk/BJW7wbwD/vH+OAalf3
   HUIXAdThohheh9pBpcxDR2YkqdWKqoQU2FJDlzeSTCwkzEhxtkHEoItKS
   Q==;
X-CSE-ConnectionGUID: BkTFH18xQ52aPuI+oStU1A==
X-CSE-MsgGUID: 1lRWNzy6Re6DL4a8HZakjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48195730"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48195730"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:38:55 -0700
X-CSE-ConnectionGUID: fQNgV7UATdyjcgCW7BmmZQ==
X-CSE-MsgGUID: GwcFnvLVTp6rxuyMTy213g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136410610"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2025 01:38:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCaIl-0007QM-0p;
	Wed, 07 May 2025 08:38:51 +0000
Date: Wed, 7 May 2025 16:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1392/8679] vmlinux.o: error: objtool:
 vmx_handle_nmi+0x96: call to is_td_vcpu.constprop.0() leaves .noinstr.text
 section
Message-ID: <202505071640.fUgzT6SF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: fd02aa45bda6d2f2fedcab70e828867332ef7e1c [1392/8679] Merge branch 'kvm-tdx-initial' into HEAD
config: x86_64-randconfig-r053-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071640.fUgzT6SF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071640.fUgzT6SF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071640.fUgzT6SF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: vmx_handle_nmi+0x96: call to is_td_vcpu.constprop.0() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
