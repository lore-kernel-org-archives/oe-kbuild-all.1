Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFE32737F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509826; cv=none; b=skiCIP4AhePHFzCQerDDD/1lE+8xvsPkhSzZf4bBrqOjAIo2FcPYcmyDAeB0YEPXTsyO12xDm76kWE/BU0VsLJL/qLgkCgEZrODCiZlROOCZAr7IraXlikR6rUPDlQWE6hK7OKbHFVPZ8at7mv1+GMVtHyb0ZtCKh+/n7tPlHmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509826; c=relaxed/simple;
	bh=vtY/pLSeWwXzGEzypFz+sT8HToe3F5KU/4Z7xlJelUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7gYtmQYg68O2KeNbjqBfMzk8gJw04cOxRm2H3wy/Axuj3hjRobbPKDrJ6pf2fCSLRknQewII90LtC35G/aCZ8y110RJBC4SP6lmsidEZ1PwvSyzVpLV+VvuqGZsGbHjH9k5Aw3kDVV1EZKKx0+CZaPhH0QwWqo2yj66h5aEHBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/6oL4SS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/6oL4SS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769509822; x=1801045822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vtY/pLSeWwXzGEzypFz+sT8HToe3F5KU/4Z7xlJelUQ=;
  b=c/6oL4SSGzoLWxbX4sMq/MOShLhts+XDk6yNwmE7bmeHs0oMKydjzdSC
   e2GWXZyuplQ6hjntvq3YSpeIlMyt/7h7GyTLHkMLGndXRxuukPm3ORq0I
   1agnCnff0J6MqDB3dVqF6miR+4iJLR4FVjLnsTEK9MU9AN8JdzoDR1heV
   Bn4VCqtlXchcEtR2yVnrEsW33+F+wx1pLUKClQoYWv3VTAM/uE36whE9X
   BgLtNZ0Z1es8j4VqxJ/cH3CZQqiwu67PZvPzY0R/l1+Qh/PPoOTUuhBCu
   qnT0HRpcfEbig5nPngpJM465k+m2wbV6Ohc/9gUHzIimnabv9kl6d2MFl
   g==;
X-CSE-ConnectionGUID: gx8rHkU3S8GEUkddIo/MsA==
X-CSE-MsgGUID: JSf0ua7PShi2Qcc59wmwkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82131379"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82131379"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:30:19 -0800
X-CSE-ConnectionGUID: 4O2r9//1TJ+8F96+BRB/ag==
X-CSE-MsgGUID: U7tkLRyjSY6umru95jVdYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="245555790"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jan 2026 02:30:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkgKt-00000000YJY-0eZE;
	Tue, 27 Jan 2026 10:30:15 +0000
Date: Tue, 27 Jan 2026 18:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: wenxiong@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, haren@linux.ibm.com,
	tyreld@linux.ibm.com, Wen Xiong <wenxiong@linux.ibm.com>
Subject: Re: [PATCH] error path improvement in dlpar add
Message-ID: <202601271847.dv1oYfPw-lkp@intel.com>
References: <20260127021845.2326-1-wenxiong@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127021845.2326-1-wenxiong@linux.ibm.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.19-rc7 next-20260126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wenxiong-linux-ibm-com/error-path-improvement-in-dlpar-add/20260127-121714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260127021845.2326-1-wenxiong%40linux.ibm.com
patch subject: [PATCH] error path improvement in dlpar add
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260127/202601271847.dv1oYfPw-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271847.dv1oYfPw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271847.dv1oYfPw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:386,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from arch/powerpc/kernel/pci-hotplug.c:13:
   arch/powerpc/kernel/pci-hotplug.c: In function 'pci_hp_add_devices':
>> include/linux/kern_levels.h:5:25: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:484:25: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:555:9: note: in expansion of macro 'printk'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:555:16: note: in expansion of macro 'KERN_ERR'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/powerpc/kernel/pci-hotplug.c:182:17: note: in expansion of macro 'pr_err'
     182 |                 pr_err("%s: unable to add hotplug pci device!\n");
         |                 ^~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
