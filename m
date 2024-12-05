Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0792317E473
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414898; cv=none; b=H5fFHFUeuQPx8CfjwvVDsL2lIWD8kYmLeSwX6onFMYL9yLkDfxMOitjqcpCWh7tQRyijebsHWKb4JquqXeprndOh4Ax5fmMztqW9V3xoCI0YpljTD4mt7Ilf0eAq9UliumXDzJ0FVoIGx46lS+PZf5RMA55/AN4gOuwlgbwjObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414898; c=relaxed/simple;
	bh=E4q5XI5E09WTdjQXmiPWM5Mu5Hz60+XxMJdNP9UsOSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vAzpm/CfP6n21G16uOQYWobdceuzsbz7QnX+XE+ENs0BmHcD/zzc9egk1evZ2ZDuk+f/476dafAicFAmXifYO1kn9wLniYM6ruUeHjakpgChhfcWzhcH4tVVr/Z6k0qC1sIcunmn8z4rZTBpTIQopbvLgSVBh/ji7nWRj/Kkqd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKQY3FGw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKQY3FGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733414896; x=1764950896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4q5XI5E09WTdjQXmiPWM5Mu5Hz60+XxMJdNP9UsOSw=;
  b=VKQY3FGw8AVwSow6MHjMGJk6/R5Yxltv2pm4WKp2MinyJ2lgyiKDtkrv
   TY1tOzxyaVMefd66GcbErkXKBM22V3O/EE5ygbKBEeUYhnO8t0DSxqb35
   KZ4pzQhq3d0ywIpqXDmQGT7DXd2lmGQ5W3N+MdPH4XiOEAkFrT08nK94B
   /M6m13Hil0C/VJLy8I4Iw7Ql8IGym4hOA9jmi1qE4aeJxCDX9QIi+0rUn
   9oAGhty7v1kSQoFUyM5B3tZZmALmhbhexZmbVCeCw8ZO+xleZI0DLMSaf
   nHHnceNJIiYELjk1qZxBSHayXbui1MzaIOpEe4ycu5tIFLZEGwD3TXVwO
   Q==;
X-CSE-ConnectionGUID: fwEgkJfzSMyg2YQn8brQuw==
X-CSE-MsgGUID: 111Ub6aGRhO1moFQ4VT0cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51153277"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="51153277"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 08:07:47 -0800
X-CSE-ConnectionGUID: Z0HbvepUTH25JGVKPZhZSQ==
X-CSE-MsgGUID: fxiQ8vtIQwqT0km9G23y6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="99212100"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Dec 2024 08:07:46 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJEOF-0000BZ-0P;
	Thu, 05 Dec 2024 16:07:43 +0000
Date: Fri, 6 Dec 2024 00:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1320/1320] net/mac80211/rx.c:574:29:
 sparse: sparse: dubious: x & !y
