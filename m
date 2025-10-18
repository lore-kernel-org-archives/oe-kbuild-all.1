Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1571F5437
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 07:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760770943; cv=none; b=UobJ1zwLJyCvole9HUgOiI18AYxHSu/JCR8/KT7yvMkIBI11szcaZJOX6rPCcsyEH57AQVnmSek/eRb369qoBC3wixFQwFE1aMjplcMsLaUcyNIWKGCDhj3s8jHf1bXHahqj7gx13uD4rE6zqn4CxCAlfP+ZJdjCeDc0G/1+Jtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760770943; c=relaxed/simple;
	bh=TSiEqBnl00Iyoj5x1sNd17EmuTdQ8NtthzW0DC34O9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FbRRtUbCXxQC39M9f1bE5F5gWebp8pw8OfenWjhf+gExt9Uw0shjozGZOsEPg7shv5rkWuPORCFTX2xN5ZwNlSptEFrzniX59JQrhJlg3s0PU9yjbK6E28sDrCJ+M85ftUza9SehvAmaOcpxqrHeB/cKdKcRaMCkDv7USAeLGkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7orrhMm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7orrhMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760770942; x=1792306942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TSiEqBnl00Iyoj5x1sNd17EmuTdQ8NtthzW0DC34O9c=;
  b=c7orrhMmqTx/ROY0fJuiLPrAdiqA+jg5VBZWDQ0oyxvqt4OV16qQGxMc
   U70K66vDjl2lU7ynF/ykNrZMJoszzK2Q7NBzsTQPSsf+SrSM1vYxonrn+
   nK3ASePt1GAe7oP/vr5S2BMeQ8Npy7eazBw4TjQnKNmLHTrt7VOSjCJJL
   vz2veymWC5sZSC8NtAFficIBaaXcXLUIDhjuqttZCuZOb7d2JQ5qTrHi8
   NOy0D7NW0Fud3rp1wCrIQHfvx/FuXpzyEgGp7icgMc9RtVDPY766rJuPK
   YOj14JqMK5nXVVEhFFIde7+m1zZa+GX8tnQVwLBi8i3PNqkCf3CHxiYnc
   A==;
X-CSE-ConnectionGUID: 9c0H8obhTRm1hY33P6/qoQ==
X-CSE-MsgGUID: IdFj23KWTUqLWIMu2WC03w==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62191282"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="62191282"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 00:02:21 -0700
X-CSE-ConnectionGUID: XfAnEfwRQ/ux6rxm1Wf3bA==
X-CSE-MsgGUID: OC0hPVGDRFG5i4aUYyWm9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="188215559"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Oct 2025 00:02:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA0xB-00087z-1X;
	Sat, 18 Oct 2025 07:02:13 +0000
Date: Sat, 18 Oct 2025 15:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:BITS 5/5] sound/core/oss/rate.c:28:9: warning: "BITS"
 redefined
Message-ID: <202510181425.qOljV2CX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux BITS
head:   266545210d5afb06e8040b7c5bb21fd1bc9ff862
commit: 266545210d5afb06e8040b7c5bb21fd1bc9ff862 [5/5] move BITS() macro
config: i386-buildonly-randconfig-002-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181425.qOljV2CX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181425.qOljV2CX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181425.qOljV2CX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/oss/rate.c:28:9: warning: "BITS" redefined
      28 | #define BITS    (1<<SHIFT)
         |         ^~~~
   In file included from include/linux/bits.h:5,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from sound/core/oss/rate.c:22:
   include/vdso/bits.h:10:9: note: this is the location of the previous definition
      10 | #define BITS(b, e)      ((BIT(e) - BIT(b)) + BIT(e))
         |         ^~~~


vim +/BITS +28 sound/core/oss/rate.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  26  
^1da177e4c3f41 Linus Torvalds 2005-04-16  27  #define SHIFT	11
^1da177e4c3f41 Linus Torvalds 2005-04-16 @28  #define BITS	(1<<SHIFT)
^1da177e4c3f41 Linus Torvalds 2005-04-16  29  #define R_MASK	(BITS-1)
^1da177e4c3f41 Linus Torvalds 2005-04-16  30  

:::::: The code at line 28 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
