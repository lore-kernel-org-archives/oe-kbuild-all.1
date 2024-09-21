Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B73C5381E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726912605; cv=none; b=TYY2BOCtvOvxIaZqbrFs3dXc6FlH/z/ZvZ3+x/i3RNnpKWvxyDg0mbVcA8VfoPuSHKClwkxMwkUaFrqIKvJjELvat9V1dnjWWo679CBiDJkCTq4Zg0wiliTARB6wMY89XEvMgipStiYX0SVBHz4x16iG/RN1ZrOTgM6DJKg2lIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726912605; c=relaxed/simple;
	bh=RGXauGicx3IKv2EMSaT2hBpf2tyC1GIvxmP1Feu+zlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FoInrnFb6W4uZlxYBpmdC65aprmwmB4KQHkH75/HHOW2IG6Vq73BHNiECO5L8icWvai1Do4blxiBQrM6RrOxyK5YYpjKjNiEse6dGpV9ixd1sjOQXlEfWv61lnfpuCEMONljQQX51z7yesM2x4xYy33wE9q5Xg/+6EwOaxAJykw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pfj2zAp/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pfj2zAp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726912602; x=1758448602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RGXauGicx3IKv2EMSaT2hBpf2tyC1GIvxmP1Feu+zlU=;
  b=Pfj2zAp/YTbT09dC3WAqWN13pujBpe77RdDzEF72egoANTLu4tYFTnF7
   /drlpLRto+EVEfcDbsTXBVKVELNJwc4Hm0U/4Lpi90HX66L9Ha9wMd3n5
   jHZtvBndKE9ux89ihbIY2iblT2WPsdvV3uGe4gk9nq1a3WGydOUbw8cR4
   IdP2fPKMFpYxLDNgVvt8Od3aBfC+ZoctjCG19EwNe6BVrfU43Oql/OUZ3
   BBdl6yhuM9sk7rKGmhyeyFSdDjGos+OBaOoVepe3SFaTBBM8QIP/9P3ac
   h7HJg1MN+HyYye+SKDrD+egzX4/O/17hEYO4N00DC8zOty9DygF5+OomE
   g==;
X-CSE-ConnectionGUID: 3KFqU5LdSKei7moPxQt7hA==
X-CSE-MsgGUID: wLaUFgxvQ5itnH7EwE2LFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="51338099"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="51338099"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 02:56:41 -0700
X-CSE-ConnectionGUID: a0RtPIFpRpu6eyZtVyO4yg==
X-CSE-MsgGUID: xyxPJ9VbR9a+cSuumfvFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="75113080"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Sep 2024 02:56:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srwqz-000FKl-31;
	Sat, 21 Sep 2024 09:56:37 +0000
Date: Sat, 21 Sep 2024 17:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 12/13] fs/afs/internal.h:1720:16:
 warning: format '%lx' expects argument of type 'long unsigned int', but
 argument 4 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202409211744.QZHjS9Sv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   1b8d06c4ea0b6eb74b52b9dadb866a92c0cc5b69
commit: 0f34d30a14a72f72a214488bf16a9dcd3b21509e [12/13] afs: Use netfslib for directories
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240921/202409211744.QZHjS9Sv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211744.QZHjS9Sv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211744.QZHjS9Sv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from fs/afs/dir.c:8:
   fs/afs/dir.c: In function 'afs_dir_dump_step':
>> fs/afs/internal.h:1720:16: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    1720 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |                ^~~~~~~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   fs/afs/internal.h:1720:9: note: in expansion of macro 'printk'
    1720 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |         ^~~~~~
   fs/afs/internal.h:1722:25: note: in expansion of macro 'dbgprintk'
    1722 | #define kenter(FMT,...) dbgprintk("==> %s("FMT")",__func__ ,##__VA_ARGS__)
         |                         ^~~~~~~~~
   fs/afs/internal.h:1740:17: note: in expansion of macro 'kenter'
    1740 |                 kenter(FMT,##__VA_ARGS__);              \
         |                 ^~~~~~
   fs/afs/dir.c:178:9: note: in expansion of macro '_enter'
     178 |         _enter("%lx", progress);
         |         ^~~~~~
   fs/afs/dir.c: In function 'afs_dir_iterate_step':
>> fs/afs/internal.h:1720:16: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    1720 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |                ^~~~~~~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   fs/afs/internal.h:1720:9: note: in expansion of macro 'printk'
    1720 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |         ^~~~~~
   fs/afs/internal.h:1722:25: note: in expansion of macro 'dbgprintk'
    1722 | #define kenter(FMT,...) dbgprintk("==> %s("FMT")",__func__ ,##__VA_ARGS__)
         |                         ^~~~~~~~~
   fs/afs/internal.h:1740:17: note: in expansion of macro 'kenter'
    1740 |                 kenter(FMT,##__VA_ARGS__);              \
         |                 ^~~~~~
   fs/afs/dir.c:464:9: note: in expansion of macro '_enter'
     464 |         _enter("%lx", progress);
         |         ^~~~~~


vim +1720 fs/afs/internal.h

08e0e7c82eeade David Howells 2007-04-26  1718  
08e0e7c82eeade David Howells 2007-04-26  1719  #define dbgprintk(FMT,...) \
ad16df848d7f84 Sven Schnelle 2008-04-03 @1720  	printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
08e0e7c82eeade David Howells 2007-04-26  1721  

:::::: The code at line 1720 was first introduced by commit
:::::: ad16df848d7f84a1b7cea92edd515815ea4ccf0f afs: remove smp_prcessor_id() from debug macro

:::::: TO: Sven Schnelle <svens@stackframe.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
