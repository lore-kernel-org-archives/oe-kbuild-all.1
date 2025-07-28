Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969E192D8A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 21:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753739089; cv=none; b=TMMot32GWWffB/iErKy+j3YYnS/yGNHf3MIg+ny+j1xzYZAgxa3ADwsQ6Jd3PC1fKvHBbwqvbEc8QmE2kSgjVXl2ZQ5FqhXyLKp0eydn/YuE9aZhZkd6Iaeyu3RHgD2P4Xx91RiuTlHtvY0tuEF8N7ludU/YMoWvThhLhd/ethI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753739089; c=relaxed/simple;
	bh=kJH9QCAjM/2SO+9AMmhF+s4Diz8inUM7M8C7/LC0Dko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRALqdRpxpl0NguPZO1GTEFhEaDqOq2jpxMDVDskKm/xBl19G+eLDCZAL6uw+csjtdM8V8zf/eztbTcVF8SVB0UdZS3gqPaN6AkFRFr7ArrsxwZQGUZC8JvscGk+ep3jfl/ZkHEuFOLscVMW8qrlrUqts9oZpAv1z331nlWO16A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPlExBx5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPlExBx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753739086; x=1785275086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kJH9QCAjM/2SO+9AMmhF+s4Diz8inUM7M8C7/LC0Dko=;
  b=cPlExBx5YzOQDNgHX5j+Of4lo9IxI4VvaikUEZyr4oc6dUeiwoaS10ww
   ZzS6cXfn4EqISWfT97tdfzbm6HkTuOEN8ErBpYwne4PVEhxJBxT2b87LQ
   MFe9r4cwOXXPHc2O2aeTDOaMIN/up9sT/VjDqikDn3JYBMcbKnP+M+jVY
   lFofYC4B3doWkhcyhD2WhPefr41EfiuRHlko4Mnp6PCIrNmL+9WI1wwF7
   0vzJ2wsf1FmqJL2IBDNmeR5+Fo60U18KzycTitRG7q+8W8dqNbP1KrsI+
   9yimkFn3htO5aJ16IJnbdmcJ8DSWLN/peq11hKHtADqAFXA6RBRUXYTXq
   A==;
X-CSE-ConnectionGUID: nKJ3g8L4QUCM7ROBrAhKpA==
X-CSE-MsgGUID: AnFMEFJUQxS4VYjuxFGJgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="43606622"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="43606622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 14:44:45 -0700
X-CSE-ConnectionGUID: apQAazL7Qom6OVLQX+vKoA==
X-CSE-MsgGUID: oSDJo8H4SXSN+NFJl2n3sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="186170375"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2025 14:44:43 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugVeC-0000mR-1S;
	Mon, 28 Jul 2025 21:44:40 +0000
Date: Tue, 29 Jul 2025 05:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dishank Jogi <jogidishank503@gmail.com>, elver@google.com
Cc: oe-kbuild-all@lists.linux.dev, dvyukov@google.com,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	rathod.darshan.0896@gmail.com,
	Dishank Jogi <jogidishank503@gmail.com>
Subject: Re: [PATCH] kcsan: clean up redundant empty macro arguments in
 atomic ops.
Message-ID: <202507290502.vaOga5pZ-lkp@intel.com>
References: <20250728104327.48469-1-jogidishank503@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728104327.48469-1-jogidishank503@gmail.com>

