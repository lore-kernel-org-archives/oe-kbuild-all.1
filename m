Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218FFA950
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 17:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674150247; x=1705686247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xUMGOOnrFjF855GJVu/wgBpVbF0KHei/pi+VlrqpaWA=;
  b=XcTkzfyBWgHz3vbuf9XXy7ZIm/9wRxzxMMWcq+w2IPT25g9jyD5e1vEf
   jv32f8+5+b0Jmx6LvI2scmhEOrIzHOn58iOonk2rbYCSPGZUrKYb8yJNx
   IW20Y2l9lHsJwejz7oNnfHsLyttZiuPZXS6bk5qPAsMkXRGlCgpnoZdAX
   XxURISGhFr7k7E5hIeJ45Cx443KLSNCuQl1yrko776btm2MAmtnQMdZMD
   vpW8WXuWZTGMt9V5I55AdRenmY42sTY0vCwwF22Y7n4U1LJUiVDDp0hvS
   CAEZfQBmYO/BDYAXu6Xnd3d2UOYYry7EuMjZbaBWfP9u9WeRyHkW13U9+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="387728781"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="387728781"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 09:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834062414"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="834062414"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Jan 2023 09:44:03 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIYxG-0001go-38;
	Thu, 19 Jan 2023 17:44:02 +0000
Date: Fri, 20 Jan 2023 01:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: max.chou@realtek.com, marcel@holtmann.org
Cc: oe-kbuild-all@lists.linux.dev, johan.hedberg@gmail.com,
	luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org, alex_lu@realsil.com.cn,
	hildawu@realtek.com, max.chou@realtek.com,
	allen_chen@realsil.com.cn
Subject: Re: [PATCH 1/1] Bluetooth: btrtl: Firmware format v2 support
Message-ID: <202301200134.RGBBGiDD-lkp@intel.com>
References: <20230119074714.156283-1-max.chou@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119074714.156283-1-max.chou@realtek.com>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on bluetooth-next/master linus/master v6.2-rc4 next-20230119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/max-chou-realtek-com/Bluetooth-btrtl-Firmware-format-v2-support/20230119-155205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20230119074714.156283-1-max.chou%40realtek.com
patch subject: [PATCH 1/1] Bluetooth: btrtl: Firmware format v2 support
config: csky-randconfig-s043-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200134.RGBBGiDD-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/ffdaef9bef66fbba642b544b0a1f35217dc17d6a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review max-chou-realtek-com/Bluetooth-btrtl-Firmware-format-v2-support/20230119-155205
        git checkout ffdaef9bef66fbba642b544b0a1f35217dc17d6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btrtl.c:893:22: sparse: sparse: cast to restricted __le16
   drivers/bluetooth/btrtl.c:899:27: sparse: sparse: cast to restricted __le16
   drivers/bluetooth/btrtl.c: note: in included file:
   drivers/bluetooth/btrtl.h:47:45: sparse: sparse: array of flexible structures

