Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECCB242D89
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 06:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935983; cv=none; b=U/Y13e0QH2aaJCkJWGTvEqcqyka4dZE7Y/2kf+HA0mkDjAAWoQ7TGJZ/fGINiseXiJZJu2/6N1Kl7/9HAgSsikKgk6BijspEu/iw8P9nMvvibfaW5LhpU1An0gr9HmwvkKl94rQHwYlG+IKwwd9xoErEImz1vrVWi+bf2RIKr8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935983; c=relaxed/simple;
	bh=bazeK9p1rDxJdDz4/OUb0yRWHyxnVJ4q66ypzwNtnAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jVhov49R+nJ9QXjnWtJpQ0l1NP95SVMTkboZ6vWyDiytJw+/5IP3dEGMa6CnRO8pIe6mAwmOlyIoDQd7gR5F+p82c/Xruu4L8PSDfRiYsxb5ujy6q3NISe2RlDvsQDkOm/MWsh0QvKYngMZUWOPrda4zfJUA9Txth6+yxEPG6Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJxWiBpP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJxWiBpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788935980; x=1820471980;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bazeK9p1rDxJdDz4/OUb0yRWHyxnVJ4q66ypzwNtnAE=;
  b=nJxWiBpP5VPMlUmFSoB0ufnjjwsRMkXiGpWC+Jd/5rkthHtVi/UmX85X
   FGbZ1NIK9KFt8OMlC16AnXVD/69wUkowMpXSWnW8S1wJ9PywgLGgoCTQM
   573LnLPsC6fH0HE3qcw7OKrAg+enz96VWX04m0DKSA9oWgjMD1y3148tF
   EPksV3473E9jZr57hf8H19fued4izKLSTt1IMcD06c15aJAiXAn6TyGYT
   A2Qxt76lt81PpMy6jGkkvxUhs/iq5iSriBPXfdXP7cn4suwQkaj92HlYq
   SPLatEOftMeZhTle5dmxIqnwPQLsbGBqZQXk98BN1AWG2slskptfFpYDa
   w==;
X-CSE-ConnectionGUID: prAdd0WBRqysbavhvrMJlA==
X-CSE-MsgGUID: RyuG7mFxRrGlhVBJ9qcXiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99680777"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="99680777"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 23:39:39 -0700
X-CSE-ConnectionGUID: dtUoeBGvRk2jX+MQbRHLeA==
X-CSE-MsgGUID: J0FRd/PVSJyvclmlYV/u5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="271719386"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 Sep 2026 23:39:37 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4By3-000000001IL-2omy;
	Wed, 09 Sep 2026 06:39:35 +0000
Date: Wed, 09 Sep 2026 08:39:22 +0200
From: kernel test robot <lkp@intel.com>
To: Abhin Parekadan Jose <abhinjoses@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/misc/edu_srpoc.c:68:14: error: implicit declaration
 of function 'pci_test_and_clear_disconnect_enable'
Message-ID: <202609090802.xwkQ0OBv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel-lab-lkp/linux/commits/Abhin-Parekadan-Jose=
/PCI-Report-surprise-removal-event/20260905-183858
head:   f51e8b77fe2127c01876734cd72ff3d28f589793
commit: f51e8b77fe2127c01876734cd72ff3d28f589793 misc: Add edu_srpoc surpri=
se removal POC driver
date:   3 days ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260909/2=
02609090802.xwkQ0OBv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260909/202609090802.xwkQ0OBv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609090802.xwkQ0OBv-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

   drivers/misc/edu_srpoc.c: In function 'edu_disconnect':
>> drivers/misc/edu_srpoc.c:68:14: error: implicit declaration of function =
'pci_test_and_clear_disconnect_enable' [-Wimplicit-function-declaration]
      68 |         if (!pci_test_and_clear_disconnect_enable(pdev))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/edu_srpoc.c: In function 'edu_probe':
>> drivers/misc/edu_srpoc.c:98:21: error: implicit declaration of function =
'pci_iomap'; did you mean 'pcim_iomap'? [-Wimplicit-function-declaration]
      98 |         edu->regs =3D pci_iomap(pdev, 0, 0);
         |                     ^~~~~~~~~
         |                     pcim_iomap
