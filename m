Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437F3745F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717142767; cv=none; b=q8BCNEqelM636EIHwfOMR5Q98WZ/5CcauMGCKOx7kZhsxRQV9WyiDd/FHg4+ZOR18wBRB1dJzvPiEVNOL2RMA7mC8GPmWeb4VLjdGqSJd2ARGKWWb4N+jtyzmdAlXQ3a2BflfsCTmNaLkVOUWiwbwRvEvt+hjUzsMUbR4KYIs5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717142767; c=relaxed/simple;
	bh=XvhppDqhR2qBZuXH00FponKRIZ4nLeAZHDbzAjDD9R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ms6hLLnOKSIjcvevMXfjtuHu6n+GDENM7bwrMahFfVxTUYfmBzK2+8wKtk2ieXaNdZNYcpbkihdNpmz9qMP2u3etIv6bQst3E4ZXK7BKhcdW+T+lxP2MAvdgaBEBGRnuHkJ5Kd1L/UhL63srCCTjoBQzPdvUWhv+xGbTQtq1pIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyp98J8D; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyp98J8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717142762; x=1748678762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XvhppDqhR2qBZuXH00FponKRIZ4nLeAZHDbzAjDD9R0=;
  b=hyp98J8DundFecJOSeecAQY2hwXxIbBjsBpIRCY8fGkE2CjO7rvRt8nf
   asawSWM+6oBEb9vHMaZexaoSl/uLXd7KL50TrmupKS+7rjrRktlb5Tkba
   ZfQPDDg+4Q6aPT1NNAnDcslumnMRwV5/tcPgrUZnCHzNw6CHr9OAja0og
   g5wPdFH0nYwvzYIbYKDn2p0ogtwV51NWq/M9rjIiH+nqZK1jVmJ9W4B0X
   4wjItiAxCZBTq4hmPcZyGBAIGN2vvOC7vC+oVdxFMNSOBu2E2PB9GPOuT
   LAdBuGO9QiZ0JX32ft7NEbSvUjCg4DfqOrA2L2MsZUtR7Wp2SfrA33jSu
   w==;
X-CSE-ConnectionGUID: yd59C0CfRtiEdEKD9iQJTg==
X-CSE-MsgGUID: jdHXhlgvSgymvSqRSjyudA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13493647"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="13493647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 01:06:02 -0700
X-CSE-ConnectionGUID: FwGBj0CPSvWTe9iCBqcYig==
X-CSE-MsgGUID: qWE5pexkTSea/OIPYQ1M8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36022702"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2024 01:06:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCxGw-000Gkx-2h;
	Fri, 31 May 2024 08:05:58 +0000
Date: Fri, 31 May 2024 16:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Snowberg <eric.snowberg@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/8] certs: Introduce ability to link to a system
 key
Message-ID: <202405311522.KCnkOktD-lkp@intel.com>
References: <20240531003945.44594-2-eric.snowberg@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531003945.44594-2-eric.snowberg@oracle.com>

Hi Eric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Snowberg/certs-Introduce-ability-to-link-to-a-system-key/20240531-084602
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240531003945.44594-2-eric.snowberg%40oracle.com
patch subject: [RFC PATCH v2 1/8] certs: Introduce ability to link to a system key
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240531/202405311522.KCnkOktD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311522.KCnkOktD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311522.KCnkOktD-lkp@intel.com/

All errors (new ones prefixed by >>):

   certs/system_keyring.c: In function 'system_key_link':
>> certs/system_keyring.c:450:35: error: 'platform_trusted_keys' undeclared (first use in this function); did you mean 'set_platform_trusted_keys'?
     450 |         key = find_asymmetric_key(platform_trusted_keys, id, NULL, NULL, false);
         |                                   ^~~~~~~~~~~~~~~~~~~~~
         |                                   set_platform_trusted_keys
   certs/system_keyring.c:450:35: note: each undeclared identifier is reported only once for each function it appears in


vim +450 certs/system_keyring.c

   445	
   446		key = find_asymmetric_key(system_keyring, id, NULL, NULL, false);
   447		if (!IS_ERR(key))
   448			goto found;
   449	
 > 450		key = find_asymmetric_key(platform_trusted_keys, id, NULL, NULL, false);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
