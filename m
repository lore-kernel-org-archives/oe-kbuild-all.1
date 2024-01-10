Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6225DF56
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 05:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxPEcTEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704866029; x=1736402029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=71deKptZ2qjixRbJHB2qsPBgtEgztiURxh3zwaIezxk=;
  b=JxPEcTEw8bOtmK68LtJSjDYDD4OEqNdUEEGwqaVykXoVetxYw25ixgFL
   fwMfAGuPo3cVPgwAt2O/uxCF6uqoHoYNbDFUsxhVG0oRtzymUwe8ZV8Ks
   mbHNB3l1bmB6CLC/y/zTu2qz1FYEN9rq545A+3Kgvcx/vW3JdvFdVX+Zt
   RFb3s79/j7qcYuMHg3iE3R+66XtkafxbZhuMcduU1AckaZLBFQcIATrIN
   SHl3V/+74BSOpY2mjfKAtoN3gM9q+HXtOL0M0ignINCBORpVN5m+UR+u4
   UlIWsINy/KKxy6z+aOtsYIynuJbOtSBk3qeyHg4CFkg+I74Ohbto3VXtZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5189499"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5189499"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 21:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="816238185"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="816238185"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 09 Jan 2024 21:53:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNRWx-0006fg-2Z;
	Wed, 10 Jan 2024 05:53:35 +0000
Date: Wed, 10 Jan 2024 13:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5_core80 55/59]
 drivers/net/wireless/intel/iwlwifi/mvm/nan.c:388:17: warning: writing 1 byte
 into a region of size 0
Message-ID: <202401101310.cEAIxjPc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git egrumbac_fixes_6.5_core80
head:   260daff72d49b63c085ace273ce18843b70cc526
commit: 93a3c02830e001c30586795dc8bbdae0498ea50a [55/59] f
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240110/202401101310.cEAIxjPc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101310.cEAIxjPc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101310.cEAIxjPc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/mvm/nan.c: In function 'iwl_mvm_add_nan_func':
>> drivers/net/wireless/intel/iwlwifi/mvm/nan.c:388:17: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     388 |                 memcpy(cmd_data, &srf_ctl, sizeof(srf_ctl));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/nan.c:10:
   drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/nan.h:254:12: note: destination object 'data' of size 0
     254 |         u8 data[0];
         |            ^~~~
   drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/nan.h:267:12: note: destination object 'data' of size 0
     267 |         u8 data[0];
         |            ^~~~
   drivers/net/wireless/intel/iwlwifi/mvm/nan.c:378:17: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     378 |                 memcpy(cmd_data, &srf_ctl, sizeof(srf_ctl));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/nan.h:254:12: note: destination object 'data' of size 0
     254 |         u8 data[0];
         |            ^~~~
   drivers/net/wireless/intel/iwlwifi/mvm/../fw/api/nan.h:267:12: note: destination object 'data' of size 0
     267 |         u8 data[0];
         |            ^~~~


