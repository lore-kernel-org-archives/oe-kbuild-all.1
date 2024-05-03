Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124755BAF0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 22:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714774384; cv=none; b=AFYbk2Kl1nSgGB8qJc7+WxMvqKOQGT19+B9ngLdBpQV8XALu2YM0fP4DDwrfDvqUElDGdiJsk/LLZvG2FfPOG/ljSes71sIzf6usGbQ4tr1G97AlJIqmLXTe1PljMDC0g6gsx3JC/IFoJV93WPbUdFfqS6RJWn3wqYh0LFoymcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714774384; c=relaxed/simple;
	bh=NdkGFzTQmXs0H6b9jmyko3p6dWIve0dzIqhBEIpGwQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dGtPqiUJ2uboiGnOhUPFvsGdu8z8q05crteuks/hEqxmXfDWjzKJ3wWh/kAGO369ZzfrtJKU+w3JiaF7nd8+0ht++3wIuP629a+O5XqZV+lKNKfV1s+oAeI2FCHzgtIGEx5CG/OSvktSXe1JKVrMgNKRi3G6OFdMaIp+OOj/350=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDorL1Jz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDorL1Jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714774382; x=1746310382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NdkGFzTQmXs0H6b9jmyko3p6dWIve0dzIqhBEIpGwQQ=;
  b=QDorL1JzYv3U6O3dotUSXe61nUVAYzt/AP5zeNfbqllcCdZUdMVYlYQa
   1a8FD28p+RyaFG5JLI/sNphFH3AJm4lFELQrfnsLP40mZiVw38brugov2
   u6X/GgpkVqUt2go/5CWAW9Y1EXRoMRBWW9p44T6mE0KJ/DftQQalpUh8i
   AYWJB9aj1T8PqEe5URshgx8JbxlZmSvtI/R5xMdKTIlINPUI7D+1kwCwJ
   INdhcp7VQ7ESTjdW45xv0oHQp7vb0wClPyj4bUVyZjD4Xw0qsVeD0D37A
   TqGVfOly0zFI37585eyQ822feUqwe/fS2KP2L0v/72uovkgfzIpwL9Vr9
   g==;
X-CSE-ConnectionGUID: lK9WMElUSEKl72ruxnenfQ==
X-CSE-MsgGUID: HZ+SjuEMTpaDxsXhtVA2og==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10478104"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10478104"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 15:13:01 -0700
X-CSE-ConnectionGUID: 0WD9H/p0Qai60jMIHRdvkg==
X-CSE-MsgGUID: Tbku4kfuRXOZ/AN5V547dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="50769428"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2024 15:13:00 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s319G-000C8w-1K;
	Fri, 03 May 2024 22:12:58 +0000