Message-ID: <202412052349.hadZoo7L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e416567e80778667f6a949f0f19c32a3ee4cb06e
commit: 9baadf685a5618364776aed92067526bb40c137d [1320/1320] build_bug.h: remove most of dummy BUILD_BUG_ON stubs for Sparse
config: x86_64-randconfig-121 (https://download.01.org/0day-ci/archive/20241205/202412052349.hadZoo7L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412052349.hadZoo7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412052349.hadZoo7L-lkp@intel.com/

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

vim +574 net/mac80211/rx.c

41cbb0f5a295928 Luca Coelho   2018-06-09  554  
41cbb0f5a295928 Luca Coelho   2018-06-09  555  		if (status->enc_flags & RX_ENC_FLAG_STBC_MASK) {
41cbb0f5a295928 Luca Coelho   2018-06-09  556  			he.data6 |= HE_PREP(DATA6_NSTS,
41cbb0f5a295928 Luca Coelho   2018-06-09  557  					    FIELD_GET(RX_ENC_FLAG_STBC_MASK,
41cbb0f5a295928 Luca Coelho   2018-06-09  558  						      status->enc_flags));
41cbb0f5a295928 Luca Coelho   2018-06-09  559  			he.data3 |= HE_PREP(DATA3_STBC, 1);
41cbb0f5a295928 Luca Coelho   2018-06-09  560  		} else {
41cbb0f5a295928 Luca Coelho   2018-06-09  561  			he.data6 |= HE_PREP(DATA6_NSTS, status->nss);
41cbb0f5a295928 Luca Coelho   2018-06-09  562  		}
41cbb0f5a295928 Luca Coelho   2018-06-09  563  
41cbb0f5a295928 Luca Coelho   2018-06-09  564  #define CHECK_GI(s) \
41cbb0f5a295928 Luca Coelho   2018-06-09  565  	BUILD_BUG_ON(IEEE80211_RADIOTAP_HE_DATA5_GI_##s != \
41cbb0f5a295928 Luca Coelho   2018-06-09  566  		     (int)NL80211_RATE_INFO_HE_GI_##s)
41cbb0f5a295928 Luca Coelho   2018-06-09  567  
41cbb0f5a295928 Luca Coelho   2018-06-09  568  		CHECK_GI(0_8);
41cbb0f5a295928 Luca Coelho   2018-06-09  569  		CHECK_GI(1_6);
41cbb0f5a295928 Luca Coelho   2018-06-09  570  		CHECK_GI(3_2);
41cbb0f5a295928 Luca Coelho   2018-06-09  571  
41cbb0f5a295928 Luca Coelho   2018-06-09  572  		he.data3 |= HE_PREP(DATA3_DATA_MCS, status->rate_idx);
41cbb0f5a295928 Luca Coelho   2018-06-09  573  		he.data3 |= HE_PREP(DATA3_DATA_DCM, status->he_dcm);
41cbb0f5a295928 Luca Coelho   2018-06-09 @574  		he.data3 |= HE_PREP(DATA3_CODING,
41cbb0f5a295928 Luca Coelho   2018-06-09  575  				    !!(status->enc_flags & RX_ENC_FLAG_LDPC));
41cbb0f5a295928 Luca Coelho   2018-06-09  576  
41cbb0f5a295928 Luca Coelho   2018-06-09  577  		he.data5 |= HE_PREP(DATA5_GI, status->he_gi);
41cbb0f5a295928 Luca Coelho   2018-06-09  578  
41cbb0f5a295928 Luca Coelho   2018-06-09  579  		switch (status->bw) {
41cbb0f5a295928 Luca Coelho   2018-06-09  580  		case RATE_INFO_BW_20:
41cbb0f5a295928 Luca Coelho   2018-06-09  581  			he.data5 |= HE_PREP(DATA5_DATA_BW_RU_ALLOC,
41cbb0f5a295928 Luca Coelho   2018-06-09  582  					    IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_20MHZ);
41cbb0f5a295928 Luca Coelho   2018-06-09  583  			break;
41cbb0f5a295928 Luca Coelho   2018-06-09  584  		case RATE_INFO_BW_40:
41cbb0f5a295928 Luca Coelho   2018-06-09  585  			he.data5 |= HE_PREP(DATA5_DATA_BW_RU_ALLOC,
41cbb0f5a295928 Luca Coelho   2018-06-09  586  					    IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_40MHZ);
41cbb0f5a295928 Luca Coelho   2018-06-09  587  			break;
41cbb0f5a295928 Luca Coelho   2018-06-09  588  		case RATE_INFO_BW_80:
41cbb0f5a295928 Luca Coelho   2018-06-09  589  			he.data5 |= HE_PREP(DATA5_DATA_BW_RU_ALLOC,
41cbb0f5a295928 Luca Coelho   2018-06-09  590  					    IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_80MHZ);
41cbb0f5a295928 Luca Coelho   2018-06-09  591  			break;
41cbb0f5a295928 Luca Coelho   2018-06-09  592  		case RATE_INFO_BW_160:
41cbb0f5a295928 Luca Coelho   2018-06-09  593  			he.data5 |= HE_PREP(DATA5_DATA_BW_RU_ALLOC,
41cbb0f5a295928 Luca Coelho   2018-06-09  594  					    IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_160MHZ);
41cbb0f5a295928 Luca Coelho   2018-06-09  595  			break;
41cbb0f5a295928 Luca Coelho   2018-06-09  596  		case RATE_INFO_BW_HE_RU:
41cbb0f5a295928 Luca Coelho   2018-06-09  597  #define CHECK_RU_ALLOC(s) \
41cbb0f5a295928 Luca Coelho   2018-06-09  598  	BUILD_BUG_ON(IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_##s##T != \
41cbb0f5a295928 Luca Coelho   2018-06-09  599  		     NL80211_RATE_INFO_HE_RU_ALLOC_##s + 4)
41cbb0f5a295928 Luca Coelho   2018-06-09  600  
41cbb0f5a295928 Luca Coelho   2018-06-09  601  			CHECK_RU_ALLOC(26);
41cbb0f5a295928 Luca Coelho   2018-06-09  602  			CHECK_RU_ALLOC(52);
41cbb0f5a295928 Luca Coelho   2018-06-09  603  			CHECK_RU_ALLOC(106);
41cbb0f5a295928 Luca Coelho   2018-06-09  604  			CHECK_RU_ALLOC(242);
41cbb0f5a295928 Luca Coelho   2018-06-09  605  			CHECK_RU_ALLOC(484);
41cbb0f5a295928 Luca Coelho   2018-06-09  606  			CHECK_RU_ALLOC(996);
41cbb0f5a295928 Luca Coelho   2018-06-09  607  			CHECK_RU_ALLOC(2x996);
41cbb0f5a295928 Luca Coelho   2018-06-09  608  
41cbb0f5a295928 Luca Coelho   2018-06-09  609  			he.data5 |= HE_PREP(DATA5_DATA_BW_RU_ALLOC,
41cbb0f5a295928 Luca Coelho   2018-06-09  610  					    status->he_ru + 4);
41cbb0f5a295928 Luca Coelho   2018-06-09  611  			break;
41cbb0f5a295928 Luca Coelho   2018-06-09  612  		default:
41cbb0f5a295928 Luca Coelho   2018-06-09  613  			WARN_ONCE(1, "Invalid SU BW %d\n", status->bw);
41cbb0f5a295928 Luca Coelho   2018-06-09  614  		}
41cbb0f5a295928 Luca Coelho   2018-06-09  615  
41cbb0f5a295928 Luca Coelho   2018-06-09  616  		/* ensure 2 byte alignment */
41cbb0f5a295928 Luca Coelho   2018-06-09  617  		while ((pos - (u8 *)rthdr) & 1)
41cbb0f5a295928 Luca Coelho   2018-06-09  618  			pos++;
41cbb0f5a295928 Luca Coelho   2018-06-09  619  		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_HE);
41cbb0f5a295928 Luca Coelho   2018-06-09  620  		memcpy(pos, &he, sizeof(he));
41cbb0f5a295928 Luca Coelho   2018-06-09  621  		pos += sizeof(he);
41cbb0f5a295928 Luca Coelho   2018-06-09  622  	}
41cbb0f5a295928 Luca Coelho   2018-06-09  623  
41cbb0f5a295928 Luca Coelho   2018-06-09  624  	if (status->encoding == RX_ENC_HE &&
41cbb0f5a295928 Luca Coelho   2018-06-09  625  	    status->flag & RX_FLAG_RADIOTAP_HE_MU) {
41cbb0f5a295928 Luca Coelho   2018-06-09  626  		/* ensure 2 byte alignment */
41cbb0f5a295928 Luca Coelho   2018-06-09  627  		while ((pos - (u8 *)rthdr) & 1)
41cbb0f5a295928 Luca Coelho   2018-06-09  628  			pos++;
41cbb0f5a295928 Luca Coelho   2018-06-09  629  		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_HE_MU);
41cbb0f5a295928 Luca Coelho   2018-06-09  630  		memcpy(pos, &he_mu, sizeof(he_mu));
41cbb0f5a295928 Luca Coelho   2018-06-09  631  		pos += sizeof(he_mu);
41cbb0f5a295928 Luca Coelho   2018-06-09  632  	}
41cbb0f5a295928 Luca Coelho   2018-06-09  633  
a144f378a489b59 Johannes Berg 2013-07-03  634  	for_each_set_bit(chain, &chains, IEEE80211_MAX_CHAINS) {
a144f378a489b59 Johannes Berg 2013-07-03  635  		*pos++ = status->chain_signal[chain];
a144f378a489b59 Johannes Berg 2013-07-03  636  		*pos++ = chain;
a144f378a489b59 Johannes Berg 2013-07-03  637  	}
1f7bba79af57cee Johannes Berg 2014-11-06  638  
1f7bba79af57cee Johannes Berg 2014-11-06  639  	if (status->flag & RX_FLAG_RADIOTAP_VENDOR_DATA) {
1f7bba79af57cee Johannes Berg 2014-11-06  640  		/* ensure 2 byte alignment for the vendor field as required */
1f7bba79af57cee Johannes Berg 2014-11-06  641  		if ((pos - (u8 *)rthdr) & 1)
1f7bba79af57cee Johannes Berg 2014-11-06  642  			*pos++ = 0;
1f7bba79af57cee Johannes Berg 2014-11-06  643  		*pos++ = rtap.oui[0];
1f7bba79af57cee Johannes Berg 2014-11-06  644  		*pos++ = rtap.oui[1];
1f7bba79af57cee Johannes Berg 2014-11-06  645  		*pos++ = rtap.oui[2];
1f7bba79af57cee Johannes Berg 2014-11-06  646  		*pos++ = rtap.subns;
1f7bba79af57cee Johannes Berg 2014-11-06  647  		put_unaligned_le16(rtap.len, pos);
1f7bba79af57cee Johannes Berg 2014-11-06  648  		pos += 2;
1f7bba79af57cee Johannes Berg 2014-11-06  649  		/* align the actual payload as requested */
1f7bba79af57cee Johannes Berg 2014-11-06  650  		while ((pos - (u8 *)rthdr) & (rtap.align - 1))
1f7bba79af57cee Johannes Berg 2014-11-06  651  			*pos++ = 0;
1f7bba79af57cee Johannes Berg 2014-11-06  652  		/* data (and possible padding) already follows */
1f7bba79af57cee Johannes Berg 2014-11-06  653  	}
601ae7f25aea58f Bruno Randolf 2008-05-08  654  }
601ae7f25aea58f Bruno Randolf 2008-05-08  655  

:::::: The code at line 574 was first introduced by commit
:::::: 41cbb0f5a29592874355e4159489eb08337cd50e mac80211: add support for HE

:::::: TO: Luca Coelho <luciano.coelho@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
