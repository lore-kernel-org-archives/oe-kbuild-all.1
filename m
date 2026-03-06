Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7FA3B7B69
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809924; cv=none; b=uAtBZ095O8HYyTawxhyxtDOLQPexg0FwSDk3l2/YwWy4uluCJp5L4mYes3jlD/6Aq2EKEKhe7WFl2rQJaAbYeMoAgLvIEwKs2aa20kMq02zQ7y2PXtwiGdYPHkC+fHOOHeQHa5BSLX9E3DfP9jEZkn72NBqPsfdzud0iCOcdUYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809924; c=relaxed/simple;
	bh=8KhJHukAuOWYFealjLQDEzKuoME9Rt+jMH/qJPRkzsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JItax4fpF4lgJyrwmajv/dkJV0R+E5LeKRPr/Mh2OnNm+fqNkJ0skN9Gi/PegP8dEEen9BteKc3j8eAzA2i5t/cFm7i5lIgxaBgywcbe4agV+7ByCf2H+Sdo4na4XQx1DW095KvZ7LygZb6FMygkSsJP1hxQNFE9G3y+seHrqhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaASAopF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaASAopF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772809922; x=1804345922;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8KhJHukAuOWYFealjLQDEzKuoME9Rt+jMH/qJPRkzsE=;
  b=SaASAopFDisBXkZS7X12VctB1jJcpXXTuqJ9I3oQJTJRpHQAcZ2nGJ5s
   Xy1PeaZ7ttHfwDMC851tpbnRJsBFSmpvifWgAfz8ak1vS2M6AlISJGcSM
   1PUJyz/i6oaP0h6F6I8j/mI29GMDHb3miEEeTht0IDkqkNUuKsec+XRbG
   saoXVkMR+W4jjg1ytjIffd2WtRBMEQeXDbURJeqShVco/acWYYd66Kerd
   TXM1F2REEBV8UVUP8OFMiHGhRMxT22t7ekfZMdHS99rEQRHd6sSZV7gd/
   eN0Ys7SV9x9YK9BRZCvqq6ZJB5sAOa9OY2hAwyAV1dEHyxin3vjmRAPzr
   Q==;
X-CSE-ConnectionGUID: PJx0OCv+T0ivlCd74r3BVw==
X-CSE-MsgGUID: EGOk2a6VQ5OG8uhrCtJdlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77520576"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77520576"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:11:58 -0800
X-CSE-ConnectionGUID: 86vsfWMdRemPv6q+BIte/w==
X-CSE-MsgGUID: wLbk3yaiQ6SVXZyNQTxeJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="215715008"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2026 07:11:57 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyWqJ-000000002Gd-2D6u;
	Fri, 06 Mar 2026 15:11:55 +0000
