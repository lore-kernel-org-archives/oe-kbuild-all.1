Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5091A5BA4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 04:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744172989; cv=none; b=GvjYhsyniNk603kixBib/2kxJ5AVegFwE6CbSDQba5d5Ct2ClajFZCNzfczW5WHjZuut2H47jC0Pp3jG8Nv65zFyxh/dMBAuz9DlVLI7ROFeSZpjUm2pUF7L4NMJTeBae3ldgg3qtDnYeV9Unce0DmS3lzfugQN6jzOWiyNodnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744172989; c=relaxed/simple;
	bh=dHm15ufXWb3S85ympqq/zp+Suql13+j8pIhbv4T5x/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZbhkc+YGB72nHga1/PcIvXghR5oW03+SO3PvDluwUkRlm3x4gQvhS2smiXQE6ZaldMN0e/MvBMpIynobrNHaljEhWsmdRrdZ+i26QmIkr0TAUMl80LQq+ni8Mqg/QcROvkYLOYBZgRMgA+lxp1fqi9ObH3xrWmz+Wjw3BFnefw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkCT68Rg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkCT68Rg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744172988; x=1775708988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dHm15ufXWb3S85ympqq/zp+Suql13+j8pIhbv4T5x/w=;
  b=NkCT68RgjPwHj6sa5y3VcF5K8AmqrP/OD071a7mJSZnT1mkweXSC7eD2
   wMgVuwR41t1iA7wZi8UPkJTe+jbzKrBcX6yucGde9o2BfLE9UojNdYaiI
   CMvZjRPoq4LKIKmfvNk8VoLg2jcBSBE86ZJfJ28Gqh5WgWc+YGsf1HbCq
   SXUvvue0Di8+DaHatR15HSOdbUUelRL6kV80U2Oy2a0CCQYQwJzwmaJfl
   ZNZ19+um3vaBsblpbe1qwVBuFzkjV5jfevAqoTS0AeyWkYckxulFxhnQs
   8f8JgxfkIRHFeG9bpXPU33Pg96MV9WPcsOEGjkorQuppnfDVPKoCVyMg0
   w==;
X-CSE-ConnectionGUID: OiW0xrbvSJWbWmWhN//RTQ==
X-CSE-MsgGUID: wTa0hzRqQpWecvCJKY78wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="71004109"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="71004109"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 21:29:47 -0700
X-CSE-ConnectionGUID: 8tV3QpiTTEaEIbHtpxVZKA==
X-CSE-MsgGUID: 92du0vzzQVCw96lx2IfG5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="129417301"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Apr 2025 21:29:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2N4I-0008GV-39;
	Wed, 09 Apr 2025 04:29:42 +0000
Date: Wed, 9 Apr 2025 12:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 09/10] drm/i915: Add support for forcing the link bpp on
 a connector
Message-ID: <202504091139.9chj3D5y-lkp@intel.com>
References: <20250408214342.1953197-10-imre.deak@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408214342.1953197-10-imre.deak@intel.com>

Hi Imre,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250408]
[also build test ERROR on v6.15-rc1]
[cannot apply to linus/master v6.15-rc1 v6.14 v6.14-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-i915-dp-Use-the-correct-connector-while-computing-the-link-BPP-limit-on-MST/20250409-055536
base:   next-20250408
patch link:    https://lore.kernel.org/r/20250408214342.1953197-10-imre.deak%40intel.com
patch subject: [PATCH 09/10] drm/i915: Add support for forcing the link bpp on a connector
config: i386-buildonly-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504091139.9chj3D5y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504091139.9chj3D5y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504091139.9chj3D5y-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/display/intel_link_bw.o: in function `str_to_fxp_q4':
>> intel_link_bw.c:(.text+0x399): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
