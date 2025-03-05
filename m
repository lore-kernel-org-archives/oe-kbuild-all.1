Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7CE2063C6;
	Wed,  5 Mar 2025 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741170533; cv=none; b=oQ0v3UXB0DOEtplaCdKgyROC0B0TOcAYdyZjUpWf16FjcyniKiQoGFzsrPx9OP/XCFkMCVKoU4ozAKXa6zkESanVrxT3isjQSEN5Wxzxj6AEcNeIe4XjNEnuto9FxNe9pQ+P+QS8iMoOl11Qx32OwCHcer7OkNr8oWFD4nn2+0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741170533; c=relaxed/simple;
	bh=OpKK5OcF3YIghJMe6FXcLvbApwXLZUKwa8gH3NGHGko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHFbSWSVYZgfXgRt5sB7UluTth/nTZYvYwuE17sI6/UBc7PoxXdIWKLP920wLEo5GikpJPxrUGSDFwV3L4/imxien7KppqNdLXsHIKa87m9NCIm6f1LF5DjbJkykmp/TMmOE/v7Pk+A0iVRFA2HQcekbk6tsqji8QqRDi0w9E70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCjjGoH2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCjjGoH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741170532; x=1772706532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OpKK5OcF3YIghJMe6FXcLvbApwXLZUKwa8gH3NGHGko=;
  b=RCjjGoH27dnQnEyvHMQgCd5Z2eg0wl3t+z368n/uKQABOPKMrioq1HNt
   wR5mW/rgT1sImHuWOyNBPygK6uYN6G5wvR17BniWkBPoseGdPnB1IRo+g
   XWjYyjaeHJEph66sp2j0Ksvzqe7cxI1WoI1jRr6529hNdib8iH854YM/u
   i/5MeGeW3XEGM7R5zlMrhowQImRjYpdw7vwxK6tB3482j7Qq1ghgSdo5P
   1cMPq4EQ0MhL09duZowh2NF8cQ6V3OJVoZ27Ql5bHOZlQGDIbD5HpXRS1
   D7LX54M8Oy4hK6YJS5pzGcGIP0vyDSNph4P4hL9zcIcb+zJ62fto+bBs/
   g==;
X-CSE-ConnectionGUID: DPgsjIg6RnGJDkBEpCSoRg==
X-CSE-MsgGUID: EoQOURJfQPWukBC+woak2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59540312"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="59540312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:28:51 -0800
X-CSE-ConnectionGUID: 8p1v9zbjRtuJLZoKCZbe3w==
X-CSE-MsgGUID: YDSajSqQRjKMSs1A9JRr9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149606738"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 05 Mar 2025 02:28:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tplza-000KpW-0o;
	Wed, 05 Mar 2025 10:28:46 +0000
Date: Wed, 5 Mar 2025 18:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Seyediman Seyedarab <imandevel@gmail.com>, jack@suse.cz,
	amir73il@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: Re: [PATCH] inotify: disallow watches on unsupported filesystems
Message-ID: <202503051755.5uktuxba-lkp@intel.com>
References: <20250304080044.7623-1-ImanDevel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304080044.7623-1-ImanDevel@gmail.com>

Hi Seyediman,

kernel test robot noticed the following build errors:

[auto build test ERROR on jack-fs/fsnotify]
[also build test ERROR on linus/master v6.14-rc5 next-20250304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Seyediman-Seyedarab/inotify-disallow-watches-on-unsupported-filesystems/20250304-160213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify
patch link:    https://lore.kernel.org/r/20250304080044.7623-1-ImanDevel%40gmail.com
patch subject: [PATCH] inotify: disallow watches on unsupported filesystems
config: s390-randconfig-002-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051755.5uktuxba-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051755.5uktuxba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051755.5uktuxba-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:16,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/notify/inotify/inotify_user.c:17:
   fs/notify/inotify/inotify_user.c: In function 'is_unwatchable_fs':
>> fs/notify/inotify/inotify_user.c:702:40: error: 'unwatchable_fs' undeclared (first use in this function); did you mean 'is_unwatchable_fs'?
     702 |         for (int i = 0; i < ARRAY_SIZE(unwatchable_fs); i++)
         |                                        ^~~~~~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   fs/notify/inotify/inotify_user.c:702:40: note: each undeclared identifier is reported only once for each function it appears in
     702 |         for (int i = 0; i < ARRAY_SIZE(unwatchable_fs); i++)
         |                                        ^~~~~~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   In file included from include/linux/file.h:9,
                    from fs/notify/inotify/inotify_user.c:16:
   include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/notify/inotify/inotify_user.c:702:29: note: in expansion of macro 'ARRAY_SIZE'
     702 |         for (int i = 0; i < ARRAY_SIZE(unwatchable_fs); i++)
         |                             ^~~~~~~~~~


vim +702 fs/notify/inotify/inotify_user.c

   698	
   699	
   700	static inline bool is_unwatchable_fs(struct inode *inode)
   701	{
 > 702		for (int i = 0; i < ARRAY_SIZE(unwatchable_fs); i++)
   703			if (inode->i_sb->s_magic == unwatchable_fs[i])
   704				return true;
   705		return false;
   706	}
   707	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
