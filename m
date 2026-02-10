Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B752126AE5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770710794; cv=none; b=enLtUgD1P032IlXUmC9RewU36o9bP1GhTaCPMYQSvg0y3khkHk8biiP03/lePGwE0Low2+7T3atP5UXE2JjY1ptNQVQz1+y2hguzs5i34YrujBhhcaTYm9mGELfzoD8TvyAqWwLyLx11CE4B4Q+ULET4/IcFtzuq7hDSn90zE5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770710794; c=relaxed/simple;
	bh=H36GOnCGhjb9xhDgS/moSGRxSG0vjpQUoYrBWV6lwF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXi0+q30L6RwYaJj8Tur4k4jl3Qhs/UfOluP/Q58Iax0rMnxT7Qi08EnOFVOKm1+hx/qnNXkA16qB/6ApD/Cq1qfcab4n1BwjzYTxTxNSy1Z4wY+qxzxPEc9xSHp35Xobb4GPNbVhJh2Wm//P0DTsS/XB3DdSw5ARo86T6ApiIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0bl6Z08; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0bl6Z08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770710793; x=1802246793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H36GOnCGhjb9xhDgS/moSGRxSG0vjpQUoYrBWV6lwF8=;
  b=U0bl6Z08bIvU4ajyLohUwGakFMhGp0RhkxN9WZjF+s7yi3ab24+/VuPu
   wMAEK4zMYrWE02J6ymh4jb26/W3jZDKIMakWdnL1eoOQkxEQgE4O9PBgs
   tIXi4NrTi50nZNzA6Pbko1QX6Hf8TA2TyBNQ1UsyAM24rit05oE9yVQgk
   pVJJcUtCcpaX1MmkmX+6eIWMkaUiDw8vmEae8xytwIpSBMatJ8x60wLYL
   WbGKfOWqamvi6+VeDwQPvbgxDtKKIlNFNfNW/JnAf7yUyk2pizjPpVC1K
   LJNH/UjhhU+uooc3A9QSdfWbVw4o+/KUmnOpHODSLEbyvbo0jniH+cD31
   g==;
X-CSE-ConnectionGUID: Nm456MqkQQSLaa0lVkhZ9Q==
X-CSE-MsgGUID: YWFsyRB9RwiqALUdkP0QSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74436631"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="74436631"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 00:06:32 -0800
X-CSE-ConnectionGUID: mqi/dgZQQO2lNwuWfUYeow==
X-CSE-MsgGUID: hw9q9nG5Rlmig143Qemgtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216373089"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2026 00:06:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpilP-00000000onk-3bAr;
	Tue, 10 Feb 2026 08:06:27 +0000
Date: Tue, 10 Feb 2026 16:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Capitulino <luizcap@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, david@kernel.org, baolin.wang@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev, ryan.roberts@arm.com,
	akpm@linux-foundation.org, lorenzo.stoakes@oracle.com
Subject: Re: [PATCH v2 02/11] mm: introduce pgtable_has_pmd_leaves()
Message-ID: <202602101515.tnpQ1Idh-lkp@intel.com>
References: <f55ca6204336f52f1651d02dc370bc3b771df3d0.1770675272.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f55ca6204336f52f1651d02dc370bc3b771df3d0.1770675272.git.luizcap@redhat.com>

Hi Luiz,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes tip/x86/core linus/master v6.19 next-20260209]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Capitulino/docs-tmpfs-remove-implementation-detail-reference/20260210-061806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/f55ca6204336f52f1651d02dc370bc3b771df3d0.1770675272.git.luizcap%40redhat.com
patch subject: [PATCH v2 02/11] mm: introduce pgtable_has_pmd_leaves()
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602101515.tnpQ1Idh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101515.tnpQ1Idh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101515.tnpQ1Idh-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: init/main.o: in function `start_kernel':
>> main.c:(.init.text+0x698): undefined reference to `init_arch_has_pmd_leaves'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
