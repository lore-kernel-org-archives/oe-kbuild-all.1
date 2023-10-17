Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995183E467
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 12:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzNw5pGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697546535; x=1729082535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nYhSo80cegs/bYEniEes8oMMJyChScjFyMuaf05FV3g=;
  b=PzNw5pGVZkwTrQnqTEOvyuwpdBrHkEkfIginpZwtgYJlRM++Ewk3H3av
   XTSyRdNIQSPP+IbF9BcMNQUbl5HPh3QBU69IEbYpHHhmNzpc0eEKsYQsi
   46WDvJ7s8/qBn0o2h1kz6IZvv7xcFiRLQDFruhPljY6Z2Y9G9kT98txs6
   j7mrqHa8sSBbj3EpNUGsxubIzIaLHVFGLZUc2MSWOFNPL5yVbk0iGZM+P
   09jM3GFWCDyhTUvTmtWMevDR/v1LnccIMdIu46pvPQEGnApgqfDV0HcXi
   guTnt4yNuxW4WrZsd37OadQs9tFtN+HHOAgrj/xtO1KrduoohT6U+hTsj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="4371705"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="4371705"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 05:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="785475596"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="785475596"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Oct 2023 05:42:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsjOg-0009av-3A;
	Tue, 17 Oct 2023 12:42:06 +0000
Date: Tue, 17 Oct 2023 20:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Subject: [linux-next:master 12600/13086] security/landlock/net.h:28:1: error:
 expected identifier or '(' before '{' token
Message-ID: <202310172007.cCfBVBuG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d5ab2376ec576af173e5eac3887ed0b51bd8566
commit: 614d46b333ab905ca99acf076e4abdc84afd3da7 [12600/13086] landlock: Add network rules and TCP hooks support
config: microblaze-randconfig-r004-20230514 (https://download.01.org/0day-ci/archive/20231017/202310172007.cCfBVBuG-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310172007.cCfBVBuG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172007.cCfBVBuG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/landlock/setup.c:17:
>> security/landlock/net.h:28:1: error: expected identifier or '(' before '{' token
      28 | {
         | ^
   security/landlock/net.h:26:1: warning: 'landlock_append_net_rule' declared 'static' but never defined [-Wunused-function]
      26 | landlock_append_net_rule(struct landlock_ruleset *const ruleset, const u16 port,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from security/landlock/syscalls.c:32:
>> security/landlock/net.h:28:1: error: expected identifier or '(' before '{' token
      28 | {
         | ^
   security/landlock/net.h:26:1: warning: 'landlock_append_net_rule' used but never defined
      26 | landlock_append_net_rule(struct landlock_ruleset *const ruleset, const u16 port,
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +28 security/landlock/net.h

    24	
    25	static inline int
    26	landlock_append_net_rule(struct landlock_ruleset *const ruleset, const u16 port,
    27				 access_mask_t access_rights);
  > 28	{
    29		return -EAFNOSUPPORT;
    30	}
    31	#endif /* IS_ENABLED(CONFIG_INET) */
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
