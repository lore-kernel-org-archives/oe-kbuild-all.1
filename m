Content-Type: multipart/mixed; boundary="===============3069994154272944879=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hare-scsi-devel:ata-debug.v2 38/47] drivers/ata/sata_fsl.c:1366:15: error: 'ap' undeclared; did you mean 'up'?
Date: Wed, 05 Feb 2020 23:19:23 +0800
Message-ID: <202002052318.5Q8EbN57%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3069994154272944879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 ata-debug.v2
head:   32044d13c62b098da1b73f447bcaf6d26ecfba46
commit: d3ee800aaa6b23a2e180986b4ca51183085de74c [38/47] sata_fsl: move DPR=
INTK to ata debugging
config: powerpc-mpc837x_rdb_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d3ee800aaa6b23a2e180986b4ca51183085de74c
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/platform_device.h:13:0,
                    from drivers/ata/sata_fsl.c:15:
   drivers/ata/sata_fsl.c: In function 'fsl_sata_set_irq_coalescing':
>> drivers/ata/sata_fsl.c:318:3: warning: format '%x' expects argument of t=
ype 'unsigned int', but argument 5 has type 'void *' [-Wformat=3D]
      "%s: ICC register status: (hcr base: 0x%x) =3D 0x%x\n",
      ^
   include/linux/device.h:1691:22: note: in definition of macro 'dev_fmt'
    #define dev_fmt(fmt) fmt
                         ^~~
>> drivers/ata/sata_fsl.c:317:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(host->dev,
     ^~~~~~~
   drivers/ata/sata_fsl.c: In function 'sata_fsl_init_controller':
>> drivers/ata/sata_fsl.c:1366:15: error: 'ap' undeclared (first use in thi=
s function); did you mean 'up'?
     ata_port_dbg(ap, "icc =3D 0x%x\n", ioread32(hcr_base + ICC));
                  ^
   include/linux/device.h:1792:26: note: in definition of macro 'dev_dbg'
      dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                             ^~~
>> drivers/ata/sata_fsl.c:1366:2: note: in expansion of macro 'ata_port_dbg'
     ata_port_dbg(ap, "icc =3D 0x%x\n", ioread32(hcr_base + ICC));
     ^~~~~~~~~~~~
   drivers/ata/sata_fsl.c:1366:15: note: each undeclared identifier is repo=
rted only once for each function it appears in
     ata_port_dbg(ap, "icc =3D 0x%x\n", ioread32(hcr_base + ICC));
                  ^
   include/linux/device.h:1792:26: note: in definition of macro 'dev_dbg'
      dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                             ^~~
>> drivers/ata/sata_fsl.c:1366:2: note: in expansion of macro 'ata_port_dbg'
     ata_port_dbg(ap, "icc =3D 0x%x\n", ioread32(hcr_base + ICC));
     ^~~~~~~~~~~~
   drivers/ata/sata_fsl.c: In function 'sata_fsl_probe':
   drivers/ata/sata_fsl.c:1465:15: error: 'ap' undeclared (first use in thi=
s function); did you mean 'up'?
     ata_port_dbg(ap, "@reset i/o =3D 0x%x\n", ioread32(csr_base + TRANSCFG=
));
                  ^
   include/linux/device.h:1792:26: note: in definition of macro 'dev_dbg'
      dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                             ^~~
   drivers/ata/sata_fsl.c:1465:2: note: in expansion of macro 'ata_port_dbg'
     ata_port_dbg(ap, "@reset i/o =3D 0x%x\n", ioread32(csr_base + TRANSCFG=
));
     ^~~~~~~~~~~~

vim +1366 drivers/ata/sata_fsl.c

  1335	=

  1336	/*
  1337	 * Multiple ports are represented by multiple SATA controllers with
  1338	 * one port per controller
  1339	 */
  1340	static int sata_fsl_init_controller(struct ata_host *host)
  1341	{
  1342		struct sata_fsl_host_priv *host_priv =3D host->private_data;
  1343		void __iomem *hcr_base =3D host_priv->hcr_base;
  1344		u32 temp;
  1345	=

  1346		/*
  1347		 * NOTE : We cannot bring the controller online before setting
  1348		 * the CHBA, hence main controller initialization is done as
  1349		 * part of the port_start() callback
  1350		 */
  1351	=

  1352		/* sata controller to operate in enterprise mode */
  1353		temp =3D ioread32(hcr_base + HCONTROL);
  1354		iowrite32(temp & ~HCONTROL_LEGACY, hcr_base + HCONTROL);
  1355	=

  1356		/* ack. any pending IRQs for this controller/port */
  1357		temp =3D ioread32(hcr_base + HSTATUS);
  1358		if (temp & 0x3F)
  1359			iowrite32((temp & 0x3F), hcr_base + HSTATUS);
  1360	=

  1361		/* Keep interrupts disabled on the controller */
  1362		temp =3D ioread32(hcr_base + HCONTROL);
  1363		iowrite32((temp & ~0x3F), hcr_base + HCONTROL);
  1364	=

  1365		/* Disable interrupt coalescing control(icc), for the moment */
> 1366		ata_port_dbg(ap, "icc =3D 0x%x\n", ioread32(hcr_base + ICC));
  1367		iowrite32(0x01000000, hcr_base + ICC);
  1368	=

  1369		/* clear error registers, SError is cleared by libATA  */
  1370		iowrite32(0x00000FFFF, hcr_base + CE);
  1371		iowrite32(0x00000FFFF, hcr_base + DE);
  1372	=

  1373	 	/*
  1374		 * reset the number of command complete bits which will cause the
  1375		 * interrupt to be signaled
  1376		 */
  1377		fsl_sata_set_irq_coalescing(host, intr_coalescing_count,
  1378				intr_coalescing_ticks);
  1379	=

  1380		/*
  1381		 * host controller will be brought on-line, during xx_port_start()
  1382		 * callback, that should also initiate the OOB, COMINIT sequence
  1383		 */
  1384	=

  1385		ata_port_dbg(ap, "HStatus =3D 0x%x HControl =3D 0x%x\n",
  1386			     ioread32(hcr_base + HSTATUS), ioread32(hcr_base + HCONTROL));
  1387	=

  1388		return 0;
  1389	}
  1390	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============3069994154272944879==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AQA=
--===============3069994154272944879==--

