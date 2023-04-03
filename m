Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA17920F2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680511317; x=1712047317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FJuxCZ0WVpBX6b/MwZ59et0nGn0B3/YO9K92SJBQCxw=;
  b=ivjjZz6w/I08susC4FnwlrFOCnqi7ET3SJLxTG9VziVy82EPa9cpg7af
   8WlgrbIZZ1cpRtzr0Um59au2uArtI59ae+hjRl8P7tFrBfyqSweV3Ua1J
   VDGva7qhdrECstiLFHieDuZejtp1g3gSwVXbnDmt6+hOhLVd41M4qTk+R
   5D+7S/voL66se1t56zCvVdmWPdzAHTzShLF0GMq25vpnGASDqOvGXBtKc
   hSICljggtGgenPuoaV9/6xdbhGPsO/eImVsmnff9pJXMiE/5WULSPFC61
   OrQq51Xhq4f5IlAzRm7/BlS8/GFJk4K3Frj5OIVYc5D8MrrR/Y+Z+PYQC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="322239908"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="322239908"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 01:41:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="829486311"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="829486311"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2023 01:41:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjFlD-000O7M-1f;
	Mon, 03 Apr 2023 08:41:55 +0000
Date: Mon, 3 Apr 2023 16:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-v6.3-rc5 135/135]
 drivers/bluetooth/btqca.c:213:13: warning: variable 'bid_len' set but not
 used
Message-ID: <202304031642.OTiP6EDc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-v6.3-rc5
head:   ee224cf83591932b3feee75abc3f47dd2bca717a
commit: ee224cf83591932b3feee75abc3f47dd2bca717a [135/135] hack: bluetooth: add way to generate nvm name
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230403/202304031642.OTiP6EDc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/ee224cf83591932b3feee75abc3f47dd2bca717a
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev lenovo-x13s-linux-v6.3-rc5
        git checkout ee224cf83591932b3feee75abc3f47dd2bca717a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304031642.OTiP6EDc-lkp@intel.com/

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
https://github.com/intel/lkp-tests
