Content-Type: multipart/mixed; boundary="===============5514052172971775707=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [avpatel:riscv_aia_v1 11/12] drivers/irqchip/irq-riscv-imsic.c:796 imsic_init() warn: missing error code 'rc'
Date: Mon, 10 May 2021 07:40:55 +0300
Message-ID: <202105091019.gcCwZ2rn-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5514052172971775707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/avpatel/linux.git riscv_aia_v1
head:   c5f917236b87b251800b9385346ecdb689308c7e
commit: d6636493d1ce035ed75e3102f89b6744d3b2b37d [11/12] irqchip: Add RISC-=
V incoming MSI controller driver
config: riscv-randconfig-m031-20210509 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/irqchip/irq-riscv-imsic.c:796 imsic_init() warn: missing error code=
 'rc'

vim +/rc +796 drivers/irqchip/irq-riscv-imsic.c

d6636493d1ce03 Anup Patel 2021-04-26  729  static int __init imsic_init(str=
uct device_node *node,
d6636493d1ce03 Anup Patel 2021-04-26  730  			     struct device_node *pare=
nt)
d6636493d1ce03 Anup Patel 2021-04-26  731  {
d6636493d1ce03 Anup Patel 2021-04-26  732  	struct resource res;
d6636493d1ce03 Anup Patel 2021-04-26  733  	struct imsic_mmio *mmio;
d6636493d1ce03 Anup Patel 2021-04-26  734  	struct imsic_priv *priv;
d6636493d1ce03 Anup Patel 2021-04-26  735  	struct imsic_handler *handler;
d6636493d1ce03 Anup Patel 2021-04-26  736  	int i, rc =3D 0, nr_files, nr_h=
andlers =3D 0;
d6636493d1ce03 Anup Patel 2021-04-26  737  =

d6636493d1ce03 Anup Patel 2021-04-26  738  	priv =3D kzalloc(sizeof(*priv),=
 GFP_KERNEL);
d6636493d1ce03 Anup Patel 2021-04-26  739  	if (!priv)
d6636493d1ce03 Anup Patel 2021-04-26  740  		return -ENOMEM;
d6636493d1ce03 Anup Patel 2021-04-26  741  =

d6636493d1ce03 Anup Patel 2021-04-26  742  	/* Find number of MMIO register=
 sets */
d6636493d1ce03 Anup Patel 2021-04-26  743  	while (!of_address_to_resource(=
node, priv->num_mmios++, &res)) ;
d6636493d1ce03 Anup Patel 2021-04-26  744  =

d6636493d1ce03 Anup Patel 2021-04-26  745  	/* Allocate MMIO register sets =
*/
d6636493d1ce03 Anup Patel 2021-04-26  746  	priv->mmios =3D kcalloc(priv->n=
um_mmios, sizeof(*mmio), GFP_KERNEL);
d6636493d1ce03 Anup Patel 2021-04-26  747  	if (!priv->mmios) {
d6636493d1ce03 Anup Patel 2021-04-26  748  		rc =3D -ENOMEM;
d6636493d1ce03 Anup Patel 2021-04-26  749  		goto out_free_priv;
d6636493d1ce03 Anup Patel 2021-04-26  750  	}
d6636493d1ce03 Anup Patel 2021-04-26  751  =

d6636493d1ce03 Anup Patel 2021-04-26  752  	/* Parse and map MMIO register =
sets */
d6636493d1ce03 Anup Patel 2021-04-26  753  	for (i =3D 0; i < priv->num_mmi=
os; i++) {
d6636493d1ce03 Anup Patel 2021-04-26  754  		mmio =3D &priv->mmios[i];
d6636493d1ce03 Anup Patel 2021-04-26  755  		rc =3D of_address_to_resource(=
node, i, &res);
d6636493d1ce03 Anup Patel 2021-04-26  756  		if (rc) {
d6636493d1ce03 Anup Patel 2021-04-26  757  			pr_err("unable to parse MMIO =
regset %d\n", i);
d6636493d1ce03 Anup Patel 2021-04-26  758  			goto out_iounmap;
d6636493d1ce03 Anup Patel 2021-04-26  759  		}
d6636493d1ce03 Anup Patel 2021-04-26  760  		mmio->pa =3D res.start;
d6636493d1ce03 Anup Patel 2021-04-26  761  		mmio->size =3D res.end - res.s=
tart + 1;
d6636493d1ce03 Anup Patel 2021-04-26  762  		mmio->va =3D of_iomap(node, i);
d6636493d1ce03 Anup Patel 2021-04-26  763  		if (!mmio->va) {
d6636493d1ce03 Anup Patel 2021-04-26  764  			rc =3D -EIO;
d6636493d1ce03 Anup Patel 2021-04-26  765  			pr_err("unable to map MMIO re=
gset %d\n", i);
d6636493d1ce03 Anup Patel 2021-04-26  766  			goto out_iounmap;
d6636493d1ce03 Anup Patel 2021-04-26  767  		}
d6636493d1ce03 Anup Patel 2021-04-26  768  	}
d6636493d1ce03 Anup Patel 2021-04-26  769  =

d6636493d1ce03 Anup Patel 2021-04-26  770  	/* Find number of interrupt ide=
ntities */
d6636493d1ce03 Anup Patel 2021-04-26  771  	rc =3D -EINVAL;
d6636493d1ce03 Anup Patel 2021-04-26  772  	of_property_read_u32(node, "num=
-ids", &priv->nr_ids);
d6636493d1ce03 Anup Patel 2021-04-26  773  	if (!priv->nr_ids) {
d6636493d1ce03 Anup Patel 2021-04-26  774  		pr_err("number of interrupt id=
entities not available\n");
d6636493d1ce03 Anup Patel 2021-04-26  775  		goto out_iounmap;
d6636493d1ce03 Anup Patel 2021-04-26  776  	}
d6636493d1ce03 Anup Patel 2021-04-26  777  	if ((priv->nr_ids < IMSIC_MIN_I=
D) ||
d6636493d1ce03 Anup Patel 2021-04-26  778  	    (IMSIC_MAX_ID <=3D priv->nr=
_ids) ||
d6636493d1ce03 Anup Patel 2021-04-26  779  	    ((priv->nr_ids & IMSIC_MIN_=
ID) !=3D IMSIC_MIN_ID)) {
d6636493d1ce03 Anup Patel 2021-04-26  780  		pr_err("invalid number of inte=
rrupt identities %d\n",
d6636493d1ce03 Anup Patel 2021-04-26  781  			priv->nr_ids);
d6636493d1ce03 Anup Patel 2021-04-26  782  		goto out_iounmap;
d6636493d1ce03 Anup Patel 2021-04-26  783  	}
d6636493d1ce03 Anup Patel 2021-04-26  784  =

d6636493d1ce03 Anup Patel 2021-04-26  785  	/* Initalize interrupt managmen=
t */
d6636493d1ce03 Anup Patel 2021-04-26  786  	rc =3D imsic_irqs_init(priv);
d6636493d1ce03 Anup Patel 2021-04-26  787  	if (rc) {
d6636493d1ce03 Anup Patel 2021-04-26  788  		pr_err("failed to initialize I=
RQ managment\n");
d6636493d1ce03 Anup Patel 2021-04-26  789  		goto out_iounmap;
d6636493d1ce03 Anup Patel 2021-04-26  790  	}
d6636493d1ce03 Anup Patel 2021-04-26  791  =

d6636493d1ce03 Anup Patel 2021-04-26  792  	/* Find number of interrupt fil=
es */
d6636493d1ce03 Anup Patel 2021-04-26  793  	nr_files =3D of_irq_count(node);
d6636493d1ce03 Anup Patel 2021-04-26  794  	if (!nr_files) {
d6636493d1ce03 Anup Patel 2021-04-26  795  		pr_err("number of interrupt fi=
les not available\n");
d6636493d1ce03 Anup Patel 2021-04-26 @796  		goto out_irqs_cleanup;

This needs an error code.

d6636493d1ce03 Anup Patel 2021-04-26  797  	}
d6636493d1ce03 Anup Patel 2021-04-26  798  =

d6636493d1ce03 Anup Patel 2021-04-26  799  	/* Configure handlers for targe=
t CPUs */
d6636493d1ce03 Anup Patel 2021-04-26  800  	for (i =3D 0; i < nr_files; i++=
) {
d6636493d1ce03 Anup Patel 2021-04-26  801  		struct of_phandle_args parent;
d6636493d1ce03 Anup Patel 2021-04-26  802  		unsigned long reloff;
d6636493d1ce03 Anup Patel 2021-04-26  803  		int j, cpu, hartid;
d6636493d1ce03 Anup Patel 2021-04-26  804  =

d6636493d1ce03 Anup Patel 2021-04-26  805  		if (of_irq_parse_one(node, i, =
&parent)) {
d6636493d1ce03 Anup Patel 2021-04-26  806  			pr_err("failed to parse paren=
t IRQ for "
d6636493d1ce03 Anup Patel 2021-04-26  807  				"interrupt file%d.\n", i);
d6636493d1ce03 Anup Patel 2021-04-26  808  			continue;
d6636493d1ce03 Anup Patel 2021-04-26  809  		}
d6636493d1ce03 Anup Patel 2021-04-26  810  =

d6636493d1ce03 Anup Patel 2021-04-26  811  		/*
d6636493d1ce03 Anup Patel 2021-04-26  812  		 * Skip interrupt files other =
than external interrupts for
d6636493d1ce03 Anup Patel 2021-04-26  813  		 * out privilege level.
d6636493d1ce03 Anup Patel 2021-04-26  814  		 */
d6636493d1ce03 Anup Patel 2021-04-26  815  		if (parent.args[0] !=3D RV_IRQ=
_EXT)
d6636493d1ce03 Anup Patel 2021-04-26  816  			continue;
d6636493d1ce03 Anup Patel 2021-04-26  817  =

d6636493d1ce03 Anup Patel 2021-04-26  818  		hartid =3D riscv_of_parent_har=
tid(parent.np);
d6636493d1ce03 Anup Patel 2021-04-26  819  		if (hartid < 0) {
d6636493d1ce03 Anup Patel 2021-04-26  820  			pr_warn("failed to parse hart=
 ID for interrupt "
d6636493d1ce03 Anup Patel 2021-04-26  821  				"file%d.\n", i);
d6636493d1ce03 Anup Patel 2021-04-26  822  			continue;
d6636493d1ce03 Anup Patel 2021-04-26  823  		}
d6636493d1ce03 Anup Patel 2021-04-26  824  =

d6636493d1ce03 Anup Patel 2021-04-26  825  		cpu =3D riscv_hartid_to_cpuid(=
hartid);
d6636493d1ce03 Anup Patel 2021-04-26  826  		if (cpu < 0) {
d6636493d1ce03 Anup Patel 2021-04-26  827  			pr_warn("Invalid cpuid for in=
terrupt file%d\n", i);
d6636493d1ce03 Anup Patel 2021-04-26  828  			continue;
d6636493d1ce03 Anup Patel 2021-04-26  829  		}
d6636493d1ce03 Anup Patel 2021-04-26  830  =

d6636493d1ce03 Anup Patel 2021-04-26  831  		/* Find parent domain and regi=
ster chained handler */
d6636493d1ce03 Anup Patel 2021-04-26  832  		if (!imsic_parent_irq && irq_f=
ind_host(parent.np)) {
d6636493d1ce03 Anup Patel 2021-04-26  833  			imsic_parent_irq =3D irq_of_p=
arse_and_map(node, i);
d6636493d1ce03 Anup Patel 2021-04-26  834  			if (imsic_parent_irq)
d6636493d1ce03 Anup Patel 2021-04-26  835  				irq_set_chained_handler(imsi=
c_parent_irq,
d6636493d1ce03 Anup Patel 2021-04-26  836  							imsic_handle_irq);
d6636493d1ce03 Anup Patel 2021-04-26  837  		}
d6636493d1ce03 Anup Patel 2021-04-26  838  =

d6636493d1ce03 Anup Patel 2021-04-26  839  		/* Find MMIO location of MSI f=
ile */
d6636493d1ce03 Anup Patel 2021-04-26  840  		mmio =3D NULL;
d6636493d1ce03 Anup Patel 2021-04-26  841  		reloff =3D i * IMSIC_MMIO_FILE=
_SZ;
d6636493d1ce03 Anup Patel 2021-04-26  842  		for (j =3D 0; priv->num_mmios;=
 j++) {
d6636493d1ce03 Anup Patel 2021-04-26  843  			if (reloff < priv->mmios[j].s=
ize) {
d6636493d1ce03 Anup Patel 2021-04-26  844  				mmio =3D &priv->mmios[j];
d6636493d1ce03 Anup Patel 2021-04-26  845  				break;
d6636493d1ce03 Anup Patel 2021-04-26  846  			}
d6636493d1ce03 Anup Patel 2021-04-26  847  =

d6636493d1ce03 Anup Patel 2021-04-26  848  			reloff -=3D priv->mmios[j].si=
ze;
d6636493d1ce03 Anup Patel 2021-04-26  849  		}
d6636493d1ce03 Anup Patel 2021-04-26  850  		if (!mmio) {
d6636493d1ce03 Anup Patel 2021-04-26  851  			pr_warn("can't find MMIO loca=
tion for interrupt "
d6636493d1ce03 Anup Patel 2021-04-26  852  				"file%d\n", i);
d6636493d1ce03 Anup Patel 2021-04-26  853  			continue;
d6636493d1ce03 Anup Patel 2021-04-26  854  		}
d6636493d1ce03 Anup Patel 2021-04-26  855  =

d6636493d1ce03 Anup Patel 2021-04-26  856  		handler =3D per_cpu_ptr(&imsic=
_handlers, cpu);
d6636493d1ce03 Anup Patel 2021-04-26  857  		if (handler->priv) {
d6636493d1ce03 Anup Patel 2021-04-26  858  			pr_warn("CPU%d handler alread=
y configured.\n", cpu);
d6636493d1ce03 Anup Patel 2021-04-26  859  			goto done;
d6636493d1ce03 Anup Patel 2021-04-26  860  		}
d6636493d1ce03 Anup Patel 2021-04-26  861  		cpumask_set_cpu(cpu, &priv->lm=
ask);
d6636493d1ce03 Anup Patel 2021-04-26  862  		handler->msi_pa =3D mmio->pa +=
 reloff;
d6636493d1ce03 Anup Patel 2021-04-26  863  		handler->msi_va =3D mmio->va +=
 reloff;
d6636493d1ce03 Anup Patel 2021-04-26  864  		handler->priv =3D priv;
d6636493d1ce03 Anup Patel 2021-04-26  865  =

d6636493d1ce03 Anup Patel 2021-04-26  866  done:
d6636493d1ce03 Anup Patel 2021-04-26  867  		nr_handlers++;
d6636493d1ce03 Anup Patel 2021-04-26  868  	}
d6636493d1ce03 Anup Patel 2021-04-26  869  =

d6636493d1ce03 Anup Patel 2021-04-26  870  	/* Initialize IPI operations */
d6636493d1ce03 Anup Patel 2021-04-26  871  	imsic_ipi_init(priv);
d6636493d1ce03 Anup Patel 2021-04-26  872  =

d6636493d1ce03 Anup Patel 2021-04-26  873  	/* Initialize IRQ and MSI domai=
ns */
d6636493d1ce03 Anup Patel 2021-04-26  874  	rc =3D imsic_domains_init(priv,=
 node);
d6636493d1ce03 Anup Patel 2021-04-26  875  	if (rc) {
d6636493d1ce03 Anup Patel 2021-04-26  876  		pr_err("Failed to initialize I=
RQ and MSI domains\n");
d6636493d1ce03 Anup Patel 2021-04-26  877  		goto out_irqs_cleanup;
d6636493d1ce03 Anup Patel 2021-04-26  878  	}
d6636493d1ce03 Anup Patel 2021-04-26  879  =

d6636493d1ce03 Anup Patel 2021-04-26  880  	/*
d6636493d1ce03 Anup Patel 2021-04-26  881  	 * We can have multiple IMSIC i=
nstances so setup cpuhp state only
d6636493d1ce03 Anup Patel 2021-04-26  882  	 * when handler for current/boo=
t CPU is present.
d6636493d1ce03 Anup Patel 2021-04-26  883  	 */
d6636493d1ce03 Anup Patel 2021-04-26  884  	handler =3D this_cpu_ptr(&imsic=
_handlers);
d6636493d1ce03 Anup Patel 2021-04-26  885  	if (handler->priv && !imsic_cpu=
hp_setup_done) {
d6636493d1ce03 Anup Patel 2021-04-26  886  		cpuhp_setup_state(CPUHP_AP_ONL=
INE_DYN,
d6636493d1ce03 Anup Patel 2021-04-26  887  				  "irqchip/riscv/imsic:start=
ing",
d6636493d1ce03 Anup Patel 2021-04-26  888  				  imsic_starting_cpu, imsic_=
dying_cpu);
d6636493d1ce03 Anup Patel 2021-04-26  889  		imsic_cpuhp_setup_done =3D tru=
e;
d6636493d1ce03 Anup Patel 2021-04-26  890  	}
d6636493d1ce03 Anup Patel 2021-04-26  891  =

d6636493d1ce03 Anup Patel 2021-04-26  892  	pr_info("%pOFP: mapped %d inter=
rupts and %d interrupt files using "
d6636493d1ce03 Anup Patel 2021-04-26  893  		"%d handlers\n", node, priv->n=
r_ids, nr_files, nr_handlers);
d6636493d1ce03 Anup Patel 2021-04-26  894  =

d6636493d1ce03 Anup Patel 2021-04-26  895  	return 0;
d6636493d1ce03 Anup Patel 2021-04-26  896  =

d6636493d1ce03 Anup Patel 2021-04-26  897  out_irqs_cleanup:
d6636493d1ce03 Anup Patel 2021-04-26  898  	imsic_irqs_cleanup(priv);
d6636493d1ce03 Anup Patel 2021-04-26  899  out_iounmap:
d6636493d1ce03 Anup Patel 2021-04-26  900  	for (i =3D 0; i < priv->num_mmi=
os; i++) {
d6636493d1ce03 Anup Patel 2021-04-26  901  		if (priv->mmios[i].va)
d6636493d1ce03 Anup Patel 2021-04-26  902  			iounmap(priv->mmios[i].va);
d6636493d1ce03 Anup Patel 2021-04-26  903  	}
d6636493d1ce03 Anup Patel 2021-04-26  904  	kfree(priv->mmios);
d6636493d1ce03 Anup Patel 2021-04-26  905  out_free_priv:
d6636493d1ce03 Anup Patel 2021-04-26  906  	kfree(priv);
d6636493d1ce03 Anup Patel 2021-04-26  907  	return rc;
d6636493d1ce03 Anup Patel 2021-04-26  908  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5514052172971775707==--

