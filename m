Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A1136A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 04:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681360597; x=1712896597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9N+xqRWgYucnqL6vYrJaCK65ML9CW0+yGs9Q4s0tQ5E=;
  b=WHRLlbDbXv0EbKuHpH2pg7OoAICpeVeG4vYKuTTpPxtLTp5azLqOJWci
   U0H3wVP0KoYwGcGHrFd0qu5vxs5hJ24AusbNhFL+33kBdOQV8sJHUpTBg
   FjkjzepxjHOZEvkAwrjmbSdQgZI29XQdXt6l/ziDo5gjCk/cpKJ36jdmJ
   RuU4OUyJkeLauaoonDR8REo63NklWHXZEyMyEVdjVwAWoXdzIS3Fyk2IZ
   /D9kLYOFMZiw1xg1JM8rHwi5IQlCb/L3Sri+ZxyVGQnJYoe2HVUIByE6x
   zphXhCbobeRjlm/gtzg2gld55YJFAnO9wlreXpu85Wk6SaxsFHCB60x2v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430372749"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="430372749"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 21:36:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800614999"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="800614999"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2023 21:36:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmohG-000YLV-0z;
	Thu, 13 Apr 2023 04:36:34 +0000
Date: Thu, 13 Apr 2023 12:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [linux-next:master 9709/10976] drivers/bluetooth/btnxpuart.c:681:23:
 sparse: sparse: restricted __le16 degrades to integer
Message-ID: <202304131223.GJIL0iyK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d8214bba44c1aa6a75921a09a691945d26a8d43
commit: 2e9632009158054bcb6c1766c6748476db0561a0 [9709/10976] Bluetooth: NXP: Add protocol support for NXP Bluetooth chipsets
config: nios2-randconfig-s032-20230413 (https://download.01.org/0day-ci/archive/20230413/202304131223.GJIL0iyK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2e9632009158054bcb6c1766c6748476db0561a0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2e9632009158054bcb6c1766c6748476db0561a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304131223.GJIL0iyK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btnxpuart.c:681:23: sparse: sparse: restricted __le16 degrades to integer
>> drivers/bluetooth/btnxpuart.c:690:82: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] req_len @@     got restricted __le16 [usertype] len @@
   drivers/bluetooth/btnxpuart.c:690:82: sparse:     expected unsigned short [usertype] req_len
   drivers/bluetooth/btnxpuart.c:690:82: sparse:     got restricted __le16 [usertype] len
   drivers/bluetooth/btnxpuart.c:694:84: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] req_len @@     got restricted __le16 [usertype] len @@
   drivers/bluetooth/btnxpuart.c:694:84: sparse:     expected unsigned short [usertype] req_len
   drivers/bluetooth/btnxpuart.c:694:84: sparse:     got restricted __le16 [usertype] len
>> drivers/bluetooth/btnxpuart.c:708:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] requested_len @@     got restricted __le16 [usertype] len @@
   drivers/bluetooth/btnxpuart.c:708:23: sparse:     expected unsigned int [usertype] requested_len
   drivers/bluetooth/btnxpuart.c:708:23: sparse:     got restricted __le16 [usertype] len
>> drivers/bluetooth/btnxpuart.c:787:78: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] chipid @@     got restricted __le16 [usertype] chip_id @@
   drivers/bluetooth/btnxpuart.c:787:78: sparse:     expected unsigned short [usertype] chipid
   drivers/bluetooth/btnxpuart.c:787:78: sparse:     got restricted __le16 [usertype] chip_id
   drivers/bluetooth/btnxpuart.c:810:74: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] req_len @@     got restricted __le16 [usertype] len @@
   drivers/bluetooth/btnxpuart.c:810:74: sparse:     expected unsigned short [usertype] req_len
   drivers/bluetooth/btnxpuart.c:810:74: sparse:     got restricted __le16 [usertype] len
   drivers/bluetooth/btnxpuart.c:815:76: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] req_len @@     got restricted __le16 [usertype] len @@
   drivers/bluetooth/btnxpuart.c:815:76: sparse:     expected unsigned short [usertype] req_len
   drivers/bluetooth/btnxpuart.c:815:76: sparse:     got restricted __le16 [usertype] len
>> drivers/bluetooth/btnxpuart.c:834:16: sparse: sparse: restricted __le32 degrades to integer
   drivers/bluetooth/btnxpuart.c:843:55: sparse: sparse: restricted __le32 degrades to integer
