Content-Type: multipart/mixed; boundary="===============3109969564112077107=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v3 4/7] mm/asi: Interrupt ASI on interrupt/exception/NMI
Date: Thu, 27 Feb 2020 04:38:46 +0800
Message-ID: <202002270437.ls7s711V%lkp@intel.com>
In-Reply-To: <1582734120-26757-5-git-send-email-alexandre.chartre@oracle.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3109969564112077107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/x86/asm tip/x86/mm v5.6-rc3 next-20200226]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Alexandre-Chartre/Kernel-A=
ddress-Space-Isolation/20200227-034033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 248ed51=
048c40d36728e70914e38bffd7821da57
config: i386-tinyconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Di386 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:0:
   arch/x86/kernel/asm-offsets.c: In function 'common':
>> include/linux/compiler_types.h:129:35: error: 'struct tlb_state' has no =
member named 'asi_session'
    #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
                                      ^
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
     asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                                 ^~~
>> include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_of=
fsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
>> include/linux/kbuild.h:11:14: note: in expansion of macro 'offsetof'
     DEFINE(sym, offsetof(struct str, mem))
                 ^~~~~~~~
>> arch/x86/kernel/asm-offsets.c:98:2: note: in expansion of macro 'OFFSET'
     OFFSET(TLB_STATE_asi, tlb_state, asi_session.asi);
     ^~~~~~
>> include/linux/compiler_types.h:129:35: error: 'struct tlb_state' has no =
member named 'asi_session'
    #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
                                      ^
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
     asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                                 ^~~
>> include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_of=
fsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
>> include/linux/kbuild.h:11:14: note: in expansion of macro 'offsetof'
     DEFINE(sym, offsetof(struct str, mem))
                 ^~~~~~~~
   arch/x86/kernel/asm-offsets.c:99:2: note: in expansion of macro 'OFFSET'
     OFFSET(TLB_STATE_asi_isolation_cr3, tlb_state,
     ^~~~~~
>> include/linux/compiler_types.h:129:35: error: 'struct tlb_state' has no =
member named 'asi_session'
    #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
                                      ^
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
     asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                                 ^~~
>> include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_of=
fsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
>> include/linux/kbuild.h:11:14: note: in expansion of macro 'offsetof'
     DEFINE(sym, offsetof(struct str, mem))
                 ^~~~~~~~
   arch/x86/kernel/asm-offsets.c:101:2: note: in expansion of macro 'OFFSET'
     OFFSET(TLB_STATE_asi_original_cr3, tlb_state, asi_session.original_cr3=
);
     ^~~~~~
>> include/linux/compiler_types.h:129:35: error: 'struct tlb_state' has no =
member named 'asi_session'
    #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
                                      ^
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
     asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
                                                                 ^~~
>> include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_of=
fsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
>> include/linux/kbuild.h:11:14: note: in expansion of macro 'offsetof'
     DEFINE(sym, offsetof(struct str, mem))
                 ^~~~~~~~
   arch/x86/kernel/asm-offsets.c:102:2: note: in expansion of macro 'OFFSET'
     OFFSET(TLB_STATE_asi_idepth, tlb_state, asi_session.idepth);
     ^~~~~~
   make[2]: *** [scripts/Makefile.build:99: arch/x86/kernel/asm-offsets.s] =
Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1113: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:179: sub-make] Error 2
   30 real  5 user  5 sys  34.18% cpu 	make prepare

vim +129 include/linux/compiler_types.h

71391bdd2e9aab Xiaozhou Liu 2018-12-14  128  =

71391bdd2e9aab Xiaozhou Liu 2018-12-14 @129  #define __compiler_offsetof(a,=
 b)	__builtin_offsetof(a, b)
71391bdd2e9aab Xiaozhou Liu 2018-12-14  130  =


:::::: The code at line 129 was first introduced by commit
:::::: 71391bdd2e9aab188f86bf1ecd9b232531ec7eea include/linux/compiler_type=
s.h: don't pollute userspace with macro definitions

:::::: TO: Xiaozhou Liu <liuxiaozhou@bytedance.com>
:::::: CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3109969564112077107==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3109969564112077107==--