Date: Fri, 06 Mar 2026 16:11:21 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_mark_userns 10/10]
 =?us-ascii?Q?tools/testing/selftests/../../../tools/testing/selftests/ks?=
 =?us-ascii?Q?elftest=5Fharness.h:1226:undefined?= reference to
 `setup_userns'
Message-ID: <202603061603.zqFisa9o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/amir73il/linux fan_mark_userns
head:   4d7cad2f077449767de4cc8ab6d869f080a121a2
commit: 4d7cad2f077449767de4cc8ab6d869f080a121a2 [10/10] selftests/filesyst=
ems: add fanotify namespace notifications test
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0306/202603061603.zqFisa9o-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260306/202603061603.zqFisa9o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061603.zqFisa9o-lkp@i=
ntel.com/

Note: the amir73il/fan_mark_userns HEAD 4d7cad2f077449767de4cc8ab6d869f080a=
121a2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from ns-notify_test.c:21:
   ns-notify_test.c: In function 'userns_notify_create_delete_uts':
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:757:9: warning: this 'for' clause does not guard... [-Wmisleading-inde=
ntation]
     757 |         for (; _metadata->trigger; _metadata->trigger =3D \
         |         ^~~
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:806:14: note: in expansion of macro 'OPTIONAL_HANDLER'
     806 | } while (0); OPTIONAL_HANDLER(_assert)
         |              ^~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:519:9: note: in expansion of macro '__EXPECT'
     519 |         __EXPECT(expected, #expected, seen, #seen, =3D=3D, 1)
         |         ^~~~~~~~
   ns-notify_test.c:145:9: note: in expansion of macro 'ASSERT_EQ'
     145 |         ASSERT_EQ(create_owner, self->userns_nsid);
         |         ^~~~~~~~~
   ns-notify_test.c:148:9: note: ...this statement, but the latter is misle=
adingly indented as if it were guarded by the 'for'
     148 |         {
         |         ^
   /usr/lib/gcc-cross/riscv64-linux-gnu/14/../../../../riscv64-linux-gnu/bi=
n/ld: /tmp/ccx1bl7s.o: in function `__run_test':
>> tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:1226:(.text+0xb6a): undefined reference to `setup_userns'
   collect2: error: ld returned 1 exit status


vim +1226 tools/testing/selftests/../../../tools/testing/selftests/kselftes=
t_harness.h

65177e47d3035c tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2023-01-25  1193 =20
c2bcc8e9577a35 tools/testing/selftests/kselftest_harness.h    Thomas Wei=C3=
=9Fschuh 2025-05-05  1194  static void __run_test(struct __fixture_metadata=
 *f,
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2020-04-27  1195  		       struct __fixture_variant_metadata *variant,
142aca6b388c8a tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2020-04-27  1196  		       struct __test_metadata *t)
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook    =
    2020-03-13  1197  {
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1198  	struct __test_xfail *xfail;
28d2188709d9c1 tools/testing/selftests/kselftest_harness.h    Tao Su       =
    2024-05-09  1199  	char test_name[1024];
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1200  	const char *diagnostic;
130e4280677301 tools/testing/selftests/kselftest_harness.h    Micka=C3=ABl =
Sala=C3=BCn   2024-06-21  1201  	int child;
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1202 =20
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2020-04-27  1203  	/* reset test struct */
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1204  	t->exit_code =3D KSFT_PASS;
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook    =
    2020-03-13  1205  	t->trigger =3D 0;
24cf65a6226643 tools/testing/selftests/kselftest_harness.h    Micka=C3=ABl =
Sala=C3=BCn   2024-05-11  1206  	t->aborted =3D false;
906dbc17d61c38 tools/testing/selftests/kselftest_harness.h    Thomas Wei=C3=
=9Fschuh 2025-05-05  1207  	t->no_teardown =3D NULL;
0ef67a888375b0 tools/testing/selftests/kselftest_harness.h    Kees Cook    =
    2020-06-22  1208  	memset(t->results->reason, 0, sizeof(t->results->rea=
son));
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2020-04-27  1209 =20
6bb955fce08cbc tools/testing/selftests/kselftest_harness.h    Tao Su       =
    2024-05-09  1210  	snprintf(test_name, sizeof(test_name), "%s%s%s.%s",
6bb955fce08cbc tools/testing/selftests/kselftest_harness.h    Tao Su       =
    2024-05-09  1211  		 f->name, variant->name[0] ? "." : "", variant->nam=
e, t->name);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Eller=
man 2020-09-17  1212 =20
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1213  	ksft_print_msg(" RUN           %s ...\n", test_name);
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1214 =20
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Eller=
man 2020-09-17  1215  	/* Make sure output buffers are flushed before fork =
*/
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Eller=
man 2020-09-17  1216  	fflush(stdout);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Eller=
man 2020-09-17  1217  	fflush(stderr);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Eller=
man 2020-09-17  1218 =20
130e4280677301 tools/testing/selftests/kselftest_harness.h    Micka=C3=ABl =
Sala=C3=BCn   2024-06-21  1219  	child =3D fork();
130e4280677301 tools/testing/selftests/kselftest_harness.h    Micka=C3=ABl =
Sala=C3=BCn   2024-06-21  1220  	if (child < 0) {
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook    =
    2020-06-22  1221  		ksft_print_msg("ERROR SPAWNING TEST CHILD\n");
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1222  		t->exit_code =3D KSFT_FAIL;
130e4280677301 tools/testing/selftests/kselftest_harness.h    Micka=C3=ABl =
Sala=C3=BCn   2024-06-21  1223  	} else if (child =3D=3D 0) {
92d25637a3a459 tools/testing/selftests/kselftest_harness.h    Li Zhijian   =
    2021-12-17  1224  		setpgrp();
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2020-04-27  1225  		t->fn(t, variant);
796a344fa4315f tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28 @1226  		_exit(t->exit_code);
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook    =
    2020-03-13  1227  	} else {
130e4280677301 tools/testing/selftests/kselftest_harness.h    Micka=C3=ABl =
Sala=C3=BCn   2024-06-21  1228  		t->pid =3D child;
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook    =
    2020-03-13  1229  		__wait_for_test(t);
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook    =
    2020-03-13  1230  	}
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1231  	ksft_print_msg("         %4s  %s\n",
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1232  		       __test_passed(t) ? "OK" : "FAIL", test_name);
9847d24af95c7f tools/testing/selftests/kselftest_harness.h    Kees Cook    =
    2020-06-22  1233 =20
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1234  	/* Check if we're expecting this test to fail */
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1235  	for (xfail =3D variant->xfails; xfail; xfail =3D xfa=
il->next)
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1236  		if (xfail->test =3D=3D t)
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1237  			break;
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1238  	if (xfail)
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1239  		t->exit_code =3D __test_passed(t) ? KSFT_XPASS : KS=
FT_XFAIL;
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1240 =20
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1241  	if (t->results->reason[0])
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1242  		diagnostic =3D t->results->reason;
378193eff3399a tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1243  	else if (t->exit_code =3D=3D KSFT_PASS || t->exit_co=
de =3D=3D KSFT_FAIL)
378193eff3399a tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1244  		diagnostic =3D NULL;
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1245  	else
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1246  		diagnostic =3D "unknown";
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1247 =20
732e2035280bf4 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-02-28  1248  	ksft_test_result_code(t->exit_code, test_name,
caed8eba221533 tools/testing/selftests/kselftest_harness.h    Jakub Kicinsk=
i   2024-04-16  1249  			      diagnostic ? "%s" : NULL, diagnostic);
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
    2015-06-16  1250  }
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook    =
    2015-06-16  1251 =20

:::::: The code at line 1226 was first introduced by commit
:::::: 796a344fa4315f9c1f2258de14c1d20cbbef79a8 selftests: kselftest_harnes=
s: use exit code to store skip

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
