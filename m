Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896787C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 01:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682300861; x=1713836861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ij55hDYvTxQMK3aLg4Y7c/O3gzITXzCKjeobJwmqaLE=;
  b=SDuQ0mM7GnDsk9XYctscm4nueVkp5QuuhcXvD5s+9DWNWFNwI8bhp8uL
   o2+KOzV7S2umh88jnqRDZGAfF4iCSwBEoGcPCRA2eQpOo/RWUM5XaW5xk
   AsElpPr8hdwVJB2O+2HZa/c/I+D7Hhrq+lvOq/zPe+81mINHuEbwN7yYw
   dn/3n78p0dppFOKrTNiwIcSD7hV8GWtolve9MmKI9asEZ33AOEp1lwoFX
   yrReV5k9wrEvhZEyJz0tGwPdD+RKQ/LZAxGy8I4KTqtIPRQ5pYcoEL72D
   5zaIZPUKERPYunve+LCy3ZNtnirpfe0uOnN3PGRoGsCHS7tdwjG6+HXHx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="345095571"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="345095571"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 18:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="757510232"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="757510232"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Apr 2023 18:47:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqlIn-000iDG-1u;
	Mon, 24 Apr 2023 01:47:37 +0000
Date: Mon, 24 Apr 2023 09:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Jiang <quic_tjiang@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] Bluetooth: btusb: Add WCN6855 devcoredump support
Message-ID: <202304240910.XpoTSMkj-lkp@intel.com>
References: <20230413064344.18714-1-quic_tjiang@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413064344.18714-1-quic_tjiang@quicinc.com>

