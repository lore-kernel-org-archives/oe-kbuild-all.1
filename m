Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCF118C91B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472201; cv=none; b=Rq7M/6SFJVNG3Y/s+nAj91wiI/cu+i9errAdHrsZVrjgvIP2VXAESRKq1ksOdEgl5mr+qr9TnDFif4RS8vKTtEV1KDFq3qWCOq7N8JHVN6RZuKR+aLctz2Nvgvl3vOjsJZW5g+SVhM4X5NZpg7LRp8/e4/KJjIGLPyvodwhNrfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472201; c=relaxed/simple;
	bh=fqRBq5K1TdV05b3FcW6/RnxfXiPHKr0ngKCGd+KMaYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jD7EV86hb/Yg0Ko4fqtp+OUWkn98TcoWGMf7GcD7gdVCwh0ohtNond+o6hlgK8Bx+I5vor+7NRcBSbufDlM1lxnHerprq1P29vAvxI54AmeelRPlcJ4rTIBGtJuYRoT3o45XcPd7rZoUXdIMrA98ErSEQFwOBPQj8gddVozFF5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vu+f8rvg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vu+f8rvg"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cc8782869so68414365e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 09 Oct 2024 04:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472198; x=1729076998; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vhk8Y2SRus1zxrj8VydK79A7VXLD4deSXiCFrCL/oGg=;
        b=vu+f8rvg1/UVuXZBcROHWoFzk0cyTKqQNMnTd+039UWLu7STa/qGEe8oi+cVXMOafX
         s7ssQEJ0HZH8bO3Sj9JLl5+kZhW0sL4IOFxP4Ga+8eVhnmMeNVExyipvH/Sz+6TVF97B
         JT+4dpLwpdhZixTonPvL+h8CpNP83gK7/IH4S4LIlYeqmIh57n3KYSP6eZIpWJypocdx
         aBchZd8OuaKrInm7fdi9ISvpBN7+BvfZ+1t/DUAN+8ITDW78nQZ0ZAU53yyc/iyoTCSe
         /uEeRpnt5ufUcK2MDC8n5cXf45cHxE6twxlRSsUhd951LxwlqieZfZ6R8rnFsH0OmspH
         Pc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472198; x=1729076998;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vhk8Y2SRus1zxrj8VydK79A7VXLD4deSXiCFrCL/oGg=;
        b=lZiSoycnwlt3HQLVNN3BefwGwxW/IbruNpVxoFYbj8SxR+0nP9sYWes9EIJI9Tq7C/
         bkxNpb6TqhMbOda91rODHwXpmxuTrHFnSa2qcA7iZoaIiNKyX4mRGFBAJhKFeNDtFK2B
         Ch7B6jYNQ16nwUyoP8MFATiKW1bET/8w02JkRxki5b4AVnZiBGaOv2g5I9jlwtDmuLsQ
         YHNYuuiQXsSDxxQyh1CW7JNGTmwSvvA2se+qHilr5tLa6mk50aYVIwU3AkPf8u/Led+f
         I9uLs3dCjwt8l51DvfoBx7Yx8zeUm92j6Ij74TeB6inNk4yi4SPxN1HXwB90JEy7dO0Q
         FlIA==
X-Forwarded-Encrypted: i=1; AJvYcCX2yNCW90L5M3xC2fy+s6nEwMmV68OF9rnY9KcbSoWAtC1G2Vu/EMpfMnGO2cHDIuJCpnQdJn4yQDH+pa8X@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/2j3s7v0f4058Jj0wQqqXLA/p4PL2KKNH0SgbhuhPCAt9XPt4
	Lyo9rl7ivuels0B+wxRqjX3n3XKjR/tt8qxLGECu5m082sseUwODY+3tjDP2Npk=
X-Google-Smtp-Source: AGHT+IEeieepBbCnWOEdGef4Otkfad0tCqz0PQbH2lO3h/DiQLh/yGiq9Jmywa+c3Wo+sXVwusRPGg==
X-Received: by 2002:a05:600c:5117:b0:42c:b22e:fc2e with SMTP id 5b1f17b1804b1-430ccf4c7b8mr14725705e9.15.1728472198211;
        Wed, 09 Oct 2024 04:09:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d3af05948sm1310537f8f.33.2024.10.09.04.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:09:57 -0700 (PDT)
Date: Wed, 9 Oct 2024 14:09:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>
Subject: [ath:ath12k-mlo-qcn9274 /81]
 drivers/net/wireless/ath/ath12k/mac.c:4304 ath12k_mac_op_set_key() error:
 uninitialized symbol 'ret'.
Message-ID: <7e7afd00-ad84-4744-8d94-416bab7e7dd9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
head:   7435d14d41d5d479a5e6a8a2cd4efdac9d928823
commit: 573de29145bf929c428f9e2dc55ad3f5f3da8453 [/81] wifi: ath12k: modify ath12k_mac_op_set_key for MLO
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090311.SK1SO5GL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410090311.SK1SO5GL-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:4304 ath12k_mac_op_set_key() error: uninitialized symbol 'ret'.

