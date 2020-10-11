Content-Type: multipart/mixed; boundary="===============6530655061860375560=="
MIME-Version: 1.0
From: Ard Biesheuvel <ardb@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [arm-integrator:kasan 2/7] arch/arm/kernel/setup.c:1083:15: warning: assignment to 'void from 'unsigned int' makes pointer from integer without a cast
Date: Sun, 11 Oct 2020 11:08:39 +0200
Message-ID: <CAMj1kXH1tn7NE9k+LkjRKtcJ77f-dQf85VZWCTsD+gF0c3GWWQ@mail.gmail.com>
In-Reply-To: <202010092155.51pC26FS-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6530655061860375560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Oct 2020 at 15:53, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-inte=
grator.git kasan
> head:   b9995640ae9fabb0e38e6ab835c177e17d841f4e
> commit: 1cc723bead27ffb24f2c0d236f1258c4f32ae4ff [2/7] ARM: move device t=
ree mapping out of linear region
> config: arm-randconfig-r035-20201009 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-in=
tegrator.git/commit/?id=3D1cc723bead27ffb24f2c0d236f1258c4f32ae4ff
>         git remote add arm-integrator https://git.kernel.org/pub/scm/linu=
x/kernel/git/linusw/linux-integrator.git
>         git fetch --no-tags arm-integrator kasan
>         git checkout 1cc723bead27ffb24f2c0d236f1258c4f32ae4ff
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    arch/arm/kernel/setup.c: In function 'early_print':
>    arch/arm/kernel/setup.c:371:2: warning: function 'early_print' might b=
e a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=3Dform=
at]
>      371 |  vsnprintf(buf, sizeof(buf), str, ap);
>          |  ^~~~~~~~~
>    arch/arm/kernel/setup.c: In function 'setup_arch':
> >> arch/arm/kernel/setup.c:1083:15: warning: assignment to 'void *' from =
'unsigned int' makes pointer from integer without a cast [-Wint-conversion]
>     1083 |   atags_vaddr =3D FDT_VIRT_ADDR(__atags_pointer);
>          |               ^

The no-MMU definition of FDT_VIRT_ADDR() is missing a void* cast - I
will add that before dropping the patches into the patch system.


>    In file included from arch/arm/include/asm/efi.h:12,
>                     from arch/arm/kernel/setup.c:37:
>    At top level:
>    arch/arm/include/asm/fixmap.h:39:35: warning: '__end_of_fixed_addresse=
s' defined but not used [-Wunused-const-variable=3D]
>       39 | static const enum fixed_addresses __end_of_fixed_addresses =3D
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
>
> vim +1083 arch/arm/kernel/setup.c
>
>   1076
>   1077  void __init setup_arch(char **cmdline_p)
>   1078  {
>   1079          const struct machine_desc *mdesc =3D NULL;
>   1080          void *atags_vaddr;
>   1081
>   1082          if (__atags_pointer)
> > 1083                  atags_vaddr =3D FDT_VIRT_ADDR(__atags_pointer);
>   1084
>   1085          setup_processor();
>   1086          if (atags_vaddr) {
>   1087                  mdesc =3D setup_machine_fdt(atags_vaddr);
>   1088                  if (mdesc)
>   1089                          memblock_reserve(__atags_pointer,
>   1090                                           fdt_totalsize(atags_vadd=
r));
>   1091          }
>   1092          if (!mdesc)
>   1093                  mdesc =3D setup_machine_tags(atags_vaddr, __machi=
ne_arch_type);
>   1094          if (!mdesc) {
>   1095                  early_print("\nError: invalid dtb and unrecognize=
d/unsupported machine ID\n");
>   1096                  early_print("  r1=3D0x%08x, r2=3D0x%08x\n", __mac=
hine_arch_type,
>   1097                              __atags_pointer);
>   1098                  if (__atags_pointer)
>   1099                          early_print("  r2[]=3D%*ph\n", 16, atags_=
vaddr);
>   1100                  dump_machine_table();
>   1101          }
>   1102
>   1103          machine_desc =3D mdesc;
>   1104          machine_name =3D mdesc->name;
>   1105          dump_stack_set_arch_desc("%s", mdesc->name);
>   1106
>   1107          if (mdesc->reboot_mode !=3D REBOOT_HARD)
>   1108                  reboot_mode =3D mdesc->reboot_mode;
>   1109
>   1110          init_mm.start_code =3D (unsigned long) _text;
>   1111          init_mm.end_code   =3D (unsigned long) _etext;
>   1112          init_mm.end_data   =3D (unsigned long) _edata;
>   1113          init_mm.brk        =3D (unsigned long) _end;
>   1114
>   1115          /* populate cmd_line too for later use, preserving boot_c=
ommand_line */
>   1116          strlcpy(cmd_line, boot_command_line, COMMAND_LINE_SIZE);
>   1117          *cmdline_p =3D cmd_line;
>   1118
>   1119          early_fixmap_init();
>   1120          early_ioremap_init();
>   1121
>   1122          parse_early_param();
>   1123
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6530655061860375560==--

