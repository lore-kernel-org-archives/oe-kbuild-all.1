Content-Type: multipart/mixed; boundary="===============0539684525263002990=="
MIME-Version: 1.0
From: Brendan Jackman <jackmanb@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [ragnatech:net-next 317/356] {standard input}:3148: Error: operands mismatch -- statement `andl %a1, %d1' ignored
Date: Mon, 18 Jan 2021 13:19:57 +0100
Message-ID: <CA+i-1C2Dk_AfqfMH6CttpjWYRxJ98LSQhTRUmYovbionJnAvsQ@mail.gmail.com>
In-Reply-To: <CA+i-1C19Fdas5PBLYwkD-+265gyEYbEaRkMKuD9t6PXsLr20YQ@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0539684525263002990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Jan 2021 at 12:53, Brendan Jackman <jackmanb@google.com> wrote:
>
> I copied in the attached config, installed the m68k toolchain:
>
> sudo apt install gcc-m68k-linux-gnu  # (m68k-linux-gnu-gcc (Debian
> 10.2.0-9) 10.2.0)
>
> Built with:
>
> CROSS_COMPILE=3Dm68k-linux-gnu- ARCH=3Dm68k make -j
>
> And I get this "needs 68020 or higher" error from all over the kernel
> tree. Sounds like a Kbuild bug to me, I will ignore it if you're OK
> with that.

Sorry, that's nonsense, this email is complaining about "Error:
operands mismatch", not "needs 68020 or higher".

> On Sat, 16 Jan 2021 at 09:20, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   git://git.ragnatech.se/linux net-next
> > head:   9ab7e76aefc97a9aa664accb59d6e8dc5e52514a
> > commit: 981f94c3e92146705baf97fb417a5ed1ab1a79a5 [317/356] bpf: Add bit=
wise atomic instructions
> > config: m68k-randconfig-r002-20210115 (attached as .config)
> > compiler: m68k-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git remote add ragnatech git://git.ragnatech.se/linux
> >         git fetch --no-tags ragnatech net-next
> >         git checkout 981f94c3e92146705baf97fb417a5ed1ab1a79a5
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss ARCH=3Dm68k
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    kernel/bpf/core.c:1350:12: warning: no previous prototype for 'bpf_p=
robe_read_kernel' [-Wmissing-prototypes]
> >     1350 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const =
void *unsafe_ptr)
> >          |            ^~~~~~~~~~~~~~~~~~~~~
> >    {standard input}: Assembler messages:
> >    {standard input}:3102: Error: invalid instruction for this architect=
ure; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [6=
8ec040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
> > >> {standard input}:3148: Error: operands mismatch -- statement `andl %=
a1,%d1' ignored
> >    {standard input}:3148: Error: invalid instruction for this architect=
ure; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [6=
8ec040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
> > >> {standard input}:3201: Error: operands mismatch -- statement `orl %a=
1,%d1' ignored
> >    {standard input}:3201: Error: invalid instruction for this architect=
ure; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [6=
8ec040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
> > >> {standard input}:3247: Error: operands mismatch -- statement `eorl %=
a1,%d1' ignored
> >    {standard input}:3247: Error: invalid instruction for this architect=
ure; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [6=
8ec040], 68060 [68ec060]) -- statement `casl %d0,%d1,(%a6)' ignored
> >    {standard input}:3270: Error: invalid instruction for this architect=
ure; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [6=
8ec040], 68060 [68ec060]) -- statement `casl %d0,%d5,(%a0)' ignored
> >    {standard input}:3307: Error: invalid instruction for this architect=
ure; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [6=
8ec040], 68060 [68ec060]) -- statement `casl %d0,%d5,(%a6)' ignored
> >

Did some fiddling to find where the error comes from and it is indeed
the new atomics code, specifically the ATOMIC_ALU_OP invocations, on
line 1645 [1]

I got a similar error from 0-day during development, in that case the
core issue seemed to be type casts that only made sense if pointers
were 64-bit. I think this is something different though:

The three errors are for the BPF_AND, BPF_OR and BPF_XOR invocations,
but the BPF_AND invocation doesn't produce the error. That makes me
think this might need some m68k knowledge... I added linux-m68k and
Geert from MAINTAINERS... any ideas?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree/k=
ernel/bpf/core.c?id=3D981f94c3e92146705baf97fb417a5ed1ab1a79a5#n1645
--===============0539684525263002990==--

