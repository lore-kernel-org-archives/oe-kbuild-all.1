Content-Type: multipart/mixed; boundary="===============1045389768246094443=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [hnaz-linux-mm:master 380/523] arch/riscv/kernel/kgdb.c:47:5: warning: no previous prototype for 'decode_register_index'
Date: Tue, 19 May 2020 19:05:21 -0700
Message-ID: <20200519190521.d19192c75279e5ca95209bc9@linux-foundation.org>
In-Reply-To: <202005191618.9XxheOor%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1045389768246094443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 19 May 2020 16:44:22 +0800 kbuild test robot <lkp@intel.com> wrot=
e:

> Hi Andrew,
> =

> First bad commit (maybe !=3D root cause):
> =

> tree:   https://github.com/hnaz/linux-mm master
> head:   2bbf0589bfeb27800c730b76eacf34528eee5418
> commit: 91cd0b1b65c463042fdeb4ab5ffcb64ae43179cf [380/523] linux-next-rej=
ects
> config: riscv-allyesconfig (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 91cd0b1b65c463042fdeb4ab5ffcb64ae43179cf
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Driscv =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> arch/riscv/kernel/kgdb.c:47:5: warning: no previous prototype for 'dec=
ode_register_index' [-Wmissing-prototypes]
> 47 | int decode_register_index(unsigned long opcode, int offset)
> |     ^~~~~~~~~~~~~~~~~~~~~
> >> arch/riscv/kernel/kgdb.c:52:5: warning: no previous prototype for 'dec=
ode_register_index_short' [-Wmissing-prototypes]
> 52 | int decode_register_index_short(unsigned long opcode, int offset)
> |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> arch/riscv/kernel/kgdb.c:58:5: warning: no previous prototype for 'get=
_step_address' [-Wmissing-prototypes]
> 58 | int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
> |     ^~~~~~~~~~~~~~~~
> >> arch/riscv/kernel/kgdb.c:139:5: warning: no previous prototype for 'do=
_single_step' [-Wmissing-prototypes]
> 139 | int do_single_step(struct pt_regs *regs)
> |     ^~~~~~~~~~~~~~
> >> arch/riscv/kernel/kgdb.c:276:6: warning: no previous prototype for 'kg=
db_arch_handle_qxfer_pkt' [-Wmissing-prototypes]
> 276 | void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
> |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >> arch/riscv/kernel/kgdb.c:323:5: warning: no previous prototype for 'kg=
db_riscv_kgdbbreak' [-Wmissing-prototypes]
> 323 | int kgdb_riscv_kgdbbreak(unsigned long addr)
> |     ^~~~~~~~~~~~~~~~~~~~
> In file included from arch/riscv/include/asm/kgdb.h:109,
> from include/linux/kgdb.h:20,
> from arch/riscv/kernel/kgdb.c:9:
> arch/riscv/include/asm/gdb_xml.h:7:19: warning: 'riscv_gdb_stub_feature' =
defined but not used [-Wunused-const-variable=3D]
> 7 | static const char riscv_gdb_stub_feature[64] =3D
> |                   ^~~~~~~~~~~~~~~~~~~~~~

I doubt if linux-next-rejects caused this error - all that patch does
is fix up a reject between linux-next patches and
https://ozlabs.org/~akpm/mmotm/broken-out/riscv-support-debug_wx.patch

I'm more suspecting that this error is due Vincent's e4f2aa5808fc9
("riscv: Add KGDB support") or 899dc734805df ("riscv: Use the XML
target descriptions to report 3 system registers").


--===============1045389768246094443==--

