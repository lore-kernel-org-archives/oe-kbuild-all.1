Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C4A932
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 22:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677019847; x=1708555847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qoYPG1EuaiBiyFbGMvKw6gWGEZaVckNJQH0L6D9f/4w=;
  b=Ha5WoWxX3NrzNrSKghDpA/ld/fi4LHYRJRv6a82+Ip4clBcpevrfxEMp
   ijgN5dV0r9mxkK48Hq8DBvZOBO6VTf4vJuTi8QVswC6Vkuk5BVmFKmw1N
   yIL0/oJBspm07178uSH1Zz4P1tFHkMhkJzKV8Z1pbSgDcPok4h+B89QTl
   bmVarr9h13u9QPqeRcjRFeFTn3+xbDkUZyNt9ynMNJxoGTUA2dd0MFcSl
   E2jqXIvngXTYgpkdU1WjkOOslPXjqyjEFUCnWwHuU9gWjZG9o3nWFRq4a
   17emJAoV2pG6yl32qwmglmqK4ial9WzE4YO37aFsWXft2puV6mIiT3ud4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="330499041"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="330499041"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 14:50:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814685484"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="814685484"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 14:50:45 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUbTB-0000JV-0G;
	Tue, 21 Feb 2023 22:50:45 +0000
Date: Wed, 22 Feb 2023 06:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android14-5.15 1/1]
 drivers/usb/gadget/function/f_accessory.c:1079:5: warning: no previous
 prototype for 'acc_ctrlrequest_composite'
