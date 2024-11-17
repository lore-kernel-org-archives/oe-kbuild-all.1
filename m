Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14041F4ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 05:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731820622; cv=none; b=EyaxDwhGe8WohlOaUYmMFTEt4RrreMFwA0UT/+/F35S9soJetGFIget/0goLuWEYKlJNuEMps9gArafOy6Fw9EE/ndEqYmBZoJWwE3Z2RhDiXqtCg5b2fwj0Nf1uHLJ528JSN4po3mGzEeH6Sg5lL7Qn1D9eEg+nB40kUXsFKok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731820622; c=relaxed/simple;
	bh=kLzyWENOOHs/57t1IcrdtK1fsGTEzeNadh5Wbrh6tCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lPdF2KFlr4sv06yK6RX72XtIML5x2FF9+cAkIoo38U2RzMgwd5/nGi8fPRh4sbBoVly0adOJOhctczaASwcytUZZK2DP80hYUHcmiuEuZ7NxOdeKyjexyEkvpBd1JrQhbxtcgI+9o6c9D8uiJUnrmG3TLKmSJtRkPLKYyhc47AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpfuvBdV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpfuvBdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731820621; x=1763356621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLzyWENOOHs/57t1IcrdtK1fsGTEzeNadh5Wbrh6tCs=;
  b=bpfuvBdV6ZNKx4BBgRlLRjQWWvxeDXeHTpXE9pgZZfNzkPZVhUPBxNIx
   ug2MS3TVQfuzWSSOFTh1s2/0jASWcFc8wazb9P5uWlsfoxmsg/0F1bd55
   KuePzq4PcP+CN4jL0r7CdHEFacofZ3nKLT7LcH/THVCE6IwS0QQrLVI8b
   /5hl3lFvRLTmX4CQVQnLcYm3+V+/EntWlVS3b+FdIRDeZ9ZJiuzHT1ESb
   xciMD8YJVGPEncMBssQYrexYEZt82BhOCFBE2Dj0aGv+NamsKc1d5JlbL
   QqtcRowbTdK//JYc4HlS6dImJYr/5srCuge8U0uvc3qb8UKgACQmjccqJ
   g==;
X-CSE-ConnectionGUID: nYqQeyaiQSig1xmcRxAN1g==
X-CSE-MsgGUID: tzYkRFW5SGOnadFkVg0YFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="43182551"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="43182551"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 21:16:58 -0800
X-CSE-ConnectionGUID: RseQWDTsRx+aH0E/DpqnBw==
X-CSE-MsgGUID: oJJaOYZ3QtueBKqcKB4pdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88677864"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2024 21:16:57 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCXeY-0001Yr-2E;
	Sun, 17 Nov 2024 05:16:54 +0000
Date: Sun, 17 Nov 2024 13:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuiqing <zhoushuiqing2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2439/2439] security/integrity/ima/ima.h:381:16:
 warning: declaration of 'struct ima_digest' will not be visible outside of
 this function
Message-ID: <202411171333.Hd6pOCxj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4cbb736395eb31ff181c4488182276601992fa0b
commit: e94df9b790f7ed9025c9321f16a77044f66b14a5 [2439/2439] ima: Add macros to isolate the IMA digest list
config: x86_64-randconfig-013-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171333.Hd6pOCxj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171333.Hd6pOCxj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171333.Hd6pOCxj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_init.c:15:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from security/integrity/ima/ima_init.c:19:
>> security/integrity/ima/ima.h:381:16: warning: declaration of 'struct ima_digest' will not be visible outside of this function [-Wvisibility]
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^
   6 warnings generated.
--
   In file included from security/integrity/ima/ima_main.c:23:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from security/integrity/ima/ima_main.c:30:
>> security/integrity/ima/ima.h:381:16: warning: declaration of 'struct ima_digest' will not be visible outside of this function [-Wvisibility]
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^
   security/integrity/ima/ima_main.c:440:29: error: too few arguments to function call, expected 8, have 7
     433 |                         rc = ima_appraise_measurement(func, iint, file,
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~
     434 |                                               pathname, xattr_value,
     435 | #ifdef CONFIG_IMA_DIGEST_LIST
     436 |                                               xattr_len, modsig,
     437 |                                               ima_digest_allow(found_digest,
     438 |                                                                IMA_APPRAISE));
     439 | #else
     440 |                                               xattr_len, modsig);
         |                                                                ^
   security/integrity/ima/ima.h:373:19: note: 'ima_appraise_measurement' declared here
     373 | static inline int ima_appraise_measurement(enum ima_hooks func,
         |                   ^                        ~~~~~~~~~~~~~~~~~~~~
     374 |                                            struct integrity_iint_cache *iint,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     375 |                                            struct file *file,
         |                                            ~~~~~~~~~~~~~~~~~~
     376 |                                            const unsigned char *filename,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     377 |                                            struct evm_ima_xattr_data *xattr_value,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     378 |                                            int xattr_len,
         |                                            ~~~~~~~~~~~~~~
     379 | #ifndef CONFIG_IMA_DIGEST_LIST
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     380 |                                            const struct modsig *modsig,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     381 |                                            struct ima_digest *found_digest)
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.
--
   In file included from security/integrity/ima/ima_asymmetric_keys.c:13:
   In file included from security/integrity/ima/ima.h:19:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from security/integrity/ima/ima_asymmetric_keys.c:13:
>> security/integrity/ima/ima.h:381:16: warning: declaration of 'struct ima_digest' will not be visible outside of this function [-Wvisibility]
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^
   security/integrity/ima/ima_asymmetric_keys.c:27:6: warning: no previous prototype for function 'ima_post_key_create_or_update' [-Wmissing-prototypes]
      27 | void ima_post_key_create_or_update(struct key *keyring, struct key *key,
         |      ^
   security/integrity/ima/ima_asymmetric_keys.c:27:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      27 | void ima_post_key_create_or_update(struct key *keyring, struct key *key,
         | ^
         | static 
   7 warnings generated.


vim +381 security/integrity/ima/ima.h

273df864cf7466 Nayna Jain            2019-10-30  372  
4ad87a3d7444de Mimi Zohar            2016-01-14  373  static inline int ima_appraise_measurement(enum ima_hooks func,
d79d72e02485c0 Mimi Zohar            2012-12-03  374  					   struct integrity_iint_cache *iint,
2fe5d6def1672a Mimi Zohar            2012-02-13  375  					   struct file *file,
d3634d0f426bde Dmitry Kasatkin       2013-04-25  376  					   const unsigned char *filename,
d3634d0f426bde Dmitry Kasatkin       2013-04-25  377  					   struct evm_ima_xattr_data *xattr_value,
39b07096364a42 Thiago Jung Bauermann 2019-06-27  378  					   int xattr_len,
e94df9b790f7ed Zhou Shuiqing         2023-09-06  379  #ifndef CONFIG_IMA_DIGEST_LIST
a44c2ae6cac55b Roberto Sassu         2021-03-03  380  					   const struct modsig *modsig,
a44c2ae6cac55b Roberto Sassu         2021-03-03 @381  					   struct ima_digest *found_digest)
e94df9b790f7ed Zhou Shuiqing         2023-09-06  382  #else
e94df9b790f7ed Zhou Shuiqing         2023-09-06  383  					   const struct modsig *modsig)
e94df9b790f7ed Zhou Shuiqing         2023-09-06  384  #endif
2fe5d6def1672a Mimi Zohar            2012-02-13  385  {
2fe5d6def1672a Mimi Zohar            2012-02-13  386  	return INTEGRITY_UNKNOWN;
2fe5d6def1672a Mimi Zohar            2012-02-13  387  }
2fe5d6def1672a Mimi Zohar            2012-02-13  388  

:::::: The code at line 381 was first introduced by commit
:::::: a44c2ae6cac55bdcc0d33f62600233ea0f3f6688 ima: Add support for appraisal with digest lists

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
