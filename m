Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73436ADB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 21:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694034367; x=1725570367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qMGdE2fyPF0QFUfU3JYZEbogaMJJn2A03NIXTwsjzgg=;
  b=Xh6cAps5EMbAnk3nQDADzL6ojE28Mq8hHjLqnbeTDXi7xJ3MhH9SOfuB
   HPROw8RA7tIb5Pir6QkYdbUlDYKBNbSBR325pTFS+X2TQ2qx+sIqen/+D
   By5QHzPm801fyu8YqH434f5O5Hr9ALkfgQ3B8O02+a/XKi1wNDXdf0uu2
   lWSdOfiJLt5B51WqHoxEPWALVb+E+7vTMpoM7cumabsvRRKQ+m2WtXCk3
   ITgSe7IzMBRuWKyuBP2aOR0RPF6Flx78U+r2PkH2PMZMSa2wa8t3XC00C
   3n2zshspwiQ3ERraSXo00t3CgMcP+Yk99Lky1X3eYrx9NqthyPpoE0Fub
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379894708"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="379894708"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 14:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741720428"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="741720428"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Sep 2023 14:06:03 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdzir-0000al-1H;
	Wed, 06 Sep 2023 21:06:01 +0000
Date: Thu, 7 Sep 2023 05:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/1]
 drivers/usb/gadget/function/f_accessory.c:1088:5: warning: no previous
 declaration for 'acc_ctrlrequest_composite'
Message-ID: <202309070400.3UboG5Yq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   e95427763fcb4cc717fff219ea4f27f1c21be013
commit: e12e360999d84e5e56952c6c027803f662567d76 [1/1] ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: x86_64-randconfig-r003-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070400.3UboG5Yq-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070400.3UboG5Yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070400.3UboG5Yq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_accessory.c:975:5: warning: no previous declaration for 'acc_ctrlrequest' [-Wmissing-declarations]
    int acc_ctrlrequest(struct usb_composite_dev *cdev,
        ^~~~~~~~~~~~~~~
>> drivers/usb/gadget/function/f_accessory.c:1088:5: warning: no previous declaration for 'acc_ctrlrequest_composite' [-Wmissing-declarations]
    int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1441:6: warning: no previous declaration for 'acc_disconnect' [-Wmissing-declarations]
    void acc_disconnect(void)
         ^~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1546:5: warning: no previous declaration for 'acc_ctrlrequest_configfs' [-Wmissing-declarations]
    int acc_ctrlrequest_configfs(struct usb_function *f,
        ^~~~~~~~~~~~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests/wiki
