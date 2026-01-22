Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6743538BDA1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 02:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769049095; cv=none; b=hFF6D4b4CRz02QBwlAz2HdFPnLpbhuO3Mu38GGKjR25oUTJHSZzZzTGWZgvksFqcXXPWaw7jB9M5/9pOHKmta5TxaWUJAvJOQRiXNcKGQDXpPso8L1NRxQpHvmhmUzHkecl5GYVsQ5nHc4e7ak8kbYICPjpGKrcu83N+DXucbfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769049095; c=relaxed/simple;
	bh=zxjrDP3Kqkc/Yu+uiJoR+IX/ovjJFF+6OKk/5DzjA5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tXNKx729m7C9Tl3g0EWj6Y1SvMsxk9v7efzZJ3zDbp1XUiwhUlH2CQwQn5gK27rW/CE8GGzAfDN+NlXGP+rOxfkD18FBgG0dZDyh1C4aVnTE322h8FNeCXVGRbAeG+iaCtgIiFuNpX5X9L6lKMPBkjE3F/THiWsSpAypt6Nzsek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXHzMe70; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXHzMe70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769049092; x=1800585092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zxjrDP3Kqkc/Yu+uiJoR+IX/ovjJFF+6OKk/5DzjA5E=;
  b=SXHzMe700AFp9WHvCE/dh9dum5PcVaANCb1vNEL3lQITmOb1ZmVQJL3C
   Dgje5Hl2RHp0C3ZWwuyUvE9nJ6PMYO0RN8Xy6+RHDBcP0C9hGv0d3b5xh
   DvprW75AyhN2w5seSZWnsfigFsLbYSAj/Mg5NJ/jbhp7zkfxCfRrJOrQt
   +IsJdPz5xbzYnZPSt1+SJoWhG6iwtmwCQSpWAvzXpjDXriVrsyTnAcMvQ
   gYZWSzaiCIoFBnGFxeX6Q8ndLkHDrGxvFmOFiivST8IY6pfBmesVD36wM
   fVYUKYUO2bMMp19EAVJ/auXs+AGTu7DyODglJYRiWMYHc4YS1t7eCeRK5
   Q==;
X-CSE-ConnectionGUID: UC9CZlu8QCeW7OLSfc1gwg==
X-CSE-MsgGUID: Ob8G1cEiTReNv4HF4ElDUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69484788"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="69484788"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:31:30 -0800
X-CSE-ConnectionGUID: 1cVVW9P0Qp+NC+ER43csHA==
X-CSE-MsgGUID: I1okFOSxRf+zs3K4/r22uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206516186"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 18:31:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vikTm-00000000SKe-2D22;
	Thu, 22 Jan 2026 02:31:26 +0000
Date: Thu, 22 Jan 2026 10:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat-checkflags 7/7]
 include/asm-generic/bitsperlong.h:23:2: error: #error Inconsistent word size.
 Check uapi/asm/bitsperlong.h
Message-ID: <202601221012.RH8sYAK8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat-checkflags
head:   cb0e8254ce556c124d1c33db50f4b54d320a6d40
commit: cb0e8254ce556c124d1c33db50f4b54d320a6d40 [7/7] asm-generic/bitsperlong.h: Add sanity checks for __BITS_PER_LONG
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260122/202601221012.RH8sYAK8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221012.RH8sYAK8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221012.RH8sYAK8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/uapi/asm/bitsperlong.h:7,
                    from include/uapi/asm-generic/int-ll64.h:12,
                    from include/asm-generic/int-ll64.h:11,
                    from arch/s390/include/uapi/asm/types.h:11,
                    from arch/s390/include/asm/types.h:6,
                    from arch/s390/include/asm/page.h:12,
                    from arch/s390/kernel/vmlinux.lds.S:7:
>> include/asm-generic/bitsperlong.h:23:2: error: #error Inconsistent word size. Check uapi/asm/bitsperlong.h
      23 | #error Inconsistent word size. Check uapi/asm/bitsperlong.h
         |  ^~~~~


vim +23 include/asm-generic/bitsperlong.h

    21	
    22	#if __BITS_PER_LONG != __CHAR_BIT__ * __SIZEOF_LONG__
  > 23	#error Inconsistent word size. Check uapi/asm/bitsperlong.h
    24	#endif
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
