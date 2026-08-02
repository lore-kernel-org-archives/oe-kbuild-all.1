Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A458319049B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Aug 2026 01:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785634006; cv=none; b=FmdBboxrWsDUpQdl9cLANVKDOJ/T/7EUM+IVRvTwcCnKyR91rk9ESF4uwFwHA0hX8qqlH5eO3IWBE3+T19wFaLf7fM9dELKrlprGuAZjwWfkiRLyKmOL8fwtfZGNVy0xSfif4S7zgvvoW8ZiEeAT/73UcqLWp+wX1g2H639mrMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785634006; c=relaxed/simple;
	bh=2Fejh4wFauaIjhaKmUMr+7y5TiRLcK4IYsmrxapvV7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EVHzqArUmGdaph/BLW/784EhXF196ng8qLA06T7b2YXXDDNlZj/Gs25YHUGdTI3jagWLhgK/uD1tzj77RlNNLALBGGkwhfRhS3CJby6f4uM0Itf2/vi7LKoK3b4vgkwOfwdtHTdnyNA2jGkHEuQd7Bt3XwvTJ4Z0rntgTpYeujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwpWEiEr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwpWEiEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785634004; x=1817170004;
  h=date:from:to:cc:subject:message-id;
  bh=2Fejh4wFauaIjhaKmUMr+7y5TiRLcK4IYsmrxapvV7U=;
  b=FwpWEiEr4mnqsTjIjSxFjPttGZrQfIJg5ZldT2bsMpnoBjyj7mdRSZwh
   fJ95KtZayoDvsKK4fxBBst3BfTzCjBVObvGe806WMcsxck5Fj2H3CjJLc
   0srikw1EUQfrud+ulqRb927r0svE+keJpiMFfshrV/VcC6UEzcdcnn5Hl
   pMlZshSMB8SuZ0BYxFJAbBDw1sCEymAwsaJPn73a4zZappc74fPHuZFiQ
   QaSDGbTwfwdSCMgricExeS/yYcMKPf5pKD0LqQX5ea178JCP++ecEMSHD
   lvBhJdBWv0pjGdbu1dCpcteNgA91Fg2QSXw9DYNKgvTPiLbturCQFvkWv
   A==;
X-CSE-ConnectionGUID: e99BRb+jQRiSkZBs89ZAzg==
X-CSE-MsgGUID: rRW+sLC+Qyuymh3Cu+k1tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86334829"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="86334829"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 18:26:44 -0700
X-CSE-ConnectionGUID: Jff9TPjNS+KoqP9VLE37rg==
X-CSE-MsgGUID: VvgClqlEQ/SXaaLln4pq9A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Aug 2026 18:26:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqKyO-000000004Dh-0w3C;
	Sun, 02 Aug 2026 01:26:40 +0000
Date: Sun, 02 Aug 2026 09:25:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 drivers/bluetooth/btmtk.c:530:undefined reference to `usb_alloc_urb'
Message-ID: <202608020929.r5rAT1Va-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   48ec18d8aae4ffdfb99910b9ee865bcb0b57eab2
commit: f0457842215438786e2e205ad06a4fbb8ab63cd0 [0/1] Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c
config: x86_64-buildonly-randconfig-001-20260802 (https://download.01.org/0day-ci/archive/20260802/202608020929.r5rAT1Va-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020929.r5rAT1Va-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020929.r5rAT1Va-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
>> drivers/bluetooth/btmtk.c:530:(.text+0x4b9): undefined reference to `usb_alloc_urb'
>> ld: drivers/bluetooth/btmtk.c:536:(.text+0x502): undefined reference to `usb_free_urb'
>> ld: drivers/bluetooth/btmtk.c:560:(.text+0x5b2): undefined reference to `usb_anchor_urb'
>> ld: drivers/bluetooth/btmtk.c:561:(.text+0x5bf): undefined reference to `usb_submit_urb'
>> ld: drivers/bluetooth/btmtk.c:566:(.text+0x5fe): undefined reference to `usb_unanchor_urb'
   ld: drivers/bluetooth/btmtk.c:569:(.text+0x606): undefined reference to `usb_free_urb'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
>> drivers/bluetooth/btmtk.c:507:(.text+0x8f8): undefined reference to `usb_anchor_urb'
   ld: drivers/bluetooth/btmtk.c:508:(.text+0x905): undefined reference to `usb_submit_urb'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_hci_wmt_sync':
>> drivers/bluetooth/btmtk.c:609:(.text+0xc87): undefined reference to `usb_autopm_get_interface'
>> ld: drivers/bluetooth/btmtk.c:617:(.text+0xcc1): undefined reference to `usb_autopm_put_interface'
   ld: drivers/bluetooth/btmtk.c:624:(.text+0xcdd): undefined reference to `usb_autopm_put_interface'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
