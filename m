Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB96C1373
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 00:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766622680; cv=none; b=mdp+euY/IxrrRXT+g60RtNGTiqIUBvdrc5ITj+3o76XLk/9AQgdslL09fVZ+HTHGY5QFtQpV9jNtQmTzblTE/DsBjbmiP0WUzCR2+7TK+hOOfK+zye/MLYau097dOW+LqwVpEdwaRiklU5ekX5Zd1aQHb4e1j2jPf9BrgyZ41Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766622680; c=relaxed/simple;
	bh=YtHLGZo1gSgsjV4OeLsbzue0f87z+WWz4MVwCQfOVCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpZ6a6UkXzcB6dSS8tewmgKeyCzArrlS/erepJ7bOPagNC6FteIkwJpUa7h96UyhXC2/PoGX36RduyNiFJfDta68H4NriNnEedJaW2maz+P3TwxhDPqrFeLKirK/2hLGrY2bgjozryNTRQZonkiYCmEcPpt/wxxoEwUgly79/3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrElveOU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrElveOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766622678; x=1798158678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YtHLGZo1gSgsjV4OeLsbzue0f87z+WWz4MVwCQfOVCk=;
  b=VrElveOUooeL/c3Dp8WDlkUKkZ3oKRk/UeMtJitFnr6jttUeL5dUXUCa
   N0PwFObIqmBXGojHkPFhs4S2t0GCxA1tAl2ayLx8NYYDdCviMAnTcRrgd
   QJr1R5xz4lfZ2bKIby3Dnu5cdnlvSpFot4IIKqOx54VZkVAudNMLNcq7w
   Dcn1i/Ryfu9OU879pOhei3BEuaDeg1h6QtigCpTUOsy3roi4ZTDZ6Aw4q
   DYpFe0pk74+Ns1cBwv/k/Q3CVSwy7PW1Lp2kbw8gEfKddvEj/gC+xFlcx
   FjbkU7hu4tU+xxy4WKBpNZmIR4cpHtTULQGsBT2LBASnJT/M+CkXAiiGa
   Q==;
X-CSE-ConnectionGUID: juSfqnfzTw+Ux5fxXhGvWQ==
X-CSE-MsgGUID: 4nBFKPlQS52+ak0E1Ttwgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68329755"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="68329755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 16:31:17 -0800
X-CSE-ConnectionGUID: gnStMpddSiSoZUOoZrq6iA==
X-CSE-MsgGUID: Y1ZDmXJ4SBi13YbkBdni4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="199265067"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Dec 2025 16:31:16 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYZG5-000000003Zx-2d4E;
	Thu, 25 Dec 2025 00:31:13 +0000
Date: Thu, 25 Dec 2025 08:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Maurer <fmaurer@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net 5/6] hsr: Implement more robust duplicate discard for
 PRP
Message-ID: <202512250802.ZQJct8ti-lkp@intel.com>
References: <af4bd23b0a4b417b9ce26d77c1d153cfaf78ec64.1766433800.git.fmaurer@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af4bd23b0a4b417b9ce26d77c1d153cfaf78ec64.1766433800.git.fmaurer@redhat.com>