Message-ID: <202302220651.PsBQWtyO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android14-5.15
head:   2eca125266087fa066a56275657729b48fc17914
commit: f63204236560b6f38b6e015c53eb6304d9889791 [1/1] ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: x86_64-randconfig-r003-20230220 (https://download.01.org/0day-ci/archive/20230222/202302220651.PsBQWtyO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/f63204236560b6f38b6e015c53eb6304d9889791
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android14-5.15
        git checkout f63204236560b6f38b6e015c53eb6304d9889791
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220651.PsBQWtyO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_accessory.c:966:5: warning: no previous prototype for 'acc_ctrlrequest' [-Wmissing-prototypes]
     966 | int acc_ctrlrequest(struct usb_composite_dev *cdev,
         |     ^~~~~~~~~~~~~~~
>> drivers/usb/gadget/function/f_accessory.c:1079:5: warning: no previous prototype for 'acc_ctrlrequest_composite' [-Wmissing-prototypes]
    1079 | int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1430:6: warning: no previous prototype for 'acc_disconnect' [-Wmissing-prototypes]
    1430 | void acc_disconnect(void)
         |      ^~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1535:5: warning: no previous prototype for 'acc_ctrlrequest_configfs' [-Wmissing-prototypes]
    1535 | int acc_ctrlrequest_configfs(struct usb_function *f,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/acc_ctrlrequest_composite +1079 drivers/usb/gadget/function/f_accessory.c

   965	
 > 966	int acc_ctrlrequest(struct usb_composite_dev *cdev,
   967					const struct usb_ctrlrequest *ctrl)
   968	{
   969		struct acc_dev	*dev = get_acc_dev();
   970		int	value = -EOPNOTSUPP;
   971		struct acc_hid_dev *hid;
   972		int offset;
   973		u8 b_requestType = ctrl->bRequestType;
   974		u8 b_request = ctrl->bRequest;
   975		u16	w_index = le16_to_cpu(ctrl->wIndex);
   976		u16	w_value = le16_to_cpu(ctrl->wValue);
   977		u16	w_length = le16_to_cpu(ctrl->wLength);
   978		unsigned long flags;
   979	
   980		/*
   981		 * If instance is not created which is the case in power off charging
   982		 * mode, dev will be NULL. Hence return error if it is the case.
   983		 */
   984		if (!dev)
   985			return -ENODEV;
   986	
   987		if (b_requestType == (USB_DIR_OUT | USB_TYPE_VENDOR)) {
   988			if (b_request == ACCESSORY_START) {
   989				dev->start_requested = 1;
   990				schedule_delayed_work(
   991					&dev->start_work, msecs_to_jiffies(10));
   992				value = 0;
   993				cdev->req->complete = acc_complete_setup_noop;
   994			} else if (b_request == ACCESSORY_SEND_STRING) {
   995				schedule_work(&dev->sendstring_work);
   996				dev->string_index = w_index;
   997				cdev->gadget->ep0->driver_data = dev;
   998				cdev->req->complete = acc_complete_set_string;
   999				value = w_length;
  1000			} else if (b_request == ACCESSORY_SET_AUDIO_MODE &&
  1001					w_index == 0 && w_length == 0) {
  1002				dev->audio_mode = w_value;
  1003				cdev->req->complete = acc_complete_setup_noop;
  1004				value = 0;
  1005			} else if (b_request == ACCESSORY_REGISTER_HID) {
  1006				cdev->req->complete = acc_complete_setup_noop;
  1007				value = acc_register_hid(dev, w_value, w_index);
  1008			} else if (b_request == ACCESSORY_UNREGISTER_HID) {
  1009				cdev->req->complete = acc_complete_setup_noop;
  1010				value = acc_unregister_hid(dev, w_value);
  1011			} else if (b_request == ACCESSORY_SET_HID_REPORT_DESC) {
  1012				spin_lock_irqsave(&dev->lock, flags);
  1013				hid = acc_hid_get(&dev->new_hid_list, w_value);
  1014				spin_unlock_irqrestore(&dev->lock, flags);
  1015				if (!hid) {
  1016					value = -EINVAL;
  1017					goto err;
  1018				}
  1019				offset = w_index;
  1020				if (offset != hid->report_desc_offset
  1021					|| offset + w_length > hid->report_desc_len) {
  1022					value = -EINVAL;
  1023					goto err;
  1024				}
  1025				cdev->req->context = hid;
  1026				cdev->req->complete = acc_complete_set_hid_report_desc;
  1027				value = w_length;
  1028			} else if (b_request == ACCESSORY_SEND_HID_EVENT) {
  1029				spin_lock_irqsave(&dev->lock, flags);
  1030				hid = acc_hid_get(&dev->hid_list, w_value);
  1031				spin_unlock_irqrestore(&dev->lock, flags);
  1032				if (!hid) {
  1033					value = -EINVAL;
  1034					goto err;
  1035				}
  1036				cdev->req->context = hid;
  1037				cdev->req->complete = acc_complete_send_hid_event;
  1038				value = w_length;
  1039			}
  1040		} else if (b_requestType == (USB_DIR_IN | USB_TYPE_VENDOR)) {
  1041			if (b_request == ACCESSORY_GET_PROTOCOL) {
  1042				schedule_work(&dev->getprotocol_work);
  1043				*((u16 *)cdev->req->buf) = PROTOCOL_VERSION;
  1044				value = sizeof(u16);
  1045				cdev->req->complete = acc_complete_setup_noop;
  1046				/* clear any string left over from a previous session */
  1047				memset(dev->manufacturer, 0, sizeof(dev->manufacturer));
  1048				memset(dev->model, 0, sizeof(dev->model));
  1049				memset(dev->description, 0, sizeof(dev->description));
  1050				memset(dev->version, 0, sizeof(dev->version));
  1051				memset(dev->uri, 0, sizeof(dev->uri));
  1052				memset(dev->serial, 0, sizeof(dev->serial));
  1053				dev->start_requested = 0;
  1054				dev->audio_mode = 0;
  1055			}
  1056		}
  1057	
  1058		if (value >= 0) {
  1059			cdev->req->zero = 0;
  1060			cdev->req->length = value;
  1061			value = usb_ep_queue(cdev->gadget->ep0, cdev->req, GFP_ATOMIC);
  1062			if (value < 0)
  1063				ERROR(cdev, "%s setup response queue error\n",
  1064					__func__);
  1065		}
  1066	
  1067	err:
  1068		if (value == -EOPNOTSUPP)
  1069			VDBG(cdev,
  1070				"unknown class-specific control req "
  1071				"%02x.%02x v%04x i%04x l%u\n",
  1072				ctrl->bRequestType, ctrl->bRequest,
  1073				w_value, w_index, w_length);
  1074		put_acc_dev(dev);
  1075		return value;
  1076	}
  1077	EXPORT_SYMBOL_GPL(acc_ctrlrequest);
  1078	
> 1079	int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
  1080				      const struct usb_ctrlrequest *ctrl)
  1081	{
  1082		u16 w_length = le16_to_cpu(ctrl->wLength);
  1083	
  1084		if (w_length > USB_COMP_EP0_BUFSIZ) {
  1085			if (ctrl->bRequestType & USB_DIR_IN) {
  1086				/* Cast away the const, we are going to overwrite on purpose. */
  1087				__le16 *temp = (__le16 *)&ctrl->wLength;
  1088	
  1089				*temp = cpu_to_le16(USB_COMP_EP0_BUFSIZ);
  1090				w_length = USB_COMP_EP0_BUFSIZ;
  1091			} else {
  1092				return -EINVAL;
  1093			}
  1094		}
  1095		return acc_ctrlrequest(cdev, ctrl);
  1096	}
  1097	EXPORT_SYMBOL_GPL(acc_ctrlrequest_composite);
  1098	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
