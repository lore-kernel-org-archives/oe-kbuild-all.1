Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506633;
	b=tM/jD7UHJK1BzKkhrtxU3zzPnGXDEzbF0Xax6uaGGiSHcXZbJWGO5ROtNpEc2HFP8Jll
	 /K88qf/ZCB9dJ5zXZ1bujuBuB81Ixj/gpNWrV7fcAX6CBDTCMrd3sGqvcWnsldlI1RPHt
	 gPOsZgPEdlBbDtv+CIamfydDLX883Tfg3oiZSgS4mX5bvgBnkmMo+sej2G7h7IIRwazQS
	 V58iY0SEXDEYCGyHmcd/qr51gEIq5LAnHsM5kGMJSPKumnCdbaRbhiy0ZKmr9KcZ+IKKi
	 MbbqWg8vTIrlTr2oQxDMJlqIrvWY6mt0v6wixMBV7YgutkiRi2SY5vgM9qpDSdY+HBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506633;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MqaB2BpqXpnr6vschbFa0Ao+UcImvsijmSEBlYZdRts=;
	b=Z3xvcLe5yqlGWXMLu9RIcuzFzeq7wu4uoNysmJE5qq13m4PFBs7qffxQpnabbRVhcDa3
	 RbvqzXgWVhrmOW6JVmfPLvXHc6yjjko+PQkGWeG2w261DAG8lf1T3qpdl6gIAKxO7Z1A1
	 gofaoK8awcrgii7ZwKTf9RbUWW3ft8LRUs1717qq+v0uPEJJiRlA1KS1eNMJHWCR7yhAG
	 LhoFBniSkfBxkRgK6YdEdATxxnL8EtVHOym2lbcs2I/ZzBe6ptueir/ex3qG23RtMKPDE
	 gJmiBw4DIndtoGFTbDF+6MGbRZ9FYRsLxCEx5VYs5n7eb5OyzZ+Wec1o1Ukj12u9+8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="fdG/iEoh";
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD40606A31E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 07:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD40606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fdG/iEoh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795506633; x=1827042633;
  h=date:from:to:cc:subject:message-id;
  bh=4TSVwhLWQJzJJGK5Ij5it60qwPCvWpQgsinx6q7Xofg=;
  b=fdG/iEohG1rGLsPByW0k1suMPj8umdrVB1SbnaB3zFsFNB1M9Ep89nwq
   OOiH+W4pLp1QauMUnacppEkoRBbfhR5HAw9CVWC1dJDaZhTu3U77DA98K
   j912PX7HMevL5yIcUV1SikiQY5gmw1YEWpk39rn5PXE0HV0+pONWSeW7S
   oqBXLZ/62y5n85ukwb+SjPAu0V4n1qwRge60ZsTsZy3i5enKZq7ZK7ld9
   /5Q0biCX9VMzL4qI/yi7rBpXxXELGTRsUcc2FHgK1CI/cNOL/hkmpDB2y
   4Y4+yuL8FRdG2d8wiLrlRaeFTUTEb/oOIx2EOJ46Nk/RNhity3nxgSu7k
   Q==;
X-CSE-ConnectionGUID: QHM/2wY+R5+btNaoM8XHaA==
X-CSE-MsgGUID: BXLmWf1cR7uqE7AJ83Fgkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4177485"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4177485"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:27:05 -0800
X-CSE-ConnectionGUID: FJnRClmCRuq/hlO/1P7baA==
X-CSE-MsgGUID: a47JwLCwSMu6ASb9+5uDVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="13285791"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 23 Nov 2026 23:25:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVku2-0000000059V-2tx2;
	Tue, 24 Nov 2026 07:25:22 +0000
Date: Tue, 24 Nov 2026 08:24:42 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 drivers/bluetooth/btusb.c:2708:15: error: implicit declaration of function
 'btmtk_usb_subsys_reset'
