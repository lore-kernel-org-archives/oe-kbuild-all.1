Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DCE1EDA0E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 06:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754289426; cv=none; b=ayrLxFXiCzuSvOmzUZW/4y4F9mMAUjPseEiTnzfHd9tXeiwAJgnRxe+kFUD4yvS9mGzurwjwJlrPkAvDGN4i5LeJsbpkM8mruhsG6RXYTHpDQQndSaE5KaVae6ql4J6B6cMNCodTYs+SSE4zZosghb8JJOLgo+hXVKqrSeWsOJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754289426; c=relaxed/simple;
	bh=cWo+1+KQavKfFSEibhqQKO3SVD0lpoErOf3vNT7vPCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Onr8MEiZKi023fqqVDEjnSx/BL8KvzgPTrmwS43Is7HQBQot5dmweYJA8GCABin9o58li8orSuWlqavIKt6RzD1avb74MkX6HMyh2959Av3Rph7tmIWQgqMJLnG6cJXh+y+XjXQStHubdGA8D55/bMEMJ+WoF5ICFp3o3Y2y+b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PHfyz+uO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PHfyz+uO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-459d40d16bdso6461855e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Aug 2025 23:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754289423; x=1754894223; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YMqOordL6fYAlMra8g6TRkHlEFJWMTo9GYxxpxwalRg=;
        b=PHfyz+uOEd/M4EBTDBdwsS9P0lJX9fffGbx+n7UWjMNRH+oG4BUEvCF5vIBH+hAYwS
         VEuHBQMx528u6+DiD4hEaLt4eAwgtbVw9y02lb9S7D8/jdrtKh2o7MOsMHiiU9GVaR6g
         q0v1LL8KWI/dnSyPCrG6X5JRROfi9JH5A6+onPJI7/D9XGLL+6Qpb97Wjvj3a61vRRNp
         uY4I3aR7oFYC3ZwnSt+BL1aDCp0qUBnmWZY25D80LGux7rkuzcyb3px6pnBMnGpEgcgD
         7zCJESOodfhoTyn0pN6hIgp839E7r3QLH7+MRyiSBj3X0ppH0zsm2w3Q9Zauot5O5PZj
         HhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754289423; x=1754894223;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YMqOordL6fYAlMra8g6TRkHlEFJWMTo9GYxxpxwalRg=;
        b=F774b+gtGtRS8xtirZnjeO1q+AtNI5myCuLeF/hPRUoANCaNDL+sTxrSisBmH88lyQ
         8T00daUVXwrYhR+uN4fLMdtVEYIofZ/HzI3JRushuS5iyDb3s5QrOFrWcyRefOeTykrA
         6cjcrJq8HrCtDRZoQkzOBYT5eLCETRHJDuayvsyWepIxNROsM02avDvkGXlP03BPWkVx
         YKflV5R/1rsOx7/D9/ln21Drz+C+/85oI+3NPkNM6/kER2q1OqD6mA/auQdQMJaSvfP/
         HvFSNNbnaROvQDqjJr9Rf8erSKNyRGjkG13aJjq0UF/spIoxI15vB3kPjv1jV4WFan5C
         CxZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQfZmiyt3Y/piL1eQVujKUdM5zmfcpHyKPiycqVejToCMbaoqX/3cWo7gEWbUjEA4ykbXvjVISKsPpHkfc@lists.linux.dev
X-Gm-Message-State: AOJu0YxjPQsfRwJKuhAl/oBxZK2oXODjsH4CkhlEWBWHbw9DvNrk2oYH
	NcXnW1L4HX4bPpzXSfP97/YsVg+MkOoqXWFiQf2l5+1tKDoDCHNa/4DjzD2/f5ykZRI=
