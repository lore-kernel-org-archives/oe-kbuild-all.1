Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19367221578
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 00:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763080770; cv=none; b=tyFPfwQAjTVkIG1Sad5THafsOZ/5ZBjBcWU4iZYIzPlrt4cp+LXSZ2ShfP+EKCmCN+L83AdBXbyNtpndZk7wLGL43HdZJ3K9NE2rhKB18rpM/c5Bz8jnGXuTsPhzZDeib78dKn5aXA3zeasklMbpogvCrq6zKQoEBjosoqB2J+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763080770; c=relaxed/simple;
	bh=hCCrIlYMu9OBZmjwMi85ylqtmsXh+0eAcDuE0v2vWZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T2OmKEZoPRwW8DNvEPPP5teisxczZqP0xuRjfpMyCqv23ezYcdUd0RUjL8nPpG5Eo2C7SK1pyHTwtPPqDm7x6nsijpaEhSrcrqHML09eF1VlUDQw6ZB6os8UVf/Q8htnczpXgy2gzzUx9mpKpxjvw4ViInbdf70EM+r37/RAYVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0mNe7bW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0mNe7bW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763080770; x=1794616770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hCCrIlYMu9OBZmjwMi85ylqtmsXh+0eAcDuE0v2vWZs=;
  b=j0mNe7bWDQuiq2r3czhxyUGvnNc9HaRmN7LFY3op6iwUKP9aXIq1v+fU
   Kk1FsBaDLEqAoP9sVyJsUUaO9TPxAykLqGq1EDbYHmpGfNfBloATkxL3n
   WxSnbsNsiDHMXaGj/VocV5TKi2VJT3Cj54e9mvCfRNK4r0wWQlJSrtXJ0
   fTNUi3p+uqyXailu+WjsJiy1mg5zyY0aPcsoAN5KQZukmGGtCP6+kHxua
   bnGCrkr/F9dInuDpmzRcLhGwhVlRDUJGomGMN3hBrbuiM26NXDt3n2bUu
   RQIGtSp2nb6FmomGsJiyk6Nng98ASkAToYjjXxFKzXdhJMQ820PrOPHM8
   A==;
X-CSE-ConnectionGUID: SnpUSWXwTJ+CXDr1s168RQ==
X-CSE-MsgGUID: NDgtl61ER8iFQVmHZZlS1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65103353"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65103353"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 16:39:29 -0800
X-CSE-ConnectionGUID: SxvEHMsQT3qAYQVopWFbTw==
X-CSE-MsgGUID: f3UMsZ54TRavFOfCfUeL7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="194635951"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2025 16:39:27 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJhqW-00061b-2u;
	Fri, 14 Nov 2025 00:39:24 +0000
Date: Fri, 14 Nov 2025 08:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3184/3184]
 drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:1079:2: warning: unannotated
 fall-through between switch labels
Message-ID: <202511140839.9biSTcQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5cd3a0597fbb381c1713f27fe723b340d36f331a
commit: 0e80b39fcf6c1b2a13b11f8632b185a89b012b14 [3184/3184] net: wangxun: ngbe: add support for wangxun 1G
config: loongarch-randconfig-002-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140839.9biSTcQm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140839.9biSTcQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140839.9biSTcQm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:1079:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    1079 |         case NGBE_VF_BACKUP:
         |         ^
   drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:1079:2: note: insert 'break;' to avoid fall-through
    1079 |         case NGBE_VF_BACKUP:
         |         ^
         |         break; 
   1 warning generated.
--
   In file included from drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:43:
   In file included from include/net/vxlan.h:11:
   In file included from include/net/nexthop.h:17:
   include/net/ip6_fib.h:281:10: warning: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     281 |                 return time_after(jiffies, f6i->expires);
         |                        ^
   include/linux/jiffies.h:126:3: note: expanded from macro 'time_after'
     126 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3772:6: warning: variable 'vlvfb' set but not used [-Wunused-but-set-variable]
    3772 |         u32 vlvfb;
         |             ^
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3878:20: warning: variable 'vlnctrl' set but not used [-Wunused-but-set-variable]
    3878 |         u32 fctrl, vmolr, vlnctrl;
         |                           ^
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6911:13: warning: unused function 'ngbe_netpoll' [-Wunused-function]
    6911 | static void ngbe_netpoll(struct net_device *netdev)
         |             ^~~~~~~~~~~~
   4 warnings generated.
--
>> drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:631:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     631 |         case HWTSTAMP_TX_ON:
         |         ^
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:631:2: note: insert 'break;' to avoid fall-through
     631 |         case HWTSTAMP_TX_ON:
         |         ^
         |         break; 
   1 warning generated.


