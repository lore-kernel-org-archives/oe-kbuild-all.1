Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D9C4156DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 18:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784054079; cv=none; b=ssSPETSllbJUl7p3DubsmFnnUFud0jeNmtdyx0UtwWhu8uFvWNpnOImIobRm9+nOTqffVmOyPyhDpI/KOjY4pcSn1Z2v/wpqVb0xZd/EuGiMQSwnW8e6rlCqC+V85yPqjqS4cGErXIR28BJIqM0sB/kAGcs5wH1by8Ruq1uxPKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784054079; c=relaxed/simple;
	bh=E9M//4icCcffa9NDiqGvybvV0bspYNaUMd/XwPOZO24=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EWMqIjPJ+QpCBt8xQVzFoWIW342yyNb/kpb8/eWITqKkakG6zkmNqLB+ZE3mBz74WSngVqa3lWBxs3Nf4kpMrlpsVS1iFdg2F7A3+utFBxXF+NxpraWymmMqU3BkZ4ZNxvYLRlDCq80nsEewyV6V6Moc39zavw/zBvqEkszWWOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6OPrM7s; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6OPrM7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784054076; x=1815590076;
  h=date:from:to:cc:subject:message-id;
  bh=E9M//4icCcffa9NDiqGvybvV0bspYNaUMd/XwPOZO24=;
  b=W6OPrM7sNIRLNecP31ERPvNmCJZSKfP13/LUZR6vxxIX2KJ+B8PKMU3/
   BDUiXIXRy2Vt7uDJlPFtqoX2u4n93NzytNrB9rw3yGzDGJg/Ty0+nuMBV
   IhyRSTVpI6ypA12o0mbafvQdEs50RbtFPw4gpnyfqEfvvyYgnHWZLgClD
   yPNoksEv8+moyypxJOC4Ssy+4ELGJ0Sptz0O83i8V0xWn0UuDNuH4+lQE
   V/9v5BSa9yk0zyBaGeTWB4BqBw1k59U7KdhMEWKsdPdLvr8NTmtOS4d/0
   tN6+6aSNYEjr8Xbe8qnhleZaCS9dmq64c5Iixn6gbw4qvqxFDrLe718WK
   Q==;
X-CSE-ConnectionGUID: V/qPtwuAThWvwoEDCIO1nw==
X-CSE-MsgGUID: XwzQNHZGQRyWI+kv8vgqVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="87228538"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="87228538"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 11:34:35 -0700
X-CSE-ConnectionGUID: exUU/MVERGa3Q3acdBVHdw==
X-CSE-MsgGUID: TvoF3WJLQ6qb0vpFpTt8iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="254812066"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 14 Jul 2026 11:34:34 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjhxf-0000000043V-22hy;
	Tue, 14 Jul 2026 18:34:31 +0000
Date: Tue, 14 Jul 2026 20:34:18 +0200
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/net/usb/r8153_ecm.c:102:undefined reference to
 `usbnet_cdc_bind'
Message-ID: <202607142015.IPv6BEAU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/net-usb-centralize-usbnet_cdc_zte_rx_fixup-in-usbnet/20260714-200029
head:   01c24668a6e35556ec573ceb5a3b709515946bc4
commit: fb17c1fe5a30a284abcb7bebbdd178d3dddc5f8d net: usb: remove dependencies on cdc_ether
date:   6 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260714/202607142015.IPv6BEAU-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142015.IPv6BEAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142015.IPv6BEAU-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o: in function `r8153_bind':
>> drivers/net/usb/r8153_ecm.c:102:(.text+0x22): undefined reference to `usbnet_cdc_bind'
   s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o: in function `pla_write_word':
>> drivers/net/usb/r8153_ecm.c:55:(.text+0x17e): undefined reference to `usbnet_read_cmd'
>> s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.c:64:(.text+0x1c2): undefined reference to `usbnet_write_cmd'
   s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o: in function `pla_read_word':
   drivers/net/usb/r8153_ecm.c:24:(.text+0x2d6): undefined reference to `usbnet_read_cmd'
   s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o: in function `rtl8153_ecm_probe':
>> drivers/net/usb/r8153_ecm.c:157:(.text+0x348): undefined reference to `usbnet_probe'
   s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o: in function `pla_write_word':
   drivers/net/usb/r8153_ecm.c:55:(.text+0x420): undefined reference to `usbnet_read_cmd'
   s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.c:64:(.text+0x452): undefined reference to `usbnet_write_cmd'
>> s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.data.rel+0x10): undefined reference to `usbnet_disconnect'
>> s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.data.rel+0x20): undefined reference to `usbnet_suspend'
>> s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.data.rel+0x28): undefined reference to `usbnet_resume'
   s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.data.rel+0x30): undefined reference to `usbnet_resume'
>> s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.data.rel.ro+0x18): undefined reference to `usbnet_cdc_unbind'
>> s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.data.rel.ro+0x38): undefined reference to `usbnet_manage_power'
>> s390x-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.data.rel.ro+0x40): undefined reference to `usbnet_cdc_status'


