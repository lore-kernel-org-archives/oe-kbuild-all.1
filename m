Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED73E3209
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 20:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674246623; x=1705782623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=myWPsuRDxiUevEa3SMRo8oTZtGtupPh+joNHdiQSyQY=;
  b=QLWJEF9LL4U12zc6IqabDOdvRYvprB13HijfbrwkyiXlNhanXj7zSYAy
   nSHfb2oIWt239Rm2PR1nzD2L+N9IoNsLP0iXrcNAk60p9+vYPtCYKIIfh
   pt/vgkrG1MMHY8dD//5UG0YVld22/suafCt/HgM0kZMY9Al640zfeyrNp
   fwOa5AMf1uP/SHSXe/YxURLb30ubEatKajd8ov7CmvwTEdd7qALSVxdv6
   5K43Ugc+ubVz0AC78Z6+kbL8nboC9yjQRoe1DGFtR9CUyKk9+eTh09n5J
   8OhpB15oWDA2fEReci26iQ5mIjgtM33WRD311ELKD46vl4DA4i1YKVjsd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="313574081"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="313574081"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 12:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="660712053"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="660712053"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Jan 2023 12:30:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIy1l-0002uE-1P;
	Fri, 20 Jan 2023 20:30:21 +0000
Date: Sat, 21 Jan 2023 04:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.10 1/1]
 drivers/usb/gadget/function/f_accessory.c:1088:5: warning: no previous
 prototype for 'acc_ctrlrequest_composite'
Message-ID: <202301210440.Yozp98mc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-5.10
head:   e12e360999d84e5e56952c6c027803f662567d76
commit: e12e360999d84e5e56952c6c027803f662567d76 [1/1] ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230121/202301210440.Yozp98mc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/e12e360999d84e5e56952c6c027803f662567d76
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-5.10
        git checkout e12e360999d84e5e56952c6c027803f662567d76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_accessory.c:975:5: warning: no previous prototype for 'acc_ctrlrequest' [-Wmissing-prototypes]
     975 | int acc_ctrlrequest(struct usb_composite_dev *cdev,
         |     ^~~~~~~~~~~~~~~
>> drivers/usb/gadget/function/f_accessory.c:1088:5: warning: no previous prototype for 'acc_ctrlrequest_composite' [-Wmissing-prototypes]
    1088 | int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1441:6: warning: no previous prototype for 'acc_disconnect' [-Wmissing-prototypes]
    1441 | void acc_disconnect(void)
         |      ^~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1546:5: warning: no previous prototype for 'acc_ctrlrequest_configfs' [-Wmissing-prototypes]
    1546 | int acc_ctrlrequest_configfs(struct usb_function *f,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/acc_ctrlrequest_composite +1088 drivers/usb/gadget/function/f_accessory.c

  1087	
> 1088	int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
  1089				      const struct usb_ctrlrequest *ctrl)
  1090	{
  1091		u16 w_length = le16_to_cpu(ctrl->wLength);
  1092	
  1093		if (w_length > USB_COMP_EP0_BUFSIZ) {
  1094			if (ctrl->bRequestType & USB_DIR_IN) {
  1095				/* Cast away the const, we are going to overwrite on purpose. */
  1096				__le16 *temp = (__le16 *)&ctrl->wLength;
  1097	
  1098				*temp = cpu_to_le16(USB_COMP_EP0_BUFSIZ);
  1099				w_length = USB_COMP_EP0_BUFSIZ;
  1100			} else {
  1101				return -EINVAL;
  1102			}
  1103		}
  1104		return acc_ctrlrequest(cdev, ctrl);
  1105	}
  1106	EXPORT_SYMBOL_GPL(acc_ctrlrequest_composite);
  1107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
