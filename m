Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C0FD304
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 23:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680220778; x=1711756778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TImbf2edyQiMpZBMGelgX4igx0M9z7VI2kJ+GvN/KCQ=;
  b=EKv/9Gu/3V0gWxsy6LpWMzkqUN1r/DXq8b2RAXPaNKfkyvw7SBjdA0xD
   7lNK2QVaKbhkn+ejzP9vQ89jot5c8inWJHhPd/O1n5EXGdn8bv03y2PTH
   2sWA5PaFdFpXYgczuU3UQpwJpnpGMShVvXVEIE/KkNsIwwW8zsAUy+jvJ
   0iBGq8jDwuXded9cIEbWy2qNoxQ1AKsQgwxceB0kEQGrofJoHkU6xT2es
   uYQkH7+1p5TW4RWwfmy4fAdjOr4nBTO0EjeKtmuHHZe44NTbmOQy0cr6f
   OA6OHmAju2GOqH7/fWNUx4aBn95x5tlQXTMynJoyhnc2ph4+4Xzp+PB3l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427589838"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="427589838"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 16:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="1014626497"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="1014626497"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Mar 2023 16:59:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi2Al-000LKK-2t;
	Thu, 30 Mar 2023 23:59:15 +0000
Date: Fri, 31 Mar 2023 07:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 13/107]
 drivers/usb/gadget/function/f_accessory.c:1078:5: warning: no previous
 prototype for 'acc_ctrlrequest_composite'
Message-ID: <202303310756.LGxRkdW6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   4f6141c1793d57c349ec9d304bddbea63e393675
commit: 70ba7172505840509b8f039db8862b34469f5850 [13/107] FROMGIT: ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: arc-randconfig-r043-20230330 (https://download.01.org/0day-ci/archive/20230331/202303310756.LGxRkdW6-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 70ba7172505840509b8f039db8862b34469f5850
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310756.LGxRkdW6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_accessory.c:965:5: warning: no previous prototype for 'acc_ctrlrequest' [-Wmissing-prototypes]
     965 | int acc_ctrlrequest(struct usb_composite_dev *cdev,
         |     ^~~~~~~~~~~~~~~
>> drivers/usb/gadget/function/f_accessory.c:1078:5: warning: no previous prototype for 'acc_ctrlrequest_composite' [-Wmissing-prototypes]
    1078 | int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1419:6: warning: no previous prototype for 'acc_disconnect' [-Wmissing-prototypes]
    1419 | void acc_disconnect(void)
         |      ^~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1524:5: warning: no previous prototype for 'acc_ctrlrequest_configfs' [-Wmissing-prototypes]
    1524 | int acc_ctrlrequest_configfs(struct usb_function *f,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


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