Hi Felix,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Maurer/selftests-hsr-Add-ping-test-for-PRP/20251223-050252
base:   net/main
patch link:    https://lore.kernel.org/r/af4bd23b0a4b417b9ce26d77c1d153cfaf78ec64.1766433800.git.fmaurer%40redhat.com
patch subject: [RFC net 5/6] hsr: Implement more robust duplicate discard for PRP
config: csky-randconfig-r072-20251225 (https://download.01.org/0day-ci/archive/20251225/202512250802.ZQJct8ti-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250802.ZQJct8ti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250802.ZQJct8ti-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/hsr/prp_dup_discard_test.c: In function 'build_prp_test_data':
>> net/hsr/prp_dup_discard_test.c:23:19: error: 'struct hsr_node' has no member named 'seq_start'
      23 |         data->node.seq_start[HSR_PT_SLAVE_A] = 1;
         |                   ^
>> net/hsr/prp_dup_discard_test.c:24:19: error: 'struct hsr_node' has no member named 'seq_expected'
      24 |         data->node.seq_expected[HSR_PT_SLAVE_A] = 1;
         |                   ^
   net/hsr/prp_dup_discard_test.c:25:19: error: 'struct hsr_node' has no member named 'seq_start'
      25 |         data->node.seq_start[HSR_PT_SLAVE_B] = 1;
         |                   ^
   net/hsr/prp_dup_discard_test.c:26:19: error: 'struct hsr_node' has no member named 'seq_expected'
      26 |         data->node.seq_expected[HSR_PT_SLAVE_B] = 1;
         |                   ^
   In file included from net/hsr/prp_dup_discard_test.c:2:
   net/hsr/prp_dup_discard_test.c: In function 'check_prp_counters':
   net/hsr/prp_dup_discard_test.c:39:41: error: 'struct hsr_node' has no member named 'seq_start'
      39 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_A],
         |                                         ^
   include/kunit/test.h:839:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1035:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1035 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   net/hsr/prp_dup_discard_test.c:39:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      39 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_A],
         |         ^~~~~~~~~~~~~~~
   net/hsr/prp_dup_discard_test.c:39:41: error: 'struct hsr_node' has no member named 'seq_start'
      39 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_A],
         |                                         ^
   include/kunit/test.h:839:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1035:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1035 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   net/hsr/prp_dup_discard_test.c:39:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      39 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_A],
         |         ^~~~~~~~~~~~~~~
   net/hsr/prp_dup_discard_test.c:41:41: error: 'struct hsr_node' has no member named 'seq_start'
      41 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_B],
         |                                         ^
   include/kunit/test.h:839:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1035:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1035 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   net/hsr/prp_dup_discard_test.c:41:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      41 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_B],
         |         ^~~~~~~~~~~~~~~
   net/hsr/prp_dup_discard_test.c:41:41: error: 'struct hsr_node' has no member named 'seq_start'
      41 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_B],
         |                                         ^
   include/kunit/test.h:839:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1035:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1035 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   net/hsr/prp_dup_discard_test.c:41:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      41 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_B],
         |         ^~~~~~~~~~~~~~~
   net/hsr/prp_dup_discard_test.c:43:41: error: 'struct hsr_node' has no member named 'seq_expected'
      43 |         KUNIT_EXPECT_EQ(test, data->node.seq_expected[HSR_PT_SLAVE_A],
         |                                         ^
   include/kunit/test.h:839:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1035:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1035 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   net/hsr/prp_dup_discard_test.c:43:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      43 |         KUNIT_EXPECT_EQ(test, data->node.seq_expected[HSR_PT_SLAVE_A],
         |         ^~~~~~~~~~~~~~~
   net/hsr/prp_dup_discard_test.c:43:41: error: 'struct hsr_node' has no member named 'seq_expected'
      43 |         KUNIT_EXPECT_EQ(test, data->node.seq_expected[HSR_PT_SLAVE_A],
         |                                         ^
   include/kunit/test.h:839:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1035:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1035 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   net/hsr/prp_dup_discard_test.c:43:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      43 |         KUNIT_EXPECT_EQ(test, data->node.seq_expected[HSR_PT_SLAVE_A],
         |         ^~~~~~~~~~~~~~~


vim +23 net/hsr/prp_dup_discard_test.c

814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  13  
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  14  static struct prp_test_data *build_prp_test_data(struct kunit *test)
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  15  {
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  16  	struct prp_test_data *data = kunit_kzalloc(test,
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  17  		sizeof(struct prp_test_data), GFP_USER);
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  18  	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, data);
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  19  
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  20  	data->frame.node_src = &data->node;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  21  	data->frame.port_rcv = &data->port_rcv;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  22  	data->port_rcv.type = HSR_PT_SLAVE_A;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07 @23  	data->node.seq_start[HSR_PT_SLAVE_A] = 1;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07 @24  	data->node.seq_expected[HSR_PT_SLAVE_A] = 1;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  25  	data->node.seq_start[HSR_PT_SLAVE_B] = 1;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  26  	data->node.seq_expected[HSR_PT_SLAVE_B] = 1;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  27  	data->node.seq_out[HSR_PT_MASTER] = 0;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  28  	data->node.time_out[HSR_PT_MASTER] = jiffies;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  29  	data->port.type = HSR_PT_MASTER;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  30  
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  31  	return data;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  32  }
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
