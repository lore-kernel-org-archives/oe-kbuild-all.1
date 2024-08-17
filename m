Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576553B782
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723897059; cv=none; b=rL8wsXmIL+vnNQOdrH79E55yHBBfOIFu2QWyfjAmF/ci3W9Ibi6d+9zy1C0dX9Ro+eB9rdaTW5ChDme88hjuknT2qJDs5Xz1ej4zQAD9NgmiKtgyT2fTQETu5L7hZRMlkaHRQ6A3909Z6PQGc59tMTKv9tgsvDMN+/fvmZT0R/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723897059; c=relaxed/simple;
	bh=jWPsO7asF7oCWfquoQV6E8yoWhM1qIqzR9La6hr4YUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hufXJhKxeltKZmgEpwa7P3V+HPtcs0rWUKsBo2LhD9JI1wXl9/f1LzqBjMUK0e4nTBa/KKu0GS/c8rhOVFJ8f2UOha6UUzLhEDIvruHnr1Ao4Mn6iDoCM0DBgumQOa45rqcADf38XhUtDgLJzyuwXuZRBpNlFmxh7Q2yqX9Xt/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVym3j50; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVym3j50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723897058; x=1755433058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWPsO7asF7oCWfquoQV6E8yoWhM1qIqzR9La6hr4YUo=;
  b=HVym3j50zT4Bgm8ZVtoaKl/OnvKris9mOJMRlw3wADD56xCDShunszI1
   BG1fOQrv0zjYSwznSHrBLzT8C3DBqCiItRCUNR+CnVbxOG2jS/YHFHSQm
   ZNv9C4mWt5ibrY5g7GeuLxpVyuvKFUPsh1vHpFuUTKiy2RBqdZvJ0YghH
   gZZAAJysd92MjjdWTWUE+nnVii7/hVzfZeqLWgO1F+rrSNY8tAZROUhU+
   OYuMzLDX1SX3i7tPY/cTzQHCpc9wstuAbJqZo2czUn+QLhTDOcECAgj6z
   qOnabqFAgli/tvXmpbYW3GATXowx2ftjwagzwRXkwAXoGaaI0Z/KYdvlq
   A==;
X-CSE-ConnectionGUID: Pt2LW25/RBGXcTAlAwTIHA==
X-CSE-MsgGUID: /j17g7LdRXSdfpdQBx05IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="22038357"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="22038357"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 05:17:37 -0700
X-CSE-ConnectionGUID: 4lHPDqB5RAuRSqxwd+Q47A==
X-CSE-MsgGUID: VtRBs+MeQ/2iPN3OJV0B9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="59564895"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Aug 2024 05:17:36 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfINB-0007QU-0X;
	Sat, 17 Aug 2024 12:17:33 +0000
Date: Sat, 17 Aug 2024 20:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Roberto Sassu <roberto.sassu@huawei.com>
Subject: [dhowells-fs:pgplib 6/14]
 crypto/asymmetric_keys/pgp_public_key.c:8:21: warning: format '%lu' expects
 argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka
 'unsigned int'}
Message-ID: <202408172032.H0wiSd09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pgplib
head:   f5bc37208146cc7ce38c4ad5a403e00904c0b6d2
commit: c1830c5e36f2b94bba3653adf9771c9dcab75dd3 [6/14] KEYS: PGP data parser
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240817/202408172032.H0wiSd09-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408172032.H0wiSd09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408172032.H0wiSd09-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_generate_fingerprint':
>> crypto/asymmetric_keys/pgp_public_key.c:8:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       8 | #define pr_fmt(fmt) "PGP: "fmt
         |                     ^~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'pr_fmt'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:589:9: note: in expansion of macro 'dynamic_pr_debug'
     589 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:179:9: note: in expansion of macro 'pr_debug'
     179 |         pr_debug("offset %lu/%lu\n", offset, ctx->raw_fingerprint_len);
         |         ^~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:8:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       8 | #define pr_fmt(fmt) "PGP: "fmt
         |                     ^~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'pr_fmt'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:589:9: note: in expansion of macro 'dynamic_pr_debug'
     589 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:179:9: note: in expansion of macro 'pr_debug'
     179 |         pr_debug("offset %lu/%lu\n", offset, ctx->raw_fingerprint_len);
         |         ^~~~~~~~


vim +8 crypto/asymmetric_keys/pgp_public_key.c

   > 8	#define pr_fmt(fmt) "PGP: "fmt
     9	#include <linux/module.h>
    10	#include <linux/kernel.h>
    11	#include <linux/slab.h>
    12	#include <linux/mpi.h>
    13	#include <keys/asymmetric-subtype.h>
    14	#include <keys/asymmetric-parser.h>
    15	#include <crypto/hash.h>
    16	#include <crypto/public_key.h>
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
