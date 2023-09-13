Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5701AEB8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 03:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694577184; x=1726113184;
  h=date:from:to:cc:subject:message-id;
  bh=bvyyL4GZxUbMjaUK5A7irjcuZKd+HmnpMmhCA6ZR3tk=;
  b=HG5/pLzj5TD+Dy1N4AxL6C3bd0Nu3qeA9L5TI64eafegbMzaDTkaS4ms
   eN3O3NQq0JPH0COa0VqP7OlX7k3srumuEkFIHRiE2WN9LeQTD1lVdvVdG
   /TrDJNZDL9GudVSgxDQE3Y6r32puRWnbHkNGARzVCdCelJlUJcwodawSw
   yIQAy0cTIrPZj37IX/mJ86RD1AgZk5VfQBqdpzfOLrCvKUv4vDzHGNleu
   C/zUJg3E1ZAvzdiDw7Dnn4ShZwbqE+mnxvyR4TA4Tr7CZOdGAx3MggNh8
   k9K/8/q14l2oTsuLpv8Z/GWLY3eVe1sJAAege/KgqXgdlORBQX181mG64
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444995774"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="444995774"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 20:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="1074798156"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="1074798156"
Received: from lkp-server02.sh.intel.com (HELO e6439d5ea182) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Sep 2023 20:53:02 -0700
Received: from kbuild by e6439d5ea182 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgGvz-00003F-36;
	Wed, 13 Sep 2023 03:52:59 +0000
Date: Wed, 13 Sep 2023 11:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+79 bytes kernel size regression] [i386-tinyconfig]
 [a6b3d549eb] mm: shrinker: make global slab shrink lockless
Message-ID: <20230913035240.XBaAu%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +79 bytes kernel size regression due to commit:

commit: a6b3d549eb7c1514c39a7dbbb2bcae9ab5439b67 (mm: shrinker: make global slab shrink lockless)
https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-unstable


Details as below (size data is obtained by `nm --size-sort vmlinux`):

1efd1e58: mm: shrinker: rename {prealloc|unregister}_memcg_shrinker() to shrinker_memcg_{alloc|remove}()
a6b3d549: mm: shrinker: make global slab shrink lockless

+---------------------------+----------+----------+-------+
|          symbol           | 1efd1e58 | a6b3d549 | delta |
+---------------------------+----------+----------+-------+
| bzImage                   | 522336   | 522432   | 96    |
| nm.t.shrinker_put         | 0        | 40       | 40    |
| nm.T.shrinker_register    | 61       | 92       | 31    |
| nm.t.shrinker_free_rcu_cb | 0        | 20       | 20    |
| nm.T.shrinker_free        | 84       | 89       | 5     |
| nm.T.shrink_slab          | 518      | 501      | -17   |
+---------------------------+----------+----------+-------+



Thanks

