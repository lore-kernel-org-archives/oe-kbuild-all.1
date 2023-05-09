Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39952137A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 04:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683604914; x=1715140914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uELiJQiQpG6JjFPvIWbDiclDc4cgM4APgw80t2Rvo3w=;
  b=DJs9EkiDxbgn6FHALdjFj4POuFXfEsqzwebr9fbcQa4PKq108AA0rcbt
   qRp/yEOqLfszHZs8aW6wvCXHqY+2zUY3atN3Yj0QQMeK2T+sJIzg0uNAo
   Z18c1US7jNChK2vasW8SjubUpFGXulfDmNtPh+Cscgnh3FIe1ksLjrLjk
   86RFEGzAe2A79HeIxKoeo6FLX6o2NDoq+0kzt0iHr+k+JRK0zsKO1WXUH
   E7VI91fV68SHlWjc6Y0KEDwDkWYvz+M/vbpB3frlhTAEtP6z9ED42WOEl
   VnKBevWXj991wgH4fADjE1r8m6Qh1oh3XB89SNm0gCHVC94cjoXx4glB7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="339030879"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="339030879"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 21:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="842953248"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="842953248"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 May 2023 21:01:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwEXv-0001f4-2d;
	Tue, 09 May 2023 04:01:51 +0000
Date: Tue, 9 May 2023 12:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: liuwf <liuwf@mailbox.org>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: library: btree_blue - a simple btree with rapid linear traversal
Message-ID: <202305091154.Pq60ESIw-lkp@intel.com>
References: <37586fd4e76b597aea4dad3f06bb7eb648425fa0.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37586fd4e76b597aea4dad3f06bb7eb648425fa0.camel@mailbox.org>

Hi liuwf,

kernel test robot noticed the following build errors:

[auto build test ERROR on fbe1871b562af6e9cffcf622247e821d1dd16c64]

url:    https://github.com/intel-lab-lkp/linux/commits/liuwf/library-btree_blue-a-simple-btree-with-rapid-linear-traversal/20230509-095127
base:   fbe1871b562af6e9cffcf622247e821d1dd16c64
patch link:    https://lore.kernel.org/r/37586fd4e76b597aea4dad3f06bb7eb648425fa0.camel%40mailbox.org
patch subject: library: btree_blue - a simple btree with rapid linear traversal
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230509/202305091154.Pq60ESIw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/fba954cf20fd4764f0e6090d1164251873b7569c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review liuwf/library-btree_blue-a-simple-btree-with-rapid-linear-traversal/20230509-095127
        git checkout fba954cf20fd4764f0e6090d1164251873b7569c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091154.Pq60ESIw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "btree_init" [lib/btree_blue_test.ko] undefined!
>> ERROR: modpost: "btree_geo64" [lib/btree_blue_test.ko] undefined!
>> ERROR: modpost: "btree_insert" [lib/btree_blue_test.ko] undefined!
>> ERROR: modpost: "btree_lookup" [lib/btree_blue_test.ko] undefined!
>> ERROR: modpost: "btree_remove" [lib/btree_blue_test.ko] undefined!
>> ERROR: modpost: "btree_last" [lib/btree_blue_test.ko] undefined!
>> ERROR: modpost: "btree_get_prev" [lib/btree_blue_test.ko] undefined!
>> ERROR: modpost: "btree_destroy" [lib/btree_blue_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