Hi Dishank,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16 next-20250728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dishank-Jogi/kcsan-clean-up-redundant-empty-macro-arguments-in-atomic-ops/20250728-184659
base:   linus/master
patch link:    https://lore.kernel.org/r/20250728104327.48469-1-jogidishank503%40gmail.com
patch subject: [PATCH] kcsan: clean up redundant empty macro arguments in atomic ops.
config: x86_64-buildonly-randconfig-002-20250729 (https://download.01.org/0day-ci/archive/20250729/202507290502.vaOga5pZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507290502.vaOga5pZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507290502.vaOga5pZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1260:9: warning: data definition has no type or storage class
    1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcsan/core.c:1260:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1261:9: warning: data definition has no type or storage class
    1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1261:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1262:9: warning: data definition has no type or storage class
    1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1262:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1263:9: warning: data definition has no type or storage class
    1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1263:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1264:9: warning: data definition has no type or storage class
    1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1264:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcsan/core.c:1270:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1265:9: warning: data definition has no type or storage class
    1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1265:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1270:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1270 | DEFINE_TSAN_ATOMIC_OPS(8);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1260:9: warning: data definition has no type or storage class
    1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcsan/core.c:1260:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1261:9: warning: data definition has no type or storage class
    1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1261:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1262:9: warning: data definition has no type or storage class
    1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1262:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1263:9: warning: data definition has no type or storage class
    1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1263:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1264:9: warning: data definition has no type or storage class
    1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1264:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1265:9: warning: data definition has no type or storage class
    1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1265:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1271:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1271 | DEFINE_TSAN_ATOMIC_OPS(16);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1260:9: warning: data definition has no type or storage class
    1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcsan/core.c:1260:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1261:9: warning: data definition has no type or storage class
    1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1261:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1262:9: warning: data definition has no type or storage class
    1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1262:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1263:9: warning: data definition has no type or storage class
    1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1263:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1264:9: warning: data definition has no type or storage class
    1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1264:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1265:9: warning: data definition has no type or storage class
    1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1265:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1272:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1272 | DEFINE_TSAN_ATOMIC_OPS(32);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1260:9: warning: data definition has no type or storage class
    1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcsan/core.c:1260:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1260 |         DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1261:9: warning: data definition has no type or storage class
    1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1261:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1261 |         DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1262:9: warning: data definition has no type or storage class
    1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1262:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1262 |         DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1263:9: warning: data definition has no type or storage class
    1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1263:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1263 |         DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1264:9: warning: data definition has no type or storage class
    1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1264:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1264 |         DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: error: macro "DEFINE_TSAN_ATOMIC_RMW" requires 3 arguments, but only 2 given
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~             
   kernel/kcsan/core.c:1193: note: macro "DEFINE_TSAN_ATOMIC_RMW" defined here
    1193 | #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
         | 
   kernel/kcsan/core.c:1265:9: warning: data definition has no type or storage class
    1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1265:9: error: type defaults to 'int' in declaration of 'DEFINE_TSAN_ATOMIC_RMW' [-Werror=implicit-int]
    1265 |         DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:1274:1: note: in expansion of macro 'DEFINE_TSAN_ATOMIC_OPS'
    1274 | DEFINE_TSAN_ATOMIC_OPS(64);
         | ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/DEFINE_TSAN_ATOMIC_RMW +1270 kernel/kcsan/core.c

0b8b0830ac1419 Marco Elver      2021-11-30  1169  
0f8ad5f2e93425 Marco Elver      2020-07-03  1170  #define DEFINE_TSAN_ATOMIC_LOAD_STORE(bits)                                                        \
0f8ad5f2e93425 Marco Elver      2020-07-03  1171  	u##bits __tsan_atomic##bits##_load(const u##bits *ptr, int memorder);                      \
0f8ad5f2e93425 Marco Elver      2020-07-03  1172  	u##bits __tsan_atomic##bits##_load(const u##bits *ptr, int memorder)                       \
0f8ad5f2e93425 Marco Elver      2020-07-03  1173  	{                                                                                          \
0b8b0830ac1419 Marco Elver      2021-11-30  1174  		kcsan_atomic_builtin_memorder(memorder);                                           \
9d1335cc1e97cc Marco Elver      2020-07-24  1175  		if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
55a55fec5015b3 Marco Elver      2021-08-09  1176  			check_access(ptr, bits / BITS_PER_BYTE, KCSAN_ACCESS_ATOMIC, _RET_IP_);    \
9d1335cc1e97cc Marco Elver      2020-07-24  1177  		}                                                                                  \
0f8ad5f2e93425 Marco Elver      2020-07-03  1178  		return __atomic_load_n(ptr, memorder);                                             \
0f8ad5f2e93425 Marco Elver      2020-07-03  1179  	}                                                                                          \
0f8ad5f2e93425 Marco Elver      2020-07-03  1180  	EXPORT_SYMBOL(__tsan_atomic##bits##_load);                                                 \
0f8ad5f2e93425 Marco Elver      2020-07-03  1181  	void __tsan_atomic##bits##_store(u##bits *ptr, u##bits v, int memorder);                   \
0f8ad5f2e93425 Marco Elver      2020-07-03  1182  	void __tsan_atomic##bits##_store(u##bits *ptr, u##bits v, int memorder)                    \
0f8ad5f2e93425 Marco Elver      2020-07-03  1183  	{                                                                                          \
0b8b0830ac1419 Marco Elver      2021-11-30  1184  		kcsan_atomic_builtin_memorder(memorder);                                           \
9d1335cc1e97cc Marco Elver      2020-07-24  1185  		if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
9d1335cc1e97cc Marco Elver      2020-07-24  1186  			check_access(ptr, bits / BITS_PER_BYTE,                                    \
55a55fec5015b3 Marco Elver      2021-08-09  1187  				     KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ATOMIC, _RET_IP_);          \
9d1335cc1e97cc Marco Elver      2020-07-24  1188  		}                                                                                  \
0f8ad5f2e93425 Marco Elver      2020-07-03  1189  		__atomic_store_n(ptr, v, memorder);                                                \
0f8ad5f2e93425 Marco Elver      2020-07-03  1190  	}                                                                                          \
0f8ad5f2e93425 Marco Elver      2020-07-03  1191  	EXPORT_SYMBOL(__tsan_atomic##bits##_store)
0f8ad5f2e93425 Marco Elver      2020-07-03  1192  
0f8ad5f2e93425 Marco Elver      2020-07-03  1193  #define DEFINE_TSAN_ATOMIC_RMW(op, bits, suffix)                                                   \
0f8ad5f2e93425 Marco Elver      2020-07-03  1194  	u##bits __tsan_atomic##bits##_##op(u##bits *ptr, u##bits v, int memorder);                 \
0f8ad5f2e93425 Marco Elver      2020-07-03  1195  	u##bits __tsan_atomic##bits##_##op(u##bits *ptr, u##bits v, int memorder)                  \
0f8ad5f2e93425 Marco Elver      2020-07-03  1196  	{                                                                                          \
0b8b0830ac1419 Marco Elver      2021-11-30  1197  		kcsan_atomic_builtin_memorder(memorder);                                           \
9d1335cc1e97cc Marco Elver      2020-07-24  1198  		if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
14e2ac8de0f91f Marco Elver      2020-07-24  1199  			check_access(ptr, bits / BITS_PER_BYTE,                                    \
9d1335cc1e97cc Marco Elver      2020-07-24  1200  				     KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE |                  \
55a55fec5015b3 Marco Elver      2021-08-09  1201  					     KCSAN_ACCESS_ATOMIC, _RET_IP_);                       \
9d1335cc1e97cc Marco Elver      2020-07-24  1202  		}                                                                                  \
0f8ad5f2e93425 Marco Elver      2020-07-03  1203  		return __atomic_##op##suffix(ptr, v, memorder);                                    \
0f8ad5f2e93425 Marco Elver      2020-07-03  1204  	}                                                                                          \
0f8ad5f2e93425 Marco Elver      2020-07-03  1205  	EXPORT_SYMBOL(__tsan_atomic##bits##_##op)
0f8ad5f2e93425 Marco Elver      2020-07-03  1206  
0f8ad5f2e93425 Marco Elver      2020-07-03  1207  /*
0f8ad5f2e93425 Marco Elver      2020-07-03  1208   * Note: CAS operations are always classified as write, even in case they
0f8ad5f2e93425 Marco Elver      2020-07-03  1209   * fail. We cannot perform check_access() after a write, as it might lead to
0f8ad5f2e93425 Marco Elver      2020-07-03  1210   * false positives, in cases such as:
0f8ad5f2e93425 Marco Elver      2020-07-03  1211   *
0f8ad5f2e93425 Marco Elver      2020-07-03  1212   *	T0: __atomic_compare_exchange_n(&p->flag, &old, 1, ...)
0f8ad5f2e93425 Marco Elver      2020-07-03  1213   *
0f8ad5f2e93425 Marco Elver      2020-07-03  1214   *	T1: if (__atomic_load_n(&p->flag, ...)) {
0f8ad5f2e93425 Marco Elver      2020-07-03  1215   *		modify *p;
0f8ad5f2e93425 Marco Elver      2020-07-03  1216   *		p->flag = 0;
0f8ad5f2e93425 Marco Elver      2020-07-03  1217   *	    }
0f8ad5f2e93425 Marco Elver      2020-07-03  1218   *
0f8ad5f2e93425 Marco Elver      2020-07-03  1219   * The only downside is that, if there are 3 threads, with one CAS that
0f8ad5f2e93425 Marco Elver      2020-07-03  1220   * succeeds, another CAS that fails, and an unmarked racing operation, we may
0f8ad5f2e93425 Marco Elver      2020-07-03  1221   * point at the wrong CAS as the source of the race. However, if we assume that
0f8ad5f2e93425 Marco Elver      2020-07-03  1222   * all CAS can succeed in some other execution, the data race is still valid.
0f8ad5f2e93425 Marco Elver      2020-07-03  1223   */
0f8ad5f2e93425 Marco Elver      2020-07-03  1224  #define DEFINE_TSAN_ATOMIC_CMPXCHG(bits, strength, weak)                                           \
0f8ad5f2e93425 Marco Elver      2020-07-03  1225  	int __tsan_atomic##bits##_compare_exchange_##strength(u##bits *ptr, u##bits *exp,          \
0f8ad5f2e93425 Marco Elver      2020-07-03  1226  							      u##bits val, int mo, int fail_mo);   \
0f8ad5f2e93425 Marco Elver      2020-07-03  1227  	int __tsan_atomic##bits##_compare_exchange_##strength(u##bits *ptr, u##bits *exp,          \
0f8ad5f2e93425 Marco Elver      2020-07-03  1228  							      u##bits val, int mo, int fail_mo)    \
0f8ad5f2e93425 Marco Elver      2020-07-03  1229  	{                                                                                          \
0b8b0830ac1419 Marco Elver      2021-11-30  1230  		kcsan_atomic_builtin_memorder(mo);                                                 \
9d1335cc1e97cc Marco Elver      2020-07-24  1231  		if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
14e2ac8de0f91f Marco Elver      2020-07-24  1232  			check_access(ptr, bits / BITS_PER_BYTE,                                    \
9d1335cc1e97cc Marco Elver      2020-07-24  1233  				     KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE |                  \
55a55fec5015b3 Marco Elver      2021-08-09  1234  					     KCSAN_ACCESS_ATOMIC, _RET_IP_);                       \
9d1335cc1e97cc Marco Elver      2020-07-24  1235  		}                                                                                  \
0f8ad5f2e93425 Marco Elver      2020-07-03  1236  		return __atomic_compare_exchange_n(ptr, exp, val, weak, mo, fail_mo);              \
0f8ad5f2e93425 Marco Elver      2020-07-03  1237  	}                                                                                          \
0f8ad5f2e93425 Marco Elver      2020-07-03  1238  	EXPORT_SYMBOL(__tsan_atomic##bits##_compare_exchange_##strength)
0f8ad5f2e93425 Marco Elver      2020-07-03  1239  
0f8ad5f2e93425 Marco Elver      2020-07-03  1240  #define DEFINE_TSAN_ATOMIC_CMPXCHG_VAL(bits)                                                       \
0f8ad5f2e93425 Marco Elver      2020-07-03  1241  	u##bits __tsan_atomic##bits##_compare_exchange_val(u##bits *ptr, u##bits exp, u##bits val, \
0f8ad5f2e93425 Marco Elver      2020-07-03  1242  							   int mo, int fail_mo);                   \
0f8ad5f2e93425 Marco Elver      2020-07-03  1243  	u##bits __tsan_atomic##bits##_compare_exchange_val(u##bits *ptr, u##bits exp, u##bits val, \
0f8ad5f2e93425 Marco Elver      2020-07-03  1244  							   int mo, int fail_mo)                    \
0f8ad5f2e93425 Marco Elver      2020-07-03  1245  	{                                                                                          \
0b8b0830ac1419 Marco Elver      2021-11-30  1246  		kcsan_atomic_builtin_memorder(mo);                                                 \
9d1335cc1e97cc Marco Elver      2020-07-24  1247  		if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
14e2ac8de0f91f Marco Elver      2020-07-24  1248  			check_access(ptr, bits / BITS_PER_BYTE,                                    \
9d1335cc1e97cc Marco Elver      2020-07-24  1249  				     KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE |                  \
55a55fec5015b3 Marco Elver      2021-08-09  1250  					     KCSAN_ACCESS_ATOMIC, _RET_IP_);                       \
9d1335cc1e97cc Marco Elver      2020-07-24  1251  		}                                                                                  \
0f8ad5f2e93425 Marco Elver      2020-07-03  1252  		__atomic_compare_exchange_n(ptr, &exp, val, 0, mo, fail_mo);                       \
0f8ad5f2e93425 Marco Elver      2020-07-03  1253  		return exp;                                                                        \
0f8ad5f2e93425 Marco Elver      2020-07-03  1254  	}                                                                                          \
0f8ad5f2e93425 Marco Elver      2020-07-03  1255  	EXPORT_SYMBOL(__tsan_atomic##bits##_compare_exchange_val)
0f8ad5f2e93425 Marco Elver      2020-07-03  1256  
0f8ad5f2e93425 Marco Elver      2020-07-03  1257  #define DEFINE_TSAN_ATOMIC_OPS(bits)                                                               \
0f8ad5f2e93425 Marco Elver      2020-07-03  1258  	DEFINE_TSAN_ATOMIC_LOAD_STORE(bits);                                                       \
0f8ad5f2e93425 Marco Elver      2020-07-03  1259  	DEFINE_TSAN_ATOMIC_RMW(exchange, bits, _n);                                                \
c843b93f690ae6 Dishank Jogi     2025-07-28 @1260  	DEFINE_TSAN_ATOMIC_RMW(fetch_add, bits);                                                 \
c843b93f690ae6 Dishank Jogi     2025-07-28  1261  	DEFINE_TSAN_ATOMIC_RMW(fetch_sub, bits);                                                 \
c843b93f690ae6 Dishank Jogi     2025-07-28  1262  	DEFINE_TSAN_ATOMIC_RMW(fetch_and, bits);                                                 \
c843b93f690ae6 Dishank Jogi     2025-07-28  1263  	DEFINE_TSAN_ATOMIC_RMW(fetch_or, bits);                                                  \
c843b93f690ae6 Dishank Jogi     2025-07-28  1264  	DEFINE_TSAN_ATOMIC_RMW(fetch_xor, bits);                                                 \
c843b93f690ae6 Dishank Jogi     2025-07-28  1265  	DEFINE_TSAN_ATOMIC_RMW(fetch_nand, bits);                                                \
0f8ad5f2e93425 Marco Elver      2020-07-03  1266  	DEFINE_TSAN_ATOMIC_CMPXCHG(bits, strong, 0);                                               \
0f8ad5f2e93425 Marco Elver      2020-07-03  1267  	DEFINE_TSAN_ATOMIC_CMPXCHG(bits, weak, 1);                                                 \
0f8ad5f2e93425 Marco Elver      2020-07-03  1268  	DEFINE_TSAN_ATOMIC_CMPXCHG_VAL(bits)
0f8ad5f2e93425 Marco Elver      2020-07-03  1269  
0f8ad5f2e93425 Marco Elver      2020-07-03 @1270  DEFINE_TSAN_ATOMIC_OPS(8);
0f8ad5f2e93425 Marco Elver      2020-07-03  1271  DEFINE_TSAN_ATOMIC_OPS(16);
0f8ad5f2e93425 Marco Elver      2020-07-03  1272  DEFINE_TSAN_ATOMIC_OPS(32);
353e7300a1db92 Christophe Leroy 2023-05-12  1273  #ifdef CONFIG_64BIT
0f8ad5f2e93425 Marco Elver      2020-07-03  1274  DEFINE_TSAN_ATOMIC_OPS(64);
353e7300a1db92 Christophe Leroy 2023-05-12  1275  #endif
0f8ad5f2e93425 Marco Elver      2020-07-03  1276  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