vim +893 drivers/bluetooth/btrtl.c

   865	
   866	struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
   867						   const char *postfix)
   868	{
   869		struct btrtl_device_info *btrtl_dev;
   870		struct sk_buff *skb;
   871		struct hci_rp_read_local_version *resp;
   872		char cfg_name[40];
   873		u16 hci_rev, lmp_subver;
   874		u8 hci_ver;
   875		u8 lmp_ver;
   876		int ret;
   877		u16 opcode;
   878		u8 cmd[2];
   879		u8 reg_val[2];
   880	
   881		btrtl_dev = kzalloc(sizeof(*btrtl_dev), GFP_KERNEL);
   882		if (!btrtl_dev) {
   883			ret = -ENOMEM;
   884			goto err_alloc;
   885		}
   886	
   887		INIT_LIST_HEAD(&btrtl_dev->patch_subsecs);
   888	
   889	check_version:
   890		ret = btrtl_vendor_read_reg16(hdev, RTL_CHIP_SUBVER, reg_val);
   891		if (ret < 0)
   892			goto err_free;
 > 893		lmp_subver = le16_to_cpu(*((u16 *)reg_val));
   894	
   895		if (lmp_subver == RTL_ROM_LMP_8822B) {
   896			ret = btrtl_vendor_read_reg16(hdev, RTL_CHIP_REV, reg_val);
   897			if (ret < 0)
   898				goto err_free;
   899			hci_rev = le16_to_cpu(*((u16 *)reg_val));
   900	
   901			/* 8822E */
   902			if (hci_rev == 0x000e) {
   903				hci_ver = 0x0c;
   904				lmp_ver = 0x0c;
   905				btrtl_dev->ic_info = btrtl_match_ic(lmp_subver, hci_rev,
   906								    hci_ver, hdev->bus);
   907				goto next;
   908			}
   909		}
   910	
   911		skb = btrtl_read_local_version(hdev);
   912		if (IS_ERR(skb)) {
   913			ret = PTR_ERR(skb);
   914			goto err_free;
   915		}
   916		resp = (struct hci_rp_read_local_version *)skb->data;
   917	
   918		hci_ver    = resp->hci_ver;
   919		hci_rev    = le16_to_cpu(resp->hci_rev);
   920		lmp_ver    = resp->lmp_ver;
   921		lmp_subver = le16_to_cpu(resp->lmp_subver);
   922	
   923		kfree_skb(skb);
   924	
   925		btrtl_dev->ic_info = btrtl_match_ic(lmp_subver, hci_rev, hci_ver,
   926						    hdev->bus);
   927	
   928	next:
   929		rtl_dev_info(hdev, "examining hci_ver=%02x hci_rev=%04x lmp_ver=%02x lmp_subver=%04x",
   930			     hci_ver, hci_rev,
   931			     lmp_ver, lmp_subver);
   932	
   933		if (!btrtl_dev->ic_info && !btrtl_dev->drop_fw)
   934			btrtl_dev->drop_fw = true;
   935		else
   936			btrtl_dev->drop_fw = false;
   937	
   938		if (btrtl_dev->drop_fw) {
   939			opcode = hci_opcode_pack(0x3f, 0x66);
   940			cmd[0] = opcode & 0xff;
   941			cmd[1] = opcode >> 8;
   942	
   943			skb = bt_skb_alloc(sizeof(cmd), GFP_KERNEL);
   944			if (!skb)
   945				goto err_free;
   946	
   947			skb_put_data(skb, cmd, sizeof(cmd));
   948			hci_skb_pkt_type(skb) = HCI_COMMAND_PKT;
   949	
   950			ret = hdev->send(hdev, skb);
   951			if (ret < 0) {
   952				bt_dev_err(hdev, "sending frame failed (%d)", ret);
   953				kfree_skb(skb);
   954				goto err_free;
   955			}
   956	
   957			/* Ensure the above vendor command is sent to controller and
   958			 * process has done.
   959			 */
   960			msleep(200);
   961	
   962			goto check_version;
   963		}
   964	
   965		if (!btrtl_dev->ic_info) {
   966			rtl_dev_info(hdev, "unknown IC info, lmp subver %04x, hci rev %04x, hci ver %04x",
   967				    lmp_subver, hci_rev, hci_ver);
   968			return btrtl_dev;
   969		}
   970	
   971		if (btrtl_dev->ic_info->has_rom_version) {
   972			ret = rtl_read_rom_version(hdev, &btrtl_dev->rom_version);
   973			if (ret)
   974				goto err_free;
   975		}
   976	
   977		btrtl_dev->fw_len = rtl_load_file(hdev, btrtl_dev->ic_info->fw_name,
   978						  &btrtl_dev->fw_data);
   979		if (btrtl_dev->fw_len < 0) {
   980			rtl_dev_err(hdev, "firmware file %s not found",
   981				    btrtl_dev->ic_info->fw_name);
   982			ret = btrtl_dev->fw_len;
   983			goto err_free;
   984		}
   985	
   986		if (btrtl_dev->ic_info->cfg_name) {
   987			if (postfix) {
   988				snprintf(cfg_name, sizeof(cfg_name), "%s-%s.bin",
   989					 btrtl_dev->ic_info->cfg_name, postfix);
   990			} else {
   991				snprintf(cfg_name, sizeof(cfg_name), "%s.bin",
   992					 btrtl_dev->ic_info->cfg_name);
   993			}
   994			btrtl_dev->cfg_len = rtl_load_file(hdev, cfg_name,
   995							   &btrtl_dev->cfg_data);
   996			if (btrtl_dev->ic_info->config_needed &&
   997			    btrtl_dev->cfg_len <= 0) {
   998				rtl_dev_err(hdev, "mandatory config file %s not found",
   999					    btrtl_dev->ic_info->cfg_name);
  1000				ret = btrtl_dev->cfg_len;
  1001				goto err_free;
  1002			}
  1003		}
  1004	
  1005		/* The following chips supports the Microsoft vendor extension,
  1006		 * therefore set the corresponding VsMsftOpCode.
  1007		 */
  1008		if (btrtl_dev->ic_info->has_msft_ext)
  1009			hci_set_msft_opcode(hdev, 0xFCF0);
  1010	
  1011		return btrtl_dev;
  1012	
  1013	err_free:
  1014		btrtl_free(btrtl_dev);
  1015	err_alloc:
  1016		return ERR_PTR(ret);
  1017	}
  1018	EXPORT_SYMBOL_GPL(btrtl_initialize);
  1019	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
