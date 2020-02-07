Content-Type: multipart/mixed; boundary="===============3812216781036433929=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v6 01/11] asm-generic/pgtable: Adds generic functions to track lockless pgtable walks
Date: Fri, 07 Feb 2020 13:39:41 +0800
Message-ID: <202002071321.7I3DHPZA%lkp@intel.com>
In-Reply-To: <20200206030900.147032-2-leonardo@linux.ibm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3812216781036433929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Leonardo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on asm-generic/master paulus-powerpc/kvm-ppc-next li=
nus/master v5.5 next-20200207]
[cannot apply to kvm-ppc/kvm-ppc-next]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Leonardo-Bras/Introduces-n=
ew-functions-for-tracking-lockless-pagetable-walks/20200207-071035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
config: xtensa-common_defconfig (attached as .config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dxtensa =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   include/asm-generic/pgtable.h: Assembler messages:
   include/asm-generic/pgtable.h:1230: Error: unknown opcode or format name=
 'static'
   include/asm-generic/pgtable.h:1231: Error: unknown opcode or format name=
 'unsigned'
   include/asm-generic/pgtable.h:1233: Error: unknown opcode or format name=
 'unsigned'
   include/asm-generic/pgtable.h:1240: Error: unknown opcode or format name=
 'local_irq_save'
   include/asm-generic/pgtable.h:1248: Error: unknown opcode or format name=
 'smp_mb'
   include/asm-generic/pgtable.h:1250: Error: unknown opcode or format name=
 'return'
>> include/asm-generic/pgtable.h:1251: Error: couldn't find a valid instruc=
tion format
       ops were: =

   include/asm-generic/pgtable.h:1257: Error: unknown opcode or format name=
 'static'
   include/asm-generic/pgtable.h:1265: Error: unknown opcode or format name=
 'smp_mb'
   include/asm-generic/pgtable.h:1272: Error: unknown opcode or format name=
 'local_irq_restore'
   include/asm-generic/pgtable.h:1273: Error: couldn't find a valid instruc=
tion format
       ops were: =


vim +1251 include/asm-generic/pgtable.h

  1224	=

  1225	#ifndef __HAVE_ARCH_LOCKLESS_PGTBL_WALK_CONTROL
  1226	/*
  1227	 * begin_lockless_pgtbl_walk: Must be inserted before a function cal=
l that does
  1228	 *   lockless pagetable walks, such as __find_linux_pte()
  1229	 */
  1230	static inline
  1231	unsigned long begin_lockless_pgtbl_walk(void)
  1232	{
  1233		unsigned long irq_mask;
  1234	=

  1235		/*
  1236		 * Interrupts must be disabled during the lockless page table walk.
  1237		 * That's because the deleting or splitting involves flushing TLBs,
  1238		 * which in turn issues interrupts, that will block when disabled.
  1239		 */
  1240		local_irq_save(irq_mask);
  1241	=

  1242		/*
  1243		 * This memory barrier pairs with any code that is either trying to
  1244		 * delete page tables, or split huge pages. Without this barrier,
  1245		 * the page tables could be read speculatively outside of interrupt
  1246		 * disabling.
  1247		 */
  1248		smp_mb();
  1249	=

  1250		return irq_mask;
> 1251	}
  1252	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============3812216781036433929==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
7tyTaWPz/wFnP8QPhaIAAA==
--===============3812216781036433929==--

