Content-Type: multipart/mixed; boundary="===============9033396264648287688=="
MIME-Version: 1.0
From: Fangrui Song <maskray@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [efi:next 22/40] ld.lld: warning: vsprintf.c:(.discard.unreachable+0x0): has non-ABS relocation R_X86_64_PC32 against symbol ''
Date: Wed, 20 May 2020 11:26:36 -0700
Message-ID: <20200520182636.jnnobtrcwmksb3tf@google.com>
In-Reply-To: <20200520173926.GA3365034@rani.riverdale.lan>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9033396264648287688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2020-05-20, Arvind Sankar wrote:
>On Wed, May 20, 2020 at 10:34:25AM -0700, Fangrui Song wrote:
>> On 2020-05-20, Ard Biesheuvel wrote:
>> >On Wed, 20 May 2020 at 17:53, Arvind Sankar <nivedita@alum.mit.edu> w=
rote:
>> >>
>> >> On Wed, May 20, 2020 at 10:28:13AM +0800, kbuild test robot wrote:
>> >> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git=
 next
>> >> > head:   e5fbadd1179cdadeaa44d71a9ec068c5bc100524
>> >> > commit: ce5e3f909fc0ed67e58367b9c56a54c20a51080b [22/40] efi/printf=
: Add 64-bit and 8-bit integer support
>> >> > config: x86_64-defconfig (attached as .config)
>> >> > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-projec=
t 135b877874fae96b4372c8a3fbfaa8ff44ff86e3)
>> >> > reproduce:
>> >> >         wget https://raw.githubusercontent.com/intel/lkp-tests/mast=
er/sbin/make.cross -O ~/bin/make.cross
>> >> >         chmod +x ~/bin/make.cross
>> >> >         # install x86_64 cross compiling tool for clang build
>> >> >         # apt-get install binutils-x86-64-linux-gnu
>> >> >         git checkout ce5e3f909fc0ed67e58367b9c56a54c20a51080b
>> >> >         # save the attached .config to linux build tree
>> >> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cr=
oss ARCH=3Dx86_64
>> >> >
>> >> > If you fix the issue, kindly add following tag as appropriate
>> >> > Reported-by: kbuild test robot <lkp@intel.com>
>> >> >
>> >> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
>> >> >
>> >> > >> ld.lld: warning: vsprintf.c:(.discard.unreachable+0x0): has non-=
ABS relocation R_X86_64_PC32 against symbol ''
>> >> >
>> >> > ---
>> >> > 0-DAY CI Kernel Test Service, Intel Corporation
>> >> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>> >>
>> >> Clang folk, is anything actually wrong here? This seems to result from
>> >> use of unreachable() annotation, which generates these
>> >> .discard.unreachable sections apparently to help objtool.
>> >>
>> >
>> >This came up before, and IIRC, it has already been fixed, only this
>> >branch is based on v5.7-rc2.
>>
>> LLD reports the diagnostic because a PC-relative relocation referencing a
>> SHF_ALLOC section from a non-SHF_ALLOC section (.discard.unreachable) ca=
nnot be
>> reasonably represented. A non-SHF_ALLOC section is not part of the memor=
y image, thus conceptually
>> the distance between a non-SHF_ALLOC and a SHF_ALLOC is not a constant w=
hich can be resolved at linktime.
>> This is actually a nice diagnostic which has caught a number of issues.
>>
>> % readelf -Wr drivers/firmware/efi/libstub/vsprintf.stub.o
>> ..
>> Relocation section '.rela.discard.unreachable' at offset 0xe38 contains =
1 entry:
>>      Offset             Info             Type               Symbol's Val=
ue  Symbol's Name + Addend
>> 0000000000000000  0000000600000002 R_X86_64_PC32          00000000000000=
00 .text + ac0
>>
>> ---
>>
>> The linker command line is:
>>
>> % ld.lld -m elf_x86_64 -T arch/x86/boot/compressed/vmlinux.lds arch/x86/=
boot/compressed/kernel_info.o arch/x86/boot/compressed/head_64.o arch/x86/b=
oot/compressed/misc.o arch/x86/boot/compressed/string.o arch/x86/boot/compr=
essed/cmdline.o arch/x86/boot/compressed/error.o arch/x86/boot/compressed/p=
iggy.o arch/x86/boot/compressed/cpuflags.o arch/x86/boot/compressed/early_s=
erial_console.o arch/x86/boot/compressed/kaslr.o arch/x86/boot/compressed/k=
aslr_64.o arch/x86/boot/compressed/mem_encrypt.o arch/x86/boot/compressed/p=
gtable_64.o arch/x86/boot/compressed/acpi.o drivers/firmware/efi/libstub/li=
b.a arch/x86/boot/compressed/efi_thunk_64.o -o arch/x86/boot/compressed/vml=
inux
>> ld.lld: warning: vsprintf.c:(.discard.unreachable+0x0): has non-ABS relo=
cation R_X86_64_PC32 against symbol ''
>>
>> arch/x86/boot/compressed/vmlinux has an output section .discard.unreacha=
ble , which is likely desired.
>
>You mean /not/ desired, right?

You are right:) I meant "undesired"

>
>>
>> Note that arch/x86/kernel/vmlinux.lds.S has an output section descriptio=
n /DISCARD/ : { ... *(.discard.*) ... },
>> but arch/x86/boot/compressed/vmlinux doesn't.
>>
>> We can let arch/x86/boot/compressed/vmlinux reuse the /DISCARD/ to fix t=
he issue.
>
>Yep.

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git HEAD
does not have the warning.
https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git HEAD has the
warning.

Sent http://lore.kernel.org/r/20200520182010.242489-1-maskray(a)google.com
"[PATCH] x86/boot: Discard .discard.unreachable for arch/x86/boot/compresse=
d/vmlinux"
which should fix the problem.

I am still a kernel newbie. I set To: to you and both x86(a)kernel.org and
linux-efi(a)vger.kernel.org
Hope that is correct.
--===============9033396264648287688==--

