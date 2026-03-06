Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B9E3AEF3F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809922; cv=none; b=dFYHLskHacTMShMN41x4cmlvQcONLZ5BILQWSuSQ8j2g/szsRs/VwijZEQQxrpy1jqKVRpkiFeinpF20+3peAsAM01yZ2yk/TcaDLkSEoLG14BLYD6urp4bYlsLiV5xb9Trpg5qKuX6q8osmNzVMSCxLz31e/b0Qdba9+e9PF+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809922; c=relaxed/simple;
	bh=t0TlLWbz/aY3lSdzXQMtedk3plF2FDVR0HnYEkLPrgY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DGfal6cATsrx2zq90K3P4D7CV8b5JzDYdp6VErEfN+K5yoXgdv7JSahEc/IoQGRQ2Ardttyhgv5UEwomW/rJcyUzKO74GJOuKhexxpPxum281qi0AtnlMllJLE+cOrfXzcTqJ9pTvu6qw6kyMY5i+z5xB440LG5cnjy1mrQimiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmCk6O18; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmCk6O18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772809919; x=1804345919;
  h=date:from:to:cc:subject:message-id;
  bh=t0TlLWbz/aY3lSdzXQMtedk3plF2FDVR0HnYEkLPrgY=;
  b=GmCk6O18jEJk5d3T0keqwGnawyX4LbD/UEiUWyRbQT1wvYQ1jTTPwMBf
   WJwo8mNq1qAEHlr7hmzsWZdn5AreOpQn5R5Keqm9FIDNLilv+7oTPzhM/
   +u8mQ2Qp1lo7Q2NyqYCXXBQ7JTqNc83Q085jNU2/2Zbbyb5/1JF+dQO2o
   Ext9xfApbMyU45QA2YtcImRJZM+qwou+jfgMiKcywA4DLFg94tIcs3qsN
   lYWHQ9pI5b5tm0dQ+LximRunrTOfG5+6mCriLVONNQyRKjHUSrpKa5hRx
   bkstu902DbAmMKKas54y9rI1jaTM9ijmV4HJ8yR+Oc8E1oW7r14EXrhcV
   Q==;
X-CSE-ConnectionGUID: LC3AcfsLRvyZN4TAMmydQg==
X-CSE-MsgGUID: ZqbxVnmkTO+i/bFeHM/jbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77520574"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77520574"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:11:58 -0800
X-CSE-ConnectionGUID: xPHutIWcSdCqE+ttW4Iarw==
X-CSE-MsgGUID: 6oVhx+abR1iIvT97Ogwb0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="215715006"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2026 07:11:57 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyWqJ-000000002Gb-20UO;
	Fri, 06 Mar 2026 15:11:55 +0000
Date: Fri, 06 Mar 2026 16:11:20 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_mark_userns 10/10]
 tools/testing/selftests/filesystems/fanotify/ns-notify_test.c:56:undefined
 reference to `setup_userns'
Message-ID: <202603061614.yTWI4Dg5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux fan_mark_userns
head:   4d7cad2f077449767de4cc8ab6d869f080a121a2
commit: 4d7cad2f077449767de4cc8ab6d869f080a121a2 [10/10] selftests/filesystems: add fanotify namespace notifications test
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260306/202603061614.yTWI4Dg5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061614.yTWI4Dg5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061614.yTWI4Dg5-lkp@intel.com/

Note: the amir73il/fan_mark_userns HEAD 4d7cad2f077449767de4cc8ab6d869f080a121a2 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from ns-notify_test.c:21:
   ns-notify_test.c: In function 'userns_notify_create_delete_uts':
>> tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:757:9: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
     757 |         for (; _metadata->trigger; _metadata->trigger = \
         |         ^~~
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:806:14: note: in expansion of macro 'OPTIONAL_HANDLER'
     806 | } while (0); OPTIONAL_HANDLER(_assert)
         |              ^~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:519:9: note: in expansion of macro '__EXPECT'
     519 |         __EXPECT(expected, #expected, seen, #seen, ==, 1)
         |         ^~~~~~~~
   ns-notify_test.c:145:9: note: in expansion of macro 'ASSERT_EQ'
     145 |         ASSERT_EQ(create_owner, self->userns_nsid);
         |         ^~~~~~~~~
   ns-notify_test.c:148:9: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'for'
     148 |         {
         |         ^
   /usr/bin/ld: /tmp/ccbFYyLi.o: in function `userns_notify_setup':
>> tools/testing/selftests/filesystems/fanotify/ns-notify_test.c:56:(.text+0xe01): undefined reference to `setup_userns'
   collect2: error: ld returned 1 exit status


vim +56 tools/testing/selftests/filesystems/fanotify/ns-notify_test.c

    51	
    52	FIXTURE_SETUP(userns_notify)
    53	{
    54		int ret;
    55	
  > 56		ret = setup_userns();
    57		ASSERT_EQ(ret, 0);
    58	
    59		self->userns_fd = open("/proc/self/ns/user", O_RDONLY);
    60		ASSERT_GE(self->userns_fd, 0);
    61	
    62		self->userns_nsid = get_ns_id(self->userns_fd);
    63		ASSERT_NE(self->userns_nsid, 0);
    64	
    65		self->fan_fd = fanotify_init(FAN_REPORT_NSID, 0);
    66		ASSERT_GE(self->fan_fd, 0);
    67	
    68		ret = fanotify_mark(self->fan_fd, FAN_MARK_ADD | FAN_MARK_USERNS,
    69				    FAN_CREATE | FAN_DELETE,
    70				    self->userns_fd, NULL);
    71		ASSERT_EQ(ret, 0);
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
