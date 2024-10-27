Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2232ECC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 00:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729989037; cv=none; b=f0CJKHyQvQX+jrPkuXoHkMcGkXcM6OtUNlTPRjoELnlXifPllJE0Q2tMvPznjGilIjL1sQkNkKjk2SAIkuFUR8cl/IDP9HMHOTXuy/qOEQlgh8HDvRuk3IuyKQ+Yy9bWEBXXp8m0RJLzWFtFaFMtS7X+bJXVyoMGHI5TqpkV9e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729989037; c=relaxed/simple;
	bh=bknUs8tlHqYeFPpEEOa5CMfNaapcgyqNzs0ccs5ipcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nplf1qD7v+XhvM5GYsRBhBf+LDz4HW2DC44I0k0seoeJQUVZULVFU7sFx1oVQNIN00rpI9qKdO3Zqgs9NjSVvT/3tUplchrNS3yIqmHHNOrB/EpofFm6Oh8NzAk26EkcNxyF6XE0/YUCbkP4E8o8bQD0BEAPlGrDcwBuslUcg3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBAQFZ4T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBAQFZ4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729989035; x=1761525035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bknUs8tlHqYeFPpEEOa5CMfNaapcgyqNzs0ccs5ipcc=;
  b=VBAQFZ4TVdX4naEQjw65p4lCaxUyoESgsPxuwQ2CPEv+vuy7iAUA2tH8
   LVwjpZ9f1iQHIc1ckag8ma7XYXd5KsmbNfKUwhEcYwdy2MVWzp/PG0Doi
   FCGibfClIRlFq0bEt5x5eJLCxlCL/B8tioRxbHt/3IIcYhOSnpAQg1vHV
   sCxp1wZsNdXCddJsZ4LAJTeNm0g3J74eYdfbV8csvjruf5h/BDjXrg/yK
   +M/cnFYIQytbvM2zNiPO0AiWGfr2EyWPvjNf78PqBLRtDwIPgDxHWxRED
   CNcPlGAKG/OAi9Gj4G4zBsBXuYwXfT+FBarSBoYAfE4FMAIzoYGQ/Bkyu
   A==;
X-CSE-ConnectionGUID: arXYmN0fQE6OYpjYXlVSNQ==
X-CSE-MsgGUID: 7sKOT+neRfWWyBRuT03CYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29812193"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29812193"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 17:30:33 -0700
X-CSE-ConnectionGUID: cts8r3oSQ/SCda8meF1k4Q==
X-CSE-MsgGUID: PmhAQy9zSEOZvrjgYHrbeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="86018879"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Oct 2024 17:30:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4rAr-000aCa-1h;
	Sun, 27 Oct 2024 00:30:29 +0000
Date: Sun, 27 Oct 2024 08:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuiqing <zhoushuiqing2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18534/30000]
 security/integrity/ima/ima.h:381:51: warning: 'struct ima_digest' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202410270809.Ptd8Ot1n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: e94df9b790f7ed9025c9321f16a77044f66b14a5 [18534/30000] ima: Add macros to isolate the IMA digest list
config: x86_64-buildonly-randconfig-006-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270809.Ptd8Ot1n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270809.Ptd8Ot1n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270809.Ptd8Ot1n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_main.c:30:
>> security/integrity/ima/ima.h:381:51: warning: 'struct ima_digest' declared inside parameter list will not be visible outside of this definition or declaration
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^~~~~~~~~~
   security/integrity/ima/ima_main.c: In function 'process_measurement':
   security/integrity/ima/ima_main.c:433:30: error: too few arguments to function 'ima_appraise_measurement'
     433 |                         rc = ima_appraise_measurement(func, iint, file,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima.h:373:19: note: declared here
     373 | static inline int ima_appraise_measurement(enum ima_hooks func,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from security/integrity/ima/ima_api.c:18:
>> security/integrity/ima/ima.h:381:51: warning: 'struct ima_digest' declared inside parameter list will not be visible outside of this definition or declaration
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^~~~~~~~~~
--
   In file included from security/integrity/ima/ima_asymmetric_keys.c:13:
>> security/integrity/ima/ima.h:381:51: warning: 'struct ima_digest' declared inside parameter list will not be visible outside of this definition or declaration
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^~~~~~~~~~
   security/integrity/ima/ima_asymmetric_keys.c:27:6: warning: no previous prototype for 'ima_post_key_create_or_update' [-Wmissing-prototypes]
      27 | void ima_post_key_create_or_update(struct key *keyring, struct key *key,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
