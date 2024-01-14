Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7667E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 10:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChFzKdV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705229170; x=1736765170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KhdTXTQz+CLFZAfkTbEHjUDAdeKeQm7BR4xLj18qqR4=;
  b=ChFzKdV6OdVNu/3Yaijwhr7QoGPFE4LmJlV+RFZHJsm7fJCZUDwY/rKE
   H9ZYJC7FEbyrtuJ5WK2QpSkswoeEc9LC/BcUTGynfTVj7RsyWnEMoouXD
   GpNxvnhkV5wujOpcuopC4MyoSaLlcAV8tQWpFak2uVADRxnN93lPByk0o
   xPys05hoXhZFp6Dr4zKgbZ4OuAMpxlu1UjmfvcVkHvrsyom0+tthG5OSZ
   e3sx6KtcuHHXtwZ1U0UDfZw/+xNRR/McDm0GIzBS3zsR0rghWwA+l8y+q
   mRB1XyxJBR3kxohd6EHEdhmydvBjNu9fsXAmhmIM0kd+0bXLC5Z7HR7Wh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="399127720"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="399127720"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 02:46:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="1030379659"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="1030379659"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Jan 2024 02:46:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOy0E-000BQm-0D;
	Sun, 14 Jan 2024 10:46:06 +0000
Date: Sun, 14 Jan 2024 18:45:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 25979/30000]
 security/integrity/ima/ima.h:381:16: warning: declaration of 'struct
 ima_digest' will not be visible outside of this function
Message-ID: <202401141804.Uh46ricb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6d9d4951bf741189c66627715d5ae8a8cf1df85f
commit: e94df9b790f7ed9025c9321f16a77044f66b14a5 [25979/30000] ima: Add macros to isolate the IMA digest list
config: x86_64-randconfig-012-20240114 (https://download.01.org/0day-ci/archive/20240114/202401141804.Uh46ricb-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401141804.Uh46ricb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141804.Uh46ricb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_queue.c:20:
>> security/integrity/ima/ima.h:381:16: warning: declaration of 'struct ima_digest' will not be visible outside of this function [-Wvisibility]
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^
   1 warning generated.
--
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
   1 warning and 1 error generated.
--
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
   2 warnings generated.


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
