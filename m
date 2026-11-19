Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057931;
	b=Q9VqWkHRsMINO0gzG2bfeAOuCg82Q3Kg+QEy3wFC6NHfhsnx3NsOBCVh75q02yj/tk9e
	 I5nYPVip/EdCkowh80FnVy7KRqUvW+yIBqN6DG+REK9pPN7Nwm0XKKPYlDRzAvGTJ7zKU
	 rqpK2HbGn4qcG5KYMI92UjlS15HVxis6sC8qluygKkTC0Z53CTPAiH8iWXiHlpizl2lPj
	 +32QfCuA9ZYpzKPkWp9q1FLgja+uQi7/FfVEUNPgA4cv9sqtYuj8IueOFb/I2omMFjopQ
	 kyXjk/rh4zSk86jw/fbrZYT14T5ttilruBe4wu7cAbJaufJbp7Uhtvk9ClQRb8N7l3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057931;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+msONQK+FIotKQbcp+5c4ACD39IaScwBArd9wTVGrkk=;
	b=HRmm1lFbmMKBcn4SYOIKB7ol39vf5ky9eZEqQADI5ExEgB7NJQdak6iXBhc6TzeBgXqD
	 rU8+uINgdO64Xe4kDudJG1fkM67S/QQpxkoqkFITDY8TP41Qw8/NIEMBfIhFDGUvNkWV8
	 WcbJwBZnRSl0Rmvu1oZRYWfniJaaXBotPfIdPWrf+7iGmLkVKYMntSIamHt6Bl0X6b898
	 EeLDcMaLPhtFvaNs5BkvuureH+xzZMaxZlFZEowaRzSeuhBy7jcrV09nLK/kikq633T9f
	 OR0jTD1nGNVz5s66NCl7ouZLxotWtyW23fplcU3SN9cgXc/TawNqwCcwqbF5ZcIFfww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=deCsmzUw;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755C0606A330
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 03:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 755C0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=deCsmzUw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795057930; x=1826593930;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OQ0drdubYAt5QbZ/lZnKTwEYMR4OIpi4i8zeF4MR5QU=;
  b=deCsmzUwMsXc2wYah5nE9TERn3jEG4ivIy94JzgMUpG35lZud2nsnMAF
   OA3RAlZqN79iaIySCJROW0lxYn7XFohJIv3330RraJhgj7gYwx7K7SDjC
   d7V7o8/VxdYZWIKvVL27dLdII8/a8he+mbkO5RHMFlLL++UfNbGpDYtKN
   KozBoy7O6x3TDtVUT/nmD2Nl207SKVGKX9tc3/v5DzoZ1ecilhn5Bg+E+
   2VWG4wNdtd2RyzmDCiEKqu0idE3Si5k7R/flGvRCFi/+R3xvX3khUpYlA
   VPYBmz6tNmLWtG2XBXOWF2IR5pepBEstmozm3TT+xKc0gX+UbuakGKjox
   Q==;
X-CSE-ConnectionGUID: 6nfXbxvbQ3miNvCBtSxwHQ==
X-CSE-MsgGUID: ekcunowhR6qyVwULd+HBYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3818821"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3818821"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 19:12:10 -0800
X-CSE-ConnectionGUID: yQCt1ndLSxiEdGNdDTRT7g==
X-CSE-MsgGUID: oQVzcP99SJKp3WFGtBXGvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10882023"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2026 19:12:09 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTsZB-000000003bv-46p9;
	Thu, 19 Nov 2026 03:12:05 +0000
Date: Thu, 19 Nov 2026 04:11:56 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 272/460]
 drivers/hwmon/adcxx.c:49:47: sparse: sparse: incorrect type in initializer
 (different modifiers)
