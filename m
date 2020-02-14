Content-Type: multipart/mixed; boundary="===============6645915673064853860=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hare-scsi-devel:ata-debug.v2 36/42] drivers/ata/sata_fsl.c:1372:1: error: unknown type name 'x'
Date: Fri, 14 Feb 2020 21:51:28 +0800
Message-ID: <202002142120.0ON9MwZt%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6645915673064853860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 ata-debug.v2
head:   14d607d2960745090643af19e0a7c7c649a0202c
commit: af45b40212929d9c83578e31899bdbf775004658 [36/42] sata_fsl: move DPR=
INTK to ata debugging
config: powerpc-mpc83xx_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout af45b40212929d9c83578e31899bdbf775004658
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15:0,
                    from include/linux/platform_device.h:13,
                    from drivers/ata/sata_fsl.c:15:
   drivers/ata/sata_fsl.c: In function 'fsl_sata_set_irq_coalescing':
   drivers/ata/sata_fsl.c:318:3: warning: format '%x' expects argument of t=
ype 'unsigned int', but argument 5 has type 'void *' [-Wformat=3D]
      "%s: ICC register status: (hcr base: 0x%x) =3D 0x%x\n",
      ^
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
    #define dev_fmt(fmt) fmt
                         ^~~
   drivers/ata/sata_fsl.c:317:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(host->dev,
     ^~~~~~~
   drivers/ata/sata_fsl.c: In function 'sata_fsl_init_controller':
   drivers/ata/sata_fsl.c:1365:15: error: 'ap' undeclared (first use in thi=
s function); did you mean 'up'?
     ata_port_dbg(ap, "icc =3D 0x%x\n", ioread32(hcr_base + ICC));
                  ^
   include/linux/dev_printk.h:122:26: note: in definition of macro 'dev_dbg'
      dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                             ^~~
   drivers/ata/sata_fsl.c:1365:2: note: in expansion of macro 'ata_port_dbg'
     ata_port_dbg(ap, "icc =3D 0x%x\n", ioread32(hcr_base + ICC));
     ^~~~~~~~~~~~
   drivers/ata/sata_fsl.c:1365:15: note: each undeclared identifier is repo=
rted only once for each function it appears in
     ata_port_dbg(ap, "icc =3D 0x%x\n", ioread32(hcr_base + ICC));
                  ^
   include/linux/dev_printk.h:122:26: note: in definition of macro 'dev_dbg'
      dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                             ^~~
   drivers/ata/sata_fsl.c:1365:2: note: in expansion of macro 'ata_port_dbg'
     ata_port_dbg(ap, "icc =3D 0x%x\n", ioread32(hcr_base + ICC));
     ^~~~~~~~~~~~
>> drivers/ata/sata_fsl.c:1372:1: error: unknown type name 'x'
    x /*
    ^
>> drivers/ata/sata_fsl.c:1377:4: warning: parameter names (without types) =
in function declaration
       intr_coalescing_ticks);
       ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ata/sata_fsl.c:1376:2: error: conflicting types for 'fsl_sata_se=
t_irq_coalescing'
     fsl_sata_set_irq_coalescing(host, intr_coalescing_count,
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/sata_fsl.c:289:13: note: previous definition of 'fsl_sata_se=
t_irq_coalescing' was here
    static void fsl_sata_set_irq_coalescing(struct ata_host *host,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ata/sata_fsl.c:1372:1: warning: ISO C90 forbids mixed declaratio=
ns and code [-Wdeclaration-after-statement]
    x /*
    ^
   In file included from include/linux/device.h:15:0,
                    from include/linux/platform_device.h:13,
                    from drivers/ata/sata_fsl.c:15:
   drivers/ata/sata_fsl.c: In function 'sata_fsl_probe':
   drivers/ata/sata_fsl.c:1465:15: error: 'ap' undeclared (first use in thi=
s function); did you mean 'up'?
     ata_port_dbg(ap, "@reset i/o =3D 0x%x\n", ioread32(csr_base + TRANSCFG=
));
                  ^
   include/linux/dev_printk.h:122:26: note: in definition of macro 'dev_dbg'
      dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                             ^~~
   drivers/ata/sata_fsl.c:1465:2: note: in expansion of macro 'ata_port_dbg'
     ata_port_dbg(ap, "@reset i/o =3D 0x%x\n", ioread32(csr_base + TRANSCFG=
));
     ^~~~~~~~~~~~

vim +/x +1372 drivers/ata/sata_fsl.c

  1334	=

  1335	/*
  1336	 * Multiple ports are represented by multiple SATA controllers with
  1337	 * one port per controller
  1338	 */
  1339	static int sata_fsl_init_controller(struct ata_host *host)
  1340	{
  1341		struct sata_fsl_host_priv *host_priv =3D host->private_data;
  1342		void __iomem *hcr_base =3D host_priv->hcr_base;
  1343		u32 temp;
  1344	=

  1345		/*
  1346		 * NOTE : We cannot bring the controller online before setting
  1347		 * the CHBA, hence main controller initialization is done as
  1348		 * part of the port_start() callback
  1349		 */
  1350	=

  1351		/* sata controller to operate in enterprise mode */
  1352		temp =3D ioread32(hcr_base + HCONTROL);
  1353		iowrite32(temp & ~HCONTROL_LEGACY, hcr_base + HCONTROL);
  1354	=

  1355		/* ack. any pending IRQs for this controller/port */
  1356		temp =3D ioread32(hcr_base + HSTATUS);
  1357		if (temp & 0x3F)
  1358			iowrite32((temp & 0x3F), hcr_base + HSTATUS);
  1359	=

  1360		/* Keep interrupts disabled on the controller */
  1361		temp =3D ioread32(hcr_base + HCONTROL);
  1362		iowrite32((temp & ~0x3F), hcr_base + HCONTROL);
  1363	=

  1364		/* Disable interrupt coalescing control(icc), for the moment */
  1365		ata_port_dbg(ap, "icc =3D 0x%x\n", ioread32(hcr_base + ICC));
  1366		iowrite32(0x01000000, hcr_base + ICC);
  1367	=

  1368		/* clear error registers, SError is cleared by libATA  */
  1369		iowrite32(0x00000FFFF, hcr_base + CE);
  1370		iowrite32(0x00000FFFF, hcr_base + DE);
  1371	=

> 1372	x	/*
  1373		 * reset the number of command complete bits which will cause the
  1374		 * interrupt to be signaled
  1375		 */
> 1376		fsl_sata_set_irq_coalescing(host, intr_coalescing_count,
> 1377				intr_coalescing_ticks);
  1378	=

  1379		/*
  1380		 * host controller will be brought on-line, during xx_port_start()
  1381		 * callback, that should also initiate the OOB, COMINIT sequence
  1382		 */
  1383	=

  1384		ata_port_dbg(ap, "HStatus =3D 0x%x HControl =3D 0x%x\n",
  1385			     ioread32(hcr_base + HSTATUS),
  1386			     ioread32(hcr_base + HCONTROL));
  1387	=

  1388		return 0;
  1389	}
  1390	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6645915673064853860==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6645915673064853860==--

