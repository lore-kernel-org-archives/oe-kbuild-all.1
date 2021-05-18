Content-Type: multipart/mixed; boundary="===============2041480172725183536=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arm-platforms:irq/domain_cleanup 7/39] arch/mips/sgi-ip30/ip30-irq.c:222:2: error: implicit declaration of function 'irq_domain_set_info'
Date: Wed, 19 May 2021 07:47:56 +0800
Message-ID: <202105190752.jlPrcX6y-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2041480172725183536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.g=
it irq/domain_cleanup
head:   5019b17f095613b0b187d1cdcaa798347de62033
commit: e02a045e1bf414960f6b563a638c88ac6c96e490 [7/39] MIPS: Do not includ=
e linux/irqdomain.h from asm/irq.h
config: mips-randconfig-r003-20210519 (attached as .config)
compiler: mips64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms=
.git/commit/?id=3De02a045e1bf414960f6b563a638c88ac6c96e490
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/k=
ernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/domain_cleanup
        git checkout e02a045e1bf414960f6b563a638c88ac6c96e490
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   arch/mips/sgi-ip30/ip30-irq.c: In function 'ip30_normal_irq':
   arch/mips/sgi-ip30/ip30-irq.c:132:9: error: implicit declaration of func=
tion 'irq_linear_revmap' [-Werror=3Dimplicit-function-declaration]
     132 |   irq =3D irq_linear_revmap(domain, __ffs(pend));
         |         ^~~~~~~~~~~~~~~~~
   arch/mips/sgi-ip30/ip30-irq.c: In function 'heart_domain_alloc':
