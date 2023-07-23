Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE6D3D9E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 20:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690144470; x=1721680470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/Qk392DPpAYDPoqr1Sj82xCVm55hNl/XAxHNYrNRuo=;
  b=NeZekqCC/v5MTBvD8Ngj4kzg8TYgcqj8/SPu4iCxK+gcjN4pJXSq3gJt
   maOw9444rYL0Z6zoXYpXjBT5xnNNSov6yqkCguLSJQOigqHzwyvLFkVyj
   POP+VPZ1KihTXCGfCVRxjdcdSJ3LgedLCF76suem+OIOmSjv2J2fFmytf
   5BesbZvJo+Ees8rWSprX+3TnNTH8LkfeHB3+0JNoy1V/3K3AsIg8XjYgL
   z9X462hLPJz4c1QPYzfN5jvfEpp1ET4/A5XKodaMrykCjMNf3w99EUI6w
   uWuP0hcpnmIoYYwrVTjfl2kdVsgkGGF65uFo1rP4gl5CCsg9fR8DhiNz4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="347591601"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="347591601"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 13:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="815594624"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="815594624"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jul 2023 13:34:28 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNflx-0009FR-0j;
	Sun, 23 Jul 2023 20:34:09 +0000
Date: Mon, 24 Jul 2023 04:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 49/65] drivers/bluetooth/btmtk.c:386:32:
 error: no member named 'dump' in 'struct hci_dev'
Message-ID: <202307240433.mYmwmS3I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   af53c92e966cedf9c5d59bde5b183bbd2dda321e
commit: 4be20253e1a774fd8e63f66f62e3298d8d14944b [49/65] BACKPORT: FROMGIT: Bluetooth: btusb: mediatek: add MediaTek devcoredump support
config: x86_64-randconfig-x016-20230723 (https://download.01.org/0day-ci/archive/20230724/202307240433.mYmwmS3I-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240433.mYmwmS3I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240433.mYmwmS3I-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/btmtk.c:386:32: error: no member named 'dump' in 'struct hci_dev'
                   schedule_delayed_work(&hdev->dump.dump_timeout,
                                          ~~~~  ^
   1 error generated.


vim +386 drivers/bluetooth/btmtk.c

   369	
   370	int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
   371	{
   372		struct btmediatek_data *data = hci_get_priv(hdev);
   373		int err;
   374	
   375		if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
   376			return 0;
   377	
   378		switch (data->cd_info.state) {
   379		case HCI_DEVCOREDUMP_IDLE:
   380			err = hci_devcd_init(hdev, MTK_COREDUMP_SIZE);
   381			if (err < 0)
   382				break;
   383			data->cd_info.cnt = 0;
   384	
   385			/* It is supposed coredump can be done within 5 seconds */
 > 386			schedule_delayed_work(&hdev->dump.dump_timeout,
   387					      msecs_to_jiffies(5000));
   388			fallthrough;
   389		case HCI_DEVCOREDUMP_ACTIVE:
   390		default:
   391			err = hci_devcd_append(hdev, skb);
   392			if (err < 0)
   393				break;
   394			data->cd_info.cnt++;
   395	
   396			/* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
   397			if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
   398			    skb->len > sizeof(MTK_COREDUMP_END) &&
   399			    !memcmp((char *)&skb->data[skb->len - sizeof(MTK_COREDUMP_END)],
   400				    MTK_COREDUMP_END, sizeof(MTK_COREDUMP_END) - 1)) {
   401				bt_dev_info(hdev, "Mediatek coredump end");
   402				hci_devcd_complete(hdev);
   403			}
   404	
   405			break;
   406		}
   407	
   408		if (err < 0)
   409			kfree_skb(skb);
   410	
   411		return err;
   412	}
   413	EXPORT_SYMBOL_GPL(btmtk_process_coredump);
   414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
