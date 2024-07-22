Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A7B35280
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721637568; cv=none; b=BtVUf0KW6m2K1l1e1YlGEXNyXhtEVt3f/7MHx3ePJm69K5jKNoBQKzh6j0CvAThhYXiqNN4W//iKHio15EyLpEyF7R7AYe7WLjNCX/bXhnHeo96eS5mdpnbVYwTPm7suQnZ8xYdQceZdYOjtJHnx9ub7HqfAlncPNYkdDaFBFRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721637568; c=relaxed/simple;
	bh=jF3MK90FdCeT3Rjse46xXmL99nQyJlT7//xcvqkBi9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NBdHroMTNPZhGBwLMu0o+sEbP5Ro/Fduo249ghVZyY3vJ5OpGC8cy7qbgpkYNPyKGnIoihnulQXksR200Lt3OnKEfRwDnqACjPJoxKHuOEW21/xTST7toqg8fHBZHTgLIG9ulaBwjfuKh0NLo0gb/gA44lCYDteTl2j21Woijew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQzj0IQ7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQzj0IQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721637566; x=1753173566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jF3MK90FdCeT3Rjse46xXmL99nQyJlT7//xcvqkBi9k=;
  b=aQzj0IQ7JkiodkuQqtI1UtW1ma07kFi7VAvYAZhxdOJd9R5BF51uNofi
   3i7l5xGeXiXvp6KwPVDZItGGwF3cL23IiU/X+BrKslUUKblyH5HXgTDRB
   sxYo3FDj69VnzWNdTQLbDdDxC0rsgYb6IzoeP1TDMkfrTmQ+eMAVOmp/O
   EtoopuIfpW+SXRq5bhTW3pO1Y+trpnm43oyOZxt7ENjWf6lfZGhD/WNHf
   2lb80LyUw/2GYKoNmzkuJlwfMb3ccSWJBbT8W/kRITdCS4gb6ClubgF1p
   VMOQNhG2eEoYEqBPmsdbIMH9eaFaq5SjQhGYTK2vtE/IAAYUaXIOD+hJB
   A==;
X-CSE-ConnectionGUID: +kS1t3iVR7Gq1V5VZk+/Mg==
X-CSE-MsgGUID: xBdaE3GaRYSRwk+k4Zcqmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19066167"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="19066167"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 01:39:26 -0700
X-CSE-ConnectionGUID: sEEq58b+T2+arOQpmUUeAg==
X-CSE-MsgGUID: SiMr1BfOTkSKTDPDfa5aYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="56669861"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jul 2024 01:39:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVoZl-000l1X-34;
	Mon, 22 Jul 2024 08:39:21 +0000
Date: Mon, 22 Jul 2024 16:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [linux-next:master 13182/13495] drivers/bluetooth/btusb.c:2720:21:
 warning: assignment to 'struct urb *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202407221627.toIry7kJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dee7f101b64219f512bb2f842227bd04c14efe30
