Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DCF194C75
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 04:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730261217; cv=none; b=ZhT77NOuK4x8h5SqMOk/KqO5QFmF7e+Kw1mU+oOJbdUEjPchQ2dnqbA00yToFJ2j9mZ9gcA79Bk5wovGc+iEtyf1duyrLKzZmLSUhGn4U6qTLg1wIxnmoeT5KhFNz5J4Dx3nEb5HngwHSTf8yLhkjlPyG2wvhGzFUck1bDonVIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730261217; c=relaxed/simple;
	bh=Tb1RvqsfD9AyjHVo2WKTYNSFphXEgxFfSJdN4VZq3IU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pRig/e2dSqC2qUHcTh7BMaO1dTzVxAybFtPLi3Kncv0lCI0Hog64PfgTXN5TtIUfiu29osER8ajEgB7BR2upkQ19Ic0Md2XRqF5Dp7AWFmHS+IHh1A0CcVGJH4WhmBqBN5hDxcx/hNXgAJH3uo/UtAf1dQDvYkgfElWhtPIJL24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWqKc3WN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWqKc3WN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730261214; x=1761797214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tb1RvqsfD9AyjHVo2WKTYNSFphXEgxFfSJdN4VZq3IU=;
  b=SWqKc3WNUdMtkuJWKRICvhqNknVtGREy8OaXy07ZZbU2FCtQkB4h3Gv+
   pyZliAqYoNXo9amEAgd9vhfrDoikewABp21h42zxBsX2WUB6E2R1QqmZQ
   lgsWpJWinxOn9Prro9hx2amWBaqCqnsE4ET9W4EmRxxEp4kKrAKvQ2KJ/
   VIb8GMEVhVPVEbXLM8pxS/G6PTA6izUUMgUTGXB/uYsJsWSq42DEZzQlE
   Aq4bJAZUI7NvFVIes7out90FhouW07EU3qPS3QwiQYyk9jZ7EYeWKyMwA
   qfYoYPj1lU0sTgMbv/mATaSup7su6Ab5DKLjO2Q17RutV8CQrFwSgui7z
   Q==;
X-CSE-ConnectionGUID: ZQzTxgK5Rtyh0wu5XYoBhQ==
X-CSE-MsgGUID: VJpsuZ7nRq+Xd38kXCUuPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="41309950"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="41309950"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 21:06:53 -0700
X-CSE-ConnectionGUID: Bp77PP+3R+CkRUst1BzeNA==
X-CSE-MsgGUID: og4rOkU4TYWm887HxhAu3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="86739331"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Oct 2024 21:06:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5zys-000eU8-1q;
	Wed, 30 Oct 2024 04:06:50 +0000
Date: Wed, 30 Oct 2024 12:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3971/15883]
 drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3976:43: warning: ', rx
 power: ' directive output may be truncated writing 12 bytes into a region of
 size between 1 and 512
