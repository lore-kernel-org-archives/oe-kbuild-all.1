Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD43D989
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkK1f0sY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697533551; x=1729069551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2MZXRCdhRVoavc+n+KT5FJdlHj8N5dtGPD48iJm+HrQ=;
  b=XkK1f0sYWkxNJ/kVw/cjXqVftsP57Bb3ub76QlZvlTLZvUap7x04Surj
   S0+okmNz/3Lhfx4QtAHsjohsSI6E/cYcIAfCOnztjvrpJFaeCEHn0wz0s
   GYqI06rtYAaeZa/307EouButkYHZ30N7flEWB1eb3k6WXH1aUIDLJ/Mro
   y5OC5A808gRnJK1uLas13j3n1ZuP55uBqsNJqL/wvLs8kbTwhMT2cMnsF
   IMB3780Noioqf8EY9rPjQyT2Z8epi1BepaDgJ/jI5juhRUY60SfPqRFgm
   USnu0tgpUhd3TV2DEdX3pExllgueM3BlI0vq4IFSRx4lpF6pqET2hCaP3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="370806834"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="370806834"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 02:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821898277"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="821898277"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Oct 2023 02:05:47 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsg1I-0009Np-1J;
	Tue, 17 Oct 2023 09:05:44 +0000
Date: Tue, 17 Oct 2023 17:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Subject: [linux-next:master 12600/13086] security/landlock/net.h:26:1:
 warning: 'landlock_append_net_rule' declared 'static' but never defined
Message-ID: <202310171657.KGpaQG47-lkp@intel.com>
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
config: microblaze-randconfig-r004-20230514 (https://download.01.org/0day-ci/archive/20231017/202310171657.KGpaQG47-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171657.KGpaQG47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171657.KGpaQG47-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/landlock/setup.c:17:
   security/landlock/net.h:28:1: error: expected identifier or '(' before '{' token
      28 | {
         | ^
>> security/landlock/net.h:26:1: warning: 'landlock_append_net_rule' declared 'static' but never defined [-Wunused-function]
      26 | landlock_append_net_rule(struct landlock_ruleset *const ruleset, const u16 port,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from security/landlock/syscalls.c:32:
   security/landlock/net.h:28:1: error: expected identifier or '(' before '{' token
      28 | {
         | ^
>> security/landlock/net.h:26:1: warning: 'landlock_append_net_rule' used but never defined
      26 | landlock_append_net_rule(struct landlock_ruleset *const ruleset, const u16 port,
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +26 security/landlock/net.h

    24	
    25	static inline int
  > 26	landlock_append_net_rule(struct landlock_ruleset *const ruleset, const u16 port,
    27				 access_mask_t access_rights);
  > 28	{
    29		return -EAFNOSUPPORT;
    30	}
    31	#endif /* IS_ENABLED(CONFIG_INET) */
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