>> drivers/bluetooth/btmtk.c:517:(.text+0x957): undefined reference to `usb_unanchor_urb'


vim +530 drivers/bluetooth/btmtk.c

   438	
   439	static void btmtk_usb_wmt_recv(struct urb *urb)
   440	{
   441		struct hci_dev *hdev = urb->context;
   442		struct btmtk_data *data = hci_get_priv(hdev);
   443		struct sk_buff *skb;
   444		int err;
   445	
   446		if (urb->status == 0 && urb->actual_length > 0) {
   447			hdev->stat.byte_rx += urb->actual_length;
   448	
   449			/* WMT event shouldn't be fragmented and the size should be
   450			 * less than HCI_WMT_MAX_EVENT_SIZE.
   451			 */
   452			skb = bt_skb_alloc(HCI_WMT_MAX_EVENT_SIZE, GFP_ATOMIC);
   453			if (!skb) {
   454				hdev->stat.err_rx++;
   455				kfree(urb->setup_packet);
   456				return;
   457			}
   458	
   459			hci_skb_pkt_type(skb) = HCI_EVENT_PKT;
   460			skb_put_data(skb, urb->transfer_buffer, urb->actual_length);
   461	
   462			/* When someone waits for the WMT event, the skb is being cloned
   463			 * and being processed the events from there then.
   464			 */
   465			if (test_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags)) {
   466				data->evt_skb = skb_clone(skb, GFP_ATOMIC);
   467				if (!data->evt_skb) {
   468					kfree_skb(skb);
   469					kfree(urb->setup_packet);
   470					return;
   471				}
   472			}
   473	
   474			err = hci_recv_frame(hdev, skb);
   475			if (err < 0) {
   476				kfree_skb(data->evt_skb);
   477				data->evt_skb = NULL;
   478				kfree(urb->setup_packet);
   479				return;
   480			}
   481	
   482			if (test_and_clear_bit(BTMTK_TX_WAIT_VND_EVT,
   483					       &data->flags)) {
   484				/* Barrier to sync with other CPUs */
   485				smp_mb__after_atomic();
   486				wake_up_bit(&data->flags,
   487					    BTMTK_TX_WAIT_VND_EVT);
   488			}
   489			kfree(urb->setup_packet);
   490			return;
   491		} else if (urb->status == -ENOENT) {
   492			/* Avoid suspend failed when usb_kill_urb */
   493			return;
   494		}
   495	
   496		usb_mark_last_busy(data->udev);
   497	
   498		/* The URB complete handler is still called with urb->actual_length = 0
   499		 * when the event is not available, so we should keep re-submitting
   500		 * URB until WMT event returns, Also, It's necessary to wait some time
   501		 * between the two consecutive control URBs to relax the target device
   502		 * to generate the event. Otherwise, the WMT event cannot return from
   503		 * the device successfully.
   504		 */
   505		udelay(500);
   506	
 > 507		usb_anchor_urb(urb, data->ctrl_anchor);
   508		err = usb_submit_urb(urb, GFP_ATOMIC);
   509		if (err < 0) {
   510			kfree(urb->setup_packet);
   511			/* -EPERM: urb is being killed;
   512			 * -ENODEV: device got disconnected
   513			 */
   514			if (err != -EPERM && err != -ENODEV)
   515				bt_dev_err(hdev, "urb %p failed to resubmit (%d)",
   516					   urb, -err);
 > 517			usb_unanchor_urb(urb);
   518		}
   519	}
   520	
   521	static int btmtk_usb_submit_wmt_recv_urb(struct hci_dev *hdev)
   522	{
   523		struct btmtk_data *data = hci_get_priv(hdev);
   524		struct usb_ctrlrequest *dr;
   525		unsigned char *buf;
   526		int err, size = 64;
   527		unsigned int pipe;
   528		struct urb *urb;
   529	
 > 530		urb = usb_alloc_urb(0, GFP_KERNEL);
   531		if (!urb)
   532			return -ENOMEM;
   533	
   534		dr = kmalloc(sizeof(*dr), GFP_KERNEL);
   535		if (!dr) {
 > 536			usb_free_urb(urb);
   537			return -ENOMEM;
   538		}
   539	
   540		dr->bRequestType = USB_TYPE_VENDOR | USB_DIR_IN;
   541		dr->bRequest     = 1;
   542		dr->wIndex       = cpu_to_le16(0);
   543		dr->wValue       = cpu_to_le16(48);
   544		dr->wLength      = cpu_to_le16(size);
   545	
   546		buf = kmalloc(size, GFP_KERNEL);
   547		if (!buf) {
   548			kfree(dr);
   549			usb_free_urb(urb);
   550			return -ENOMEM;
   551		}
   552	
   553		pipe = usb_rcvctrlpipe(data->udev, 0);
   554	
   555		usb_fill_control_urb(urb, data->udev, pipe, (void *)dr,
   556				     buf, size, btmtk_usb_wmt_recv, hdev);
   557	
   558		urb->transfer_flags |= URB_FREE_BUFFER;
   559	
 > 560		usb_anchor_urb(urb, data->ctrl_anchor);
 > 561		err = usb_submit_urb(urb, GFP_KERNEL);
   562		if (err < 0) {
   563			if (err != -EPERM && err != -ENODEV)
   564				bt_dev_err(hdev, "urb %p submission failed (%d)",
   565					   urb, -err);
 > 566			usb_unanchor_urb(urb);
   567		}
   568	
 > 569		usb_free_urb(urb);
   570	
   571		return err;
   572	}
   573	
   574	int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
   575				   struct btmtk_hci_wmt_params *wmt_params)
   576	{
   577		struct btmtk_data *data = hci_get_priv(hdev);
   578		struct btmtk_hci_wmt_evt_funcc *wmt_evt_funcc;
   579		u32 hlen, status = BTMTK_WMT_INVALID;
   580		struct btmtk_hci_wmt_evt *wmt_evt;
   581		struct btmtk_hci_wmt_cmd *wc;
   582		struct btmtk_wmt_hdr *hdr;
   583		int err;
   584	
   585		/* Send the WMT command and wait until the WMT event returns */
   586		hlen = sizeof(*hdr) + wmt_params->dlen;
   587		if (hlen > 255)
   588			return -EINVAL;
   589	
   590		wc = kzalloc(hlen, GFP_KERNEL);
   591		if (!wc)
   592			return -ENOMEM;
   593	
   594		hdr = &wc->hdr;
   595		hdr->dir = 1;
   596		hdr->op = wmt_params->op;
   597		hdr->dlen = cpu_to_le16(wmt_params->dlen + 1);
   598		hdr->flag = wmt_params->flag;
   599		memcpy(wc->data, wmt_params->data, wmt_params->dlen);
   600	
   601		set_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
   602	
   603		/* WMT cmd/event doesn't follow up the generic HCI cmd/event handling,
   604		 * it needs constantly polling control pipe until the host received the
   605		 * WMT event, thus, we should require to specifically acquire PM counter
   606		 * on the USB to prevent the interface from entering auto suspended
   607		 * while WMT cmd/event in progress.
   608		 */
 > 609		err = usb_autopm_get_interface(data->intf);
   610		if (err < 0)
   611			goto err_free_wc;
   612	
   613		err = __hci_cmd_send(hdev, 0xfc6f, hlen, wc);
   614	
   615		if (err < 0) {
   616			clear_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
 > 617			usb_autopm_put_interface(data->intf);
   618			goto err_free_wc;
   619		}
   620	
   621		/* Submit control IN URB on demand to process the WMT event */
   622		err = btmtk_usb_submit_wmt_recv_urb(hdev);
   623	
   624		usb_autopm_put_interface(data->intf);
   625	
   626		if (err < 0)
   627			goto err_free_wc;
   628	
   629		/* The vendor specific WMT commands are all answered by a vendor
   630		 * specific event and will have the Command Status or Command
   631		 * Complete as with usual HCI command flow control.
   632		 *
   633		 * After sending the command, wait for BTUSB_TX_WAIT_VND_EVT
   634		 * state to be cleared. The driver specific event receive routine
   635		 * will clear that state and with that indicate completion of the
   636		 * WMT command.
   637		 */
   638		err = wait_on_bit_timeout(&data->flags, BTMTK_TX_WAIT_VND_EVT,
   639					  TASK_INTERRUPTIBLE, HCI_INIT_TIMEOUT);
   640		if (err == -EINTR) {
   641			bt_dev_err(hdev, "Execution of wmt command interrupted");
   642			clear_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
   643			goto err_free_wc;
   644		}
   645	
   646		if (err) {
   647			bt_dev_err(hdev, "Execution of wmt command timed out");
   648			clear_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
   649			err = -ETIMEDOUT;
   650			goto err_free_wc;
   651		}
   652	
   653		if (data->evt_skb == NULL)
   654			goto err_free_wc;
   655	
   656		/* Parse and handle the return WMT event */
   657		wmt_evt = (struct btmtk_hci_wmt_evt *)data->evt_skb->data;
   658		if (wmt_evt->whdr.op != hdr->op) {
   659			bt_dev_err(hdev, "Wrong op received %d expected %d",
   660				   wmt_evt->whdr.op, hdr->op);
   661			err = -EIO;
   662			goto err_free_skb;
   663		}
   664	
   665		switch (wmt_evt->whdr.op) {
   666		case BTMTK_WMT_SEMAPHORE:
   667			if (wmt_evt->whdr.flag == 2)
   668				status = BTMTK_WMT_PATCH_UNDONE;
   669			else
   670				status = BTMTK_WMT_PATCH_DONE;
   671			break;
   672		case BTMTK_WMT_FUNC_CTRL:
   673			wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
   674			if (be16_to_cpu(wmt_evt_funcc->status) == 0x404)
   675				status = BTMTK_WMT_ON_DONE;
   676			else if (be16_to_cpu(wmt_evt_funcc->status) == 0x420)
   677				status = BTMTK_WMT_ON_PROGRESS;
   678			else
   679				status = BTMTK_WMT_ON_UNDONE;
   680			break;
   681		case BTMTK_WMT_PATCH_DWNLD:
   682			if (wmt_evt->whdr.flag == 2)
   683				status = BTMTK_WMT_PATCH_DONE;
   684			else if (wmt_evt->whdr.flag == 1)
   685				status = BTMTK_WMT_PATCH_PROGRESS;
   686			else
   687				status = BTMTK_WMT_PATCH_UNDONE;
   688			break;
   689		}
   690	
   691		if (wmt_params->status)
   692			*wmt_params->status = status;
   693	
   694	err_free_skb:
   695		kfree_skb(data->evt_skb);
   696		data->evt_skb = NULL;
   697	err_free_wc:
   698		kfree(wc);
   699		return err;
   700	}
   701	EXPORT_SYMBOL_GPL(btmtk_usb_hci_wmt_sync);
   702	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
