Content-Type: multipart/mixed; boundary="===============8792132421652018034=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH kernel 1/2] irq: Add reference counting to IRQ mappings
Date: Tue, 27 Oct 2020 21:06:18 +0800
Message-ID: <202010272156.4VCe5OXz-lkp@intel.com>
In-Reply-To: <20201027090655.14118-2-aik@ozlabs.ru>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8792132421652018034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexey,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on powerpc/next]
[also build test ERROR on tip/irq/core v5.10-rc1 next-20201027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexey-Kardashevskiy/irq-A=
dd-reference-counting-to-IRQ-mappings/20201027-170907
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
config: s390-zfcpdump_defconfig (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/63684bd94a7e53ec13917e2a2=
3d55ce572bf2878
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexey-Kardashevskiy/irq-Add-refer=
ence-counting-to-IRQ-mappings/20201027-170907
        git checkout 63684bd94a7e53ec13917e2a23d55ce572bf2878
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/irq/irqdesc.c: In function 'irq_kobj_release':
>> kernel/irq/irqdesc.c:431:7: error: implicit declaration of function 'irq=
_domain_is_hierarchy' [-Werror=3Dimplicit-function-declaration]
     431 |   if (irq_domain_is_hierarchy(domain)) {
         |       ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/irq/irqdesc.c:432:4: error: implicit declaration of function 'irq=
_domain_free_irqs'; did you mean 'irq_domain_activate_irq'? [-Werror=3Dimpl=
icit-function-declaration]
     432 |    irq_domain_free_irqs(virq, 1);
         |    ^~~~~~~~~~~~~~~~~~~~
         |    irq_domain_activate_irq
>> kernel/irq/irqdesc.c:434:4: error: implicit declaration of function 'irq=
_domain_disassociate' [-Werror=3Dimplicit-function-declaration]
     434 |    irq_domain_disassociate(domain, virq);
         |    ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/irq_domain_is_hierarchy +431 kernel/irq/irqdesc.c

   421	=

   422	static void delayed_free_desc(struct rcu_head *rhp);
   423	static void irq_kobj_release(struct kobject *kobj)
   424	{
   425		struct irq_desc *desc =3D container_of(kobj, struct irq_desc, kobj);
   426		struct irq_domain *domain;
   427		unsigned int virq =3D desc->irq_data.irq;
   428	=

   429		domain =3D desc->irq_data.domain;
   430		if (domain) {
 > 431			if (irq_domain_is_hierarchy(domain)) {
 > 432				irq_domain_free_irqs(virq, 1);
   433			} else {
 > 434				irq_domain_disassociate(domain, virq);
   435				irq_free_desc(virq);
   436			}
   437		}
   438	=

   439		/*
   440		 * We free the descriptor, masks and stat fields via RCU. That
   441		 * allows demultiplex interrupts to do rcu based management of
   442		 * the child interrupts.
   443		 * This also allows us to use rcu in kstat_irqs_usr().
   444		 */
   445		call_rcu(&desc->rcu, delayed_free_desc);
   446	}
   447	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8792132421652018034==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8792132421652018034==--