commit: 52828ea60dfdd05246fc92dedfad1c8bbfa2dd66 [13182/13495] Bluetooth: btmtk: Fix btmtk.c undefined reference build error
config: nios2-randconfig-r024-20220113 (https://download.01.org/0day-ci/archive/20240722/202407221627.toIry7kJ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221627.toIry7kJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407221627.toIry7kJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bluetooth/btusb.c: In function 'btusb_mtk_reset':
   drivers/bluetooth/btusb.c:2705:15: error: implicit declaration of function 'btmtk_usb_subsys_reset' [-Werror=implicit-function-declaration]
    2705 |         err = btmtk_usb_subsys_reset(hdev, btmtk_data->dev_id);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btusb.c: In function 'btusb_send_frame_mtk':
   drivers/bluetooth/btusb.c:2720:23: error: implicit declaration of function 'alloc_mtk_intr_urb' [-Werror=implicit-function-declaration]
    2720 |                 urb = alloc_mtk_intr_urb(hdev, skb, btusb_tx_complete);
         |                       ^~~~~~~~~~~~~~~~~~
>> drivers/bluetooth/btusb.c:2720:21: warning: assignment to 'struct urb *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2720 |                 urb = alloc_mtk_intr_urb(hdev, skb, btusb_tx_complete);
         |                     ^
   drivers/bluetooth/btusb.c: In function 'btusb_mtk_setup':
   drivers/bluetooth/btusb.c:2749:16: error: implicit declaration of function 'btmtk_usb_setup' [-Werror=implicit-function-declaration]
    2749 |         return btmtk_usb_setup(hdev);
         |                ^~~~~~~~~~~~~~~
   drivers/bluetooth/btusb.c: In function 'btusb_mtk_shutdown':
   drivers/bluetooth/btusb.c:2760:16: error: implicit declaration of function 'btmtk_usb_shutdown'; did you mean 'btusb_mtk_shutdown'? [-Werror=implicit-function-declaration]
    2760 |         return btmtk_usb_shutdown(hdev);
         |                ^~~~~~~~~~~~~~~~~~
         |                btusb_mtk_shutdown
   drivers/bluetooth/btusb.c: In function 'btusb_probe':
   drivers/bluetooth/btusb.c:3869:34: error: 'btmtk_usb_recv_acl' undeclared (first use in this function); did you mean 'btusb_recv_acl'?
    3869 |                 data->recv_acl = btmtk_usb_recv_acl;
         |                                  ^~~~~~~~~~~~~~~~~~
         |                                  btusb_recv_acl
   drivers/bluetooth/btusb.c:3869:34: note: each undeclared identifier is reported only once for each function it appears in
   drivers/bluetooth/btusb.c:3870:33: error: 'btmtk_usb_suspend' undeclared (first use in this function)
    3870 |                 data->suspend = btmtk_usb_suspend;
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/bluetooth/btusb.c:3871:32: error: 'btmtk_usb_resume' undeclared (first use in this function)
    3871 |                 data->resume = btmtk_usb_resume;
         |                                ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2720 drivers/bluetooth/btusb.c

25b6d7593a3af7 Jing Cai 2023-06-29  2712  
ceac1cb0259de6 Chris Lu 2024-07-04  2713  static int btusb_send_frame_mtk(struct hci_dev *hdev, struct sk_buff *skb)
ceac1cb0259de6 Chris Lu 2024-07-04  2714  {
ceac1cb0259de6 Chris Lu 2024-07-04  2715  	struct urb *urb;
ceac1cb0259de6 Chris Lu 2024-07-04  2716  
ceac1cb0259de6 Chris Lu 2024-07-04  2717  	BT_DBG("%s", hdev->name);
ceac1cb0259de6 Chris Lu 2024-07-04  2718  
ceac1cb0259de6 Chris Lu 2024-07-04  2719  	if (hci_skb_pkt_type(skb) == HCI_ISODATA_PKT) {
ceac1cb0259de6 Chris Lu 2024-07-04 @2720  		urb = alloc_mtk_intr_urb(hdev, skb, btusb_tx_complete);
ceac1cb0259de6 Chris Lu 2024-07-04  2721  		if (IS_ERR(urb))
ceac1cb0259de6 Chris Lu 2024-07-04  2722  			return PTR_ERR(urb);
ceac1cb0259de6 Chris Lu 2024-07-04  2723  
ceac1cb0259de6 Chris Lu 2024-07-04  2724  		return submit_or_queue_tx_urb(hdev, urb);
ceac1cb0259de6 Chris Lu 2024-07-04  2725  	} else {
ceac1cb0259de6 Chris Lu 2024-07-04  2726  		return btusb_send_frame(hdev, skb);
ceac1cb0259de6 Chris Lu 2024-07-04  2727  	}
ceac1cb0259de6 Chris Lu 2024-07-04  2728  }
ceac1cb0259de6 Chris Lu 2024-07-04  2729  

:::::: The code at line 2720 was first introduced by commit
:::::: ceac1cb0259de682d78f5c784ef8e0b13022e9d9 Bluetooth: btusb: mediatek: add ISO data transmission functions

:::::: TO: Chris Lu <chris.lu@mediatek.com>
:::::: CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
