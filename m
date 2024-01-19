Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3276628DD2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705681993; cv=none; b=joHxYcHir6wYHPOqX/Vjs7sN8DcvENmIamtTuxjjOiOQC5g3EiTvta8LzC1K1kAk6aPr9Xl0cfBjtO/+BpXEyl8BOpCVp4qoJQ38mYebFrsxmTCPKJBBXpCSNyvqotOq+/aEVlpH3lo8Gmk1+by0VEleoLv8oVXGjI6pWColIUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705681993; c=relaxed/simple;
	bh=dKS5npDIjAK35M70cYpT+7Wv4sNBpWTGv1pyRXc7OWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fWP2T+6i/2r3jXfBzFhjFIu2gUPQST0vWAGtkYkiM9Z6goGM1Cc2Q+HDZVXLveX3s8xuptzZe2HIVNUhrtbrEfcY4ThLMPduu9BPr/0ojJ1VY/GSQ1RiGzCxRymhqbPRYHx6dTBK5OdTG7QjJe5wH5d9Ggnpv6t2YybUWOLULBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lV1gPslP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lV1gPslP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705681991; x=1737217991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dKS5npDIjAK35M70cYpT+7Wv4sNBpWTGv1pyRXc7OWo=;
  b=lV1gPslP1OdTOvySSlAXhy3cQXtoKDIfaRJJr6rqqCu59+TLyVcc7B11
   DagPhtnA/Um7W3HgDPJysdEfhFW0G3azQve2k2LKCN+g4LEYEx8lhF6pB
   qO90sVemZIias/RXfgfAC185JYGR+SJGGEpbOsVx+/B8nHKQEaSXtOa9b
   mTennTIVYOjexQSRVyzSVosbtDfQla/dh4147usvffixVh7cZTPGzx5s/
   eOrw1kKqnQ82pZL5Vdbx2wWtDpN7XTdRsiyW/9GgQUsrT8dDSxHJlh9T/
   nqROYzbVFiiySxjqBiusDiQVK/eQpbdLKEfX+08ST3NPN+dQnu30/rCS7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14304864"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="14304864"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 08:33:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="691322"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jan 2024 08:33:09 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQrnm-0004Fw-2O;
	Fri, 19 Jan 2024 16:33:06 +0000
Date: Sat, 20 Jan 2024 00:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [linux-next:master 13664/13959] lib/checksum_kunit.c:616:17: sparse:
 sparse: incorrect type in argument 5 (different base types)
Message-ID: <202401200016.e774FjBx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad5c60d66016e544c51ed98635a74073f761f45d
commit: 6f4c45cbcb00d649475a3099235e5b4fce569b4b [13664/13959] kunit: Add tests for csum_ipv6_magic and ip_fast_csum
config: x86_64-randconfig-121-20240119 (https://download.01.org/0day-ci/archive/20240120/202401200016.e774FjBx-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200016.e774FjBx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200016.e774FjBx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/checksum_kunit.c:442:33: sparse:     got int
   lib/checksum_kunit.c:442:41: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:442:41: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:442:41: sparse:     got int
   lib/checksum_kunit.c:442:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:442:49: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:442:49: sparse:     got int
   lib/checksum_kunit.c:442:57: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:442:57: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:442:57: sparse:     got int
   lib/checksum_kunit.c:442:65: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:442:65: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:442:65: sparse:     got int
   lib/checksum_kunit.c:442:73: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:442:73: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:442:73: sparse:     got int
   lib/checksum_kunit.c:443:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:9: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:9: sparse:     got int
   lib/checksum_kunit.c:443:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:17: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:17: sparse:     got int
   lib/checksum_kunit.c:443:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:25: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:25: sparse:     got int
   lib/checksum_kunit.c:443:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:33: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:33: sparse:     got int
   lib/checksum_kunit.c:443:41: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:41: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:41: sparse:     got int
   lib/checksum_kunit.c:443:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:49: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:49: sparse:     got int
   lib/checksum_kunit.c:443:57: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:57: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:57: sparse:     got int
   lib/checksum_kunit.c:443:65: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:65: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:65: sparse:     got int
   lib/checksum_kunit.c:443:73: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:73: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:73: sparse:     got int
   lib/checksum_kunit.c:444:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:9: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:9: sparse:     got int
   lib/checksum_kunit.c:444:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:17: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:17: sparse:     got int
   lib/checksum_kunit.c:444:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:25: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:25: sparse:     got int
   lib/checksum_kunit.c:444:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:33: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:33: sparse:     got int
   lib/checksum_kunit.c:444:41: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:41: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:41: sparse:     got int
   lib/checksum_kunit.c:444:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:49: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:49: sparse:     got int
   lib/checksum_kunit.c:444:57: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:57: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:57: sparse:     got int
   lib/checksum_kunit.c:444:65: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:65: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:65: sparse:     got int
   lib/checksum_kunit.c:444:73: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:73: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:73: sparse:     got int
   lib/checksum_kunit.c:445:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:9: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:9: sparse:     got int
   lib/checksum_kunit.c:445:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:17: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:17: sparse:     got int
   lib/checksum_kunit.c:445:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:25: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:25: sparse:     got int
   lib/checksum_kunit.c:445:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:33: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:33: sparse:     got int
   lib/checksum_kunit.c:445:41: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:41: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:41: sparse:     got int
   lib/checksum_kunit.c:445:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:49: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:49: sparse:     got int
   lib/checksum_kunit.c:445:57: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:57: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:57: sparse:     got int
   lib/checksum_kunit.c:445:65: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:65: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:65: sparse:     got int
   lib/checksum_kunit.c:445:73: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:73: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:73: sparse:     got int
   lib/checksum_kunit.c:446:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:446:9: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:446:9: sparse:     got int
>> lib/checksum_kunit.c:616:17: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int [assigned] csum @@
   lib/checksum_kunit.c:616:17: sparse:     expected restricted __wsum [usertype] csum
   lib/checksum_kunit.c:616:17: sparse:     got unsigned int [assigned] csum
>> lib/checksum_kunit.c:616:17: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int [assigned] csum @@
   lib/checksum_kunit.c:616:17: sparse:     expected restricted __wsum [usertype] csum
   lib/checksum_kunit.c:616:17: sparse:     got unsigned int [assigned] csum

vim +616 lib/checksum_kunit.c

   593	
   594	static void test_csum_ipv6_magic(struct kunit *test)
   595	{
   596		const struct in6_addr *saddr;
   597		const struct in6_addr *daddr;
   598		unsigned int len;
   599		unsigned char proto;
   600		unsigned int csum;
   601	
   602		const int daddr_offset = sizeof(struct in6_addr);
   603		const int len_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr);
   604		const int proto_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr) +
   605				     sizeof(int);
   606		const int csum_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr) +
   607				    sizeof(int) + sizeof(char);
   608	
   609		for (int i = 0; i < NUM_IPv6_TESTS; i++) {
   610			saddr = (const struct in6_addr *)(random_buf + i);
   611			daddr = (const struct in6_addr *)(random_buf + i +
   612							  daddr_offset);
   613			len = *(unsigned int *)(random_buf + i + len_offset);
   614			proto = *(random_buf + i + proto_offset);
   615			csum = *(unsigned int *)(random_buf + i + csum_offset);
 > 616			CHECK_EQ(expected_csum_ipv6_magic[i],
   617				 csum_ipv6_magic(saddr, daddr, len, proto, csum));
   618		}
   619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
