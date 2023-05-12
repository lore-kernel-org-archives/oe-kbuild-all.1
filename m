Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979423D4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 19:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683920399; x=1715456399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=grAa2qaGQOaETh8+zQ4FUbXCqXrC0UZItK57u95/1as=;
  b=VFZvP9RnK9vI4zdq2MRIFdpY8vrPd5Qo+BRbakuIxpqMO9vTjiRbWKAC
   LN8yx2ndzVmqWbYY1sKVbnhQ8iVaEXgA/SDqiC6zztPJmMEvG1R1xI4fY
   eo2OyFrEJrEzncKkOe8yv5NCZuYtEQgxN1BEbGIm6cuVagvNNcL8jQdqz
   vbnalfA2LtEynSN5NkuM5ZwNkuLhUDzFx+m0aw/083mgL9QprYBIzZX07
   HAV9ESBrsqAhSz0tcVG7Y61rele/jHRHpps4H5vTlenKlz69zJeWs6NZB
   Js0/j3yyMG/thLC08drKzHDrxW3D5gx2tFWnihYxwmfIkkltELKsqz53+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335394061"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335394061"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 12:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="694351037"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="694351037"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 May 2023 12:39:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxYcM-00054U-2M;
	Fri, 12 May 2023 19:39:54 +0000
Date: Sat, 13 May 2023 03:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-v6.4-rc1 36/75]
 drivers/bluetooth/btqca.c:213:13: warning: variable 'bid_len' set but not
 used
Message-ID: <202305130327.j7DX9vH6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-v6.4-rc1
head:   c21852de0707e288758a66abd20be244545a7ba9
commit: ac8e4423337c4f31fefa8588d48465a1c86d2647 [36/75] hack: bluetooth: add way to generate nvm name
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230513/202305130327.j7DX9vH6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/ac8e4423337c4f31fefa8588d48465a1c86d2647
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev lenovo-x13s-linux-v6.4-rc1
        git checkout ac8e4423337c4f31fefa8588d48465a1c86d2647
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130327.j7DX9vH6-lkp@intel.com/

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