Hi Tim,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on linus/master v6.3]
[cannot apply to bluetooth-next/master next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Jiang/Bluetooth-btusb-Add-WCN6855-devcoredump-support/20230413-144515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20230413064344.18714-1-quic_tjiang%40quicinc.com
patch subject: [PATCH v2] Bluetooth: btusb: Add WCN6855 devcoredump support
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230424/202304240910.XpoTSMkj-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/188ad414de75af0af685039e7877dc9c8199d19a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tim-Jiang/Bluetooth-btusb-Add-WCN6855-devcoredump-support/20230413-144515
        git checkout 188ad414de75af0af685039e7877dc9c8199d19a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240910.XpoTSMkj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bluetooth/btusb.c: In function 'handle_dump_pkt_qca':
>> drivers/bluetooth/btusb.c:3384:23: error: implicit declaration of function 'hci_devcd_init'; did you mean 'hci_sock_init'? [-Werror=implicit-function-declaration]
    3384 |                 ret = hci_devcd_init(hdev, dump_size);
         |                       ^~~~~~~~~~~~~~
         |                       hci_sock_init
>> drivers/bluetooth/btusb.c:3412:17: error: implicit declaration of function 'hci_devcd_append_pattern' [-Werror=implicit-function-declaration]
    3412 |                 hci_devcd_append_pattern(hdev, 0x0, dump_size);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bluetooth/btusb.c:3422:9: error: implicit declaration of function 'hci_devcd_append'; did you mean 'hci_dev_open'? [-Werror=implicit-function-declaration]
    3422 |         hci_devcd_append(hdev, skb);
         |         ^~~~~~~~~~~~~~~~
         |         hci_dev_open
>> drivers/bluetooth/btusb.c:3429:17: error: implicit declaration of function 'hci_devcd_complete' [-Werror=implicit-function-declaration]
    3429 |                 hci_devcd_complete(hdev);
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btusb.c: In function 'btusb_probe':
>> drivers/bluetooth/btusb.c:4295:17: error: implicit declaration of function 'hci_devcd_register'; did you mean 'of_device_register'? [-Werror=implicit-function-declaration]
    4295 |                 hci_devcd_register(hdev, btusb_coredump_qca, btusb_dump_hdr_qca, NULL);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 of_device_register
   cc1: some warnings being treated as errors


vim +3384 drivers/bluetooth/btusb.c

  3323	
  3324	/*
  3325	 * ==0: not a dump pkt.
  3326	 * < 0: fails to handle a dump pkt
  3327	 * > 0: otherwise.
  3328	 */
  3329	static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
  3330	{
  3331		int ret = 1;
  3332		u8 pkt_type;
  3333		u8 *sk_ptr;
  3334		unsigned int sk_len;
  3335		u16 seqno;
  3336		u32 dump_size;
  3337	
  3338		struct hci_event_hdr *event_hdr;
  3339		struct hci_acl_hdr *acl_hdr;
  3340		struct qca_dump_hdr *dump_hdr;
  3341		struct btusb_data *btdata = hci_get_drvdata(hdev);
  3342		struct usb_device *udev = btdata->udev;
  3343	
  3344		pkt_type = hci_skb_pkt_type(skb);
  3345		sk_ptr = skb->data;
  3346		sk_len = skb->len;
  3347	
  3348		if (pkt_type == HCI_ACLDATA_PKT) {
  3349			acl_hdr = hci_acl_hdr(skb);
  3350			if (le16_to_cpu(acl_hdr->handle) != QCA_MEMDUMP_ACL_HANDLE)
  3351				return 0;
  3352			sk_ptr += HCI_ACL_HDR_SIZE;
  3353			sk_len -= HCI_ACL_HDR_SIZE;
  3354			event_hdr = (struct hci_event_hdr *)sk_ptr;
  3355		} else {
  3356			event_hdr = hci_event_hdr(skb);
  3357		}
  3358	
  3359		if ((event_hdr->evt != HCI_VENDOR_PKT)
  3360			|| (event_hdr->plen != (sk_len - HCI_EVENT_HDR_SIZE)))
  3361			return 0;
  3362	
  3363		sk_ptr += HCI_EVENT_HDR_SIZE;
  3364		sk_len -= HCI_EVENT_HDR_SIZE;
  3365	
  3366		dump_hdr = (struct qca_dump_hdr *)sk_ptr;
  3367		if ((sk_len < offsetof(struct qca_dump_hdr, data))
  3368			|| (dump_hdr->vse_class != QCA_MEMDUMP_VSE_CLASS)
  3369		    || (dump_hdr->msg_type != QCA_MEMDUMP_MSG_TYPE))
  3370			return 0;
  3371	
  3372		/*it is dump pkt now*/
  3373		seqno = le16_to_cpu(dump_hdr->seqno);
  3374		if (seqno == 0) {
  3375			set_bit(BTUSB_HW_SSR_ACTIVE, &btdata->flags);
  3376			dump_size = le32_to_cpu(dump_hdr->ram_dump_size);
  3377			if (!dump_size || (dump_size > QCA_MEMDUMP_SIZE_MAX)) {
  3378				ret = -EILSEQ;
  3379				bt_dev_err(hdev, "Invalid memdump size(%u)",
  3380					   dump_size);
  3381				goto out;
  3382			}
  3383	
> 3384			ret = hci_devcd_init(hdev, dump_size);
  3385			if (ret < 0) {
  3386				bt_dev_err(hdev, "memdump init error(%d)", ret);
  3387				goto out;
  3388			}
  3389	
  3390			btdata->qca_dump.ram_dump_size = dump_size;
  3391			btdata->qca_dump.ram_dump_seqno = 0;
  3392			sk_ptr += offsetof(struct qca_dump_hdr, data0);
  3393			sk_len -= offsetof(struct qca_dump_hdr, data0);
  3394	
  3395			usb_disable_autosuspend(udev);
  3396			bt_dev_info(hdev, "%s memdump size(%u)\n",
  3397				    (pkt_type == HCI_ACLDATA_PKT) ? "ACL" : "event",
  3398				    dump_size);
  3399		} else {
  3400			sk_ptr += offsetof(struct qca_dump_hdr, data);
  3401			sk_len -= offsetof(struct qca_dump_hdr, data);
  3402		}
  3403	
  3404		if (!btdata->qca_dump.ram_dump_size) {
  3405			ret = -EINVAL;
  3406			bt_dev_err(hdev, "memdump is not active");
  3407			goto out;
  3408		}
  3409	
  3410		if ((seqno > btdata->qca_dump.ram_dump_seqno + 1) && (seqno != QCA_LAST_SEQUENCE_NUM)) {
  3411			dump_size = QCA_MEMDUMP_PKT_SIZE * (seqno - btdata->qca_dump.ram_dump_seqno - 1);
> 3412			hci_devcd_append_pattern(hdev, 0x0, dump_size);
  3413			bt_dev_err(hdev,
  3414				   "expected memdump seqno(%u) is not received(%u)\n",
  3415				   btdata->qca_dump.ram_dump_seqno, seqno);
  3416			btdata->qca_dump.ram_dump_seqno = seqno;
  3417			kfree_skb(skb);
  3418			return ret;
  3419		}
  3420	
  3421		skb_pull(skb, skb->len - sk_len);
> 3422		hci_devcd_append(hdev, skb);
  3423		btdata->qca_dump.ram_dump_seqno++;
  3424		if (seqno == QCA_LAST_SEQUENCE_NUM) {
  3425			bt_dev_info(hdev,
  3426					"memdump done: pkts(%u), total(%u)\n",
  3427					btdata->qca_dump.ram_dump_seqno, btdata->qca_dump.ram_dump_size);
  3428	
> 3429			hci_devcd_complete(hdev);
  3430			goto out;
  3431		}
  3432		return ret;
  3433	
  3434	out:
  3435		if (btdata->qca_dump.ram_dump_size)
  3436			usb_enable_autosuspend(udev);
  3437		btdata->qca_dump.ram_dump_size = 0;
  3438		btdata->qca_dump.ram_dump_seqno = 0;
  3439		clear_bit(BTUSB_HW_SSR_ACTIVE, &btdata->flags);
  3440	
  3441		if (ret < 0)
  3442			kfree_skb(skb);
  3443		return ret;
  3444	}
  3445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
