Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0486139590
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723749083; cv=none; b=DzcojfAuoxPD4+aIR+xzquAO89/eIkHzt/m0JfEeszDlG2GrQfbWRVapKmKO6zpdSWnaQaL0e0WNpR9154Mi/wc8/9aTiyAcHZHFhSJKODgIxU7LJgDGPUYVUfWod0EkKFFXWU+olF2oaX7nn5j2x05hgRTZXYw//5SW0PROve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723749083; c=relaxed/simple;
	bh=5+l74CCnre0v6YW15pfvzIfEU18kr+rS3qvaurrhIBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UT7WxpzTtkYwoO6WQrRTF2PXhpzTmKH/UR5Jl/+berj3EHXX8DpIFhamumxQfkIHUpQA40+MeTdPkXd8uslC0CibtSHIikGQNcN7QDTfOmB7eb1MT9iLV5KVmNMcukHkSbwtr5UOyLMF1HtybPm3goIaO+RDbAVEgGqem4Up9w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOxhM4rb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOxhM4rb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723749082; x=1755285082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5+l74CCnre0v6YW15pfvzIfEU18kr+rS3qvaurrhIBc=;
  b=AOxhM4rb2XJNJLlbiqMoCijkQZcYFeSglAIWKVU02eDM1gVivLxqoNXg
   onarpECQpnV9REZR9vna/Yje1RYxbfqfXhIrGCcnqVgb2NxCXArrv2G/6
   JOn6Zkkc2ng0L435ur0Kmpx2yS+CT9yX7PCkKQGEw6FU2yYotbW/10Bmd
   NQiCMh4BePI1pR49jsoLB64Ib1iJ6Zwr+sV4WH4hO5KOaxczMZvERqHLj
   THjQgLJNsMF5PVVbP9HWr//4HWb6nF8GuEkqFGR45lp3rPfjU1GYVbBe+
   1ixtJQ9nPalbhk4300UEegy7Uxc08lAouGcRj3R8apq81LcyuzdfHGQix
   A==;
X-CSE-ConnectionGUID: UQCo2go4QoamZoTGplue4w==
X-CSE-MsgGUID: a5fkao63Tayk81Kbxf8xow==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22171067"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="22171067"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 12:11:21 -0700
X-CSE-ConnectionGUID: wBSLGg/MTTmtgoy4eBEfdw==
X-CSE-MsgGUID: 21AHAc8LRIuVS6Ln5Vcn+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="60227086"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Aug 2024 12:11:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sefsT-0005W2-2Q;
	Thu, 15 Aug 2024 19:11:17 +0000
Date: Fri, 16 Aug 2024 03:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/5] x86/kexec: do unconditional WBINVD for bare-metal
 in relocate_kernel()
Message-ID: <202408160236.7eD455CA-lkp@intel.com>
References: <47d9f1150a6852c9a403b9e25858f5658c50a51d.1723723470.git.kai.huang@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47d9f1150a6852c9a403b9e25858f5658c50a51d.1723723470.git.kai.huang@intel.com>

Hi Kai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b8c7cbc324dc17b9e42379b42603613580bec2d8]

url:    https://github.com/intel-lab-lkp/linux/commits/Kai-Huang/x86-kexec-do-unconditional-WBINVD-for-bare-metal-in-stop_this_cpu/20240815-205623
base:   b8c7cbc324dc17b9e42379b42603613580bec2d8
patch link:    https://lore.kernel.org/r/47d9f1150a6852c9a403b9e25858f5658c50a51d.1723723470.git.kai.huang%40intel.com
patch subject: [PATCH v5 2/5] x86/kexec: do unconditional WBINVD for bare-metal in relocate_kernel()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240816/202408160236.7eD455CA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160236.7eD455CA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160236.7eD455CA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/machine_kexec_64.c: In function 'machine_kexec':
>> arch/x86/kernel/machine_kexec_64.c:325:22: warning: variable 'host_mem_enc_active' set but not used [-Wunused-but-set-variable]
     325 |         unsigned int host_mem_enc_active;
         |                      ^~~~~~~~~~~~~~~~~~~


vim +/host_mem_enc_active +325 arch/x86/kernel/machine_kexec_64.c

5234f5eb04abbb arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  317  
5234f5eb04abbb arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  318  /*
5234f5eb04abbb arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  319   * Do not allocate memory (or fail in any way) in machine_kexec().
5234f5eb04abbb arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  320   * We are past the point of no return, committed to rebooting now.
5234f5eb04abbb arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  321   */
3ab83521378268 arch/x86/kernel/machine_kexec_64.c Huang Ying        2008-07-25  322  void machine_kexec(struct kimage *image)
5234f5eb04abbb arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  323  {
4bfaaef01a1bad arch/x86_64/kernel/machine_kexec.c Magnus Damm       2006-09-26  324  	unsigned long page_list[PAGES_NR];
93c1800b3799f1 arch/x86/kernel/machine_kexec_64.c David Kaplan      2024-06-02 @325  	unsigned int host_mem_enc_active;
fee7b0d84cc8c7 arch/x86/kernel/machine_kexec_64.c Huang Ying        2009-03-10  326  	int save_ftrace_enabled;
93c1800b3799f1 arch/x86/kernel/machine_kexec_64.c David Kaplan      2024-06-02  327  	void *control_page;
93c1800b3799f1 arch/x86/kernel/machine_kexec_64.c David Kaplan      2024-06-02  328  
93c1800b3799f1 arch/x86/kernel/machine_kexec_64.c David Kaplan      2024-06-02  329  	/*
93c1800b3799f1 arch/x86/kernel/machine_kexec_64.c David Kaplan      2024-06-02  330  	 * This must be done before load_segments() since if call depth tracking
93c1800b3799f1 arch/x86/kernel/machine_kexec_64.c David Kaplan      2024-06-02  331  	 * is used then GS must be valid to make any function calls.
93c1800b3799f1 arch/x86/kernel/machine_kexec_64.c David Kaplan      2024-06-02  332  	 */
93c1800b3799f1 arch/x86/kernel/machine_kexec_64.c David Kaplan      2024-06-02  333  	host_mem_enc_active = cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT);
5234f5eb04abbb arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  334  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
