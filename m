Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6D224061F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350249; cv=none; b=YzkRq0vkUCqOCYL3oNzfptW8+fHrlljHYwccnFF0GlBTLI/SHnvMU6KzFVqXkcZdnQMaHc8tvKjLtwUOxBaTleLcZqvQDkfI2oQFRmyS3vO3cNp31A2jFNNQUUyHcCYAfpE7lzqqvAG69vgIdx2ABBi3aJEh7YcmMUcWgxcCXuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350249; c=relaxed/simple;
	bh=dgUNRuBpn996MN2k4TXKuZZ0zSLy+PIW5fjcKDFp28U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rx7v8ahZjz6+YvTNu4lEgFyO8XA3LICSqP30lEMXaOLewlv6A+7xEvoZd/7ysmDdDbYHuuj5OB8z4uRjP382AiRQEavPLD7CGhdcSdlvPCqXudI5qfSjlODtKvJKS8xQA5eoxrFzK0Nae7yGYG0wsP+MOx4u1/IPRpZYR++mmOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gc0y9JBh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gc0y9JBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753350248; x=1784886248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dgUNRuBpn996MN2k4TXKuZZ0zSLy+PIW5fjcKDFp28U=;
  b=Gc0y9JBhrpSeDVBoMizyqgDixe+yQlqNM6BgQlg5ozWcSxWuoEsJne9M
   qG4sI7xuvMRTlbKyi0i95eP2cOUStEIPoRQtNRRcRga7l9KRjEq5xwkID
   lLpoXV78OeHHxAddOkdBUKo+/w/RfSA+/l69d13CloE8z3I0RY226eTZ1
   hxbw27fE1OBbwxF7lSjg+0/vkCNPhMXjzpVtsyw84oHu85X3RqVt8qQYB
   Iu4AZD/KntzrZyc5ZiDhHeyA21lCPb5gzUYGnI/+YRyH45pMiQbJ718fX
   naEysbVEukRQ4XO/8TIDfCtwKaFrXoT8IeMmB56HANdZS1hqrpcYTLbtm
   A==;
X-CSE-ConnectionGUID: mecp2aZ2R0iv7FeFOoFAyg==
X-CSE-MsgGUID: /vcBvoScReWC0MDkK1s1VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="54749550"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="54749550"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 02:44:07 -0700
X-CSE-ConnectionGUID: kAAvF0WUT6e5JY2reZwVCw==
X-CSE-MsgGUID: RirlHzYYQUWJTHJWHgvGiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="160642446"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jul 2025 02:44:06 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uesUe-000KI7-0G;
	Thu, 24 Jul 2025 09:44:04 +0000
Date: Thu, 24 Jul 2025 17:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V3 1/4] x86/Hyper-V: Not use hv apic driver when
 Secure AVIC is available
Message-ID: <202507241708.AeqN6zwQ-lkp@intel.com>
References: <20250723190308.5945-2-ltykernel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723190308.5945-2-ltykernel@gmail.com>

Hi Tianyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master tip/auto-latest v6.16-rc7 next-20250724]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/x86-Hyper-V-Not-use-hv-apic-driver-when-Secure-AVIC-is-available/20250724-030630
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250723190308.5945-2-ltykernel%40gmail.com
patch subject: [RFC PATCH V3 1/4] x86/Hyper-V: Not use hv apic driver when Secure AVIC is available
config: x86_64-buildonly-randconfig-001-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241708.AeqN6zwQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241708.AeqN6zwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241708.AeqN6zwQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/hv_apic.c: In function 'hv_apic_init':
>> arch/x86/hyperv/hv_apic.c:296:28: error: 'CC_ATTR_SNP_SECURE_AVIC' undeclared (first use in this function); did you mean 'CC_ATTR_GUEST_SNP_SECURE_TSC'?
     296 |        if (cc_platform_has(CC_ATTR_SNP_SECURE_AVIC))
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
         |                            CC_ATTR_GUEST_SNP_SECURE_TSC
   arch/x86/hyperv/hv_apic.c:296:28: note: each undeclared identifier is reported only once for each function it appears in


vim +296 arch/x86/hyperv/hv_apic.c

   293	
   294	void __init hv_apic_init(void)
   295	{
 > 296	       if (cc_platform_has(CC_ATTR_SNP_SECURE_AVIC))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
