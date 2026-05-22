Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA373E63B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450781; cv=none; b=mfaXiaNUB7b7wvuFpt1Nw6YBWhSwr/W5BvwyoSRMQyLc3vbv9JJnTMJUn964ZtVX+a7oA4KLJES4AoP3A6XoOg/D4b08Q9bCgwiq5gnBHynEb2u9wnhLef0Iu/eEU2M5F+0XgVpqsg3NaFp4/I4lk7/TePucM0eLAaL/KH7oeSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450781; c=relaxed/simple;
	bh=WdD7HVBPU91jhp2S7sc941ByUVYx9VoQeE4j/p8XIQg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P0+tT5szH9sdJf/Y+mdXTn6F34MBc11GpKXKqb3dAWCxy9z9V/jcY8ROP3X9ZwBTALSyDujrqcaOsVZa8gEFO4Of7hV503dh2vKqDE2wn63NyQ9hRljpCw/QrAcjRAInz2WBYMOoBLJlCiKlGS/nBU9g7Jw7BBobm5mNDwS6bF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ct96z8RR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ct96z8RR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779450780; x=1810986780;
  h=date:from:to:cc:subject:message-id;
  bh=WdD7HVBPU91jhp2S7sc941ByUVYx9VoQeE4j/p8XIQg=;
  b=ct96z8RR3FPqdz/IJpBPpQkY7R+Fpbv+1hRgzIZtIDltKyZG7xdiBWE7
   0UGmoiOMsaYIAuQAAnOOy4Lx9Sy6ky+1O8eaSVhOHwhC/+glkCrfyHPTR
   fqwxwYt2KQrPUkYbZ2f45KRJzCRCS83w/XJLB57dEHPYa8swCBR0ZkkFE
   C3RP6PkagT+GVMe68JZpsRsJsdVye/noP47OTbKitX6Ouog5BX7lhHi2T
   oPkV6Kn4LigGRwQpxrIatr0M1Ax/RAjvef7yBfbcInLb7q7TM2EBeYk2d
   e2Z7ptdN8aJr+bdczQZTJBoLcIL8+UqZugMgfbZWP8V3pCI43U7rRKafZ
   w==;
X-CSE-ConnectionGUID: uxONVLGNS0+dloMK7todhQ==
X-CSE-MsgGUID: SuEKw19YTJWyh5E3Wmx0pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="84234429"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="84234429"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:52:59 -0700
X-CSE-ConnectionGUID: lD1iEVWRQy6Tc2ao8FTkJg==
X-CSE-MsgGUID: NCbGAarZRsSQp9yIneP4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="244938555"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 May 2026 04:52:57 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQOQw-000000002JD-3LZ4;
	Fri, 22 May 2026 11:52:54 +0000
Date: Fri, 22 May 2026 19:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 15/1197]
 ./usr/include/linux/io_uring.h:22:10: fatal error: stddef.h: No such file or
 directory
Message-ID: <202605221900.YEwhaRlM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: 14411011f2587579a213bea3e57541f14d492c62 [15/1197] cheri: UAPI: io_uring: Adjust structures for UAPI
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605221900.YEwhaRlM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221900.YEwhaRlM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221900.YEwhaRlM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/io_uring.h:22:10: fatal error: stddef.h: No such file or directory
      22 | #include <stddef.h>             /* for offsetof */
         |          ^~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
