Content-Type: multipart/mixed; boundary="===============4494362538569252532=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 02/27] ata: expose ncq_enable_prio sysfs attribute only on NCQ capable hosts
Date: Sun, 01 Mar 2020 00:04:30 +0800
Message-ID: <202002292319.8ZixVysT%lkp@intel.com>
In-Reply-To: <20200227182226.19188-3-b.zolnierkie@samsung.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4494362538569252532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Bartlomiej,

I love your patch! Perhaps something to improve:

[auto build test WARNING on block/for-next]
[also build test WARNING on mkp-scsi/for-next scsi/for-next v5.6-rc3 next-2=
0200228]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Bartlomiej-Zolnierkiewicz/=
ata-optimize-core-code-size-on-PATA-only-setups/20200229-010807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/ata/sata_dwc_460ex.c:1152:9: sparse: sparse: Initializer entry d=
efined twice
>> drivers/ata/sata_dwc_460ex.c:1152:9: sparse:   also defined here

vim +1152 drivers/ata/sata_dwc_460ex.c

a7e6de544c5c23 Christian Lamparter 2016-04-26  1147  =

62936009f35a66 Rupjyoti Sarmah     2010-07-06  1148  /*
62936009f35a66 Rupjyoti Sarmah     2010-07-06  1149   * scsi mid-layer and =
libata interface structures
62936009f35a66 Rupjyoti Sarmah     2010-07-06  1150   */
62936009f35a66 Rupjyoti Sarmah     2010-07-06  1151  static struct scsi_hos=
t_template sata_dwc_sht =3D {
62936009f35a66 Rupjyoti Sarmah     2010-07-06 @1152  	ATA_NCQ_SHT(DRV_NAME),
62936009f35a66 Rupjyoti Sarmah     2010-07-06  1153  	/*
62936009f35a66 Rupjyoti Sarmah     2010-07-06  1154  	 * test-only: Current=
ly this driver doesn't handle NCQ
62936009f35a66 Rupjyoti Sarmah     2010-07-06  1155  	 * correctly. We enab=
le NCQ but set the queue depth to a
62936009f35a66 Rupjyoti Sarmah     2010-07-06  1156  	 * max of 1. This wil=
l get fixed in in a future release.
62936009f35a66 Rupjyoti Sarmah     2010-07-06  1157  	 */
62936009f35a66 Rupjyoti Sarmah     2010-07-06  1158  	.sg_tablesize		=3D LI=
BATA_MAX_PRD,
d7c256e857c125 Andy Shevchenko     2015-01-07  1159  	/* .can_queue		=3D AT=
A_MAX_QUEUE, */
6689dfac00ef31 Andy Shevchenko     2016-04-26  1160  	/*
6689dfac00ef31 Andy Shevchenko     2016-04-26  1161  	 * Make sure a LLI bl=
ock is not created that will span 8K max FIS
6689dfac00ef31 Andy Shevchenko     2016-04-26  1162  	 * boundary. If the b=
lock spans such a FIS boundary, there is a chance
6689dfac00ef31 Andy Shevchenko     2016-04-26  1163  	 * that a DMA burst w=
ill cross that boundary -- this results in an
6689dfac00ef31 Andy Shevchenko     2016-04-26  1164  	 * error in the host =
controller.
6689dfac00ef31 Andy Shevchenko     2016-04-26  1165  	 */
6689dfac00ef31 Andy Shevchenko     2016-04-26  1166  	.dma_boundary		=3D 0x=
1fff /* ATA_DMA_BOUNDARY */,
62936009f35a66 Rupjyoti Sarmah     2010-07-06  1167  };
62936009f35a66 Rupjyoti Sarmah     2010-07-06  1168  =


:::::: The code at line 1152 was first introduced by commit
:::::: 62936009f35a6659cc3ebe0d90c754182d60da73 [libata] Add 460EX on-chip =
SATA driver, sata_dwc_460ex

:::::: TO: Rupjyoti Sarmah <rsarmah@amcc.com>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4494362538569252532==--

