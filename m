Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BE21CB146
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340440; cv=none; b=lCKU2Ufrmf3mxyT9vEvJ9bJbZoiTg/XrZ03WB86AmZpt0ffIIywtgn6nJJNFOAM8H7uZ8tbofoIEt4Lm5H0ZVAt14x7Wtq1p9vIxWV9RjZByjPoPMH4X4awDkjYe2jc8hrsHEh39nX4DhEXNG8Sm3p3EdtkOrVH3Vl4Nsw0JaH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340440; c=relaxed/simple;
	bh=+lbV+GG7t6KwSu4fA1t6L2r5r6EAkFGdgwOcCJKVb88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SocFpStQ7W+e4k6BORjqOMWFn3avMTce2RBTZ5DqBNbV8t2rx3n1js3h4qMiD4ch25/WIKT4Dj8H+Dvm8IMc6o8xudSWNj+qUA/HxOZFoLsjpF3wlY//iKjJlRUmX0rAXPh2VCaOaJNCHOQGQACgR4rBGWpJnNmymSV5IN7BeE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuZc7wPg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuZc7wPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724340439; x=1755876439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+lbV+GG7t6KwSu4fA1t6L2r5r6EAkFGdgwOcCJKVb88=;
  b=nuZc7wPglpxLBS/P/qxClQiOZ9Iktig8i2LsZO7mPnzdmb52uHMX0FgG
   peIwuVdwB6Mri74VsJ5nHNY+Ap2ERJlyB/GrBPCALF1m9nzJLsAzB5TNU
   uS/W9/+uOqNB/pNIM+GmuxD5uLXe/D5i+K46B2ZRDASkvZxtvl9FEV5Me
   9CoY1o87QUbn8Svcz4Ud/QaW5Sv7lkbxkjOdV/0tgzloQLm+x9Xh8dB7S
   Uia74zuVTMOa08XsMl8NA0bFT615yzwbMzxDw7eh3MAsLCpzB2z78wwvQ
   /IahTbjflGijrerqlPR44mtPTDvfLLPLzZZEIh36Ugpim0DL6BlkRcat7
   Q==;
X-CSE-ConnectionGUID: X5PLUjJUT/qjdo65BIkolA==
X-CSE-MsgGUID: HAPJ+ZU7StiRRFN2CFh0dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22289229"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22289229"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 08:27:18 -0700
X-CSE-ConnectionGUID: meYGC+DcQx+H28tOocj4Mg==
X-CSE-MsgGUID: aVCLEducQTy9WIKJRZd3ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="92233313"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Aug 2024 08:27:15 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh9iT-000CuO-1w;
	Thu, 22 Aug 2024 15:27:13 +0000
Date: Thu, 22 Aug 2024 23:26:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yufan <chenyufan@vivo.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] X86 architecture (32-bit and 64-bit): Convert to use
 jiffies macro
Message-ID: <202408222321.a5EoSpB5-lkp@intel.com>
References: <20240822034721.9561-1-chenyufan@vivo.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822034721.9561-1-chenyufan@vivo.com>

Hi Chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yufan/X86-architecture-32-bit-and-64-bit-Convert-to-use-jiffies-macro/20240822-114925
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240822034721.9561-1-chenyufan%40vivo.com
patch subject: [PATCH v1] X86 architecture (32-bit and 64-bit): Convert to use jiffies macro
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240822/202408222321.a5EoSpB5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408222321.a5EoSpB5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408222321.a5EoSpB5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/aperfmperf.c:19:1: error: expected identifier or '(' before '+' token
      19 | +#include <linux/jiffies.h>
         | ^
>> arch/x86/kernel/cpu/aperfmperf.c:19:2: error: stray '#' in program
      19 | +#include <linux/jiffies.h>
         |  ^


vim +19 arch/x86/kernel/cpu/aperfmperf.c

  > 19	+#include <linux/jiffies.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
