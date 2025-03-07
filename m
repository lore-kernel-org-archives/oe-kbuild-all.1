Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63899219A67
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 12:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741350671; cv=none; b=i1aM+bWO2aixd1HOD7SuWa2nQpAhq0lez6g47H+Tz3WM9o24tBBWX+Vdn/sUulIbu9Z2iHVNtHAu0sVgLtKvpDHvxK6mZfGQlrAvamiFgsuRMtzlF7WbXcNBWvoIGrVVEYwSMZPxHepDaKVl9Dvs35TRr72ct72N5QlgnaFdWAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741350671; c=relaxed/simple;
	bh=/DfnoP9BOvlv/etn/gwHlgqlvTGYVq3fn72OEE7vBAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGeL3dKaWDECV0I+rok+1UpBhe+Lre9f/xI/CVgD5mSCqL7m1Z5utyfmhP44DQZkKB+7TjdqZxazew53DGq6eHvcvXorm9sYVNXKq5OUspqgtXT+t34sUT7V2VDKyDcSSAt8yDtJ9hPL4E3T8LiMZTNF+OpeXDi5vj6i5uHkXUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEVb5deD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEVb5deD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741350670; x=1772886670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/DfnoP9BOvlv/etn/gwHlgqlvTGYVq3fn72OEE7vBAU=;
  b=nEVb5deDM+p8XccDulJyAphmJs34cgzhSKqpD3yt6XG/yDphe68WYAGr
   Cuz9TjecK+NAlCpxSCnHrDxsk2sTfnxVjVfES4IwJvs7ZBJFrFxjiBw8h
   ix1nC8OpMCROqw54hY/utwDfifTXz2uz4d1RCCWFJBP1IfaZdiZfdkQMD
   ae4TMaL3iPLG60HkTiEcI3YoPo9tVw4cKjz0LtdbISly6+XSqShdhd6G6
   qc9NMSoFsbYHIbdS4HbKjMcmxwCoJF1wyBtNjg2lvZUVQl4iYijo73cNc
   HCEMKOtWuHaPpOn2nugFirIQu0+MiB6c8PoUnqeJji90z2XjsXr60b7/k
   w==;
X-CSE-ConnectionGUID: xv82KLTNT+2qlclzAcc8Ew==
X-CSE-MsgGUID: 647XW6c1Ri2QufxT1o930Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42274962"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42274962"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 04:31:06 -0800
X-CSE-ConnectionGUID: vJceECq4Ry6BOajat4kKzw==
X-CSE-MsgGUID: 0DmmofkrTwKfbm7uHBe8Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124230491"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2025 04:31:04 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqWqz-0000Sn-38;
	Fri, 07 Mar 2025 12:31:01 +0000
Date: Fri, 7 Mar 2025 20:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Willy Tarreau <w@1wt.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: don't use asm/ UAPI headers
Message-ID: <202503072041.LhDGl9Vn-lkp@intel.com>
References: <20250305-nolibc-asm-headers-v1-1-f2053def2ee7@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-nolibc-asm-headers-v1-1-f2053def2ee7@linutronix.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cb839e0cc881b4abd4a2e64cd06c2e313987a189]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/tools-nolibc-don-t-use-asm-UAPI-headers/20250305-155035
base:   cb839e0cc881b4abd4a2e64cd06c2e313987a189
patch link:    https://lore.kernel.org/r/20250305-nolibc-asm-headers-v1-1-f2053def2ee7%40linutronix.de
patch subject: [PATCH] tools/nolibc: don't use asm/ UAPI headers
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072041.LhDGl9Vn-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/include/nolibc/sys.h: linux/signal.h is included more than once.

vim +14 tools/include/nolibc/sys.h

    11	
    12	/* system includes */
    13	#include <linux/unistd.h>
  > 14	#include <linux/signal.h>  /* for SIGCHLD */
    15	#include <linux/termios.h>
    16	#include <linux/mman.h>
    17	#include <linux/fs.h>
    18	#include <linux/loop.h>
    19	#include <linux/time.h>
    20	#include <linux/auxvec.h>
    21	#include <linux/fcntl.h> /* for O_* and AT_* */
    22	#include <linux/stat.h>  /* for statx() */
    23	#include <linux/prctl.h>
    24	#include <linux/resource.h>
    25	#include <linux/utsname.h>
  > 26	#include <linux/signal.h>
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
