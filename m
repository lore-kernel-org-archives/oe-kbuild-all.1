Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07178230268
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748959642; cv=none; b=O1sSF1qIPcn//TvhHrqHgtkp05290TmmjzH0T6/SlVp0Jj/okuEbLQpGK2viTKgXHYuQujBJ9IJKbAdxTvtBdgUHqx1tjgp6HaCNknw8cbAOeGPlRvq2eV3MWRlKOntFD64C6yYVshoEdCPyCD1KJZAJl52Xof/Zb7Fo9IlXnRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748959642; c=relaxed/simple;
	bh=bc1kxKZbL9jBfXe1bl0HFPbl4F70VLWTcmnh/rFL+Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sXELwtjp9gO9ycbDMta/owclZLKQs6YuIMV/U+c6U518FoK+spLPSG2DLTqkqcrEyms4VRmjzzkccWg/OphbInL0sMeS0fYE+RNshXtDYwJtlwoj3pJukLzcHNu+xZn1m6u/Jkd9vbKAT8lD8Ic00nlKBdSlANTfBGRgGNMLgM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7sQK06/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7sQK06/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748959640; x=1780495640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bc1kxKZbL9jBfXe1bl0HFPbl4F70VLWTcmnh/rFL+Hk=;
  b=J7sQK06/639dPDxclRFPg+LSdxaoWdNLC4B4CeMio/TVvxVefHNFVqge
   IBvDsfrt7NWEA4O571G5+TvZS3/eysCKIcxeQf3k/J97Xk9fQrnoSv1vp
   N93nz8AcebZ7d2Z5Rwj8l82JSbsfFTz7RYN8VXWlTo5nKjR8WhbaZtEFy
   ZVwXkVKuwDcpu0TxuBNII6hj1p/SdOA/mLGb+ufBsjLuOA9JE8d7OMkQp
   90enQLvrYIdLz+CNB5+f5RKtGIblimvJhAi4WGPaCiuSakmxGeWBB93GI
   3IvwumqE4UtxysJSlsmieXFrV+WD68DjzR67fKQYGhum8I+1RItfNxCxa
   A==;
X-CSE-ConnectionGUID: rYQaZBGjT8iFAW+CsQXTeQ==
X-CSE-MsgGUID: PWwH+W0tSR6VYg0kHuTGmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="53629899"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="53629899"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 07:07:19 -0700
X-CSE-ConnectionGUID: 6CQ+eQO2Q4e4NmWmLtxu+w==
X-CSE-MsgGUID: 8d8CMXdJQKeJeugZ19SmpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="149911175"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Jun 2025 07:07:18 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMSIN-0001WU-1z;
	Tue, 03 Jun 2025 14:07:15 +0000
Date: Tue, 3 Jun 2025 22:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuiqing <zhoushuiqing2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] security/integrity/ima/ima.h:381:51:
 warning: 'struct ima_digest' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202506032230.dr69WVe5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: e94df9b790f7ed9025c9321f16a77044f66b14a5 [2882/2882] ima: Add macros to isolate the IMA digest list
config: x86_64-buildonly-randconfig-2001-20250502 (https://download.01.org/0day-ci/archive/20250603/202506032230.dr69WVe5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506032230.dr69WVe5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506032230.dr69WVe5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_api.c:18:
>> security/integrity/ima/ima.h:381:51: warning: 'struct ima_digest' declared inside parameter list will not be visible outside of this definition or declaration
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^~~~~~~~~~
--
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
