Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC6429C35A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Aug 2026 22:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785709634; cv=none; b=bWnDMu1vg1xbFLWeOBaeVV3jW9mdQ2dp2tn64V9lCLTlHwiG+VWmK8Ldia2GT1i51v2gahnsvF9SSCQ8iaycVICfAI25xX/ARyoXKkIohX2S1ppBZETqNCtV4tfxpr58ZV6+qhjgHypwyztkZzYNRbCd9IZIEl62oXojnzq7R18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785709634; c=relaxed/simple;
	bh=XvpcUCqESE+VlosEmHL08gHeCS3C1F65Bmduv5ZELLY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zm7Wn8VoLlXyUx1t0MGYXO2ZztgYJoLQtZZdA/vn/dAET5YsrS2iAUWlfAjGRigABcz54CQCkp6mzJXxHA5EIhaztrEjMALu3ntvuVcNrVcCM8brOXuL0XSoTdeB7CfeO7Kd1Y3RGSfZ9GT1bLtOAKVk5viaDd+JNTbETWRWMKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajhJtLEe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajhJtLEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785709633; x=1817245633;
  h=date:from:to:cc:subject:message-id;
  bh=XvpcUCqESE+VlosEmHL08gHeCS3C1F65Bmduv5ZELLY=;
  b=ajhJtLEeq+qArIrno7p4J61kGIjspISQ4PKUBMFzNc2hWzTqICsIieEi
   5zktISvuS0bdEzdYYtU5o0+zrIPNu3Wh7+bAi5MrtDf129SIWCVh20mhM
   8a+oGN0HMkZpELMLsDMRIxEQCOFeczXTwZvqlOmCi0cz2YfHAghqi/SxV
   r62pV5V0jOwIxzdFhARtm3oxNCF7MpySlZPnuou8KtAa8aOQGN9yIOe2Q
   hPAHb4Jv3PEePdEWfhkTEy/AdRcPY/vCV2Bq2KeNp0P8oLth+NqcYqieB
   ioB0NIDfeCyxXX3pnLkTchV82RZtF+xgB1BMKfoiUMZHzd25LGsRjpuAw
   Q==;
X-CSE-ConnectionGUID: MFMT44XBRkm4Tb2HNVgtKQ==
X-CSE-MsgGUID: XEaPlxntTD2kn678hz/7cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86200298"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="86200298"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 15:27:12 -0700
X-CSE-ConnectionGUID: KkHH2pR4SziU3C37r+t40w==
X-CSE-MsgGUID: Aqt6+j6kQeWzDQFIplTxgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="259827009"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2026 15:27:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqeeC-000000005br-3Pop;
	Sun, 02 Aug 2026 22:27:08 +0000
