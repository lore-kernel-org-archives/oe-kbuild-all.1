Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463F1552FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728756615; cv=none; b=cYFSi+4bhKt/SN7thZQ/wB/YC816XOsoN3yH6GwSgOnAz4hgT9VTjgWigcUxOAA86QijlHz3Yclfh4HhJ/VCVnTD5YEQFj8uxBLue0LPBTRhs9s3ZJi7OHgFJWGyT5LBxHE0ilvsEOPncQqq6+nmNgzu2las02A8jRTCSwoMK/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728756615; c=relaxed/simple;
	bh=wmY2JkxGXiLr9XeB9WLEARhPpP5kVc/7YbQU3o5t4r4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OsCTQcWdY1H6eeWzUsTCwAN+dikq/Zd6/R56EHqdRT59d68P6hFIaeozmBTWloNbaYIG2OWlidX+A/7Ct68fMzQSa+MyY/WfPyc7lbxL68r+vTchTRDhYUZkSb53KMaMSL57ZGo6BBsNhQ7tchpbjv7KPri5y9qpZi3NvPHebYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2cdEkve; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2cdEkve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728756613; x=1760292613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wmY2JkxGXiLr9XeB9WLEARhPpP5kVc/7YbQU3o5t4r4=;
  b=b2cdEkveVl8xOjwtpQJFyu+lgzs6E5C++ZzaUIg0ivCct3OYstFB66+H
   8oS77NMLPK6rUxPzcfBecUcU2NdyuaPRQuG3wQt+MUNG6apQddkULZcZQ
   dAbHNshnc7Bvbk624gmnFsoyPY/s2lWTEt2Yi0bdKgo10D9rhZ/Icppqx
   WCNDiXk6ZeStPKW4wLjGk5C6H46oG0wp7YaKKu36ESG26XWVjBVrqyWcV
   k17RmIaljCgTqjspJmf8QGZiUoXMAJeNqTJWa4epk0CNAfy9NecyWorRc
   G22as8AvEJbDIfctLpCjVOCB84SjGlnqTCdCtbVUqx+dybcODYi4HvVtE
   Q==;
X-CSE-ConnectionGUID: 6fFJ787mTaGgjlk480U2YQ==
X-CSE-MsgGUID: 1yuLwUIeRua86qebfSSmfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38717879"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="38717879"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 11:10:13 -0700
X-CSE-ConnectionGUID: NNT31RqXRUmKsXeUTolXEg==
X-CSE-MsgGUID: xMsAFX2vQICD9wRojS/3Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="100517638"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2024 11:10:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szgZ8-000Daj-09;
	Sat, 12 Oct 2024 18:10:10 +0000
Date: Sun, 13 Oct 2024 02:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2965/4143]
 drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c:432: undefined
 reference to `arc4_setkey'
Message-ID: <202410130117.eD0x8fML-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d61a00525464bfc5fe92c6ad713350988e492b88
commit: 02f220b5267042d0de649614eec84ded8aeecb4f [2965/4143] wifi: ipw2x00/lib80211: move remaining lib80211 into libipw
config: i386-randconfig-012-20241012 (https://download.01.org/0day-ci/archive/20241013/202410130117.eD0x8fML-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410130117.eD0x8fML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130117.eD0x8fML-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.o: in function `libipw_tkip_decrypt':
>> drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c:432: undefined reference to `arc4_setkey'
>> ld: drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c:433: undefined reference to `arc4_crypt'
   ld: drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.o: in function `libipw_tkip_encrypt':
   drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c:350: undefined reference to `arc4_setkey'
   ld: drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c:351: undefined reference to `arc4_crypt'
   ld: drivers/net/wireless/intel/ipw2x00/libipw_crypto_wep.o: in function `libipw_wep_decrypt':