Message-ID: <20261119040629.WdWULxhO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/bvanassche/linux thread-safety
head:   754c0efaaee1c85b67fd7f8a45f7be89900b661f
commit: b92d6bdb8a97a9e35c1baf80d282833e714e75de [272/460] spi: Convert to_=
spi_device() into an inline function
config: i386-randconfig-2301-20261118 (https://download.01.org/0day-ci/arch=
ive/20261119/20261119040629.WdWULxhO-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261119/20261119040629.WdWULxhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119040629.WdWULxhO-lkp=
@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hwmon/adcxx.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/hwmon/adcxx.c:49:47: sparse: sparse: incorrect type in initializ=
er (different modifiers) @@     expected struct spi_device *spi @@     got =
struct spi_device const * @@
   drivers/hwmon/adcxx.c:49:47: sparse:     expected struct spi_device *spi
   drivers/hwmon/adcxx.c:49:47: sparse:     got struct spi_device const *
   drivers/hwmon/adcxx.c:93:47: sparse: sparse: incorrect type in initializ=
er (different modifiers) @@     expected struct spi_device *spi @@     got =
struct spi_device const * @@
   drivers/hwmon/adcxx.c:93:47: sparse:     expected struct spi_device *spi
   drivers/hwmon/adcxx.c:93:47: sparse:     got struct spi_device const *
   drivers/hwmon/adcxx.c:111:47: sparse: sparse: incorrect type in initiali=
zer (different modifiers) @@     expected struct spi_device *spi @@     got=
 struct spi_device const * @@
   drivers/hwmon/adcxx.c:111:47: sparse:     expected struct spi_device *spi
   drivers/hwmon/adcxx.c:111:47: sparse:     got struct spi_device const *
--
   drivers/mfd/ocelot-spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/mfd/ocelot-spi.c:150:13: sparse: sparse: incorrect type in assig=
nment (different modifiers) @@     expected struct spi_device *spi @@     g=
ot struct spi_device const * @@
   drivers/mfd/ocelot-spi.c:150:13: sparse:     expected struct spi_device =
*spi
   drivers/mfd/ocelot-spi.c:150:13: sparse:     got struct spi_device const=
 *
>> drivers/mfd/ocelot-spi.c:173:47: sparse: sparse: incorrect type in initi=
alizer (different modifiers) @@     expected struct spi_device *spi @@     =
got struct spi_device const * @@
   drivers/mfd/ocelot-spi.c:173:47: sparse:     expected struct spi_device =
*spi
   drivers/mfd/ocelot-spi.c:173:47: sparse:     got struct spi_device const=
 *
--
   drivers/mfd/mc13xxx-spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/mfd/mc13xxx-spi.c:65:47: sparse: sparse: incorrect type in initi=
alizer (different modifiers) @@     expected struct spi_device *spi @@     =
got struct spi_device const * @@
   drivers/mfd/mc13xxx-spi.c:65:47: sparse:     expected struct spi_device =
*spi
   drivers/mfd/mc13xxx-spi.c:65:47: sparse:     got struct spi_device const=
 *
   drivers/mfd/mc13xxx-spi.c:90:47: sparse: sparse: incorrect type in initi=
alizer (different modifiers) @@     expected struct spi_device *spi @@     =
got struct spi_device const * @@
   drivers/mfd/mc13xxx-spi.c:90:47: sparse:     expected struct spi_device =
*spi
   drivers/mfd/mc13xxx-spi.c:90:47: sparse:     got struct spi_device const=
 *
--
   drivers/gpio/gpio-max3191x.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/gpio/gpio-max3191x.c:114:47: sparse: sparse: incorrect type in i=
nitializer (different modifiers) @@     expected struct spi_device *spi @@ =
    got struct spi_device const * @@
   drivers/gpio/gpio-max3191x.c:114:47: sparse:     expected struct spi_dev=
ice *spi
   drivers/gpio/gpio-max3191x.c:114:47: sparse:     got struct spi_device c=
onst *
--
   drivers/usb/host/max3421-hcd.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/usb/host/max3421-hcd.c:344:47: sparse: sparse: incorrect type in=
 initializer (different modifiers) @@     expected struct spi_device *spi @=
@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:344:47: sparse:     expected struct spi_d=
evice *spi
   drivers/usb/host/max3421-hcd.c:344:47: sparse:     got struct spi_device=
 const *
   drivers/usb/host/max3421-hcd.c:369:47: sparse: sparse: incorrect type in=
 initializer (different modifiers) @@     expected struct spi_device *spi @=
@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:369:47: sparse:     expected struct spi_d=
evice *spi
   drivers/usb/host/max3421-hcd.c:369:47: sparse:     got struct spi_device=
 const *
   drivers/usb/host/max3421-hcd.c:393:47: sparse: sparse: incorrect type in=
 initializer (different modifiers) @@     expected struct spi_device *spi @=
@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:393:47: sparse:     expected struct spi_d=
evice *spi
   drivers/usb/host/max3421-hcd.c:393:47: sparse:     got struct spi_device=
 const *
   drivers/usb/host/max3421-hcd.c:419:47: sparse: sparse: incorrect type in=
 initializer (different modifiers) @@     expected struct spi_device *spi @=
@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:419:47: sparse:     expected struct spi_d=
evice *spi
   drivers/usb/host/max3421-hcd.c:419:47: sparse:     got struct spi_device=
 const *
   drivers/usb/host/max3421-hcd.c:525:47: sparse: sparse: incorrect type in=
 initializer (different modifiers) @@     expected struct spi_device *spi @=
@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:525:47: sparse:     expected struct spi_d=
evice *spi
   drivers/usb/host/max3421-hcd.c:525:47: sparse:     got struct spi_device=
 const *
   drivers/usb/host/max3421-hcd.c:631:47: sparse: sparse: incorrect type in=
 initializer (different modifiers) @@     expected struct spi_device *spi @=
@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:631:47: sparse:     expected struct spi_d=
evice *spi
   drivers/usb/host/max3421-hcd.c:631:47: sparse:     got struct spi_device=
 const *
   drivers/usb/host/max3421-hcd.c:766:47: sparse: sparse: incorrect type in=
 initializer (different modifiers) @@     expected struct spi_device *spi @=
@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:766:47: sparse:     expected struct spi_d=
evice *spi
   drivers/usb/host/max3421-hcd.c:766:47: sparse:     got struct spi_device=
 const *
   drivers/usb/host/max3421-hcd.c:852:47: sparse: sparse: incorrect type in=
 initializer (different modifiers) @@     expected struct spi_device *spi @=
@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:852:47: sparse:     expected struct spi_d=
evice *spi
   drivers/usb/host/max3421-hcd.c:852:47: sparse:     got struct spi_device=
 const *
   drivers/usb/host/max3421-hcd.c:941:47: sparse: sparse: incorrect type in=
 initializer (different modifiers) @@     expected struct spi_device *spi @=
@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:941:47: sparse:     expected struct spi_d=
evice *spi
   drivers/usb/host/max3421-hcd.c:941:47: sparse:     got struct spi_device=
 const *
   drivers/usb/host/max3421-hcd.c:1136:47: sparse: sparse: incorrect type i=
n initializer (different modifiers) @@     expected struct spi_device *spi =
@@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:1136:47: sparse:     expected struct spi_=
device *spi
   drivers/usb/host/max3421-hcd.c:1136:47: sparse:     got struct spi_devic=
e const *
   drivers/usb/host/max3421-hcd.c:1285:47: sparse: sparse: incorrect type i=
n initializer (different modifiers) @@     expected struct spi_device *spi =
@@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:1285:47: sparse:     expected struct spi_=
device *spi
   drivers/usb/host/max3421-hcd.c:1285:47: sparse:     got struct spi_devic=
e const *
   drivers/usb/host/max3421-hcd.c:1374:47: sparse: sparse: incorrect type i=
n initializer (different modifiers) @@     expected struct spi_device *spi =
@@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:1374:47: sparse:     expected struct spi_=
device *spi
   drivers/usb/host/max3421-hcd.c:1374:47: sparse:     got struct spi_devic=
e const *
   drivers/usb/host/max3421-hcd.c:1501:47: sparse: sparse: incorrect type i=
n initializer (different modifiers) @@     expected struct spi_device *spi =
@@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:1501:47: sparse:     expected struct spi_=
device *spi
   drivers/usb/host/max3421-hcd.c:1501:47: sparse:     got struct spi_devic=
e const *
   drivers/usb/host/max3421-hcd.c:1674:47: sparse: sparse: incorrect type i=
n initializer (different modifiers) @@     expected struct spi_device *spi =
@@     got struct spi_device const * @@
   drivers/usb/host/max3421-hcd.c:1674:47: sparse:     expected struct spi_=
device *spi
   drivers/usb/host/max3421-hcd.c:1674:47: sparse:     got struct spi_devic=
e const *
--
   drivers/mtd/spi-nor/sysfs.c: note: in included file (through include/lin=
ux/spi/spi-mem.h, include/linux/mtd/spi-nor.h):
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/mtd/spi-nor/sysfs.c:13:47: sparse: sparse: incorrect type in ini=
tializer (different modifiers) @@     expected struct spi_device *spi @@   =
  got struct spi_device const * @@
   drivers/mtd/spi-nor/sysfs.c:13:47: sparse:     expected struct spi_devic=
e *spi
   drivers/mtd/spi-nor/sysfs.c:13:47: sparse:     got struct spi_device con=
st *
   drivers/mtd/spi-nor/sysfs.c:24:47: sparse: sparse: incorrect type in ini=
tializer (different modifiers) @@     expected struct spi_device *spi @@   =
  got struct spi_device const * @@
   drivers/mtd/spi-nor/sysfs.c:24:47: sparse:     expected struct spi_devic=
e *spi
   drivers/mtd/spi-nor/sysfs.c:24:47: sparse:     got struct spi_device con=
st *
   drivers/mtd/spi-nor/sysfs.c:35:47: sparse: sparse: incorrect type in ini=
tializer (different modifiers) @@     expected struct spi_device *spi @@   =
  got struct spi_device const * @@
   drivers/mtd/spi-nor/sysfs.c:35:47: sparse:     expected struct spi_devic=
e *spi
   drivers/mtd/spi-nor/sysfs.c:35:47: sparse:     got struct spi_device con=
st *
   drivers/mtd/spi-nor/sysfs.c:56:47: sparse: sparse: incorrect type in ini=
tializer (different modifiers) @@     expected struct spi_device *spi @@   =
  got struct spi_device const * @@
   drivers/mtd/spi-nor/sysfs.c:56:47: sparse:     expected struct spi_devic=
e *spi
   drivers/mtd/spi-nor/sysfs.c:56:47: sparse:     got struct spi_device con=
st *
   drivers/mtd/spi-nor/sysfs.c:75:47: sparse: sparse: incorrect type in ini=
tializer (different modifiers) @@     expected struct spi_device *spi @@   =
  got struct spi_device const * @@
   drivers/mtd/spi-nor/sysfs.c:75:47: sparse:     expected struct spi_devic=
e *spi
   drivers/mtd/spi-nor/sysfs.c:75:47: sparse:     got struct spi_device con=
st *
   drivers/mtd/spi-nor/sysfs.c:92:47: sparse: sparse: incorrect type in ini=
tializer (different modifiers) @@     expected struct spi_device *spi @@   =
  got struct spi_device const * @@
   drivers/mtd/spi-nor/sysfs.c:92:47: sparse:     expected struct spi_devic=
e *spi
   drivers/mtd/spi-nor/sysfs.c:92:47: sparse:     got struct spi_device con=
st *

vim +49 drivers/hwmon/adcxx.c

d42139a3fbd979 Marc Pignat           2008-08-15  44 =20
d42139a3fbd979 Marc Pignat           2008-08-15  45  /* sysfs hook function=
 */
b0c130fdaac18b Guenter Roeck         2018-12-10  46  static ssize_t adcxx_s=
how(struct device *dev,
d42139a3fbd979 Marc Pignat           2008-08-15  47  			  struct device_att=
ribute *devattr, char *buf)
d42139a3fbd979 Marc Pignat           2008-08-15  48  {
d42139a3fbd979 Marc Pignat           2008-08-15 @49  	struct spi_device *sp=
i =3D to_spi_device(dev);
d42139a3fbd979 Marc Pignat           2008-08-15  50  	struct sensor_device_=
attribute *attr =3D to_sensor_dev_attr(devattr);
95de3b257516d2 Jean Delvare          2011-05-25  51  	struct adcxx *adc =3D =
spi_get_drvdata(spi);
5748150eabdacd Jos=C3=A9 Miguel Gon=C3=A7alves 2010-03-05  52  	u8 tx_buf[2=
];
d42139a3fbd979 Marc Pignat           2008-08-15  53  	u8 rx_buf[2];
d42139a3fbd979 Marc Pignat           2008-08-15  54  	int status;
5748150eabdacd Jos=C3=A9 Miguel Gon=C3=A7alves 2010-03-05  55  	u32 value;
d42139a3fbd979 Marc Pignat           2008-08-15  56 =20
d42139a3fbd979 Marc Pignat           2008-08-15  57  	if (mutex_lock_interr=
uptible(&adc->lock))
d42139a3fbd979 Marc Pignat           2008-08-15  58  		return -ERESTARTSYS;
d42139a3fbd979 Marc Pignat           2008-08-15  59 =20
5748150eabdacd Jos=C3=A9 Miguel Gon=C3=A7alves 2010-03-05  60  	if (adc->ch=
annels =3D=3D 1) {
5748150eabdacd Jos=C3=A9 Miguel Gon=C3=A7alves 2010-03-05  61  		status =3D =
spi_read(spi, rx_buf, sizeof(rx_buf));
5748150eabdacd Jos=C3=A9 Miguel Gon=C3=A7alves 2010-03-05  62  	} else {
5748150eabdacd Jos=C3=A9 Miguel Gon=C3=A7alves 2010-03-05  63  		tx_buf[0] =
=3D attr->index << 3; /* other bits are don't care */
d42139a3fbd979 Marc Pignat           2008-08-15  64  		status =3D spi_write=
_then_read(spi, tx_buf, sizeof(tx_buf),
d42139a3fbd979 Marc Pignat           2008-08-15  65  						rx_buf, sizeof(r=
x_buf));
5748150eabdacd Jos=C3=A9 Miguel Gon=C3=A7alves 2010-03-05  66  	}
d42139a3fbd979 Marc Pignat           2008-08-15  67  	if (status < 0) {
5748150eabdacd Jos=C3=A9 Miguel Gon=C3=A7alves 2010-03-05  68  		dev_warn(d=
ev, "SPI synch. transfer failed with status %d\n",
d42139a3fbd979 Marc Pignat           2008-08-15  69  				status);
d42139a3fbd979 Marc Pignat           2008-08-15  70  		goto out;
d42139a3fbd979 Marc Pignat           2008-08-15  71  	}
d42139a3fbd979 Marc Pignat           2008-08-15  72 =20
d42139a3fbd979 Marc Pignat           2008-08-15  73  	value =3D (rx_buf[0] =
<< 8) + rx_buf[1];
d42139a3fbd979 Marc Pignat           2008-08-15  74  	dev_dbg(dev, "raw val=
ue =3D 0x%x\n", value);
d42139a3fbd979 Marc Pignat           2008-08-15  75 =20
d42139a3fbd979 Marc Pignat           2008-08-15  76  	value =3D value * adc=
->reference >> 12;
d42139a3fbd979 Marc Pignat           2008-08-15  77  	status =3D sprintf(bu=
f, "%d\n", value);
d42139a3fbd979 Marc Pignat           2008-08-15  78  out:
d42139a3fbd979 Marc Pignat           2008-08-15  79  	mutex_unlock(&adc->lo=
ck);
d42139a3fbd979 Marc Pignat           2008-08-15  80  	return status;
d42139a3fbd979 Marc Pignat           2008-08-15  81  }
d42139a3fbd979 Marc Pignat           2008-08-15  82 =20

:::::: The code at line 49 was first introduced by commit
:::::: d42139a3fbd9793cf3747287e8f5c1ae06e06942 hwmon: ADC124S501 generic d=
river

:::::: TO: Marc Pignat <marc.pignat@hevs.ch>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
