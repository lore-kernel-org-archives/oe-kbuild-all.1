Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DEC1079A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Nov 2022 20:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668025583; x=1699561583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7onSAwDMCrSvia91f/NIwwxVZuySUMguhITwgv0vhw0=;
  b=NakgrbHMg/mfCpdBGm+EXML4Q5hPaoX0OuXM8dWTHQCdM+++gwTZPX1J
   PkPBEszhS9CbX8Lx8DNz3fgzytUd4nFk8B/pgehHl5xKsE8zPbqpJ65Fc
   Xpfakcdj9c0mFLBT9fFY0wBZhqnIG4OPx90FYaugabd+Vq7J829Xd3XAh
   ucSjwdSDgzURs4eLmZXZGHBvlbM1JB4DPfwOTf6oKKYpW8CZ125pE2DOv
   OhFGbcYP8PaWGa96KZQ1B0TLwgNASgCAAX0PZKUrz3ttB5c33zq9Myvk/
   Iy8/i/RQVdAwjE3czqCJ6cCRDVCd/y4wMaPl7oZCG7VBoKEw8am6/u6aE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="291490575"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; 
   d="scan'208";a="291490575"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 12:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="614827701"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; 
   d="scan'208";a="614827701"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Nov 2022 12:25:57 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1osre0-00026y-1r;
	Wed, 09 Nov 2022 20:25:56 +0000
Date: Thu, 10 Nov 2022 04:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/607 3820/18012] spdxcheck:
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: 1:28 Invalid License ID: GPL-
Message-ID: <202211100409.kzhV1rWt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/607
head:   a5424cd6f6c063dc38eadbc0f9f95f594fb2ccbc
commit: 03fb7ec593b9ccd041bfc1456a53a5f0451141bd [3820/18012] MLK-24007: mtd: rawnand: gpmi: fix the random DMA timeout issue
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

spdxcheck warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: 1:28 Invalid License ID: GPL-

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
