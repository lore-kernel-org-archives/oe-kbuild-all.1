Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D8932E75B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 12:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760533162; cv=none; b=uZLA62aMyVOTJxgTcZPflg4dSn6bqP9F56zx1YBZ5AP2f8uwByR3+xxjylhwq/78F/5Y4DjntXxXaabzmT3s+lL1L7VU/6Ud2lankmys53orym+2/1RvshT3KUcaRvmtmdmSZGFMmrt5LqxoGfrONSdtaMh/Er0t8bjqUQlMKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760533162; c=relaxed/simple;
	bh=6uvgU2DO/vJBfjeKJsnaa+R1w9fMeXXQbnP/pzNa2/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoI9C6Klo7zzBU35niwpliusRvF0OOcb2pirKQitg+usFwldvoA/LTzetUtlZwB5Y5cVIWzA7nUvH0jvRudVvv3rzVNgimmDSAGajgakbgwM19xVTyBF2lg4fsRWSHrhbyAUt4/9kMIYVxwBGeKEz6NoQU3kxwiU1NVmUodUmG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5oOb/VF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5oOb/VF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760533160; x=1792069160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6uvgU2DO/vJBfjeKJsnaa+R1w9fMeXXQbnP/pzNa2/c=;
  b=n5oOb/VFu2pFvADuSwkC6Ie1Wp/9RAN74x8gzpmM3ZzpLdk9zeyIx+GU
   eSPa5Pzf3mUL5uVIRBtARUaydR0ciO3u5bQcrVms6Fe+wV4cnPhO86QHw
   cpH3PbcGaeL9EkOCoeLRSiIRJqsRs5x86v98dzJOTe+hBbKD3bC2yTjne
   Xlw3OSZXyG21pqTjU1xIKxAsGAV7uuuBqgemlnXeHP1vya2odO4D2AOjZ
   PDeAEQ1q2eln7breK689LlRoAceol+sFcOjqkZTMKK1NVYGXXZadm2Xg3
   qSxHvbMKmJy4lS85nE7rYQiMYzdfzsWXAms2sashulkG1XFBK4VUGdc+1
   g==;
X-CSE-ConnectionGUID: FM/YYVCsTB6NigsAPKZ1/w==
X-CSE-MsgGUID: 8z02d68vSnCJOjNDsIOF5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="88174004"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="88174004"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 05:59:19 -0700
X-CSE-ConnectionGUID: 9KHMWdBXRZu0EmKcjQU1DA==
X-CSE-MsgGUID: bmOgqiACRdiA+LQnl1AJbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="182955490"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Oct 2025 05:59:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9162-0003qh-2s;
	Wed, 15 Oct 2025 12:59:14 +0000
Date: Wed, 15 Oct 2025 20:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>, ryan.roberts@arm.com,
	cl@gentwo.org, catalin.marinas@arm.com, will@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <202510152040.SlpMogzu-lkp@intel.com>
References: <20251013235118.3072941-1-yang@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013235118.3072941-1-yang@os.amperecomputing.com>

Hi Yang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.18-rc1 next-20251014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/arm64-mm-show-direct-mapping-use-in-proc-meminfo/20251014-075409
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20251013235118.3072941-1-yang%40os.amperecomputing.com
patch subject: [PATCH] arm64: mm: show direct mapping use in /proc/meminfo
config: arm64-randconfig-002-20251015 (https://download.01.org/0day-ci/archive/20251015/202510152040.SlpMogzu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510152040.SlpMogzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510152040.SlpMogzu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/mmu.c:186:6: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
     186 | void arch_report_meminfo(struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/arch_report_meminfo +186 arch/arm64/mm/mmu.c

   185	
 > 186	void arch_report_meminfo(struct seq_file *m)
   187	{
   188		char *size[NR_DIRECT_MAP_TYPE];
   189		unsigned int shift[NR_DIRECT_MAP_TYPE];
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
