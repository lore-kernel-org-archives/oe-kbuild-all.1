Content-Type: multipart/mixed; boundary="===============3010036935716855654=="
MIME-Version: 1.0
From: Marco Elver <elver@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v4 2/2] fs: ext4: Modify inode-test.c to use KUnit parameterized testing feature
Date: Wed, 28 Oct 2020 09:30:25 +0100
Message-ID: <CANpmjNON4e6Gh7-NQw4CT4e--vOrH_rFyGi9U9TiUNS_zn+_vw@mail.gmail.com>
In-Reply-To: <202010280748.WUyq8OoJ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3010036935716855654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Oct 2020 at 00:50, kernel test robot <lkp@intel.com> wrote:
>
> Hi Arpitha,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on ext4/dev]
> [also build test WARNING on linus/master v5.10-rc1 next-20201027]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Arpitha-Raghunandan/kuni=
t-Support-for-Parameterized-Testing/20201028-015018
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
> config: mips-randconfig-r016-20201027 (attached as .config)
> compiler: mipsel-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/2de1e52708cd83d1dc4c718=
876683f6809045a98
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Arpitha-Raghunandan/kunit-Suppor=
t-for-Parameterized-Testing/20201028-015018
>         git checkout 2de1e52708cd83d1dc4c718876683f6809045a98
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dmips
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    In file included from fs/ext4/inode-test.c:7:
>    fs/ext4/inode-test.c: In function 'ext4_inode_gen_params':
> >> include/kunit/test.h:1735:58: warning: return discards 'const' qualifi=
er from pointer target type [-Wdiscarded-qualifiers]
>     1735 |   return __next - (array) < ARRAY_SIZE((array)) ? __next : NUL=
L;   \
>    fs/ext4/inode-test.c:214:1: note: in expansion of macro 'KUNIT_ARRAY_P=
ARAM'
>      214 | KUNIT_ARRAY_PARAM(ext4_inode, test_data);
>          | ^~~~~~~~~~~~~~~~~

So this means we probably want to make the param_value, and the return
and prev types of the generator "const void*".

Thanks,
-- Marco
--===============3010036935716855654==--