>> arch/mips/sgi-ip30/ip30-irq.c:222:2: error: implicit declaration of func=
tion 'irq_domain_set_info' [-Werror=3Dimplicit-function-declaration]
     222 |  irq_domain_set_info(domain, virq, hwirq, &heart_irq_chip, hd,
         |  ^~~~~~~~~~~~~~~~~~~
   arch/mips/sgi-ip30/ip30-irq.c: In function 'heart_domain_free':
>> arch/mips/sgi-ip30/ip30-irq.c:236:9: error: implicit declaration of func=
tion 'irq_domain_get_irq_data'; did you mean 'irq_desc_get_irq_data'? [-Wer=
ror=3Dimplicit-function-declaration]
     236 |  irqd =3D irq_domain_get_irq_data(domain, virq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         irq_desc_get_irq_data
>> arch/mips/sgi-ip30/ip30-irq.c:236:7: warning: assignment to 'struct irq_=
data *' from 'int' makes pointer from integer without a cast [-Wint-convers=
ion]
     236 |  irqd =3D irq_domain_get_irq_data(domain, virq);
         |       ^
   arch/mips/sgi-ip30/ip30-irq.c: At top level:
>> arch/mips/sgi-ip30/ip30-irq.c:243:21: error: variable 'heart_domain_ops'=
 has initializer but incomplete type
     243 | static const struct irq_domain_ops heart_domain_ops =3D {
         |                     ^~~~~~~~~~~~~~
>> arch/mips/sgi-ip30/ip30-irq.c:244:3: error: 'const struct irq_domain_ops=
' has no member named 'alloc'
     244 |  .alloc =3D heart_domain_alloc,
         |   ^~~~~
>> arch/mips/sgi-ip30/ip30-irq.c:244:11: warning: excess elements in struct=
 initializer
     244 |  .alloc =3D heart_domain_alloc,
         |           ^~~~~~~~~~~~~~~~~~
   arch/mips/sgi-ip30/ip30-irq.c:244:11: note: (near initialization for 'he=
art_domain_ops')
>> arch/mips/sgi-ip30/ip30-irq.c:245:3: error: 'const struct irq_domain_ops=
' has no member named 'free'
     245 |  .free  =3D heart_domain_free,
         |   ^~~~
   arch/mips/sgi-ip30/ip30-irq.c:245:11: warning: excess elements in struct=
 initializer
     245 |  .free  =3D heart_domain_free,
         |           ^~~~~~~~~~~~~~~~~
   arch/mips/sgi-ip30/ip30-irq.c:245:11: note: (near initialization for 'he=
art_domain_ops')
   arch/mips/sgi-ip30/ip30-irq.c: In function 'arch_init_irq':
>> arch/mips/sgi-ip30/ip30-irq.c:307:7: error: implicit declaration of func=
tion 'irq_domain_alloc_named_fwnode' [-Werror=3Dimplicit-function-declarati=
on]
     307 |  fn =3D irq_domain_alloc_named_fwnode("HEART");
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/mips/sgi-ip30/ip30-irq.c:307:5: warning: assignment to 'struct fwno=
de_handle *' from 'int' makes pointer from integer without a cast [-Wint-co=
nversion]
     307 |  fn =3D irq_domain_alloc_named_fwnode("HEART");
         |     ^
>> arch/mips/sgi-ip30/ip30-irq.c:311:11: error: implicit declaration of fun=
ction 'irq_domain_create_linear' [-Werror=3Dimplicit-function-declaration]
     311 |  domain =3D irq_domain_create_linear(fn, HEART_NUM_IRQS,
         |           ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/mips/sgi-ip30/ip30-irq.c:311:9: warning: assignment to 'struct irq_=
domain *' from 'int' makes pointer from integer without a cast [-Wint-conve=
rsion]
     311 |  domain =3D irq_domain_create_linear(fn, HEART_NUM_IRQS,
         |         ^
>> arch/mips/sgi-ip30/ip30-irq.c:317:2: error: implicit declaration of func=
tion 'irq_set_default_host' [-Werror=3Dimplicit-function-declaration]
     317 |  irq_set_default_host(domain);
         |  ^~~~~~~~~~~~~~~~~~~~
   arch/mips/sgi-ip30/ip30-irq.c: At top level:
>> arch/mips/sgi-ip30/ip30-irq.c:243:36: error: storage size of 'heart_doma=
in_ops' isn't known
     243 | static const struct irq_domain_ops heart_domain_ops =3D {
         |                                    ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   arch/mips/pci/pci-xtalk-bridge.c: In function 'bridge_domain_alloc':
>> arch/mips/pci/pci-xtalk-bridge.c:347:8: error: implicit declaration of f=
unction 'irq_domain_alloc_irqs_parent' [-Werror=3Dimplicit-function-declara=
tion]
     347 |  ret =3D irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg=
);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/mips/pci/pci-xtalk-bridge.c:351:3: error: implicit declaration of f=
unction 'irq_domain_set_info' [-Werror=3Dimplicit-function-declaration]
     351 |   irq_domain_set_info(domain, virq, info->pin, &bridge_irq_chip,
         |   ^~~~~~~~~~~~~~~~~~~
   arch/mips/pci/pci-xtalk-bridge.c: In function 'bridge_domain_free':
>> arch/mips/pci/pci-xtalk-bridge.c:363:26: error: implicit declaration of =
function 'irq_domain_get_irq_data'; did you mean 'irq_desc_get_irq_data'? [=
-Werror=3Dimplicit-function-declaration]
     363 |  struct irq_data *irqd =3D irq_domain_get_irq_data(domain, virq);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                          irq_desc_get_irq_data
>> arch/mips/pci/pci-xtalk-bridge.c:363:26: warning: initialization of 'str=
uct irq_data *' from 'int' makes pointer from integer without a cast [-Wint=
-conversion]
>> arch/mips/pci/pci-xtalk-bridge.c:369:2: error: implicit declaration of f=
unction 'irq_domain_free_irqs_top' [-Werror=3Dimplicit-function-declaration]
     369 |  irq_domain_free_irqs_top(domain, virq, nr_irqs);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/pci/pci-xtalk-bridge.c: At top level:
>> arch/mips/pci/pci-xtalk-bridge.c:418:21: error: variable 'bridge_domain_=
ops' has initializer but incomplete type
     418 | static const struct irq_domain_ops bridge_domain_ops =3D {
         |                     ^~~~~~~~~~~~~~
>> arch/mips/pci/pci-xtalk-bridge.c:419:3: error: 'const struct irq_domain_=
ops' has no member named 'alloc'
     419 |  .alloc      =3D bridge_domain_alloc,
         |   ^~~~~
>> arch/mips/pci/pci-xtalk-bridge.c:419:16: warning: excess elements in str=
uct initializer
     419 |  .alloc      =3D bridge_domain_alloc,
         |                ^~~~~~~~~~~~~~~~~~~
   arch/mips/pci/pci-xtalk-bridge.c:419:16: note: (near initialization for =
'bridge_domain_ops')
>> arch/mips/pci/pci-xtalk-bridge.c:420:3: error: 'const struct irq_domain_=
ops' has no member named 'free'
     420 |  .free       =3D bridge_domain_free,
         |   ^~~~
   arch/mips/pci/pci-xtalk-bridge.c:420:16: warning: excess elements in str=
uct initializer
     420 |  .free       =3D bridge_domain_free,
         |                ^~~~~~~~~~~~~~~~~~
   arch/mips/pci/pci-xtalk-bridge.c:420:16: note: (near initialization for =
'bridge_domain_ops')
>> arch/mips/pci/pci-xtalk-bridge.c:421:3: error: 'const struct irq_domain_=
ops' has no member named 'activate'
     421 |  .activate   =3D bridge_domain_activate,
         |   ^~~~~~~~
   arch/mips/pci/pci-xtalk-bridge.c:421:16: warning: excess elements in str=
uct initializer
     421 |  .activate   =3D bridge_domain_activate,
         |                ^~~~~~~~~~~~~~~~~~~~~~
   arch/mips/pci/pci-xtalk-bridge.c:421:16: note: (near initialization for =
'bridge_domain_ops')
>> arch/mips/pci/pci-xtalk-bridge.c:422:3: error: 'const struct irq_domain_=
ops' has no member named 'deactivate'
     422 |  .deactivate =3D bridge_domain_deactivate
         |   ^~~~~~~~~~
   arch/mips/pci/pci-xtalk-bridge.c:422:16: warning: excess elements in str=
uct initializer
     422 |  .deactivate =3D bridge_domain_deactivate
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/pci/pci-xtalk-bridge.c:422:16: note: (near initialization for =
'bridge_domain_ops')
   arch/mips/pci/pci-xtalk-bridge.c: In function 'bridge_map_irq':
>> arch/mips/pci/pci-xtalk-bridge.c:457:9: error: implicit declaration of f=
unction 'irq_domain_alloc_irqs' [-Werror=3Dimplicit-function-declaration]
     457 |   irq =3D irq_domain_alloc_irqs(bc->domain, 1, bc->nasid, &info);
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/pci/pci-xtalk-bridge.c: In function 'bridge_probe':
>> arch/mips/pci/pci-xtalk-bridge.c:622:11: error: implicit declaration of =
function 'irq_get_default_host' [-Werror=3Dimplicit-function-declaration]
     622 |  parent =3D irq_get_default_host();
         |           ^~~~~~~~~~~~~~~~~~~~
>> arch/mips/pci/pci-xtalk-bridge.c:622:9: warning: assignment to 'struct i=
rq_domain *' from 'int' makes pointer from integer without a cast [-Wint-co=
nversion]
     622 |  parent =3D irq_get_default_host();
         |         ^
>> arch/mips/pci/pci-xtalk-bridge.c:625:7: error: implicit declaration of f=
unction 'irq_domain_alloc_named_fwnode' [-Werror=3Dimplicit-function-declar=
ation]
     625 |  fn =3D irq_domain_alloc_named_fwnode("BRIDGE");
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/mips/pci/pci-xtalk-bridge.c:625:5: warning: assignment to 'struct f=
wnode_handle *' from 'int' makes pointer from integer without a cast [-Wint=
-conversion]
     625 |  fn =3D irq_domain_alloc_named_fwnode("BRIDGE");
         |     ^
>> arch/mips/pci/pci-xtalk-bridge.c:628:11: error: implicit declaration of =
function 'irq_domain_create_hierarchy' [-Werror=3Dimplicit-function-declara=
tion]
     628 |  domain =3D irq_domain_create_hierarchy(parent, 0, 8, fn,
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/pci/pci-xtalk-bridge.c:628:9: warning: assignment to 'struct i=
rq_domain *' from 'int' makes pointer from integer without a cast [-Wint-co=
nversion]
     628 |  domain =3D irq_domain_create_hierarchy(parent, 0, 8, fn,
         |         ^
>> arch/mips/pci/pci-xtalk-bridge.c:631:3: error: implicit declaration of f=
unction 'irq_domain_free_fwnode' [-Werror=3Dimplicit-function-declaration]
     631 |   irq_domain_free_fwnode(fn);
         |   ^~~~~~~~~~~~~~~~~~~~~~
>> arch/mips/pci/pci-xtalk-bridge.c:730:2: error: implicit declaration of f=
unction 'irq_domain_remove' [-Werror=3Dimplicit-function-declaration]
     730 |  irq_domain_remove(domain);
         |  ^~~~~~~~~~~~~~~~~
   arch/mips/pci/pci-xtalk-bridge.c: In function 'bridge_remove':
>> arch/mips/pci/pci-xtalk-bridge.c:739:39: error: dereferencing pointer to=
 incomplete type 'struct irq_domain'
     739 |  struct fwnode_handle *fn =3D bc->domain->fwnode;
         |                                       ^~
   arch/mips/pci/pci-xtalk-bridge.c: At top level:
   arch/mips/pci/pci-xtalk-bridge.c:418:36: error: storage size of 'bridge_=
domain_ops' isn't known
     418 | static const struct irq_domain_ops bridge_domain_ops =3D {
         |                                    ^~~~~~~~~~~~~~~~~
   In file included from arch/mips/include/asm/pci/bridge.h:17,
                    from arch/mips/pci/pci-xtalk-bridge.c:17:
   arch/mips/include/asm/xtalk/xwidget.h:124:46: warning: 'widget_idents' d=
efined but not used [-Wunused-const-variable=3D]
     124 | static const struct widget_ident __initconst widget_idents[] =3D=
 {
         |                                              ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/irq_domain_set_info +222 arch/mips/sgi-ip30/ip30-irq.c

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24   95  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24   96  static void ip30_normal=
_irq(struct irq_desc *desc)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24   97  {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24   98  	int cpu =3D smp_proces=
sor_id();
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24   99  	struct irq_domain *dom=
ain;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  100  	u64 pend, mask;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  101  	int irq;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  102  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  103  	pend =3D heart_read(&h=
eart_regs->isr);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  104  	mask =3D (heart_read(&=
heart_regs->imr[cpu]) &
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  105  		(HEART_L0_INT_MASK | =
HEART_L1_INT_MASK | HEART_L2_INT_MASK));
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  106  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  107  	pend &=3D mask;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  108  	if (unlikely(!pend))
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  109  		return;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  110  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  111  #ifdef CONFIG_SMP
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  112  	if (pend & BIT_ULL(HEA=
RT_L2_INT_RESCHED_CPU_0)) {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  113  		heart_write(BIT_ULL(H=
EART_L2_INT_RESCHED_CPU_0),
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  114  			    &heart_regs->cle=
ar_isr);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  115  		scheduler_ipi();
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  116  	} else if (pend & BIT_=
ULL(HEART_L2_INT_RESCHED_CPU_1)) {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  117  		heart_write(BIT_ULL(H=
EART_L2_INT_RESCHED_CPU_1),
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  118  			    &heart_regs->cle=
ar_isr);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  119  		scheduler_ipi();
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  120  	} else if (pend & BIT_=
ULL(HEART_L2_INT_CALL_CPU_0)) {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  121  		heart_write(BIT_ULL(H=
EART_L2_INT_CALL_CPU_0),
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  122  			    &heart_regs->cle=
ar_isr);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  123  		generic_smp_call_func=
tion_interrupt();
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  124  	} else if (pend & BIT_=
ULL(HEART_L2_INT_CALL_CPU_1)) {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  125  		heart_write(BIT_ULL(H=
EART_L2_INT_CALL_CPU_1),
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  126  			    &heart_regs->cle=
ar_isr);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  127  		generic_smp_call_func=
tion_interrupt();
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  128  	} else
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  129  #endif
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  130  	{
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  131  		domain =3D irq_desc_g=
et_handler_data(desc);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24 @132  		irq =3D irq_linear_re=
vmap(domain, __ffs(pend));
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  133  		if (irq)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  134  			generic_handle_irq(i=
rq);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  135  		else
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  136  			spurious_interrupt();
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  137  	}
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  138  }
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  139  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  140  static void ip30_ack_he=
art_irq(struct irq_data *d)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  141  {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  142  	heart_write(BIT_ULL(d-=
>hwirq), &heart_regs->clear_isr);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  143  }
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  144  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  145  static void ip30_mask_h=
eart_irq(struct irq_data *d)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  146  {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  147  	struct heart_irq_data =
*hd =3D irq_data_get_irq_chip_data(d);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  148  	unsigned long *mask =
=3D &per_cpu(irq_enable_mask, hd->cpu);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  149  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  150  	clear_bit(d->hwirq, ma=
sk);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  151  	heart_write(*mask, &he=
art_regs->imr[hd->cpu]);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  152  }
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  153  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  154  static void ip30_mask_a=
nd_ack_heart_irq(struct irq_data *d)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  155  {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  156  	struct heart_irq_data =
*hd =3D irq_data_get_irq_chip_data(d);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  157  	unsigned long *mask =
=3D &per_cpu(irq_enable_mask, hd->cpu);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  158  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  159  	clear_bit(d->hwirq, ma=
sk);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  160  	heart_write(*mask, &he=
art_regs->imr[hd->cpu]);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  161  	heart_write(BIT_ULL(d-=
>hwirq), &heart_regs->clear_isr);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  162  }
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  163  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  164  static void ip30_unmask=
_heart_irq(struct irq_data *d)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  165  {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  166  	struct heart_irq_data =
*hd =3D irq_data_get_irq_chip_data(d);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  167  	unsigned long *mask =
=3D &per_cpu(irq_enable_mask, hd->cpu);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  168  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  169  	set_bit(d->hwirq, mask=
);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  170  	heart_write(*mask, &he=
art_regs->imr[hd->cpu]);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  171  }
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  172  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  173  static int ip30_set_hea=
rt_irq_affinity(struct irq_data *d,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  174  				       const struct=
 cpumask *mask, bool force)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  175  {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  176  	struct heart_irq_data =
*hd =3D irq_data_get_irq_chip_data(d);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  177  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  178  	if (!hd)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  179  		return -EINVAL;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  180  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  181  	if (irqd_is_started(d))
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  182  		ip30_mask_and_ack_hea=
rt_irq(d);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  183  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  184  	hd->cpu =3D cpumask_fi=
rst_and(mask, cpu_online_mask);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  185  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  186  	if (irqd_is_started(d))
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  187  		ip30_unmask_heart_irq=
(d);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  188  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  189  	irq_data_update_effect=
ive_affinity(d, cpumask_of(hd->cpu));
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  190  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  191  	return 0;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  192  }
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  193  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  194  static struct irq_chip =
heart_irq_chip =3D {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  195  	.name			=3D "HEART",
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  196  	.irq_ack		=3D ip30_ack=
_heart_irq,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  197  	.irq_mask		=3D ip30_ma=
sk_heart_irq,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  198  	.irq_mask_ack		=3D ip3=
0_mask_and_ack_heart_irq,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  199  	.irq_unmask		=3D ip30_=
unmask_heart_irq,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  200  	.irq_set_affinity	=3D =
ip30_set_heart_irq_affinity,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  201  };
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  202  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  203  static int heart_domain=
_alloc(struct irq_domain *domain, unsigned int virq,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  204  			      unsigned int n=
r_irqs, void *arg)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  205  {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  206  	struct irq_alloc_info =
*info =3D arg;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  207  	struct heart_irq_data =
*hd;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  208  	int hwirq;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  209  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  210  	if (nr_irqs > 1 || !in=
fo)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  211  		return -EINVAL;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  212  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  213  	hd =3D kzalloc(sizeof(=
*hd), GFP_KERNEL);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  214  	if (!hd)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  215  		return -ENOMEM;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  216  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  217  	hwirq =3D heart_alloc_=
int();
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  218  	if (hwirq < 0) {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  219  		kfree(hd);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  220  		return -EAGAIN;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  221  	}
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24 @222  	irq_domain_set_info(do=
main, virq, hwirq, &heart_irq_chip, hd,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  223  			    handle_level_irq=
, NULL, NULL);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  224  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  225  	return 0;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  226  }
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  227  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  228  static void heart_domai=
n_free(struct irq_domain *domain,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  229  			      unsigned int v=
irq, unsigned int nr_irqs)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  230  {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  231  	struct irq_data *irqd;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  232  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  233  	if (nr_irqs > 1)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  234  		return;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  235  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24 @236  	irqd =3D irq_domain_ge=
t_irq_data(domain, virq);
c0e79fd89749b0 Thomas Bogendoerfer 2020-01-22  237  	if (irqd) {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  238  		clear_bit(irqd->hwirq=
, heart_irq_map);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  239  		kfree(irqd->chip_data=
);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  240  	}
c0e79fd89749b0 Thomas Bogendoerfer 2020-01-22  241  }
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  242  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24 @243  static const struct irq=
_domain_ops heart_domain_ops =3D {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24 @244  	.alloc =3D heart_domai=
n_alloc,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24 @245  	.free  =3D heart_domai=
n_free,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  246  };
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  247  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  248  void __init ip30_instal=
l_ipi(void)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  249  {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  250  	int cpu =3D smp_proces=
sor_id();
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  251  	unsigned long *mask =
=3D &per_cpu(irq_enable_mask, cpu);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  252  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  253  	set_bit(HEART_L2_INT_R=
ESCHED_CPU_0 + cpu, mask);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  254  	heart_write(BIT_ULL(HE=
ART_L2_INT_RESCHED_CPU_0 + cpu),
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  255  		    &heart_regs->clea=
r_isr);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  256  	set_bit(HEART_L2_INT_C=
ALL_CPU_0 + cpu, mask);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  257  	heart_write(BIT_ULL(HE=
ART_L2_INT_CALL_CPU_0 + cpu),
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  258  		    &heart_regs->clea=
r_isr);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  259  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  260  	heart_write(*mask, &he=
art_regs->imr[cpu]);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  261  }
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  262  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  263  void __init arch_init_i=
rq(void)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  264  {
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  265  	struct irq_domain *dom=
ain;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  266  	struct fwnode_handle *=
fn;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  267  	unsigned long *mask;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  268  	int i;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  269  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  270  	mips_cpu_irq_init();
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  271  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  272  	/* Mask all IRQs. */
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  273  	heart_write(HEART_CLR_=
ALL_MASK, &heart_regs->imr[0]);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  274  	heart_write(HEART_CLR_=
ALL_MASK, &heart_regs->imr[1]);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  275  	heart_write(HEART_CLR_=
ALL_MASK, &heart_regs->imr[2]);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  276  	heart_write(HEART_CLR_=
ALL_MASK, &heart_regs->imr[3]);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  277  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  278  	/* Ack everything. */
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  279  	heart_write(HEART_ACK_=
ALL_MASK, &heart_regs->clear_isr);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  280  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  281  	/* Enable specific HEA=
RT error IRQs for each CPU. */
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  282  	mask =3D &per_cpu(irq_=
enable_mask, 0);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  283  	*mask |=3D HEART_CPU0_=
ERR_MASK;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  284  	heart_write(*mask, &he=
art_regs->imr[0]);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  285  	mask =3D &per_cpu(irq_=
enable_mask, 1);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  286  	*mask |=3D HEART_CPU1_=
ERR_MASK;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  287  	heart_write(*mask, &he=
art_regs->imr[1]);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  288  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  289  	/*
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  290  	 * Some HEART bits are=
 reserved by hardware or by software convention.
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  291  	 * Mark these as reser=
ved right away so they won't be accidentally
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  292  	 * used later.
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  293  	 */
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  294  	set_bit(HEART_L0_INT_G=
ENERIC, heart_irq_map);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  295  	set_bit(HEART_L0_INT_F=
LOW_CTRL_HWTR_0, heart_irq_map);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  296  	set_bit(HEART_L0_INT_F=
LOW_CTRL_HWTR_1, heart_irq_map);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  297  	set_bit(HEART_L2_INT_R=
ESCHED_CPU_0, heart_irq_map);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  298  	set_bit(HEART_L2_INT_R=
ESCHED_CPU_1, heart_irq_map);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  299  	set_bit(HEART_L2_INT_C=
ALL_CPU_0, heart_irq_map);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  300  	set_bit(HEART_L2_INT_C=
ALL_CPU_1, heart_irq_map);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  301  	set_bit(HEART_L3_INT_T=
IMER, heart_irq_map);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  302  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  303  	/* Reserve the error i=
nterrupts (#51 to #63). */
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  304  	for (i =3D HEART_L4_IN=
T_XWID_ERR_9; i <=3D HEART_L4_INT_HEART_EXCP; i++)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  305  		set_bit(i, heart_irq_=
map);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  306  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24 @307  	fn =3D irq_domain_allo=
c_named_fwnode("HEART");
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  308  	WARN_ON(fn =3D=3D NULL=
);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  309  	if (!fn)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  310  		return;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24 @311  	domain =3D irq_domain_=
create_linear(fn, HEART_NUM_IRQS,
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  312  					  &heart_domain_op=
s, NULL);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  313  	WARN_ON(domain =3D=3D =
NULL);
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  314  	if (!domain)
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  315  		return;
7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24  316  =

7505576d1c1ac0 Thomas Bogendoerfer 2019-10-24 @317  	irq_set_default_host(d=
omain);

:::::: The code@line 222 was first introduced by commit
:::::: 7505576d1c1ac0cfe85fdf90999433dd8b673012 MIPS: add support for SGI O=
ctane (IP30)

:::::: TO: Thomas Bogendoerfer <tbogendoerfer@suse.de>
:::::: CC: Paul Burton <paulburton@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2041480172725183536==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICCROpGAAAy5jb25maWcAjDxdc9u2su/9FZr2pZ1pemzZsZN7xw8QCEqoCIIBQFnOC8a1ldRT
x8rIcnv6788u+AWAoJNOm4a7i+UCWOwXlvrph59m5OW4/3J7fLi7fXz8d/Z597Q73B5397NPD4+7
/59lclZKM2MZN78BcfHw9PLf/3x5+Po8e/vb6dlvJ28Od/PZend42j3O6P7p08PnFxj+sH/64acf
qCxzvrSU2g1TmsvSGrY1Vz/i8IvzN4/I683nu7vZz0tKf5m9/w34/eiN4toC4urfDrQcOF29Pzk7
OelpC1Iue1QPJtqxKOuBBYA6svnZ+cChyJB0kWcDKYDSpB7ixJN2BbyJFnYpjRy4eAheFrxkHkqW
2qiaGqn0AOXqg72Waj1AFjUvMsMFs4YsCma1VAawsMA/zZZuux5nz7vjy9dhyRdKrllpYcW1qDze
JTeWlRtLFMyDC26uzuaDOKLiwN4wbbxVkJQU3XR//DGQyWpSGA+YsZzUhXGvSYBXUpuSCHb1489P
+6fdLz2BvtEbXnkbXUnNt1Z8qFmN6/XTrIVfE0NX1oFnD8+zp/0RJz7gqZJaW8GEVDeWGEPoKklX
a1bwRRJFatB0H+OWGTZl9vzyx/O/z8fdl2GZl6xkilO3Z5WSC29zfZReyes0huU5o4ZvmCV5bgXR
6zQdL39HOtiCJJqueBVqUCYF4WUI01ykiOyKM0UUXd2E2JxowyQf0KDIZVYwX1k7IYTmOGYSMZKn
YdVJEAx175aKssyalWIk4+XSVwJ/4hlb1Mtchzu5e7qf7T9FexYL5s7TBjQP1LsYy01B79dsw0qT
mC0VUtu6yohh3Tk0D192h+eUjhhO13AQGSiBd6xKaVcf8cgJt6f95ABYwTtkxqk/qWAUh5Xzxzho
gnrFlyurmHZzdbvWr81I3P7kKcZEZYBnGbyjg29kUZeGqJvk4WmpErJ046mE4d2i0ar+j7l9/mt2
BHFmtyDa8/H2+Dy7vbvbvzwdH54+R8sIAyyhjkekFBuuTITG7UpIgmrjNj/NqNI8qU3fIWtvSEEM
rmVB2gPr5qpoPdMp7ShvLOAGzYAHy7agBJ626IDCjYlAYDm0G9rqaAI1AtUZS8GNIrRD9MsSoSye
SysWyaUKp9qv+7r5i3fQ171ySOqDV8A8MDOFRI+TgyHlubk6vRy0ipdmDW4oZzHNWXxoNV2BRXHn
utsTfffn7v7lcXeYfdrdHl8Ou2cHbqeRwEZOHV5+On/nLxNdKllXOu2cVoyuKwmD8FCC00/7sEZO
UhvpeCU0GIxWrsH0wZmiYIIyX4AYZzfz5FsUK0j6DC+KNYzfOCeusjSJlHiS8e8J8WBxZAUnjH9k
aMfRnsH/BClpYFFiMg1/SRkxAs4RQo0MFY5KUFkwu8QyjF5KErrE7yeTqgIPBPGE8uDoDEwBh4+y
yrhoFdXdi8OqfHjoj2g/IQExDofIQqW3dckM+nfbupw0kdu9BEWLzxu3GQdKvX0PjkX8bEvB/aDS
O4kLomETaucIe2HyGqL1hBCskr7H1HxZksIPnJ04PsD5UR+gVxCj+e8iXKZMtbS1iuwzyTYchG3X
SCdGAesFUQqiluGFa6S9EXoMsYH776FuRfCQYHAWqIAdYgY/nlQuxs2zhEBr6sfgSrMP/lgXwjho
aq3FgmUZ85bOnQc8UjaOThwQJLEbAeI5izp4NXp6cj6Katu0rdodPu0PX26f7nYz9vfuCbwaARNI
0a9BlNC4au8dzYuTpv87OXp+WzTsmsAAtDhlUCAxIQZyGk+ldUEWgd0r6nQ8rws5hSAL0BW1ZF2C
kjK1SJRD7FJwDWYbTp8UoRADdkVUBr4mUPM6zyHKrQi8xO0JAbMfGBzDRGOpIMXiOaedqfJCKplz
yBuXyfUO07/+BPBKdz5O3N79+fC0A4rH3V2blw8mCwh7B7lmqmRpu+ToSAGeSaSdBlGXabhZzd9O
YS7fp72LL1Wagorzy+12CndxNoFzjKlckHCvBzzki6AMVBu3DdM0v5OPH6exsFmsxIhDpsUvCESd
H6bHF1KWSy3Ls7TrDmjmLP820cX5NE0Fqgv/D+1vuGJgTgx5jQN9TdKNOj+d2g/El+CbGJyrCSEV
AeVfTw+HQLQwbG2VmXCpS0hAq3lawBaZ1t0W+S5lFhzq7CSwQA1s4kV8cWOYpWrFy4mwr6UgSkwc
woGHfJ3HNwk0xD3iNYKCG1MwXU+EMi0XMNtSpxWjJVnw5SSTktsJIdy+mu3Z+9fUxmzPJ/F8raTh
oBOLtxP7QcmG18JKahjWyCYOalkIuy0UxLtkIhJuKKoURWuhx/Y3TkxW1wwSdS/b68sMoPoLBVE8
2CSI1j2/4VIEKbgB70MglXVZhR/v5Ndgkr2cirINuK9zz4FSSCBDSGMdMT9K1EWwAGR1XVVSGax9
YLFLB57MZUSMqOJmFH9iQrzAaKbMOAkD7oFniqCi3G4NgYxkoXi2ZJGwxSmsEaxFk/PZy1fRV5fe
XNoaYbxgF+deqIdJDityB+vKFYEb9WanTk/gn/F6BDi/lpDQB0MgFjGWawJGbTOUloNVujhfwK43
rjpc4J7kbP5Nku/gsqqXDOOWPpBoQ7vjv193w9wdo2jZNwT2Ejicv/M2EiMgzPDs+TqI2wbE6cU6
HagNJBfnIUm3d1gsBKuwtR/B8EmIwtTV6ak/K9wKyIhzZugqnG931rJaVNYUi2guedWtSDgMDg7g
6jGwUbiAEaJKxjKNhTotiDKONaS8glMl22AtklbflDSShWietap8Mkbgkl+96+Bg4Fu9s5DQ0Kk9
BrvTJGL+Kc8h6QEoHEa8bQhcnJgoRwwsm+sGv5w5P0+MAfj5u4gQxE3uP6JCLxywfzs5av72YpLh
ySsvO0mKHEyTKDxAq49eXvbx6rxf/sZArxQWLb3kkm1ZkJVRRfTKqV4qjXXmWGR4ZwRmXgpnkQqJ
pbGg7ODT4bWM4aVlW4ypXkvR3Dke6mt0nbGErmNsuG6qfiNctWyuowpI4Ap9dd6YicXL82z/FQ3b
8+xnsN+/zioqKCe/zhhYtl9n7g9DfxlsCBr5THG8YxpXL4WoI/UUglRWlY3Gw+zLq9P5awRke3X6
Lk3QJZYdo+8hQ3ZvOzq0NzYT5Gzum/fvXgJ/q8/m7Xu8sxo9t9dkAzzQAWAgw2gnRJZOSLdH1f6f
3WEG6fnt590XyM47aYc9cQuw4gvwEC4VwkITxHR+6amNCHQFipZAt5gRwOXLH/1YpUPoNa8iu1cJ
yLEZqwIIlkbH0GuyZqjGOg1tbzvh3HuOxccvU/ctlQi4uVJN4L0E1qOwspk1yCQPd6M6XpBucj3b
Ad57JXc95k3p+gMs9TVTeHHIKcfCSVu8eG18YhFjCumVNtFHVMLX6EmF6eOihkL0FIDocfz+cReG
S/ENVgezS7mB9DjLJoqoAZ1gZZ2qFvk0EN73hRA4Br04s+zw8HdX2+oi9TSBH7Q1M/Eho3k7jvnD
4cs/t4fwNf25gX2ngmNlx0gq08neQOW2u9mmVyirNL8RjcfNC365EhAxMIyKwegF9z61UhzMntxa
dW3S+VpbjrHlBpKRJIVh4JrKLaQr1wnpllIuYb86KbxEqEFQqZiLxg0JTEyLBqEBoOWrqJ7JiGZT
BRcoXGxtplMOGTE6vBVrQbYKXG1zIbz7fLidfeoU4d4pgq9uEwQdeqRCnRh401lDZvgxutVoUh7w
VqS0WDKxm0z3yt/VCW8PkI0eIfF4Oeze3O++wsuS9r+JTHDNovAlgv2OYXNBFn4a4apnWE7EgAkS
qLCfxNWvm/wDJrEs8a6LUqY9I+c8Cxayu2hmoa9JFbHgIAc6aNT6CLWOs9MGqphJIoJrEQdxArio
ZyXlOkKCu8e7L8OXtawTzQEQATf2p2leiKaFsT3kK4bnN1bLWvn3S827tYDTlrUdN7Gsii0h+ERn
iYFZu3KWVPEM2ksGH+RK9zg+BccLjJYnhqOp9UhttUNcE/BCGJdUROHtQ9srlCBqA6lXaIfXaUaR
/BUUGIwiKHqMhkwROlZutqg9jIZF+e+Cw6OSpee1CyO7pgn/LagpEIw7bVpzf4BDgx7AqCCPQPBE
N0N8BJKdDClFLjWsNwYLXVYf0YHCtUtbMYrXEIk3sS0cWVk2nUS4FgnNhtPeXpJAup6SJYjNIwL3
guShCUcN4X6CrxerTzHxSd6NlbTrVjOyyuR12YwryI2s/dC8wMh/AasAHivTQSzTsG+qMLg9EzFK
Kb0gLs9jcV3JYgUmFPQKTE5qMduGPWVX/vtdAc+7U0vdqDUHoDmDbanPlip1ZKfuyv0tR5cwJCWN
v6Fy8+aP2+fd/eyvJt/8eth/engMWnqQaFSE6hk7bHP7xWx339pde73CPpgjdoxWRb1sguihhWwA
v3qt9g132b0KDqvAy3LftbgLZI03sVdeygEHrS5Yuj9kgTuXCt50eTrwrcumjRS2DzxjXbb9LLHr
dD2SmSOKsqKYRF2nCHAHwJxZCSa6IFWFFgjicoXuBhTHd1tDQue2nv13d/dyvP0DYmjsIJ65i+Bj
EAIveJkLV1xNxqrw+oHChRNBstDiNFU82WrW4gXXYbEFtDQutfQbPiV0kznsvuwP/3pB/jheamtm
3qIAABYwczGoFaPwBZsr7bKuomVfYz6IDQzhtrYdrX5TWeeVqgLMTGXcqQezgnUY3xBFTaOulqoY
FnICbyH4UkWcmxjHdq0EHQM0SagI1sTFX+e0wFot6uCsrbVIbFJnZZ11FaDJyPPq/OT9hZc1JBxX
qimSgRZDFOOs6lr4RppBao4FWQ/mTOmgFBDMTSXuPc63zQh0XTohCIQk+upyYPyxkslM7OOi9rzb
Rz1u1ehgTvFTaUjWdRR4MYXfoOFKvDA2bWVA51w9YurkOb+Dt3sYCZDA6k6fg2Ereg9Q7o7/7A9/
gUUenxZQyzXzKxbu2WacLANDtw2fMCGOIOGQbVbhXR7w0klgRz7kbyBw+l6PGezBxwhSEJW+fu5o
4Eg4Pw9rLqqoUWMgjWPQHtRXkLqVyxh92h3/D1cQbNFxdxh9V+H1DlHgY8vcwvFd1AW2lyTt27d4
9ipg/NsAI7BXwS/qGc9gLYnynvoLusFOO4jdAIs2Ak8vTksnVJUYTfOU9XA8353MT70kZ4DZ5Sbk
5aEEoJLmiJa+RrYLqyDo8zetKGjwMPcXixRrn8EG0rKqYC14ULkqy1ISbOdvPdakCm/J8EY/ramc
MYZTe5tun8BZuNuIJDajqfu0rNTYoSrxsw8/oDGCoJ3epGDdX9NIv6brgaPC52Z0djfRwY3BhZTV
IkhF0AlxOVD0HfbDerjiSGwJRJXsJXSnSwfx9UqrBOEHZby1wicI/rIIYuqgtcvBxIpPvFdt0ZXe
2LDdcvGhiEzs7Lh7bnvl+/M+QkUI3ywPcYlQJON9zai6vftrd5yp2/uHPcbXx/3d/jEsZW4nmrso
SXXeL7wDtsB+PpapAKJy3K6QqGShWWhAVtDWpqRD6ZbKlUQThAPZSkfci3TnjMNkKRUBjNC5+7At
5EQk+NBtMkI148ACYF6xzOeTM2JqxcZxSnPf9viyO+73xz9n97u/H+66QqLnbYHFB0oipivKF6bW
qePfYqmYn5xtAwERXJHTk22CWR4xi/CZKU6n32XO6OhFRc0o5NYxfAP/BTChNkUkjzDrmqiJlf8A
OtYczeHCbmoN+2ieL6zCxM1/0TVXDEApnVD5mvuHtnl2GjQCLit35AKL/T7lISjheRC7wvNYKUI0
MANPNMEMssDAy5R58g5MQ1jj19ZRQJ4Hrr64BtMWNY92S0d4ITfhlTUzKwPhcWeMRzqdNbuQxZrc
1Cv9/W9aPwJQ/DC+RPOA4wtnQLr0aOHXdlfSYLnAjUSCkJz4brIFtF/shXDLqIrasoFYV6kQx9FX
gsXkNquSu+TI/egNZRWajwDJz/E6XNMAAvkHetVoyT7UXK11JM/0tSfgtKkXIQ9iIqZwxiOZ28CP
ibqI38VlSpXdpigeE1fYFpNuKMK1gv1Ff8yszNMdtD1Vojt8TISfIE1tC+InPoLx8EzN8Y9UtW7Q
viAQ8ZSSwh/pfhaPSK9C1Wm8PAy82z8dD/tH/NRp5D3croEd3hC//d7JvcW+9K0tr4twB3MDf56e
nMQ7YhhkKVOLpMDYuy+Eo5c4eHB5DZyQLvHxZI9KNI+PBU/PhlYiZrlFdhOKtzkDty1GyocXG8Tw
YlInsGlZkZEqNGA8ilPq1kzQrOoyY/ht1YTtCMlGpwzWFQLk8LPhAJzcig7H4lGCQTxtWKwgHRj3
4yzCLRQV2kTmoWtYH62L65Tr5Uo4jOeHz0/XeF2K+kz38Bf98vXr/nAMNBms53UkR3admipAY53L
FLncbkfmz0FHUo0pRmsGr6gKkngxQidkcqgwIHZGdHtTynS5x5lNsU03wjm2EKQSdRp9MuGNxntc
E1xs+dBO0OCFPZKl4hi30eQGTgglVcR2gI/PPI+cGXOhXAQiYGMzYt/FqgjhYMXoRRqaWu0ONVpt
hp99MojbUq0MDr/mKvKtzElvR/oumJYxpbOSp+/PJ8CpBfewrJre6brkFX7MPyV3hx/rKoldMX4t
eHketVB2taZXDmNTT9//AU7m4RHRu9cOq5ALvmG8iM1KC05tW49rz1YotKdeYJLOk+K/Il2T+97e
7/C7NocePCd+TJ+aAyUZK2kUMXbQ1Aw6VMI4+Ki0HgQUk6fv98v5aXTwHCh5mBtMrFddC9Q3F6Nv
IUvHGX0Mwp7uv+4fnsLlww8C3LcNI4vXwtuvkPNUEuboqjz6PZMOWpqFnwIGIvRCPf/zcLz7Mx0f
BfLoa/iXG7oyjCYX6nVufVa2LeLrEwSJCS8f5sdNk2n8bLFj2FLuX1jAsOYt7UTf3N0e7md/HB7u
P++80O+Glcbj5x6tnMcQCLRkUCFrwCZV12pRUq/4whc1u7icvx+e+bv5yfu5PxWUGS8km+YiL4km
Fc/CBLoFWaM5qG4qO28JMq6b3wHBq/2zkzGHpgMeC3Fma13j92vcBIEBSx7+bkaPnUiThlfVAu+M
OU2NpiuRrKh1eIHCWQqpfrep6vbrwz2XM93o3Cis9xbp7eU2+c5K24kPrPzBF6nv43weYGjno/2C
NdVdVDj8bkRa5qGB7eGurQnMZHylVDcdDytWVH42HoAhJTSr4HeJNkZUfhGug4AbaX6mpIWD1pUZ
KcIoSDW8++ZJ95NI3fr37XuPezCRB++m+Nr2PfwxyF3rZfgrFgOSbQ0kBH1v5CD9MMo1b/Uz73cp
SdAn96lSTT8Ar45V0JMHuO4mddyi2M7RKwwXhbx2dyDpW/d+ufHT96b3/zUCtlETPRMNgeuvbthY
xYTcJNMuYT9Ibdc1/gZW6BPaoRAVpLD953jYj1UbGf3Qk5bUBsUixZbBfX/zbPmcjmDab9zrYWIM
vD4dgYTgcvwS/4eU0CLpFWiNU6ncVzlE5S5S6H7jIux9GZ+0/uOOpkQ6amnGoBh7CKSyRcpbtfme
XXK9wM9nfE1dmFNLqqnyMeC2KV8i5NawIDLAILsAb1TaIlkkw3zBsgX37JHmWNxE5Qj28H+UXUt3
27iS/ite3rvoab4fi1lQJCUxJiVYoCw6Gx7fJGeSc9NJTuyeyfz7qQL4wKNAZxbdjuorvIFCoVAo
dsfG3Ign0obFdeZAhYB8vq68D5l7cdmTz6eT4XCIUXGsIA+HEzd+jbC45UW9SuwwLA4F8OayX5HV
LQCx626YILp9PRXdouqVea0+Izjv8UTR64sJiOhsVvU7rhHRX6a/1LVGlK9JSej+vHunEaqnU9E1
pV6SdFjSaNoKOaNHLLT4EZaI5r4jAbwB1WjSG0p5NsqKi/EoShJgymZZmic24AdZZFNP534UAfDk
xd5jVytHovXyTqXLo9SXlw/kiqziIB5GUJJpuyWI5O4J+4I+LR6LU3+mVnHf7LvZBXz100FiOgyU
rtWUPA8DHnmKAENXqXbk6rNEEEXtmeMtF45GU2pO2iDWWkXUiVVcgvZf1noUFgGgY9WFXP0Fq3ie
eUHRqtEWeRvknhealEB/21+f+PnCQeFpg9jx4HDm2R39NPWI8mcGUY9cv0Q7dmUSxtTrrYr7Saap
wkcYH9WujssDemysSxZO5yFFvl0KzZ5Z3cZBxBvB46Lr0DQfrszLyMlEyqt9TXUwetyNoCTrLUPD
x7G5r59G+rqxDJgSz7KuQex19lla0mHqBJGa+0qOiawntK0PRflEJOuKIcnSjZR5WA4JkTAPhyFK
3Omaqh+z/MhqvS8mtK59z6OND0bzlz7apb5nrTtJdbqvrehYcA46WD89KJjep/x6frlrvr28/vz7
LxGh5+Uz6HIf715/Pn97wdLvvmLcgo8gYb78wH/qj1f+36mXZShN3KBSMz3u4u2hNn8LOwbem4z1
5XJG5a5EEfy0PoCuy6MiGnZlNz5qIQ1gRhZtiVHI1GvBZaa6yPJmdJ7Cxa44FWOhcF7x5YWyKB9Z
cdJuESXBUNJm6nyRM1ucVCG+Fop+99USYJKXvJmvp63VgSD6Fqu5UgkWbf6qP7uQv8UTen6o/xP2
KOUYIbH2fDgY/lsyMmpd13d+mEd3/4DzwKcb/PdPpYJrNs2lxhtzUnbOIOyD/IlcGJvFaJfncFrA
/cOu6Lcff7/aPaj4ArKrfbNwfP75UZxxmj/Pd5hEOXOiqqSMrviJO/r9Tg/JJ+llwzgl4CXcNjuA
zcwuxc3OaVpAW7kB1sk3oWbaS7mZELRwohpnUKcB4swE+PUUNSORAp0aJvpSg6uAiKIPRVfrWtRM
GU88jrU4AQvSUm/0F7Turr537xM57rtM6CLLzKJGeJl11JyRkwbE3fMHdKQktK++f3L0cNGKU7Fx
tBDxUhxHYMZoB44GjolzQF5FeUGqMP7iJq+WIREhfsSZwpWlXD7iOHfZa37+AlbvYCSBN3uDJKI0
V+eDWS18e3reaz4sBWfovX1fcsmz6xyReFjZ4S3am4xThrt+mw3AndVU6ur9tgZ9W1WamSgjHTZn
wz5LMO6KKKTU45WD912oLKMVMO6IVkDGMCKTqMF3VrK8JqRbgh38RhvmW7032Mqyv5B+vivL0LCj
cfuNvrJwcu8sASyt2HcfttYbGofRpzRyRfVYGSJSMy8vQTSoQsFZqmp6eqTt8gDo0qwv4T9GjpRG
FnwNt89Xkk4dx6YUmh1JIY7lJfZspAnKDUQcz2ioAcqpVqejip6uj+dev7xHWOTnqPwjdAAaOoYn
ov59GL5nQeRGJpua2VErDl1AuVo3bfukmXtmyuzcpZ54JHDek2qJvQ0sBrlpgC9X3uuRW6Q2EpS2
GqeZCLFHRVgx6PSzTjYDgwiaCD/5qBO76zAX2P399RU08U+/oK5YePn5yw+yBmick/s3ZNm29Ul9
LTplajktrnT4P7W1THjbl1HoJVRSVhZ5HJE2BI3jl10b1pxA6LRUrpeattUhXtVK4o1yu3YoWasp
15u9qZcy2d3Rcuwog3fKbRzmVnz9r+8/v7x+/uvFGJn2cJZPrrQSkMxK6i3dihZq7Y0ylnIXVQgt
lOvcmOTwHdQT6J+/v7xueozJQhs/DmN9qAQxCe3qA3kIXdXvqjROjIy6KvN9XycemyE+VoGZewPq
niNrOO0d9TxY0wyRTjoJF9PAID42VVPAbL/qdN6AvprHZh2AnITUxjOBeTLo+Tw2hZkHkEBO2qca
lCMi0Prdv9CsLAfj7h9/wSh9/d+7T3/969PHj3Au/3Pi+uP7tz8+wGT9pzlekzuaShOqlDVafe7q
z2IYGiMPPJA3U3h3LRsE7s8nOnqkYJD3BY6iSpTJlBCqQCk6lZTUlyseo1WL2zpzkzVg3hbkLZLB
NtsnNnJyeWYKtuYASk97plxyEK8PgWctd6nG0Q8vEMduceSHAd/a4qTdPko6b6yF07klJ8Y9aRnO
PcfKOrNQ95VD6rv3UZq5lgEcMYN7Q7T3SWzn0vVpol/r6/BjEg2kM5tAB26sZHmwMAs54/SgrxwF
3BVkhBiEbtY+BNJ3mSiOVKyD2c4MYXQypAIbCosgJ6pOlgZy1bCF1EvTWKuQh2UQ+U7JdBTuVK21
TnjTWX4uKkweLgUAZ5y9IWAlMTWI11MCJ8bgZjSCP50ernBUM+avuHocd0wPPojIhs+bCo97QwDP
/rs6+dYZWtfkYGvNH2kpdxQ6tEb1h5bl9hxEz2dL3te/QNn89vwVBf+fckN+/vj849W1EVfNGR8/
XgNr7EsWJD5l+xYzy7zXEhU67879/vr+/Xjm+lMU0RX4VRLaxC/3L9CChD47azrn189Se5raoexf
ehsI/cuprWiTxV4agjTZ4SkEbzzw0tKW52hGL41vdlgMqGvRSWG/ou2ayjlgyU99DVXia0yg4Meh
tLeo1U0nr5a+x1JB6JvcBs6GyHMkt0rtOInHSOOhJpKIcpFa2yd4PIR1zy/To+NZbbQe92ByUw1Z
adZ+rUDV3hEwG1kueRjRXkwCNqPQa0mFK3GYaoF9RSLtgCxJuQ+Tv9C/CLIwjyC0KvowKniGRvxd
3McUDN/hZaomrRCL62DRE2PjVcjjkRt1MLnGB3cl4eCxK07GLNhdezSetU9mkZMjqrOw2VF1u2PK
lvHU960GreqVI2HNctkPCm3PW9Ay5NzWckNgux7iEvP+emK12QHSr3sP8s0q7zSwcd/Wg7WaJr1V
oYCuBX/3jUk1cnynB19DUtulGOKXGVSWZZE/XlTXjKULmp1NdPSK2SXGWucYO501e1oVEDxChduA
TV1OA+/HkxaBCzsV9LVx31wJKrM6Wn5oQfc0QPpZ7lZmi1GrCyJSd0S4b8TyMLJCryvf8+6tzC7G
FyQUTHwxQc9HkEb+YGQPGl5gziv75Y6gwjljb1bi4p7SD1cjA9AFUXM2iKWfweHVC8ycOf1hRQmB
oNmYN6A7NOTZSoBiG+76ILWqwlRn55kyFpXRZbMhXS8TiZZ0M1hwotBRFASOd12uWqO6alTD1lTF
pB4aYzIK3TXwPSGCzHrLdx0+GY96SeuBAGoLfqTyBQyf2BrQqrWq1DMr22a/RxcTsx6UGq0xDPga
z1FL87mdoLXMLANDVvMC/uzZwfFVCeB6D/26PZDI0bHxsMlUdHbITqGoKIY9+5odB3A1qSI/m+Ii
TBqOdi0h52hD39+JHm/rJBgM7cLQWtdFgZdNFH36ihDQ+8vZ0EssrzjduxR/jR0H2QlMk1fmBB3V
mz74odmi5dU4V190vMyGQkH++gWdQpSX25ABWqjXLJka9R5+LDqmtDYyPmdCvKsR36kQcfPuxQ2c
ntEE2a55KzbtwEtR00ePv/+0zZ49g4p8//BvymUAwNGPs0x+NcM+q30TAcXY8Qk/NoufjHSGDHr9
Dsk+3cGJCI5zH7+gyy2c8UTBL/+htFwrcFmo86WVVdcl3WIgnwizT/MEjPKzhUpfNadOVS4VfrSI
76+nstfDk2JO8C+6CAkoV2d4JHIb3udaFQMLvFxNuSCgb8MYUnJxYekqKuWu8zPSCDUzVEUWeyO7
skpvnMRyLwlsestgnzQeh05QB+fskHvUK4mZhXiKOyEc5ob2ub+ZPvixNxD0vtsT5K4YUlC0PBuZ
PlVFVfxc1q3De3TJd3mVy02jo53dbXOkLVuzjoyHzaGeeGK7gTOUkHMBj1E+/fJVZQmJjNejFgX4
mQMIXIDu5qJBCeWvo3M4i6MQYZC3rOczWj4dTlc+Gvd4FtuJfHK3gMw45axIMG2hRI7MLNVsUn1p
mxM9S0LS51ZPOe4OUdmTZUsz8EYO0vhqJUQFPX4jXZBSa5J3ZEPYQ+Ylm5MdOTQf8mVYHyLPz0kA
83QAKQ0knk/OSKh3FgSU76vKkSSEsEEgTzwy16rLaWukmnig6ipy9RMHEIcOICUlgoDyre6XHK7i
crLPHkoeeVuZCou9UMaYpq3pON+5cF6mfkb0ONADmp4BP7WBVB05dEDPIkIK8mqIKXKX+TGVDcyd
mJwAgITx1gpuWcE5XjrNetsFdLaX55e7H1++fXj9+ZWIXDJvr6CI8IITtTmObE/1pqA7BBiAqP04
xSemrLva8dllleuSFWma51uTfmUjJr6SB9mlC05aOO1ctjPJHc8eCEb6cs6uFv1NJztDyjXA5vK3
eiiJtxuXbE09hW2zEEIxXMHsje5Nf7d7i9+qakSsvhkMi4iqy+V9sT1ywPCbszr63dZEvzX7o62e
jcLNjo225O7KVW4PT1RTVkqbrdiaINHOp/v99PaK4cc08N5aCMhE7fMLRigHE5YGzg4Q6JYKOjOF
7qLTON3KPqO9GSy2LbVjYgoLx8wXzSC0gQVz1n7QX6k79h1royg6flWvC2bAdsPVkdH1cVabbVNR
FJf79KF0svVuliKsq7zMs03ZaFlbNWAfBfQ3ng2u5He4UvLFlcGTkOYCAR5BVLxdTMf8mP4e8MzW
YyA68UXWjerMBlN7+BeXg7YixfCCwylta3gXPt5WpNapZrS9vlbOgXwbQlQ92W0W2Vb+tkxTOIOt
+aVWLZxVv+7Txy/P/ad/u3W/Gp8vam7wi5ruII6PxCaD9O6sXbqpECsuDbmQ8f7C2+4AcfW1JdAF
AyGwuz7zKYME0oOUogepT7YtSRMynwS0DJqek/lDPUkRgDVKttcSsqTbqxJZsrdZ8q2JKxjoPovJ
o2OfhHmqSn3nlLNr057L46k4FGScrbkA9AUv7ILhoJi2PlFTAVDDLoCc2PMeGw6UvrGRvmOPqebV
sOwsD9cGvzmtvSvBk452aTwRxFNrDKkyfVsxXj/Mc94bp6c5SXN5mCydhjHYaT8UnujiiwtuuKSv
WARmBXgVVDNGhyCimTT0Vo95+bmDv55//Pj08U5U0JIzIl0KW6nx0lPQTW8WSZwtnTZRWlFNCD1U
zNoD/66+XJ7Q02EwmzG71qqdvADDgUv7n6u/1riMRh/bDh0aTHhqCKC6GZE9VLDG76Vp97qSbMy+
cd/jH8/3DPpyx7C64WrwhehQ09dVEtsbFdtCYM2ZWfzt+dCUj85OXO8DDGoYDHYXdbss4SmtjUkG
Vma0T6uEhReFne3grJ90g9XZxRXgPCDuurCBvpuVE7MkpZ7EKntGgo5cxFUA8ue8u24sf5fHgERP
eLEHK9robmJigbwah5sawGMWL6X6qEkQxf05RfOzxCTzKPPMuWlfsguyohjqjZzltauZj0MWx1Yq
EZt2JL0uJT7fvRvJWsp/WQqcrhr3+sXihiRcHiEI6qdfP56/fbQlZFGxOM4yU7RJ6hSSRa9gUZ3o
mFFyYWMo1I1JKiU5pVeucEAsREl3xkWRCwBfIYXOxSjg1LOXV7nP4q1F3rOmDDKfNpzM0yw3Hzgq
bqTGCMg9bF+9MTKX5j25V1SpFzu+uj4z+JlPnytWhoC695xg6Ca/uz0akwKvWOPAIL4rTu/Hvm9t
OczCPKK06AnN0tAeZiTHCWV5mmZBZTxOXSYHXqJuTSpQqO2R522QlcZ01YVSx2orVd90sMVXBRlC
epowHIqzhRGSc9+uxwRQerLEH7rBzu3WJl5kyrZbl4W+Kdlu4upEkxv27FtCa27PSvOBl5wyfUbt
nu2wo96+rWBApIFd/ehewkejZBFFGcMW+gmxsDEkMIIBGZJA7n2w8/vGC2OrDxanos2+AW3TV418
8+QL/dwaEikHzX7syjDMMnNMWcPP/GIQB9juIjU6ksxgjbw2Bxuxay1ag+8BNlujPQtYsiOSiewe
v/x8/fv565YyXhwOoAoUWiS1qdLl/ZWppZC5zWnUiHs3f5T6gaiE/8f/fJleHaxOXyundIyHP/3l
PGh5TEjFg0g9sOmIGutJyW3QfDTUJP6NthauPObZymLgBy0eDdFAteH86/N/f9LbPDmoHWtVBV/o
XIZWU2smAWyvR28hOg+1i2gcfugugLIaahyqVVgFMi+mgSj0XIDvAhxlADAaHwXR4bearvkBqUCa
OSqZZr6ruKw241KRTH5KKiH6/FAMI+Kj8xhoj4yRL1B+ZaxVA+spVPP5iYYdb9r3vVhVSFxrotiu
xOd6r5TeO+FzuokqoooatF2B7x2exixjXZboMdzQv/EgvufHYi+hrX9z+qLsszyKqa9hzCzlLfBU
S9BMxxFUr+hVeuaiayOuIfSN3szCd5Sbz9xSrgZx7IpTsRKtnHYP6NJNqc1LdUDzCz2yokIn3Kwo
sPik/8DMAFuhn0pNxko8YZRmpLEE6gY7d4IyFQwEVH6YCGFITZKGMyxyo3OhxCxXt94ZQPU1SKlM
HYJ+zVGMEJWy7cMkpq44V4Yy8pOgtauDPRPFaWojVT19K12wJHFClTyrzeTo6kykI8DMIl1kut3O
rgdMvciPiQESgO73oEKB4yJI5UlD6hyhcMSyZCpxDOP7RuJcXdEqkAxEe6D5YUQMhDwp0A0VWKBL
dGPuH4rrocYZEOQRKUgO57baN44nITPTpY+9cGsELz1IxJhoVRmkoU/V/Vpy3/OoZbt0lTzGEn1Y
5XkeR1Rr8NHGWMSk+cDYbcRP0GErkzS9F5WmbhnT9fkVFExbaV2iglbQSEWtV+iRk55R9M73At8F
xC4gcQG5AwgdZfiqKFCAPFCPkSvQp4PvAEIXELkBbaJoEOlGq3GkrlzTmMz12JNv5xccnVLJhLx0
xjBYeIZm3Ben+VnHNq+4PtiqST8wYrgwtjZ77KkqTtBYtMWlo69eZtaKG1YRgsN3PPObGcQGD31d
2pVs4vux6HZUJfHj4AMlf2eGPbpFxnsqLUJZsKcCla0scZjGnEp94JRtfUa70g/TLJzaYxfdw6nr
ip+1p5SrpYg29jPe2R0CQODp3sMLBJohpVMqeEBkKK5YihOV47E5Jj4Zu2YZn11X1EQ1gc7qgcqz
6TN6Y50Z3pWkLjbDoJNf/CAgFmvbnOpCjVe1APOdLAGJfY2QixJIqRZM0EhHQDG59EejKphTbRAA
MUxCBYuJZYxA4JMiSkCk85bGEbkTk94/OgcpclHn8/2tRY8cAdm9iCReQlsGNCaffLyvciTEHolA
TuxSwoqWBkTfSyQkpTlGkd4Wb4IjzJ2JI/pso/GQhxuNw90iapp1JQtJPaFrh0t9mOSBgfVlEhO6
COiQQZglVGb1aR/4u640NaeF4ZKCNAuprgHp6Xo6Pk+/LqEdQ1aGzUjsAIfEcupSShp0KS0KOocf
88qQbe+OwECpxQpMr84uo5T2Fc7J2Qr0TXHQ5WSX5HEQRo784oAM26dzkG1gZZaGmxIGOaKAmNmn
vpQGx4ZLW6+V+ansYfVvTxDkSckI8ApHmhnv3xUoJ8/wC8cSXcoEeBFSG9i5LEeW6YEgFcwmimtF
zfe90yJbLnw0GRX2IHHo/gG1DnY1usUSW+yOFeOFJx7Rqj1nY/hEdSEoCWO537MtRag5cXa9jA3j
jNTFmksYB5vyFzgSLyC3KYAc761WDsbjyKNT8zbJQNd7Y30HsZdQVmhty0+JjWoC0F3p2haOeQ5M
YUa+nVL3uzikmzDttY64B9pO6vBoVJgCL93UFSULpcPIjSojJhwiURS5tt4sySgT+cLBoAOJXFmX
pEnUkx3Khho0i22h/RBH/J3vZY4XEcsJpWdVVW5KONg8Iy8KSAkDWBwmKe0dPTNdyyr3SGuFyhF4
ZA8OFav9TQXxfZv4dFp2w8+tkEFOJg7VUc2hAPDpdpxAdr3uqbUAcO7emu6AU4oNkMNfJLkkV8YU
zHPr2NrVoBSSakENZ8CIfLChcAS+R2y2ACRo+yeq2vEySrsNhDo3SGz3f4xdWXPbyHP/KnpKJQ+p
wkEcTGofhgBIYolLAAhBfkFpbdmrilZyyfY/lW+f7sE1Rw/oB++K/es5MUdPT0+3S8mHTXRGVSIR
S1vicLYkDc7h+mTitm0CUq+8Vi73fVq7Eke2E8ahvTW9WdwEoRPS6QEKtspm0NEhNVLSgo1+Bwg6
tZsD3XWojNooIIWm9pxHmwJ9m1c2LXRwZFuo4SzbQimw7Ei/uCIDvWMC4tnbFehS5of+liKia23H
Jjqsa0OHUiw+hG4QuCeqPgiFNm0MJvLsf4fH+Q2e7bZzlu2TK7BksNWR0URlHr8wNRmm5JmyepFZ
kvOR6MvZeGfJl8vRjPLPoIdymCmaQ74FKMoH9lheadcRC9cYuoJ7Rp/irFIKzIW9rJJiidVqaTA3
EJ9V7Q9PPz///eX921318fzz5Z/n918/707v/3r+eHuXbDXmxFWdTDkPp7IjmiozQEdmt5mKUjYb
NvFVGJJjq+UCf5wc2TWT8pcbHI+RSmI9SHFTHtslT+quZ7woIT44N9Tr8+tRxJZ8J80tlbPM493m
8d2tGo6+V4gKjsZn22QMfHOGdTptIyYHjVs1FBtlTwYCVAdMMdE2En9K0xpNJ/Qq5hkkjGX9+yQO
bffW4pqy3yyZNXDY9y2iZPSfU+coFBrAhuX7nsBGi+0dgcweHXXk2EIjLZsqanJATA+th+1OGH08
brWfO+fTC62KfmdZ1FifvIcTyMUd6pYC6sJrfTskW9Bciz7dquAc1oZMDBsttK9HL45beYzG50TN
QPRyDHmjvvBG383mrlQ0n7x3pnG7UoJrVqmDGVau62YZZc/qVs6qafGdBNUc7uNZp/OLf6Xg0TXl
qT8ctofQyLdVwyROWZtc6AE6e2/fymF6CkKNnNEvhd5pI7n+xAChp//4XGijVDh35mlkE6UuDyqp
FtVtbNv7zXHBnwVTaSvuhmUr6fzCgUzOsjQPbMselEbPxUYejkVp0PmuZSXNQaZOprYy8RDlOz7P
RCL8GPK2l4Xc9PDYwhpmWE/rQP1abd/vDVWeXEepKebnWWoqkSGw3NCQa5qfqjiSWzI6DyVIseiv
PK+wD5VO5O7yfUufQMXAHNPHuOaZ+A1nm+7//Ovpx/OXVRqJnj6+iP5YorSKCIEybsd4iLPBsCmb
pXLAs2ZEjRUYE1XZwLcUfac1YkhHZGlkJ+A8FQ/7dC654R+RgcAgjRpAphjieVoZbstXHoOZFnx3
RhSLZPnXMFYwSg3cC06RmzJSyHP08yhVhikzNUpkUV2PiulOOYuGKC9M+aodoTCpgU3XOEZff719
Rh+Jc2g+zaomP8baAQVpG3aXCI/xDE+VcnHPUzZuYHjTPsOOwTsK962Jb53IxyM8NWudMFgivIoI
6Vh8RNCxODqYjshQzSvPOYtEw4oVaHKFDP3u7S1RxcGp+lMdngd6Z+wpmnx/gXT1vfNKU2N4CQjt
vJh/WvWZ9EJ0PTUzTg4pNd6CyjdlK5lSi44fG1ZXYa3FD8ytV3uC6Dlq5tOZydy8iYHomfEotZHM
J0vzKUXkBNqe1vo4K0xNx9eGl4O7d7VEk1cS7qfLkPgEohT6P+X2M8pgiGwUdkmibEAhAvo4q5zR
aYI8nnqoVw2T2lAvkGc9EJeZOkvOqb+DTVD2uTYBntcrwLnFuBny0EAaVHKOXrHKhEMaUe+PEGlk
98tYHoaozKA4ajPm+H3jO0rn8TdzUV7Gsp8yhC5JTr9HQ5DbM4u3eCvRI4i+ugTo9sATVXFBulI9
kio+RVupe1dfLIAeGly7TAzh3qLv6BbcoVV2C76/kX5Paak52vqur02W0cGEKcmskhBTJZ94ADzq
+QJfsBCTO0x6WiXQi7ZPlPGMBzWZItiuL+LbSJGt9Baq/NKeZ5GH2owmfBzy8pf3cSKRGwyrPVdH
XusZbvU5fgkNum+Ojqd10/afRKTU0KS7wO9N4V9GDphRyTgX1TVJv+Hi1NyTL2QXokk+5AyXxxBm
l6PkFeHbCqVf2aH3LEqkmN+bjs8N2/zl88f78+vz558f728vn3/ccfwuffv5/PH1yaBNRBbV+k1B
Ne/r81PB3y9REc0wIlQd5UprlLf7SGvRv7vrwgrdNpG2qo9vhtWux1cVoXngtBhqg3ZRwMc6y3JG
RmitGt+25CcAozk+aTo8QoEyE/SXvit1bxFUxw60HlkeQ+tkz9ekpimbjQ5BhtCnHvQs8N6mKre3
NRllphsMKiUWJVTJhMGO5dLSefuQ7SzXMs3e6YEzMU8eMtsJXALIctcTV8axJ+fn2lrlItcL98Z+
Uh5d84V78vQgFqnbr3JBdHm9rxMp8XGGTJERFtHXoe1BeLfknm3RJ50ZNthOjLC6l6pgqFYaqDvS
vGECXXXjmLT12kI80YkB9MC9z26MPuFtu7SSPuxC2/Rp6/Kcj14Q1F1wRuSnKXIaAzLdxWgruuvA
TJ6DISiVRJBDJrl80hZqmR57raOi2BhPazxXRo4/HgANZV3OLGZofqoIHMurmyGRhi2/Omkqbfqu
u80pHffdMjJLBaMAnduWHhFejOhr0issykXBDkslqa9UV+CY9gnM6jJrR9t0QdU7s3Rp3V5Zhq89
mmtOhitcma8NfMoKOmxhpzMF+fxEr9ASzyTt0xmggE9N15UJVSqh6EhOgGLPleezgBXwP0qaFVhG
rYghPdc0bKYXtBlEBoSHE4oHnZwYMzA4OFF4zDWY9Co3stDm/AoqYr8wGBV1hIzIOgkZ8+m1XWKy
DY+XJCbHsA0oTJQVijB3WOG5nkcOL45JjixWbDqOEIWOh/obNRuZOo+0ZpTYPI/s5bTJ9q5FVhuN
Rp3AZhQm7vNEtVB0DW7VnTNR+huRJQwcst6qlCgj9HcgREgBHOWf7eoAjx/4VN66NkHGvNCUTFE3
qJhnWFe4Seluu76cx9/IYH9jzeQ8pkk4qz9u5TBrQ2hMsVlXUTKCg8A0Kdhk4VfGg5AuHaBQtEMU
ocqGjqexytvJ3nVELAy9G58EWHzDOptX98Ge1L0LPK3vigZpCmIY3KNy52bGoWGoVIeUPDQKHBHb
7zxyGOsaGgE7hr1FpzpePyW2AetgMfXNkLEZCO5vLfbVA3VLseL8Hr+u8jNV/vS6P0YGMy7FNlPA
a3MYuvENBFE50VC5La/RuYnqBO9AWwwUuVlvFMwNmba7kDSyFFlUHZeI5Z3hYe3K1Dh5xQyG+TJX
c2Onbbw8DHxyoV1e4OvIqo+iis1OcFYkz24CEz+fHMpSDm+sMnR1cjzQQtDIUD0YUitnGxHix7eh
y2VVq8ABrbNIQ1aJJ3R25JbJoaCg80bbftt3tzdqSn0ko86tBWhUEzmGQTYrnH4jC3qnpXxLKKj9
G42cVFamLJzdb9RQcXqnodu1oBxzCgc09I+8mV43q5UwOqqQskhl7JBKHkxWhbRAKco2PSo15YZK
HEW/SGVNm5aMXAQHV+6ePp6+/436WCLUYXdiGB+SNEiB43517VRNWSz6AoMfY9Dx+JBS1EahxtXA
rj331hEnnYJx3xq5tOiu9CbJjui5iagpMl3yZjgnWSVFUl8SQ7F502Ik1DIrT4/weY6NWszxADUa
khy/mxLiV+LLShYP0N8xnP/r3BCremprJF7IIK1tlc7rapaTFQdOkn7CkKBo9EFg2AkmDNM15zyh
c22iM3devbh9fX77/P7l+ePu/ePu7+fX7/DX579fvguWGJgKGOFTBpblq52JSJNmNvkCb2bAQNot
nBX3YU+lX2DViZDgG9VUTd4OjLcxKnzGS44pnUiWS61ZnJDBnRFkeXyqrmpFRyq0dTPVEKUXQ0pU
+lRtrU1aFlV3/85+fXl5v4veq493qO2P94//gB9vX1++/fp4Qn2WOJOnPAdMSHXX72XIc4xffnx/
ffq/u+Tt28vbs1akUqBsU7NSh3OsVkXnaejLpM0ayBkV5bVLGH2FM06KwxCnTaXE9ZB4OpgdZvBi
cJTCh8wU49PIcI1pHy+8Dxp6Oefr54mdHFLE4sVGrEZD6nOcKyssR7Iu1ta3+57a5xA5lCAXy7lU
rOCPIaThUD29Pb8qSwBnHNihHR4t1+p7yw8YkRVatg9dUjewtmYJydBcm+GTZcEqnXuVNxSt63li
PL6V9VAmwznFs7YT7GMTR9vZlv1whQGSacvTyBVj8GLq8LKyTB2p0cd7YQpJsjRmwyV2vdYWD3Er
xzFJ+7QYLmgUm+bOgYkHZ4ntkRWn4fhoBZazi1PHZ65FNjfNUrRlTrO9K783JVjSfRjalBJf4C2K
MoNdurKC/aeI0Rn+GadD1kLV8sTyLNV9tcY+XQ+0jUW+jxMY0+I0TVfoRWsfxNaOrkGWsBjblLUX
yPTs2jv/YftjrgmgxufYDkUnWMLHHSM8DVm8l1wkCzkBeLBc794ydDcynHZeQNlnrVwFCn1ZaO3C
cyYqKQSOsuNm6nw22GRdBBbfDxxy9gk8e8s2TIecFW3aD3nGjpYXPCTk+86VvczSPOmHLIrxz+IK
Y7qkyi7rtEGHgeehbPFKYm8YUGUT4z+YFa3jhcHgueRDujUB/Jc1ZZFGQ9f1tnW03F1hkV1k0ALQ
rI9xCotGnfuBvbfpqgpMoXmNnnjL4lAO9QFmSiwb1+kDrvFj24+381t5E/fMyJVDYPHdP63eIpch
iSu/WTPOZLBtNPPH8ktvkjEMmQXiQLPznORI6lXoZIzdqnR5hAxvdGeSXsph5z50R/tEdhMcVaoh
u4dxWdtNbxmGxMTWWG7QBfHDrWbM3Du3tbPEmGnawvCBOdm0QXArS4mX/uIiS7jvSJ6yQE+J/c7Z
sUu1xeH5HrvkFEcbl0ObwYB/aM4uOSHbCjhiywlbWBjIhW/i2Ll5mzAzR3Wy6VWxra/Z4yREBMPD
fX8iF8YubeCsV/Y4lffOntwOYGGrEhhOfVVZnhc5wbjmK5LqJBxJclWdxidSSFgQSb5aDaUOHy9f
vj0rolYUF41+okbhsyySIY0K31E3kegMHxxvyPGUJusj+Ql12meBVHCProYRlkEmuN5lbbi3nYOa
zQrvfVIZqTNde+3QgKIW1CROTMJJnpwYthbdD8RVj9cYp2Q4hJ7VucPxQW45Hh6rtnB3vjY88JQ3
VE3oO9rquUDqtg9nWfiXhtLV0wike8vRzq9IdlzT4XeyKlxGgZS0PacF+lyPfBe6xLYMJjuctWzO
6YGNpkgB6QeTYNPEKQWnLWIJRuqKXGcTvbRwFPbgY7WztcUbgKbwPRjh8h2ZytRWse00FukqhJ+q
CoZhnHr4o/fdnVK8iAaSBY+ExtVGMt/x1MqjwoLFXeAZJwCfvvk5rkJvp0lgEjj8GTi2UatEHfom
4qRv0tYmfWGRVDG5rn7Jez4bsgyPSTcOz8iMpRsZkrZgXUpZQ/CeraPqdFXWrbSu4Th4n+SawuWU
287VNdyf4KUOMp370PUCyhJ+5sCDkCN6zRUBV3aHLEI7w9icefIUdjX3nlJTzix1UjFJATcDsC2P
195arrhhu15tnhVdsimHHuvxZZuke+BvTU9H7eO3adyYFR6nK+1Kgy/huEJTt2rSaSApWq5hHe6v
aX1ZvDscP57+eb7769fXr88fk8MDYQM8HuCoHqMf0LUZQOMq80eRJPw9qWe5slZKFYumw/CbO6vo
kmZRoUtoBP+OaZbVsEVqQFRWj1AG04A0Z6fkAKduCWkeGzovBMi8EBDzWjoca1XWSXoqhqSIU9Jf
01xiWTVyByRHOA4laFwnF9admBQSEmg5w8cmiZwBhlzI0tNZbgTyTeplmR2VPlh/GM8n8nv//fTx
5X+fPsQXf2JDx/WAHHeAVjm182GyNXihQHyEoyDMFoumaoOD1fJv+AsdNyufgoGEAN+Amvd8MDSt
3FVXHG5KHqcDtehjA7vaUXjRbwreyxg7pbFjbuphwosuhUFjQuu0o25HsSlSCHo+PuSAOAsJ1kLY
P4ox5qiY+Qw/Nm16f6WtP1c2+oX/itMmqdgGrs2XKjaSZAvilUwP6glUrEDxk7ePtmjNu5AMGQGo
DpoWZG/DkEHs1BMJlswN891V0jQuDmkDM+skt8oLSTUyXwEWRQmlSEYOOWjySBnoeH0zKD72BFqX
MvU3yB+4WmK06+jYaCj3cVbBhnJAFae0FQxFUsLKmaotuTzW1DscQNz4KI9kJIxNVvLggHHodWUZ
l6UtV7aF04MrkVo4AMBuqCw3F6WoKqe0iLgSsTpXN8SJBjsuA8GrY1K9JTC6Ni35wBhyecjhVCV/
mYe8xeNWXVbqR36wDdpfbGFueAmO3x8fRRmGRt5EV+VTXGP1G6CT0VPf7jxz+VQEC3H8cOtsee1K
UElS5om6aB3g85mX00Ndsrg5Jwl9o8OHOx76DO1tYLG2Anki5lJ4b1zzc1Zp+wDS5ity/f5fZSyu
eNHd/OFqCMh83I+SXiJCdKmQRHvMb2Q6mjOJStgoYIqn9T2IuozU+8oZig+HJaSDbdEAjSek2SGi
zLFbOIhKegt4q15NbKqXpLeREJiRwzG6DBX31XD5wzJ0UpMlSTWwIwZ2w1bqgbe40IQJjodRHXX3
BOfAZLoiJ577LfmjLBFDvmXFXFKNoHEuR3gjw3xKJ3iiWd80xB3VLSsuH3UJhvFcDgcggms8cdBj
pRJuAMlxOd/jVGfYV6pmue/Z6hyDKlg8kt/8PHOmeV7xk7dYOaQtys8zyOq0MRBwHQ8yNJVOnrH4
iDg8ff6f15dvf/+8+7e7LIrnhzKrxdCUOV73RBnjk7pLI2mVRCzbHS3L2TmtwZcl58kbOCOfjhal
weEMbed61r3wTZE6Htl7nSh53EZiG5fOLpdp3enk7FyH7WSyHmEcqSxvXH9/PFm+TIeaw551OYr6
daSP+gaZVqL1ouOJPl5myU3tQQ2/tLHjuRSyvFFcenTFKkPEyJVjfD1C9LrMIr5DXpHRIVcmBrlf
QfW93oqwGE24LSMUkJDug0Bop2YhLWSpvy2SOs93LXrWKFy0a2aBqQo9b7snKRvaFaXicxFsJp9C
a0U6z7GCrKI64xD7tihVCN1UR31UFOQIS6SQrTcWhjk9LEa4cwujGc6XIH6TGgF5VYf1W3rSg78H
fqM8wFZNi48CD5RsU48eBJYou7aOI4Uw1mwi52RNeS0kpx5NQekR0ey8PEfpgFqNLJlUMGujENeU
SUjUPTIjFTodTwOUJIXwNavSQTFyHzMrCtMQQZx7xzwzEF6iWKqGmhFGLTZkURTQI1ECh6mHacVa
VHb5y4/Pz6+vsJe9//rBg/u+f0cLLUFvh1nM7k1xEKSyhy2Ej5AxSp7oraJOydhJPJfHgqHvHZCX
SnEw8S/RntRcgYRHxvgatVlKmo3OXLDLopvaIelBtAJxYjhftf5BvmNDnZamr9fwz8eD1zUH/auz
a1s216aCYQLdkbHHPxwRztcoxNiL5/cfP9Hm7efH++urJLqJ394PesuavqxU2R7HJdANtT3UUd60
WhMTIpXcB/3Vsa1ztZE1Rr+0/V4bbhwAyZKq7RH6FvLdyJVHCnBsPddyqjJNHaC75Qd3MtqahvzK
MnoxNWSfVZEruQ2XUHTwZYBQBnQN2OSp1Fzr5mD+QMhkiNa44KM7J0PLo6Lhz8OQ01BBXWDiC5Tt
OvqXaLLQJj7bQoZhUaotHcHIVMM6ZL6PV/parrN/Tfj7rC94vDjZ5d5MlRwIzkQeJBh3r41CxCk7
eWiOXp9+/KCU2HyRrfG5OnXJfuXeLpU+bfnrlTHIZNkm/3XHuwcOPeyUwDb8HXayH3fvb3dN1KQg
0/+8O2QXXKHhFHr3zxN065j26fXH+91fz3dvz89fnr/8NxT7LOV0fn79fvf1/ePun/eP57uXt6/v
c0psV/rP07eXt2+CHbU4MeNI8igFtLRSnguMtI6aqSt9wBWz+SMkwAIOgVHzhy1DqqfGKcE1pj3X
jLBJV8FHPl7A0hs2Imfp/mwmuwRpOLH4lFDMVKUnxLgUjfB4Qyt2fHv9f8aepbtxW+e/ktNVu+h3
LcnyY9EFLcm2GlNSRPmR2ejkZtxpTjOTfJnMOe2/vwQfEh+g0k1mDIAUHyAAkiCQuDUBTHwiuP4F
hWxeSNICRQ4BC9rajngyYicGkYrVk9tpz0fEZNvgz3TbhBFgtE2GJ31+eOfM+/Vm9/zjenN4+Of6
5vCoWEr8z2LmSnJZo5N9aEAcL3iq2IFAxxAerCEhByjhC+nz1QhZKZZ+Wfd1ZSZCF98+Z4kPEdae
2ySBmBxBQTE5goLigxGUpsYNc/f9Q3lQXkibpVpBELfFPZc0lcdMAhm0ywQWNpxejTFSUeyNjHz3
9PD5y/X9P/mPh+dfuSV1FRNz83b9/x9Pb1dpr0oSvQm4eReS8vrt4b/P189e52OwYMtmX7T2sfqA
HsZ2apJifwn5JF3L92Pc1GWMbwxYvQ0q7H3Z8H2Wo9U0tD/m3lIccJThpwUWEZc8HxPtuFJsS+wq
xCITgb59s9BKem8AcSNSICDeLSagNIFcBdMzoWnRORvUn+AKLwqtEA+MLcW500Br74bQQgUtzUSt
CmTmaBabhfzYHS9u51hxYkVI8h6KXd3VZ9OrRIDdIczum7aAE/f7ZbbwVEh2LzKGhMcsp/WRYXcY
wpDvcm5eHtxdMGkavj+SPkQjRkB7uoVkyKyT2bsdK7HkG6bNaeewzMHpEV8pfHd6KjetHb9HtLc+
k7YtXTDYdv7uh3GOEVbftrx0R/RVn+QbOCUR7oZWBfe8SHitFJ/ECF2w42OhG4/AUZs4jS6uMcr4
npf/J0lnCY6ZL+wXEmKUyuq25wMOB/H4o0m5NEnNuIA2joH43lDaqmXlCXrSUY8pwYlIuNSHPnEh
WXt0ix0LsjsUvL5AqQv/I782rK7mz3++Pz0+PEsdjy+vZm90RSseH1PVjfxKVpTGGbMKLZhJ/w6g
8HC8GhsurBZQ7icrDWNH9qdaUY7OXBooBdjmXh+MTGymk1nk8i5kS7C6Iwb00JQ+pD+Vxdm2aH//
NF8uZ6qC4TRsYoCtnmrT1ppMJW2nDEOTBPyfCsdSsPE4EkYYbq7P9tGJwqrdjLjg3By3WzhvjA3u
ub49vf55fePdG89V3P2Z2tCHxJs6p0B06q7tj6iLxdHYsU7tVo+mz5GDdlZ9cyHx0t0OnLBWATQJ
namwCtmoCSivSWzynU9AHxzVteGUXsuroou1i7wP7sE+DglJNZUy887kWRA6C8qj8cRlaciqPFJ6
P5xBmbyPsoeldsoN+JnUrOycMdv2DG4HndXXF6BKXcoqoy5IHQogJ7v8v7bdN3Czslpf366PL19f
XyCrwqP5QtYRi5+KtrY/C5B+XzWoJuxCsnznt19O2dbbQW2PVQY+nkHDdRfq+K7flyGm5YvflEHG
BH48IoYcvm/QNwbiC9wQ7Nm57JxY3RQNe1hQ1pWZ5a+jYaEsB9evL2//sPenx7+Q5Aa67LFiZFvA
Bf+RDvs0s2j4gNhvSFduaU/REJGa5HdaZm1d9cnKDGipsa218EdwQQ7wptDJL+HhjwxbjnCbAMfm
Y8XiEF1cjGKwXqejGK+ARhzlSlRm7MHugYBu04LVVoHpuz+D3VPtxngHkKLOmwxRzL+FFGBCuig2
A/RKaJXM4tR+3igRbYm6zEkkSxZz85ZYQiFRaOIANxldJKbH4QhNXagTQFDC2tksmkfR3IEXhwhy
tc/scJECJa6bsVOQERs7tblRdDVwMY+x6hfrGDebB4JZNEEgjuhRnS27XG84F/Z3x03hDobEtOTO
QbgRBmU7ILY09pxnwKZI75p0Fm4ax6ZmhlYXZ+YdHYHewHLgwpuCZuUEIdfg1QJ3lRN4CEqGX2oP
6EVy8arV4Xc70gV8tAVZ0PdgwKZuP3KSRfGczVap91E86phAoUm15VLJ4xXqwSOHp0tSOw2BAKuQ
eKFSFfMnnhs7l02JH/GoRV9mwRq7jEDoJmcsukOWrqOLK4r8TAsGeI0swzT92wHWXTzzyhupCkw4
OKYs1u48lSyJtockWrutU4jYa7aKbL85dMMdxyiFxW3Ef5+fvv31c/SLUO/tbnOjEon++AbeUuz1
+vjErTWwFZTovvmZ/xCv53b0F1MTyqmHHXGQZdxg85LFIDOGK1fp4cL5ywFCDBePCRhc2d932DmC
nFAReR7xBxglIxZsUpYdw4dZw90kvghnO5pE86AMH+Izu6yyG7bf2+eH738KZ7Xu5e3xzwl92YIz
burU1HarVLgBDtPcvT19+eKXVjfozOuCvloXwa6DY6KI+Jaf7esuWMm+IG23KQh+km6Roq72OGnW
HD9qGOEW8clyUbfQdqINC6UdKEYvgafXdzij/n7zLodyXBnV9f2Pp+d3iIQkDOCbn2HE3x/euH3s
L4thZFtSMXiZ9S96SvgkYI9DLKoG0t8GusPFoxX8yynYgRtGAEuOuTlK4JkPmdK0679MffF6ffjr
xyv0/zuc+n9/vV4f/zQjQAUodK2QmNN6BQUAyPu+WEUrH+PYrADaZ13NZQoK1G5/P729P85+GgcZ
SBgcWe3xO0zAh85YAFeduOmtx4ADbp70q09rXwCkfOO1lamVA3UJAnhwYa6iAcE7ECiXtyd9ujpE
EoOmeNJCExsGtt1RjZvhtp+mIZtN+qlguK/pSFTUn3CHvpHkssKjjiuC0WnGQeTM9ty34X3G19Sx
vcfxy3kI7uS+HHGLZezD9/d0lS4SHwH5YNdWUNgRAcGMUYTO0eQNUsvSLMEjUCuKkh2ieLbyq5UI
OziRg0MDFyuSCydI/VqbbLtKnQiYJgrPj2aRJNiwCcwiXG8gTdEwhvOoW6HBOzUzuSkiBsRdEt9i
n9VxMCcqZXzbtZ4Rv9It1/+2XTBMKGf6yTo5QbqK/CqhYIxMSEH5FhjhqvbE4Su0CRyTBCLTDySr
1WxqIllK/U+ynC+/1aATmnJaEMGcrbEVBPDAMp2h7CwwmGe7STBHPiXgAUmyxtfwYh0tkNFeL2fo
pM3xyYRlPUdnR8qP6enhKyKO4qn5oVmzXDvcIuIlVLlK2jLMERiZvtJAxjiJ8eCzVqNCnLjO0JmT
uH5/poHwn+NILpxcOLYnxSSnZbRm6CTHK2QuOTyNkEkDeIpKKFASq7TfEloe8KANBuVyPj25OYvn
MzTArSZw9u0mHBOtrLuNlh3BuW2+6vDw+AZBgogdgKdrtEpGF/EHfdzczVcf8HjbpBke8VsRAOcg
S9R9FTGMgtj+InDlsepzs37w4DXt0311R9F8K4pApwUULPry7VfYqXywvAij6xgPPz1Mr3ZTdRE6
dzqih9ih33a0JwfSIgJb5GwPgPtT22U+zvZFGhUhQlo06+SCmpmndh6hp3TDaHTrqOUDgtlRgGOE
rn2McorxESe+HZ6h6pgdqwvmCDgMxQkrxQeT5CRZTXUhI3lRmU+Nhjnp+P9mEd6cbpKvvMyuGgFX
zHNkrA6NOKpFEfYR0cD3OtOkbw/BNfi0EXbBrmwMbH9CxBarTohwpvWFtIg9TrvYeqM7wiELKCqP
uuUinlJcF+AbRG0tE/tA15ikSUWo7wF8kdblUYSmrxulANynaskBJ23syvfLb9PqTb+4HvuQQ9pn
/W5kaMcIDVyVwU2xFwaGsPsq67tLX1TizQbc5Ig3l/rKbqydk+ys1/EAG/JxyXLMxtZbs4VwfdWC
n9zOubTW+EsJpTK7DuB+M3URwBiJosvM6b3MfInycH4eKke+K0UZYMevgGwtLMi+ZKVNU9IdeGwr
4PAxmUKt5FA0WLdC101PrNpuE7t2mm2dFnD7Y1OQYwfPvcxRGuAXBw6vW+0aKEQAt5tL+Rqp8UhI
kA465F9QbZqtGlOkk022t3vTHC7uOMlsFHj5AUePhhiTUGpVzJo2tz+lbrAcVhICLp71pNm4DZGo
aCYmBO0sJK0MtFRnQxDNMl03NNyZFCGP7AZL/wxlePS5M2Xdbb9nHii7s0DiKekeeK6nO2qd1Y4o
pPV8YUDz3IwEZ3cdKrLGtFA40OZPBQAqozK2dZhQu+LYkyb4peg3hBUe1CgrwnRbbTM8ezTGmDfR
IlwmgHyiaJ5ouUQPsoGD7Myen67f3jHZaY8CJerEzhOdfUvK3Khyc9z6D/xEpVsrqDc7C6jZs6Mq
HugZR3EleypUPK8pstARqELrNBG2ZAfMviCNq4EGuDh5LdBY4CZVplaijq9nj8kw0MeL5+8KHq6W
N+4+n4OiQO5/FAYdBJDhhGVlCa69+Fl9lsfYsW5DWvAEHCK7D2AZSlkgf5s54LYWM5vaYOk+AZY5
s6IHNSr2et0NuJ9+cgag3xy4mrX0rInB990GhXADQbtndeto3+Hzn31WbjF5yDGNstfL9s4tlEPC
DIkKFCZmig8AsKLNautpEHwiK40dgfUJuCzGXeKgXHtkqAsVx9HtIp57Dd5inianLbio8k5sDQ4E
oFlcEFV1yRkSu8sSaEuiagjX0+Y+bABzuXRxwd7rQQEmdEMClHzvcrgUObnsQKKLmCdeowdaQvPL
blP4oVFQ6k1Gt4fiIkIyMvPJliCj8o7K/hIA1QUOJojbu35z3wiXJFJx/rduhcH25CZyeXIS9loE
8I2iwrNZnPIG1w0n4VDsllNPtB/fXr6//PF+s//n9fr26+nmy4/r93crFZDOlPsBqe7lri3uLW9n
BegLZuyFuFwrzGg48rcbRm2AygtOIcHLT0V/u/ktns1XE2SUXExKI2qOIqYly7DhtqlKRjSR16om
Oywja9dlIAJheU0K7CjLwJuhsUfwys6ibiKm61tFK7QgTZy22gSENgc+TmUdz2YwGl6bJAHfuyeL
afwiQfGcp61HoiYY62pOMtRHZ0CzaEEjn4UIm63QBogSGBRrFhAH4Is53t4uxrMBGvgIaS+A5zg4
xcHLwNcDDnSagvJdCMGkoSLYHlKU5wgI5rKO4n41VT+QlWVb91P8WQInlvHsNvO6li0ucGhYewja
ZI6C01/M76IYfwavKCpO1PV8k4QmG7GJ/A8LBEVapBHRIkeaxbEHsmkyYMJp2UAJbruNBDlBs9qN
BNTW3SPiiAYD0UMKjrJ3CVKSpdPiqgxKyVWcprZdMEwT/3MmXbbP6x06jfAHqo5m6BmWT5ciK9NE
I+vcRC/89WagF+YRpIeOZwm6SEYCPAKzR5dE8WyyogQPi+jTXdAGH2AyFtYtvI1bXpJgOa5ksDES
uHWEiLERh30Pri7KaBlhs6Zw8RQumcBh7VS4BT7AJ8nHUwvE0oYoUxva0PF8R/QhHlbHISxjrC8D
EjET+K+uyHRvAqoQa33eJTNMud1X4hgkmiEcteNm1L7Jsa7yHchlwrQos0ZKHKSFd5uatHns+Jwr
9O+tN3QuyW3B/3cMhNPQwyTiGgnNjXxkwH5YQe7bFBLDxbQvDzUqJ9iIFfNQrqyBAkbnA+W2SGM8
cJhJEghWapAsUJcng2A58/lhUHM4+1dCW0wuMkmCa7C2y9NAcH+tqRZTmopa77PGD/KNFdeqiMFN
szK8A+BzKazHPvNxcpVlDB8DPof9kssQNJCNTQbSZh6sSI71B9VQON/AKrg7EpF6i3+nmaxEHEcO
o+BbmetVhF+Rj43gVSzSQMrq8Sv5cYLnJB5ehHvDLVGs3FF/NZ7o7QoTXdw08SUr2CtIF4UZw7BD
Zy1x5L+W+yeiNaY0Bs5DwRUW4GMM3NZHFVvf7Zc4DEXnhHVkx8sgPaYQ8HQ4JkEu71q2XM0gFjia
Dsy/AtSQvikbK2oDJCjiEk9/C3+ldjgQSNHknx1JZ/x+X3fN4Wh1XmECwafrA19SlzpapiFmpXXV
Z4dbpDn7M2vK6lDbz/5GqHdIj9HAJcdk3eKeyDgsNhBwqWRgWEH7o/IokL4czy+Pf92wlx9vj1f/
mla40MuLTgvStLX5RIr3nbVZ724zNhmNV0nqO+KbFP1tzc2JkK++8hyReLPuwXMkXPQsrsN0SQXd
dh1tZ9HMr7G8NHCxFm6s8C1ZTBDU58MEts3D3WTHao50Uj7fD1cpnUOCtVZcXy11l8YhUP46/ufU
NOYbiGXE5zhDT3Z1mgy/PNyoBtvCWbItkFGvRCdFcOZmoquqbU3J5VC2D6xURdTx3U58O0Uh71oP
+MrT3NwwbJtJxAeopf9HWL+Yb8yo6KSlpyUV90XO01/SUbgzKbGjFomz1Jpqt8pV2JwNuaY9pbyx
rS8VYX3bILMyzll3G+ZKuH0OccnvcKsaaD8X3VJOZPZt7QCn3THgQqfuO2uGRvsYKujsVE+F6n0g
TKNqMpJRWLPVxfSFWCWwqGhrnZAOUPTgSmGboyspId2VyNbTtf5sQmBgQ2+TjmvILpohS1M8uYbY
SDDinMfswVNH8qgsH7QfKQ8bM/MKtIxKyPCZQYvTPbb0pfNYn4BQac+c5ahVo85u7YC1Z4zzrX2Z
8C2FAOMKsFzE8QRedSgUsUZ4BpAmg3dumaOV+ibPvIoHOwdEAy9j+pqATwLN75yOCZcc8PixobBq
bELRFrtKcW/G21e6oDGqoIxKdv12fXt6vJH3bM3Dl6t4yuWHXJOl4cJq14Gzk1vviOFMRz5CDzfj
E3RCtlmGXoBkqAzl2o966Fav0kNgF2oKr+IHE8Y6bjAed4ZpWW8llQHhBlgY5t5ADSyuS4yy7Vil
s7IP3YeWDdR2onYaJ8hzzvACLFnz/WB2dtsm4H6TgUW9Nkm+C7RI8KkuIp+BXb++vF9f314eUXff
gtZdAc+80GlECstKX79+/4I4ADZ83RjjCj/Fzb0Lq5gLEb3awQvdMAYAE1gmH7/5aEats3qJkTet
eK+t3g1DC1HBz2U7ROPgMvnb5/PT29XwUZQIPpo/s3++v1+/3tTfbrI/n15/gQeGj09/8CWBBOoA
G7PhuyzOomXlx3shX59fvvCS7AV12Zbu0RmpTuhBlkIfbvn/CDuaXlMStePKrM7KamvZ+QMOb5hF
VRQGlV8JHT6ADjfWPdlv4X3qdHuwd0WkH9jFcS1sxWI0UKyqa9weVERNTET5KZrJtvtNHBX/OoKy
fWlx3wBm29ab6c3by8Pnx5evoanWm68G4vzhO3peswgHEjj6E3j5kDG4eWsoboqgrZPBiS/Nf7Zv
1+v3xwcu5O9e3sq7UBfujmWWKe8ybIPXECKSuzAd3FF9/KNPyDfR/0cvoQ+DabRrslMc4GhriDjx
iqKD4H1CvnLl+8y//8ZZVe1B7+jOkIMKWDVWJ5FqRPWFCEd6c3h6v8qPb348PcNT70Gq+I/xy64w
gwPAT9E1DoDgdgdz96iwxw2cmIBPxW/zsVH//uMqSNHnp4fu+hc+GNrqspVcXpxI49hmfM21JNvu
bGgD8f/PrelsBGCWNfKxtbUHktAPJBino1QX1n4wWB9E7+5+PDzzJeCuUFM3w9kRvGvLN57aBjey
Ho2eKdFsY5iOAnQ4mAamADV56+fTEJg7WhoY+9Nc6+Fh4TW2wUJuKf1pKlatUm1tPBD2OgeI/QFG
mxhzXFVI5lU1aCQTes4qxrTAt/cErTl/6CzZK1xtSpEmDebgrjXOyAwjUTKTZVJo5L8QLWq7jxlv
HKudvk/1oYNghll9bA72tnEgSzyyUKVmYEhxDjToJcHUl6fnp2+u9BoGE8MOYRT+lamjv92Ik+Rt
W9zpL6ufN7sXTvjtxVxLCtXv6pPOll5XeQFLyzozNMg448NGF6LBYqrFpAQFysjJdCE30BDNhTUk
C6BhF1KeCrcTXo4O2AnIqNi9iFw59N3Ag1pCkeNg9cXJShFpgfUHqjprPiBpGieXtkU08HC+xY5b
ikuXjcFHir/fH1++6ZQHXsclsRPPRAEpuUTzdLnEEEmSph686ao0MsMbKbiUE1whCD8/D912q/Uy
sXZmCsNomqL+ZQqvI7p6VXJEJgLJW+nGuNCrzfAOeW4tV3XuBwk3sac8El1srItUZaFxa2iLcfKm
i/oDt5I6y+7typ4UFHVxhlcFHGOdI8J2eNegbdo2OwJuxLqQ7uiJ75uBa5w0RHBWCQeHVdH1Ge7g
DyTlFvuWfCzVVwV19D+zEzHmZAUvZPKW9xoT2uqMsW0yu5/y6GdLsxgGGROQ6viVWiwECyadx/Ci
x4P3rK2tMMgletVd2Ql2+M+eMtyjAXBljkfeAZx829YVeFgYoGjKatfUqFoBdFfXhsoUBQpTuwka
CABkhwo+0ULlnBKrnv/km4Cnz1+QJQ+kGVlH2WUe2xV0rIzmKxu2JbeFVevLw9tnbGt8oiXQcxax
LuqGgiEJZB2m8x8y1o0N0sdA40kpB4r1iIzigOu7bOMWUvuyQLFN0R5se0FA/V2YgfXzlosWnzMb
MLxpNmDq6sAG/q+yJ1tuG9n1V1zzdG9VZo4l77cqDy2yJTHiZi6ynBeWYmsS1SS2y5brzJyvPwC6
SfaCVnJfEgsAe1+AxrZMZuvGbQLcPbyuXiOnXPQxwil3o4VTSXJbX07N+CMIpLiJZy4smuB2riOv
TeEIzApb125RdW0bOo1QT1uMKJI3nKyaBJcql0eg5mzjVNw71VuF0KkaZyHlC5JQDEU7nCGBN6xX
ImAqUZewhKr7MgG+RdqtQPcyB6JPQqW3sOror/hARfokdPZNOr2OyjR2y6I4BaGCLM01QZrEBVg6
7AHUpd7EoBM6n8QBsZ4buIlLpBUCVcOWlXc6rBOM/tckbt1KGeudPOgL9AC8rp8cFTA4whYDANsx
YYMHixh1KMrnaPxe2V5E9vR9Is2cYMvpZxx2ZYQFlIkZRKFHQsMskaW/MD+LCSF5gUXPPpXNMRb1
+TU6DdhuU3AXgaALrFLUdo7blFf/8rr2Ch8LgtEY3FJFEgdSaxu2JVwjkcWGkupGmm8eBM0by11X
3+9YLTCXsyS3HkkKuF/xPRNdhUsrtJ2Jycw0z3DCD4PTv/G4a8fobokpX2YtK5WifxL7eKMwolle
3XjATT1xIqsRnF4Iz3nTF01Bd1awHUwCQQuBvyLBP6sqwmUdc0etQsLcXLl9UXfO4s6Fr6ambbGC
pQL28q3fOn3vHGkWvVj/DK9iEIL4xt3eig7NNNxWDXYOfsPUI0bBOvoZFGUc+d8a90Pw6zoy061q
GAnVHhRP4aycXHgTALI+CgYeGEOWuEAQONyAqgrR7+YQvFukrfT7iJ7mvF0emmnpFUW657FgB4mK
557lLJf3J/X7lzd6uBgPb+2eaefWMIB4MicglJloBPfsDAqOKg+pgXTCeVAmgUXWeYUocyErtYgG
3/Bg1EzaySGoibhAr1UqGQbTLTZpGDeZih45XoMemiyzObl0JBWbheNUb+NoIJFAZ2/nKxwoccgD
9WllB2XRcEuJ7hd5Wx9rLao76soe3sF+DUfCnydE5zU7THk91Va03FsqfYzJdWrRCKdMnXPHLVA3
z+2A3UkV2McbI5aoFumak1WRhmR01Hvc+sstSzZw+JrL3ypem3Xwcf4VAdmFMF1cJnhd4G17rP0U
yiTJc0qewz3dIFHPdnitV9dBt6422qdDsvgK2BV3WnVopasLevxJW2Aiqu5YS9XFSXP8M5o2kMiV
BpzeWqBiaHDbZNzJbpJdUxR5b60qdFROJqoUGwsiRze9zjNKI+XOy4B0B9yjCs96lpVn3JwTHCsN
fYf2a35nANraeUZ68KYOHxB1KarNBfrkx2bOIfpUlOUS80NlcQbL89QtuohkWjT600DxxHf5S05b
B92en05C2FvuCCGMSu0VHPSBps5BUJjLrCm6dWhTGAWaLKuDoqkOYGtvyPvOXZ9ebo5MfyXILoNZ
ABQUBTYrrQ4+kiqRDU/S9GvDO4VYlHRGxHVy9DQc1TXhm2GgoVwxbge0oBCXKsd9sCZNRwfnL1Ee
Per7p8qWtZSyKJilVV+Ua8peFT5B9bsneVpYIjwmPes5NK5sExmez4HqyLiP4p6VgJo60KhXh8kZ
9AKG1OOgBvx5AJ8sz0+v/O1IbwiTm/OunLY2Rr06Mys4zq4nwcVPr0BaVLMZCOCL0f/hzC0OlQqT
KRuIV91sKPuspMxmAmYpy7wFaVMcu1mGtzu6dEPMwEilazM5WjP6kyna2my1US1q26KAT0QWsVKU
6VYH3Tm3f/UGg91dldjaZsKuYBU1nhGpTYNBjlwKZXb09Pj6vH80X6FFHldF4nhs9yZAmrxvXiyM
B4U+Irv5c3iKHh/wCUwPEglnIT3ii6hojActrTyR87aWfoG9WCLRwC9cbk9mlaxQaPzvVInXbV+f
BqnbbF5Whd9VVM/VsTBl4f5gdUoZ4Ew7kA922qHLpzdDdCCy81L2hwjVEez5en4JJ0lfsG+1dvxr
DBQJg7coDWFWJzVxukZWmYFJqjLJZ1vVPUfJIF9XIvPW6fLu5PC6fcDU7GYol77Ohi9Wbexmya5l
psi+D7boTxrCbFH5jwIuphN2aFFtOF5Wnc4Tz+sL+1J6ckqm8kuk0Zp73x6o8NQKdUYfbLVpwD0g
k0jCtcLjMhEtN8WUwc6qJDYDZOlGzispP8sRO/RGN6HEjB9how4qupKLxHxgKeY8vNfmmtUMGl4x
58yIB3SeFLVeMqWIutz2HR/IHD9ga7Czkn4H1MKcYNPIQTcIf3ImKSZ4OJjQzRzGa0OPS8oU7f37
Yf/yffc3ly02azediBdXN1MzUKEC1pPzU8tRBOFoEsC94gNqcJLr7ceYiocbFI6y0jpv6oR3WkiT
zNG0I0gbmYWMVimjIvydy4gP+NLqlIsmfdWWTReZNibqYNUOPz4iLRkUWhncSuOMRgem21bEsRkg
bfR6aSIQ/EXZ2DbJhemfgL+UiBJnDjTqg3P1kfhsTbBKW7TH1C7EjthaZZBMYtFIWIAY+K7mNxng
ijqBBREZunO5QRW5fX/3sG6m3D9LXnbDQHodUvAut/C9zKPqvmzs7Vujj5NKbmNsHA0MBkMcKWZt
Ajsjh2W2yAUOdm0WrsItmmXHfgTGYa0Qpk921Zch/DJu26JhA+a2TTGvz60EvwrW2UOKl2U358ex
gI6l4r5jUqNG24dvZrDgHDOTGu43NrgRjTUWERzj0h5mAinKwAmmKPAZq1g417RH5U2WR1HMPsHG
7dIk4FijO6hesd9274/PJ3/CIh/XeH/KwB5zhpRAq+CVS2h8tG/4g4XwJRobZgVw14EAvEQFuzuN
K8mpj1ayys3Jd8wymqz0fnK7UCE2ojE98BQQFmkszRA2ooqW/RKou2W7kE06s4dmAHLnu8zmcRdV
UthhJfC/cdn2EpA/JcYlguHoKPU1RRrlFxQszbuiWoXoeiozbjX86B2kPv62f3u+vr64+X1i5JVC
gghGhWbv/Iyz6rBIrs6sOGM27oozc7FIrk1jPQczDWIugpirEOYyWM/lJIiZBrt2zeYKckjOj3z+
85G5vAy26yaAuTm7DFZ5c8E/iTkFcM89Nsl5qPZrM0EVYpK6wPXVXQcbNZmyIddcmolbAAW1DXzY
1zrhG+PNaY/g36JMCi54kYm/CBXNeQyb+Cu+qTc82Mz0a8EDwz9xtsuqSK67ioG1NowiqBaZyH1w
JDGFMgcHFrE184cPmKoQTcKWdV8lacqVthCSh4NEtPLBIHWljsX3gMrbJGAyaXYU2neUCDiiVcIG
FEaKtpkbpottnuAS9gBdjmbnafJZIO/G+tl2d5YViMWZKq/B3cP76/7wjx9feyVt1xb8DVLebSuR
DUa2gXvEk1UNTARadgN9BSyncWPMxlL7u7NC1VbsQDU/6sHhVxcvgdEFWRZ7bAspMmoVa5rJmhT4
TZVE/Ez1tOzNuxRrYKxEFcscWtBSVOXyHkRo4KHd5L4eGc9lAQuADGxdtBXrI4CMHmkQZZXBvCpn
GlP4YdCYr3L58bd/vX3ZP/3r/W33+uP5cff7t933l93rEPu6d2AeB8eMCJ/W2cffvm+fHtHZ/wP+
8/j876cP/2x/bOHX9vFl//ThbfvnDlq6f/yAWR2/4lL58OXlz9/U6lntXp9230++bV8fd0/4fjOu
IiN1/Mn+aX/Yb7/v/7NFrGG2hu+laJ2ygqVsmisQAlXxOOh2FlKHAp80bALDnYqtvEeH2z64mbh7
Y2DDcHkWvbwfvf7zcng+eXh+3Z08v56oKRg7qYiBsyrNUF4KKNKF5bdvgac+XIqYBfqk9SpKyqW5
ihyE/8lSmJGTDKBPWpn2miOMJRyYRK/hwZaIUONXZelTr8rSLwH10j7pGBybhdtxNhWqrUNhZKxP
0biX4hSEw145H8hNUwmf3CZezCfT66xNvRbnbcoDuT7Qf5xxSD9abbOUeeSVZ2ZULd+/fN8//P7X
7p+TB1rwX1+3L9/+8dZ5ZQVCVrDYX1cy8quTUbxkWg9gPjxaj65ips4686cfDsG1nF5cTG76Xon3
w7fd02H/sD3sHk/kE3UN9vrJv/eHbyfi7e35YU+oeHvYen2NTGu7fsYYWLSE61JMT8sivcccjcwe
XiSYh8/vhbxN1uyYLAUcgVY6XOXLTYFb8C5485s788c8ms98WOPvkKjxTy8Z+d+m1R3T3GLOads0
suTatWHqg/vf9sHtl/0yPLAxMGJN608JZm9e96tgiWnGA2Nm5VDpD0UOuOG6sVaUymFv/3X3dvBr
qKKzacTu2iiQoLSvcbPkc1Jo/CwVKzmdMUUrzJFzB+puJqex6YfVr2/2mghOQI8g83L/3I3PGdgF
0+IsgRVPxmCc+U5/9mTxxLLF1JtoKSYccHpxydQEiAs+BvaAP/NLyxhYA7zJrPBvyrtSxT1X3MP+
5ZulIRiOhJppHEC7JhCftp/a4m7uSBbeyhIY2zA5cqhGApl8L0OMgeVeHQz0pdfrmO3QnP4/UpY+
OpmTsSqVf6o3gRkbGlhfaXeFHSHSho99VpPz/OPldff2prhWtyJgbFLRcAx9fxh+LryKrs/9eyn9
7G8DgC398+Rz3Qz+0xVw7s8/TvL3H192ryr2kcNf94smr5MuKjmmLa5mC8rfwWPYg05h1CngDQni
4P4IjwlSeEV+SppGVhJNV8p7D4ssmI5vxXFniOqOn4QDmcEWB4uqcv6x3KVDxvuXCHXKwGKG0UWO
rRfsRKcDEJiixff9l9ctiDKvz++H/RNzS6XJTB8YPlyf9X5eUJ+GxakdePRzRcKjBpaLS0PEEh7Z
T0AXB7o5XDQVRRKZunsAn+NJtDeJj5d0rMtHS/gpv4dEwQtoecepsOr7LJP4pEHPIGgeOJZqIMt2
lmqaup0FyZoy42k2F6c3XSTxwSKJUFepFJUjQbmK6uuurJI1YrGMgWLoSF96UMmJhVz1ubrYKq5I
+MBSrEeeZIGvLaVUWk1UNVIzE9t7Ru2d3esB40EA+/528icI5m/7r0/bwztI6Q/fdg9/gchvJpND
nYf5HlUl5nHp42sjxZjGKonOGDzve49Ch705vbkcKCX8EYvqnmnMOA6qONi20QqVdj0Nr7z7hYEY
n+hyrBqmN2/m/SmUBo+fNMmlqLoK07KZVs6CtM3myx/wQhgz0xiS3sMF/ffbJjFVSz1qnuQx/FNB
B1Uo1HGrFFXMcoLQ8kyCIJzNrEA1gztNRHH1TCGiRzlg9P/UEaiNHYSnCOqIo6zcRMsF6dUraXHJ
EYiFcJ1ZoImzz2EDEnfNHnXQlKbt7AKcFCAICIRCtEngLJCz+2u+npHgnCldVHcOc+NQzNiArYCz
MnlUkf3LUFDAKTgIPyOBIQQrAWf8DessLjKj6yMK2CryRaik6aqNULRocuHAmDHUCOWpz1lqYNB4
OFsKsm4MOYE5+s3nLrZNwBWk29ip6l00mb2W3N7QBImw1YkaLCrOWHNENkvYVG7zyM8h8qCz6JMH
s+er33Xms7pGkW3QWqQdyk/m7YXRmeCsX2Mw0MrMcblET+PCsnlVIEo8aW3rpZtQNcdge5QPVpRD
FClzuyNOxHHVNW5EZsRAz1JRYSikJTGwNjayE+hS0ldZwelEKO/Kind/bt+/H04enp8O+6/vz+9v
Jz/UI/b2dbeFc/s/u/8zeD9M5YyZ6LLZPQzux8mlh4HKUI+GCTEnZqK6Hl+jRE1f8/vcpBvL+jlt
xjrx2iSmwTJiRAqXe4ZDeG0OITLQTuRUC9zVC3eIcSZnMo9Aeqk4b996kap1ZxR5a7ymLtJiZv9i
Dpw8tc1AovRz1wjrsQUduoEF5OJ6ZKWdzwF+zGOj9CKJyaKybiprncPa73fOOq4Lfz8tZIM2csU8
NjcI6VhiWRaNA1MiB1ymwH9NjRVSogcaN4fF7JNY2LxIg5zH8cC8HgfhNpsEmHqZxsmZ3yeNrILI
9BgSrurY1KWYuNZFijqfoP6xiEd7zkFR1POMBH153T8d/joBGfzk8cfu7auvQCUmSoVEN8dLgyOR
8la2kYpCCazFIgWeKR30J1dBits2kc3H82Fxab7aK2GgoFS5uiGxVPmCxy10nwuMdxg2G7MowubU
IG7MCpRGZFXBB5JdGsFxHB5g9t93vx/2PzS3+kakDwr+6o/6vIKaujtR5VYiT1ylJeYrwFaZcYBB
iFfxpWvLln8pMUwG2nXBPmG3sD59ZETK9yypM8w4Z+wvB0Nt6oo8tQebSpkXcLZ28zZXn9BR2J1N
uUfzdQZMNxr/Civw2ljKnRQrPKyHWB69GPCrQ2kFC9eLP959ef/6FbWkydPb4fX9h53hOxOLhMz4
zKAiBnDQ0KqnkI+nf084KpACE5HyJSgcKkRa9Ck2pC/d+ZoZ1prO+bvOmUGfDLV3RJmhpXJwtocC
bXU1ncvELKwWdvxN/M1J8+o1ou7aWS3QbTdPGrwYRWrZyxOW3TW/ND1229EG0sxUraA6iJ2prR8K
M44yPE5AeJV5ndgvwqoUxNONyklk+G1xl9tPBAQti6Quck9utYpWpqmcqkJvwFTMnJnQ/QV+MIW9
4Pb4Z3A0vYSWFamSzSeXp6enAcrB7sDOK+5QoaVxV0fsdar7QFdxayc1r6MlhoEmlAQ5GH7aaT/U
t2s2d7yaWwoRSKYS7AhR2WjWPIcl7Q5HABlFtG5XAtet/0CmsGhKijxBXowrGzhoWTvhbp3l5nat
XjphfDSTDPQnxfPL24eT9Pnhr/cXdY4tt09fLXP7UqBbPhynhWMaz+HROL+VVh76RGViKVpMTz9e
asW8Qam/xdeBBpZmwCRZIbsl+sU2ouZzyNzdDnlK2W1+vK/KgAuO8sd3PL/NfTs2l1ZRyFxfYe2Q
twTrjdRHWximGnvB4FitpCzVw496OEJd9Hg2/c/by/4J9dPQmx/vh93fO/hjd3j4448//td4U0Jn
BipyQXzlYEVvWnuvWZeGgUInrGKTD6vWolzYNnJjPlvpVTdm2bJ3E09+d6cwcBAVd2ST5RBUd7XM
vM+ohY4QgrDY9GTRAHxpAfHuwgWTDUCtsZcuVp0cTSWAJ1AkN8dISBBQdOdeRUkVtSDmAqMp2760
qbtdNXVwyEHKR6axTqX0WBc9mUpHoyUJ60Kn8YK9hp4kYRfbcTIYaWRY33OrIOvpq45VTXciaTgG
uJdn/h8L2+4onGjzVJhWkTQJNAcjjFhFWB1dm9dSxrBH1dMXc8uo+zFwSv6l2IPH7WF7gnzBA776
WtGOafATexT0ne56g9i7ZOF/QQ45CZ/1nq7yvItFI1BgQNevxDbXO9piu/KogjHJG+AHhyChsEA5
xsWZ6J7pj1q8kFN/ASAmtMoMkkrO7QLMz+2pRJC8rf2wn9QIslHtFrQDgWdPCt7b2+6dO+5wiyjW
vyKmn2kzqqnz6L4pSocRGEQOanUVwkIDyyVP08uCc6ffqgB1tmTk/wejhs/2Dgn6/uBKJ0pgCHPT
8IcoIv2hKmVEqrIj+6xGYODaUI3hJVXMlSl9x64fe7hwuWVFVfd7matMiirVehTuCSrKYtSdoCBu
mvEpKMo2xruaokRWrEpi1ny4T9HormbT/8v1atMry+mh+eDR7N4OeLohwxFhpPTt151hHt5abKWK
faBrcsH2JlEwuaExZ3G0HvQNoBH92YJvCUUFLMsnJV5bfEHGk3HPWHNaVOGizXJz2cRy/ctlK5mA
beFcJCkKLLyZOCCVXOSJUgaNVTZrdx4g5cRkl2a8i1DByue4HmTXVVSsPdYfGH4A6w1iJtfQ1KNk
jGTaMgKVH6JCWZC7OogS32GqFp+HtZBsIatbaJZUr8sfT//GVNcDJ1/BoYE6QVxQeDJoa5eRs1jF
bIJA0j+TcrV29jZhsiTHRyI+ughR4GehcuNkbWrJZsOwI+Pi30ozVIWE2Z5KJQxKC4w8GLi2LK2K
s+sUZ3Z5zjxzU2uXchO3WemNgX761ck/Qn0Fqjoq772vV4BoAhn5iEBpoUPFAhdqvYERsG2T2AFt
HGURAQ3B1q6zQj6YMs6F6rVVkgRKzETtpLSGxo0qCId6nlQZMHjGXQnUcLCksXuogsRMLiPsMaqc
ZlmUMglgEYa+3sH1F4313TA4yPOHlpYaee8dWW0TmUUCpjL0ma9P0GuGTAhYDXNfrn7XsD8kfxA8
RLnlOKjv4Wu78yPA9Q9hb0GLT8+SusZtEBcRHVDWCas4+VmiLg3+DnYUDP8FZxNDWUPdAQA=
--===============2041480172725183536==--

