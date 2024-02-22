Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700B4111A1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 03:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708572039; cv=none; b=lbCgZiiFlx2+NSO35bdCS4RQDuADjd0pnPAgdboaUMykskjR3KUo9j7gwKXWYAMYlfl7/XtrqDomYCi1kFporfrXrzIe3INYnyLa0o+RmKz5iBRpElHXu/BcbTRojrUotZMpMNx7JNjOZ/eZlUDJ+gZG6U34DAjYouLQ7yVRmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708572039; c=relaxed/simple;
	bh=OMvgxw7VbJH2XvklD9IBgnQq8aRu8J04fNENZdWr9Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RcuMUc7nAEK8/4ZwlQel6bXwOpebbO0yAMrhRH2jNnB7DNGRWQo2kRGB0x37LjJTIWC4tnZa+Xm334lj5oEh7QEC3nm1cZ3xVXH5zhSq+dryixpireCjTLETW3iJjUauqTxQQSgqKf0wXJO+f2hPtNvdpGEbS+SWc0jvQtAFwpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrrRQxw7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrrRQxw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708572038; x=1740108038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OMvgxw7VbJH2XvklD9IBgnQq8aRu8J04fNENZdWr9Ug=;
  b=HrrRQxw7jvjnusVTHEJIV3K0RxBGO2s/NkS5oL/3Mt6NlsvmkRU6fl86
   jCyeDPwqllVu46ncYbS2QN/uERRS2mpSG6C4iVlnsHZsasmPjrZ5Kn4nd
   8nJydPs7RpnOTBg20E5x4k3EXFA/dU/8kt2fccoSBdFq2vVZosI8UzaAT
   7+ub56l3cWGR6TTDYL8J70FLcB2TY7OHZVosgM7Dn4au/roxTZon7T8fR
   oJ+cfD7GGax6P7gjemrflFEAzLLrOudAK3zUUhZCu2wkJQWCejO1ns8Rl
   3IpY3DGmLe9DEBhnZzlr4+0xRVdcNH8PkZxJel7LboQOKwszPyT6kPF6V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13473192"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="13473192"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 19:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936764508"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="936764508"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2024 19:20:35 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rczdR-0005wB-0T;
	Thu, 22 Feb 2024 03:20:33 +0000
Date: Thu, 22 Feb 2024 11:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 2828/21630] net/mac80211/rx.c:574:29:
 sparse: sparse: dubious: x & !y
Message-ID: <202402221156.4n4BOuxm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   caea2096c89e8d8cbaffde0d33f3c6d748c4d0c5
commit: 9baadf685a5618364776aed92067526bb40c137d [2828/21630] build_bug.h: remove most of dummy BUILD_BUG_ON stubs for Sparse
config: x86_64-randconfig-123-20240220 (https://download.01.org/0day-ci/archive/20240222/202402221156.4n4BOuxm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221156.4n4BOuxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221156.4n4BOuxm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/mac80211/rx.c:574:29: sparse: sparse: dubious: x & !y
   net/mac80211/rx.c: In function 'ieee80211_handle_mu_mimo_mon':
   net/mac80211/rx.c:224:9: warning: alignment 1 of 'struct <anonymous>' is less than 2 [-Wpacked-not-aligned]
     224 |         } __packed action;
         |         ^
   net/mac80211/rx.c: In function 'ieee80211_add_rx_radiotap_header':
   net/mac80211/rx.c:307:22: warning: taking address of packed member of 'struct ieee80211_radiotap_header' may result in an unaligned pointer value [-Waddress-of-packed-member]
     307 |         it_present = &rthdr->it_present;
         |                      ^~~~~~~~~~~~~~~~~~
   net/mac80211/rx.o: warning: objtool: sta_ps_start()+0x30f: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_process_sa_query_req()+0x7a8: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_rx_h_decrypt()+0xb52: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_rx_h_defragment()+0x118c: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_rx_h_mesh_fwding()+0x83a: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_deliver_skb()+0x6ce: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_rx_h_action()+0x99c: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_add_rx_radiotap_header()+0x1c1c: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_rx_monitor()+0x98: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_release_reorder_frame.constprop.0()+0x9c2: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_sta_reorder_release.isra.0()+0xbe: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_release_reorder_frames.isra.0()+0xee: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_sta_manage_reorder_buf.isra.0()+0x16a: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_rx_reorder_ampdu()+0x1db: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_rx_h_ctrl()+0x52f: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_accept_frame()+0x991: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_rx_handlers()+0x1b2: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_prepare_and_rx_handle()+0x144: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_rx_napi()+0x13a: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_mark_rx_ba_filtered_frames()+0x44d: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_release_reorder_timeout()+0x3fc: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_check_fast_rx()+0x592: sibling call from callable instruction with modified stack frame
   net/mac80211/rx.o: warning: objtool: ieee80211_clear_fast_rx()+0x28: sibling call from callable instruction with modified stack frame

