Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7F61A2C1E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109189; cv=none; b=WWYGxZ00hyTgc+3T+owhe2QwNuM4tUlc4Ka8pRFwZaTC2/5Mdt/lO8MPtoLFwGwEwpCis3VaW3AQ8pEOKaxJ/MfssMjwgO+tnJsmQG5gABjXzfU43LLVRRovyztA2YAYzHRyCebkgAvaTpp/gfzhAFUjzqbmhexB+g0XBRfj8wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109189; c=relaxed/simple;
	bh=Bf/uulT+ovbqajv7inkxywrOwrdPrjO8sVhrhf3lWNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DwLEQveE4+kwotdTzXzHa0IoIUcYEL4cRtpNc2GJyjyw+MIascF45nP+9GMiKr5e3vTpUzDNX6Vw2URp4jkndyYEC+IjiqVJwFNG1xogNENynfnuLiKBqAHtrw85xFRSPJascy0suXYewnDIBJrWFKQTOJPV7A+hSgTYmydigII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJKAQaFB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJKAQaFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720109187; x=1751645187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bf/uulT+ovbqajv7inkxywrOwrdPrjO8sVhrhf3lWNY=;
  b=NJKAQaFBeU4jZOdmA3HzzuFiOtUVbhwI9dFtxVAJX9rPuZkxBCs2FVMI
   4ZrPNVieb0DqCF9BaIHAoV5VGlj3hp8Wa7GktznhH2WqgXcngxxRCmti7
   QKFVBw8702Ani6rwkaFipPpZvBWc1lygDJmdPH/T8ECLkGHdmWj0S4jCS
   kxEpaKYUJv/DsxeX3OeMgs+f+3k2t3wJuLEWvpXGU5RWejvdm30r3Adfi
   ah6T+B/MiDyWWf4fW7gc5NqSYlSMsz/rNukugu2GmuM1cybDvlDN4H8NO
   02A6M7/APtNa9uQzjAQC3iw7k2KMrSxSJqECROus0oImTbUfYNKi5MigD
   w==;
X-CSE-ConnectionGUID: EYR/qLOaT86jeDwpqZ/HpA==
X-CSE-MsgGUID: VO/6NfulQYmeE0LO29fFVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17049631"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17049631"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 09:06:19 -0700
X-CSE-ConnectionGUID: 2xu6K5kzQeaCsWrtg5l42Q==
X-CSE-MsgGUID: xyffRTHpTkOpkVNTepFpYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="77385125"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jul 2024 09:06:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPOyN-000R9x-0Z;
	Thu, 04 Jul 2024 16:06:15 +0000
Date: Fri, 5 Jul 2024 00:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [linux-next:master 9094/10451] powerpc64-linux-ld: warning: orphan
 section `.bss..Lubsan_data73' from `kernel/ptrace.o' being placed in section
 `.bss..Lubsan_data73'
Message-ID: <202407042347.9lW8j7i2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: cbdfb23849b330b0156760ee0d73348e020b8cdd [9094/10451] mm/zsmalloc: use a proper page type
config: powerpc64-randconfig-r023-20220414 (https://download.01.org/0day-ci/archive/20240704/202407042347.9lW8j7i2-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407042347.9lW8j7i2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407042347.9lW8j7i2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data73' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data73'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data73' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data73'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data73' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data73'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
