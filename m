Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C445132C305
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766520861; cv=none; b=FYxnoxjLOUwalnZLgktDzBlHEjgfxSRzkxsI4iDA/D0WHLXwmS4H7NsDZGsvGTahrzRAnsP6dkVOltgdIwr+tS2uhWI0tshNu99O1nWaEdDOagV8mNeg4tL1cjRohY9w8Y+wEIkQgwzsnHCk/tk2SS9VOY0apzOUd41s9T1HG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766520861; c=relaxed/simple;
	bh=ixbJDLgNVh357eU+eb/sGdsE73UbcrLjFxDE7czgoCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFqN5R68eaa/hGTfeKwe2vNjxRWd/gRx4RouYVkcJeyUmx0IvpyMOrTuK+F+5a3jrvvJhip7GHOdVgK5MWlq6U6JtRDQKz7Q32v7Foz8XcYTmHCk12Ww7Hrp++6eWdp1eCDxv/NtFOUtVlc5jO0uCVBX0FIZXUQ27hOO4hk0dNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccPLVyeB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccPLVyeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766520860; x=1798056860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ixbJDLgNVh357eU+eb/sGdsE73UbcrLjFxDE7czgoCw=;
  b=ccPLVyeBQz6Rm3++EjEIGGMiWE6ZGZXFuECQWSkA0vOCbUtNCWU0U5kh
   sV84DIJR4kzDokXzk05Y/LeLgQtTp9LhmRg0qO73lXwc8iX4bH7VD1EGn
   Gj+oMGbGSdPIVCRF3jJ7S75Z3OMgcOenhEGAsEesg77qET+3r8FJ1jgDW
   DreY+7sY3dfdw2+cYtw2Mhdo1Uf7Slsb0Pcq17Dfi1NTD+L+2UgMIsDS+
   OUKldzoS+m3L6NgsFoXOATWfdSTjSda5EtHxC6RHIiI3yuIK10gLELRLh
   ETOOsXM06KaiwtYcsfOLsq1VfemGilkwASv9m3mtvnF0+bRBOjtgNl1nz
   g==;
X-CSE-ConnectionGUID: OIRsl0IdToyD8JNRmVyy3g==
X-CSE-MsgGUID: Ytcoh24pTPaikYBOWZ+D4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68413710"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68413710"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 12:14:18 -0800
X-CSE-ConnectionGUID: lfot69LgTqqlR04qpRfG3A==
X-CSE-MsgGUID: v7OSWyTZT1mq1x7ENi67NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="204361879"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Dec 2025 12:14:16 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY8lp-000000002Kj-3K0B;
	Tue, 23 Dec 2025 20:14:13 +0000
Date: Wed, 24 Dec 2025 04:14:08 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UGF3ZcWC?= Narewski <pawel.narewski@nokia.com>,
	linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linusw@kernel.org, brgl@kernel.org,
	=?utf-8?B?UGF3ZcWC?= Narewski <pawel.narewski@nokia.com>,
	Jakub Lewalski <jakub.lewalski@nokia.com>
Subject: Re: [PATCH] gpiolib: fix race condition for gdev->srcu
Message-ID: <202512240338.Efsr69oP-lkp@intel.com>
References: <20251223084952.1847489-1-pawel.narewski@nokia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251223084952.1847489-1-pawel.narewski@nokia.com>

Hi Paweł,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawe-Narewski/gpiolib-fix-race-condition-for-gdev-srcu/20251223-165142
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20251223084952.1847489-1-pawel.narewski%40nokia.com
patch subject: [PATCH] gpiolib: fix race condition for gdev->srcu
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251224/202512240338.Efsr69oP-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240338.Efsr69oP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240338.Efsr69oP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm_types.h:13,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from drivers/gpio/gpiolib.c:3:
   drivers/gpio/gpiolib.c: In function 'gpiochip_add_data_with_key':
>> include/linux/notifier.h:86:35: error: 'struct raw_notifier_head' has no member named 'rwsem'
      86 |                 init_rwsem(&(name)->rwsem);     \
         |                                   ^~
   include/linux/rwsem.h:121:23: note: in definition of macro 'init_rwsem'
     121 |         __init_rwsem((sem), #sem, &__key);                      \
         |                       ^~~
   drivers/gpio/gpiolib.c:1109:9: note: in expansion of macro 'BLOCKING_INIT_NOTIFIER_HEAD'
    1109 |         BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +86 include/linux/notifier.h

eabc069401bcf4 Alan Stern 2006-10-04  80  
e041c683412d5b Alan Stern 2006-03-27  81  #define ATOMIC_INIT_NOTIFIER_HEAD(name) do {	\
e041c683412d5b Alan Stern 2006-03-27  82  		spin_lock_init(&(name)->lock);	\
e041c683412d5b Alan Stern 2006-03-27  83  		(name)->head = NULL;		\
e041c683412d5b Alan Stern 2006-03-27  84  	} while (0)
e041c683412d5b Alan Stern 2006-03-27  85  #define BLOCKING_INIT_NOTIFIER_HEAD(name) do {	\
e041c683412d5b Alan Stern 2006-03-27 @86  		init_rwsem(&(name)->rwsem);	\
e041c683412d5b Alan Stern 2006-03-27  87  		(name)->head = NULL;		\
e041c683412d5b Alan Stern 2006-03-27  88  	} while (0)
e041c683412d5b Alan Stern 2006-03-27  89  #define RAW_INIT_NOTIFIER_HEAD(name) do {	\
e041c683412d5b Alan Stern 2006-03-27  90  		(name)->head = NULL;		\
e041c683412d5b Alan Stern 2006-03-27  91  	} while (0)
e041c683412d5b Alan Stern 2006-03-27  92  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