Message-ID: <202410301153.q4SlheqM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   89f3b5ff06122cbf06bad6c710c9dab575deff33
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [3971/15883] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: x86_64-buildonly-randconfig-002-20241030 (https://download.01.org/0day-ci/archive/20241030/202410301153.q4SlheqM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410301153.q4SlheqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301153.q4SlheqM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1061:5: warning: no previous prototype for 'hinic_msg_to_mgmt_no_ack' [-Wmissing-prototypes]
    1061 | int hinic_msg_to_mgmt_no_ack(void *hwdev, enum hinic_mod_type mod, u8 cmd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1978:5: warning: no previous prototype for 'comm_pf_mbox_handler' [-Wmissing-prototypes]
    1978 | int comm_pf_mbox_handler(void *handle, u16 vf_id, u8 cmd, void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2749:5: warning: no previous prototype for 'hinic_ppf_ht_gpa_init' [-Wmissing-prototypes]
    2749 | int hinic_ppf_ht_gpa_init(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2795:6: warning: no previous prototype for 'hinic_ppf_ht_gpa_deinit' [-Wmissing-prototypes]
    2795 | void hinic_ppf_ht_gpa_deinit(struct hinic_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2872:5: warning: no previous prototype for 'mqm_eqm_try_alloc_mem' [-Wmissing-prototypes]
    2872 | int mqm_eqm_try_alloc_mem(struct hinic_hwdev *hwdev, u32 page_size,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2909:5: warning: no previous prototype for 'mqm_eqm_alloc_page_mem' [-Wmissing-prototypes]
    2909 | int mqm_eqm_alloc_page_mem(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2934:6: warning: no previous prototype for 'mqm_eqm_free_page_mem' [-Wmissing-prototypes]
    2934 | void mqm_eqm_free_page_mem(struct hinic_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2950:5: warning: no previous prototype for 'mqm_eqm_set_cfg_2_hw' [-Wmissing-prototypes]
    2950 | int mqm_eqm_set_cfg_2_hw(struct hinic_hwdev *hwdev, u32 valid)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2975:5: warning: no previous prototype for 'mqm_eqm_set_page_2_hw' [-Wmissing-prototypes]
    2975 | int mqm_eqm_set_page_2_hw(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3053:5: warning: no previous prototype for 'mqm_eqm_init' [-Wmissing-prototypes]
    3053 | int mqm_eqm_init(struct hinic_hwdev *hwdev)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3116:6: warning: no previous prototype for 'mqm_eqm_deinit' [-Wmissing-prototypes]
    3116 | void mqm_eqm_deinit(struct hinic_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c: In function 'port_sfp_info_event':
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3719:13: warning: the comparison will always evaluate as 'true' for the address of 'rt_cmd' will never be NULL [-Waddress]
    3719 |         if (!chip_node->rt_cmd)
         |             ^
   In file included from drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:28:
   drivers/net/ethernet/huawei/hinic/hinic_hw.h:319:39: note: 'rt_cmd' declared here
     319 |         struct hinic_port_routine_cmd rt_cmd[HINIC_MAX_PORT_ID];
         |                                       ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c: In function 'port_sfp_abs_event':
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3748:13: warning: the comparison will always evaluate as 'true' for the address of 'rt_cmd' will never be NULL [-Waddress]
    3748 |         if (!chip_node->rt_cmd)
         |             ^
   drivers/net/ethernet/huawei/hinic/hinic_hw.h:319:39: note: 'rt_cmd' declared here
     319 |         struct hinic_port_routine_cmd rt_cmd[HINIC_MAX_PORT_ID];
         |                                       ^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c: At top level:
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4581:5: warning: no previous prototype for '_set_led_status' [-Wmissing-prototypes]
    4581 | int _set_led_status(struct hinic_hwdev *hwdev, u8 port,
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4667:5: warning: no previous prototype for 'hinic_get_phy_init_status' [-Wmissing-prototypes]
    4667 | int hinic_get_phy_init_status(void *hwdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c: In function '__print_cable_info.constprop':
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3959:23: warning: 'snprintf' argument 4 overlaps destination object 'tmp_str' [-Wrestrict]
    3959 |                 err = snprintf(tmp_str, sizeof(tmp_str),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3960 |                                "%s, %s, Temperature: %u", tmp_str,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3961 |                                info->sfp_type ? "SFP" : "QSFP",
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3962 |                                info->cable_temp);
         |                                ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3914:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
    3914 |         char tmp_str[CAP_INFO_MAC_LEN] = {0};
         |              ^~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3976:43: warning: ', rx power: ' directive output may be truncated writing 12 bytes into a region of size between 1 and 512 [-Wformat-truncation=]
    3976 |                                        "%s, rx power: %uuw %uuW %uuW %uuW",
         |                                           ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3975:31: note: 'snprintf' output between 28 and 575 bytes into a destination of size 512
    3975 |                         err = snprintf(tmp_str, sizeof(tmp_str),
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3976 |                                        "%s, rx power: %uuw %uuW %uuW %uuW",
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3977 |                                        tmp_str, info->power[0], info->power[1],
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3978 |                                        info->power[2], info->power[3]);
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3975:31: warning: 'snprintf' argument 4 overlaps destination object 'tmp_str' [-Wrestrict]
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3914:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
    3914 |         char tmp_str[CAP_INFO_MAC_LEN] = {0};
         |              ^~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3972:43: warning: ', rx power: ' directive output may be truncated writing 12 bytes into a region of size between 1 and 512 [-Wformat-truncation=]
    3972 |                                        "%s, rx power: %uuW, tx power: %uuW",
         |                                           ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3971:31: note: 'snprintf' output between 31 and 560 bytes into a destination of size 512
    3971 |                         err = snprintf(tmp_str, sizeof(tmp_str),
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3972 |                                        "%s, rx power: %uuW, tx power: %uuW",
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3973 |                                        tmp_str, info->power[0], info->power[1]);
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3971:31: warning: 'snprintf' argument 4 overlaps destination object 'tmp_str' [-Wrestrict]
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3914:14: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
    3914 |         char tmp_str[CAP_INFO_MAC_LEN] = {0};
         |              ^~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_main.c:182:5: warning: no previous prototype for 'hinic_netdev_event' [-Wmissing-prototypes]
     182 | int hinic_netdev_event(struct notifier_block *notifier,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_main.c:3058:6: warning: no previous prototype for 'nic_event' [-Wmissing-prototypes]
    3058 | void nic_event(struct hinic_lld_dev *lld_dev, void *adapter,
         |      ^~~~~~~~~


vim +3976 drivers/net/ethernet/huawei/hinic/hinic_hwdev.c

  3910	
  3911	static void __print_cable_info(struct hinic_hwdev *hwdev,
  3912				       struct hinic_link_info *info)
  3913	{
  3914		char tmp_str[CAP_INFO_MAC_LEN] = {0};
  3915		char tmp_vendor[VENDOR_MAX_LEN] = {0};
  3916		char *port_type = "Unknown port type";
  3917		int i;
  3918		int err = 0;
  3919	
  3920		if (info->cable_absent) {
  3921			sdk_info(hwdev->dev_hdl, "Cable unpresent\n");
  3922			return;
  3923		}
  3924	
  3925		if (info->port_type < LINK_PORT_MAX_TYPE)
  3926			port_type = __hw_to_char_port_type[info->port_type];
  3927		else
  3928			sdk_info(hwdev->dev_hdl, "Unknown port type: %u\n",
  3929				 info->port_type);
  3930		if (info->port_type == LINK_PORT_FIBRE) {
  3931			if (info->port_sub_type == FIBRE_SUBTYPE_SR)
  3932				port_type = "Fibre-SR";
  3933			else if (info->port_sub_type == FIBRE_SUBTYPE_LR)
  3934				port_type = "Fibre-LR";
  3935		}
  3936	
  3937		for (i = sizeof(info->vendor_name) - 1; i >= 0; i--) {
  3938			if (info->vendor_name[i] == ' ')
  3939				info->vendor_name[i] = '\0';
  3940			else
  3941				break;
  3942		}
  3943	
  3944		memcpy(tmp_vendor, info->vendor_name,
  3945		       sizeof(info->vendor_name));
  3946		err = snprintf(tmp_str, sizeof(tmp_str),
  3947			       "Vendor: %s, %s, length: %um, max_speed: %uGbps",
  3948			       tmp_vendor, port_type, info->cable_length,
  3949			       info->cable_max_speed);
  3950		if (err <= 0 || err >= CAP_INFO_MAC_LEN) {
  3951			sdk_err(hwdev->dev_hdl,
  3952				"Failed snprintf cable vendor info, function return(%d) and dest_len(%d)\n",
  3953				err, CAP_INFO_MAC_LEN);
  3954			return;
  3955		}
  3956	
  3957		if (info->port_type == LINK_PORT_FIBRE ||
  3958		    info->port_type == LINK_PORT_AOC) {
  3959			err = snprintf(tmp_str, sizeof(tmp_str),
  3960				       "%s, %s, Temperature: %u", tmp_str,
  3961				       info->sfp_type ? "SFP" : "QSFP",
  3962				       info->cable_temp);
  3963			if (err <= 0 || err >= CAP_INFO_MAC_LEN) {
  3964				sdk_err(hwdev->dev_hdl,
  3965					"Failed snprintf cable Temp, function return(%d) and dest_len(%d)\n",
  3966					err, CAP_INFO_MAC_LEN);
  3967				return;
  3968			}
  3969	
  3970			if (info->sfp_type) {
  3971				err = snprintf(tmp_str, sizeof(tmp_str),
  3972					       "%s, rx power: %uuW, tx power: %uuW",
  3973					       tmp_str, info->power[0], info->power[1]);
  3974			} else {
  3975				err = snprintf(tmp_str, sizeof(tmp_str),
> 3976					       "%s, rx power: %uuw %uuW %uuW %uuW",
  3977					       tmp_str, info->power[0], info->power[1],
  3978					       info->power[2], info->power[3]);
  3979			}
  3980			if (err <= 0 || err >= CAP_INFO_MAC_LEN) {
  3981				sdk_err(hwdev->dev_hdl,
  3982					"Failed snprintf power info, function return(%d) and dest_len(%d)\n",
  3983					err, CAP_INFO_MAC_LEN);
  3984				return;
  3985			}
  3986		}
  3987	
  3988		sdk_info(hwdev->dev_hdl, "Cable information: %s\n",
  3989			 tmp_str);
  3990	}
  3991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
