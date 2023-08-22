Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3308F20180
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 19:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692733658; x=1724269658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pjax2xsnMKpH20ugfP8NQV8JfsGjOoXSw8EcIcB5Zqs=;
  b=H4QmoRFHKZxCsU259fOxykstYPQ4BoQPTtGUN/4T7wFEhFXhrbR+j6vS
   D3AVxUy4+VwRIOhzfHj25a1tvxuIu7FUhlxiebEBf6An5tncWuvCHAYnm
   TPn0hjXlozs2TmZx79ne+CREC+eTBfovnlyVdKzFodTmdn9N7gSzNtFX1
   gt5mrC+XtDdwp9HkdNnx880Fhhr7oHq+MuFCO8hzdnL4sQoExo98+KKkm
   9TYjYwvrpXT1E5DeswTf2XNRLbGVxRqOWnlxq4nk9HGTXQsPziaD5sgK5
   uaGzEVBE/qCvVMNqV4OT/MReEUCYuGBYxpzSV+xksEnN7mH6rTa/uKEIF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440346205"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="440346205"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 12:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880090872"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2023 12:45:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYXK1-0000UU-0D;
	Tue, 22 Aug 2023 19:45:49 +0000
Date: Wed, 23 Aug 2023 03:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-v6.5-rc7 90/129]
 drivers/bluetooth/btqca.c:213:13: warning: variable 'bid_len' set but not
 used
Message-ID: <202308230303.lR6YCqeP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.5-rc7
head:   68f425346397c1806f828d4ee58e9468c924f408
commit: 8c7ca562bd5afddf0cb49f70f2bdbac24d078e9b [90/129] hack: bluetooth: add way to generate nvm name
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230823/202308230303.lR6YCqeP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230303.lR6YCqeP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230303.lR6YCqeP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bluetooth/btqca.c: In function 'qca_read_fw_board_id':
>> drivers/bluetooth/btqca.c:213:13: warning: variable 'bid_len' set but not used [-Wunused-but-set-variable]
     213 |         int bid_len, err = 0;
         |             ^~~~~~~


vim +/bid_len +213 drivers/bluetooth/btqca.c

   207	
   208	static int qca_read_fw_board_id(struct hci_dev *hdev, u16 *bid)
   209	{
   210		u8 cmd;
   211		struct sk_buff *skb;
   212		struct edl_event_hdr *edl;
 > 213		int bid_len, err = 0;
   214	
   215		cmd = EDL_GET_BID_REQ_CMD;
   216		skb = __hci_cmd_sync_ev(hdev, EDL_PATCH_CMD_OPCODE, EDL_PATCH_CMD_LEN,
   217					&cmd, 0, HCI_INIT_TIMEOUT);
   218		if (IS_ERR(skb)) {
   219			err = PTR_ERR(skb);
   220			bt_dev_err(hdev, "Reading QCA board ID failed (%d)", err);
   221			return err;
   222		}
   223	
   224		edl = skb_pull_data(skb, sizeof(*edl));
   225		if (!edl) {
   226			bt_dev_err(hdev, "QCA read board ID with no header");
   227			err = -EILSEQ;
   228			goto out;
   229		}
   230	
   231		if (edl->cresp != EDL_CMD_REQ_RES_EVT ||
   232		    edl->rtype != EDL_GET_BID_REQ_CMD) {
   233			bt_dev_err(hdev, "QCA Wrong packet received %d %d", edl->cresp,
   234				   edl->rtype);
   235			err = -EIO;
   236			goto out;
   237		}
   238	
   239		bid_len = edl->data[0];
   240		*bid = (edl->data[1] << 8) + edl->data[2];
   241	
   242	out:
   243		kfree_skb(skb);
   244		return err;
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
