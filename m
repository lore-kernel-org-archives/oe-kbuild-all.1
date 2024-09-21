Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A8728399
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726911343; cv=none; b=CwWpD+i1p1XYP4QJ9TEWYFwSnuMWG4Zzbnq2d4Qs5kkkcc3EQLUkF9QlkBjCMxT5eCdpUnQjrrXBSrYC6zgVVzDdKpiHxEij2BLiHm8A7Uj1AaZN2ooitxbPtMZjeN7cpubTCI+2sfJymqqmgNGox8/3mzfz6A2/SB5/k4ZN45k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726911343; c=relaxed/simple;
	bh=DH3Nd3p2zkzLnSB3YCmBvdpsaNreBBA9r81ZGn4Gl4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDghxBuUHDBfl54iH/1HpIHTftTZzBaIL6wDx7rYbXeKGNa7liYa4arGY4p+J0FAxMN2d1nFSXgk6n3WfagJHi2L0/NS5vlYbwpFB2wQg0YLKiL9b6rCXrhQIShiv3ZGmwb2usPIOzg4CicSa7TtCcIasMVdqeuZwYMK7eegzXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSp/d7tT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSp/d7tT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726911341; x=1758447341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DH3Nd3p2zkzLnSB3YCmBvdpsaNreBBA9r81ZGn4Gl4k=;
  b=hSp/d7tT1tyH1sH9gJ5zGNikSRcoKvCIe4W5UAczl2h5vKybmqOmViwW
   JVjcvZcjwPq11qOUAwzQFnGwguMTsmRf+1nPT6OFiuSttCY0qglO6y8ea
   5kPllDZ+1j6TCDlYjZC/WDWtMUor8cvfwXi3kGgtA7Y0SbEyyQw4nvQaF
   YsXzwyzVOBqyBYIQ1UjwVOWdrpO0zj4qNydu1laSheeqOMTVxKujWMJ/0
   gYmKnHXkn1kJ++Dr+WaePr6dw+6VBji4zunWsEupt96G/7bmvWp7lvfVb
   /deBhc5brDgF4j1Ssgd2YjipE/vwPuwA+jJ2bXLL1bJbJGeTLXwkZMVam
   g==;
X-CSE-ConnectionGUID: O1LpPefRSCyl0LOJ+EXd1A==
X-CSE-MsgGUID: k4KpaIWyRP2yEBZpjA6CTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26039799"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="26039799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 02:35:41 -0700
X-CSE-ConnectionGUID: 2w3Tn8cSQr+bTwY5IaxA2g==
X-CSE-MsgGUID: iSurfpi5SduQQd7bRw3QbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="101403373"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Sep 2024 02:35:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srwWf-000FJn-1G;
	Sat, 21 Sep 2024 09:35:37 +0000
Date: Sat, 21 Sep 2024 17:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] blktrace: add i/o alignment information
Message-ID: <202409211733.lGAAPjJ2-lkp@intel.com>
References: <20240917-blktrace-algn-v1-1-9fb54b7b1dfa@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917-blktrace-algn-v1-1-9fb54b7b1dfa@samsung.com>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 4f3e012d4cfd1d9bf837870c961f462ca9f23ebe]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Gomez-via-B4-Relay/blktrace-add-i-o-alignment-information/20240917-234801
base:   4f3e012d4cfd1d9bf837870c961f462ca9f23ebe
patch link:    https://lore.kernel.org/r/20240917-blktrace-algn-v1-1-9fb54b7b1dfa%40samsung.com
patch subject: [PATCH RFC] blktrace: add i/o alignment information
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240921/202409211733.lGAAPjJ2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211733.lGAAPjJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211733.lGAAPjJ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/trace/blktrace.o: in function `blk_trace_align':
>> blktrace.c:(.text+0x41d8): undefined reference to `__umoddi3'
>> ld: blktrace.c:(.text+0x429c): undefined reference to `__umoddi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
