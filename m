Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE341465A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 22:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719354210; cv=none; b=ZvX82HfU4wFrigHVF7aunGvPNHe+/NsQnUMObtWwbtWnQdEBHrDafe0UPgk0UWdSmtONdobomeurTF8cnxG+ykSrFherh838nbO8WIbi3fZ84YEw9iHbEcjD0eDInDsiuXyNv0qeBkYzHQPGKoB/SeyNotRCF2SsjIfp0FHizcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719354210; c=relaxed/simple;
	bh=9BHuP2I8BsYzpQsJjIfJKSxZWNNmXsOPyqoe/rniMxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZPZhAEstqGW6CiFxT/fubrkVBjw/aAS7EPTQXXW81ptLSjBk6yiA4HXneqHLldEkubMVUJOXyAWUpouyPLkcy4OQj8kQ3Cqh8IBM7gHKVESpvTRISjT8ahlRhJWI5GB3WvGX/49xb1p0X6KZ9G7FM5OxYhFHUtQOrNwKyCa0oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dK9oIxOV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dK9oIxOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719354208; x=1750890208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9BHuP2I8BsYzpQsJjIfJKSxZWNNmXsOPyqoe/rniMxU=;
  b=dK9oIxOVysSDg/BZer9KcYgWBAYvOAfA1QCgIodUbQzrEOThqU+L4LL6
   FoE03+zzEvzFHXH+ftbn08+uB+FjhJtX35SVW3dBDctsAGc7dMtoyrGDU
   T+mDC/JlZVn+dJRJF7aA1bqHhUQoqxOSKPvVUXGgbBz3hqjokAYG4REDt
   LF+Rj8aulh2lLEVgeLwxVAYjqENRnruXVHZimPrvdIcZt3lqICZbJ+wGs
   6bd2obQqMtyeeze+w4OCpzY5lqBlebx9fUoGg3T0j+yClgDO5Yc5UY9XY
   jsSfQ0l6EIaDbCX2CcrWnyw8ZouJRvHh7oLvyXfR8A988Bwe4c6mrhkJg
   w==;
X-CSE-ConnectionGUID: pOMLgNXURri6zrK/dLPJAw==
X-CSE-MsgGUID: jSymjEpFRoKtY11p0as05Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27542414"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="27542414"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 15:23:28 -0700
X-CSE-ConnectionGUID: t2Ymeq1BRpWTVJK91MFPGw==
X-CSE-MsgGUID: 7GKd1i4ERHKPVQoFp4rRqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="81330818"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jun 2024 15:23:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMEZP-000Ele-1r;
	Tue, 25 Jun 2024 22:23:23 +0000
Date: Wed, 26 Jun 2024 06:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Mattson <jmattson@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jim Mattson <jmattson@google.com>
Subject: Re: [PATCH] KVM: x86: Complain about an attempt to change the APIC
 base address
Message-ID: <202406260523.KaaWyitN-lkp@intel.com>
References: <20240621224946.4083742-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621224946.4083742-1-jmattson@google.com>

Hi Jim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on linus/master v6.10-rc5 next-20240625]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jim-Mattson/KVM-x86-Complain-about-an-attempt-to-change-the-APIC-base-address/20240625-181629
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20240621224946.4083742-1-jmattson%40google.com
patch subject: [PATCH] KVM: x86: Complain about an attempt to change the APIC base address
config: i386-randconfig-141-20240626 (https://download.01.org/0day-ci/archive/20240626/202406260523.KaaWyitN-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260523.KaaWyitN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260523.KaaWyitN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/lapic.c:20:
   arch/x86/kvm/lapic.c: In function 'kvm_lapic_set_base':
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:658:17: note: in expansion of macro 'printk'
     658 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:672:9: note: in expansion of macro 'printk_ratelimited'
     672 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:672:28: note: in expansion of macro 'KERN_ERR'
     672 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                            ^~~~~~~~
   include/linux/kvm_host.h:855:9: note: in expansion of macro 'pr_err_ratelimited'
     855 |         pr_err_ratelimited("kvm [%i]: " fmt, \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:860:9: note: in expansion of macro 'kvm_pr_unimpl'
     860 |         kvm_pr_unimpl("vcpu%i, guest rIP: 0x%lx " fmt,                  \
         |         ^~~~~~~~~~~~~
   arch/x86/kvm/lapic.c:2586:17: note: in expansion of macro 'vcpu_unimpl'
    2586 |                 vcpu_unimpl(vcpu, "APIC base %#llx is not %#llx",
         |                 ^~~~~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:658:17: note: in expansion of macro 'printk'
     658 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:672:9: note: in expansion of macro 'printk_ratelimited'
     672 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:672:28: note: in expansion of macro 'KERN_ERR'
     672 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                            ^~~~~~~~
   include/linux/kvm_host.h:855:9: note: in expansion of macro 'pr_err_ratelimited'
     855 |         pr_err_ratelimited("kvm [%i]: " fmt, \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:860:9: note: in expansion of macro 'kvm_pr_unimpl'
     860 |         kvm_pr_unimpl("vcpu%i, guest rIP: 0x%lx " fmt,                  \
         |         ^~~~~~~~~~~~~
   arch/x86/kvm/lapic.c:2586:17: note: in expansion of macro 'vcpu_unimpl'
    2586 |                 vcpu_unimpl(vcpu, "APIC base %#llx is not %#llx",
         |                 ^~~~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
