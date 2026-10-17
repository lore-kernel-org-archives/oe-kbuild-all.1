Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032584CF474
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792245574; cv=none; b=d+KIY3BUEHE4VMrbl2KdupH8EQM2U64A8Bxhef4q1afjmsmZAEHqztvtHw81ktAkF54eV8mJLwj/3XwqDZQdPIOmRo56vC6hHLH6FBUiOgpaiwedx6/EKmdyK9nVbSZ65VJdFbKOJJ9JiUSMNdxz4rnzV+ddX2c7vh04sIqZmY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792245574; c=relaxed/simple;
	bh=fVhNTpjblI9h9YySUqWj/2CDn+3rgOxZ7pLvDWqwjnI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TjhuVEdoMRx7yfH1H/AtHA/X8S+V1Y6RzbVk1PYWAtD6cJdS+469++hsdduK2sUaWqQFqR2a/Brukf6Slf0ogkGZihXWDVXDBRNXNSbCeaVBU4hudaq/9WY+hFHKwKusDyJt36TLUQnihryjD1f1urc9V593N5gLWa9lMKzMGUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=go3DwnAu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="go3DwnAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792245571; x=1823781571;
  h=date:from:to:cc:subject:message-id;
  bh=fVhNTpjblI9h9YySUqWj/2CDn+3rgOxZ7pLvDWqwjnI=;
  b=go3DwnAuvbXli6zFwHe3lhMzDKFYLULBQbZcJKPd2QGtwdx9IAuCbVlq
   9B3sDMqmbEd3Wq9JCrckX3v6iTDKYalNoMICR8kjXWZWFZo9C9VovUcoq
   oGuX3sczl5OPydK4vJD1Pk2wOi9bimktDzrQWebbHzojUlpp9psqIW/30
   EOcBWw9xuDdlU2FXUw1y2fR38BqZJjZDZc2JTH8D46KXN/zyRNSeIxwX+
   44RtLPd43ItrLGh8PGi8DFAf6hj8/38cyksBkmRRxfneKupfGEIn3Pdui
   vrbRRufLfj2caThm169wAs4MN/upuRLJcRKD8y9EQB/wm/FUs2kiWPB9X
   Q==;
X-CSE-ConnectionGUID: heyMzRjIToCnUghRO9ntQg==
X-CSE-MsgGUID: N1md74vUSUyli17gY4WcPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="901709"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="901709"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 06:59:31 -0700
X-CSE-ConnectionGUID: RPGazKBCQSGoJVUvzo1znA==
X-CSE-MsgGUID: jbEkTn/ARvi0SneKU6L3tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="3912356"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 17 Oct 2026 06:59:28 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI4wY-00000000JP4-1pNP;
	Sat, 17 Oct 2026 13:59:26 +0000
Date: Sat, 17 Oct 2026 21:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_1 49/62]
 drivers/ctlv/tests/message_kunit.c:949:1: warning: the frame size of 1512
 bytes is larger than 1280 bytes
Message-ID: <202610172115.wiTMflQ7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_1
head:   e63637d55bc3ae7cbef988e3525c79b9381dba1b
commit: 611edc69440d968bf06f3c4018b4a3b4a4660884 [49/62] selftests/ctlv: Add library tests
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261017/202610172115.wiTMflQ7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610172115.wiTMflQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610172115.wiTMflQ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_the_bit_where_it_means_nothing':
>> drivers/ctlv/tests/message_kunit.c:949:1: warning: the frame size of 1512 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     949 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_nested_fill_optionality_is_inherited':
   drivers/ctlv/tests/message_kunit.c:547:1: warning: the frame size of 1524 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     547 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_indexed_access_does_not_rescan':
   drivers/ctlv/tests/message_kunit.c:798:1: warning: the frame size of 1772 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     798 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_as_deep_as_the_core_allows':
   drivers/ctlv/tests/message_kunit.c:1020:1: warning: the frame size of 1520 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1020 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_one_nest_deeper':
   drivers/ctlv/tests/message_kunit.c:1032:1: warning: the frame size of 1520 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1032 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_message_it_accepts':
   drivers/ctlv/tests/message_kunit.c:234:1: warning: the frame size of 1508 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     234 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_nothing_inside_an_ignored_attr':
   drivers/ctlv/tests/message_kunit.c:927:1: warning: the frame size of 1532 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     927 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_an_attr_a_caller_can_do_without':
   drivers/ctlv/tests/message_kunit.c:839:1: warning: the frame size of 1516 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     839 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_an_attr_a_nest_can_do_without':
   drivers/ctlv/tests/message_kunit.c:858:1: warning: the frame size of 1508 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     858 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_bit_no_version_declares':
   drivers/ctlv/tests/message_kunit.c:971:1: warning: the frame size of 1516 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     971 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_required_attr_precedes_a_split_run':
   drivers/ctlv/tests/message_kunit.c:620:1: warning: the frame size of 1512 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     620 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_an_attr_declared_somewhere_else':
   drivers/ctlv/tests/message_kunit.c:902:1: warning: the frame size of 1516 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     902 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_an_attr_nobody_asked_to_ignore':
   drivers/ctlv/tests/message_kunit.c:880:1: warning: the frame size of 1512 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     880 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_nested_run_is_local_to_its_nest':
   drivers/ctlv/tests/message_kunit.c:713:1: warning: the frame size of 1524 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     713 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_cardinality_precedes_a_split_run':
   drivers/ctlv/tests/message_kunit.c:641:1: warning: the frame size of 1520 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     641 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_missing_attr_is_named':
   drivers/ctlv/tests/message_kunit.c:259:1: warning: the frame size of 1512 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     259 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_bad_attr_is_located':
   drivers/ctlv/tests/message_kunit.c:287:1: warning: the frame size of 1512 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     287 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_the_occurrence_too_many':
   drivers/ctlv/tests/message_kunit.c:336:1: warning: the frame size of 1512 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     336 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_nest_is_located_too':
   drivers/ctlv/tests/message_kunit.c:313:1: warning: the frame size of 1528 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     313 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_an_unknown_attr_splits_a_run':
   drivers/ctlv/tests/message_kunit.c:692:1: warning: the frame size of 1520 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     692 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_split_occurrence_run':
   drivers/ctlv/tests/message_kunit.c:602:1: warning: the frame size of 1516 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     602 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_a_malformed_nest':
   drivers/ctlv/tests/message_kunit.c:360:1: warning: the frame size of 1532 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     360 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_wire_error_precedes_a_split_run':
   drivers/ctlv/tests/message_kunit.c:671:1: warning: the frame size of 1520 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     671 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_contiguous_occurrences':
   drivers/ctlv/tests/message_kunit.c:579:1: warning: the frame size of 1524 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     579 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_reading_what_is_not_there':
   drivers/ctlv/tests/message_kunit.c:1147:1: warning: the frame size of 1644 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1147 | }
         | ^
   drivers/ctlv/tests/message_kunit.c: In function 'ctlv_msg_test_optional_attrs_have_empty_slots':
   drivers/ctlv/tests/message_kunit.c:821:1: warning: the frame size of 1676 bytes is larger than 1280 bytes [-Wframe-larger-than=]
