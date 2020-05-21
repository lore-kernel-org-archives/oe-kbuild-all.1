Content-Type: multipart/mixed; boundary="===============5363860166977246067=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [hnaz-linux-mm:master 380/523] arch/riscv/kernel/kgdb.c:47:5: warning: no previous prototype for 'decode_register_index'
Date: Thu, 21 May 2020 08:57:22 +0800
Message-ID: <34dc406f-e7f5-53b5-3b18-d3b34fe5fd68@intel.com>
In-Reply-To: <CABvJ_xg3O5Or-19_O8LRCnq2Wk79DdOqWRnYa-mz_+czaOTq4w@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5363860166977246067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/20/20 5:00 PM, Vincent Chen wrote:
> On Wed, May 20, 2020 at 10:05 AM Andrew Morton
> <akpm@linux-foundation.org> wrote:
>> On Tue, 19 May 2020 16:44:22 +0800 kbuild test robot <lkp@intel.com> w=
rote:
>>
>>> Hi Andrew,
>>>
>>> First bad commit (maybe !=3D root cause):
>>>
>>> tree:   https://github.com/hnaz/linux-mm master
>>> head:   2bbf0589bfeb27800c730b76eacf34528eee5418
>>> commit: 91cd0b1b65c463042fdeb4ab5ffcb64ae43179cf [380/523] linux-next-r=
ejects
>>> config: riscv-allyesconfig (attached as .config)
>>> compiler: riscv64-linux-gcc (GCC) 9.3.0
>>> reproduce:
>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          git checkout 91cd0b1b65c463042fdeb4ab5ffcb64ae43179cf
>>>          # save the attached .config to linux build tree
>>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.c=
ross ARCH=3Driscv
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>
>>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>>
>>>>> arch/riscv/kernel/kgdb.c:47:5: warning: no previous prototype for 'de=
code_register_index' [-Wmissing-prototypes]
>>> 47 | int decode_register_index(unsigned long opcode, int offset)
>>> |     ^~~~~~~~~~~~~~~~~~~~~
>>>>> arch/riscv/kernel/kgdb.c:52:5: warning: no previous prototype for 'de=
code_register_index_short' [-Wmissing-prototypes]
>>> 52 | int decode_register_index_short(unsigned long opcode, int offset)
>>> |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>> arch/riscv/kernel/kgdb.c:58:5: warning: no previous prototype for 'ge=
t_step_address' [-Wmissing-prototypes]
>>> 58 | int get_step_address(struct pt_regs *regs, unsigned long *next_add=
r)
>>> |     ^~~~~~~~~~~~~~~~
>>>>> arch/riscv/kernel/kgdb.c:139:5: warning: no previous prototype for 'd=
o_single_step' [-Wmissing-prototypes]
>>> 139 | int do_single_step(struct pt_regs *regs)
>>> |     ^~~~~~~~~~~~~~
>>>>> arch/riscv/kernel/kgdb.c:276:6: warning: no previous prototype for 'k=
gdb_arch_handle_qxfer_pkt' [-Wmissing-prototypes]
>>> 276 | void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
>>> |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>> arch/riscv/kernel/kgdb.c:323:5: warning: no previous prototype for 'k=
gdb_riscv_kgdbbreak' [-Wmissing-prototypes]
>>> 323 | int kgdb_riscv_kgdbbreak(unsigned long addr)
>>> |     ^~~~~~~~~~~~~~~~~~~~
>>> In file included from arch/riscv/include/asm/kgdb.h:109,
>>> from include/linux/kgdb.h:20,
>>> from arch/riscv/kernel/kgdb.c:9:
>>> arch/riscv/include/asm/gdb_xml.h:7:19: warning: 'riscv_gdb_stub_feature=
' defined but not used [-Wunused-const-variable=3D]
>>> 7 | static const char riscv_gdb_stub_feature[64] =3D
>>> |                   ^~~~~~~~~~~~~~~~~~~~~~
>> I doubt if linux-next-rejects caused this error - all that patch does
>> is fix up a reject between linux-next patches and
>> https://ozlabs.org/~akpm/mmotm/broken-out/riscv-support-debug_wx.patch
>>
>> I'm more suspecting that this error is due Vincent's e4f2aa5808fc9
>> ("riscv: Add KGDB support") or 899dc734805df ("riscv: Use the XML
>> target descriptions to report 3 system registers").
>>
>>
> I tried to use the following commands to reproduce the above warning
> messages, but I failed.
> 1. git clone https://github.com/hnaz/linux-mm
> 2. wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/mak=
e.cross
> -O ~/bin/make.cross
> 3. chmod +x ~/bin/make.cross
> 4. cd linux-mm
> 5. git checkout 91cd0b1b65c463042fdeb4ab5ffcb64ae43179cf
> 6. make ARCH=3Driscv allyesconfig
> 7. COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross ARC=
H=3Driscv
>
> Could you help me correct the reproduce steps?

Hi Vincent,

Sorry for the inconvenience, it's a W=3D1 build, please download the new =

make.cross
and it could be reproduce.

Best Regards,
Rong Chen


--===============5363860166977246067==--

