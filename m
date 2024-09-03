Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE452AE66
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375919; cv=none; b=r56inyPvFg74RhtoMw6AUi+5XCbK/QY8+SgnppLoNCnKs+XuQkktjOuxKxpobsEwWOjU8VB0yxySrOVdI4xgl5f9BsnUneR5IDkScti8JiZGo2MFHpYQwkc+Bz9W9fM+ivMzq4OeKfebaMvv5lG4u8P4z1y6YSl+jn1YN5jD0CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375919; c=relaxed/simple;
	bh=/0AAQ2dvdROQM7lLSGwE+JuFZoEDwcqcNnoWBDqpJ68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fUJj2m+dkwbLbg47jziBaiR7Pkc9vP9M1ixW9ZNUCSSA7iH4sDekusp3fHeFU9j5tqMI6hiQD+lM+5HK1pOEHB/3LlXy2oz36JLyARMG/2RcELZepIw1WqtjobrNDvEZomNE6SMncp0ACb2vPrR/KYdV9lGX/JqEmBPoy8OrGZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGnVAmCF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGnVAmCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725375916; x=1756911916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/0AAQ2dvdROQM7lLSGwE+JuFZoEDwcqcNnoWBDqpJ68=;
  b=YGnVAmCFEYZu0rGbJls4LW36BTLPqZKwysEg09pEvFNuXIgTdvE/HfWs
   9tQOOzk7yK7r2MB2XP3RcA4jdoRTf42HZopPabJXhDTlOsj7m2yf9i1Fu
   Ba4GO7E7Z8v/be3o3nQ8cpzmJwffxJ0H5JHpotliHcQPd1a06MkY3mA7O
   oLUEIYaY1Y0D3U7Cfj40jvrHStLQqz8aazzciVzmT2I5Z14XTKdojz6A7
   Qn9VS5qOT/oYLaQ9zjKnnTntZDDY8u5EIyhg/n8wIbj8mBtNjMcJzNMlN
   1R5BSdDxTbUj5OWrnGwoIclk+1fbicOWVyJvw7VOs2E0cSJZZrvtUj9MY
   A==;
X-CSE-ConnectionGUID: fqRQauG7QVeuw6c3SDkVNA==
X-CSE-MsgGUID: Vn63X094Q3Ko2ZMbFiVWLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="49388701"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="49388701"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:05:14 -0700
X-CSE-ConnectionGUID: vTb+j2W1SP2kA9lliiOTjg==
X-CSE-MsgGUID: +Xko7si3R/uiiBXHqvw0jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="64615656"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Sep 2024 08:05:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slV5j-0006pJ-0K;
	Tue, 03 Sep 2024 15:05:11 +0000
Date: Tue, 3 Sep 2024 23:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 37/37] fs/netfs/internal.h:439:16: warning:
 format '%zu' expects argument of type 'size_t', but argument 4 has type
 'long unsigned int'
Message-ID: <202409032323.GhbNO1EX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   3962f4beba4e7ffa6cfab018df8a612902a1d2c8
commit: 3962f4beba4e7ffa6cfab018df8a612902a1d2c8 [37/37] netfs: Support decryption on ubuffered/DIO read
config: i386-randconfig-001-20240903 (https://download.01.org/0day-ci/archive/20240903/202409032323.GhbNO1EX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032323.GhbNO1EX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032323.GhbNO1EX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:257,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/netfs/crypto.c:8:
   fs/netfs/crypto.c: In function 'netfs_decrypt_dio':
>> fs/netfs/internal.h:439:16: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'long unsigned int' [-Wformat=]
     439 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |                ^~~~~~~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   fs/netfs/internal.h:439:9: note: in expansion of macro 'printk'
     439 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |         ^~~~~~
   fs/netfs/internal.h:443:26: note: in expansion of macro 'dbgprintk'
     443 | #define kdebug(FMT, ...) dbgprintk(FMT, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/crypto.c:304:9: note: in expansion of macro 'kdebug'
     304 |         kdebug("type=%u nr=%zu type=%u nr=%zu",
         |         ^~~~~~
   fs/netfs/internal.h:439:16: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'long unsigned int' [-Wformat=]
     439 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |                ^~~~~~~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   fs/netfs/internal.h:439:9: note: in expansion of macro 'printk'
     439 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |         ^~~~~~
   fs/netfs/internal.h:443:26: note: in expansion of macro 'dbgprintk'
     443 | #define kdebug(FMT, ...) dbgprintk(FMT, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/crypto.c:304:9: note: in expansion of macro 'kdebug'
     304 |         kdebug("type=%u nr=%zu type=%u nr=%zu",
         |         ^~~~~~
   fs/netfs/crypto.c:283:36: warning: variable 'skip' set but not used [-Wunused-but-set-variable]
     283 |         size_t len, processed = 0, skip, bsize = 1UL << ctx->crypto_bshift;
         |                                    ^~~~


vim +439 fs/netfs/internal.h

915cd30cdea8811 David Howells 2023-11-20  433  
3d3c95046742e4e David Howells 2020-05-13  434  /*****************************************************************************/
3d3c95046742e4e David Howells 2020-05-13  435  /*
3d3c95046742e4e David Howells 2020-05-13  436   * debug tracing
3d3c95046742e4e David Howells 2020-05-13  437   */
3d3c95046742e4e David Howells 2020-05-13  438  #define dbgprintk(FMT, ...) \
a9d47a50cf257ff David Howells 2024-07-18 @439  	printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
3d3c95046742e4e David Howells 2020-05-13  440  

:::::: The code at line 439 was first introduced by commit
:::::: a9d47a50cf257ff1019a4e30d573777882fd785c netfs: Revert "netfs: Switch debug logging to pr_debug()"

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
