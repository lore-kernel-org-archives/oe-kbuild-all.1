Content-Type: multipart/mixed; boundary="===============2017335913144182142=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 3/7] kunit: test: create a single centralized executor for all tests
Date: Sat, 29 Feb 2020 16:53:41 +0800
Message-ID: <202002291618.H5QQUZfy%lkp@intel.com>
In-Reply-To: <20200228012036.15682-4-brendanhiggins@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2017335913144182142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Brendan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on a2f0b878c3ca531a1706cb2a8b079cea3b17bafc]

url:    https://github.com/0day-ci/linux/commits/Brendan-Higgins/kunit-crea=
te-a-centralized-executor-to-dispatch-all-KUnit-tests/20200229-043150
base:    a2f0b878c3ca531a1706cb2a8b079cea3b17bafc
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/ext4/inode-test.c:272:1: sparse: sparse: invalid initializer

vim +272 fs/ext4/inode-test.c

1cbeab1b242d16 Iurii Zaikin 2019-10-17  271  =

c475c77d5b5639 Alan Maguire 2020-01-06 @272  kunit_test_suites(&ext4_inode_=
test_suite);
c475c77d5b5639 Alan Maguire 2020-01-06  273  =


:::::: The code at line 272 was first introduced by commit
:::::: c475c77d5b56398303e726969e81208196b3aab3 kunit: allow kunit tests to=
 be loaded as a module

:::::: TO: Alan Maguire <alan.maguire@oracle.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2017335913144182142==--