>> drivers/misc/edu_srpoc.c:98:19: error: assignment to 'void *' from 'int'=
 makes pointer from integer without a cast [-Wint-conversion]
      98 |         edu->regs =3D pci_iomap(pdev, 0, 0);
         |                   ^
>> drivers/misc/edu_srpoc.c:118:9: error: implicit declaration of function =
'pci_set_disconnect_work' [-Wimplicit-function-declaration]
     118 |         pci_set_disconnect_work(pdev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sh/include/asm/hardirq.h:9,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:39,
                    from drivers/misc/edu_srpoc.c:20:
>> arch/sh/include/asm/io.h:122:21: error: implicit declaration of function=
 'pci_iounmap'; did you mean 'pcim_iounmap'? [-Wimplicit-function-declarati=
on]
     122 | #define pci_iounmap pci_iounmap
         |                     ^~~~~~~~~~~
   drivers/misc/edu_srpoc.c:126:9: note: in expansion of macro 'pci_iounmap'
     126 |         pci_iounmap(pdev, edu->regs);
         |         ^~~~~~~~~~~
   drivers/misc/edu_srpoc.c: In function 'edu_remove':
>> drivers/misc/edu_srpoc.c:145:9: error: implicit declaration of function =
'pci_clear_disconnect_work' [-Wimplicit-function-declaration]
     145 |         pci_clear_disconnect_work(pdev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/edu_srpoc.c: At top level:
>> drivers/misc/edu_srpoc.c:166:1: warning: data definition has no type or =
storage class
     166 | module_pci_driver(edu_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/misc/edu_srpoc.c:166:1: error: type defaults to 'int' in declara=
tion of 'module_pci_driver' [-Wimplicit-int]
>> drivers/misc/edu_srpoc.c:166:1: error: parameter names (without types) i=
n function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/misc/edu_srpoc.c:159:26: warning: 'edu_driver' defined but not u=
sed [-Wunused-variable]
     159 | static struct pci_driver edu_driver =3D {
         |                          ^~~~~~~~~~


vim +/pci_test_and_clear_disconnect_enable +68 drivers/misc/edu_srpoc.c

  > 20	#include <linux/pci.h>
    21	#include <linux/interrupt.h>
    22	#include <linux/completion.h>
    23	#include <linux/delay.h>
    24=09
    25	#define PCI_VENDOR_ID_EDU	0x1234
    26	#define PCI_DEVICE_ID_EDU	0x11e8
    27=09
    28	#define EDU_REG_FACT		0x08
    29	#define EDU_REG_STATUS		0x20
    30	#define EDU_REG_DELAYED_IRQ	0x30
    31	#define EDU_REG_IRQ_STATUS	0x24
    32	#define EDU_REG_IRQ_LOWER	0x64
    33=09
    34	#define EDU_STATUS_IRQFACT	0x80
    35	#define EDU_FACT_IRQ		BIT(0)
    36	#define EDU_DELAY_IRQ		BIT(9)
    37=09
    38	struct edu_dev {
    39		struct pci_dev		*pdev;
    40		void __iomem		*regs;
    41		struct completion	irq_done;
    42	};
    43=09
    44	static irqreturn_t edu_irq_handler(int irq, void *data)
    45	{
    46		struct edu_dev *edu =3D data;
    47		u32 status;
    48=09
    49		status =3D ioread32(edu->regs + EDU_REG_IRQ_STATUS);
    50		if (!status)
    51			return IRQ_NONE;
    52=09
    53		iowrite32(status, edu->regs + EDU_REG_IRQ_LOWER);
    54=09
    55		if (status & (EDU_FACT_IRQ | EDU_DELAY_IRQ)) {
    56			complete(&edu->irq_done);
    57		}
    58=09
    59		return IRQ_HANDLED;
    60	}
    61=09
    62	static void edu_disconnect(struct work_struct *work)
    63	{
    64		struct pci_dev *pdev =3D container_of(work, struct pci_dev,
    65						    disconnect_work);
    66		struct edu_dev *edu =3D pci_get_drvdata(pdev);
    67=09
  > 68		if (!pci_test_and_clear_disconnect_enable(pdev))
    69			return;
    70=09
    71		if (!edu)
    72			return;
    73=09
    74		dev_info(&pdev->dev, "disconnect_work fired =E2=80=94 unblocking re=
move()\n");
    75		complete(&edu->irq_done);
    76	}
    77=09
    78	static int edu_probe(struct pci_dev *pdev, const struct pci_device_i=
d *id)
    79	{
    80		struct edu_dev *edu;
    81		int err;
    82=09
    83		edu =3D devm_kzalloc(&pdev->dev, sizeof(*edu), GFP_KERNEL);
    84		if (!edu)
    85			return -ENOMEM;
    86=09
    87		edu->pdev =3D pdev;
    88		init_completion(&edu->irq_done);
    89=09
    90		err =3D pci_enable_device(pdev);
    91		if (err)
    92			return err;
    93=09
    94		err =3D pci_request_regions(pdev, "edu_srpoc");
    95		if (err)
    96			goto err_disable;
    97=09
  > 98		edu->regs =3D pci_iomap(pdev, 0, 0);
    99		if (!edu->regs) {
   100			err =3D -ENOMEM;
   101			goto err_release;
   102		}
   103=09
   104		pci_set_master(pdev);
   105=09
   106		err =3D pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_INT=
X);
   107		if (err < 0)
   108			goto err_iounmap;
   109=09
   110		err =3D request_irq(pci_irq_vector(pdev, 0), edu_irq_handler,
   111				  IRQF_SHARED, "edu_srpoc", edu);
   112		if (err)
   113			goto err_free_vectors;
   114=09
   115		pci_set_drvdata(pdev, edu);
   116=09
   117		INIT_WORK(&pdev->disconnect_work, edu_disconnect);
 > 118		pci_set_disconnect_work(pdev);
   119=09
   120		dev_info(&pdev->dev, "edu_srpoc probed\n");
   121		return 0;
   122=09
   123	err_free_vectors:
   124		pci_free_irq_vectors(pdev);
   125	err_iounmap:
 > 126		pci_iounmap(pdev, edu->regs);
   127	err_release:
   128		pci_release_regions(pdev);
   129	err_disable:
   130		pci_disable_device(pdev);
   131		return err;
   132	}
   133=09
   134	static void edu_remove(struct pci_dev *pdev)
   135	{
   136		struct edu_dev *edu =3D pci_get_drvdata(pdev);
   137=09
   138		iowrite32(EDU_STATUS_IRQFACT, edu->regs + EDU_REG_STATUS);
   139		iowrite32(600000, edu->regs + EDU_REG_DELAYED_IRQ);
   140=09
   141		dev_info(&pdev->dev, "Waiting for IRQ in remove()\n");
   142		wait_for_completion(&edu->irq_done);
   143		dev_info(&pdev->dev, "Unblocked, cleaning up\n");
   144=09
 > 145		pci_clear_disconnect_work(pdev);
   146		free_irq(pci_irq_vector(pdev, 0), edu);
   147		pci_free_irq_vectors(pdev);
   148		pci_iounmap(pdev, edu->regs);
   149		pci_release_regions(pdev);
   150		pci_disable_device(pdev);
   151	}
   152=09
   153	static const struct pci_device_id edu_ids[] =3D {
   154		{ PCI_DEVICE(PCI_VENDOR_ID_EDU, PCI_DEVICE_ID_EDU) },
   155		{ 0 }
   156	};
   157	MODULE_DEVICE_TABLE(pci, edu_ids);
   158=09
 > 159	static struct pci_driver edu_driver =3D {
   160		.name		=3D "edu_srpoc",
   161		.id_table	=3D edu_ids,
   162		.probe		=3D edu_probe,
   163		.remove		=3D edu_remove,
   164	};
   165=09
 > 166	module_pci_driver(edu_driver);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
