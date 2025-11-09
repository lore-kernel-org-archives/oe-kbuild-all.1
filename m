Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26B32AD25
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Nov 2025 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762685078; cv=none; b=L6vMbZ4jUqPCtfkohAAbqyA6OLyYsyPfYO8SkK4nxlkz2c9cqu5FZCr26NCQzz9bSZfqgTHz7x2gHESWlmhuB3g1WS9v4wwIvFB+O1ohGM0Ljk/gyuCg8bIJHCLuQDsnPvHVteWTrlsqfFelqXTR9pduTdNML/Y6aPt32t1XPNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762685078; c=relaxed/simple;
	bh=44MHQPu5x73Mpyie/3cjmT1gjLe/2NVED6ahHMZiY0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSdZrXlyR5kWvvIWxIY4iiTcfw3mmPXF/nFrd5Tx3VTpHxl+Mhe3SzOjI7b4xbrkxhRzMj0MvOY9Yuo3wL4QdtQX5SSLOZiUhl++g1OLSsaIaIC63owp+EZTCkvqW6uJPkxMgsvMHttgZtAzV/ONhvT516aYDLrdrMHCnz3mk4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAH/6l27; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAH/6l27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762685077; x=1794221077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=44MHQPu5x73Mpyie/3cjmT1gjLe/2NVED6ahHMZiY0E=;
  b=WAH/6l27ObCgxgHqHs5ap7BbA+m96vgYrVTN1e6MHysagx6B4Z+d5+J4
   RsLiEpuc8Gz6kT+EGHVwTRJ8sQOvM/8s9UQc3Ih3Yj7JB8iJQuS9P154j
   Pszjl4O8RjsRJMX0QXfkXjPR+TaV/BiFFaNAOFVLm1OX0Qnr4IZcHus/U
   ktIZrmfZ4RtUunT1z8cpuXcUtdvRueJwGlbK/CLyhxlOWIwcVd6fjnWuX
   SrKzOTriHLabTa/lsIM3AjXkkHSZVVG7rf55VU9oEWYKDrK/TWBfBTYfF
   jfOdejRb15N+0CWwwFN9sf0zCh8Bs3mdtQ+ofT4jDxKAb06jmEvit9x8Y
   Q==;
X-CSE-ConnectionGUID: pWhw9b/XSFKWZcJFPDpmVw==
X-CSE-MsgGUID: 4dcunIEARquv/2q29pNzbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64673005"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64673005"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 02:44:37 -0800
X-CSE-ConnectionGUID: CE3LIVPBR7e/xN0LEEcy/g==
X-CSE-MsgGUID: I0kkBDkwT5qwGH5mPL0TUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="192547074"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2025 02:44:34 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI2uN-0001w7-0B;
	Sun, 09 Nov 2025 10:44:31 +0000
Date: Sun, 9 Nov 2025 18:43:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Colomar <alx@kernel.org>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alejandro Colomar <alx@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v2 1/4] array_size.h: Add ARRAY_END()
Message-ID: <202511091804.XUQA4dOK-lkp@intel.com>
References: <35255c1ceb54518779a45351dcd79a3c1910818a.1762637046.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35255c1ceb54518779a45351dcd79a3c1910818a.1762637046.git.alx@kernel.org>

Hi Alejandro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6146a0f1dfae5d37442a9ddcba012add260bceb0]

url:    https://github.com/intel-lab-lkp/linux/commits/Alejandro-Colomar/array_size-h-Add-ARRAY_END/20251109-062234
base:   6146a0f1dfae5d37442a9ddcba012add260bceb0
patch link:    https://lore.kernel.org/r/35255c1ceb54518779a45351dcd79a3c1910818a.1762637046.git.alx%40kernel.org
patch subject: [PATCH v2 1/4] array_size.h: Add ARRAY_END()
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20251109/202511091804.XUQA4dOK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511091804.XUQA4dOK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511091804.XUQA4dOK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/floppy.c:4805:9: warning: 'ARRAY_END' redefined
    4805 | #define ARRAY_END(X) (&((X)[ARRAY_SIZE(X)]))
         |         ^~~~~~~~~
   In file included from include/linux/string.h:6,
                    from include/linux/bitmap.h:13,
                    from include/linux/nodemask.h:91,
                    from include/linux/numa.h:6,
                    from include/linux/async.h:13,
                    from drivers/block/floppy.c:166:
   include/linux/array_size.h:17:9: note: this is the location of the previous definition
      17 | #define ARRAY_END(a)  (a + ARRAY_SIZE(a))
         |         ^~~~~~~~~


vim +/ARRAY_END +4805 drivers/block/floppy.c

5a74db06cc8d36 Philippe De Muyter 2009-02-18  4804  
5a74db06cc8d36 Philippe De Muyter 2009-02-18 @4805  #define ARRAY_END(X) (&((X)[ARRAY_SIZE(X)]))
5a74db06cc8d36 Philippe De Muyter 2009-02-18  4806  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
