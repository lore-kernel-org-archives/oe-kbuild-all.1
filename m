Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2126714C59C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731455615; cv=none; b=TXrPKjf9p1SpeARd8+34UogTYHGLW5imkMNueW6NkLQTewLac5yAIjufailugFLgQFrUzm4hTajJXyO1P2yCBivB4qJud1fUlNIyfiJnLuzwkAik2X53uFV4ZcxkaH8FxuCayOiM7HJPJGhXr328Iqj2YHWXsgB5MrSkH9msEtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731455615; c=relaxed/simple;
	bh=oSUbfgtuRkTHVM3fQX6f9C0gIWBXwuzRLUO8xzXYseI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HWTlKX5hQyMk4HS/J3WZnN6xSNiDK6k7jU4MR9BxWqsmJzAsrxCo4JSgk7p1CPwCu6wNEgB2Z37Kf2xwTdZURT4SQktn/9jS8OtA8EkOeEaOq59zvKYpD5GT+Qr6ijsOLzCntVOJu7981rYLbOIDwBm6Deu+lloibVxkQ2zrTQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fgersf3v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fgersf3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731455614; x=1762991614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oSUbfgtuRkTHVM3fQX6f9C0gIWBXwuzRLUO8xzXYseI=;
  b=Fgersf3v7/edd8KuQBTsn0GiV8oTKIR1AfnlEjUnyYoWXwdsFY5JVEoT
   bCZSJpnLZOUARiTWaaDMJ208mpyczCCkJYwdw86SiI5zI84vcUBVLgyV+
   D+62RD+yDUYkdJrOxUAWeQcRn8L2m69IvYSEcVNTs92z1suoMMrFvIjAO
   qR0ZXjDk530cDhgzX/95DmK3Fb8XZUWImdXgY4ADRQ6KwwAelce5PbQ+6
   YfD1G5LymF0MNIZ7Er9GjhG/iWM/slnboJoRJE3ygT0OCTqGlg4ZAR9SY
   XbNyuRyUpvQQfZ5fLhKFBPoRIzLJlMhL0/bF2cggpDH58xjlx/LDRSCz1
   w==;
X-CSE-ConnectionGUID: Gtzpx5peQMWUVC9FwFBjqA==
X-CSE-MsgGUID: bkCJd5XFR+m17vHY4ZdT3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41884257"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41884257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 15:53:33 -0800
X-CSE-ConnectionGUID: w/CJc9+hTq+VtbZJWfBUUA==
X-CSE-MsgGUID: BbAsW6HqQVicp+zBpiNvlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="87591340"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Nov 2024 15:53:32 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB0hN-0001qX-0E;
	Tue, 12 Nov 2024 23:53:29 +0000
Date: Wed, 13 Nov 2024 07:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2417/2417]
 drivers/ub/urma/ubcore/ubcore_ctp.c:114:42: warning: the comparison will
 always evaluate as 'false' for the address of 'head' will never be NULL
Message-ID: <202411130755.ZXqCXQU2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WenChen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   400fd9ccb52e01bf78acae2bbc1710923a15f033
commit: 6d14be01fcb032c478cd4669b32526fda0393195 [2417/2417] urma: upload kernel patch for 20240318_happy_birthday
config: x86_64-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241113/202411130755.ZXqCXQU2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130755.ZXqCXQU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130755.ZXqCXQU2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_ctp.c: In function 'ubcore_find_remove_ctp':
>> drivers/ub/urma/ubcore/ubcore_ctp.c:114:42: warning: the comparison will always evaluate as 'false' for the address of 'head' will never be NULL [-Waddress]
     114 |         if (&dev->ht[UBCORE_HT_CTP].head == NULL) {
         |                                          ^~
   In file included from drivers/ub/urma/ubcore/ubcore_hash_table.h:24,
                    from drivers/ub/urma/ubcore/ubcore_ctp.c:23:
   include/urma/ubcore_types.h:162:28: note: 'head' declared here
     162 |         struct hlist_head *head;
         |                            ^~~~
--
   drivers/ub/urma/ubcore/ubcore_tpg.c: In function 'ubcore_find_remove_tpg':
>> drivers/ub/urma/ubcore/ubcore_tpg.c:113:42: warning: the comparison will always evaluate as 'false' for the address of 'head' will never be NULL [-Waddress]
     113 |         if (&dev->ht[UBCORE_HT_TPG].head == NULL) {
         |                                          ^~
   In file included from drivers/ub/urma/ubcore/ubcore_hash_table.h:24,
                    from drivers/ub/urma/ubcore/ubcore_tpg.c:23:
   include/urma/ubcore_types.h:162:28: note: 'head' declared here
     162 |         struct hlist_head *head;
         |                            ^~~~
   drivers/ub/urma/ubcore/ubcore_tpg.c: In function 'ubcore_find_remove_tp_node':
   drivers/ub/urma/ubcore/ubcore_tpg.c:149:44: warning: the comparison will always evaluate as 'false' for the address of 'head' will never be NULL [-Waddress]
     149 |         if (&dev->ht[UBCORE_HT_UB_TP].head == NULL) {
         |                                            ^~
   include/urma/ubcore_types.h:162:28: note: 'head' declared here
     162 |         struct hlist_head *head;
         |                            ^~~~
--
   drivers/ub/urma/ubcore/ubcore_utp.c: In function 'ubcore_find_remove_utp':
>> drivers/ub/urma/ubcore/ubcore_utp.c:139:42: warning: the comparison will always evaluate as 'false' for the address of 'head' will never be NULL [-Waddress]
     139 |         if (&dev->ht[UBCORE_HT_UTP].head == NULL) {
         |                                          ^~
   In file included from drivers/ub/urma/ubcore/ubcore_hash_table.h:24,
                    from drivers/ub/urma/ubcore/ubcore_utp.c:23:
   include/urma/ubcore_types.h:162:28: note: 'head' declared here
     162 |         struct hlist_head *head;
         |                            ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +114 drivers/ub/urma/ubcore/ubcore_ctp.c

   108	
   109	struct ubcore_ctp *ubcore_find_remove_ctp(struct ubcore_device *dev, uint32_t idx)
   110	{
   111		struct ubcore_ctp *ctp;
   112	
   113		spin_lock(&dev->ht[UBCORE_HT_CTP].lock);
 > 114		if (&dev->ht[UBCORE_HT_CTP].head == NULL) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
