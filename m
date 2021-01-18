Content-Type: multipart/mixed; boundary="===============5003765342135365182=="
MIME-Version: 1.0
From: Brendan Jackman <jackmanb@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [ragnatech:net-next 317/356] {standard input}:3148: Error: operands mismatch -- statement `andl %a1, %d1' ignored
Date: Mon, 18 Jan 2021 12:53:37 +0100
Message-ID: <CA+i-1C19Fdas5PBLYwkD-+265gyEYbEaRkMKuD9t6PXsLr20YQ@mail.gmail.com>
In-Reply-To: <202101161658.52rYf3KV-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5003765342135365182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I copied in the attached config, installed the m68k toolchain:

sudo apt install gcc-m68k-linux-gnu  # (m68k-linux-gnu-gcc (Debian
10.2.0-9) 10.2.0)

Built with:

CROSS_COMPILE=3Dm68k-linux-gnu- ARCH=3Dm68k make -j

And I get this "needs 68020 or higher" error from all over the kernel
tree. Sounds like a Kbuild bug to me, I will ignore it if you're OK
with that.

On Sat, 16 Jan 2021 at 09:20, kernel test robot <lkp@intel.com> wrote:
>
> tree:   git://git.ragnatech.se/linux net-next
> head:   9ab7e76aefc97a9aa664accb59d6e8dc5e52514a
> commit: 981f94c3e92146705baf97fb417a5ed1ab1a79a5 [317/356] bpf: Add bitwi=
se atomic instructions
> config: m68k-randconfig-r002-20210115 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add ragnatech git://git.ragnatech.se/linux
>         git fetch --no-tags ragnatech net-next
>         git checkout 981f94c3e92146705baf97fb417a5ed1ab1a79a5
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dm68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    kernel/bpf/core.c:1350:12: warning: no previous prototype for 'bpf_pro=
be_read_kernel' [-Wmissing-prototypes]
>     1350 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const vo=
id *unsafe_ptr)
>          |            ^~~~~~~~~~~~~~~~~~~~~
>    {standard input}: Assembler messages:
>    {standard input}:3102: Error: invalid instruction for this architectur=
e; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68e=
c040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
> >> {standard input}:3148: Error: operands mismatch -- statement `andl %a1=
,%d1' ignored
>    {standard input}:3148: Error: invalid instruction for this architectur=
e; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68e=
c040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
> >> {standard input}:3201: Error: operands mismatch -- statement `orl %a1,=
%d1' ignored
>    {standard input}:3201: Error: invalid instruction for this architectur=
e; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68e=
c040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
> >> {standard input}:3247: Error: operands mismatch -- statement `eorl %a1=
,%d1' ignored
>    {standard input}:3247: Error: invalid instruction for this architectur=
e; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68e=
c040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
>    {standard input}:3270: Error: invalid instruction for this architectur=
e; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68e=
c040], 68060 [68ec060]) -- statement `casl %d0,%d5,(%a0)' ignored
>    {standard input}:3307: Error: invalid instruction for this architectur=
e; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68e=
c040], 68060 [68ec060]) -- statement `casl %d0,%d5,(%a6)' ignored
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5003765342135365182==--

