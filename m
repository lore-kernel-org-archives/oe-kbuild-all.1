Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA61352013
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 02:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790389438; cv=none; b=kRgO0+N5sQXY0IwS2PQOKZ4YlJJx507a1NSQDYvaRk9vCZhgTRf/elfvCtm646ag5xXpiE4dIJMT27R2mrxcxmtCScw1yWiuOlFT7/xmT1ZmZ0IoW2AEUnk48hxxp1kuoh0h75k1gnTY05b8kB8xjov+urJZA1dXMM3ZBPY3iYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790389438; c=relaxed/simple;
	bh=gZOvFpvEnU9Rc8zhS9iwpU0F0VrWlXlo2BgFdPpKGcc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qOePTxZ0Q4ic2lk5tsm8KQ/cCx4B8axZH5DBXeul8Kb0lNMj7Joc2LSXwuHc01JQgTRFlne5uU3+GLy/jfit5e9Vei1aGg70Ctbz8HcwPze2cMR3FKY7cj0qi1c768ZbxvWfaNndBomvQrPCiOpGxk6i1mOktLZhXr/CwfTpVMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8mTqixR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8mTqixR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790389437; x=1821925437;
  h=date:from:to:cc:subject:message-id;
  bh=gZOvFpvEnU9Rc8zhS9iwpU0F0VrWlXlo2BgFdPpKGcc=;
  b=D8mTqixRbrgxAZS3pyKnMyWnf9CrEwopT+B4rjYZEQcxS4L32xVs7gye
   JYQbjEmykQuxqz1hQ7krw5dhJA/Z96ziHB82uzbcpIqSEFA7dMdZnr18U
   97lyE4pYSOFl8NgDz4uamOPbvp8MpNfAvNhYWMrxyJwq9uyz8nbXKeqjT
   K5iahDE+onpKawVLQNvPRm92cRFheTaYRNpmSl3yCnV02ld1Fv4t+kgCu
   LJ9rk0ezo2oUdbFcbb6uEw9m6lI0ZlFPlY53/eDk93frfQ2VjjYpTpQ0A
   LEgpt/ms/SpbIcbgsVp0NqPsS5fvZTOEpGoypQr4nZCefF+tzgOTOsmw1
   w==;
X-CSE-ConnectionGUID: MXRphpmgQ7+zPzW0tRMr1A==
X-CSE-MsgGUID: G208X3LFQSW1Yzyz84Z+lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="91039570"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="91039570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 19:23:54 -0700
X-CSE-ConnectionGUID: mC84zS0OTySl5AoKnY2wtg==
X-CSE-MsgGUID: N8iycWWTQcmrtI7u4eKvBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274626282"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2026 19:23:53 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAI4s-000000000At-20g6;
	Sat, 26 Sep 2026 02:23:50 +0000
Date: Sat, 26 Sep 2026 04:22:50 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 568/673]
 include/uapi/linux/if_pppox.h:72:9: warning: alignment 1 of 'union
 <anonymous>' is less than 2
Message-ID: <202609260403.Z3C0Z05d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: de6e2753a4e2e61ad06abc40a35348ace8e0ad55 [568/673] m68k: fix up headers for -malign-int
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260926/202609260403.Z3C0Z05d-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260403.Z3C0Z05d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260403.Z3C0Z05d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/if_pppox.h:17,
                    from net/core/flow_dissector.c:21:
>> include/uapi/linux/if_pppox.h:72:9: warning: alignment 1 of 'union <anonymous>' is less than 2 [-Wpacked-not-aligned]
      72 |         } sa_addr;
         |         ^


vim +72 include/uapi/linux/if_pppox.h

607ca46e97a1b6 David Howells 2012-10-13  65  
607ca46e97a1b6 David Howells 2012-10-13  66  struct sockaddr_pppox {
607ca46e97a1b6 David Howells 2012-10-13  67  	__kernel_sa_family_t sa_family;       /* address family, AF_PPPOX */
607ca46e97a1b6 David Howells 2012-10-13  68  	unsigned int    sa_protocol;          /* protocol identifier */
607ca46e97a1b6 David Howells 2012-10-13  69  	union {
f6d72a8b724c6e Arnd Bergmann 2023-06-19  70  		struct pppoe_addr  pppoe __packed;
f6d72a8b724c6e Arnd Bergmann 2023-06-19  71  		struct pptp_addr   pptp __packed;
607ca46e97a1b6 David Howells 2012-10-13 @72  	} sa_addr;
607ca46e97a1b6 David Howells 2012-10-13  73  } __packed;
607ca46e97a1b6 David Howells 2012-10-13  74  

:::::: The code at line 72 was first introduced by commit
:::::: 607ca46e97a1b6594b29647d98a32d545c24bdff UAPI: (Scripted) Disintegrate include/linux

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
