Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C407E2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 20:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674506064; x=1706042064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0CPXpFgn+CRuK3wFyrMbt4HCr/wh8pI8j3bocepN1JM=;
  b=awyELhlTU8/ghOrmGrOJiN1I+iB8LfdtTS/76WtWXNcc5/YCxBodF5Kk
   AjlGN7Xp7zKhnSfUKdseqIWHuyDXrglgEC0TtPEQqJlk6HQthP/7+X/9R
   c+UxKwo0VYyt5NeoeZ8slOngy5NjqnkaHPZWXMpg0KNQrBrP0sA4YA+Iw
   aHUs2+UsZ5fzQKo75C2EbDWGXYkbDVyTCb2StoXOmNcJfzdGHq6y1M5ky
   bbAzgUILaY/kr79o+6C2LVNL1u2LYLLM3p3Px85JYgE1k0hFQmnXUQyOZ
   5QRvFLHdRWwfBbD8tPt8cYieI+VQlmzsJ0l5TlPfjlfjAdHhf/Nw7HHWD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306499590"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="306499590"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 12:34:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663812233"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="663812233"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 12:34:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK3WH-0005sm-0h;
	Mon, 23 Jan 2023 20:34:21 +0000
Date: Tue, 24 Jan 2023 04:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.14-q 1/1]
 drivers/usb/gadget/function/f_accessory.c:1008:5: warning: no previous
 declaration for 'acc_ctrlrequest_composite'
Message-ID: <202301240453.JfRh7ner-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.14-q
head:   6e193ecd7a65f41aabc219c33deccd3152fde14c
commit: 6e193ecd7a65f41aabc219c33deccd3152fde14c [1/1] ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230124/202301240453.JfRh7ner-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/6e193ecd7a65f41aabc219c33deccd3152fde14c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.14-q
        git checkout 6e193ecd7a65f41aabc219c33deccd3152fde14c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_accessory.c:897:5: warning: no previous declaration for 'acc_ctrlrequest' [-Wmissing-declarations]
    int acc_ctrlrequest(struct usb_composite_dev *cdev,
        ^~~~~~~~~~~~~~~
>> drivers/usb/gadget/function/f_accessory.c:1008:5: warning: no previous declaration for 'acc_ctrlrequest_composite' [-Wmissing-declarations]
    int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1335:6: warning: no previous declaration for 'acc_disconnect' [-Wmissing-declarations]
    void acc_disconnect(void)
         ^~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1440:5: warning: no previous declaration for 'acc_ctrlrequest_configfs' [-Wmissing-declarations]
    int acc_ctrlrequest_configfs(struct usb_function *f,
        ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/acc_ctrlrequest_composite +1008 drivers/usb/gadget/function/f_accessory.c

  1007	
> 1008	int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
  1009				      const struct usb_ctrlrequest *ctrl)
  1010	{
  1011		u16 w_length = le16_to_cpu(ctrl->wLength);
  1012	
  1013		if (w_length > USB_COMP_EP0_BUFSIZ) {
  1014			if (ctrl->bRequestType & USB_DIR_IN) {
  1015				/* Cast away the const, we are going to overwrite on purpose. */
  1016				__le16 *temp = (__le16 *)&ctrl->wLength;
  1017	
  1018				*temp = cpu_to_le16(USB_COMP_EP0_BUFSIZ);
  1019				w_length = USB_COMP_EP0_BUFSIZ;
  1020			} else {
  1021				return -EINVAL;
  1022			}
  1023		}
  1024		return acc_ctrlrequest(cdev, ctrl);
  1025	}
  1026	EXPORT_SYMBOL_GPL(acc_ctrlrequest_composite);
  1027	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
