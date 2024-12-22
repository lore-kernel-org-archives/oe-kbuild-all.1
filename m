Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DDC18027
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 03:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734839904; cv=none; b=Xza4SCgKQtCIWkGacFmL2M+QTP/E/8pYTIcaOxfxiliwbGmJJS0LsZyhDAPi0sqq8bL/N4vtAohlgsX/7H8wEZCX1C7MaMnJo+5ug9JHlloyAd32G8moBdtLXj6agXmGdO2mAx4Yk3iA5eilNS8XfJs7LWBTHzq+fWJNOnETmYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734839904; c=relaxed/simple;
	bh=RuLu9b3QdeNvgHiAVFM1YatSyZAXEdiH91CJW2JfMEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1VnDAnCX8uT8JilmG55M5Hkq0iADKhh4MjA6baUaZbOPqnqC30ddMr4bePI4cvLNsq0jUUqTFtOnO0zT6mvM60SBnHBSuleyLYt9oHqZf3SsI8IzhVycYizpfxRN98R0nz0TSirDijtCQHIsE5QjW5p8DQbON/5OPsVBu/KXVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVIl8sWP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVIl8sWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734839902; x=1766375902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RuLu9b3QdeNvgHiAVFM1YatSyZAXEdiH91CJW2JfMEg=;
  b=aVIl8sWPkp8y2eav/HMSupfj8Mtw6EPVgPmuRve1HbPRDGKX+6X2+xd2
   zj4U+LUkml3NdjXVGhz5dxG+0JGCtmG9hO2kh/onG0ECE5XdjUT1ITNTx
   xprZmlD4tGV5q0IZaUMPOS28EXq7ndHZQZ5KtuUSxCstFEOfSUYU5Px8F
   0RqVfZcuHnGmYmpi8YxzHYPH99Zhret0skCfqm7cLdQYD9TxK5rXVoarM
   CESaF67o/HR3ViLS11SK65Sh8t1ps08Nu1YjJhlX961UrXphcTV9nf9X5
   EGegMRN1sx08wto3n9YnT+GN616giMfvKHQrWRZjOYin5YBGT+hFNgC7h
   g==;
X-CSE-ConnectionGUID: enpUeVzcR3GNrLuHldwdzw==
X-CSE-MsgGUID: H9mQMi8QTqygNfsGb6+rpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="45946231"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="45946231"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 19:58:22 -0800
X-CSE-ConnectionGUID: fL5k/o/6TD+LdPiuTnUm/Q==
X-CSE-MsgGUID: ZBaNVEV8R4S4IJaxKZClrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136221388"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2024 19:58:21 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPD6f-0002iR-3D;
	Sun, 22 Dec 2024 03:58:18 +0000
Date: Sun, 22 Dec 2024 11:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: drivers/input/misc/iqs626a.c:780:61: warning: '%d' directive output
 may be truncated writing between 1 and 11 bytes into a region of size 2
