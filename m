Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA80417CF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 06:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irBiOg5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702190196; x=1733726196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wtaW89UM9RckN1fUT98Fx+IUAET44dhNHfswr76Kb8s=;
  b=irBiOg5JRicEnk9SH1OC3bGMBSf8yJYvUVximxEE3OYl+s+bv4Ep2hlj
   kvs8nqUiZ0Z2lYr5TyBH6Uf42PChnRXvINbYbod0AQ/49+lexRaRjl5uh
   JQBVizHmNli189+4+h/arGZbDuGXFs8Wz7Q53+RL4WPRhU3YwPX/B7UnR
   yztCLMY1Op8dO1Uybrlk3i9md4ez4o/jtw2IsxhJBQD2ktdYSOtk3atEL
   uofHKd9LfVkcEeSBRKussKXn8ZK0a7XnVPiB0NlkcgXp89HXQuSb6LRjF
   FNjV8FyEVfujsnG/c6P2SMNeCXj6gBdux9F5vTItXKWCCRty8Q3AyBA4e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1412873"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="1412873"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 22:36:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="748818161"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="748818161"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Dec 2023 22:36:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCDQS-000GTv-3D;
	Sun, 10 Dec 2023 06:36:28 +0000
Date: Sun, 10 Dec 2023 14:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jkosina@suse.cz>
Subject: powerpc-linux-ld: warning: orphan section `.init.plt' from
 `drivers/hid/hid-uclogic-rdesc.o' being placed in section `.init.plt'
Message-ID: <202312101402.A4EgFTn7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 08809e482a1c44d95d1322b9fbc94c8e58ae9015 HID: uclogic: KUnit best practices and naming conventions
date:   1 year, 4 months ago
config: powerpc-randconfig-r052-20231210 (https://download.01.org/0day-ci/archive/20231210/202312101402.A4EgFTn7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312101402.A4EgFTn7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312101402.A4EgFTn7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/hid/hid-uclogic-rdesc.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: drivers/of/unittest-data/overlay_gpio_04b.dtb.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: block/blk-iocost.o: in function `ioc_refresh_params.isra.0':
   blk-iocost.c:(.text+0x1b5c): undefined reference to `__udivdi3'
   powerpc-linux-ld: block/blk-iocost.o: in function `transfer_surpluses':
   blk-iocost.c:(.text+0x3cd4): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
