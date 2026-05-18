Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0238C24A07C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 05:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080614; cv=none; b=BPPc1/NUG8TWEkRqV+p42GrDzYFRLh/p/M16TDuAzCBiYAm1N8WS5gd/FbnPCxm67hUI50HuSnJGqHTUkvY2xXtA936YJpZttl77rif0KrhHVd0mbAzVpzjKALJ1ziwUip2kl/B+Bq11omkqs9AIQ4zgPddOe5q7C1glpudKW9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080614; c=relaxed/simple;
	bh=ydOaF9UU6tbJLhtprennbA7ybC2c6fIQczYgimQeFXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=owFVYLMT+Y21ZQdwqYAyz6WwVEfcpTNjHld61tuwER+Q7Mqy/2y8YSCiusIYpLSENcGhPeuM/tmi4E118WSj3JP4cmautDKw18UG+sMyX/hB7Vn/+nYEU1Ib3Wzo1/Df43MZ/LgcpqWA0OtNT15+AdtvCMpDwANWpRJVYdlaXZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQqxU+sF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQqxU+sF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso8108885e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 22:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779080611; x=1779685411; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=whZE7lmOwiTbknFZryeTtP+D3KntmXuriylEh4fmOOw=;
        b=YQqxU+sF58bKEUXvmDClQKAHbQWKrgdDUcjc62kFrpxFpD1+HvlzVoremgqhqLVurw
         mptru1KiNQ9Ps9fYRlcealxYYPLNXhqFmTRlP3BRBDLtqEDzZO6yPvQz9RLOtloaAf3v
         gnz1fsSXE4OI8U6M0qapJ8t2ndBfdSBcro3kiA0ggrVeqQnXBenFM52xmiiDC8VDShlm
         xrbEL9eunnW+ojme3K7ejMDNfj0jMvheSjWZDsVmlah8PKDKVco6fdGlkwf6WyRAIic7
         75hDkzQ6I7irAAfLWX4RakZlTvepl26q69WtYjJPrDy/fNELSBQ8bmcGiCOJQzenLEwa
         hJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779080611; x=1779685411;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whZE7lmOwiTbknFZryeTtP+D3KntmXuriylEh4fmOOw=;
        b=RSyYxTwhIiy80+kwVoZmxiVjwj2CocgsTPIKcbc18olLNbj5v39tCa+HSNO7M/yXAy
         Yz2hs6sqYHSIl0ClWp81YUuzh02dZYBT+5/78zWWX8w4JQYgJuAVn7QdW2ihurBGiSh0
         nYqwgripKgZAoEs9D0NaP3K+/AUASbe5UafVo5/GWkAyj39gI6kaxyJzF8mjAghB/Hz7
         fjbixxynKxONtLwzPkaoTB+bXRcl7oh2mk5t/Ve98tZaRFsGTPmchpdVeuvjBEgzxsUT
         Lw4IddfUgCYKDi+m0ixkByRMyP6f/JMfbbwvRZ2q48OZivNLZBMV/NDsrOikFxvIMlL9
         1a2w==
X-Forwarded-Encrypted: i=1; AFNElJ/kmAOCkuA4bK3fw21fefdzdycLCq+fS2u7IxZx8rJo0+YdL57LRJ/MGoFCcVIFBjJSF852S3lqyekxOpKc@lists.linux.dev
X-Gm-Message-State: AOJu0YzcJ6qalhoMWSjKZv6MQV+Mm7bWfcc1sCKKmXjP6KNXPrSTLx4W
	X41SDSzOqRnmUs/gESiEhXu5BmvzsdoHlfYwH7VyTuaGgkz3+vrrd/lXcjazcQ==
X-Gm-Gg: Acq92OFrFGJD7DAp8lo2zSSfSwpsgvBVONNTmY15CJ2T9GvwxUqrbngNPlE4ubj6yBY
	SEoi413zPMLtvxMQpQquE0KhN8mKrAXXYDBXIAKS+KQqGC3YZfXmoOdI+9S9EJ8/kxm58ZYbg9G
	KcSQvndPpgOyzb7S92LToQx8Npc/bpRkRNq3c1Sbx+AAQFZYKE52R/zS3z+nzTq9eRjtyBQTNp1
	Jx+kNtSCHPDS41T5nobQLc1ZXFSLfkSKm9ZTizYT236dZ/NKsjpmJBx3OJp/UpBPykNcrhr7qU3
	apZ41dO3l8dSgJ1+Diwgp77WWkAMoidDeq4OdBrH5hqNGZLE5QTdN3hIIWMkwv9iFAL6Y8QTpDS
	QMPJ5plYVbX9u8IDsN7MGP2l5UrTtqCGW3oDeUh4/f680ZMzeKGBwJc4kP7sMJT7+A0b46dlelb
	wo9GF7PCFN78oU5TS6F7k=
X-Received: by 2002:a05:600c:c10b:b0:489:1cd2:610a with SMTP id 5b1f17b1804b1-48fe60d55c4mr139560295e9.9.1779080611258;
        Sun, 17 May 2026 22:03:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf81970sm98376725e9.8.2026.05.17.22.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:03:30 -0700 (PDT)
Date: Mon, 18 May 2026 08:03:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>
Subject: [iwlwifi-next:next 13/93]
 drivers/net/wireless/intel/iwlwifi/mld/tx.c:571 iwl_mld_fill_tx_cmd() warn:
 variable dereferenced before check 'mld_sta' (see line 565)