X-Gm-Gg: ASbGncvMw4GhqMSSw0OexC3fbPsthft+suqhcESL3DNDPmQD86xt/svvUnXy93aHPKr
	m7k6tQAUsZnbk+Bk2+1xOAQ+2KqoZjm8QU3pSWNvNjnE0UjhEPKxlJbdrcufTy0puE4KVMIwAp9
	Vi1pPG8ZJohEWBYAhia3zjLU4oMAd/x6QThiuwoTLPc2LskJz7fes53VwXmGXaV7tlVbExS8x3T
	tUtYvUkf37Kq//h0YGGLyFgcmsGyvlJtsyul62L0H65ThyNAPqvyY9hrEE6KJnWuLDeH2R1YWK0
	Y+TOe5JsADITzM7NjKSbCC6MxavxjU1xiC3sOnZZTPHkF08qdjUFIHHKlGmwo4w81TKkn3aOL6l
	yiYnaTgIEqF1rZhX0NGe3BK5kVlE=
X-Google-Smtp-Source: AGHT+IGEvRyryD7ili35wNADk5uvsbVaFZNVwOw1rvSQfa0XkjNQ7ywk15aPbVYA/1Mh9Vh+0rwX2Q==
X-Received: by 2002:a05:600c:1554:b0:456:1611:cea5 with SMTP id 5b1f17b1804b1-458b6b58472mr67261065e9.18.1754289422884;
        Sun, 03 Aug 2025 23:37:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458bb04c612sm76259555e9.0.2025.08.03.23.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 23:37:02 -0700 (PDT)
Date: Mon, 4 Aug 2025 09:36:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	Daniel Gabay <daniel.gabay@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Shaul Triebitz <shaul.triebitz@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:2093
 iwl_mld_set_key_add() error: we previously assumed 'mld_sta' could be null
 (see line 2076)
