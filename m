Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4AC2556E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 06:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771049280; cv=none; b=J9TLgkGe7Z5EEccKgAVYfNt+S/PguDC4pwKDEKICxkUa9xNrrX5tpCJR/q5eVTjKliZhjrQoW9HQA+S0MBFb6FksElFHkRQMSSfKfcwg+174tTXOQQI1WtGrw23k0pXyqyYLVSiIOpT/86yJd1rcRh+fS4UhTJ21OroOuQQGeeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771049280; c=relaxed/simple;
	bh=IGKa42nsywCL4/RfuIAFDvXFWWy+IVTktuQ3GFSXscM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jDhtBbAyqjh/owuBH3pER0liLfnO8te8wXme+s9kgEnXVDP4WRv/iEwZiD6FQb3be/aUbwDXkem7TZXyMHevB1TwTmvcLmeowQ+2SjhQ2C5EuSMYcLVMfvefPPBCfs+A/5/XuNgAfSFcWdQsJ/0i7/6KNPFJyt91FY+rInR2gM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIe0l1Ga; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIe0l1Ga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771049278; x=1802585278;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IGKa42nsywCL4/RfuIAFDvXFWWy+IVTktuQ3GFSXscM=;
  b=EIe0l1Gae8ZNWV+pM9yOIqIkioQAIr4jMmLT3G4Q/4gRFL3V8gA4UZcf
   wqrs+IvN8QyLYwaNIDuST+eyEKxB2Qsc+T0GzQKn0r55rF7q9wx/Zz9+L
   GOl6SkUiWzoOCyb1pQFli0sSFAxJT5qggWp7UMt2Bo7AhMkZWeSELUscv
   rLleOJYbJcrwRNggJjR4Ei+Upd+cJMrZM8yOCMsDxUf+wsayzlGZJjdaL
   srQ06Ic4zUFZcCZPikedqU6C12g1Lff902FY9jtgcD786VIIvzUQa9oAE
   wAZnoiouy9IQIWTBOYGLt73BT2/53HEecuwRoQiemzam1Q3tWQG40d1x0
   w==;
X-CSE-ConnectionGUID: iQXe1r1LRBqaGJJWXghl4g==
X-CSE-MsgGUID: fQcFp+qcRQ6/WRaOdNHS5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="59796837"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="59796837"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 22:07:58 -0800
X-CSE-ConnectionGUID: Uo1L4ofhRu+aVLwHTMgZSg==
X-CSE-MsgGUID: 3CKVyPSYQiWJdsZnpk6QDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="250776319"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2026 22:07:55 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr8or-000000001mv-2JAh;
	Sat, 14 Feb 2026 06:07:53 +0000
Date: Sat, 14 Feb 2026 07:07:30 +0100
From: kernel test robot <lkp@intel.com>
To: "Bala-Vignesh-Reddy" <reddybalavignesh9979@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Wei Yang <richard.weiyang@gmail.com>
Subject: 
 =?us-ascii?Q?tools/testing/selftests/../../../tools/testing/selftests/kse?=
 =?us-ascii?Q?lftest=5Fharness.h:107:40:?= warning: format '%llx' expects
 argument of type 'long long unsigned int', but argument 6 has type '__u64'
 {aka 'long unsigned int'}
Message-ID: <202602140755.vIpuPels-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   770aaedb461a055f79b971d538678942b6607894
commit: e6fbd1759c9ece5044d3470f30a5e2166dc9de89 selftests: complete kselft=
est include centralization
date:   3 months ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/=
20260214/202602140755.vIpuPels-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260214/202602140755.vIpuPels-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140755.vIpuPels-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from common.h:20,
                    from audit_test.c:22:
   audit_test.c: In function 'audit_layers':
>> tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:107:40: warning: format '%llx' expects argument of type 'long long uns=
igned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wfo=
rmat=3D]
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:102:17: note: in expansion of macro '__TH_LOG'
     102 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   audit_test.c:152:25: note: in expansion of macro 'TH_LOG'
     152 |                         TH_LOG("Failed to match domain %llx (#%d=
)",
         |                         ^~~~~~
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gn=
u/bin/ld: cannot find -lcap: No such file or directory
   collect2: error: ld returned 1 exit status
--
   In file included from common.h:20,
                    from net_test.c:24:
   net_test.c: In function 'mini_network_access_rights':
>> tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:107:40: warning: format '%llx' expects argument of type 'long long uns=
igned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wfo=
rmat=3D]
     107 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:102:17: note: in expansion of macro '__TH_LOG'
     102 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   net_test.c:1332:25: note: in expansion of macro 'TH_LOG'
    1332 |                         TH_LOG("Failed to add rule with access 0=
x%llx: %s",
         |                         ^~~~~~
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gn=
u/bin/ld: cannot find -lcap: No such file or directory
   collect2: error: ld returned 1 exit status


vim +107 tools/testing/selftests/../../../tools/testing/selftests/kselftest=
_harness.h

1256a525573120 tools/testing/selftests/kselftest_harness.h    Micka=C3=ABl =
Sala=C3=BCn 2017-05-26  104 =20
1256a525573120 tools/testing/selftests/kselftest_harness.h    Micka=C3=ABl =
Sala=C3=BCn 2017-05-26  105  /* Unconditional logger for internal use. */
1256a525573120 tools/testing/selftests/kselftest_harness.h    Micka=C3=ABl =
Sala=C3=BCn 2017-05-26  106  #define __TH_LOG(fmt, ...) \
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook    =
  2020-06-22 @107  		fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
1256a525573120 tools/testing/selftests/kselftest_harness.h    Micka=C3=ABl =
Sala=C3=BCn 2017-05-26  108  			__FILE__, __LINE__, _metadata->name, ##__VA=
_ARGS__)
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
  2015-06-16  109 =20

:::::: The code at line 107 was first introduced by commit
:::::: e80068be21824e4d2726eeea41cac6178d212415 selftests/harness: Switch t=
o TAP output

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