vim +/ret +4304 drivers/net/wireless/ath/ath12k/mac.c

b5068bc9180d06 Sriram R             2024-04-09  4222  static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
b5068bc9180d06 Sriram R             2024-04-09  4223  				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
b5068bc9180d06 Sriram R             2024-04-09  4224  				 struct ieee80211_key_conf *key)
b5068bc9180d06 Sriram R             2024-04-09  4225  {
18333c4baa4d72 Sriram R             2024-01-27  4226  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
18333c4baa4d72 Sriram R             2024-01-27  4227  	struct ath12k_link_vif *arvif;
611aacdb3540ff Sriram R             2024-04-14  4228  	struct ath12k_link_sta *arsta = NULL;
b5068bc9180d06 Sriram R             2024-04-09  4229  	struct ath12k_vif_cache *cache;
611aacdb3540ff Sriram R             2024-04-14  4230  	struct ath12k_sta *ahsta;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4231  	unsigned long links;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4232  	u8 link_id;
b5068bc9180d06 Sriram R             2024-04-09  4233  	int ret;
b5068bc9180d06 Sriram R             2024-04-09  4234  
d4243fd891671d Kalle Valo           2024-09-25  4235  	lockdep_assert_wiphy(hw->wiphy);
d4243fd891671d Kalle Valo           2024-09-25  4236  
b5068bc9180d06 Sriram R             2024-04-09  4237  	/* BIP needs to be done in software */
b5068bc9180d06 Sriram R             2024-04-09  4238  	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
b5068bc9180d06 Sriram R             2024-04-09  4239  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
b5068bc9180d06 Sriram R             2024-04-09  4240  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
18333c4baa4d72 Sriram R             2024-01-27  4241  	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
b5068bc9180d06 Sriram R             2024-04-09  4242  		return 1;
18333c4baa4d72 Sriram R             2024-01-27  4243  	}
b5068bc9180d06 Sriram R             2024-04-09  4244  
b5068bc9180d06 Sriram R             2024-04-09  4245  	if (key->keyidx > WMI_MAX_KEY_INDEX)
b5068bc9180d06 Sriram R             2024-04-09  4246  		return -ENOSPC;
b5068bc9180d06 Sriram R             2024-04-09  4247  
b5068bc9180d06 Sriram R             2024-04-09  4248  	if (sta) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4249  		ahsta = ath12k_sta_to_ahsta(sta);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4250  		/* For an ML STA Pairwise key is same for all associated link Stations,
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4251  		 * hence do set key for all link STAs which are active.
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4252  		 */
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4253  		if (sta->mlo) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4254  			links = ahsta->links_map;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4255  			for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4256  				arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4257  				arsta = wiphy_dereference(hw->wiphy, ahsta->link[link_id]);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4258  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4259  				if (WARN_ON(!arvif || !arsta))
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4260  					/* arvif and arsta are expected to be valid when
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4261  					 * STA is present.
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4262  					 */
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4263  					continue;

Is it possible that there are no set bits or that we always hit this continue?

573de29145bf92 Rameshkumar Sundaram 2024-08-09  4264  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4265  				ret = ath12k_mac_set_key(arvif->ar, cmd, arvif,
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4266  							 arsta, key);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4267  				if (ret)
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4268  					break;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4269  			}
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4270  		} else {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4271  			arsta = &ahsta->deflink;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4272  			arvif = arsta->arvif;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4273  			if (WARN_ON(!arvif)) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4274  				ret = -EINVAL;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4275  				goto out;
b5068bc9180d06 Sriram R             2024-04-09  4276  			}
b5068bc9180d06 Sriram R             2024-04-09  4277  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4278  			ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, arsta, key);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4279  		}
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4280  	} else {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4281  		if (key->link_id >= 0 && key->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4282  			link_id = key->link_id;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4283  			arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4284  		} else {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4285  			link_id = 0;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4286  			arvif = &ahvif->deflink;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4287  		}
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4288  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4289  		if (!arvif || !arvif->is_created) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4290  			cache = ath12k_ahvif_get_link_cache(ahvif, link_id);
b5068bc9180d06 Sriram R             2024-04-09  4291  			if (!cache)
b5068bc9180d06 Sriram R             2024-04-09  4292  				return -ENOSPC;
18333c4baa4d72 Sriram R             2024-01-27  4293  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4294  			ret = ath12k_mac_update_key_cache(cache, cmd, sta, key);
18333c4baa4d72 Sriram R             2024-01-27  4295  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4296  			return ret;
b5068bc9180d06 Sriram R             2024-04-09  4297  		}
b5068bc9180d06 Sriram R             2024-04-09  4298  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4299  		ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, NULL, key);
611aacdb3540ff Sriram R             2024-04-14  4300  	}
611aacdb3540ff Sriram R             2024-04-14  4301  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4302  out:
18333c4baa4d72 Sriram R             2024-01-27  4303  
d889913205cf7e Kalle Valo           2022-11-28 @4304  	return ret;

If so then ret is uninitialized

d889913205cf7e Kalle Valo           2022-11-28  4305  }
d889913205cf7e Kalle Valo           2022-11-28  4306  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

