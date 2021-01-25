Content-Type: multipart/mixed; boundary="===============6462136594280066908=="
MIME-Version: 1.0
From: John David Anglin <dave.anglin@bell.net>
To: kbuild-all@lists.01.org
Subject: Re: hppa64-linux-ld: mm/hugetlb.o(.text+0x50dc): cannot reach printk
Date: Mon, 25 Jan 2021 13:34:28 -0500
Message-ID: <bed0d008-c5c0-011e-6f1e-fb248f97c009@bell.net>
In-Reply-To: <CAKwvOd=rrTLc510cEA84BC_zzYVQ0ifPEMhRRtU-cyYPs_E4eA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6462136594280066908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For calls, this issue can be avoided with -mlong-calls option.=C2=A0 Withou=
t this, 64-bit calls are limited to
a 22-bit pc-relative offset (8 MB).=C2=A0 This does make branches somewhat =
less efficient.=C2=A0 At the moment,
the 64-bit linker does not support adding branch extending stubs.

Thunks are currently limited to a 17-bit pc-relative offset.

Regards,
Dave

On 2021-01-25 12:54 p.m., Nick Desaulniers wrote:
> I suspect that adding some more sections here makes the distance
> between other sections too large to encode?  IIRC, arm (32b) linker
> can emit "range extending thunks" to help jump large distances.  Not
> sure what to make of this report; I wouldn't have expected this GCC
> randconfig to generate code in any of the sections that were added to
> the linkerscript in
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Deff8728fe69880d3f7983bec3fb6cea4c306261f.
>
> On Sat, Jan 16, 2021 at 6:37 AM kernel test robot <lkp@intel.com> wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
>> head:   1d94330a437a573cfdf848f6743b1ed169242c8a
>> commit: eff8728fe69880d3f7983bec3fb6cea4c306261f vmlinux.lds.h: Add PGO =
and AutoFDO input sections
>> date:   5 months ago
>> config: parisc-randconfig-r032-20210116 (attached as .config)
>> compiler: hppa64-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=3D1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git/commit/?id=3Deff8728fe69880d3f7983bec3fb6cea4c306261f
>>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel=
/git/torvalds/linux.git
>>         git fetch --no-tags linus master
>>         git checkout eff8728fe69880d3f7983bec3fb6cea4c306261f
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss ARCH=3Dparisc
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>    hppa64-linux-ld: mm/page_alloc.o(.ref.text+0x110): cannot reach unkno=
wn
>>    hppa64-linux-ld: mm/memblock.o(.text+0x27c): cannot reach __warn_prin=
tk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0xc4): cannot reach prin=
tk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0x140): cannot reach pri=
ntk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0x1e0): cannot reach mem=
move
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0x314): cannot reach mem=
move
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0x428): cannot reach mem=
move
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0x5d4): cannot reach __w=
arn_printk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0xb20): cannot reach pri=
ntk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0xce8): cannot reach pri=
ntk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0xd30): cannot reach pri=
ntk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0xd4c): cannot reach mem=
cpy
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0x1130): cannot reach pr=
intk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0x11e0): cannot reach pr=
intk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0x16d8): cannot reach pr=
intk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0x1788): cannot reach pr=
intk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0x1e04): cannot reach pr=
intk
>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0x1e2c): cannot reach pr=
intk
>>    hppa64-linux-ld: mm/memblock.o(.init.text+0x24): cannot reach strstr
>>    hppa64-linux-ld: mm/memblock.o(.init.text+0x100): cannot reach __warn=
_printk
>>    hppa64-linux-ld: mm/memblock.o(.init.text+0x118): cannot reach dump_s=
tack
>>    hppa64-linux-ld: mm/memblock.o(.init.text+0x220): cannot reach printk
>>    hppa64-linux-ld: mm/memblock.o(.init.text+0x48c): cannot reach printk
>>    hppa64-linux-ld: mm/memblock.o(.init.text+0x55c): cannot reach printk
>>    hppa64-linux-ld: mm/memblock.o(.init.text+0x62c): cannot reach printk
>>    hppa64-linux-ld: mm/memblock.o(.init.text+0x720): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x4cc): cannot reach _raw_spin_lo=
ck
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x580): cannot reach _raw_spin_un=
lock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x690): cannot reach _raw_spin_un=
lock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x768): cannot reach _raw_spin_un=
lock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x7c8): cannot reach _raw_spin_lo=
ck
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x938): cannot reach _raw_spin_lo=
ck
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x980): cannot reach _raw_spin_un=
lock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0xaf8): cannot reach sprintf
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0xb60): cannot reach sprintf
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0xbd0): cannot reach sprintf
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0xc38): cannot reach sprintf
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0xcd8): cannot reach _raw_spin_lo=
ck
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0xcf0): cannot reach _raw_spin_un=
lock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0xd7c): cannot reach __next_node_=
in
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0xdb4): cannot reach __next_node_=
in
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0xeb8): cannot reach _raw_spin_un=
lock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0xec8): cannot reach _raw_spin_lo=
ck
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0xf58): cannot reach sprintf
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x1638): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x16d8): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x1764): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x17d0): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x1974): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x1990): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x19b4): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x19d4): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x1d88): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x1db0): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2588): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2658): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x26a8): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x26e4): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x27b0): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2964): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2984): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x29bc): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2a00): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2a40): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2b38): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2b58): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2c14): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2c8c): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2ccc): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2df4): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2ed8): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2f38): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2f60): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2f84): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x2fc8): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x3018): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x3044): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x3218): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x3308): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x340c): cannot reach __xchg64
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x3580): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x35b0): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x3604): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x3aa0): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x3b00): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x3efc): cannot reach down_write
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x4484): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x46ac): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x4814): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x485c): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x48cc): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x4a1c): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x4a88): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x4b14): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x4c0c): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x4cc0): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x4d18): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x4dd4): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x4ed4): cannot reach __muldi3
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x5008): cannot reach sprintf
>>>> hppa64-linux-ld: mm/hugetlb.o(.text+0x50dc): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x51bc): cannot reach __muldi3
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x5348): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x535c): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x53d8): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x53ec): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x565c): cannot reach down_read
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x5890): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x58d4): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x59f4): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x5b94): cannot reach _raw_spin_l=
ock_irqsave
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x5bf4): cannot reach _raw_spin_u=
nlock_irqrestore
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x5c14): cannot reach _raw_spin_l=
ock_irqsave
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x5c34): cannot reach _raw_spin_u=
nlock_irqrestore
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x5f58): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x5fdc): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x613c): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x6248): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x643c): cannot reach down_write
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x64c0): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x6690): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x66c0): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x69a0): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x69c0): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x69d0): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x6a00): cannot reach ___ratelimit
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x6a28): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x6a80): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x6bf4): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x6d98): cannot reach mutex_unlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x6de0): cannot reach down_read
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x6df4): cannot reach mutex_lock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x705c): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x7344): cannot reach down_read
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x74ac): cannot reach mutex_lock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x74e0): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x7708): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x77b0): cannot reach mutex_unlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x7830): cannot reach mutex_unlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x794c): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x7978): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x7998): cannot reach mutex_unlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x7b14): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x7bfc): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x7ce4): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x7e84): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x7f0c): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8068): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8084): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x80b4): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8240): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8314): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8518): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x85e0): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8624): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x87a8): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8868): cannot reach down_write
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x889c): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x88ec): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8d40): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8d60): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8d9c): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8db8): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8e78): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8ea0): cannot reach __muldi3
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8ec0): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x8fd0): cannot reach __warn_prin=
tk
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x9074): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x90a4): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x90d4): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x92ec): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x9334): cannot reach __cmpxchg_u=
32
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x93dc): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x9454): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x9558): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x969c): cannot reach _raw_spin_l=
ock
>>    hppa64-linux-ld: mm/hugetlb.o(.text+0x96ac): cannot reach _raw_spin_u=
nlock
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0x248): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0x26c): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0x36c): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0x3d0): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0x3ec): cannot reach sscanf
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0x568): cannot reach snprintf
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0x728): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0x744): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0x8d4): cannot reach _raw_sp=
in_lock
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0x900): cannot reach _raw_sp=
in_unlock
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xa40): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xa70): cannot reach kobject=
_create_and_add
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xb64): cannot reach kobject=
_create_and_add
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xb9c): cannot reach kobject=
_put
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xbb4): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xc84): cannot reach __muldi3
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xde8): cannot reach memparse
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xec0): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xef0): cannot reach unknown
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xf94): cannot reach memparse
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xfcc): cannot reach printk
>>    hppa64-linux-ld: mm/hugetlb.o(.init.text+0xfe4): cannot reach unknown
>>    hppa64-linux-ld: mm/slab.o(.text+0x490): cannot reach __udivdi3
>>    hppa64-linux-ld: mm/slab.o(.text+0x4ac): cannot reach __umoddi3
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
>


-- =

John David Anglin  dave.anglin(a)bell.net


--===============6462136594280066908==--

