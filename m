Content-Type: multipart/mixed; boundary="===============3501950460489791949=="
MIME-Version: 1.0
From: Fangrui Song <maskray@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [efi:next 22/40] ld.lld: warning: vsprintf.c:(.discard.unreachable+0x0): has non-ABS relocation R_X86_64_PC32 against symbol ''
Date: Wed, 20 May 2020 10:34:25 -0700
Message-ID: <20200520173425.ovn4kvv2cvkdlrnn@google.com>
In-Reply-To: <CAMj1kXGNmDPQRCCtRYFRa+0NW9kADnx327FzPbNge+MU+NFoVg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3501950460489791949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-05-20, Ard Biesheuvel wrote:
>On Wed, 20 May 2020 at 17:53, Arvind Sankar <nivedita@alum.mit.edu> wrot=
e:
>>
>> On Wed, May 20, 2020 at 10:28:13AM +0800, kbuild test robot wrote:
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git ne=
xt
>> > head:   e5fbadd1179cdadeaa44d71a9ec068c5bc100524
>> > commit: ce5e3f909fc0ed67e58367b9c56a54c20a51080b [22/40] efi/printf: A=
dd 64-bit and 8-bit integer support
>> > config: x86_64-defconfig (attached as .config)
>> > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 1=
35b877874fae96b4372c8a3fbfaa8ff44ff86e3)
>> > reproduce:
>> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
>> >         chmod +x ~/bin/make.cross
>> >         # install x86_64 cross compiling tool for clang build
>> >         # apt-get install binutils-x86-64-linux-gnu
>> >         git checkout ce5e3f909fc0ed67e58367b9c56a54c20a51080b
>> >         # save the attached .config to linux build tree
>> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross=
 ARCH=3Dx86_64
>> >
>> > If you fix the issue, kindly add following tag as appropriate
>> > Reported-by: kbuild test robot <lkp@intel.com>
>> >
>> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
>> >
>> > >> ld.lld: warning: vsprintf.c:(.discard.unreachable+0x0): has non-ABS=
 relocation R_X86_64_PC32 against symbol ''
>> >
>> > ---
>> > 0-DAY CI Kernel Test Service, Intel Corporation
>> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>>
>> Clang folk, is anything actually wrong here? This seems to result from
>> use of unreachable() annotation, which generates these
>> .discard.unreachable sections apparently to help objtool.
>>
>
>This came up before, and IIRC, it has already been fixed, only this
>branch is based on v5.7-rc2.

LLD reports the diagnostic because a PC-relative relocation referencing a
SHF_ALLOC section from a non-SHF_ALLOC section (.discard.unreachable) canno=
t be
reasonably represented. A non-SHF_ALLOC section is not part of the memory i=
mage, thus conceptually
the distance between a non-SHF_ALLOC and a SHF_ALLOC is not a constant whic=
h can be resolved at linktime.
This is actually a nice diagnostic which has caught a number of issues.

% readelf -Wr drivers/firmware/efi/libstub/vsprintf.stub.o
..
Relocation section '.rela.discard.unreachable' at offset 0xe38 contains 1 e=
ntry:
     Offset             Info             Type               Symbol's Value =
 Symbol's Name + Addend
0000000000000000  0000000600000002 R_X86_64_PC32          0000000000000000 =
.text + ac0

---

The linker command line is:

% ld.lld -m elf_x86_64 -T arch/x86/boot/compressed/vmlinux.lds arch/x86/boo=
t/compressed/kernel_info.o arch/x86/boot/compressed/head_64.o arch/x86/boot=
/compressed/misc.o arch/x86/boot/compressed/string.o arch/x86/boot/compress=
ed/cmdline.o arch/x86/boot/compressed/error.o arch/x86/boot/compressed/pigg=
y.o arch/x86/boot/compressed/cpuflags.o arch/x86/boot/compressed/early_seri=
al_console.o arch/x86/boot/compressed/kaslr.o arch/x86/boot/compressed/kasl=
r_64.o arch/x86/boot/compressed/mem_encrypt.o arch/x86/boot/compressed/pgta=
ble_64.o arch/x86/boot/compressed/acpi.o drivers/firmware/efi/libstub/lib.a=
 arch/x86/boot/compressed/efi_thunk_64.o -o arch/x86/boot/compressed/vmlinux
ld.lld: warning: vsprintf.c:(.discard.unreachable+0x0): has non-ABS relocat=
ion R_X86_64_PC32 against symbol ''

arch/x86/boot/compressed/vmlinux has an output section .discard.unreachable=
 , which is likely desired.

Note that arch/x86/kernel/vmlinux.lds.S has an output section description /=
DISCARD/ : { ... *(.discard.*) ... },
but arch/x86/boot/compressed/vmlinux doesn't.

We can let arch/x86/boot/compressed/vmlinux reuse the /DISCARD/ to fix the =
issue.
--===============3501950460489791949==--

