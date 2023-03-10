Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D276DABB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 21:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678483308; x=1710019308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=17QujGMzggy9orOEY8E4j5JEoU90kiBkzOc2sFz6GgE=;
  b=e1+n/TL2wHr78Xvj2VYx62XY1siSCahD69MTryvf9ArzgSaHLeVX7LNS
   hq6Hbrf6ktZhT2STh3Am8+1V0zmiu4DQU+ZsPGrGIxBVoZX/L/QtQ2ADX
   z3tCzE4GvRNEiRy83KvPSFn/5zz9xQvGP71CUQ2ELaDIX163zycROQWAX
   wa1yCyS/kaw95b9Fi3Rl1r7lJ0L2qHRdTfDCbHnlnFlk3EWQoP3fRfQRe
   V30ePa4TdDOjBwdTHQ5U9F9ZZCGHEqEaqpr6JRew4WgHrCPDHIlrQmybH
   otDXDsVG4aXX6FzJ/NBJnhChPz0OVov+RMQI8I+XfI4hXfmeuFckHYJrd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423097893"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="423097893"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 13:21:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="1007266871"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="1007266871"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Mar 2023 13:21:29 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pakB6-00046J-1v;
	Fri, 10 Mar 2023 21:21:28 +0000
Date: Sat, 11 Mar 2023 05:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 7/238]
 drivers/usb/gadget/function/f_accessory.c:1078:5: warning: no previous
 prototype for function 'acc_ctrlrequest_composite'
Message-ID: <202303110546.pUEFbs7k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   830ed3dc18af0cc6005b58960c6cc04516bd3c75
commit: 1a7e5d4a3fc8666fcb5d9eb055f5c7d979f08584 [7/238] FROMGIT: ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: hexagon-randconfig-r026-20230311 (https://download.01.org/0day-ci/archive/20230311/202303110546.pUEFbs7k-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 1a7e5d4a3fc8666fcb5d9eb055f5c7d979f08584
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110546.pUEFbs7k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/gadget/function/f_accessory.c:28:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/usb/gadget/function/f_accessory.c:28:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/usb/gadget/function/f_accessory.c:28:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   drivers/usb/gadget/function/f_accessory.c:965:5: warning: no previous prototype for function 'acc_ctrlrequest' [-Wmissing-prototypes]
   int acc_ctrlrequest(struct usb_composite_dev *cdev,
       ^
   drivers/usb/gadget/function/f_accessory.c:965:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acc_ctrlrequest(struct usb_composite_dev *cdev,
   ^
   static 
>> drivers/usb/gadget/function/f_accessory.c:1078:5: warning: no previous prototype for function 'acc_ctrlrequest_composite' [-Wmissing-prototypes]
   int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
       ^
   drivers/usb/gadget/function/f_accessory.c:1078:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
   ^
   static 
   drivers/usb/gadget/function/f_accessory.c:1419:6: warning: no previous prototype for function 'acc_disconnect' [-Wmissing-prototypes]
   void acc_disconnect(void)
        ^
   drivers/usb/gadget/function/f_accessory.c:1419:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void acc_disconnect(void)
   ^
   static 
   drivers/usb/gadget/function/f_accessory.c:1524:5: warning: no previous prototype for function 'acc_ctrlrequest_configfs' [-Wmissing-prototypes]
   int acc_ctrlrequest_configfs(struct usb_function *f,
       ^
   drivers/usb/gadget/function/f_accessory.c:1524:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acc_ctrlrequest_configfs(struct usb_function *f,
   ^
   static 
   10 warnings generated.


vim +/acc_ctrlrequest_composite +1078 drivers/usb/gadget/function/f_accessory.c

  1077	
> 1078	int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
  1079				      const struct usb_ctrlrequest *ctrl)
  1080	{
  1081		u16 w_length = le16_to_cpu(ctrl->wLength);
  1082	
  1083		if (w_length > USB_COMP_EP0_BUFSIZ) {
  1084			if (ctrl->bRequestType & USB_DIR_IN) {
  1085				/* Cast away the const, we are going to overwrite on purpose. */
  1086				__le16 *temp = (__le16 *)&ctrl->wLength;
  1087	
  1088				*temp = cpu_to_le16(USB_COMP_EP0_BUFSIZ);
  1089				w_length = USB_COMP_EP0_BUFSIZ;
  1090			} else {
  1091				return -EINVAL;
  1092			}
  1093		}
  1094		return acc_ctrlrequest(cdev, ctrl);
  1095	}
  1096	EXPORT_SYMBOL_GPL(acc_ctrlrequest_composite);
  1097	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
