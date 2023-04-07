Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98821FD7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 09:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680858343; x=1712394343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53eAPxhKUOr9T0316IshFTpxJyUyB3VxKWat77i0d5Y=;
  b=d5bQAfI6IZTeRgF0AxAeFJ5m6oEWD2ZIZp2fm4CGpq4dfWY3VaBJ/Vmb
   oIdfCYVF5jbK3jaNloZlWlWA05m8/m25xGZSmGTMgf6O87j2OKyQqrLJb
   4IQFkjFtxU7ENZ+F+jydLqC1p609E8fOh5yD/7jdFQQAwDLLGTyAv5IN+
   41KHRWQeokZXvRFj+NuuZ471Zq/XeoMxZVx3ZdwbVZyxVJvcMDfP+yrS7
   vEoo7/G2QYAS1x4RzZAwJP9BfgoKaAcvZC6qRDD8w16cEl4jnnBpWhx9d
   bxyXdsqER26D5F1qDtfjHB7dum5T7OosvNrBPYtV4K+fwT6r+xmc1sQ4G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="340445567"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="340445567"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 02:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="690003997"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="690003997"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2023 02:05:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pki2K-000SIE-12;
	Fri, 07 Apr 2023 09:05:36 +0000
Date: Fri, 7 Apr 2023 17:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Gonda <pgonda@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/sev_selftests_for_peter 6/8]
 lib/x86_64/processor.c:1048:52: error: 'X86_PROPERTY_SEV_C_BIT' undeclared
Message-ID: <202304071721.Dit4CnZd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/sev_selftests_for_peter
head:   d379d4355a226bc2fdbce995a5bd05b96cd21778
commit: 071c0892df6ce14b83b6e6c9a251d85fb7046bcd [6/8] KVM: selftests: add library for creating/interacting with SEV guests
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://github.com/sean-jc/linux/commit/071c0892df6ce14b83b6e6c9a251d85fb7046bcd
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/sev_selftests_for_peter
        git checkout 071c0892df6ce14b83b6e6c9a251d85fb7046bcd
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071721.Dit4CnZd-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