vim +388 drivers/net/wireless/intel/iwlwifi/mvm/nan.c

   269	
   270	int iwl_mvm_add_nan_func(struct ieee80211_hw *hw,
   271				 struct ieee80211_vif *vif,
   272				 const struct cfg80211_nan_func *nan_func)
   273	{
   274		struct iwl_mvm *mvm = IWL_MAC80211_GET_MVM(hw);
   275		void *cmd;
   276		struct iwl_nan_add_func_common *cmn;
   277		struct iwl_nan_add_func_common_tail *tail;
   278		struct iwl_host_cmd hcmd = {
   279			.id = WIDE_ID(NAN_GROUP, NAN_DISCOVERY_FUNC_CMD),
   280			.flags = CMD_WANT_SKB,
   281		};
   282		struct iwl_nan_add_func_res *resp;
   283		struct iwl_rx_packet *pkt;
   284		u8 *cmd_data;
   285		u16 flags = 0;
   286		u8 tx_filt_len, rx_filt_len;
   287		size_t cmd_len;
   288		int ret = 0;
   289	
   290		IWL_DEBUG_MAC80211(IWL_MAC80211_GET_MVM(hw), "Add NAN func\n");
   291	
   292		mutex_lock(&mvm->mutex);
   293	
   294		/* We assume here that mac80211 properly validated the nan_func */
   295		cmd_len = iwl_mvm_nan_add_func_cmd_len(hw) +
   296			  ALIGN(nan_func->serv_spec_info_len, 4);
   297		if (nan_func->srf_bf_len)
   298			cmd_len += ALIGN(nan_func->srf_bf_len + 1, 4);
   299		else if (nan_func->srf_num_macs)
   300			cmd_len += ALIGN(nan_func->srf_num_macs * ETH_ALEN + 1, 4);
   301	
   302		rx_filt_len = iwl_mvm_get_match_filter_len(nan_func->rx_filters,
   303							   nan_func->num_rx_filters);
   304	
   305		tx_filt_len = iwl_mvm_get_match_filter_len(nan_func->tx_filters,
   306							   nan_func->num_tx_filters);
   307	
   308		cmd_len += ALIGN(rx_filt_len, 4);
   309		cmd_len += ALIGN(tx_filt_len, 4);
   310	
   311		cmd = kzalloc(cmd_len, GFP_KERNEL);
   312	
   313		if (!cmd) {
   314			ret = -ENOBUFS;
   315			goto unlock;
   316		}
   317	
   318		hcmd.len[0] = cmd_len;
   319		hcmd.data[0] = cmd;
   320	
   321		cmn = iwl_mvm_nan_get_add_func_common(hw, cmd);
   322		tail = iwl_mvm_chan_info_cmd_tail(mvm, &cmn->faw_ci);
   323	
   324		cmd_data = iwl_mvm_nan_get_add_func_data(hw, cmd);
   325		cmn->action = cpu_to_le32(FW_CTXT_ACTION_ADD);
   326		cmn->type = iwl_fw_nan_func_type(nan_func->type);
   327		cmn->instance_id = nan_func->instance_id;
   328		tail->dw_interval = 1;
   329	
   330		memcpy(&cmn->service_id, nan_func->service_id, sizeof(cmn->service_id));
   331	
   332		/*
   333		 * TODO: Currently we want all the events, however we might need to be
   334		 * able to unset this flag for solicited publish to disable "Replied"
   335		 * events.
   336		 */
   337		flags |= IWL_NAN_DE_FUNC_FLAG_RAISE_EVENTS;
   338		if (nan_func->subscribe_active ||
   339		    nan_func->publish_type == NL80211_NAN_UNSOLICITED_PUBLISH)
   340			flags |= IWL_NAN_DE_FUNC_FLAG_UNSOLICITED_OR_ACTIVE;
   341	
   342		if (nan_func->close_range)
   343			flags |= IWL_NAN_DE_FUNC_FLAG_CLOSE_RANGE;
   344	
   345		if (nan_func->type == NL80211_NAN_FUNC_FOLLOW_UP ||
   346		    (nan_func->type == NL80211_NAN_FUNC_PUBLISH &&
   347		     !nan_func->publish_bcast))
   348			flags |= IWL_NAN_DE_FUNC_FLAG_UNICAST;
   349	
   350		if (nan_func->publish_type == NL80211_NAN_SOLICITED_PUBLISH)
   351			flags |= IWL_NAN_DE_FUNC_FLAG_SOLICITED;
   352	
   353		cmn->flags = cpu_to_le16(flags);
   354		cmn->ttl = cpu_to_le32(nan_func->ttl);
   355		tail->serv_info_len = nan_func->serv_spec_info_len;
   356		if (nan_func->serv_spec_info_len)
   357			memcpy(cmd_data, nan_func->serv_spec_info,
   358			       nan_func->serv_spec_info_len);
   359	
   360		if (nan_func->type == NL80211_NAN_FUNC_FOLLOW_UP) {
   361			cmn->flw_up_id = nan_func->followup_id;
   362			cmn->flw_up_req_id = nan_func->followup_reqid;
   363			memcpy(cmn->flw_up_addr, nan_func->followup_dest.addr,
   364			       ETH_ALEN);
   365			cmn->ttl = cpu_to_le32(1);
   366		}
   367	
   368		cmd_data += ALIGN(tail->serv_info_len, 4);
   369		if (nan_func->srf_bf_len) {
   370			u8 srf_ctl = 0;
   371	
   372			srf_ctl |= SRF_BF_TYPE;
   373			srf_ctl |= (nan_func->srf_bf_idx << 2) & SRF_BLOOM_FILTER_IDX;
   374			if (nan_func->srf_include)
   375				srf_ctl |= SRF_INCLUDE;
   376	
   377			tail->srf_len = nan_func->srf_bf_len + 1;
   378			memcpy(cmd_data, &srf_ctl, sizeof(srf_ctl));
   379			memcpy(cmd_data + 1, nan_func->srf_bf, nan_func->srf_bf_len);
   380		} else if (nan_func->srf_num_macs) {
   381			u8 srf_ctl = 0;
   382			int i;
   383	
   384			if (nan_func->srf_include)
   385				srf_ctl |= SRF_INCLUDE;
   386	
   387			tail->srf_len = nan_func->srf_num_macs * ETH_ALEN + 1;
 > 388			memcpy(cmd_data, &srf_ctl, sizeof(srf_ctl));
   389	
   390			for (i = 0; i < nan_func->srf_num_macs; i++) {
   391				memcpy(cmd_data + 1 + i * ETH_ALEN,
   392				       nan_func->srf_macs[i].addr, ETH_ALEN);
   393			}
   394		}
   395	
   396		cmd_data += ALIGN(tail->srf_len, 4);
   397	
   398		if (rx_filt_len > 0)
   399			iwl_mvm_copy_filters(nan_func->rx_filters,
   400					     nan_func->num_rx_filters, cmd_data);
   401	
   402		tail->rx_filter_len = rx_filt_len;
   403		cmd_data += ALIGN(tail->rx_filter_len, 4);
   404	
   405		if (tx_filt_len > 0)
   406			iwl_mvm_copy_filters(nan_func->tx_filters,
   407					     nan_func->num_tx_filters, cmd_data);
   408	
   409		tail->tx_filter_len = tx_filt_len;
   410	
   411		ret = iwl_mvm_send_cmd(mvm, &hcmd);
   412	
   413		if (ret) {
   414			IWL_ERR(mvm, "Couldn't send NAN_DISCOVERY_FUNC_CMD: %d\n", ret);
   415			goto out_free;
   416		}
   417	
   418		pkt = hcmd.resp_pkt;
   419	
   420		if (WARN_ON(iwl_rx_packet_payload_len(pkt) != sizeof(*resp))) {
   421			ret = -EIO;
   422			goto out_free_resp;
   423		}
   424	
   425		resp = (void *)pkt->data;
   426	
   427		IWL_DEBUG_MAC80211(mvm,
   428				   "Add NAN func response status: %d, instance_id: %d\n",
   429				   resp->status, resp->instance_id);
   430	
   431		if (resp->status == IWL_NAN_DE_FUNC_STATUS_INSUFFICIENT_ENTRIES ||
   432		    resp->status == IWL_NAN_DE_FUNC_STATUS_INSUFFICIENT_MEMORY) {
   433			ret = -ENOBUFS;
   434			goto out_free_resp;
   435		}
   436	
   437		if (resp->status != IWL_NAN_DE_FUNC_STATUS_SUCCESSFUL) {
   438			ret = -EIO;
   439			goto out_free_resp;
   440		}
   441	
   442		if (cmn->instance_id &&
   443		    WARN_ON(resp->instance_id != cmn->instance_id)) {
   444			ret = -EIO;
   445			goto out_free_resp;
   446		}
   447	
   448		ret = 0;
   449	out_free_resp:
   450		iwl_free_resp(&hcmd);
   451	out_free:
   452		kfree(cmd);
   453	unlock:
   454		mutex_unlock(&mvm->mutex);
   455		return ret;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
