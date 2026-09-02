Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37629306764
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 03:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321184; cv=none; b=UdoiwES9vTgAIUJ2MnxmZ0e13RiHtVCnedD55Rl1e9qmZ9t3fonrap+QiTrVfyuAliS8HV58vrggzA/XNAhKXYIKxzPVptc7H23gjE6/Dvo93MFuyfVKTqhO32YOYeKk5J65JGjuvPki41ZTHDkLoXsPBqb9Yn8RBverFfAjRCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321184; c=relaxed/simple;
	bh=cIr7FMiDVtruL2sQJwkBSkXizRJ7OWEA4FK3iqUfmh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BSj00cXUKL1vfMFGrrBBhsQ5iXAitxwOYAt2wj8hGN8kiu/HaCjrgFo7pRNpJAYK8okVfZFJQG2Yn2sKQCC74pxBynLfxjoLC1asjABxygEOC61SiDk4FFx7UznpzYY/xQPrbNXonQhCo/a4I7NwCFfDBRX3Bu1BXlyc/7hTlHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYgGlZ66; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYgGlZ66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788321182; x=1819857182;
  h=date:from:to:cc:subject:message-id;
  bh=cIr7FMiDVtruL2sQJwkBSkXizRJ7OWEA4FK3iqUfmh0=;
  b=PYgGlZ666ZApup6orZuO/YRRQhHgG423YO2RngZoCthqPcC5gCqX6k0y
   PlP84t4+sCwqxgIk8eEI0H/FcieGcvSBFUtZNsv4KMEKzObvFSF3Wggsr
   E0NNlkM2mlfUXv2xeYJMJWTLzdUuQBYEM4tsl8bgeOg3oECpn/c8z6VJd
   1bl6J0t0I+MfVxacY+CQg5O7wHKx6SWSWoIxbLkJeasHolVui0PHcrS+s
   RSQLFSuKxOIB3XyzsxfTytu3v4rL1NvK0pUdMS0jZNnNBJnbq72kJW7aP
   QiGmHuicKbXaTGxVuf2MKrCZcfG7VGLoyI0yKBxkBUsDAjDnFrydUZrp3
   w==;
X-CSE-ConnectionGUID: 7Y3q4mOxSl2cLPrSadwHTA==
X-CSE-MsgGUID: MIcSUNi6ReGgJ9VgmQmDAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88646232"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88646232"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 20:53:02 -0700
X-CSE-ConnectionGUID: 8FNoYtMpRXqZK0/9ML+IZQ==
X-CSE-MsgGUID: e1C6aTVqTFWZe4TzkY2Hnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="273475052"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Sep 2026 20:53:00 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1c1x-000000001rS-2YBu;
	Wed, 02 Sep 2026 03:52:57 +0000
Date: Wed, 02 Sep 2026 11:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: vfs_cache.c:undefined reference to
 `__xchg_called_with_bad_pointer'
Message-ID: <202609021157.8f7Wx34I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89a312991dc6e638a36adc43ccb91dbc25504c04
commit: d12168084c8c1b6d883c8eca5853929ac5136a9e ksmbd: safely drain sessions during logoff
date:   2 days ago
config: sparc-randconfig-r052-20260902 (https://download.01.org/0day-ci/archive/20260902/202609021157.8f7Wx34I-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021157.8f7Wx34I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d12168084c8c ("ksmbd: safely drain sessions during logoff")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609021157.8f7Wx34I-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: fs/smb/server/vfs_cache.o: in function `__close_file_table_ids':
>> vfs_cache.c:(.text+0x175c): undefined reference to `__xchg_called_with_bad_pointer'
>> sparc-linux-ld: vfs_cache.c:(.text+0x17e0): undefined reference to `__xchg_called_with_bad_pointer'
   sparc-linux-ld: fs/smb/server/vfs_cache.o: in function `ksmbd_close_disconnected_durable_delete_on_close':
   vfs_cache.c:(.text+0x1fc0): undefined reference to `__xchg_called_with_bad_pointer'
   sparc-linux-ld: fs/smb/server/vfs_cache.o: in function `ksmbd_wake_session_blocked_works':
   vfs_cache.c:(.text+0x2104): undefined reference to `__xchg_called_with_bad_pointer'
   sparc-linux-ld: fs/smb/server/vfs_cache.o: in function `ksmbd_close_fd':
   vfs_cache.c:(.text+0x21f0): undefined reference to `__xchg_called_with_bad_pointer'
   sparc-linux-ld: fs/smb/server/vfs_cache.o:vfs_cache.c:(.text+0x2b84): more undefined references to `__xchg_called_with_bad_pointer' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