vim +102 drivers/net/usb/r8153_ecm.c

c1aedf015ebdd0 Hayes Wang      2020-11-04   36  
c1aedf015ebdd0 Hayes Wang      2020-11-04   37  static int pla_write_word(struct usbnet *dev, u16 index, u32 data)
c1aedf015ebdd0 Hayes Wang      2020-11-04   38  {
c1aedf015ebdd0 Hayes Wang      2020-11-04   39  	u32 mask = 0xffff;
c1aedf015ebdd0 Hayes Wang      2020-11-04   40  	u16 byen = BYTE_EN_WORD;
c1aedf015ebdd0 Hayes Wang      2020-11-04   41  	u8 shift = index & 2;
c1aedf015ebdd0 Hayes Wang      2020-11-04   42  	__le32 tmp;
c1aedf015ebdd0 Hayes Wang      2020-11-04   43  	int ret;
c1aedf015ebdd0 Hayes Wang      2020-11-04   44  
c1aedf015ebdd0 Hayes Wang      2020-11-04   45  	data &= mask;
c1aedf015ebdd0 Hayes Wang      2020-11-04   46  
c1aedf015ebdd0 Hayes Wang      2020-11-04   47  	if (shift) {
c1aedf015ebdd0 Hayes Wang      2020-11-04   48  		byen <<= shift;
c1aedf015ebdd0 Hayes Wang      2020-11-04   49  		mask <<= (shift * 8);
c1aedf015ebdd0 Hayes Wang      2020-11-04   50  		data <<= (shift * 8);
c1aedf015ebdd0 Hayes Wang      2020-11-04   51  	}
c1aedf015ebdd0 Hayes Wang      2020-11-04   52  
c1aedf015ebdd0 Hayes Wang      2020-11-04   53  	index &= ~3;
c1aedf015ebdd0 Hayes Wang      2020-11-04   54  
c1aedf015ebdd0 Hayes Wang      2020-11-04  @55  	ret = usbnet_read_cmd(dev, RTL8152_REQ_GET_REGS, RTL8152_REQT_READ, index,
c1aedf015ebdd0 Hayes Wang      2020-11-04   56  			      MCU_TYPE_PLA | byen, &tmp, sizeof(tmp));
c1aedf015ebdd0 Hayes Wang      2020-11-04   57  
c1aedf015ebdd0 Hayes Wang      2020-11-04   58  	if (ret < 0)
c1aedf015ebdd0 Hayes Wang      2020-11-04   59  		goto out;
c1aedf015ebdd0 Hayes Wang      2020-11-04   60  
c1aedf015ebdd0 Hayes Wang      2020-11-04   61  	data |= __le32_to_cpu(tmp) & ~mask;
c1aedf015ebdd0 Hayes Wang      2020-11-04   62  	tmp = __cpu_to_le32(data);
c1aedf015ebdd0 Hayes Wang      2020-11-04   63  
c1aedf015ebdd0 Hayes Wang      2020-11-04  @64  	ret = usbnet_write_cmd(dev, RTL8152_REQ_SET_REGS, RTL8152_REQT_WRITE, index,
c1aedf015ebdd0 Hayes Wang      2020-11-04   65  			       MCU_TYPE_PLA | byen, &tmp, sizeof(tmp));
c1aedf015ebdd0 Hayes Wang      2020-11-04   66  
c1aedf015ebdd0 Hayes Wang      2020-11-04   67  out:
c1aedf015ebdd0 Hayes Wang      2020-11-04   68  	return ret;
c1aedf015ebdd0 Hayes Wang      2020-11-04   69  }
c1aedf015ebdd0 Hayes Wang      2020-11-04   70  
c1aedf015ebdd0 Hayes Wang      2020-11-04   71  static int r8153_ecm_mdio_read(struct net_device *netdev, int phy_id, int reg)
c1aedf015ebdd0 Hayes Wang      2020-11-04   72  {
c1aedf015ebdd0 Hayes Wang      2020-11-04   73  	struct usbnet *dev = netdev_priv(netdev);
c1aedf015ebdd0 Hayes Wang      2020-11-04   74  	int ret;
c1aedf015ebdd0 Hayes Wang      2020-11-04   75  
c1aedf015ebdd0 Hayes Wang      2020-11-04   76  	ret = pla_write_word(dev, OCP_BASE, 0xa000);
c1aedf015ebdd0 Hayes Wang      2020-11-04   77  	if (ret < 0)
c1aedf015ebdd0 Hayes Wang      2020-11-04   78  		goto out;
c1aedf015ebdd0 Hayes Wang      2020-11-04   79  
c1aedf015ebdd0 Hayes Wang      2020-11-04   80  	ret = pla_read_word(dev, 0xb400 + reg * 2);
c1aedf015ebdd0 Hayes Wang      2020-11-04   81  
c1aedf015ebdd0 Hayes Wang      2020-11-04   82  out:
c1aedf015ebdd0 Hayes Wang      2020-11-04   83  	return ret;
c1aedf015ebdd0 Hayes Wang      2020-11-04   84  }
c1aedf015ebdd0 Hayes Wang      2020-11-04   85  
c1aedf015ebdd0 Hayes Wang      2020-11-04   86  static void r8153_ecm_mdio_write(struct net_device *netdev, int phy_id, int reg, int val)
c1aedf015ebdd0 Hayes Wang      2020-11-04   87  {
c1aedf015ebdd0 Hayes Wang      2020-11-04   88  	struct usbnet *dev = netdev_priv(netdev);
c1aedf015ebdd0 Hayes Wang      2020-11-04   89  	int ret;
c1aedf015ebdd0 Hayes Wang      2020-11-04   90  
c1aedf015ebdd0 Hayes Wang      2020-11-04   91  	ret = pla_write_word(dev, OCP_BASE, 0xa000);
c1aedf015ebdd0 Hayes Wang      2020-11-04   92  	if (ret < 0)
c1aedf015ebdd0 Hayes Wang      2020-11-04   93  		return;
c1aedf015ebdd0 Hayes Wang      2020-11-04   94  
c1aedf015ebdd0 Hayes Wang      2020-11-04   95  	ret = pla_write_word(dev, 0xb400 + reg * 2, val);
c1aedf015ebdd0 Hayes Wang      2020-11-04   96  }
c1aedf015ebdd0 Hayes Wang      2020-11-04   97  
c1aedf015ebdd0 Hayes Wang      2020-11-04   98  static int r8153_bind(struct usbnet *dev, struct usb_interface *intf)
c1aedf015ebdd0 Hayes Wang      2020-11-04   99  {
c1aedf015ebdd0 Hayes Wang      2020-11-04  100  	int status;
c1aedf015ebdd0 Hayes Wang      2020-11-04  101  
c1aedf015ebdd0 Hayes Wang      2020-11-04 @102  	status = usbnet_cdc_bind(dev, intf);
c1aedf015ebdd0 Hayes Wang      2020-11-04  103  	if (status < 0)
c1aedf015ebdd0 Hayes Wang      2020-11-04  104  		return status;
c1aedf015ebdd0 Hayes Wang      2020-11-04  105  
c1aedf015ebdd0 Hayes Wang      2020-11-04  106  	dev->mii.dev = dev->net;
c1aedf015ebdd0 Hayes Wang      2020-11-04  107  	dev->mii.mdio_read = r8153_ecm_mdio_read;
c1aedf015ebdd0 Hayes Wang      2020-11-04  108  	dev->mii.mdio_write = r8153_ecm_mdio_write;
c1aedf015ebdd0 Hayes Wang      2020-11-04  109  	dev->mii.reg_num_mask = 0x1f;
c1aedf015ebdd0 Hayes Wang      2020-11-04  110  	dev->mii.supports_gmii = 1;
c1aedf015ebdd0 Hayes Wang      2020-11-04  111  
c1aedf015ebdd0 Hayes Wang      2020-11-04  112  	return status;
c1aedf015ebdd0 Hayes Wang      2020-11-04  113  }
c1aedf015ebdd0 Hayes Wang      2020-11-04  114  
c1aedf015ebdd0 Hayes Wang      2020-11-04  115  static const struct driver_info r8153_info = {
c1aedf015ebdd0 Hayes Wang      2020-11-04  116  	.description =	"RTL8153 ECM Device",
c1aedf015ebdd0 Hayes Wang      2020-11-04  117  	.flags =	FLAG_ETHER,
c1aedf015ebdd0 Hayes Wang      2020-11-04  118  	.bind =		r8153_bind,
c1aedf015ebdd0 Hayes Wang      2020-11-04  119  	.unbind =	usbnet_cdc_unbind,
c1aedf015ebdd0 Hayes Wang      2020-11-04  120  	.status =	usbnet_cdc_status,
c1aedf015ebdd0 Hayes Wang      2020-11-04  121  	.manage_power =	usbnet_manage_power,
c1aedf015ebdd0 Hayes Wang      2020-11-04  122  };
c1aedf015ebdd0 Hayes Wang      2020-11-04  123  
c1aedf015ebdd0 Hayes Wang      2020-11-04  124  static const struct usb_device_id products[] = {
2284bbd0cf3981 Leon Schuermann 2021-01-11  125  /* Realtek RTL8153 Based USB 3.0 Ethernet Adapters */
c1aedf015ebdd0 Hayes Wang      2020-11-04  126  {
c1aedf015ebdd0 Hayes Wang      2020-11-04  127  	USB_DEVICE_AND_INTERFACE_INFO(VENDOR_ID_REALTEK, 0x8153, USB_CLASS_COMM,
c1aedf015ebdd0 Hayes Wang      2020-11-04  128  				      USB_CDC_SUBCLASS_ETHERNET, USB_CDC_PROTO_NONE),
c1aedf015ebdd0 Hayes Wang      2020-11-04  129  	.driver_info = (unsigned long)&r8153_info,
c1aedf015ebdd0 Hayes Wang      2020-11-04  130  },
c1aedf015ebdd0 Hayes Wang      2020-11-04  131  
2284bbd0cf3981 Leon Schuermann 2021-01-11  132  /* Lenovo Powered USB-C Travel Hub (4X90S92381, based on Realtek RTL8153) */
2284bbd0cf3981 Leon Schuermann 2021-01-11  133  {
2284bbd0cf3981 Leon Schuermann 2021-01-11  134  	USB_DEVICE_AND_INTERFACE_INFO(VENDOR_ID_LENOVO, 0x721e, USB_CLASS_COMM,
2284bbd0cf3981 Leon Schuermann 2021-01-11  135  				      USB_CDC_SUBCLASS_ETHERNET, USB_CDC_PROTO_NONE),
2284bbd0cf3981 Leon Schuermann 2021-01-11  136  	.driver_info = (unsigned long)&r8153_info,
2284bbd0cf3981 Leon Schuermann 2021-01-11  137  },
a07f23ad9baf71 Philipp Hahn    2025-03-10  138  /* Lenovo ThinkPad Hybrid USB-C with USB-A Dock (40af0135eu, based on Realtek RTL8153) */
a07f23ad9baf71 Philipp Hahn    2025-03-10  139  {
a07f23ad9baf71 Philipp Hahn    2025-03-10  140  	USB_DEVICE_AND_INTERFACE_INFO(VENDOR_ID_LENOVO, 0xa359, USB_CLASS_COMM,
a07f23ad9baf71 Philipp Hahn    2025-03-10  141  				      USB_CDC_SUBCLASS_ETHERNET, USB_CDC_PROTO_NONE),
a07f23ad9baf71 Philipp Hahn    2025-03-10  142  	.driver_info = (unsigned long)&r8153_info,
a07f23ad9baf71 Philipp Hahn    2025-03-10  143  },
2284bbd0cf3981 Leon Schuermann 2021-01-11  144  
c1aedf015ebdd0 Hayes Wang      2020-11-04  145  	{ },		/* END */
c1aedf015ebdd0 Hayes Wang      2020-11-04  146  };
c1aedf015ebdd0 Hayes Wang      2020-11-04  147  MODULE_DEVICE_TABLE(usb, products);
c1aedf015ebdd0 Hayes Wang      2020-11-04  148  
c1aedf015ebdd0 Hayes Wang      2020-11-04  149  static int rtl8153_ecm_probe(struct usb_interface *intf,
c1aedf015ebdd0 Hayes Wang      2020-11-04  150  			     const struct usb_device_id *id)
c1aedf015ebdd0 Hayes Wang      2020-11-04  151  {
c1aedf015ebdd0 Hayes Wang      2020-11-04  152  #if IS_REACHABLE(CONFIG_USB_RTL8152)
c1aedf015ebdd0 Hayes Wang      2020-11-04  153  	if (rtl8152_get_version(intf))
c1aedf015ebdd0 Hayes Wang      2020-11-04  154  		return -ENODEV;
c1aedf015ebdd0 Hayes Wang      2020-11-04  155  #endif
c1aedf015ebdd0 Hayes Wang      2020-11-04  156  
c1aedf015ebdd0 Hayes Wang      2020-11-04 @157  	return usbnet_probe(intf, id);
c1aedf015ebdd0 Hayes Wang      2020-11-04  158  }
c1aedf015ebdd0 Hayes Wang      2020-11-04  159  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