Date: Mon, 03 Aug 2026 06:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>
Subject: net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
Message-ID: <202608030650.n4Edlu7I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jakub,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bd1dde877520385f6638af2d0f2bd4f212eb8f34
commit: e9deb406c10f5a73bcfd62f42ca1187b220bc188 Merge tag 'ipsec-2026-06-22' of git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec
date:   6 weeks ago
config: s390-randconfig-r062-20260802 (https://download.01.org/0day-ci/archive/20260803/202608030650.n4Edlu7I-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608030650.n4Edlu7I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e9deb406c10f ("Merge tag 'ipsec-2026-06-22' of git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608030650.n4Edlu7I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/xfrm/xfrm_state.c: Assembler messages:
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
>> net/xfrm/xfrm_state.c:1220: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'
   net/xfrm/xfrm_state.c:1225: Warning: missing closing `"'


vim +1220 net/xfrm/xfrm_state.c

edcd582152090b David S. Miller  2006-08-24  1200  
81a331a0e72ddc Steffen Klassert 2024-10-23  1201  struct xfrm_state *xfrm_input_state_lookup(struct net *net, u32 mark,
81a331a0e72ddc Steffen Klassert 2024-10-23  1202  					   const xfrm_address_t *daddr,
81a331a0e72ddc Steffen Klassert 2024-10-23  1203  					   __be32 spi, u8 proto,
81a331a0e72ddc Steffen Klassert 2024-10-23  1204  					   unsigned short family)
81a331a0e72ddc Steffen Klassert 2024-10-23  1205  {
e952837f3ddb0f Florian Westphal 2024-11-28  1206  	struct xfrm_hash_state_ptrs state_ptrs;
81a331a0e72ddc Steffen Klassert 2024-10-23  1207  	struct hlist_head *state_cache_input;
81a331a0e72ddc Steffen Klassert 2024-10-23  1208  	struct xfrm_state *x = NULL;
81a331a0e72ddc Steffen Klassert 2024-10-23  1209  
ddd3d013292031 Herbert Xu       2026-06-12  1210  	/* BH is always disabled on the input path. */
ddd3d013292031 Herbert Xu       2026-06-12  1211  	lockdep_assert_in_softirq();
ddd3d013292031 Herbert Xu       2026-06-12  1212  
6c9b7db96db62e Sebastian Sewior 2025-01-23  1213  	state_cache_input = raw_cpu_ptr(net->xfrm.state_cache_input);
81a331a0e72ddc Steffen Klassert 2024-10-23  1214  
81a331a0e72ddc Steffen Klassert 2024-10-23  1215  	hlist_for_each_entry_rcu(x, state_cache_input, state_cache_input) {
81a331a0e72ddc Steffen Klassert 2024-10-23  1216  		if (x->props.family != family ||
81a331a0e72ddc Steffen Klassert 2024-10-23  1217  		    x->id.spi       != spi ||
81a331a0e72ddc Steffen Klassert 2024-10-23  1218  		    x->id.proto     != proto ||
81a331a0e72ddc Steffen Klassert 2024-10-23  1219  		    !xfrm_addr_equal(&x->id.daddr, daddr, family))
81a331a0e72ddc Steffen Klassert 2024-10-23 @1220  			continue;
81a331a0e72ddc Steffen Klassert 2024-10-23  1221  
81a331a0e72ddc Steffen Klassert 2024-10-23  1222  		if ((mark & x->mark.m) != x->mark.v)
81a331a0e72ddc Steffen Klassert 2024-10-23  1223  			continue;
81a331a0e72ddc Steffen Klassert 2024-10-23  1224  		if (!xfrm_state_hold_rcu(x))
81a331a0e72ddc Steffen Klassert 2024-10-23  1225  			continue;
81a331a0e72ddc Steffen Klassert 2024-10-23  1226  		goto out;
81a331a0e72ddc Steffen Klassert 2024-10-23  1227  	}
81a331a0e72ddc Steffen Klassert 2024-10-23  1228  
e952837f3ddb0f Florian Westphal 2024-11-28  1229  	xfrm_hash_ptrs_get(net, &state_ptrs);
e952837f3ddb0f Florian Westphal 2024-11-28  1230  
e952837f3ddb0f Florian Westphal 2024-11-28  1231  	x = __xfrm_state_lookup(&state_ptrs, mark, daddr, spi, proto, family);
ddd3d013292031 Herbert Xu       2026-06-12  1232  	if (x) {
ddd3d013292031 Herbert Xu       2026-06-12  1233  		spin_lock(&net->xfrm.xfrm_state_lock);
ddd3d013292031 Herbert Xu       2026-06-12  1234  		if (x->km.state != XFRM_STATE_VALID) {
ddd3d013292031 Herbert Xu       2026-06-12  1235  			/*
ddd3d013292031 Herbert Xu       2026-06-12  1236  			 * The state is about to be destroyed.
ddd3d013292031 Herbert Xu       2026-06-12  1237  			 *
ddd3d013292031 Herbert Xu       2026-06-12  1238  			 * Don't add it to the cache but still
ddd3d013292031 Herbert Xu       2026-06-12  1239  			 * return it to the caller.
ddd3d013292031 Herbert Xu       2026-06-12  1240  			 */
ddd3d013292031 Herbert Xu       2026-06-12  1241  		} else if (hlist_unhashed(&x->state_cache_input)) {
81a331a0e72ddc Steffen Klassert 2024-10-23  1242  			hlist_add_head_rcu(&x->state_cache_input, state_cache_input);
81a331a0e72ddc Steffen Klassert 2024-10-23  1243  		} else {
81a331a0e72ddc Steffen Klassert 2024-10-23  1244  			hlist_del_rcu(&x->state_cache_input);
81a331a0e72ddc Steffen Klassert 2024-10-23  1245  			hlist_add_head_rcu(&x->state_cache_input, state_cache_input);
81a331a0e72ddc Steffen Klassert 2024-10-23  1246  		}
ddd3d013292031 Herbert Xu       2026-06-12  1247  		spin_unlock(&net->xfrm.xfrm_state_lock);
81a331a0e72ddc Steffen Klassert 2024-10-23  1248  	}
81a331a0e72ddc Steffen Klassert 2024-10-23  1249  
81a331a0e72ddc Steffen Klassert 2024-10-23  1250  out:
81a331a0e72ddc Steffen Klassert 2024-10-23  1251  	return x;
81a331a0e72ddc Steffen Klassert 2024-10-23  1252  }
81a331a0e72ddc Steffen Klassert 2024-10-23  1253  EXPORT_SYMBOL(xfrm_input_state_lookup);
81a331a0e72ddc Steffen Klassert 2024-10-23  1254  

:::::: The code at line 1220 was first introduced by commit
:::::: 81a331a0e72ddc2f75092603d9577bd1a0ca23ad xfrm: Add an inbound percpu state cache.

:::::: TO: Steffen Klassert <steffen.klassert@secunet.com>
:::::: CC: Steffen Klassert <steffen.klassert@secunet.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