Message-ID: <20261124081941.r8JLW5ic-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   329f9ae918a9e18da3c488e531adf9b7995e2aae
commit: ade787f04790654849d20cd0706644ba51589aa5 [0/1] Bluetooth: btmtk: Fix btmtk.c undefined reference build error
config: x86_64-randconfig-2004-20261124 (https://download.01.org/0day-ci/archive/20261124/20261124081941.r8JLW5ic-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124081941.r8JLW5ic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124081941.r8JLW5ic-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bluetooth/btusb.c: In function 'btusb_mtk_reset':
>> drivers/bluetooth/btusb.c:2708:15: error: implicit declaration of function 'btmtk_usb_subsys_reset' [-Wimplicit-function-declaration]
    2708 |         err = btmtk_usb_subsys_reset(hdev, btmtk_data->dev_id);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btusb.c: In function 'btusb_mtk_setup':
>> drivers/bluetooth/btusb.c:2730:16: error: implicit declaration of function 'btmtk_usb_setup' [-Wimplicit-function-declaration]
    2730 |         return btmtk_usb_setup(hdev);
         |                ^~~~~~~~~~~~~~~
   drivers/bluetooth/btusb.c: In function 'btusb_mtk_shutdown':
>> drivers/bluetooth/btusb.c:2735:16: error: implicit declaration of function 'btmtk_usb_shutdown'; did you mean 'btusb_mtk_shutdown'? [-Wimplicit-function-declaration]
    2735 |         return btmtk_usb_shutdown(hdev);
         |                ^~~~~~~~~~~~~~~~~~
         |                btusb_mtk_shutdown


vim +/btmtk_usb_subsys_reset +2708 drivers/bluetooth/btusb.c

044014ce85a17c0 Hilda Wu  2023-04-27  2688  
aa58d8366269e7b Hao Qin   2024-05-15  2689  static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
aa58d8366269e7b Hao Qin   2024-05-15  2690  {
aa58d8366269e7b Hao Qin   2024-05-15  2691  	struct btusb_data *data = hci_get_drvdata(hdev);
73377cf3056ad72 Chris Lu  2024-07-04  2692  	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
aa58d8366269e7b Hao Qin   2024-05-15  2693  	int err;
aa58d8366269e7b Hao Qin   2024-05-15  2694  
aa58d8366269e7b Hao Qin   2024-05-15  2695  	/* It's MediaTek specific bluetooth reset mechanism via USB */
f344a2d77d47e5f Chris Lu  2024-07-04  2696  	if (test_and_set_bit(BTMTK_HW_RESET_ACTIVE, &btmtk_data->flags)) {
aa58d8366269e7b Hao Qin   2024-05-15  2697  		bt_dev_err(hdev, "last reset failed? Not resetting again");
aa58d8366269e7b Hao Qin   2024-05-15  2698  		return -EBUSY;
aa58d8366269e7b Hao Qin   2024-05-15  2699  	}
aa58d8366269e7b Hao Qin   2024-05-15  2700  
aa58d8366269e7b Hao Qin   2024-05-15  2701  	err = usb_autopm_get_interface(data->intf);
aa58d8366269e7b Hao Qin   2024-05-15  2702  	if (err < 0)
aa58d8366269e7b Hao Qin   2024-05-15  2703  		return err;
aa58d8366269e7b Hao Qin   2024-05-15  2704  
aa58d8366269e7b Hao Qin   2024-05-15  2705  	btusb_stop_traffic(data);
aa58d8366269e7b Hao Qin   2024-05-15  2706  	usb_kill_anchored_urbs(&data->tx_anchor);
aa58d8366269e7b Hao Qin   2024-05-15  2707  
f344a2d77d47e5f Chris Lu  2024-07-04 @2708  	err = btmtk_usb_subsys_reset(hdev, btmtk_data->dev_id);
aa58d8366269e7b Hao Qin   2024-05-15  2709  
aa58d8366269e7b Hao Qin   2024-05-15  2710  	usb_queue_reset_device(data->intf);
f344a2d77d47e5f Chris Lu  2024-07-04  2711  	clear_bit(BTMTK_HW_RESET_ACTIVE, &btmtk_data->flags);
25b6d7593a3af75 Jing Cai  2023-06-29  2712  
25b6d7593a3af75 Jing Cai  2023-06-29  2713  	return err;
25b6d7593a3af75 Jing Cai  2023-06-29  2714  }
25b6d7593a3af75 Jing Cai  2023-06-29  2715  
a1c49c434e15050 Sean Wang 2019-06-02  2716  static int btusb_mtk_setup(struct hci_dev *hdev)
a1c49c434e15050 Sean Wang 2019-06-02  2717  {
a1c49c434e15050 Sean Wang 2019-06-02  2718  	struct btusb_data *data = hci_get_drvdata(hdev);
f344a2d77d47e5f Chris Lu  2024-07-04  2719  	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
0b70151328781a8 Jing Cai  2023-06-29  2720  
f344a2d77d47e5f Chris Lu  2024-07-04  2721  	/* MediaTek WMT vendor cmd requiring below USB resources to
f344a2d77d47e5f Chris Lu  2024-07-04  2722  	 * complete the handshake.
1c770a550df2fb2 Hao Qin   2024-05-15  2723  	 */
f344a2d77d47e5f Chris Lu  2024-07-04  2724  	btmtk_data->drv_name = btusb_driver.name;
f344a2d77d47e5f Chris Lu  2024-07-04  2725  	btmtk_data->intf = data->intf;
f344a2d77d47e5f Chris Lu  2024-07-04  2726  	btmtk_data->udev = data->udev;
f344a2d77d47e5f Chris Lu  2024-07-04  2727  	btmtk_data->ctrl_anchor = &data->ctrl_anchor;
f344a2d77d47e5f Chris Lu  2024-07-04  2728  	btmtk_data->reset_sync = btusb_mtk_reset;
1c770a550df2fb2 Hao Qin   2024-05-15  2729  
f344a2d77d47e5f Chris Lu  2024-07-04 @2730  	return btmtk_usb_setup(hdev);
a1c49c434e15050 Sean Wang 2019-06-02  2731  }
a1c49c434e15050 Sean Wang 2019-06-02  2732  
a1c49c434e15050 Sean Wang 2019-06-02  2733  static int btusb_mtk_shutdown(struct hci_dev *hdev)
a1c49c434e15050 Sean Wang 2019-06-02  2734  {
f344a2d77d47e5f Chris Lu  2024-07-04 @2735  	return btmtk_usb_shutdown(hdev);
a1c49c434e15050 Sean Wang 2019-06-02  2736  }
a1c49c434e15050 Sean Wang 2019-06-02  2737  

:::::: The code at line 2708 was first introduced by commit
:::::: f344a2d77d47e5fad74e1b72399380b0a8f11fdc Bluetooth: btmtk: move btusb_mtk_[setup, shutdown] to btmtk.c

:::::: TO: Chris Lu <chris.lu@mediatek.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
