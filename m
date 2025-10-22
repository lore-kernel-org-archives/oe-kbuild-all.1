Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B2A2F6181
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 07:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118390; cv=none; b=M+4sVTK54b1RtGi/ESBBdBuGtqez6R865l9s/TqOIwVX6ek26hp77vdxOkPpAGvtGTPY9Pzm9lBK043wvyxydJ6SoIYhcWminUZG+h7+k3L1XFjq5pGp4cTYEGqexspZAylDjk27jHs9RxaajSbnzmzoH59bkHz7NCCfLdajxZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118390; c=relaxed/simple;
	bh=5jGyijFXBd+kWlPS7szMVtwgQqfkd/aGB/wsypPrASk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjabEC4DEXU1osCU0oNbG2ORH1keqtmCaYYSbsFuccL8w5eDxnDmlnYD7qjs3LSdNXJ0k3hQ3HhoAUwSPLEUuyQtmKjtqNAP8yjsMdpeliHOd2FFhuuES+ls5agSU66bPfmJwFKnbZywLmnp1Ngr2FMfDiuQrqOM1+oANStJZSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LM5LkExG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LM5LkExG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761118386; x=1792654386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5jGyijFXBd+kWlPS7szMVtwgQqfkd/aGB/wsypPrASk=;
  b=LM5LkExGjrjsrhbpKLTa4eHTCA/ymlaB4V05q9I7MZ/5kF9eVl0ADhTH
   5zQnxWtKFIoPgEXbG21liBh8oQURzZOMsHuNRxONb1RKlN0hNsLQoeAPB
   u+q3lVlDPjtM8BaeuuJwWp+ou2LZ4ZiUyZuUjom7Rm0qjP5z10bhNqXRW
   JxpZHBUhMLf+JNihKPdjaj1zEtCJkBzIRezAybhjtNqLz3q8zp0tx1UYc
   rpdSgnfHjHqFL5se51R1+BtgLnjCU+rFjyayVPlRiRR6IZpeluj8kXq/a
   6PMRDe2x1coqnmpNjBJHONqeMakr5sCouIm2zB6JMSJqTRonfTXniYehm
   w==;
X-CSE-ConnectionGUID: V+q+x5l2TQ2+me03WeCaLw==
X-CSE-MsgGUID: 7cwE7sn3QGSccNnstcGoYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50831355"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="50831355"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 00:33:05 -0700
X-CSE-ConnectionGUID: fov/Oc3RRLiiWkuh5b5zYg==
X-CSE-MsgGUID: RHrFOH6rSy2zXBLfuY46JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="187840887"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Oct 2025 00:33:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBTJr-000C6D-0U;
	Wed, 22 Oct 2025 07:32:03 +0000
Date: Wed, 22 Oct 2025 15:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Subject: Re: [PATCH] Kconfig:Uses glibc so strscpy has to be manually- added
Message-ID: <202510221519.nzy5mUJ3-lkp@intel.com>
References: <20251021171446.46942-1-biancaa2210329@ssn.edu.in>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021171446.46942-1-biancaa2210329@ssn.edu.in>

Hi Biancaa,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biancaa-Ramesh/Kconfig-Uses-glibc-so-strscpy-has-to-be-manually-added/20251022-011608
base:   linus/master
patch link:    https://lore.kernel.org/r/20251021171446.46942-1-biancaa2210329%40ssn.edu.in
patch subject: [PATCH] Kconfig:Uses glibc so strscpy has to be manually- added
config: arm-randconfig-r071-20251022 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221519.nzy5mUJ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221519.nzy5mUJ3-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/kconfig/util.c: In function 'str_new':
>> scripts/kconfig/util.c:70:9: error: implicit declaration of function 'strscpy'; did you mean 'strlcpy'? [-Wimplicit-function-declaration]
      70 |         strscpy(gs.s, "\0");
         |         ^~~~~~~
         |         strlcpy
   scripts/kconfig/symbol.c: In function 'sym_set_string_value':
>> scripts/kconfig/symbol.c:812:9: error: implicit declaration of function 'strscpy'; did you mean 'strlcpy'? [-Wimplicit-function-declaration]
     812 |         strscpy(val, newval);
         |         ^~~~~~~
         |         strlcpy
   make[3]: *** [scripts/Makefile.host:131: scripts/kconfig/util.o] Error 1
   scripts/kconfig/confdata.c: In function 'conf_touch_dep':
>> scripts/kconfig/confdata.c:157:9: error: implicit declaration of function 'strscpy'; did you mean 'strlcpy'? [-Wimplicit-function-declaration]
     157 |         strscpy(depfile_path + depfile_prefix_len, name);
         |         ^~~~~~~
         |         strlcpy
   make[3]: *** [scripts/Makefile.host:131: scripts/kconfig/confdata.o] Error 1
   make[3]: *** [scripts/Makefile.host:131: scripts/kconfig/symbol.o] Error 1
   make[3]: Target 'oldconfig' not remade because of errors.
   make[2]: *** [Makefile:742: oldconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
   scripts/kconfig/util.c: In function 'str_new':
>> scripts/kconfig/util.c:70:9: error: implicit declaration of function 'strscpy'; did you mean 'strlcpy'? [-Wimplicit-function-declaration]
      70 |         strscpy(gs.s, "\0");
         |         ^~~~~~~
         |         strlcpy
   make[3]: *** [scripts/Makefile.host:131: scripts/kconfig/util.o] Error 1
   scripts/kconfig/confdata.c: In function 'conf_touch_dep':
>> scripts/kconfig/confdata.c:157:9: error: implicit declaration of function 'strscpy'; did you mean 'strlcpy'? [-Wimplicit-function-declaration]
     157 |         strscpy(depfile_path + depfile_prefix_len, name);
         |         ^~~~~~~
         |         strlcpy
   scripts/kconfig/symbol.c: In function 'sym_set_string_value':
>> scripts/kconfig/symbol.c:812:9: error: implicit declaration of function 'strscpy'; did you mean 'strlcpy'? [-Wimplicit-function-declaration]
     812 |         strscpy(val, newval);
         |         ^~~~~~~
         |         strlcpy
   make[3]: *** [scripts/Makefile.host:131: scripts/kconfig/confdata.o] Error 1
   make[3]: *** [scripts/Makefile.host:131: scripts/kconfig/symbol.o] Error 1
   make[3]: Target 'olddefconfig' not remade because of errors.
   make[2]: *** [Makefile:742: olddefconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +70 scripts/kconfig/util.c

    62	
    63	/* Allocate initial growable string */
    64	struct gstr str_new(void)
    65	{
    66		struct gstr gs;
    67		gs.s = xmalloc(sizeof(char) * 64);
    68		gs.len = 64;
    69		gs.max_width = 0;
  > 70		strscpy(gs.s, "\0");
    71		return gs;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