Message-ID: <202412221136.0S4kRoCC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jeff,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 4d3d2694e168c542b088eef5059d31498f679020 Input: iqs626a - drop unused device node references
date:   1 year, 11 months ago
config: s390-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241222/202412221136.0S4kRoCC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221136.0S4kRoCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221136.0S4kRoCC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/misc/iqs626a.c: In function 'iqs626_parse_trackpad':
>> drivers/input/misc/iqs626a.c:780:61: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 2 [-Wformat-truncation=]
     780 |                 snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
         |                                                             ^~
   drivers/input/misc/iqs626a.c:780:52: note: directive argument in the range [-2147483641, 2147483646]
     780 |                 snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
         |                                                    ^~~~~~~~~~~~
   drivers/input/misc/iqs626a.c:780:17: note: 'snprintf' output between 10 and 20 bytes into a destination of size 10
     780 |                 snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +780 drivers/input/misc/iqs626a.c

   712	
   713	static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
   714					 struct fwnode_handle *ch_node,
   715					 enum iqs626_ch_id ch_id)
   716	{
   717		struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
   718		struct i2c_client *client = iqs626->client;
   719		u8 *hyst = &sys_reg->tp_grp_reg.hyst;
   720		int error, count, i;
   721		unsigned int val;
   722	
   723		if (!fwnode_property_read_u32(ch_node, "azoteq,lta-update", &val)) {
   724			if (val > IQS626_MISC_A_TPx_LTA_UPDATE_MAX) {
   725				dev_err(&client->dev,
   726					"Invalid %s channel update rate: %u\n",
   727					fwnode_get_name(ch_node), val);
   728				return -EINVAL;
   729			}
   730	
   731			sys_reg->misc_a &= ~IQS626_MISC_A_TPx_LTA_UPDATE_MASK;
   732			sys_reg->misc_a |= (val << IQS626_MISC_A_TPx_LTA_UPDATE_SHIFT);
   733		}
   734	
   735		if (!fwnode_property_read_u32(ch_node, "azoteq,filt-str-trackpad",
   736					      &val)) {
   737			if (val > IQS626_FILT_STR_MAX) {
   738				dev_err(&client->dev,
   739					"Invalid %s channel filter strength: %u\n",
   740					fwnode_get_name(ch_node), val);
   741				return -EINVAL;
   742			}
   743	
   744			sys_reg->misc_b &= ~IQS626_MISC_B_FILT_STR_TPx;
   745			sys_reg->misc_b |= val;
   746		}
   747	
   748		if (!fwnode_property_read_u32(ch_node, "azoteq,filt-str-np-cnt",
   749					      &val)) {
   750			if (val > IQS626_FILT_STR_MAX) {
   751				dev_err(&client->dev,
   752					"Invalid %s channel filter strength: %u\n",
   753					fwnode_get_name(ch_node), val);
   754				return -EINVAL;
   755			}
   756	
   757			*hyst &= ~IQS626_FILT_STR_NP_TPx_MASK;
   758			*hyst |= (val << IQS626_FILT_STR_NP_TPx_SHIFT);
   759		}
   760	
   761		if (!fwnode_property_read_u32(ch_node, "azoteq,filt-str-lp-cnt",
   762					      &val)) {
   763			if (val > IQS626_FILT_STR_MAX) {
   764				dev_err(&client->dev,
   765					"Invalid %s channel filter strength: %u\n",
   766					fwnode_get_name(ch_node), val);
   767				return -EINVAL;
   768			}
   769	
   770			*hyst &= ~IQS626_FILT_STR_LP_TPx_MASK;
   771			*hyst |= (val << IQS626_FILT_STR_LP_TPx_SHIFT);
   772		}
   773	
   774		for (i = 0; i < iqs626_channels[ch_id].num_ch; i++) {
   775			u8 *ati_base = &sys_reg->tp_grp_reg.ch_reg_tp[i].ati_base;
   776			u8 *thresh = &sys_reg->tp_grp_reg.ch_reg_tp[i].thresh;
   777			struct fwnode_handle *tc_node;
   778			char tc_name[10];
   779	
 > 780			snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
   781	
   782			tc_node = fwnode_get_named_child_node(ch_node, tc_name);
   783			if (!tc_node)
   784				continue;
   785	
   786			if (!fwnode_property_read_u32(tc_node, "azoteq,ati-base",
   787						      &val)) {
   788				if (val < IQS626_TPx_ATI_BASE_MIN ||
   789				    val > IQS626_TPx_ATI_BASE_MAX) {
   790					dev_err(&client->dev,
   791						"Invalid %s %s ATI base: %u\n",
   792						fwnode_get_name(ch_node), tc_name, val);
   793					fwnode_handle_put(tc_node);
   794					return -EINVAL;
   795				}
   796	
   797				*ati_base = val - IQS626_TPx_ATI_BASE_MIN;
   798			}
   799	
   800			if (!fwnode_property_read_u32(tc_node, "azoteq,thresh",
   801						      &val)) {
   802				if (val > IQS626_CHx_THRESH_MAX) {
   803					dev_err(&client->dev,
   804						"Invalid %s %s threshold: %u\n",
   805						fwnode_get_name(ch_node), tc_name, val);
   806					fwnode_handle_put(tc_node);
   807					return -EINVAL;
   808				}
   809	
   810				*thresh = val;
   811			}
   812	
   813			fwnode_handle_put(tc_node);
   814		}
   815	
   816		if (!fwnode_property_present(ch_node, "linux,keycodes"))
   817			return 0;
   818	
   819		count = fwnode_property_count_u32(ch_node, "linux,keycodes");
   820		if (count > IQS626_NUM_GESTURES) {
   821			dev_err(&client->dev, "Too many keycodes present\n");
   822			return -EINVAL;
   823		} else if (count < 0) {
   824			dev_err(&client->dev, "Failed to count keycodes: %d\n", count);
   825			return count;
   826		}
   827	
   828		error = fwnode_property_read_u32_array(ch_node, "linux,keycodes",
   829						       iqs626->tp_code, count);
   830		if (error) {
   831			dev_err(&client->dev, "Failed to read keycodes: %d\n", error);
   832			return error;
   833		}
   834	
   835		sys_reg->misc_b &= ~IQS626_MISC_B_TPx_SWIPE;
   836		if (fwnode_property_present(ch_node, "azoteq,gesture-swipe"))
   837			sys_reg->misc_b |= IQS626_MISC_B_TPx_SWIPE;
   838	
   839		if (!fwnode_property_read_u32(ch_node, "azoteq,timeout-tap-ms",
   840					      &val)) {
   841			if (val > IQS626_TIMEOUT_TAP_MS_MAX) {
   842				dev_err(&client->dev,
   843					"Invalid %s channel timeout: %u\n",
   844					fwnode_get_name(ch_node), val);
   845				return -EINVAL;
   846			}
   847	
   848			sys_reg->timeout_tap = val / 16;
   849		}
   850	
   851		if (!fwnode_property_read_u32(ch_node, "azoteq,timeout-swipe-ms",
   852					      &val)) {
   853			if (val > IQS626_TIMEOUT_SWIPE_MS_MAX) {
   854				dev_err(&client->dev,
   855					"Invalid %s channel timeout: %u\n",
   856					fwnode_get_name(ch_node), val);
   857				return -EINVAL;
   858			}
   859	
   860			sys_reg->timeout_swipe = val / 16;
   861		}
   862	
   863		if (!fwnode_property_read_u32(ch_node, "azoteq,thresh-swipe",
   864					      &val)) {
   865			if (val > IQS626_THRESH_SWIPE_MAX) {
   866				dev_err(&client->dev,
   867					"Invalid %s channel threshold: %u\n",
   868					fwnode_get_name(ch_node), val);
   869				return -EINVAL;
   870			}
   871	
   872			sys_reg->thresh_swipe = val;
   873		}
   874	
   875		sys_reg->event_mask &= ~IQS626_EVENT_MASK_GESTURE;
   876	
   877		return 0;
   878	}
   879	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