vim +574 net/mac80211/rx.c

41cbb0f5a29592 Luca Coelho   2018-06-09  554  
41cbb0f5a29592 Luca Coelho   2018-06-09  555  		if (status->enc_flags & RX_ENC_FLAG_STBC_MASK) {
41cbb0f5a29592 Luca Coelho   2018-06-09  556  			he.data6 |= HE_PREP(DATA6_NSTS,
41cbb0f5a29592 Luca Coelho   2018-06-09  557  					    FIELD_GET(RX_ENC_FLAG_STBC_MASK,
41cbb0f5a29592 Luca Coelho   2018-06-09  558  						      status->enc_flags));
41cbb0f5a29592 Luca Coelho   2018-06-09  559  			he.data3 |= HE_PREP(DATA3_STBC, 1);
41cbb0f5a29592 Luca Coelho   2018-06-09  560  		} else {
41cbb0f5a29592 Luca Coelho   2018-06-09  561  			he.data6 |= HE_PREP(DATA6_NSTS, status->nss);
41cbb0f5a29592 Luca Coelho   2018-06-09  562  		}
41cbb0f5a29592 Luca Coelho   2018-06-09  563  
41cbb0f5a29592 Luca Coelho   2018-06-09  564  #define CHECK_GI(s) \
41cbb0f5a29592 Luca Coelho   2018-06-09  565  	BUILD_BUG_ON(IEEE80211_RADIOTAP_HE_DATA5_GI_##s != \
41cbb0f5a29592 Luca Coelho   2018-06-09  566  		     (int)NL80211_RATE_INFO_HE_GI_##s)
41cbb0f5a29592 Luca Coelho   2018-06-09  567  
41cbb0f5a29592 Luca Coelho   2018-06-09  568  		CHECK_GI(0_8);
41cbb0f5a29592 Luca Coelho   2018-06-09  569  		CHECK_GI(1_6);
41cbb0f5a29592 Luca Coelho   2018-06-09  570  		CHECK_GI(3_2);
41cbb0f5a29592 Luca Coelho   2018-06-09  571  
41cbb0f5a29592 Luca Coelho   2018-06-09  572  		he.data3 |= HE_PREP(DATA3_DATA_MCS, status->rate_idx);
41cbb0f5a29592 Luca Coelho   2018-06-09  573  		he.data3 |= HE_PREP(DATA3_DATA_DCM, status->he_dcm);
41cbb0f5a29592 Luca Coelho   2018-06-09 @574  		he.data3 |= HE_PREP(DATA3_CODING,
41cbb0f5a29592 Luca Coelho   2018-06-09  575  				    !!(status->enc_flags & RX_ENC_FLAG_LDPC));
41cbb0f5a29592 Luca Coelho   2018-06-09  576  
41cbb0f5a29592 Luca Coelho   2018-06-09  577  		he.data5 |= HE_PREP(DATA5_GI, status->he_gi);
41cbb0f5a29592 Luca Coelho   2018-06-09  578  
41cbb0f5a29592 Luca Coelho   2018-06-09  579  		switch (status->bw) {
41cbb0f5a29592 Luca Coelho   2018-06-09  580  		case RATE_INFO_BW_20:
41cbb0f5a29592 Luca Coelho   2018-06-09  581  			he.data5 |= HE_PREP(DATA5_DATA_BW_RU_ALLOC,
41cbb0f5a29592 Luca Coelho   2018-06-09  582  					    IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_20MHZ);
41cbb0f5a29592 Luca Coelho   2018-06-09  583  			break;
41cbb0f5a29592 Luca Coelho   2018-06-09  584  		case RATE_INFO_BW_40:
41cbb0f5a29592 Luca Coelho   2018-06-09  585  			he.data5 |= HE_PREP(DATA5_DATA_BW_RU_ALLOC,
41cbb0f5a29592 Luca Coelho   2018-06-09  586  					    IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_40MHZ);
41cbb0f5a29592 Luca Coelho   2018-06-09  587  			break;
41cbb0f5a29592 Luca Coelho   2018-06-09  588  		case RATE_INFO_BW_80:
41cbb0f5a29592 Luca Coelho   2018-06-09  589  			he.data5 |= HE_PREP(DATA5_DATA_BW_RU_ALLOC,
41cbb0f5a29592 Luca Coelho   2018-06-09  590  					    IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_80MHZ);
41cbb0f5a29592 Luca Coelho   2018-06-09  591  			break;
41cbb0f5a29592 Luca Coelho   2018-06-09  592  		case RATE_INFO_BW_160:
41cbb0f5a29592 Luca Coelho   2018-06-09  593  			he.data5 |= HE_PREP(DATA5_DATA_BW_RU_ALLOC,
41cbb0f5a29592 Luca Coelho   2018-06-09  594  					    IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_160MHZ);
41cbb0f5a29592 Luca Coelho   2018-06-09  595  			break;
41cbb0f5a29592 Luca Coelho   2018-06-09  596  		case RATE_INFO_BW_HE_RU:
41cbb0f5a29592 Luca Coelho   2018-06-09  597  #define CHECK_RU_ALLOC(s) \
41cbb0f5a29592 Luca Coelho   2018-06-09  598  	BUILD_BUG_ON(IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_##s##T != \
41cbb0f5a29592 Luca Coelho   2018-06-09  599  		     NL80211_RATE_INFO_HE_RU_ALLOC_##s + 4)
41cbb0f5a29592 Luca Coelho   2018-06-09  600  
41cbb0f5a29592 Luca Coelho   2018-06-09  601  			CHECK_RU_ALLOC(26);
41cbb0f5a29592 Luca Coelho   2018-06-09  602  			CHECK_RU_ALLOC(52);
41cbb0f5a29592 Luca Coelho   2018-06-09  603  			CHECK_RU_ALLOC(106);
41cbb0f5a29592 Luca Coelho   2018-06-09  604  			CHECK_RU_ALLOC(242);
41cbb0f5a29592 Luca Coelho   2018-06-09  605  			CHECK_RU_ALLOC(484);
41cbb0f5a29592 Luca Coelho   2018-06-09  606  			CHECK_RU_ALLOC(996);
41cbb0f5a29592 Luca Coelho   2018-06-09  607  			CHECK_RU_ALLOC(2x996);
41cbb0f5a29592 Luca Coelho   2018-06-09  608  
41cbb0f5a29592 Luca Coelho   2018-06-09  609  			he.data5 |= HE_PREP(DATA5_DATA_BW_RU_ALLOC,
41cbb0f5a29592 Luca Coelho   2018-06-09  610  					    status->he_ru + 4);
41cbb0f5a29592 Luca Coelho   2018-06-09  611  			break;
41cbb0f5a29592 Luca Coelho   2018-06-09  612  		default:
41cbb0f5a29592 Luca Coelho   2018-06-09  613  			WARN_ONCE(1, "Invalid SU BW %d\n", status->bw);
41cbb0f5a29592 Luca Coelho   2018-06-09  614  		}
41cbb0f5a29592 Luca Coelho   2018-06-09  615  
41cbb0f5a29592 Luca Coelho   2018-06-09  616  		/* ensure 2 byte alignment */
41cbb0f5a29592 Luca Coelho   2018-06-09  617  		while ((pos - (u8 *)rthdr) & 1)
41cbb0f5a29592 Luca Coelho   2018-06-09  618  			pos++;
41cbb0f5a29592 Luca Coelho   2018-06-09  619  		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_HE);
41cbb0f5a29592 Luca Coelho   2018-06-09  620  		memcpy(pos, &he, sizeof(he));
41cbb0f5a29592 Luca Coelho   2018-06-09  621  		pos += sizeof(he);
41cbb0f5a29592 Luca Coelho   2018-06-09  622  	}
41cbb0f5a29592 Luca Coelho   2018-06-09  623  
41cbb0f5a29592 Luca Coelho   2018-06-09  624  	if (status->encoding == RX_ENC_HE &&
41cbb0f5a29592 Luca Coelho   2018-06-09  625  	    status->flag & RX_FLAG_RADIOTAP_HE_MU) {
41cbb0f5a29592 Luca Coelho   2018-06-09  626  		/* ensure 2 byte alignment */
41cbb0f5a29592 Luca Coelho   2018-06-09  627  		while ((pos - (u8 *)rthdr) & 1)
41cbb0f5a29592 Luca Coelho   2018-06-09  628  			pos++;
41cbb0f5a29592 Luca Coelho   2018-06-09  629  		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_HE_MU);
41cbb0f5a29592 Luca Coelho   2018-06-09  630  		memcpy(pos, &he_mu, sizeof(he_mu));
41cbb0f5a29592 Luca Coelho   2018-06-09  631  		pos += sizeof(he_mu);
41cbb0f5a29592 Luca Coelho   2018-06-09  632  	}
41cbb0f5a29592 Luca Coelho   2018-06-09  633  
a144f378a489b5 Johannes Berg 2013-07-03  634  	for_each_set_bit(chain, &chains, IEEE80211_MAX_CHAINS) {
a144f378a489b5 Johannes Berg 2013-07-03  635  		*pos++ = status->chain_signal[chain];
a144f378a489b5 Johannes Berg 2013-07-03  636  		*pos++ = chain;
a144f378a489b5 Johannes Berg 2013-07-03  637  	}
1f7bba79af57ce Johannes Berg 2014-11-06  638  
1f7bba79af57ce Johannes Berg 2014-11-06  639  	if (status->flag & RX_FLAG_RADIOTAP_VENDOR_DATA) {
1f7bba79af57ce Johannes Berg 2014-11-06  640  		/* ensure 2 byte alignment for the vendor field as required */
1f7bba79af57ce Johannes Berg 2014-11-06  641  		if ((pos - (u8 *)rthdr) & 1)
1f7bba79af57ce Johannes Berg 2014-11-06  642  			*pos++ = 0;
1f7bba79af57ce Johannes Berg 2014-11-06  643  		*pos++ = rtap.oui[0];
1f7bba79af57ce Johannes Berg 2014-11-06  644  		*pos++ = rtap.oui[1];
1f7bba79af57ce Johannes Berg 2014-11-06  645  		*pos++ = rtap.oui[2];
1f7bba79af57ce Johannes Berg 2014-11-06  646  		*pos++ = rtap.subns;
1f7bba79af57ce Johannes Berg 2014-11-06  647  		put_unaligned_le16(rtap.len, pos);
1f7bba79af57ce Johannes Berg 2014-11-06  648  		pos += 2;
1f7bba79af57ce Johannes Berg 2014-11-06  649  		/* align the actual payload as requested */
1f7bba79af57ce Johannes Berg 2014-11-06  650  		while ((pos - (u8 *)rthdr) & (rtap.align - 1))
1f7bba79af57ce Johannes Berg 2014-11-06  651  			*pos++ = 0;
1f7bba79af57ce Johannes Berg 2014-11-06  652  		/* data (and possible padding) already follows */
1f7bba79af57ce Johannes Berg 2014-11-06  653  	}
601ae7f25aea58 Bruno Randolf 2008-05-08  654  }
601ae7f25aea58 Bruno Randolf 2008-05-08  655  

:::::: The code at line 574 was first introduced by commit
:::::: 41cbb0f5a29592874355e4159489eb08337cd50e mac80211: add support for HE

:::::: TO: Luca Coelho <luciano.coelho@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
