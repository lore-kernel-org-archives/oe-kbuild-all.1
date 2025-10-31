Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE94932ABF7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 23:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761953531; cv=none; b=r2cvI5ko3nSGd9LqU5/SHF9YF4z4utAJ7zwJXUcuXqnel7V2Yfsihzyv21GI6q4XWBPJqR9+Xl52euK8YJv+ZnzRBRsgALnV20mXvsLyuDK0F+D45M0a0c3LZ8SusCg4cyIaH03Uqcrqaoty1XcWBoNLOarucPrah6oz9nFWivs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761953531; c=relaxed/simple;
	bh=MwRqjYevjHFcBpDOSWwiArO9qAZtX88K8HrrBcDQxzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ewv9RcUdMNNYgRCA/8bsRY857wj+dnJV8N3lwy9FbcmsxTpCKGq4QDZaq4VcEE65EETMv/igkZeBUQ9S1ab2qriMoN6l733CjwwOorIzoUnRDWEkyg8NGfjMUr84htsytaU7qP+pHeKPuhF5VEcv9eXa1jZP0r/lSbeI+3bnkBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FH81Gbs7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FH81Gbs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761953529; x=1793489529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MwRqjYevjHFcBpDOSWwiArO9qAZtX88K8HrrBcDQxzY=;
  b=FH81Gbs7iCpW+vB+kuN8paoqyc1hq2vSNzh5J/p6+SThdPZwXJO1fWSz
   4bEW2+qubVkUJ+pxQmcKZaHIpD7U0AKnzxUVLEBRxFSVjtEah/tuU2FLU
   EJ752z2/9DlQjSCCWUAJT39ZmJtnhXz0j6YvpLVVS24BWHMIgQRCQM0qt
   N412o7bW7yKMtSOVyJpKOdGgd7ObDEuQNXpDo/SDOy4oEFbatAcXWPjP0
   vnLt6sJ4I7N76Amchdzf1pfLh7RHaJI2yhY52f5ssTqQzWMANyYyiVwcp
   NgY+pfM7M8amRMQ64FUmT6obMUFOQ6xTfG8qCRGP2ssGWTiiD5+svwaVe
   Q==;
X-CSE-ConnectionGUID: E1XitalgTVWb+vLT5SyBow==
X-CSE-MsgGUID: zuRjPylURp+flRervY92DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64025764"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64025764"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 16:32:09 -0700
X-CSE-ConnectionGUID: IeMUZ8jbTCebYwi2GKEtAg==
X-CSE-MsgGUID: MHEqQcFDQjOm8xC89SORPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="209912693"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 31 Oct 2025 16:32:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEybE-000Nik-20;
	Fri, 31 Oct 2025 23:32:04 +0000
Date: Sat, 1 Nov 2025 07:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>, torvalds@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, brauner@kernel.org,
	viro@zeniv.linux.org.uk, jack@suse.cz, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, tglx@linutronix.de, pfalcato@suse.de,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH 3/3] fs: hide names_cachep behind runtime access machinery
Message-ID: <202511010706.nuASkMjZ-lkp@intel.com>
References: <20251031174220.43458-4-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031174220.43458-4-mjguzik@gmail.com>

Hi Mateusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on linus/master brauner-vfs/vfs.all v6.18-rc3 next-20251031]
[cannot apply to linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Guzik/x86-fix-access_ok-and-valid_user_address-using-wrong-USER_PTR_MAX-in-modules/20251101-054539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20251031174220.43458-4-mjguzik%40gmail.com
patch subject: [PATCH 3/3] fs: hide names_cachep behind runtime access machinery
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251101/202511010706.nuASkMjZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010706.nuASkMjZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010706.nuASkMjZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1016,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/alpha/kernel/asm-offsets.c:11:
>> include/linux/fs.h:54:10: fatal error: asm/runtime-const-accessors.h: No such file or directory
      54 | #include <asm/runtime-const-accessors.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:182: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +54 include/linux/fs.h

    51	
    52	#include <asm/byteorder.h>
    53	#ifndef MODULE
  > 54	#include <asm/runtime-const-accessors.h>
    55	#endif
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
