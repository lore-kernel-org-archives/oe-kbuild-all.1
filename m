Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B885A101D7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 09:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688118083; x=1719654083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LI5wxw7YiBFH4Lp3barCY5au6G2xllxi6ssALFdEVmo=;
  b=Juw86iRpsgDKunGy7JvwuxfjvKo+yKcasNe/SOJi+FZjk9Gwrl7wnkww
   vzJ+lzuudKiqy613MARQThov0MatiTqisOTZtZ8cuONyoMZjZpgkPSVQE
   rb//T+e4C4DE5V1ylwAfajSNlfsGNfvBSetURYN6xuZaL5r4fDDPBW69b
   muBuVEpgeygaLfzWqbj4kUFqItSm0GCusAieMNhrA+vkS/evgxAABWl+j
   dp7bFeVelHHmUisfsut5K7Tsyab2bXTeYhPnbnED/oLIdzGRJJniF5nA2
   pMVNhH+8k57d/vKGbX0aSDlv4b51Y16kY00CGsm8qzTD8atjfXMfYfwxP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="448733968"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="448733968"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 02:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="891700004"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="891700004"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Jun 2023 02:41:20 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFAcx-000ErN-1v;
	Fri, 30 Jun 2023 09:41:19 +0000
Date: Fri, 30 Jun 2023 17:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jing Cai <jing.cai@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Chris Lu <chris.lu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [linux-next:master 12628/12815] drivers/bluetooth/btmtk.c:386:44:
 error: 'struct hci_dev' has no member named 'dump'
Message-ID: <202306301756.x8dgyYnL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6352a698ca5bf26a9199202666b16cf741f579f6
commit: 872f8c253cb9e84cb3e7f381dd81c7791c64a05a [12628/12815] Bluetooth: btusb: mediatek: add MediaTek devcoredump support
config: i386-randconfig-i006-20230629 (https://download.01.org/0day-ci/archive/20230630/202306301756.x8dgyYnL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301756.x8dgyYnL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301756.x8dgyYnL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bluetooth/btmtk.c: In function 'btmtk_process_coredump':
>> drivers/bluetooth/btmtk.c:386:44: error: 'struct hci_dev' has no member named 'dump'
     386 |                 schedule_delayed_work(&hdev->dump.dump_timeout,
         |                                            ^~


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