>> drivers/bluetooth/btnxpuart.c:844:36: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] @@     got restricted __le16 [usertype] len @@
   drivers/bluetooth/btnxpuart.c:844:36: sparse:     expected unsigned int [usertype]
   drivers/bluetooth/btnxpuart.c:844:36: sparse:     got restricted __le16 [usertype] len
   drivers/bluetooth/btnxpuart.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini

vim +681 drivers/bluetooth/btnxpuart.c

   665	
   666	/* for legacy chipsets with V1 bootloader */
   667	static int nxp_recv_fw_req_v1(struct hci_dev *hdev, struct sk_buff *skb)
   668	{
   669		struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
   670		struct btnxpuart_data *nxp_data = nxpdev->nxp_data;
   671		struct v1_data_req *req;
   672		u32 requested_len;
   673	
   674		if (!process_boot_signature(nxpdev))
   675			goto free_skb;
   676	
   677		req = (struct v1_data_req *)skb_pull_data(skb, sizeof(struct v1_data_req));
   678		if (!req)
   679			goto free_skb;
   680	
 > 681		if ((req->len ^ req->len_comp) != 0xffff) {
   682			bt_dev_dbg(hdev, "ERR: Send NAK");
   683			nxp_send_ack(NXP_NAK_V1, hdev);
   684			goto free_skb;
   685		}
   686		nxp_send_ack(NXP_ACK_V1, hdev);
   687	
   688		if (nxp_data->fw_download_3M_baudrate) {
   689			if (!nxpdev->timeout_changed) {
 > 690				nxpdev->timeout_changed = nxp_fw_change_timeout(hdev, req->len);
   691				goto free_skb;
   692			}
   693			if (!nxpdev->baudrate_changed) {
   694				nxpdev->baudrate_changed = nxp_fw_change_baudrate(hdev, req->len);
   695				if (nxpdev->baudrate_changed) {
   696					serdev_device_set_baudrate(nxpdev->serdev,
   697								   HCI_NXP_SEC_BAUDRATE);
   698					serdev_device_set_flow_control(nxpdev->serdev, 1);
   699					nxpdev->current_baudrate = HCI_NXP_SEC_BAUDRATE;
   700				}
   701				goto free_skb;
   702			}
   703		}
   704	
   705		if (nxp_request_firmware(hdev, nxp_data->fw_name))
   706			goto free_skb;
   707	
 > 708		requested_len = req->len;
   709		if (requested_len == 0) {
   710			bt_dev_dbg(hdev, "FW Downloaded Successfully: %zu bytes", nxpdev->fw->size);
   711			clear_bit(BTNXPUART_FW_DOWNLOADING, &nxpdev->tx_state);
   712			wake_up_interruptible(&nxpdev->fw_dnld_done_wait_q);
   713			goto free_skb;
   714		}
   715		if (requested_len & 0x01) {
   716			/* The CRC did not match at the other end.
   717			 * Simply send the same bytes again.
   718			 */
   719			requested_len = nxpdev->fw_v1_sent_bytes;
   720			bt_dev_dbg(hdev, "CRC error. Resend %d bytes of FW.", requested_len);
   721		} else {
   722			nxpdev->fw_dnld_v1_offset += nxpdev->fw_v1_sent_bytes;
   723	
   724			/* The FW bin file is made up of many blocks of
   725			 * 16 byte header and payload data chunks. If the
   726			 * FW has requested a header, read the payload length
   727			 * info from the header, before sending the header.
   728			 * In the next iteration, the FW should request the
   729			 * payload data chunk, which should be equal to the
   730			 * payload length read from header. If there is a
   731			 * mismatch, clearly the driver and FW are out of sync,
   732			 * and we need to re-send the previous header again.
   733			 */
   734			if (requested_len == nxpdev->fw_v1_expected_len) {
   735				if (requested_len == HDR_LEN)
   736					nxpdev->fw_v1_expected_len = nxp_get_data_len(nxpdev->fw->data +
   737										nxpdev->fw_dnld_v1_offset);
   738				else
   739					nxpdev->fw_v1_expected_len = HDR_LEN;
   740			} else if (requested_len == HDR_LEN) {
   741				/* FW download out of sync. Send previous chunk again */
   742				nxpdev->fw_dnld_v1_offset -= nxpdev->fw_v1_sent_bytes;
   743				nxpdev->fw_v1_expected_len = HDR_LEN;
   744			}
   745		}
   746	
   747		if (nxpdev->fw_dnld_v1_offset + requested_len <= nxpdev->fw->size)
   748			serdev_device_write_buf(nxpdev->serdev,
   749						nxpdev->fw->data + nxpdev->fw_dnld_v1_offset,
   750						requested_len);
   751		nxpdev->fw_v1_sent_bytes = requested_len;
   752	
   753	free_skb:
   754		kfree_skb(skb);
   755		return 0;
   756	}
   757	
   758	static char *nxp_get_fw_name_from_chipid(struct hci_dev *hdev, u16 chipid)
   759	{
   760		char *fw_name = NULL;
   761	
   762		switch (chipid) {
   763		case CHIP_ID_W9098:
   764			fw_name = FIRMWARE_W9098;
   765			break;
   766		case CHIP_ID_IW416:
   767			fw_name = FIRMWARE_IW416;
   768			break;
   769		case CHIP_ID_IW612:
   770			fw_name = FIRMWARE_IW612;
   771			break;
   772		default:
   773			bt_dev_err(hdev, "Unknown chip signature %04x", chipid);
   774			break;
   775		}
   776		return fw_name;
   777	}
   778	
   779	static int nxp_recv_chip_ver_v3(struct hci_dev *hdev, struct sk_buff *skb)
   780	{
   781		struct v3_start_ind *req = skb_pull_data(skb, sizeof(struct v3_start_ind));
   782		struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
   783	
   784		if (!process_boot_signature(nxpdev))
   785			goto free_skb;
   786	
 > 787		if (!nxp_request_firmware(hdev, nxp_get_fw_name_from_chipid(hdev, req->chip_id)))
   788			nxp_send_ack(NXP_ACK_V3, hdev);
   789	
   790	free_skb:
   791		kfree_skb(skb);
   792		return 0;
   793	}
   794	
   795	static int nxp_recv_fw_req_v3(struct hci_dev *hdev, struct sk_buff *skb)
   796	{
   797		struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
   798		struct v3_data_req *req;
   799	
   800		if (!process_boot_signature(nxpdev))
   801			goto free_skb;
   802	
   803		req = (struct v3_data_req *)skb_pull_data(skb, sizeof(struct v3_data_req));
   804		if (!req || !nxpdev->fw)
   805			goto free_skb;
   806	
   807		nxp_send_ack(NXP_ACK_V3, hdev);
   808	
   809		if (!nxpdev->timeout_changed) {
   810			nxpdev->timeout_changed = nxp_fw_change_timeout(hdev, req->len);
   811			goto free_skb;
   812		}
   813	
   814		if (!nxpdev->baudrate_changed) {
   815			nxpdev->baudrate_changed = nxp_fw_change_baudrate(hdev, req->len);
   816			if (nxpdev->baudrate_changed) {
   817				serdev_device_set_baudrate(nxpdev->serdev,
   818							   HCI_NXP_SEC_BAUDRATE);
   819				serdev_device_set_flow_control(nxpdev->serdev, 1);
   820				nxpdev->current_baudrate = HCI_NXP_SEC_BAUDRATE;
   821			}
   822			goto free_skb;
   823		}
   824	
   825		if (req->len == 0) {
   826			bt_dev_dbg(hdev, "FW Downloaded Successfully: %zu bytes", nxpdev->fw->size);
   827			clear_bit(BTNXPUART_FW_DOWNLOADING, &nxpdev->tx_state);
   828			wake_up_interruptible(&nxpdev->fw_dnld_done_wait_q);
   829			goto free_skb;
   830		}
   831		if (req->error)
   832			bt_dev_dbg(hdev, "FW Download received err 0x%02x from chip", req->error);
   833	
 > 834		if (req->offset < nxpdev->fw_v3_offset_correction) {
   835			/* This scenario should ideally never occur. But if it ever does,
   836			 * FW is out of sync and needs a power cycle.
   837			 */
   838			bt_dev_err(hdev, "Something went wrong during FW download. Please power cycle and try again");
   839			goto free_skb;
   840		}
   841	
   842		serdev_device_write_buf(nxpdev->serdev,
   843					nxpdev->fw->data + req->offset - nxpdev->fw_v3_offset_correction,
 > 844					req->len);
   845	
   846	free_skb:
   847		kfree_skb(skb);
   848		return 0;
   849	}
   850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
