Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617FD36D507
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764512461; cv=none; b=qkCmpnQlZN19eaAXHN7h3UNmvBwRCWxkIbdpyGl2Bb4zy5MGV5aeq+SOf9Ad6uP3zGVKILKaavQMmrrHk/IPCfyb1GtDLSmTlDPXNRTlNspEw4A7K7rGp8LPZcFo1whOYzUKdkeyVorixeHbjlsrfA4pCEnGGdt4egZg6uw0VSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764512461; c=relaxed/simple;
	bh=T0vL0OjafyXyvMYAj0AMEAZpqACR+Zvvs0ozwegYMLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEy/6IB0Z6HbavEZFoPDKQQoh6VhMNAwlEsJC3qLSL4F7TTYcm83xkJRKTX4mafUJn3GD4eWrKyo99ZgIp3086+a2RQGwcHoOvB9biGQm2C90dt6cc0U1F69PKDqNLKSjsSHxfrCsEpHTgVZLRSkQnajZtxwOR3lIpMIjtxCQbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=leEJVHoJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leEJVHoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764512459; x=1796048459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T0vL0OjafyXyvMYAj0AMEAZpqACR+Zvvs0ozwegYMLU=;
  b=leEJVHoJH+i2/2Mlo+W3EUGF8pk7PppSDSspXka/Sq/wsZV28SUhwGmy
   7rtP0ITtlHppkNhdKkAVSwFxxShQk1zm1hX10bQV2cx6HFQI2Hk0Drtu8
   rRca3Ryhp470dnhyxD3TpXek83oHqgV+n28FNPH/9iN/t99ISMssN/EVP
   QmEmLLvOXoCEwBl6R5AvP7X/HAdPSEUmTeIAG4McjIG/6wgZNqx2CQ+wc
   2f6j0LoVeaH3vsM7yjRqVpI5d9rLQeUF7uawBVVRldF1n8LBu+OXrDepx
   U5YZHWBX6CJrTf7Woaq4izIFA2+1hgdm2VAewgWbZHjzziHInyAg9KJ4O
   g==;
X-CSE-ConnectionGUID: /qGkk5CUQqGRH0bFi35pkw==
X-CSE-MsgGUID: WzhEXwKaSg2mNwpL5f+SAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="77144252"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="77144252"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 06:20:57 -0800
X-CSE-ConnectionGUID: xSHKg+7NSIuxvRV7lbTd9g==
X-CSE-MsgGUID: cTRNMglxSauygJepfPasSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="198321793"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Nov 2025 06:20:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPiII-00000000801-1SXs;
	Sun, 30 Nov 2025 14:20:54 +0000
Date: Sun, 30 Nov 2025 22:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 2/2] randomize_kstack: Unify random source across
 arches
Message-ID: <202511302137.u4iIA2kf-lkp@intel.com>
References: <20251127105958.2427758-3-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127105958.2427758-3-ryan.roberts@arm.com>

Hi Ryan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on kees/for-next/hardening kees/for-next/pstore kees/for-next/kspp linus/master v6.18-rc7 next-20251128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20251127-190408
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251127105958.2427758-3-ryan.roberts%40arm.com
patch subject: [RFC PATCH v1 2/2] randomize_kstack: Unify random source across arches
config: x86_64-randconfig-161-20251130 (https://download.01.org/0day-ci/archive/20251130/202511302137.u4iIA2kf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511302137.u4iIA2kf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511302137.u4iIA2kf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: do_syscall_64+0x2c: call to prandom_u32_state() leaves .noinstr.text section
>> vmlinux.o: error: objtool: __do_fast_syscall_32+0x2e: call to prandom_u32_state() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