Date: Sat, 4 May 2024 06:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:wip/v6.9-rc2/unsigned-overflow-sanitizer 47/109]
 include/linux/overflow.h:289: Error: no such instruction: `if
 (__must_check_overflow(__builtin_add_overflow(addend1,addend2,&bytes)))'
Message-ID: <202405040602.DUclG9bR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git wip/v6.9-rc2/unsigned-overflow-sanitizer
head:   4eae48ae0df1d1feb751f794fa8495093e36168d
commit: f91878620779a9d22e89b53c66294fca25b0347a [47/109] include/asm-generic/percpu.h: wrapping math: use *_wrap()
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20240504/202405040602.DUclG9bR-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040602.DUclG9bR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040602.DUclG9bR-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/overflow.h: Assembler messages:
   include/linux/overflow.h:51: Error: no such instruction: `static inline bool __must_check __must_check_overflow(bool overflow)'
   include/linux/overflow.h:52: Error: no such instruction: `{'
   include/linux/overflow.h:53: Error: no such instruction: `return unlikely(overflow)'
   include/linux/overflow.h:54: Error: junk at end of line, first unrecognized character is `}'
   include/linux/overflow.h:266: Error: no such instruction: `static inline size_t __must_check size_mul(size_t factor1,size_t factor2)'
   include/linux/overflow.h:267: Error: no such instruction: `{'
   include/linux/overflow.h:268: Error: no such instruction: `size_t bytes'
   include/linux/overflow.h:270: Error: no such instruction: `if (__must_check_overflow(__builtin_mul_overflow(factor1,factor2,&bytes)))'
   include/linux/overflow.h:271: Error: no such instruction: `return (~(size_t)0)'
   include/linux/overflow.h:273: Error: no such instruction: `return bytes'
   include/linux/overflow.h:274: Error: junk at end of line, first unrecognized character is `}'
   include/linux/overflow.h:285: Error: no such instruction: `static inline size_t __must_check size_add(size_t addend1,size_t addend2)'
   include/linux/overflow.h:286: Error: no such instruction: `{'
   include/linux/overflow.h:287: Error: no such instruction: `size_t bytes'
>> include/linux/overflow.h:289: Error: no such instruction: `if (__must_check_overflow(__builtin_add_overflow(addend1,addend2,&bytes)))'
   include/linux/overflow.h:290: Error: no such instruction: `return (~(size_t)0)'
   include/linux/overflow.h:292: Error: no such instruction: `return bytes'
   include/linux/overflow.h:293: Error: junk at end of line, first unrecognized character is `}'
   include/linux/overflow.h:306: Error: no such instruction: `static inline size_t __must_check size_sub(size_t minuend,size_t subtrahend)'
   include/linux/overflow.h:307: Error: no such instruction: `{'
   include/linux/overflow.h:308: Error: no such instruction: `size_t bytes'
   include/linux/overflow.h:310: Error: no such instruction: `if (minuend==(~(size_t)0)||subtrahend==(~(size_t)0)||'
   include/linux/overflow.h:311: Error: no such instruction: `__must_check_overflow(__builtin_sub_overflow(minuend, subtrahend,&bytes)))'
   include/linux/overflow.h:312: Error: no such instruction: `return (~(size_t)0)'
   include/linux/overflow.h:314: Error: no such instruction: `return bytes'
   include/linux/overflow.h:315: Error: junk at end of line, first unrecognized character is `}'


vim +289 include/linux/overflow.h

610b15c50e86eb Kees Cook 2018-05-07  275  
610b15c50e86eb Kees Cook 2018-05-07  276  /**
e1be43d9b5d0d1 Kees Cook 2021-09-18  277   * size_add() - Calculate size_t addition with saturation at SIZE_MAX
e1be43d9b5d0d1 Kees Cook 2021-09-18  278   * @addend1: first addend
e1be43d9b5d0d1 Kees Cook 2021-09-18  279   * @addend2: second addend
610b15c50e86eb Kees Cook 2018-05-07  280   *
e1be43d9b5d0d1 Kees Cook 2021-09-18  281   * Returns: calculate @addend1 + @addend2, both promoted to size_t,
e1be43d9b5d0d1 Kees Cook 2021-09-18  282   * with any overflow causing the return value to be SIZE_MAX. The
e1be43d9b5d0d1 Kees Cook 2021-09-18  283   * lvalue must be size_t to avoid implicit type conversion.
610b15c50e86eb Kees Cook 2018-05-07  284   */
e1be43d9b5d0d1 Kees Cook 2021-09-18  285  static inline size_t __must_check size_add(size_t addend1, size_t addend2)
610b15c50e86eb Kees Cook 2018-05-07  286  {
610b15c50e86eb Kees Cook 2018-05-07  287  	size_t bytes;
610b15c50e86eb Kees Cook 2018-05-07  288  
e1be43d9b5d0d1 Kees Cook 2021-09-18 @289  	if (check_add_overflow(addend1, addend2, &bytes))
610b15c50e86eb Kees Cook 2018-05-07  290  		return SIZE_MAX;
610b15c50e86eb Kees Cook 2018-05-07  291  
610b15c50e86eb Kees Cook 2018-05-07  292  	return bytes;
610b15c50e86eb Kees Cook 2018-05-07  293  }
610b15c50e86eb Kees Cook 2018-05-07  294  

:::::: The code at line 289 was first introduced by commit
:::::: e1be43d9b5d0d1310dbd90185a8e5c7145dde40f overflow: Implement size_t saturating arithmetic helpers

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
