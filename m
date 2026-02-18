Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE88D33A9DE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 23:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771456473; cv=none; b=SbjJFnQnc9HW2e6Rj16eJSuGrASzJgMmPDKWuz1CYH9/FoTWWQDdmsJmhPKyHxQNspPp/jGIYCBRRj9VxbaOYiHXW7dOvo2ulieucI4G0EPzNMEhQecz2JrPVSSbfLlY06oqexKq7OGEFlCGsWQvxL5D2c6tP4S/HWHM0Vh3pCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771456473; c=relaxed/simple;
	bh=XycFoIWag/T8XhrBfS55UCwbeH5y6oiMWAYkx5c6DIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9ZiAhBkcRULEIVxGZSemRs+hKNKmMe2b2zckWQ3E+wUcL0UcSzo3r5va3sMUICGbZFwNDRs2Gyjytd1AewcvJH89wVPbrENLl9AVMklk+ykY/pOzQITQdQZdwh3Dz2XL1hK7yEaS+FpOsah4eRDogFx2k2J4OwToPl8L2S6rrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDpnHn3r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDpnHn3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771456472; x=1802992472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XycFoIWag/T8XhrBfS55UCwbeH5y6oiMWAYkx5c6DIE=;
  b=eDpnHn3rcjwS9SpQswKnFhwq3zWXSUM4AirQl4eTjX19lmszxxMdxEEN
   optclCi53CWTfxsVeRuTbcNid2OHlWzJQtuvwi3g45HNZdOfUaFM3LqWC
   gu1Z1e7kw4jNBbSnxIYD6xPC0skagVlUH1+UoUlr9bhbE8Ynj3z0IHNNb
   G8fzIIIpq72rH1XEDT1M0AgC9Q29PvoX1Icds9NtCDPn+4jijK7FpKJzv
   RajX07lXSwtYhVspF0sTcHlDrRKmo55xRvZ5/LQSPRcFt9w23cz/5ZScm
   YZe5FlKuA34r2X0ZHp3Zo5NYwnrIS6Mf0ap+rBzDa/hLhD3JCFSsnPYld
   w==;
X-CSE-ConnectionGUID: nx+4zTKdQLKgiUEeS1f+kQ==
X-CSE-MsgGUID: P2rRYBnOQBOOFi5THxvDzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76403613"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="76403613"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 15:14:31 -0800
X-CSE-ConnectionGUID: +48vE1zGRUuygPXs3s/5/w==
X-CSE-MsgGUID: 5wvWkzntRUyfy9AigRDVWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="218485297"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 18 Feb 2026 15:14:29 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsqkU-000000003mv-3ni1;
	Wed, 18 Feb 2026 23:14:26 +0000
Date: Thu, 19 Feb 2026 00:13:38 +0100
From: kernel test robot <lkp@intel.com>
To: redacherkaoui <redacherkaoui67@gmail.com>, x86@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/boot/compressed: Fix signedness of rdfs8()
Message-ID: <202602190002.InnoyJmU-lkp@intel.com>
References: <20260218150008.28179-1-redacherkaoui67@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218150008.28179-1-redacherkaoui67@gmail.com>

Hi redacherkaoui,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master tip/auto-latest linus/master v6.16-rc1 next-20260218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/redacherkaoui/x86-boot-compressed-Fix-signedness-of-rdfs8/20260218-230616
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260218150008.28179-1-redacherkaoui67%40gmail.com
patch subject: [PATCH] x86/boot/compressed: Fix signedness of rdfs8()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260219/202602190002.InnoyJmU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190002.InnoyJmU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190002.InnoyJmU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/boot/compressed/kaslr.o: in function `choose_random_location':
>> kaslr.c:(.text+0xb9f): undefined reference to `get_cmd_line_ptr'
>> ld: kaslr.c:(.text+0xbd1): undefined reference to `get_cmd_line_ptr'
   ld: arch/x86/boot/compressed/ident_map_64.o: in function `initialize_identity_maps':
>> ident_map_64.c:(.text+0xb2a): undefined reference to `get_cmd_line_ptr'
   ld: arch/x86/boot/compressed/vmlinux: hidden symbol `get_cmd_line_ptr' isn't defined
   ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
