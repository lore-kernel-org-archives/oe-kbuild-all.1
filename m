Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE90C2D3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 05:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680153452; x=1711689452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EsysYGTKkDgz/XDIwaoM/Q5Vtomx5BGx9HT0pK7Qqhc=;
  b=GqAJd6b98wO5j+o3i7DSmMji/fmYqY/DS62yGkZqUgF1cL1/IVg2V0Ku
   gan9vnF2ch58aaR8MKSa5ksLPATsGpp9u2daw2u3RKmo+hskiqWiaBjfF
   /BjYstGm1C3SRvvJhGE3BFxumGd5Ow2pdDxBTe60b6AFddj7BU7TFgjX5
   lI64bHB0Vlm8UVvobbe/opMFJemz+HSpIkdPK9Ge7WMguUkfRVYkQxEWg
   WXQZXsVaWW8/4Xgp6xLfWeUbk4ebqMO1JJvBovBOf/z0Q4pDx0ABFslX7
   0ta8LSlqBQ8bggpgRf3TCNNFNtPEEMmeitCX3nWuE+Z684A9fL91W4svp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="343520561"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="343520561"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 22:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714858095"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="714858095"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Mar 2023 22:17:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phkfD-000KOW-2b;
	Thu, 30 Mar 2023 05:17:31 +0000
Date: Thu, 30 Mar 2023 13:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 7/334]
 drivers/usb/gadget/function/f_accessory.c:1078:5: warning: no previous
 prototype for 'acc_ctrlrequest_composite'
Message-ID: <202303301317.ZunFrAWJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   357c6e4b48a407ae0a90fb4a1b61f63e1111fbbe
commit: 1a7e5d4a3fc8666fcb5d9eb055f5c7d979f08584 [7/334] FROMGIT: ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: arc-randconfig-r043-20230330 (https://download.01.org/0day-ci/archive/20230330/202303301317.ZunFrAWJ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 1a7e5d4a3fc8666fcb5d9eb055f5c7d979f08584
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301317.ZunFrAWJ-lkp@intel.com/

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
