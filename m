Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9473EC2F4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949265; cv=none; b=piqdI8L2YoSVL8E48XGoV+HZNkON+67TO4UnrcO3Nrm4/tgRYhx0E57CJoG/AAA6qondfv2FvYlZjVnqeHQYkxBzFyy7+wQrNCNlINrBBTIRQHAhhP4Sl0N5bsE3DyBfMOwwKwgZJep/l8u6zDRM1c1QkQaxSwdZ0RUxL2q0xyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949265; c=relaxed/simple;
	bh=WDiiMJa3TfFF+i8iHPr7Qv/bRTJnJrs0R3RCW+c5Sso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sf3XnnVq2ksTpTBc71FwmO69tY7g+siuyxM+5vJHyYTq6CSGhqUalrgafAElXko3gSEKwYhumHLsSBDl/gAaOQpxx/DPFjl50AMiL3iZ2Pl/Yqb4j8EesHIkbj3I+LIZAZTVYj5m3traBTIpuHV26jlmzy6isUFOYYfNSaFz+A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kyu5S7eA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kyu5S7eA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774949263; x=1806485263;
  h=date:from:to:cc:subject:message-id;
  bh=WDiiMJa3TfFF+i8iHPr7Qv/bRTJnJrs0R3RCW+c5Sso=;
  b=Kyu5S7eA+C96QanYKRppz1f8h/kwFO+8d28sh77Ay4zrgAPR0qNVn/xW
   QVUjHHdyUbbZg7qtk5NEJmSENSKdbmpky0fLwqYZKFeK//ZRnvZO7oZSi
   ApfD2cGKd/ovYapymGZ3GbjH9pMUG14Qq/8a1zoKqn34222Gwr7GN5fWv
   EvePox4Y/VFGhVj2TysXn1uUUPij77QSR5qf6oI29GloGysFjWmiB7gj0
   ACATilmiY/5PvFv2gRzX9EHRCJROv9FZo7sdGDxuw+67VJbK2O5bCiDll
   rPiBvVoZ808u1l6i/t5fAwN/BZL1eP4n4f5PcdXV0UHzq48VslftZJv3N
   Q==;
X-CSE-ConnectionGUID: TpoRhyHQTNi0ZEJjjq07TA==
X-CSE-MsgGUID: pNMDuWCAS6aycO4xBFDyfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="63509031"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="63509031"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:27:42 -0700
X-CSE-ConnectionGUID: VMVsWeLNSCO74nzLjjOsbg==
X-CSE-MsgGUID: ogdCg1EqT1Cd7KGyOi/Ycg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="227920969"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2026 02:27:41 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7VNr-000000008LJ-0hfE;
	Tue, 31 Mar 2026 09:27:39 +0000
Date: Tue, 31 Mar 2026 11:27:20 +0200
From: kernel test robot <lkp@intel.com>
To: Chunyu Hu <chuhu@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 121/130]
 tools/testing/selftests/kselftest.h:427:13: error: implicit declaration of
 function 'vasprintf'; did you mean 'vsprintf'?
Message-ID: <202603311105.ysUeYPSZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   24e341657c283c965e3bfee0baa9ed0376127973
commit: cc0b04b10a7b98fd8df2fd539177e94e0f83a5c3 [121/130] selftests: ksft_exit_fail_perror: support printf style arguments
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260331/202603311105.ysUeYPSZ-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311105.ysUeYPSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311105.ysUeYPSZ-lkp@intel.com/

Note: the akpm-mm/mm-unstable HEAD 24e341657c283c965e3bfee0baa9ed0376127973 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from za-fork.c:12:
   ../../kselftest.h: In function 'ksft_exit_fail_perror':
>> ../../kselftest.h:427:13: error: implicit declaration of function 'vasprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
     427 |         if (vasprintf(&buf, msg, args) == -1) {
         |             ^~~~~~~~~
         |             vsprintf
--
   In file included from basic-gcs.c:16:
   tools/testing/selftests/kselftest.h: In function 'ksft_exit_fail_perror':
>> tools/testing/selftests/kselftest.h:427:13: error: implicit declaration of function 'vasprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
     427 |         if (vasprintf(&buf, msg, args) == -1) {
         |             ^~~~~~~~~
         |             vsprintf


vim +427 tools/testing/selftests/kselftest.h

   419	
   420	static inline __noreturn __printf(1, 2) void ksft_exit_fail_perror(const char *msg, ...)
   421	{
   422		va_list args;
   423		char *buf = NULL;
   424		int saved_errno = errno;
   425	
   426		va_start(args, msg);
 > 427		if (vasprintf(&buf, msg, args) == -1) {
   428			va_end(args);
   429			ksft_exit_fail_msg("vasprintf failed: %s (%d)\n", strerror(saved_errno),
   430					saved_errno);
   431		}
   432		va_end(args);
   433	
   434		errno = saved_errno;
   435		ksft_exit_fail_msg("%s: %s (%d)\n", buf, strerror(errno), errno);
   436	
   437		free(buf);
   438	}
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
