Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600459;
	b=zRgHOmAJLHUPWqal+azVl+ci3NvWg1ilNDkoxAKYtfxmp/dvpoKLtkswyPItNiwfgiU6
	 ElmyGojcSfFuThfjCW3twctKASAYbTR8yE34S3UspAKjuwWNDIgfkiImPGtOR8CbDHfAw
	 nkDIr4FnB3xVyIv9S09KLAA8lQBFLHVCxw04geM0DE6RS5h2WVzYLa/yqzRI0hHirpu68
	 /WYGwQDXqf5OPNFoLiysRm+zwGLIfn/0+j9OHeWCw2hQ7DFYRfHnNkZNauevTf3onzHR/
	 dIbeX+hhPJ8Jl3cJxc9A+il9kLg1f0fw5MkAu2PFqWUZSD3vYfD/gtgQwR1EAYUkthA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600459;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9RoxGEGOsDprKO7p3zqnID+lbf+XE/1KRjobWgSrEvE=;
	b=HDQGjP0yZZFR98TN1o8DmuSvyJ/VaO7wirRWBK3e0LKrcE7xsxdw9sbc0TGSc59xcP5f
	 XlJla6Agy0pfF3Fs89fMQz9qCF9XaJ5++gIjYnUAacRPZk9gjl9zWufxeX+Y64Cp5/rq3
	 38R7TaHZShfQBHi5So+LrpfuVwANoPJiFQIKw6EHx7MUTPeS74G8BFa8uhwAbLlPxlrdX
	 e4Yd8REMc3OwmVGSXoG4z+AbQMMFX6slVVxDfsCTZ823yX5c+M3l18fHj6tGITRvXlM4b
	 BDtDiP9Ga0eowxmw0I0PnQ1WMF7k982K8YfjidW8b9ThtlqEFLrQaYWaZCJtY+DMfFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VtYdeST3;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE06606A337
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 20:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE06606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VtYdeST3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794600459; x=1826136459;
  h=date:from:to:cc:subject:message-id;
  bh=rf95/Fz/WwCVjJ6l9WhMvZCgHX5XTk9DT7xjV47iWbw=;
  b=VtYdeST31ZVSwVGONCocMAPw1zzJphUYX3z4PeXx67Rdx9MhfglVy3h8
   vOxW5IJdazV3f6MOBc1liTFk8UAcEiwxg9EfKSQ5YKVfhsTi6GnbXJLrD
   X5wMKUaSCRsrtm/bTY8HZrWS4d/76kCzb7w8KBbcSvZIsQEEAodGFtKVQ
   t/shzTi74sImUFOEQCKfD25OxYHJxGGzacKgo60oZ/bwY3coptkVRpN7m
   Z1LFPHoh4xPNRBquzL82LK1QecEfrK/bPBppZwfALNuxjo06f7EhqhjC/
   YdpPkYCX9IlowGc+w6V3ftr2E+LNJKRCEGYu4qp+WRUgLBQJT5uVIyRM/
   A==;
X-CSE-ConnectionGUID: wYNxbJ1tRP2+yG1/g1LYBw==
X-CSE-MsgGUID: Dc9EQAt+Tamc2xGnkkXjGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3493960"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3493960"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 12:07:38 -0800
X-CSE-ConnectionGUID: r5YoDvmIRGef6PRJgoGmpA==
X-CSE-MsgGUID: 2PWnjdi/TBKmWYvYe+rApA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9347806"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 12:07:36 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRxYc-000000001Kn-004f;
	Fri, 13 Nov 2026 20:07:34 +0000
Date: Fri, 13 Nov 2026 21:06:48 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_2 48/68]
 lib/ctlv/tests/message_kunit.c:1019:1: warning: the frame size of 1424 bytes
 is larger than 1280 bytes
