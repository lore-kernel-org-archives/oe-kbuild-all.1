Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6539B1369
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 06:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693721928; x=1725257928;
  h=date:from:to:cc:subject:message-id;
  bh=8U37OB69keMc+UNcFu2iOWKF2lrz7rp2EJA+r3UFktU=;
  b=Ohf05hmzHxRLai4qw11JpwvomP5n7x/RSsltsDFWTiph8JFlpzeU1Bqc
   sy8jKa8qTQDPt07wWSgxOAY9j+DbNI1KF/x+/uOv7pKv/8dsHzfI+BZdh
   TmA8w2BKUxp0Jg6zJ1qH8f8hDiyYE9XpjyThVtDLP9YowDCOuYc5NCwAA
   Mmb7x7yAeGZqxu3b6U2BJfHB7vhLEeUJKwye5EQ0QORAWwLMBeALYMFov
   b4/irIz7LEfScKhNi1vXtS0YfsREKrpQumVi62Mh5IEtHRryw4MGJU6h3
   acNVnrM+ja4yBojiqirvoCVuO1lN4rObrwu+huAprStqkL1LRtybtcA1C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="355925753"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="355925753"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 23:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="690238318"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="690238318"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Sep 2023 23:18:45 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcgRX-0002xH-1L;
	Sun, 03 Sep 2023 06:18:43 +0000
Date: Sun, 03 Sep 2023 14:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Zhang <zhangpeng.00@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+106 bytes kernel size regression] [i386-tinyconfig]
 [23e9dde0b2] maple_tree: optimize mas_wr_append(), also improve duplicating
 VMAs
Message-ID: <20230903061829.mT5Eg%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +106 bytes kernel size regression due to commit:

commit: 23e9dde0b246d47e4a1942ea50bf7fef63e2d41a (maple_tree: optimize mas_wr_append(), also improve duplicating VMAs)
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


Details as below (size data is obtained by `nm --size-sort vmlinux`):

c38d9ff2: maple_tree: add test for expanding range in RCU mode
23e9dde0: maple_tree: optimize mas_wr_append(), also improve duplicating VMAs

+--------------------+----------+----------+-------+
|       symbol       | c38d9ff2 | 23e9dde0 | delta |
+--------------------+----------+----------+-------+
| nm.t.mas_wr_append | 0        | 289      | 289   |
| bzImage            | 515888   | 516080   | 192   |
| nm.t.mas_wr_modify | 503      | 320      | -183  |
+--------------------+----------+----------+-------+



Thanks

