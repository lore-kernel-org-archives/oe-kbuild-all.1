Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3593210
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 14:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675348837; x=1706884837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ZiWPr8XjpcCZSGTgrC44ikWmy0dvthBVQD3xLKnKM8=;
  b=fBGd3fz9G/yDG9kLFRfT8mkxB8v+BEdmBYMl/8kwa+FX0Ymq5IzM0Ier
   xPpDrs5jXvYnbybzaM1jEsMgYum0MerdktQZLnpQ/VrkHqcPtNBHCREio
   dKxWLA0sYibXFQbOPvrNEu6N6xHn+m5VKrqsciKnP6p/aaQ7Nor1ZNwff
   WTma2iEBF73EJvuStLSs6iS4MQXfwGf+w7tlev4obrHLz+dFbwkQe2hNT
   9Mco+6b2mkv7VRZJ0Sc/pK4TybouQm801Yd8rqmb2P+sBCLoUsmeh1Tdo
   cX/TqVu0n27GBYLCoRQdMBEsr/GEn0nHQgpUg9F5mXgdBdIxqLpxxXhyI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316456661"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="316456661"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 06:40:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="665299834"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="665299834"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Feb 2023 06:40:35 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNalO-0006bE-2Z;
	Thu, 02 Feb 2023 14:40:34 +0000
Date: Thu, 2 Feb 2023 22:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.10 1/1]
 drivers/usb/gadget/function/f_accessory.c:1088:5: warning: no previous
 prototype for function 'acc_ctrlrequest_composite'
