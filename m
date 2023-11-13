Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5413D72
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Nov 2023 04:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCjtsxk9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699850758; x=1731386758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Cdvy3M9g2NHQ82iGI+fE5nIboFjusruI948PYIgpY2o=;
  b=jCjtsxk9hfal8rcILAxTR+IMriLU5HLBQXduw8DBDHRoY8USZJ2ofcFQ
   4QtXLGvdVwVzpb+v4cGtZKLkemEGGye60NG+PtoHwftLV4ReCEs60DK8H
   ufgnnw4Wsbx7I+SukLtA/QZ6TUvKH67uuomVukIdho2YuuDkaHSu0nVfx
   oZQcrfTDrlLorJRXvn+7oVoQoAZmHbsrNsNMd/bAIOAZgMxKXkjLrWJTH
   wp53mb8NQaLX1jEi0fusSAejmxuG4VbrTSx2CKxeL5Wmi66ecKqaCQ0hQ
   nbUie9gvX6V47XqL1HZoO1awVufhx35E7rsdmpKcoB8WKhOfOdic+8SMb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="369705984"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="369705984"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 20:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="907935409"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="907935409"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Nov 2023 20:45:56 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2Ope-000Boc-21;
	Mon, 13 Nov 2023 04:45:54 +0000
Date: Mon, 13 Nov 2023 12:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 11/19] KVM: x86: Add new hypercall to set EPT
 permissions
Message-ID: <202311131256.g3KYfiJx-lkp@intel.com>
References: <20231113022326.24388-12-mic@digikod.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231113022326.24388-12-mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 881375a408c0f4ea451ff14545b59216d2923881]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/virt-Introduce-Hypervisor-Enforced-Kernel-Integrity-Heki/20231113-102847
base:   881375a408c0f4ea451ff14545b59216d2923881
patch link:    https://lore.kernel.org/r/20231113022326.24388-12-mic%40digikod.net
patch subject: [RFC PATCH v2 11/19] KVM: x86: Add new hypercall to set EPT permissions
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20231113/202311131256.g3KYfiJx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131256.g3KYfiJx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311131256.g3KYfiJx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/heki.h:11,
                    from init/main.c:102:
>> include/linux/kvm_types.h:27:10: fatal error: asm/kvm_types.h: No such file or directory
      27 | #include <asm/kvm_types.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +27 include/linux/kvm_types.h

d77a39d982431e drivers/kvm/types.h       Hollis Blanchard    2007-12-03  26  
2aa9c199cf8151 include/linux/kvm_types.h Sean Christopherson 2020-07-02 @27  #include <asm/kvm_types.h>
2aa9c199cf8151 include/linux/kvm_types.h Sean Christopherson 2020-07-02  28  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