--
   drivers/ctlv/tests/registration_kunit.c: In function 'ctlv_reg_test_root_family':
>> drivers/ctlv/tests/registration_kunit.c:1695:1: warning: the frame size of 1300 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1695 | }
         | ^
   drivers/ctlv/tests/registration_kunit.c: In function 'ctlv_reg_test_check':
   drivers/ctlv/tests/registration_kunit.c:684:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     684 | }
         | ^
   drivers/ctlv/tests/registration_kunit.c: In function 'ctlv_reg_test_published':
   drivers/ctlv/tests/registration_kunit.c:844:1: warning: the frame size of 1312 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     844 | }
         | ^
   drivers/ctlv/tests/registration_kunit.c: In function 'ctlv_reg_test_state_after_publish':
   drivers/ctlv/tests/registration_kunit.c:912:1: warning: the frame size of 1308 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     912 | }
         | ^
   drivers/ctlv/tests/registration_kunit.c: In function 'ctlv_reg_test_resolved':
   drivers/ctlv/tests/registration_kunit.c:790:1: warning: the frame size of 1328 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     790 | }
         | ^


vim +949 drivers/ctlv/tests/message_kunit.c

2c4421adfbc30c Jiri Pirko 2026-08-26  928  
2c4421adfbc30c Jiri Pirko 2026-08-26  929  /*
2c4421adfbc30c Jiri Pirko 2026-08-26  930   * Being forgiven is a caller's to ask for. An output says what this kernel
2c4421adfbc30c Jiri Pirko 2026-08-26  931   * knows, so the bit means nothing there and is one it does not declare.
2c4421adfbc30c Jiri Pirko 2026-08-26  932   */
2c4421adfbc30c Jiri Pirko 2026-08-26  933  static void ctlv_msg_test_the_bit_where_it_means_nothing(struct kunit *test)
2c4421adfbc30c Jiri Pirko 2026-08-26  934  {
2c4421adfbc30c Jiri Pirko 2026-08-26  935  	struct ctlv_error error;
2c4421adfbc30c Jiri Pirko 2026-08-26  936  	struct ctlv_msg_test_msg msg;
2c4421adfbc30c Jiri Pirko 2026-08-26  937  	u32 unknown;
2c4421adfbc30c Jiri Pirko 2026-08-26  938  
2c4421adfbc30c Jiri Pirko 2026-08-26  939  	ctlv_msg_test_msg_init(&msg);
2c4421adfbc30c Jiri Pirko 2026-08-26  940  	ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_ATTR_SCALAR_U, 1);
2c4421adfbc30c Jiri Pirko 2026-08-26  941  	unknown = ctlv_msg_test_msg_ignorable(&msg, CTLV_MSG_TEST_ATTR_FOREIGN, 7);
2c4421adfbc30c Jiri Pirko 2026-08-26  942  	KUNIT_EXPECT_EQ(test, -EINVAL,
2c4421adfbc30c Jiri Pirko 2026-08-26  943  			ctlv_msg_test_validate_reply(&msg,
2c4421adfbc30c Jiri Pirko 2026-08-26  944  				       ctlv_msg_test_request_tree(CTLV_FIXTURE_OP_COLLAPSE_CHECK),
2c4421adfbc30c Jiri Pirko 2026-08-26  945  				       &error));
2c4421adfbc30c Jiri Pirko 2026-08-26  946  	KUNIT_EXPECT_EQ(test, CTLV_VALIDATION_REASON_UNKNOWN_FLAG,
2c4421adfbc30c Jiri Pirko 2026-08-26  947  			error.reason);
2c4421adfbc30c Jiri Pirko 2026-08-26  948  	KUNIT_EXPECT_EQ(test, unknown, error.bad_attr_offset);
2c4421adfbc30c Jiri Pirko 2026-08-26 @949  }
2c4421adfbc30c Jiri Pirko 2026-08-26  950  

:::::: The code at line 949 was first introduced by commit
:::::: 2c4421adfbc30c9ee180047f914b19954af67851 ctlv: Add KUnit tests

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