>> drivers/net/wireless/intel/ipw2x00/libipw_crypto_wep.c:171: undefined reference to `arc4_setkey'
>> ld: drivers/net/wireless/intel/ipw2x00/libipw_crypto_wep.c:172: undefined reference to `arc4_crypt'
   ld: drivers/net/wireless/intel/ipw2x00/libipw_crypto_wep.o: in function `libipw_wep_encrypt':
   drivers/net/wireless/intel/ipw2x00/libipw_crypto_wep.c:132: undefined reference to `arc4_setkey'
   ld: drivers/net/wireless/intel/ipw2x00/libipw_crypto_wep.c:133: undefined reference to `arc4_crypt'


vim +432 drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c

183798799216fa net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2006-09-22  368  
02f220b5267042 drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c Johannes Berg    2024-10-07  369  static int libipw_tkip_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  370  {
02f220b5267042 drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c Johannes Berg    2024-10-07  371  	struct libipw_tkip_data *tkey = priv;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  372  	u8 rc4key[16];
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  373  	u8 keyidx, *pos;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  374  	u32 iv32;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  375  	u16 iv16;
274bfb8dc5ffa1 net/wireless/lib80211_crypt_tkip.c                      John W. Linville 2008-10-29  376  	struct ieee80211_hdr *hdr;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  377  	u8 icv[4];
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  378  	u32 crc;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  379  	int plen;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  380  
274bfb8dc5ffa1 net/wireless/lib80211_crypt_tkip.c                      John W. Linville 2008-10-29  381  	hdr = (struct ieee80211_hdr *)skb->data;
20d64713ae71c0 net/ieee80211/ieee80211_crypt_tkip.c                    James Ketrenos   2005-09-21  382  
6eb6edf04acd09 net/ieee80211/ieee80211_crypt_tkip.c                    James Ketrenos   2005-09-22  383  	if (tkey->flags & IEEE80211_CRYPTO_TKIP_COUNTERMEASURES) {
e87cc4728f0e2f net/wireless/lib80211_crypt_tkip.c                      Joe Perches      2012-05-13  384  		net_dbg_ratelimited("TKIP countermeasures: dropped received packet from %pM\n",
e87cc4728f0e2f net/wireless/lib80211_crypt_tkip.c                      Joe Perches      2012-05-13  385  				    hdr->addr2);
20d64713ae71c0 net/ieee80211/ieee80211_crypt_tkip.c                    James Ketrenos   2005-09-21  386  		return -1;
20d64713ae71c0 net/ieee80211/ieee80211_crypt_tkip.c                    James Ketrenos   2005-09-21  387  	}
20d64713ae71c0 net/ieee80211/ieee80211_crypt_tkip.c                    James Ketrenos   2005-09-21  388  
299af9d3db0fd3 net/wireless/lib80211_crypt_tkip.c                      Andriy Tkachuk   2010-02-02  389  	if (skb->len < hdr_len + TKIP_HDR_LEN + 4)
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  390  		return -1;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  391  
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  392  	pos = skb->data + hdr_len;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  393  	keyidx = pos[3];
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  394  	if (!(keyidx & (1 << 5))) {
e87cc4728f0e2f net/wireless/lib80211_crypt_tkip.c                      Joe Perches      2012-05-13  395  		net_dbg_ratelimited("TKIP: received packet without ExtIV flag from %pM\n",
e87cc4728f0e2f net/wireless/lib80211_crypt_tkip.c                      Joe Perches      2012-05-13  396  				    hdr->addr2);
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  397  		return -2;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  398  	}
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  399  	keyidx >>= 6;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  400  	if (tkey->key_idx != keyidx) {
996bf99c719445 net/wireless/lib80211_crypt_tkip.c                      Johannes Berg    2015-11-06  401  		net_dbg_ratelimited("TKIP: RX tkey->key_idx=%d frame keyidx=%d\n",
996bf99c719445 net/wireless/lib80211_crypt_tkip.c                      Johannes Berg    2015-11-06  402  				    tkey->key_idx, keyidx);
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  403  		return -6;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  404  	}
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  405  	if (!tkey->key_set) {
e87cc4728f0e2f net/wireless/lib80211_crypt_tkip.c                      Joe Perches      2012-05-13  406  		net_dbg_ratelimited("TKIP: received packet from %pM with keyid=%d that does not have a configured key\n",
e87cc4728f0e2f net/wireless/lib80211_crypt_tkip.c                      Joe Perches      2012-05-13  407  				    hdr->addr2, keyidx);
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  408  		return -3;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  409  	}
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  410  	iv16 = (pos[0] << 8) | pos[2];
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  411  	iv32 = pos[4] | (pos[5] << 8) | (pos[6] << 16) | (pos[7] << 24);
299af9d3db0fd3 net/wireless/lib80211_crypt_tkip.c                      Andriy Tkachuk   2010-02-02  412  	pos += TKIP_HDR_LEN;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  413  
b4328d87ec5711 net/ieee80211/ieee80211_crypt_tkip.c                    Zhu Yi           2006-08-21  414  	if (tkip_replay_check(iv32, iv16, tkey->rx_iv32, tkey->rx_iv16)) {
02f220b5267042 drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c Johannes Berg    2024-10-07  415  #ifdef CONFIG_LIBIPW_DEBUG
e87cc4728f0e2f net/wireless/lib80211_crypt_tkip.c                      Joe Perches      2012-05-13  416  		net_dbg_ratelimited("TKIP: replay detected: STA=%pM previous TSC %08x%04x received TSC %08x%04x\n",
e87cc4728f0e2f net/wireless/lib80211_crypt_tkip.c                      Joe Perches      2012-05-13  417  				    hdr->addr2, tkey->rx_iv32, tkey->rx_iv16,
e87cc4728f0e2f net/wireless/lib80211_crypt_tkip.c                      Joe Perches      2012-05-13  418  				    iv32, iv16);
6f16bf3bdb94b5 net/wireless/lib80211_crypt_tkip.c                      John W. Linville 2009-03-11  419  #endif
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  420  		tkey->dot11RSNAStatsTKIPReplays++;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  421  		return -4;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  422  	}
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  423  
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  424  	if (iv32 != tkey->rx_iv32 || !tkey->rx_phase1_done) {
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  425  		tkip_mixing_phase1(tkey->rx_ttak, tkey->key, hdr->addr2, iv32);
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  426  		tkey->rx_phase1_done = 1;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  427  	}
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  428  	tkip_mixing_phase2(rc4key, tkey->key, tkey->rx_ttak, iv16);
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  429  
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  430  	plen = skb->len - hdr_len - 12;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  431  
4be297016cd3a6 net/wireless/lib80211_crypt_tkip.c                      Ard Biesheuvel   2019-06-12 @432  	arc4_setkey(&tkey->rx_ctx_arc4, rc4key, 16);
4be297016cd3a6 net/wireless/lib80211_crypt_tkip.c                      Ard Biesheuvel   2019-06-12 @433  	arc4_crypt(&tkey->rx_ctx_arc4, pos, pos, plen + 4);
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  434  
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  435  	crc = ~crc32_le(~0, pos, plen);
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  436  	icv[0] = crc;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  437  	icv[1] = crc >> 8;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  438  	icv[2] = crc >> 16;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  439  	icv[3] = crc >> 24;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  440  	if (memcmp(icv, pos + plen, 4) != 0) {
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  441  		if (iv32 != tkey->rx_iv32) {
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  442  			/* Previously cached Phase1 result was already lost, so
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  443  			 * it needs to be recalculated for the next packet. */
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  444  			tkey->rx_phase1_done = 0;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  445  		}
02f220b5267042 drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c Johannes Berg    2024-10-07  446  #ifdef CONFIG_LIBIPW_DEBUG
e87cc4728f0e2f net/wireless/lib80211_crypt_tkip.c                      Joe Perches      2012-05-13  447  		net_dbg_ratelimited("TKIP: ICV error detected: STA=%pM\n",
e87cc4728f0e2f net/wireless/lib80211_crypt_tkip.c                      Joe Perches      2012-05-13  448  				    hdr->addr2);
6f16bf3bdb94b5 net/wireless/lib80211_crypt_tkip.c                      John W. Linville 2009-03-11  449  #endif
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  450  		tkey->dot11RSNAStatsTKIPICVErrors++;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  451  		return -5;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  452  	}
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  453  
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  454  	/* Update real counters only after Michael MIC verification has
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  455  	 * completed */
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  456  	tkey->rx_iv32_new = iv32;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  457  	tkey->rx_iv16_new = iv16;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  458  
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  459  	/* Remove IV and ICV */
299af9d3db0fd3 net/wireless/lib80211_crypt_tkip.c                      Andriy Tkachuk   2010-02-02  460  	memmove(skb->data + TKIP_HDR_LEN, skb->data, hdr_len);
299af9d3db0fd3 net/wireless/lib80211_crypt_tkip.c                      Andriy Tkachuk   2010-02-02  461  	skb_pull(skb, TKIP_HDR_LEN);
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  462  	skb_trim(skb, skb->len - 4);
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  463  
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  464  	return keyidx;
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  465  }
b453872c35cfcb net/ieee80211/ieee80211_crypt_tkip.c                    Jeff Garzik      2005-05-12  466  

:::::: The code at line 432 was first introduced by commit
:::::: 4be297016cd3a6aedbcc3b053da16cdd42546f04 net/lib80211: move TKIP handling to ARC4 library code

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
