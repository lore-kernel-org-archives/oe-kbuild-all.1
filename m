Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C1220F12
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 03:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692762101; x=1724298101;
  h=date:from:to:cc:subject:message-id;
  bh=5ItVpTJ/08Y2RVhO476jTzsmx9wp52uRlwRpOf5A+0Y=;
  b=NJOax8aJqZjql3mx4Pzr8McePA5b//TSs4kHzFNO1eJjbtE/Qm/VdSbZ
   gHi7x7rOhtph6E+fJzqP2iyiAaqiuabe/XF+Ie4ZD4vDURfy4Xw61ySYk
   G1isZxLq6tvgPKCGCwLqLdbfQ7FiBftYt1u2anUNiI5lLypYueqH4Dfrc
   0KmNGp7/XM4yCbFGQCkCyTFqIypnB8KfdYiLSMm7O/Ndf8OwJq2q9xtMk
   wE6nMUbvscqeNxFbbWsIs3K50KoIvNzbIOx0pOiz9RdenvYXAbJ4lLrAu
   qGghI9wdR0E+8G48xMOQB6HQbN+P2Y8yiDYEj9+aHZoHccMyks19T6QE9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="437986921"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="437986921"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 20:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="806514420"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="806514420"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 20:41:38 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYejC-0000oW-0W;
	Wed, 23 Aug 2023 03:40:48 +0000
Date: Wed, 23 Aug 2023 11:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+84 bytes kernel size regression] [i386-tinyconfig]
 [ba6eabcee7] mm/readahead.c: adjust readahead window to account for min order
Message-ID: <20230823034017.sjxpF%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +84 bytes kernel size regression due to commit:

commit: ba6eabcee75883b616aec61ff872a57bd661ffad (mm/readahead.c: adjust readahead window to account for min order)
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230822-minorder


Details as below (size data is obtained by `nm --size-sort vmlinux`):

79cea1f5: mm/readahead.c: use min order folio multiplier on force_page_cache_ra()
ba6eabce: mm/readahead.c: adjust readahead window to account for min order

+-------------------------+----------+----------+-------+
|         symbol          | 79cea1f5 | ba6eabce | delta |
+-------------------------+----------+----------+-------+
| bzImage                 | 522336   | 522496   | 160   |
| nm.T.file_ra_state_init | 32       | 73       | 41    |
| nm.t.get_next_ra_size   | 31       | 54       | 23    |
| nm.t.ondemand_readahead | 557      | 577      | 20    |
+-------------------------+----------+----------+-------+



Thanks

