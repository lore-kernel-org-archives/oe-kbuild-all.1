Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526711957FC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 02:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743993154; cv=none; b=h7wplT3UoVtdKmuSX8R24s+alGxf9j9hVI4M92FKP0SFFhSuLVGun0M8KFibZY+3pDoH8UregqmgGsuDu+AQj3QuBzC+N0LaDqWHz8WlQvouN8UBh9TM1coxuq3kP4YrvSiHfORtAxw9SvFzaYVfHqijqa49crrUWQVv9rE+Y+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743993154; c=relaxed/simple;
	bh=tjBNUW+YXaNYF3+rwSwfcM+a5QcpJ2D2Bqa393E0RtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnHs54edTTe5+v6BH6L/2aIyuxmkKOySWD2T+Nlba1yoae8Rt98FBAE4ZyVuLfVmm4U29tlPzTbd+YMIQvpIiV+1d65e7vic6fs8jR0Ov2G4ark5KzvkxUs4vqoD4rtg+Rn678QpO12EP0tGq1xo9OoHYB076vUbMRQk5bwvrL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bj/4VPNX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bj/4VPNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743993152; x=1775529152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tjBNUW+YXaNYF3+rwSwfcM+a5QcpJ2D2Bqa393E0RtA=;
  b=Bj/4VPNX4a4f+O5avfkxDfE/OKRebzGpNXQ3IFp205Bhh04A9LGvI07E
   niQPs8TCwrMlzYAD50Q3h34WzIVZt7pUcZ7ltHVT6tEVr/2zFR23tHZcc
   LZRxDFxnOHbM57mwcaa1oq+vk8M6v1dJLlWNC2UaRNcm1nzBkLTRlUF7C
   ikQnNHqzOEJgz17SzcuphHK2y5Zf186DAibJV6TB6I7rFFeJXticOAJcI
   dlfA/LWD3hdsJSy+ffPKbHEwdk3QV2Mm21BBKlKHN360/QqfF/AZL9b9K
   vXv3awOsn2MeIq3Y7MgEioRaBWB+OxQ4wEgQdc+M+yhv1vA+PXmSQvr6e
   w==;
X-CSE-ConnectionGUID: smr92OT1QdO+89D07SYAnw==
X-CSE-MsgGUID: UTFzCXeVTemDsX6OIRqglg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="32967542"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="32967542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 19:32:31 -0700
X-CSE-ConnectionGUID: jMCFGOjDRLK1rZWS/9tzGw==
X-CSE-MsgGUID: 8Rs9hgNMR7O0P0I0fJZm5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="127566399"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2025 19:32:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1cHk-0002tn-0q;
	Mon, 07 Apr 2025 02:32:28 +0000
Date: Mon, 7 Apr 2025 10:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6] KEYS: Add a list for unreferenced keys
Message-ID: <202504071048.O2TRmKmw-lkp@intel.com>
References: <20250407003622.22139-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407003622.22139-1-jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15-rc1 next-20250404]
[cannot apply to dhowells-fs/fscache-next dhowells-fs/keys-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/KEYS-Add-a-list-for-unreferenced-keys/20250407-083754
base:   linus/master
patch link:    https://lore.kernel.org/r/20250407003622.22139-1-jarkko%40kernel.org
patch subject: [PATCH v6] KEYS: Add a list for unreferenced keys
config: sh-randconfig-002-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071048.O2TRmKmw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071048.O2TRmKmw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504071048.O2TRmKmw-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: security/keys/key.o:(.data+0x34): multiple definition of `key_graveyard'; security/keys/gc.o:(.data+0x8c): first defined here
>> sh4-linux-ld: security/keys/key.o:(.bss+0x0): multiple definition of `key_graveyard_lock'; security/keys/gc.o:(.bss+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