libbpf: failed to find '.BTF' ELF section in vmlinux
>> Error: failed to load BTF from vmlinux: No data available
--
>> ERROR: modpost: "bpf_fentry_test1" [tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko] undefined!
--
Warning: Kernel ABI header at 'tools/include/uapi/linux/in.h' differs from latest version at 'include/uapi/linux/in.h'
Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h' differs from latest version at 'arch/x86/include/asm/cpufeatures.h'
Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/perf_regs.h' differs from latest version at 'arch/arm64/include/uapi/asm/perf_regs.h'
Warning: Kernel ABI header at 'tools/include/linux/coresight-pmu.h' differs from latest version at 'include/linux/coresight-pmu.h'
PERF_VERSION = 6.3.rc2.g071c0892df6c
util/pmu-bison.c: In function 'perf_pmu_parse':
>> util/pmu-bison.c:875:3: error: 'YYST' undeclared (first use in this function)
875 |   YYSTYPE yyval;
|   ^~~~
util/pmu-bison.c:875:3: note: each undeclared identifier is reported only once for each function it appears in
>> util/pmu-bison.c:875:7: error: expected ';' at end of input
875 |   YYSTYPE yyval;
|       ^
|       ;
876 |
|
>> util/pmu-bison.c:875:3: error: expected declaration or statement at end of input
875 |   YYSTYPE yyval;
|   ^~~~
>> util/pmu-bison.c:872:19: error: unused variable 'yytoken' [-Werror=unused-variable]
872 |   yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
|                   ^~~~~~~
>> util/pmu-bison.c:870:7: error: unused variable 'yyresult' [-Werror=unused-variable]
870 |   int yyresult;
|       ^~~~~~~~
>> util/pmu-bison.c:868:7: error: unused variable 'yyn' [-Werror=unused-variable]
868 |   int yyn;
|       ^~~
>> util/pmu-bison.c:866:14: error: unused variable 'yyvsp' [-Werror=unused-variable]
866 |     YYSTYPE *yyvsp = yyvs;
|              ^~~~~
>> util/pmu-bison.c:861:17: error: unused variable 'yyssp' [-Werror=unused-variable]
861 |     yy_state_t *yyssp = yyss;
|                 ^~~~~
>> util/pmu-bison.c:856:17: error: unused variable 'yystacksize' [-Werror=unused-variable]
856 |     YYPTRDIFF_T yystacksize = YYINITDEPTH;
|                 ^~~~~~~~~~~
>> util/pmu-bison.c:850:9: error: unused variable 'yyerrstatus' [-Werror=unused-variable]
850 |     int yyerrstatus = 0;
|         ^~~~~~~~~~~
>> util/pmu-bison.c:848:21: error: unused variable 'yystate' [-Werror=unused-variable]
848 |     yy_state_fast_t yystate = 0;
|                     ^~~~~~~
util/pmu-bison.c:876: error: control reaches end of non-void function [-Werror=return-type]
876 |
|
At top level:
>> util/pmu-bison.c:814:1: error: 'yydestruct' defined but not used [-Werror=unused-function]
814 | yydestruct (const char *yymsg,
| ^~~~~~~~~~
>> util/pmu-bison.c:618:26: error: 'yyr2' defined but not used [-Werror=unused-const-variable=]
618 | static const yytype_int8 yyr2[] =
|                          ^~~~
>> util/pmu-bison.c:612:26: error: 'yyr1' defined but not used [-Werror=unused-const-variable=]
612 | static const yytype_int8 yyr1[] =
|                          ^~~~
>> util/pmu-bison.c:605:26: error: 'yystos' defined but not used [-Werror=unused-const-variable=]
605 | static const yytype_int8 yystos[] =
|                          ^~~~~~
>> util/pmu-bison.c:597:26: error: 'yycheck' defined but not used [-Werror=unused-const-variable=]
597 | static const yytype_int8 yycheck[] =
|                          ^~~~~~~
>> util/pmu-bison.c:591:26: error: 'yytable' defined but not used [-Werror=unused-const-variable=]
591 | static const yytype_int8 yytable[] =
|                          ^~~~~~~
>> util/pmu-bison.c:583:26: error: 'yydefgoto' defined but not used [-Werror=unused-const-variable=]
583 | static const yytype_int8 yydefgoto[] =
|                          ^~~~~~~~~
>> util/pmu-bison.c:577:26: error: 'yypgoto' defined but not used [-Werror=unused-const-variable=]
577 | static const yytype_int8 yypgoto[] =
|                          ^~~~~~~
>> util/pmu-bison.c:570:26: error: 'yydefact' defined but not used [-Werror=unused-const-variable=]
570 | static const yytype_int8 yydefact[] =
|                          ^~~~~~~~
util/pmu-bison.c:561:26: error: 'yypact' defined but not used [-Werror=unused-const-variable=]
561 | static const yytype_int8 yypact[] =
|                          ^~~~~~
util/pmu-bison.c:486:26: error: 'yytranslate' defined but not used [-Werror=unused-const-variable=]
486 | static const yytype_int8 yytranslate[] =
|                          ^~~~~~~~~~~
cc1: note: unrecognized command-line option '-Wno-unknown-warning-option' may have been intended to silence earlier diagnostics
cc1: all warnings being treated as errors
make[6]: *** [tools/build/Makefile.build:98: tools/perf/util/pmu-bison.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [tools/build/Makefile.build:140: util] Error 2
make[4]: *** [Makefile.perf:673: tools/perf/perf-in.o] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [Makefile.perf:236: sub-make] Error 2
make[2]: *** [Makefile:70: all] Error 2
--
libbpf: failed to find '.BTF' ELF section in vmlinux
>> Error: failed to load BTF from vmlinux: No data available
make[3]: *** [Makefile:208: tools/bpf/bpftool/vmlinux.h] Error 195
make[3]: *** Deleting file 'tools/bpf/bpftool/vmlinux.h'
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [Makefile:113: bpftool] Error 2
make[2]: *** Waiting for unfinished jobs....
libbpf: failed to find '.BTF' ELF section in vmlinux
>> Error: failed to load BTF from vmlinux: No data available
make[3]: *** [Makefile:78: tools/bpf/runqslower//vmlinux.h] Error 195
make[3]: *** Deleting file 'tools/bpf/runqslower//vmlinux.h'
make[2]: *** [Makefile:122: runqslower] Error 2
--
In file included from thermal_nl.c:9:
>> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
6 | #include <netlink/netlink.h>
|          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [tools/build/Makefile.build:98: tools/lib/thermal/thermal_nl.o] Error 1
make[4]: *** Waiting for unfinished jobs....
In file included from sampling.c:9:
>> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
6 | #include <netlink/netlink.h>
|          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [tools/build/Makefile.build:98: tools/lib/thermal/sampling.o] Error 1
In file included from commands.c:10:
>> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
6 | #include <netlink/netlink.h>
|          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [tools/build/Makefile.build:98: tools/lib/thermal/commands.o] Error 1
In file included from thermal.c:6:
>> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
6 | #include <netlink/netlink.h>
|          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [tools/build/Makefile.build:98: tools/lib/thermal/thermal.o] Error 1
In file included from events.c:10:
>> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
6 | #include <netlink/netlink.h>
|          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [tools/build/Makefile.build:98: tools/lib/thermal/events.o] Error 1
make[3]: *** [Makefile:105: tools/lib/thermal/libthermal-in.o] Error 2
make[2]: *** [Makefile:120: all] Error 2
--
>> thermometer.c:21:10: fatal error: libconfig.h: No such file or directory
21 | #include <libconfig.h>
|          ^~~~~~~~~~~~~
compilation terminated.
make[2]: *** [Makefile:23: thermometer] Error 1
--
>> Makefile:77: *** Cannot find a vmlinux for VMLINUX_BTF at any of "vmlinux vmlinux ../../../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-0.bpo.2-amd64".  Stop.
make[1]: *** [Makefile:230: kselftest/kvm/lib/x86_64/sev.o] Error 1
make[1]: *** [Makefile:230: kselftest/kvm/lib/x86_64/processor.o] Error 1
make[1]: *** [Makefile:230: kselftest/kvm/lib/kvm_util.o] Error 1
make[1]: Target 'all' not remade because of errors.
--
In file included from lib/kvm_util.c:9:
lib/kvm_util.c: In function '____vm_create':
<< In file included from lib/kvm_util.c:9:
>> lib/kvm_util.c:223:46: error: 'nr_pages' undeclared (first use in this function)
223 |                  vm_guest_mode_string(mode), nr_pages);
|                                              ^~~~~~~~
include/test_util.h:28:34: note: in definition of macro 'pr_debug'
28 | #define pr_debug(...) _no_printf(__VA_ARGS__)
|                                  ^~~~~~~~~~~
lib/kvm_util.c:223:46: note: each undeclared identifier is reported only once for each function it appears in
223 |                  vm_guest_mode_string(mode), nr_pages);
|                                              ^~~~~~~~
include/test_util.h:28:34: note: in definition of macro 'pr_debug'
28 | #define pr_debug(...) _no_printf(__VA_ARGS__)
|                                  ^~~~~~~~~~~
lib/kvm_util.c: In function '____vm_vaddr_alloc':
lib/kvm_util.c:1323:28: warning: implicit declaration of function '_vm_phy_pages_alloc'; did you mean 'vm_phy_pages_alloc'? [-Wimplicit-function-declaration]
1323 |         vm_paddr_t paddr = _vm_phy_pages_alloc(vm, pages,
|                            ^~~~~~~~~~~~~~~~~~~
|                            vm_phy_pages_alloc
lib/kvm_util.c: In function 'addr_gpa2hva':
<< In file included from lib/kvm_util.c:9:
>> lib/kvm_util.c:1478:32: error: 'gpa_tagged' undeclared (first use in this function)
1478 |         gpa = vm_untag_gpa(vm, gpa_tagged);
|                                ^~~~~~~~~~
lib/kvm_util.c: At top level:
cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
--
lib/x86_64/processor.c: In function 'kvm_init_vm_address_properties':
>> lib/x86_64/processor.c:1048:52: error: 'X86_PROPERTY_SEV_C_BIT' undeclared (first use in this function)
1048 |                 vm->arch.c_bit = this_cpu_property(X86_PROPERTY_SEV_C_BIT);
|                                                    ^~~~~~~~~~~~~~~~~~~~~~
lib/x86_64/processor.c:1048:52: note: each undeclared identifier is reported only once for each function it appears in
lib/x86_64/processor.c: At top level:
cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
--
lib/x86_64/sev.c: In function 'sev_ioctl':
>> lib/x86_64/sev.c:25:34: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
25 |         struct sev_issue_cmd arg {
|                                  ^
>> lib/x86_64/sev.c:26:17: error: expected expression before '.' token
26 |                 .cmd = cmd,
|                 ^
>> lib/x86_64/sev.c:26:27: warning: left-hand operand of comma expression has no effect [-Wunused-value]
26 |                 .cmd = cmd,
|                           ^
lib/x86_64/sev.c:27:44: warning: left-hand operand of comma expression has no effect [-Wunused-value]
27 |                 .data = (unsigned long)data,
|                                            ^
In file included from include/kvm_util.h:10,
from lib/x86_64/sev.c:6:
>> lib/x86_64/sev.c:30:43: error: 'arg' undeclared (first use in this function)
30 |         kvm_ioctl(sev_fd, SEV_ISSUE_CMD, &arg);
|                                           ^~~
include/kvm_util_base.h:36:60: note: in definition of macro '__kvm_static_assert'
36 | #define __kvm_static_assert(expr, msg, ...) _Static_assert(expr, msg)
|                                                            ^~~~
include/kvm_util_base.h:267:9: note: in expansion of macro 'kvm_static_assert'
267 |         kvm_static_assert(!_IOC_SIZE(cmd) || sizeof(*arg) == _IOC_SIZE(cmd));            |         ^~~~~~~~~~~~~~~~~
include/kvm_util_base.h:272:9: note: in expansion of macro 'kvm_do_ioctl'
272 |         kvm_do_ioctl(kvm_fd, cmd, arg)
|         ^~~~~~~~~~~~
include/kvm_util_base.h:277:19: note: in expansion of macro '__kvm_ioctl'
277 |         int ret = __kvm_ioctl(kvm_fd, cmd, arg);                         |                   ^~~~~~~~~~~
include/kvm_util_base.h:283:9: note: in expansion of macro '_kvm_ioctl'
283 |         _kvm_ioctl(kvm_fd, cmd, #cmd, arg)
|         ^~~~~~~~~~
lib/x86_64/sev.c:30:9: note: in expansion of macro 'kvm_ioctl'
30 |         kvm_ioctl(sev_fd, SEV_ISSUE_CMD, &arg);
|         ^~~~~~~~~
lib/x86_64/sev.c:30:43: note: each undeclared identifier is reported only once for each function it appears in
30 |         kvm_ioctl(sev_fd, SEV_ISSUE_CMD, &arg);
|                                           ^~~
include/kvm_util_base.h:36:60: note: in definition of macro '__kvm_static_assert'
36 | #define __kvm_static_assert(expr, msg, ...) _Static_assert(expr, msg)
|                                                            ^~~~
include/kvm_util_base.h:267:9: note: in expansion of macro 'kvm_static_assert'
267 |         kvm_static_assert(!_IOC_SIZE(cmd) || sizeof(*arg) == _IOC_SIZE(cmd));            |         ^~~~~~~~~~~~~~~~~
include/kvm_util_base.h:272:9: note: in expansion of macro 'kvm_do_ioctl'
272 |         kvm_do_ioctl(kvm_fd, cmd, arg)
|         ^~~~~~~~~~~~
include/kvm_util_base.h:277:19: note: in expansion of macro '__kvm_ioctl'
277 |         int ret = __kvm_ioctl(kvm_fd, cmd, arg);                         |                   ^~~~~~~~~~~
include/kvm_util_base.h:283:9: note: in expansion of macro '_kvm_ioctl'
283 |         _kvm_ioctl(kvm_fd, cmd, #cmd, arg)
|         ^~~~~~~~~~
lib/x86_64/sev.c:30:9: note: in expansion of macro 'kvm_ioctl'
30 |         kvm_ioctl(sev_fd, SEV_ISSUE_CMD, &arg);
|         ^~~~~~~~~
>> include/kvm_util_base.h:267:27: error: expression in static assertion is not an integer
267 |         kvm_static_assert(!_IOC_SIZE(cmd) || sizeof(*arg) == _IOC_SIZE(cmd));            |                           ^
include/kvm_util_base.h:36:60: note: in definition of macro '__kvm_static_assert'
36 | #define __kvm_static_assert(expr, msg, ...) _Static_assert(expr, msg)
|                                                            ^~~~
include/kvm_util_base.h:267:9: note: in expansion of macro 'kvm_static_assert'
267 |         kvm_static_assert(!_IOC_SIZE(cmd) || sizeof(*arg) == _IOC_SIZE(cmd));            |         ^~~~~~~~~~~~~~~~~
include/kvm_util_base.h:272:9: note: in expansion of macro 'kvm_do_ioctl'
272 |         kvm_do_ioctl(kvm_fd, cmd, arg)
|         ^~~~~~~~~~~~
include/kvm_util_base.h:277:19: note: in expansion of macro '__kvm_ioctl'
277 |         int ret = __kvm_ioctl(kvm_fd, cmd, arg);                         |                   ^~~~~~~~~~~
include/kvm_util_base.h:283:9: note: in expansion of macro '_kvm_ioctl'
283 |         _kvm_ioctl(kvm_fd, cmd, #cmd, arg)
|         ^~~~~~~~~~
lib/x86_64/sev.c:30:9: note: in expansion of macro 'kvm_ioctl'
30 |         kvm_ioctl(sev_fd, SEV_ISSUE_CMD, &arg);
|         ^~~~~~~~~
lib/x86_64/sev.c: In function 'kvm_sev_ioctl':
>> lib/x86_64/sev.c:38:29: error: 'struct kvm_vm' has no member named 'sev_fd'
38 |                 .sev_fd = vm->sev_fd,
|                             ^~
In file included from include/kvm_util.h:10,
from lib/x86_64/sev.c:6:
>> include/kvm_util_base.h:36:45: error: static assertion failed: "!_IOC_SIZE((((2U|1U) << (((0+8)+8)+14)) | (((0xAE)) << (0+8)) | (((0xba)) << 0) | ((((sizeof(unsigned long)))) << ((0+8)+8)))) || sizeof(*&sev_cmd) == _IOC_SIZE((((2U|1U) << (((0+8)+8)+14)) | (((0xAE)) << (0+8)) | (((0xba)) << 0) | ((((sizeof(unsigned long)))) << ((0+8)+8))))"
36 | #define __kvm_static_assert(expr, msg, ...) _Static_assert(expr, msg)
|                                             ^~~~~~~~~~~~~~
include/kvm_util_base.h:37:38: note: in expansion of macro '__kvm_static_assert'
37 | #define kvm_static_assert(expr, ...) __kvm_static_assert(expr, ##__VA_ARGS__, #expr)
|                                      ^~~~~~~~~~~~~~~~~~~
include/kvm_util_base.h:267:9: note: in expansion of macro 'kvm_static_assert'
267 |         kvm_static_assert(!_IOC_SIZE(cmd) || sizeof(*arg) == _IOC_SIZE(cmd));            |         ^~~~~~~~~~~~~~~~~
include/kvm_util_base.h:290:9: note: in expansion of macro 'kvm_do_ioctl'
290 |         kvm_do_ioctl((vm)->fd, cmd, arg);                                |         ^~~~~~~~~~~~
include/kvm_util_base.h:295:19: note: in expansion of macro '__vm_ioctl'
295 |         int ret = __vm_ioctl(vm, cmd, arg);                              |                   ^~~~~~~~~~
include/kvm_util_base.h:301:9: note: in expansion of macro '_vm_ioctl'
301 |         _vm_ioctl(vm, cmd, #cmd, arg)
|         ^~~~~~~~~
lib/x86_64/sev.c:42:9: note: in expansion of macro 'vm_ioctl'
42 |         vm_ioctl(vm, KVM_MEMORY_ENCRYPT_OP, &sev_cmd);
|         ^~~~~~~~
lib/x86_64/sev.c: In function 'encrypt_region':
>> lib/x86_64/sev.c:87:9: warning: implicit declaration of function 'sev_register_user_region' [-Wimplicit-function-declaration]
87 |         sev_register_user_region(vm, region);
|         ^~~~~~~~~~~~~~~~~~~~~~~~
At top level:
lib/x86_64/sev.c:45:13: warning: 'sev_register_encrypted_memory' defined but not used [-Wunused-function]
45 | static void sev_register_encrypted_memory(struct kvm_vm *vm,
|             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
