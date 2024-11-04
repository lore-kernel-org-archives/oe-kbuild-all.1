Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507918622
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730744614; cv=none; b=bP1FA1ZVZ6hwWAZB+aTXKntZDuXXLu4wLpiRRL0KgnXfA96ZJ9NLgMXtOf8YFmOvemEM27dg43cU0lN7OdQUdQuK3eICm4ZMcEu83NVenP+SsbPbbgmmWwETQGEBP1pbRvo4pYPz4RFk9prJx06bPDqwskbJR+ZxYb1RGybeo5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730744614; c=relaxed/simple;
	bh=jc00/Ah1siBfjfVGdHfDeWrkdyrMjMH4fmdg5nNBjrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FwBOdAGf5j0T5dgs41Yi8q9NZ/pxnhlcHecNNgQsDsGejqbLN5t9cKjutT21MbP7lrawo7Q5wuMWM1UtZ3DT97xuEOPhjC4LDooIPDbqQEWWjJJAWIxo+zpRY5adaHrf1pR3z5BGs1kaqPxi8A2JCwOwTExn7ILJjVCLbiTIn24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLNv+4r1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLNv+4r1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730744612; x=1762280612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jc00/Ah1siBfjfVGdHfDeWrkdyrMjMH4fmdg5nNBjrY=;
  b=SLNv+4r1d/hxyWTQT7dHKYjVnREkVyrNPMDcBLiqKEJhy3u7rVf+Eftg
   OcZFLWBdDkbdo88mYOzRihfYyA0ejRg/3CCKXoFA7ovGxivaOh5VNWPZN
   5BOS/iwsw5QB6m+j6wiHSNpld5L4XDLjd5reRXodEsMT8baz1vZzus7XS
   UFyTcs3M6AZ2FlpCPdDFlMBDQorKoc2l8RAjya2ELK/erz/5LI54mhSGo
   bcSDmPLbjYX3US45cxkeQHwm8vqvrT9aQgIRT1YIsSLBpGLFipV9dm9wp
   EkU1tcXzZp/BTPNNkRKtSGDF8DPqw64AeehWkjWLZKnivpHkhYqCRISIx
   w==;
X-CSE-ConnectionGUID: cr2yeGjHQFCI6Hn+VL+ZaA==
X-CSE-MsgGUID: 8HI7r5c1QwuqZt2yqbNdTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29882640"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="29882640"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 10:23:31 -0800
X-CSE-ConnectionGUID: pvDXIshuQpWsssEqxp0wzg==
X-CSE-MsgGUID: uzPY7aBpRBux6BcPURre8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83671568"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Nov 2024 10:23:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t81jb-000l7D-1U;
	Mon, 04 Nov 2024 18:23:27 +0000
Date: Tue, 5 Nov 2024 02:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9863/16090] arch/x86/kernel/early-quirks.c:722:6:
 warning: no previous prototype for 'is_zhaoxin_kh40000'
Message-ID: <202411050256.qgVICxTA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab4fcabb7d813ddd7a455c85557f8d0891df4c41
commit: 8eaba08b2d72718a40cafe3402ab4f26b0dc62eb [9863/16090] x86/cpu/zhaoxin: Encapsulate access to global variables within functions
config: x86_64-buildonly-randconfig-003-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050256.qgVICxTA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050256.qgVICxTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050256.qgVICxTA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/early-quirks.c:722:6: warning: no previous prototype for 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     722 | bool is_zhaoxin_kh40000(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/early-quirks.c: In function 'quirk_zhaoxin_dma_patch':
   arch/x86/kernel/early-quirks.c:737:28: error: 'kh40000_dma_direct_ops' undeclared (first use in this function)
     737 |                 dma_ops = &kh40000_dma_direct_ops;
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/early-quirks.c:737:28: note: each undeclared identifier is reported only once for each function it appears in
--
>> kernel/dma/contiguous.c:209:13: warning: no previous prototype for 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     209 | bool __weak is_zhaoxin_kh40000(void)
         |             ^~~~~~~~~~~~~~~~~~


vim +/is_zhaoxin_kh40000 +722 arch/x86/kernel/early-quirks.c

   721	
 > 722	bool is_zhaoxin_kh40000(void)
   723	{
   724		return zhaoxin_kh40000;
   725	}
   726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
