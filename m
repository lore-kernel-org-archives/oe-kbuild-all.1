Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD5259C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 04:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724387781; cv=none; b=Jy/EZuTcXABuD7HnCInMWfRnbBgKIj6q5VdulJGRJ3ogEGeo+JTGBXZk0G05ewzm/VGjfkROjqZSghCBMrWBM8CoYr9dhTL0C0THQ7ZIU6AuRwzAs4QXKf3jh0cMqzfZmxhGQ2/ySSVI3uAhbvdP20OGylvnbFq0BCiyZTF3aIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724387781; c=relaxed/simple;
	bh=JReguWKEPR/BWGZ2qKs5FQqKJGg/7uxU4Mje1Lb0Vn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWnROVK1g+NU+grckNbvNuK0qU5SjlTgYUVzsMOwM0fYe1uA3hjOqZew+MJo2JEILY5RXFSbseWfvOGDMD2TwHdZD+IJpRvC/LQ7IUHF4s2fk2LoQd8kgMYULDEDGtmosU0z1LHrYCZfIOK3TWxtIJSQ8Y4XOJGYgZzryljz680=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4NHqG8+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4NHqG8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724387780; x=1755923780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JReguWKEPR/BWGZ2qKs5FQqKJGg/7uxU4Mje1Lb0Vn0=;
  b=Y4NHqG8+7fnIgSW9SNTPpETXFpYbMnSt8/LMnUNLwumwNsy/lZfo7OMl
   pyiCFSmviREfqWXo42DLq+AVKiHk8ZtO8NYvbcVBy94oiQYqMkFLIMSls
   MNLWZeqSaFiVOfXPl1reJME8iLLrrvyJ5n9dTIZY8vH+KMAW3mBDC1dGg
   iI0ulMMDSeiBd16WXPwmA3zRyn7w87MXFMPk8eY2WOGr9K6G9s+3lJLlv
   itHG2d97RGodKbnaDA600iGu6ya1gNoo6QFaqnGSMfQVU2FUE8OhFm+C5
   DBdzLR9GYTpmFxvn6D0U6zPARoGmqrVP0ctjSQPqiwN1BrJn6Pnz+P31k
   A==;
X-CSE-ConnectionGUID: SbBfmApqRmW711wH7M3P1Q==
X-CSE-MsgGUID: a7fh2U0mTtOL22KVV9nt5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33503378"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="33503378"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:36:19 -0700
X-CSE-ConnectionGUID: 1XSs1Wy/QueIPZXleHFxeQ==
X-CSE-MsgGUID: bpRySlR1RJ+Ea8JiL6H6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="61354899"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Aug 2024 21:36:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shM23-000DUk-2D;
	Fri, 23 Aug 2024 04:36:15 +0000
Date: Fri, 23 Aug 2024 12:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yufan <chenyufan@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1] ceph: Convert to use jiffies macro
Message-ID: <202408231223.UP4lmulM-lkp@intel.com>
References: <20240822063941.11635-1-chenyufan@vivo.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822063941.11635-1-chenyufan@vivo.com>

Hi Chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on ceph-client/testing]
[also build test ERROR on ceph-client/for-linus linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yufan/ceph-Convert-to-use-jiffies-macro/20240822-144157
base:   https://github.com/ceph/ceph-client.git testing
patch link:    https://lore.kernel.org/r/20240822063941.11635-1-chenyufan%40vivo.com
patch subject: [PATCH v1] ceph: Convert to use jiffies macro
config: arc-randconfig-002-20240823 (https://download.01.org/0day-ci/archive/20240823/202408231223.UP4lmulM-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231223.UP4lmulM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231223.UP4lmulM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ceph/caps.c:20:1: error: expected identifier or '(' before '+' token
      20 | +#include <linux/jiffies.h
         | ^
>> fs/ceph/caps.c:20:2: error: stray '#' in program
      20 | +#include <linux/jiffies.h
         |  ^
   fs/ceph/caps.c: In function '__ceph_flush_snaps':
>> fs/ceph/caps.c:1667:44: error: implicit declaration of function '__get_oldest_flush_tid' [-Werror=implicit-function-declaration]
    1667 |                         oldest_flush_tid = __get_oldest_flush_tid(mdsc);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/caps.c: At top level:
>> fs/ceph/caps.c:1878:12: error: conflicting types for '__get_oldest_flush_tid'; have 'u64(struct ceph_mds_client *)' {aka 'long long unsigned int(struct ceph_mds_client *)'}
    1878 | static u64 __get_oldest_flush_tid(struct ceph_mds_client *mdsc)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/caps.c:1667:44: note: previous implicit declaration of '__get_oldest_flush_tid' with type 'int()'
    1667 |                         oldest_flush_tid = __get_oldest_flush_tid(mdsc);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +20 fs/ceph/caps.c

    13	
    14	#include "super.h"
    15	#include "mds_client.h"
    16	#include "cache.h"
    17	#include "crypto.h"
    18	#include <linux/ceph/decode.h>
    19	#include <linux/ceph/messenger.h>
  > 20	+#include <linux/jiffies.h
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