Message-ID: <202605171045.6jPun4QF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git next
head:   ce2b645bb3099ef4d96759335271e25875202ce9
commit: d751c944055aedf33a6cab9b1cadaab65d7bc8dd [13/93] wifi: iwlwifi: mld: use host rate for NAN management frames
config: i386-randconfig-141-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171045.6jPun4QF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605171045.6jPun4QF-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mld/tx.c:571 iwl_mld_fill_tx_cmd() warn: variable dereferenced before check 'mld_sta' (see line 565)

vim +/mld_sta +571 drivers/net/wireless/intel/iwlwifi/mld/tx.c

d1e879ec600f9b3 Miri Korenblit 2025-02-16  538  static void
d1e879ec600f9b3 Miri Korenblit 2025-02-16  539  iwl_mld_fill_tx_cmd(struct iwl_mld *mld, struct sk_buff *skb,
d1e879ec600f9b3 Miri Korenblit 2025-02-16  540  		    struct iwl_device_tx_cmd *dev_tx_cmd,
d1e879ec600f9b3 Miri Korenblit 2025-02-16  541  		    struct ieee80211_sta *sta)
d1e879ec600f9b3 Miri Korenblit 2025-02-16  542  {
d1e879ec600f9b3 Miri Korenblit 2025-02-16  543  	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  544  	struct ieee80211_hdr *hdr = (void *)skb->data;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  545  	struct iwl_mld_sta *mld_sta = sta ? iwl_mld_sta_from_mac80211(sta) :
d1e879ec600f9b3 Miri Korenblit 2025-02-16  546  					    NULL;
1c97c73cdab0afc Miri Korenblit 2025-05-11  547  	struct iwl_tx_cmd *tx_cmd;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  548  	bool amsdu = ieee80211_is_data_qos(hdr->frame_control) &&
d1e879ec600f9b3 Miri Korenblit 2025-02-16  549  		     (*ieee80211_get_qos_ctl(hdr) &
d1e879ec600f9b3 Miri Korenblit 2025-02-16  550  		      IEEE80211_QOS_CTL_A_MSDU_PRESENT);
dabc88cb3b78c0d Johannes Berg  2025-05-05  551  	__le32 rate_n_flags = 0;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  552  	u16 flags = 0;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  553  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  554  	dev_tx_cmd->hdr.cmd = TX_CMD;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  555  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  556  	if (!info->control.hw_key)
d1e879ec600f9b3 Miri Korenblit 2025-02-16  557  		flags |= IWL_TX_FLAGS_ENCRYPT_DIS;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  558  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  559  	/* For data and mgmt packets rate info comes from the fw.
d751c944055aedf Miri Korenblit 2026-05-10  560  	 * Only set rate/antenna for:
d751c944055aedf Miri Korenblit 2026-05-10  561  	 * - injected frames with fixed rate,
d751c944055aedf Miri Korenblit 2026-05-10  562  	 * - when no sta is given.
d751c944055aedf Miri Korenblit 2026-05-10  563  	 * - frames that are sent to an NMI sta, which is only used for management.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  564  	 */
d751c944055aedf Miri Korenblit 2026-05-10 @565  	if (unlikely(!sta || mld_sta->vif->type == NL80211_IFTYPE_NAN ||
                                                                             ^^^^^^^^^^^^^^^^^^
Dereference

d1e879ec600f9b3 Miri Korenblit 2025-02-16  566  		     info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT)) {
d1e879ec600f9b3 Miri Korenblit 2025-02-16  567  		flags |= IWL_TX_FLAGS_CMD_RATE;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  568  		rate_n_flags = iwl_mld_get_tx_rate_n_flags(mld, info, sta,
d1e879ec600f9b3 Miri Korenblit 2025-02-16  569  							   hdr->frame_control);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  570  	} else if (!ieee80211_is_data(hdr->frame_control) ||
d1e879ec600f9b3 Miri Korenblit 2025-02-16 @571  		   (mld_sta &&
                                                                    ^^^^^^^
Checked too late.

d1e879ec600f9b3 Miri Korenblit 2025-02-16  572  		    mld_sta->sta_state < IEEE80211_STA_AUTHORIZED)) {
d1e879ec600f9b3 Miri Korenblit 2025-02-16  573  		/* These are important frames */
d1e879ec600f9b3 Miri Korenblit 2025-02-16  574  		flags |= IWL_TX_FLAGS_HIGH_PRI;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  575  	}
d1e879ec600f9b3 Miri Korenblit 2025-02-16  576  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  577  	tx_cmd = (void *)dev_tx_cmd->payload;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  578  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  579  	iwl_mld_fill_tx_cmd_hdr(tx_cmd, skb, amsdu);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  580  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  581  	tx_cmd->offload_assist = iwl_mld_get_offload_assist(skb, amsdu);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  582  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  583  	/* Total # bytes to be transmitted */
d1e879ec600f9b3 Miri Korenblit 2025-02-16  584  	tx_cmd->len = cpu_to_le16((u16)skb->len);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  585  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  586  	tx_cmd->flags = cpu_to_le16(flags);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  587  
dabc88cb3b78c0d Johannes Berg  2025-05-05  588  	tx_cmd->rate_n_flags = rate_n_flags;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  589  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

