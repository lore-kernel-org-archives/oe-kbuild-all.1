Content-Type: multipart/mixed; boundary="===============3615355069637473649=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hnaz-linux-mm:master 179/239] include/linux/thread_info.h:215:27: error: 'INT_MAX' undeclared
Date: Thu, 13 May 2021 17:36:14 +0800
Message-ID: <202105131700.z2HuiNSx-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3615355069637473649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/hnaz/linux-mm master
head:   12891f829e4851b3562ddcde27a4a9ade308ada3
commit: 161b082aa6ac5047f1b0f243f0e834d2bfb39842 [179/239] kernel.h: split =
out panic and oops helpers
config: nds32-defconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/hnaz/linux-mm/commit/161b082aa6ac5047f1b0f243f=
0e834d2bfb39842
        git remote add hnaz-linux-mm https://github.com/hnaz/linux-mm
        git fetch --no-tags hnaz-linux-mm master
        git checkout 161b082aa6ac5047f1b0f243f0e834d2bfb39842
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
W=3D1 ARCH=3Dnds32 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the hnaz-linux-mm/master HEAD 12891f829e4851b3562ddcde27a4a9ade308ada=
3 builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>):

   In file included from ./arch/nds32/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from lib/strncpy_from_user.c:6:
   include/linux/thread_info.h: In function 'check_copy_size':
>> include/linux/thread_info.h:215:27: error: 'INT_MAX' undeclared (first u=
se in this function)
     215 |  if (WARN_ON_ONCE(bytes > INT_MAX))
         |                           ^~~~~~~
   include/asm-generic/bug.h:146:27: note: in definition of macro 'WARN_ON_=
ONCE'
     146 |  int __ret_warn_once =3D !!(condition);   \
         |                           ^~~~~~~~~
   In file included from lib/strncpy_from_user.c:6:
   include/linux/thread_info.h:60:1: note: 'INT_MAX' is defined in header '=
<limits.h>'; did you forget to '#include <limits.h>'?
      59 | #include <asm/thread_info.h>
     +++ |+#include <limits.h>
      60 | =

   In file included from ./arch/nds32/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from lib/strncpy_from_user.c:6:
   include/linux/thread_info.h:215:27: note: each undeclared identifier is =
reported only once for each function it appears in
     215 |  if (WARN_ON_ONCE(bytes > INT_MAX))
         |                           ^~~~~~~
   include/asm-generic/bug.h:146:27: note: in definition of macro 'WARN_ON_=
ONCE'
     146 |  int __ret_warn_once =3D !!(condition);   \
         |                           ^~~~~~~~~


vim +/INT_MAX +215 include/linux/thread_info.h

b0377fedb65280 Al Viro   2017-06-29  201  =

9dd819a15162f8 Kees Cook 2019-09-25  202  static __always_inline __must_che=
ck bool
b0377fedb65280 Al Viro   2017-06-29  203  check_copy_size(const void *addr,=
 size_t bytes, bool is_source)
b0377fedb65280 Al Viro   2017-06-29  204  {
b0377fedb65280 Al Viro   2017-06-29  205  	int sz =3D __compiletime_object_=
size(addr);
b0377fedb65280 Al Viro   2017-06-29  206  	if (unlikely(sz >=3D 0 && sz < b=
ytes)) {
b0377fedb65280 Al Viro   2017-06-29  207  		if (!__builtin_constant_p(bytes=
))
b0377fedb65280 Al Viro   2017-06-29  208  			copy_overflow(sz, bytes);
b0377fedb65280 Al Viro   2017-06-29  209  		else if (is_source)
b0377fedb65280 Al Viro   2017-06-29  210  			__bad_copy_from();
b0377fedb65280 Al Viro   2017-06-29  211  		else
b0377fedb65280 Al Viro   2017-06-29  212  			__bad_copy_to();
b0377fedb65280 Al Viro   2017-06-29  213  		return false;
b0377fedb65280 Al Viro   2017-06-29  214  	}
6d13de1489b6bf Kees Cook 2019-12-04 @215  	if (WARN_ON_ONCE(bytes > INT_MAX=
))
6d13de1489b6bf Kees Cook 2019-12-04  216  		return false;
b0377fedb65280 Al Viro   2017-06-29  217  	check_object_size(addr, bytes, i=
s_source);
b0377fedb65280 Al Viro   2017-06-29  218  	return true;
b0377fedb65280 Al Viro   2017-06-29  219  }
b0377fedb65280 Al Viro   2017-06-29  220  =


:::::: The code at line 215 was first introduced by commit
:::::: 6d13de1489b6bf539695f96d945de3860e6d5e17 uaccess: disallow > INT_MAX=
 copy sizes

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3615355069637473649==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3615355069637473649==--

