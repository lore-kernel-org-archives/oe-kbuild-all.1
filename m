Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAF94D13B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 06:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712124077; cv=none; b=l7MaoBJsVG+5axqSAYYx6x7q7Dj2o4p4kZrUeWx6B33pDjAj8JJNIBc/0TnIjMCxg7LDnk4SSAjS7JDFUelhyrDh8iRnikIj3EIPNZQpKwqBjipF6dDOHNvGnXV/XKggTEI4SPiJWj36Q5HwPVJ1yDhsbOG54Q7jwhRZ6PJMDsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712124077; c=relaxed/simple;
	bh=lKdNVau6gmrguLFtRscKYpYUIrMOGpwVtrOlbs9uqoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SiY9pUz7GYWZtgktSy+4WechebydeUJ/t3IV0SeLjonxQoNiXL7yOrNbxnjV5XGeXhNxgU2N0vI01w2BUoVQfkFKb3SPNe4tLmyW6dOgcLwiG8L08gblXnPOaF5v8GTOLVObVnqbfilxabfq0UNM6zByB5zpegth+DELpsE9kWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ir/dZcdX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ir/dZcdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712124075; x=1743660075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lKdNVau6gmrguLFtRscKYpYUIrMOGpwVtrOlbs9uqoQ=;
  b=ir/dZcdXnfBmQtayx5I/s1ipKCcVBBRdKgS7YFqi9LPc4WMRYgzH08UC
   qbwNd9wbnvEcY2BFTIsI1qPcsb/7yT/u0H+6flJC0PgtcbaqySyEaXMA9
   c3nsMTrwksZL+KqizJILsqIkNZW5uNGlYawwsmR1N5BGgW3/dCVTAVLho
   IY/mztmulmqM56wImciOsjopqF7TC0G6H6n/bVDihg7KGbDT/3BwXZPqM
   SZIDWOe5FtcmwW0La1EXaO1E3MmRzOEyylsWnD8HurmnvmoaDfq3sbAj2
   KBD6MLgnGMoBUJbaASXlPJi+2WILaP33RW5RSdOZOe13waSpEP/2WYuVG
   Q==;
X-CSE-ConnectionGUID: mU/8NrjFR0ag+i7fRFh7Rg==
X-CSE-MsgGUID: e88hcX7CSWuJcIsFrZHN8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11154511"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="11154511"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 23:01:14 -0700
X-CSE-ConnectionGUID: OsFik7uZQneJATOPVeutZA==
X-CSE-MsgGUID: H/mtWZZeT7OIIriFinGK7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18777935"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Apr 2024 23:01:13 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrtgN-0001uf-0U;
	Wed, 03 Apr 2024 06:01:11 +0000
Date: Wed, 3 Apr 2024 14:01:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 40/51]
 drivers/net/wireless/intersil/p54/main.c:554:24: error: implicit declaration
 of function '__find_and_set_bit'; did you mean '_find_last_bit'?
Message-ID: <202404031328.HtPLVizp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and-v4
head:   db33a7d65f9e64f900f68e46da4f113fbe6a7faa
commit: 2d1ff270a50ed1fe02fe7d3455be94a7f6b51cdd [40/51] drivers/net/wireless/intersil/p54/main.c
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240403/202404031328.HtPLVizp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031328.HtPLVizp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031328.HtPLVizp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/intersil/p54/main.c: In function 'p54_set_key':
>> drivers/net/wireless/intersil/p54/main.c:554:24: error: implicit declaration of function '__find_and_set_bit'; did you mean '_find_last_bit'? [-Werror=implicit-function-declaration]
     554 |                 slot = __find_and_set_bit(priv->used_rxkeys, priv->rx_keycache_size);
         |                        ^~~~~~~~~~~~~~~~~~
         |                        _find_last_bit
   In file included from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from drivers/net/wireless/intersil/p54/main.c:16:
>> drivers/net/wireless/intersil/p54/main.c:581:29: error: 'slon' undeclared (first use in this function); did you mean 'slot'?
     581 |                 __clear_bit(slon, priv->used_rxkeys);
         |                             ^~~~
   include/linux/bitops.h:49:32: note: in definition of macro 'bitop'
      49 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   drivers/net/wireless/intersil/p54/main.c:581:17: note: in expansion of macro '__clear_bit'
     581 |                 __clear_bit(slon, priv->used_rxkeys);
         |                 ^~~~~~~~~~~
   drivers/net/wireless/intersil/p54/main.c:581:29: note: each undeclared identifier is reported only once for each function it appears in
     581 |                 __clear_bit(slon, priv->used_rxkeys);
         |                             ^~~~
   include/linux/bitops.h:49:32: note: in definition of macro 'bitop'
      49 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   drivers/net/wireless/intersil/p54/main.c:581:17: note: in expansion of macro '__clear_bit'
     581 |                 __clear_bit(slon, priv->used_rxkeys);
         |                 ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +554 drivers/net/wireless/intersil/p54/main.c

   497	
   498	static int p54_set_key(struct ieee80211_hw *dev, enum set_key_cmd cmd,
   499			       struct ieee80211_vif *vif, struct ieee80211_sta *sta,
   500			       struct ieee80211_key_conf *key)
   501	{
   502		struct p54_common *priv = dev->priv;
   503		int slot, ret = 0;
   504		u8 algo = 0;
   505		u8 *addr = NULL;
   506	
   507		if (modparam_nohwcrypt)
   508			return -EOPNOTSUPP;
   509	
   510		if (key->flags & IEEE80211_KEY_FLAG_RX_MGMT) {
   511			/*
   512			 * Unfortunately most/all firmwares are trying to decrypt
   513			 * incoming management frames if a suitable key can be found.
   514			 * However, in doing so the data in these frames gets
   515			 * corrupted. So, we can't have firmware supported crypto
   516			 * offload in this case.
   517			 */
   518			return -EOPNOTSUPP;
   519		}
   520	
   521		mutex_lock(&priv->conf_mutex);
   522		if (cmd == SET_KEY) {
   523			switch (key->cipher) {
   524			case WLAN_CIPHER_SUITE_TKIP:
   525				if (!(priv->privacy_caps & (BR_DESC_PRIV_CAP_MICHAEL |
   526				      BR_DESC_PRIV_CAP_TKIP))) {
   527					ret = -EOPNOTSUPP;
   528					goto out_unlock;
   529				}
   530				key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV;
   531				algo = P54_CRYPTO_TKIPMICHAEL;
   532				break;
   533			case WLAN_CIPHER_SUITE_WEP40:
   534			case WLAN_CIPHER_SUITE_WEP104:
   535				if (!(priv->privacy_caps & BR_DESC_PRIV_CAP_WEP)) {
   536					ret = -EOPNOTSUPP;
   537					goto out_unlock;
   538				}
   539				key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV;
   540				algo = P54_CRYPTO_WEP;
   541				break;
   542			case WLAN_CIPHER_SUITE_CCMP:
   543				if (!(priv->privacy_caps & BR_DESC_PRIV_CAP_AESCCMP)) {
   544					ret = -EOPNOTSUPP;
   545					goto out_unlock;
   546				}
   547				key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV;
   548				algo = P54_CRYPTO_AESCCMP;
   549				break;
   550			default:
   551				ret = -EOPNOTSUPP;
   552				goto out_unlock;
   553			}
 > 554			slot = __find_and_set_bit(priv->used_rxkeys, priv->rx_keycache_size);
   555	
   556			if (slot >= priv->rx_keycache_size) {
   557				/*
   558				 * The device supports the chosen algorithm, but the
   559				 * firmware does not provide enough key slots to store
   560				 * all of them.
   561				 * But encryption offload for outgoing frames is always
   562				 * possible, so we just pretend that the upload was
   563				 * successful and do the decryption in software.
   564				 */
   565	
   566				/* mark the key as invalid. */
   567				key->hw_key_idx = 0xff;
   568				goto out_unlock;
   569			}
   570	
   571			key->flags |= IEEE80211_KEY_FLAG_RESERVE_TAILROOM;
   572		} else {
   573			slot = key->hw_key_idx;
   574	
   575			if (slot == 0xff) {
   576				/* This key was not uploaded into the rx key cache. */
   577	
   578				goto out_unlock;
   579			}
   580	
 > 581			__clear_bit(slon, priv->used_rxkeys);
   582			algo = 0;
   583		}
   584	
   585		if (sta)
   586			addr = sta->addr;
   587	
   588		ret = p54_upload_key(priv, algo, slot, key->keyidx,
   589				     key->keylen, addr, key->key);
   590		if (ret) {
   591			__clear_bit(slon, priv->used_rxkeys);
   592			ret = -EOPNOTSUPP;
   593			goto out_unlock;
   594		}
   595	
   596		key->hw_key_idx = slot;
   597	
   598	out_unlock:
   599		mutex_unlock(&priv->conf_mutex);
   600		return ret;
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
