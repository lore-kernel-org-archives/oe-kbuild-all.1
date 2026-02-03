Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CA73D330C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 18:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142973; cv=none; b=ZCvtDSNNn5Djqk8vX0oHNeDU0hm+a0hEFg2n/0Rw+By9VVrX2RzSCuebSx0H8Z6OQQrtpWsCg+DVbDyuAIHhvQW+ZynD4+zmKHOx9nDvzNdmBJRX3gt1jbdQVKT19RrAlcvB/qZ6snlYQiWtV7HAInR9TR3P1Vf8YADgNki357g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142973; c=relaxed/simple;
	bh=mnZs2hBQr7i7F4icyQZqbtMUJCeY7vhiO+8asha2vIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+H/MTsfPXO28PCNsmf3zJJ0o0oI4wxPMB21ULG8VlUiYYbsLF+Q1RhADO17dqDmHkPVkTI2iy8whqnk5LVxv7R8zLFip61lwwvFAnlDXeZRRL0cy38fRW26bgupT5tGdNMGbcRt/J3pt5EDZR38vPe0Cp16jvk0Hh+gkfPxNXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJHybLRB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJHybLRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770142971; x=1801678971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mnZs2hBQr7i7F4icyQZqbtMUJCeY7vhiO+8asha2vIk=;
  b=hJHybLRBdrhZ8tPx0Ys8J9gal4Dvsp3zgt0w90CXLB9wC0EALtTJQt4v
   Lhuy3vJ85WIKBTexcpgmYCSzOwCRWhosqprE8JHWCnGPTT5+L/lL7lG9j
   aYN5uOB1bKT4sPZwV35ePQlHCiyAJUTDRn4hJFVfsHQQryVog+J04fPmw
   fjWBKelT3drlRRdMCdp1Bso/aqXdKh7NIP3TEpETPz3wtbTTE9SJeChtQ
   uTILtRWk8vdgbpCibVUoJntX9B8PN3qWP4G2qo4MLLqlrdK+W+I1diZf/
   fO17PkNAXvzGvqeZdj/u4YckTfELq2fW1AfzqE6qwQORKNkxRXEXi3ys0
   w==;
X-CSE-ConnectionGUID: QDlDTmUcS22/VYYwyiIdvw==
X-CSE-MsgGUID: y/S2NS7LT1ei4Qabk/6bIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82750640"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="82750640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 10:22:51 -0800
X-CSE-ConnectionGUID: NjJLnkj6R8GHqMwHJ6dRJg==
X-CSE-MsgGUID: C0DzRE9qQZOFoHwY+1+vWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214408519"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 03 Feb 2026 10:22:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnL31-000000003OP-1Gs0;
	Tue, 03 Feb 2026 18:22:47 +0000
Date: Tue, 3 Feb 2026 19:22:28 +0100
From: kernel test robot <lkp@intel.com>
To: david.laight.linux@gmail.com, Willy Tarreau <w@1wt.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org, Cheng Li <lechain@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH 11/12] selftests/nolibc: Increase coverage of printf
 format tests
Message-ID: <202602031944.7j98nfRE-lkp@intel.com>
References: <20260203103000.20206-12-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203103000.20206-12-david.laight.linux@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260202]

url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/tools-nolibc-printf-Move-length-check-to-snprintf-callback/20260203-183919
base:   next-20260202
patch link:    https://lore.kernel.org/r/20260203103000.20206-12-david.laight.linux%40gmail.com
patch subject: [PATCH 11/12] selftests/nolibc: Increase coverage of printf format tests
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260203/202602031944.7j98nfRE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031944.7j98nfRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031944.7j98nfRE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   nolibc-test.c: In function 'test_dirent':
   nolibc-test.c:784:17: warning: 'readdir_r' is deprecated [-Wdeprecated-declarations]
     784 |                 ret = readdir_r(dir, &dirent, &result);
         |                 ^~~
   In file included from nolibc-test.c:32:
   /usr/include/dirent.h:185:12: note: declared here
     185 | extern int readdir_r (DIR *__restrict __dirp,
         |            ^~~~~~~~~
   nolibc-test.c: At top level:
>> nolibc-test.c:1654:1: warning: 'mat' attribute directive ignored [-Wattributes]
    1654 | {
         | ^
--
>> nolibc-test.c:1654:1: warning: 'mat' attribute directive ignored [-Wattributes]
    1654 | {
         | ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
