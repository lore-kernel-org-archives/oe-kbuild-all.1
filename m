Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA006256D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 01:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712279421; cv=none; b=hIrmg2Zm4zQcQefgEJ6iSAr8Kgo0hj2RSl9JRo0yGgC0IugCPSKY2HGeWotoaMYO5XJ+bGaSnlrs0pELYtPtx4vSPHIENfH/A5UXunuor35TdNa9nwaY4mbBVcVQntEltypAtXKZHeLSZ2ikBN0JjV/txeCFOnJGMZjaRM874uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712279421; c=relaxed/simple;
	bh=llRyvafR3llWS1/4ogZYGdPTxPpOiJlX42XCBwdsuHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BROnSafo3J6d4R/ExNBYawlQE6ZF9vgIS5jJvXKQ0oPCdH1funjk2zXbn1pxgaMthYhUDapXjPIRXjN+CeOvNcflvUxvol1Kc7Qsvt4BZU5rHzg5qD1Y4uBbihVgTiKBf5PEC7EVJPWca64xeNJYMP+pgZC19Yhpw5Y2FB0yr6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhKupEOO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhKupEOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712279419; x=1743815419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=llRyvafR3llWS1/4ogZYGdPTxPpOiJlX42XCBwdsuHE=;
  b=fhKupEOO+VjaeF6cO7WmSixpZ+FDXPjCPH5zw3UzDM5XHR9XQpB8Up9W
   gFtwjDAfceCfecWJgbOrTsAYXwzaBGdGQgdKe9o3NenaQt+l7K/G/19tz
   +69YLSNl1Gn+EYQDE0/UqxwLMBH5Z1MNyvHjFdJixH8q30AINPUTbN9FR
   wRtmTYYiMmgiUQvFMQrT2NZ5Mp4vt+joZD2zL9beZBKAVXCJBEy378TBT
   W9hOScZsOCZEVhuzjV81MKjIvJnStyTKw69429nbh6htmJAzRspJm6Ur0
   uJg7itNpYWDPuk6yjAUaWUGM5khoJaZJq9gSqw4jW6gyyaK1VWpvkcaC3
   w==;
X-CSE-ConnectionGUID: lEsrJunSSve8OHJGBVSMsA==
X-CSE-MsgGUID: vefGNMGhQ1WUMOsfQoztJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="10570163"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="10570163"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 18:10:19 -0700
X-CSE-ConnectionGUID: CUCXobA9QNeDOuWlb9ItNQ==
X-CSE-MsgGUID: +JaYgxeATWaPd2nrhErUiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18997780"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Apr 2024 18:10:17 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsY5v-0001hY-1x;
	Fri, 05 Apr 2024 01:10:15 +0000
Date: Fri, 5 Apr 2024 09:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 40/51]
 drivers/net/wireless/intersil/p54/main.c:554:10: error: call to undeclared
 function '__find_and_set_bit'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202404050842.jCYweeit-lkp@intel.com>
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
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240405/202404050842.jCYweeit-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050842.jCYweeit-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050842.jCYweeit-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/intersil/p54/main.c:554:10: error: call to undeclared function '__find_and_set_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     554 |                 slot = __find_and_set_bit(priv->used_rxkeys, priv->rx_keycache_size);
         |                        ^
   drivers/net/wireless/intersil/p54/main.c:554:10: note: did you mean '___test_and_set_bit'?
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: note: '___test_and_set_bit' declared here
      97 | ___test_and_set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^
>> drivers/net/wireless/intersil/p54/main.c:581:15: error: use of undeclared identifier 'slon'; did you mean 'slot'?
     581 |                 __clear_bit(slon, priv->used_rxkeys);
         |                             ^~~~
         |                             slot
   include/linux/bitops.h:56:52: note: expanded from macro '__clear_bit'
      56 | #define __clear_bit(nr, addr)           bitop(___clear_bit, nr, addr)
         |                                                             ^
   include/linux/bitops.h:49:25: note: expanded from macro 'bitop'
      49 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^
   drivers/net/wireless/intersil/p54/main.c:503:6: note: 'slot' declared here
     503 |         int slot, ret = 0;
         |             ^
>> drivers/net/wireless/intersil/p54/main.c:581:15: error: use of undeclared identifier 'slon'; did you mean 'slot'?
     581 |                 __clear_bit(slon, priv->used_rxkeys);
         |                             ^~~~
         |                             slot
   include/linux/bitops.h:56:52: note: expanded from macro '__clear_bit'
      56 | #define __clear_bit(nr, addr)           bitop(___clear_bit, nr, addr)
         |                                                             ^
   include/linux/bitops.h:53:13: note: expanded from macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                    ^
   drivers/net/wireless/intersil/p54/main.c:503:6: note: 'slot' declared here
     503 |         int slot, ret = 0;
         |             ^
>> drivers/net/wireless/intersil/p54/main.c:581:15: error: use of undeclared identifier 'slon'; did you mean 'slot'?
     581 |                 __clear_bit(slon, priv->used_rxkeys);
         |                             ^~~~
         |                             slot
   include/linux/bitops.h:56:52: note: expanded from macro '__clear_bit'
      56 | #define __clear_bit(nr, addr)           bitop(___clear_bit, nr, addr)
         |                                                             ^
   include/linux/bitops.h:53:28: note: expanded from macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^
   drivers/net/wireless/intersil/p54/main.c:503:6: note: 'slot' declared here
     503 |         int slot, ret = 0;
         |             ^
   drivers/net/wireless/intersil/p54/main.c:591:15: error: use of undeclared identifier 'slon'; did you mean 'slot'?
     591 |                 __clear_bit(slon, priv->used_rxkeys);
         |                             ^~~~
         |                             slot
   include/linux/bitops.h:56:52: note: expanded from macro '__clear_bit'
      56 | #define __clear_bit(nr, addr)           bitop(___clear_bit, nr, addr)
         |                                                             ^
   include/linux/bitops.h:49:25: note: expanded from macro 'bitop'
      49 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^
   drivers/net/wireless/intersil/p54/main.c:503:6: note: 'slot' declared here
     503 |         int slot, ret = 0;
         |             ^
   drivers/net/wireless/intersil/p54/main.c:591:15: error: use of undeclared identifier 'slon'; did you mean 'slot'?
     591 |                 __clear_bit(slon, priv->used_rxkeys);
         |                             ^~~~
         |                             slot
   include/linux/bitops.h:56:52: note: expanded from macro '__clear_bit'
      56 | #define __clear_bit(nr, addr)           bitop(___clear_bit, nr, addr)
         |                                                             ^
   include/linux/bitops.h:53:13: note: expanded from macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                    ^
   drivers/net/wireless/intersil/p54/main.c:503:6: note: 'slot' declared here
     503 |         int slot, ret = 0;
         |             ^
   drivers/net/wireless/intersil/p54/main.c:591:15: error: use of undeclared identifier 'slon'; did you mean 'slot'?
     591 |                 __clear_bit(slon, priv->used_rxkeys);
         |                             ^~~~
         |                             slot
   include/linux/bitops.h:56:52: note: expanded from macro '__clear_bit'
      56 | #define __clear_bit(nr, addr)           bitop(___clear_bit, nr, addr)
         |                                                             ^
   include/linux/bitops.h:53:28: note: expanded from macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^
   drivers/net/wireless/intersil/p54/main.c:503:6: note: 'slot' declared here
     503 |         int slot, ret = 0;
         |             ^
   7 errors generated.


vim +/__find_and_set_bit +554 drivers/net/wireless/intersil/p54/main.c

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