Message-ID: <202611132110.tXB2eFKs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 3e5d2a45aaa3688da1de5a2430c2993c39451793 [48/68] ctlv: Add KUnit tests
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261113/202611132110.tXB2eFKs-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611132110.tXB2eFKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611132110.tXB2eFKs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_the_bit_where_it_means_nothing':
>> lib/ctlv/tests/message_kunit.c:1019:1: warning: the frame size of 1424 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1019 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_inner_fill_optionality_is_inherited':
   lib/ctlv/tests/message_kunit.c:617:1: warning: the frame size of 1436 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     617 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_an_enum_ext_takes_its_familys_values':
   lib/ctlv/tests/message_kunit.c:333:1: warning: the frame size of 1460 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     333 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_indexed_access_does_not_rescan':
   lib/ctlv/tests/message_kunit.c:868:1: warning: the frame size of 1644 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     868 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_as_deep_as_the_core_allows':
   lib/ctlv/tests/message_kunit.c:1090:1: warning: the frame size of 1428 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1090 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_one_record_deeper':
   lib/ctlv/tests/message_kunit.c:1102:1: warning: the frame size of 1428 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1102 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_message_it_accepts':
   lib/ctlv/tests/message_kunit.c:237:1: warning: the frame size of 1420 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     237 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_nothing_inside_an_ignored_tlv':
   lib/ctlv/tests/message_kunit.c:997:1: warning: the frame size of 1444 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     997 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_tlv_a_caller_can_do_without':
   lib/ctlv/tests/message_kunit.c:909:1: warning: the frame size of 1428 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     909 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_tlv_a_record_can_do_without':
   lib/ctlv/tests/message_kunit.c:928:1: warning: the frame size of 1420 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     928 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_bit_no_version_declares':
   lib/ctlv/tests/message_kunit.c:1041:1: warning: the frame size of 1428 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1041 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_required_field_precedes_a_split_run':
   lib/ctlv/tests/message_kunit.c:690:1: warning: the frame size of 1424 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     690 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_field_declared_somewhere_else':
   lib/ctlv/tests/message_kunit.c:972:1: warning: the frame size of 1428 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     972 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_tlv_nobody_asked_to_ignore':
   lib/ctlv/tests/message_kunit.c:950:1: warning: the frame size of 1424 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     950 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_run_is_local_to_its_record':
   lib/ctlv/tests/message_kunit.c:783:1: warning: the frame size of 1432 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     783 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_cardinality_precedes_a_split_run':
   lib/ctlv/tests/message_kunit.c:711:1: warning: the frame size of 1432 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     711 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_missing_field_is_named':
   lib/ctlv/tests/message_kunit.c:262:1: warning: the frame size of 1424 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     262 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_bad_tlv_is_located':
   lib/ctlv/tests/message_kunit.c:290:1: warning: the frame size of 1424 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     290 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_the_occurrence_too_many':
   lib/ctlv/tests/message_kunit.c:406:1: warning: the frame size of 1424 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     406 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_an_unknown_type_splits_a_run':
   lib/ctlv/tests/message_kunit.c:762:1: warning: the frame size of 1432 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     762 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_record_is_located_too':
   lib/ctlv/tests/message_kunit.c:383:1: warning: the frame size of 1436 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     383 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_split_occurrence_run':
   lib/ctlv/tests/message_kunit.c:672:1: warning: the frame size of 1428 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     672 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_malformed_record':
   lib/ctlv/tests/message_kunit.c:430:1: warning: the frame size of 1444 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     430 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_header_enum_starts_at_zero':
   lib/ctlv/tests/message_kunit.c:357:1: warning: the frame size of 1432 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     357 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_contiguous_occurrences':
   lib/ctlv/tests/message_kunit.c:649:1: warning: the frame size of 1432 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     649 | }
         | ^
   lib/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_tlv_error_precedes_a_split_run':
   lib/ctlv/tests/message_kunit.c:741:1: warning: the frame size of 1436 bytes is larger than 1280 bytes [-Wframe-larger-than=]


vim +1019 lib/ctlv/tests/message_kunit.c

   998	
   999	/*
  1000	 * Being forgiven is a caller's to ask for. An output says what this kernel
  1001	 * knows, so the bit means nothing there and is one it does not declare.
  1002	 */
  1003	static void ctlv_msg_test_the_bit_where_it_means_nothing(struct kunit *test)
  1004	{
  1005		struct ctlv_error error;
  1006		struct ctlv_msg_test_msg msg;
  1007		u32 unknown;
  1008	
  1009		ctlv_msg_test_msg_init(&msg);
  1010		ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_U, 1);
  1011		unknown = ctlv_msg_test_msg_ignorable(&msg, CTLV_MSG_TEST_T_FOREIGN, 7);
  1012		KUNIT_EXPECT_EQ(test, -EINVAL,
  1013				ctlv_msg_test_validate_reply(&msg,
  1014					       ctlv_msg_test_request_tree(CTLV_FIXTURE_OP_OPTIONAL_CHECK),
  1015					       &error));
  1016		KUNIT_EXPECT_EQ(test, CTLV_VALIDATION_REASON_UNKNOWN_FLAG,
  1017				error.reason);
  1018		KUNIT_EXPECT_EQ(test, unknown, error.bad_tlv_offset);
> 1019	}
  1020	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