Message-ID: <8bf5e723-f70f-4767-8d8e-476143c962c3@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   186f3edfdd41f2ae87fc40a9ccba52a3bf930994
commit: d1e879ec600f9b3bdd253167533959facfefb17b wifi: iwlwifi: add iwlmld sub-driver
config: i386-randconfig-141-20250803 (https://download.01.org/0day-ci/archive/20250803/202508031151.K87baMm4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508031151.K87baMm4-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:2093 iwl_mld_set_key_add() error: we previously assumed 'mld_sta' could be null (see line 2076)
drivers/net/wireless/intel/iwlwifi/mld/scan.c:1124 iwl_mld_scan_cmd_set_chan_params() warn: assigning (-128) to unsigned variable 'cfg->v5.psd_20'
drivers/net/wireless/intel/iwlwifi/mld/ptp.c:298 iwl_mld_ptp_init() warn: passing zero to 'PTR_ERR'
   The IS_ERR_OR_NULL() check should be changed to IS_ERR().  See
   https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/
   for more details.

vim +/mld_sta +2093 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c

d1e879ec600f9b Miri Korenblit 2025-02-16  2024  static int iwl_mld_set_key_add(struct iwl_mld *mld,
d1e879ec600f9b Miri Korenblit 2025-02-16  2025  			       struct ieee80211_vif *vif,
d1e879ec600f9b Miri Korenblit 2025-02-16  2026  			       struct ieee80211_sta *sta,
d1e879ec600f9b Miri Korenblit 2025-02-16  2027  			       struct ieee80211_key_conf *key)
d1e879ec600f9b Miri Korenblit 2025-02-16  2028  {
d1e879ec600f9b Miri Korenblit 2025-02-16  2029  	struct iwl_mld_vif *mld_vif = iwl_mld_vif_from_mac80211(vif);
d1e879ec600f9b Miri Korenblit 2025-02-16  2030  	struct iwl_mld_sta *mld_sta =
d1e879ec600f9b Miri Korenblit 2025-02-16  2031  		sta ? iwl_mld_sta_from_mac80211(sta) : NULL;
                                                                                                       ^^^^

d1e879ec600f9b Miri Korenblit 2025-02-16  2032  	struct iwl_mld_ptk_pn *ptk_pn = NULL;
d1e879ec600f9b Miri Korenblit 2025-02-16  2033  	int keyidx = key->keyidx;
d1e879ec600f9b Miri Korenblit 2025-02-16  2034  	int ret;
d1e879ec600f9b Miri Korenblit 2025-02-16  2035  
d1e879ec600f9b Miri Korenblit 2025-02-16  2036  	/* Will be set to 0 if added successfully */
d1e879ec600f9b Miri Korenblit 2025-02-16  2037  	key->hw_key_idx = STA_KEY_IDX_INVALID;
d1e879ec600f9b Miri Korenblit 2025-02-16  2038  
d1e879ec600f9b Miri Korenblit 2025-02-16  2039  	switch (key->cipher) {
d1e879ec600f9b Miri Korenblit 2025-02-16  2040  	case WLAN_CIPHER_SUITE_WEP40:
d1e879ec600f9b Miri Korenblit 2025-02-16  2041  	case WLAN_CIPHER_SUITE_WEP104:
d1e879ec600f9b Miri Korenblit 2025-02-16  2042  		IWL_DEBUG_MAC80211(mld, "Use SW encryption for WEP\n");
d1e879ec600f9b Miri Korenblit 2025-02-16  2043  		return -EOPNOTSUPP;
d1e879ec600f9b Miri Korenblit 2025-02-16  2044  	case WLAN_CIPHER_SUITE_TKIP:
d1e879ec600f9b Miri Korenblit 2025-02-16  2045  		if (vif->type == NL80211_IFTYPE_STATION) {
d1e879ec600f9b Miri Korenblit 2025-02-16  2046  			key->flags |= IEEE80211_KEY_FLAG_PUT_MIC_SPACE;
d1e879ec600f9b Miri Korenblit 2025-02-16  2047  			break;
d1e879ec600f9b Miri Korenblit 2025-02-16  2048  		}
d1e879ec600f9b Miri Korenblit 2025-02-16  2049  		IWL_DEBUG_MAC80211(mld, "Use SW encryption for TKIP\n");
d1e879ec600f9b Miri Korenblit 2025-02-16  2050  		return -EOPNOTSUPP;
d1e879ec600f9b Miri Korenblit 2025-02-16  2051  	case WLAN_CIPHER_SUITE_CCMP:
d1e879ec600f9b Miri Korenblit 2025-02-16  2052  	case WLAN_CIPHER_SUITE_GCMP:
d1e879ec600f9b Miri Korenblit 2025-02-16  2053  	case WLAN_CIPHER_SUITE_GCMP_256:
d1e879ec600f9b Miri Korenblit 2025-02-16  2054  	case WLAN_CIPHER_SUITE_AES_CMAC:
d1e879ec600f9b Miri Korenblit 2025-02-16  2055  	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
d1e879ec600f9b Miri Korenblit 2025-02-16  2056  	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
d1e879ec600f9b Miri Korenblit 2025-02-16  2057  		break;
d1e879ec600f9b Miri Korenblit 2025-02-16  2058  	default:
d1e879ec600f9b Miri Korenblit 2025-02-16  2059  		return -EOPNOTSUPP;
d1e879ec600f9b Miri Korenblit 2025-02-16  2060  	}
d1e879ec600f9b Miri Korenblit 2025-02-16  2061  
d1e879ec600f9b Miri Korenblit 2025-02-16  2062  	if (vif->type == NL80211_IFTYPE_STATION &&
d1e879ec600f9b Miri Korenblit 2025-02-16  2063  	    (keyidx == 6 || keyidx == 7))
d1e879ec600f9b Miri Korenblit 2025-02-16  2064  		rcu_assign_pointer(mld_vif->bigtks[keyidx - 6], key);
d1e879ec600f9b Miri Korenblit 2025-02-16  2065  
d1e879ec600f9b Miri Korenblit 2025-02-16  2066  	/* After exiting from RFKILL, hostapd configures GTK/ITGK before the
d1e879ec600f9b Miri Korenblit 2025-02-16  2067  	 * AP is started, but those keys can't be sent to the FW before the
d1e879ec600f9b Miri Korenblit 2025-02-16  2068  	 * MCAST/BCAST STAs are added to it (which happens upon AP start).
d1e879ec600f9b Miri Korenblit 2025-02-16  2069  	 * Store it here to be sent later when the AP is started.
d1e879ec600f9b Miri Korenblit 2025-02-16  2070  	 */
d1e879ec600f9b Miri Korenblit 2025-02-16  2071  	if ((vif->type == NL80211_IFTYPE_ADHOC ||
d1e879ec600f9b Miri Korenblit 2025-02-16  2072  	     vif->type == NL80211_IFTYPE_AP) && !sta &&
d1e879ec600f9b Miri Korenblit 2025-02-16  2073  	     !mld_vif->ap_ibss_active)
d1e879ec600f9b Miri Korenblit 2025-02-16  2074  		return iwl_mld_store_ap_early_key(mld, key, mld_vif);
d1e879ec600f9b Miri Korenblit 2025-02-16  2075  
d1e879ec600f9b Miri Korenblit 2025-02-16 @2076  	if (!mld->fw_status.in_hw_restart && mld_sta &&
                                                                                             ^^^^^^^
This code assumes that mld_sta can be NULL

d1e879ec600f9b Miri Korenblit 2025-02-16  2077  	    key->flags & IEEE80211_KEY_FLAG_PAIRWISE &&
d1e879ec600f9b Miri Korenblit 2025-02-16  2078  	    (key->cipher == WLAN_CIPHER_SUITE_CCMP ||
d1e879ec600f9b Miri Korenblit 2025-02-16  2079  	     key->cipher == WLAN_CIPHER_SUITE_GCMP ||
d1e879ec600f9b Miri Korenblit 2025-02-16  2080  	     key->cipher == WLAN_CIPHER_SUITE_GCMP_256)) {
d1e879ec600f9b Miri Korenblit 2025-02-16  2081  		ret = iwl_mld_alloc_ptk_pn(mld, mld_sta, key, &ptk_pn);
d1e879ec600f9b Miri Korenblit 2025-02-16  2082  		if (ret)
d1e879ec600f9b Miri Korenblit 2025-02-16  2083  			return ret;
d1e879ec600f9b Miri Korenblit 2025-02-16  2084  	}
d1e879ec600f9b Miri Korenblit 2025-02-16  2085  
d1e879ec600f9b Miri Korenblit 2025-02-16  2086  	IWL_DEBUG_MAC80211(mld, "set hwcrypto key (sta:%pM, id:%d)\n",
d1e879ec600f9b Miri Korenblit 2025-02-16  2087  			   sta ? sta->addr : NULL, keyidx);
d1e879ec600f9b Miri Korenblit 2025-02-16  2088  
d1e879ec600f9b Miri Korenblit 2025-02-16  2089  	ret = iwl_mld_add_key(mld, vif, sta, key);
d1e879ec600f9b Miri Korenblit 2025-02-16  2090  	if (ret) {
d1e879ec600f9b Miri Korenblit 2025-02-16  2091  		IWL_WARN(mld, "set key failed (%d)\n", ret);
d1e879ec600f9b Miri Korenblit 2025-02-16  2092  		if (ptk_pn) {
d1e879ec600f9b Miri Korenblit 2025-02-16 @2093  			RCU_INIT_POINTER(mld_sta->ptk_pn[keyidx], NULL);
                                                                                         ^^^^^^^^^
But here it's dereferenced without checking.

d1e879ec600f9b Miri Korenblit 2025-02-16  2094  			kfree(ptk_pn);
d1e879ec600f9b Miri Korenblit 2025-02-16  2095  		}
d1e879ec600f9b Miri Korenblit 2025-02-16  2096  
d1e879ec600f9b Miri Korenblit 2025-02-16  2097  		return -EOPNOTSUPP;
d1e879ec600f9b Miri Korenblit 2025-02-16  2098  	}
d1e879ec600f9b Miri Korenblit 2025-02-16  2099  
d1e879ec600f9b Miri Korenblit 2025-02-16  2100  	return 0;
d1e879ec600f9b Miri Korenblit 2025-02-16  2101  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