vim +1079 drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c

  1005	
  1006	static int ngbe_rcv_msg_from_vf(struct ngbe_adapter *adapter, u16 vf)
  1007	{
  1008		u16 mbx_size = NGBE_VXMAILBOX_SIZE;
  1009		u32 msgbuf[NGBE_VXMAILBOX_SIZE];
  1010		struct ngbe_hw *hw = &adapter->hw;
  1011		s32 retval;
  1012	
  1013		retval = ngbe_read_mbx(hw, msgbuf, mbx_size, vf);
  1014	
  1015		if (retval) {
  1016			pr_err("Error receiving message from VF\n");
  1017			return retval;
  1018		}
  1019	
  1020		/* this is a message we already processed, do nothing */
  1021		if (msgbuf[0] & (NGBE_VT_MSGTYPE_ACK | NGBE_VT_MSGTYPE_NACK))
  1022			return retval;
  1023	
  1024		/* flush the ack before we write any messages back */
  1025		NGBE_WRITE_FLUSH(hw);
  1026	
  1027		if (msgbuf[0] == NGBE_VF_RESET)
  1028			return ngbe_vf_reset_msg(adapter, vf);
  1029	
  1030		/* until the vf completes a virtual function reset it should not be
  1031		 * allowed to start any configuration.
  1032		 */
  1033	
  1034		if (!adapter->vfinfo[vf].clear_to_send) {
  1035			msgbuf[0] |= NGBE_VT_MSGTYPE_NACK;
  1036			ngbe_write_mbx(hw, msgbuf, 1, vf);
  1037			return retval;
  1038		}
  1039	
  1040		switch ((msgbuf[0] & 0xFFFF)) {
  1041		case NGBE_VF_SET_MAC_ADDR:
  1042			retval = ngbe_set_vf_mac_addr(adapter, msgbuf, vf);
  1043			break;
  1044		case NGBE_VF_SET_MULTICAST:
  1045			retval = ngbe_set_vf_multicasts(adapter, msgbuf, vf);
  1046			break;
  1047		case NGBE_VF_SET_VLAN:
  1048			retval = ngbe_set_vf_vlan_msg(adapter, msgbuf, vf);
  1049			break;
  1050		case NGBE_VF_SET_LPE:
  1051			if (msgbuf[1] > NGBE_MAX_JUMBO_FRAME_SIZE) {
  1052				e_err(drv,
  1053				      "VF max_frame %d exceed MAX_JUMBO_FRAME_SIZE\n",
  1054				      msgbuf[1]);
  1055				return -EINVAL;
  1056			}
  1057			retval = ngbe_set_vf_lpe(adapter, msgbuf[1], vf);
  1058			break;
  1059		case NGBE_VF_SET_MACVLAN:
  1060			retval = ngbe_set_vf_macvlan_msg(adapter, msgbuf, vf);
  1061			break;
  1062		case NGBE_VF_API_NEGOTIATE:
  1063			retval = ngbe_negotiate_vf_api(adapter, msgbuf, vf);
  1064			break;
  1065		case NGBE_VF_GET_QUEUES:
  1066			retval = ngbe_get_vf_queues(adapter, msgbuf, vf);
  1067			break;
  1068		case NGBE_VF_UPDATE_XCAST_MODE:
  1069			retval = ngbe_update_vf_xcast_mode(adapter, msgbuf, vf);
  1070			break;
  1071		case NGBE_VF_GET_LINK_STATE:
  1072			retval = ngbe_get_vf_link_state(adapter, msgbuf, vf);
  1073			break;
  1074		case NGBE_VF_GET_LINK_STATUS:
  1075			retval = ngbe_get_vf_link_status(adapter, msgbuf, vf);
  1076			break;
  1077		case NGBE_VF_GET_FW_VERSION:
  1078			retval = ngbe_get_fw_version(adapter, msgbuf, vf);
> 1079		case NGBE_VF_BACKUP:
  1080			break;
  1081		default:
  1082			e_err(drv, "Unhandled Msg %8.8x\n", msgbuf[0]);
  1083			retval = NGBE_ERR_MBX;
  1084			break;
  1085		}
  1086	
  1087		/* notify the VF of the results of what it sent us */
  1088		if (retval)
  1089			msgbuf[0] |= NGBE_VT_MSGTYPE_NACK;
  1090		else
  1091			msgbuf[0] |= NGBE_VT_MSGTYPE_ACK;
  1092	
  1093		msgbuf[0] |= NGBE_VT_MSGTYPE_CTS;
  1094	
  1095		ngbe_write_mbx(hw, msgbuf, mbx_size, vf);
  1096	
  1097		return retval;
  1098	}
  1099	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