Message-ID: <202302022236.E9bwA21N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-5.10
head:   f069ba2b3db07a07491299ebbd19ee33475d5609
commit: e12e360999d84e5e56952c6c027803f662567d76 [1/1] ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: x86_64-randconfig-k001 (https://download.01.org/0day-ci/archive/20230202/202302022236.E9bwA21N-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/e12e360999d84e5e56952c6c027803f662567d76
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-5.10
        git checkout e12e360999d84e5e56952c6c027803f662567d76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_accessory.c:975:5: warning: no previous prototype for function 'acc_ctrlrequest' [-Wmissing-prototypes]
   int acc_ctrlrequest(struct usb_composite_dev *cdev,
       ^
   drivers/usb/gadget/function/f_accessory.c:975:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acc_ctrlrequest(struct usb_composite_dev *cdev,
   ^
   static 
>> drivers/usb/gadget/function/f_accessory.c:1088:5: warning: no previous prototype for function 'acc_ctrlrequest_composite' [-Wmissing-prototypes]
   int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
       ^
   drivers/usb/gadget/function/f_accessory.c:1088:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
   ^
   static 
   drivers/usb/gadget/function/f_accessory.c:1441:6: warning: no previous prototype for function 'acc_disconnect' [-Wmissing-prototypes]
   void acc_disconnect(void)
        ^
   drivers/usb/gadget/function/f_accessory.c:1441:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void acc_disconnect(void)
   ^
   static 
   drivers/usb/gadget/function/f_accessory.c:1546:5: warning: no previous prototype for function 'acc_ctrlrequest_configfs' [-Wmissing-prototypes]
   int acc_ctrlrequest_configfs(struct usb_function *f,
       ^
   drivers/usb/gadget/function/f_accessory.c:1546:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acc_ctrlrequest_configfs(struct usb_function *f,
   ^
   static 
   4 warnings generated.


vim +/acc_ctrlrequest_composite +1088 drivers/usb/gadget/function/f_accessory.c

   974	
 > 975	int acc_ctrlrequest(struct usb_composite_dev *cdev,
   976					const struct usb_ctrlrequest *ctrl)
   977	{
   978		struct acc_dev	*dev = get_acc_dev();
   979		int	value = -EOPNOTSUPP;
   980		struct acc_hid_dev *hid;
   981		int offset;
   982		u8 b_requestType = ctrl->bRequestType;
   983		u8 b_request = ctrl->bRequest;
   984		u16	w_index = le16_to_cpu(ctrl->wIndex);
   985		u16	w_value = le16_to_cpu(ctrl->wValue);
   986		u16	w_length = le16_to_cpu(ctrl->wLength);
   987		unsigned long flags;
   988	
   989		/*
   990		 * If instance is not created which is the case in power off charging
   991		 * mode, dev will be NULL. Hence return error if it is the case.
   992		 */
   993		if (!dev)
   994			return -ENODEV;
   995	
   996		if (b_requestType == (USB_DIR_OUT | USB_TYPE_VENDOR)) {
   997			if (b_request == ACCESSORY_START) {
   998				dev->start_requested = 1;
   999				schedule_delayed_work(
  1000					&dev->start_work, msecs_to_jiffies(10));
  1001				value = 0;
  1002				cdev->req->complete = acc_complete_setup_noop;
  1003			} else if (b_request == ACCESSORY_SEND_STRING) {
  1004				schedule_work(&dev->sendstring_work);
  1005				dev->string_index = w_index;
  1006				cdev->gadget->ep0->driver_data = dev;
  1007				cdev->req->complete = acc_complete_set_string;
  1008				value = w_length;
  1009			} else if (b_request == ACCESSORY_SET_AUDIO_MODE &&
  1010					w_index == 0 && w_length == 0) {
  1011				dev->audio_mode = w_value;
  1012				cdev->req->complete = acc_complete_setup_noop;
  1013				value = 0;
  1014			} else if (b_request == ACCESSORY_REGISTER_HID) {
  1015				cdev->req->complete = acc_complete_setup_noop;
  1016				value = acc_register_hid(dev, w_value, w_index);
  1017			} else if (b_request == ACCESSORY_UNREGISTER_HID) {
  1018				cdev->req->complete = acc_complete_setup_noop;
  1019				value = acc_unregister_hid(dev, w_value);
  1020			} else if (b_request == ACCESSORY_SET_HID_REPORT_DESC) {
  1021				spin_lock_irqsave(&dev->lock, flags);
  1022				hid = acc_hid_get(&dev->new_hid_list, w_value);
  1023				spin_unlock_irqrestore(&dev->lock, flags);
  1024				if (!hid) {
  1025					value = -EINVAL;
  1026					goto err;
  1027				}
  1028				offset = w_index;
  1029				if (offset != hid->report_desc_offset
  1030					|| offset + w_length > hid->report_desc_len) {
  1031					value = -EINVAL;
  1032					goto err;
  1033				}
  1034				cdev->req->context = hid;
  1035				cdev->req->complete = acc_complete_set_hid_report_desc;
  1036				value = w_length;
  1037			} else if (b_request == ACCESSORY_SEND_HID_EVENT) {
  1038				spin_lock_irqsave(&dev->lock, flags);
  1039				hid = acc_hid_get(&dev->hid_list, w_value);
  1040				spin_unlock_irqrestore(&dev->lock, flags);
  1041				if (!hid) {
  1042					value = -EINVAL;
  1043					goto err;
  1044				}
  1045				cdev->req->context = hid;
  1046				cdev->req->complete = acc_complete_send_hid_event;
  1047				value = w_length;
  1048			}
  1049		} else if (b_requestType == (USB_DIR_IN | USB_TYPE_VENDOR)) {
  1050			if (b_request == ACCESSORY_GET_PROTOCOL) {
  1051				schedule_work(&dev->getprotocol_work);
  1052				*((u16 *)cdev->req->buf) = PROTOCOL_VERSION;
  1053				value = sizeof(u16);
  1054				cdev->req->complete = acc_complete_setup_noop;
  1055				/* clear any string left over from a previous session */
  1056				memset(dev->manufacturer, 0, sizeof(dev->manufacturer));
  1057				memset(dev->model, 0, sizeof(dev->model));
  1058				memset(dev->description, 0, sizeof(dev->description));
  1059				memset(dev->version, 0, sizeof(dev->version));
  1060				memset(dev->uri, 0, sizeof(dev->uri));
  1061				memset(dev->serial, 0, sizeof(dev->serial));
  1062				dev->start_requested = 0;
  1063				dev->audio_mode = 0;
  1064			}
  1065		}
  1066	
  1067		if (value >= 0) {
  1068			cdev->req->zero = 0;
  1069			cdev->req->length = value;
  1070			value = usb_ep_queue(cdev->gadget->ep0, cdev->req, GFP_ATOMIC);
  1071			if (value < 0)
  1072				ERROR(cdev, "%s setup response queue error\n",
  1073					__func__);
  1074		}
  1075	
  1076	err:
  1077		if (value == -EOPNOTSUPP)
  1078			VDBG(cdev,
  1079				"unknown class-specific control req "
  1080				"%02x.%02x v%04x i%04x l%u\n",
  1081				ctrl->bRequestType, ctrl->bRequest,
  1082				w_value, w_index, w_length);
  1083		put_acc_dev(dev);
  1084		return value;
  1085	}
  1086	EXPORT_SYMBOL_GPL(acc_ctrlrequest);
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
