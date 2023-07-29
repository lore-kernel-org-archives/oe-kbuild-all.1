Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B8D7C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 00:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690591749; x=1722127749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L9ADEIqLDHvOj4BNsm4VLhIm141c5skBSPXStFU6y+4=;
  b=OgOFM1hqwpz33Nd5XIkaaFmB4fSqr1xAnFOKF8xfjAKZgT5vGTgk2Gkj
   shXam1UVnjXL1u9WpceeV6ug/VD6QPUfTtj9J6TAnu9/xMv9YatJlcmsu
   n5sYyC7m1TXxTZmdt8lzz7DwLqPUB+Jl6iBrgMH3qidzhudeORPFnaZOx
   aQkPexishBwQMRlFAvh8tkGA261Y/WQDE0AbrtBjqBFeJuW8UTNYDhdSJ
   KDKS6TEJnJUnYOGI2C7dpS0kYgpy3IC38twTPJ1XSy1QeZyJXXwGFdZ5H
   cCav6PelztT7TEgyjG9d3K0ad85wm92cn5r2t0IBT+tTQ2ofjF3hoRIVd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="366182211"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="366182211"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 17:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="974257496"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="974257496"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2023 17:49:07 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPY8o-0003iJ-2Z;
	Sat, 29 Jul 2023 00:49:06 +0000
Date: Sat, 29 Jul 2023 08:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 5/6] drivers/bluetooth/btusb.c:4022:44:
 error: 'struct hci_dev' has no member named 'dump'
Message-ID: <202307290859.0doURFyt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   da4dc516127926562c5769f640f914a625e6e64f
commit: a594f95abbaa9ad7bbc40a58aa63e9af9fbbd582 [5/6] BACKPORT: FROMGIT: Bluetooth: btusb: mediatek: add MediaTek devcoredump support
config: i386-buildonly-randconfig-r005-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290859.0doURFyt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290859.0doURFyt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290859.0doURFyt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bluetooth/btusb.c: In function 'btmtk_process_coredump':
>> drivers/bluetooth/btusb.c:4022:44: error: 'struct hci_dev' has no member named 'dump'
    4022 |                 schedule_delayed_work(&hdev->dump.dump_timeout,
         |                                            ^~


vim +4022 drivers/bluetooth/btusb.c

  4005	
  4006	int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
  4007	{
  4008		struct btmediatek_data *data = hci_get_priv(hdev);
  4009		int err;
  4010	
  4011		if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
  4012			return 0;
  4013	
  4014		switch (data->cd_info.state) {
  4015		case HCI_DEVCOREDUMP_IDLE:
  4016			err = hci_devcd_init(hdev, MTK_COREDUMP_SIZE);
  4017			if (err < 0)
  4018				break;
  4019			data->cd_info.cnt = 0;
  4020	
  4021			/* It is supposed coredump can be done within 5 seconds */
> 4022			schedule_delayed_work(&hdev->dump.dump_timeout,
  4023					      msecs_to_jiffies(5000));
  4024			fallthrough;
  4025		case HCI_DEVCOREDUMP_ACTIVE:
  4026		default:
  4027			err = hci_devcd_append(hdev, skb);
  4028			if (err < 0)
  4029				break;
  4030			data->cd_info.cnt++;
  4031	
  4032			/* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
  4033			if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
  4034			    skb->len > sizeof(MTK_COREDUMP_END) &&
  4035			    !memcmp((char *)&skb->data[skb->len - sizeof(MTK_COREDUMP_END)],
  4036				    MTK_COREDUMP_END, sizeof(MTK_COREDUMP_END) - 1)) {
  4037				bt_dev_info(hdev, "Mediatek coredump end");
  4038				hci_devcd_complete(hdev);
  4039			}
  4040	
  4041			break;
  4042		}
  4043	
  4044		if (err < 0)
  4045			kfree_skb(skb);
  4046	
  4047		return err;
  4048	}
  4049	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
