Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384F91944E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 19:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbAgcPLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702148890; x=1733684890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1kQg7J9907SlOlnirWbA1kwjXEhu8Z2YMCu2e9KBJo=;
  b=kbAgcPLEJyBHIIfxxc0QWF9W3pabD1LVTOwJTSbXpqCa3yMvi1J48YU6
   09zv2PTkVtB1KmwEB+P3OG2O/UWX86XSntCGCx7SDWc1bX+gcrOJDXrZT
   AZ3IqeNc2TB4NK6Ze1Ga/+8e0smzoaQmvUUdyeUE6MhzhXwlUNSIXD6E0
   Tm10ldMpuRfgSFgHKlhcsBsH6B4n5lXrar0LYPBZ8h3ljhSwJG6MbTH7K
   g+9LHuKz9U5CSnQzm6RAafrsLoRiJ84TicJjocoWj7mXWkRbJ91v5oskx
   1empfeWHifLg3/91dKLgthR2Qrmr0271pz67nYr31xKQ2bj3GgnqAkbkJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="16074330"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="16074330"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 11:08:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="776152961"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="776152961"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 09 Dec 2023 11:08:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC2gG-000FoD-2h;
	Sat, 09 Dec 2023 19:08:04 +0000
Date: Sun, 10 Dec 2023 03:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Axtens <dja@axtens.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Francis Laniel <laniel_francis@privacyrequired.com>,
	Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/block/rnbd/rnbd-srv.c:616:51: warning: '%s' directive output
 may be truncated writing up to 254 bytes into a region of size between 0 and
 4095
Message-ID: <202312100355.lHoJPgKy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 6a39e62abbafd1d58d1722f40c7d26ef379c6a2f lib: string.h: detect intra-object overflow in fortified string functions
date:   3 years ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231210/202312100355.lHoJPgKy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312100355.lHoJPgKy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100355.lHoJPgKy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/rnbd/rnbd-srv.c: In function 'process_msg_open.isra':
>> drivers/block/rnbd/rnbd-srv.c:616:51: warning: '%s' directive output may be truncated writing up to 254 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
     616 |                 snprintf(full_path, PATH_MAX, "%s/%s",
         |                                                   ^~
   In function 'rnbd_srv_get_full_path',
       inlined from 'process_msg_open.isra' at drivers/block/rnbd/rnbd-srv.c:721:14:
   drivers/block/rnbd/rnbd-srv.c:616:17: note: 'snprintf' output between 2 and 4351 bytes into a destination of size 4096
     616 |                 snprintf(full_path, PATH_MAX, "%s/%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     617 |                          dev_search_path, dev_name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +616 drivers/block/rnbd/rnbd-srv.c

2de6c8de192b934 Jack Wang 2020-05-11  588  
2de6c8de192b934 Jack Wang 2020-05-11  589  static char *rnbd_srv_get_full_path(struct rnbd_srv_session *srv_sess,
2de6c8de192b934 Jack Wang 2020-05-11  590  				     const char *dev_name)
2de6c8de192b934 Jack Wang 2020-05-11  591  {
2de6c8de192b934 Jack Wang 2020-05-11  592  	char *full_path;
2de6c8de192b934 Jack Wang 2020-05-11  593  	char *a, *b;
2de6c8de192b934 Jack Wang 2020-05-11  594  
2de6c8de192b934 Jack Wang 2020-05-11  595  	full_path = kmalloc(PATH_MAX, GFP_KERNEL);
2de6c8de192b934 Jack Wang 2020-05-11  596  	if (!full_path)
2de6c8de192b934 Jack Wang 2020-05-11  597  		return ERR_PTR(-ENOMEM);
2de6c8de192b934 Jack Wang 2020-05-11  598  
2de6c8de192b934 Jack Wang 2020-05-11  599  	/*
2de6c8de192b934 Jack Wang 2020-05-11  600  	 * Replace %SESSNAME% with a real session name in order to
2de6c8de192b934 Jack Wang 2020-05-11  601  	 * create device namespace.
2de6c8de192b934 Jack Wang 2020-05-11  602  	 */
2de6c8de192b934 Jack Wang 2020-05-11  603  	a = strnstr(dev_search_path, "%SESSNAME%", sizeof(dev_search_path));
2de6c8de192b934 Jack Wang 2020-05-11  604  	if (a) {
2de6c8de192b934 Jack Wang 2020-05-11  605  		int len = a - dev_search_path;
2de6c8de192b934 Jack Wang 2020-05-11  606  
2de6c8de192b934 Jack Wang 2020-05-11  607  		len = snprintf(full_path, PATH_MAX, "%.*s/%s/%s", len,
2de6c8de192b934 Jack Wang 2020-05-11  608  			       dev_search_path, srv_sess->sessname, dev_name);
2de6c8de192b934 Jack Wang 2020-05-11  609  		if (len >= PATH_MAX) {
2de6c8de192b934 Jack Wang 2020-05-11  610  			pr_err("Too long path: %s, %s, %s\n",
2de6c8de192b934 Jack Wang 2020-05-11  611  			       dev_search_path, srv_sess->sessname, dev_name);
2de6c8de192b934 Jack Wang 2020-05-11  612  			kfree(full_path);
2de6c8de192b934 Jack Wang 2020-05-11  613  			return ERR_PTR(-EINVAL);
2de6c8de192b934 Jack Wang 2020-05-11  614  		}
2de6c8de192b934 Jack Wang 2020-05-11  615  	} else {
2de6c8de192b934 Jack Wang 2020-05-11 @616  		snprintf(full_path, PATH_MAX, "%s/%s",
2de6c8de192b934 Jack Wang 2020-05-11  617  			 dev_search_path, dev_name);
2de6c8de192b934 Jack Wang 2020-05-11  618  	}
2de6c8de192b934 Jack Wang 2020-05-11  619  
2de6c8de192b934 Jack Wang 2020-05-11  620  	/* eliminitate duplicated slashes */
2de6c8de192b934 Jack Wang 2020-05-11  621  	a = strchr(full_path, '/');
2de6c8de192b934 Jack Wang 2020-05-11  622  	b = a;
2de6c8de192b934 Jack Wang 2020-05-11  623  	while (*b != '\0') {
2de6c8de192b934 Jack Wang 2020-05-11  624  		if (*b == '/' && *a == '/') {
2de6c8de192b934 Jack Wang 2020-05-11  625  			b++;
2de6c8de192b934 Jack Wang 2020-05-11  626  		} else {
2de6c8de192b934 Jack Wang 2020-05-11  627  			a++;
2de6c8de192b934 Jack Wang 2020-05-11  628  			*a = *b;
2de6c8de192b934 Jack Wang 2020-05-11  629  			b++;
2de6c8de192b934 Jack Wang 2020-05-11  630  		}
2de6c8de192b934 Jack Wang 2020-05-11  631  	}
2de6c8de192b934 Jack Wang 2020-05-11  632  	a++;
2de6c8de192b934 Jack Wang 2020-05-11  633  	*a = '\0';
2de6c8de192b934 Jack Wang 2020-05-11  634  
2de6c8de192b934 Jack Wang 2020-05-11  635  	return full_path;
2de6c8de192b934 Jack Wang 2020-05-11  636  }
2de6c8de192b934 Jack Wang 2020-05-11  637  

:::::: The code at line 616 was first introduced by commit
:::::: 2de6c8de192b9341ffa5e84afe1ce6196d4eef41 block/rnbd: server: main functionality

:::::: TO: Jack Wang <jinpu.wang@cloud.ionos.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
