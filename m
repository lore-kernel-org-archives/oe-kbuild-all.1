Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D11F94F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770057078; cv=none; b=aFrDGIWVmS0OMWba5O2mInWsoidc9ZkvjCfV0eLjNf+WI3LoCrXjZVrdZUlebocqf5a/bxHxl+iaJG+2eHENlU7qA2LyiaKUAiiVB+xDSuu2ltYnb+TacZDwdlXDH8CKR25gCWWo4Ch4fLaoVyFU0WW6mpq3dDx4NY6/lg/cWHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770057078; c=relaxed/simple;
	bh=uB6mQ73vPdis808q5Avpb+ZRr7P4BPyr+2R+PpDzip4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RWkCRzo7i98mYccEpaU49nLYomDpVlYYAyud48OqYUPxyQVOUmxhR3JRMISAQHayUOlK9M/UhBw4lvrEaxc67UJSN2RiuwnVJ4JF5q7ZwffH41eslpI9kItxEOjyt4sfF/TrTHeFC7iA7ewAMwfjq9fCwKtlzrNjcp/ZpO2qwIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYyW4Qsw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYyW4Qsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770057077; x=1801593077;
  h=date:from:to:cc:subject:message-id;
  bh=uB6mQ73vPdis808q5Avpb+ZRr7P4BPyr+2R+PpDzip4=;
  b=IYyW4QswxenYerLclj6tqHdmo696ai0HUlVdN6Hah7+5jJfC1ANRp5ks
   wUK2ZRZWe35CerElNKICddzkanWFsN4a1Pv7PATNmLBCRA9+i19BhWrhG
   DJUQ2gUap1uEwYrj1HdSNc9rhB5EQT2Ub3eGt7xkMJnzIk3DKof0UV9M7
   mhKMcIuTpPFcJaEMVpHb9FMUp/g6aUBjeCF5yR4LNfmv9m4uQZju6N4G0
   J9alPRYBovhBKkzxafc3pAvap3iVR2YGG3P+L20RNQqHbRL//AZPDZQm7
   w6AUloSwFmf/6/p5HZomY4S/I4RhLeunAigeEQyM3TA9vRNWedpl2cMLz
   A==;
X-CSE-ConnectionGUID: 2smsuQu3Rq6wXZy9NDmzjA==
X-CSE-MsgGUID: OK+BJzOASRWslOv814U9ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71203009"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71203009"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 10:31:17 -0800
X-CSE-ConnectionGUID: pv8upkzvT0GeLrs6FgP+0A==
X-CSE-MsgGUID: zAbjVh03SrC3YwPTOqPwiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="209603443"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Feb 2026 10:31:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmyhc-00000000fqS-10gZ;
	Mon, 02 Feb 2026 18:31:12 +0000
Date: Tue, 03 Feb 2026 02:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10788/11220]
 include/linux/rcupdate.h:555:36: error: dereferencing pointer to incomplete
 type 'struct maple_enode'
Message-ID: <202602030233.gZQAuAMc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   193579fe01389bc21aff0051d13f24e8ea95b47d
commit: 60d8a8eb080e2f6927add49f47625574b39d3072 [10788/11220] maple_tree: add cp_is_new_root() helper
config: parisc-randconfig-002-20260202 (https://download.01.org/0day-ci/archive/20260203/202602030233.gZQAuAMc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030233.gZQAuAMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030233.gZQAuAMc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/parisc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:380,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/maple_tree.h:11,
                    from lib/maple_tree.c:56:
   lib/maple_tree.c: In function 'cp_is_new_root':
>> include/linux/rcupdate.h:555:36: error: dereferencing pointer to incomplete type 'struct maple_enode'
    #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
                                       ^~~~
   include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
     *(volatile typeof(x) *)&(x) = (val);    \
                                    ^~~
   include/linux/rcupdate.h:1046:3: note: in expansion of macro 'WRITE_ONCE'
      WRITE_ONCE(p, RCU_INITIALIZER(v)); \
      ^~~~~~~~~~
   include/linux/rcupdate.h:1046:17: note: in expansion of macro 'RCU_INITIALIZER'
      WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                    ^~~~~~~~~~~~~~~
   lib/maple_tree.c:3364:3: note: in expansion of macro 'RCU_INIT_POINTER'
      RCU_INIT_POINTER(cp->slot[0], mt_mk_node(cp->dst[0].node, mt));
      ^~~~~~~~~~~~~~~~


vim +555 include/linux/rcupdate.h

ca5ecddfa8fcbd Paul E. McKenney 2010-04-28  550  
462225ae47d717 Paul E. McKenney 2013-11-11  551  /**
462225ae47d717 Paul E. McKenney 2013-11-11  552   * RCU_INITIALIZER() - statically initialize an RCU-protected global variable
462225ae47d717 Paul E. McKenney 2013-11-11  553   * @v: The value to statically initialize with.
462225ae47d717 Paul E. McKenney 2013-11-11  554   */
462225ae47d717 Paul E. McKenney 2013-11-11 @555  #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
462225ae47d717 Paul E. McKenney 2013-11-11  556  

:::::: The code at line 555 was first introduced by commit
:::::: 462225ae47d7175f886281d8a91708550cd5178c rcu: Add an RCU_INITIALIZER for global RCU-protected pointers

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
