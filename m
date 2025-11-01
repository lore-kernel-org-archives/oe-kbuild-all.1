Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECA641C62
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762009837; cv=none; b=fTwLkIf88SmZXTUUQOqwDt5TRM0y2+REhcvZhrGKf9Whyqc9okGssZQevQ0+JatP7HLPIMvmT2P1glc8jMvrH97gaNwOFg4M/2/CCqMMmWnemLqo52zm2pEX86RfgKNCSh7ui9E1m4H4meD8zFVMjmzSBZNZ/XRiRAK7xwV8MTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762009837; c=relaxed/simple;
	bh=CWu3cLMCgnhrtUrm7dJjljispOKeKdA8uglJomjaNEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sqSsXpCpGPa4ObwbzcPyCn/hEGt6cs1SI/JWYNqaP/TxTJf7EBCk/1uuvYyptDGN0uWYes9+W21Uy47jCoaNtV38nb8mEiZj4P0uxBGmYWLMkuPICKtcbQc/Ni8jDKCfosiZnmMdbVXydxvasEG2ACAliPq6WH9kLudYipmrtwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFrRw5x4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFrRw5x4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762009835; x=1793545835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CWu3cLMCgnhrtUrm7dJjljispOKeKdA8uglJomjaNEE=;
  b=YFrRw5x4jli+5wmyOBty9HuSqx4mXnjFLjml4p7WS+srG8w20Qptbq1E
   k/L0n+/wPK/XG1uKa2ggD0wEg+X7WIKSKNYH+8wu5PH2vy36R0CJCFkv2
   fX+PIcbGBgnb9CXFNUu46h6sCsf1IUrH0xK2RMTcF5WejDqYN04F6uZwn
   4+VKPb877Qim1JZpsDdNntSaxAi03ow5ybLCzYHCOGM3dsgQTQA1N6BOL
   Tln+Q1YxgdvKDKmFcRnMnN0EACoHmW2sNq7VwzraE2aj6K9SKr/OAuEcy
   MyLkUJ/Ee8RTWPPmZpEkOWh9B0MdmtF9qGYNZtXSwoAnB3ypOI3kGrlKq
   g==;
X-CSE-ConnectionGUID: WLWfZQnwQWeWByuDBHqPJw==
X-CSE-MsgGUID: d/E6SrwNR6W+UZluph9uAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="81561083"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="81561083"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 08:10:35 -0700
X-CSE-ConnectionGUID: f6OkcyKrRBCAmTCuL+92sA==
X-CSE-MsgGUID: S+CYppWYT/a9/JHsPduThg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="191619610"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Nov 2025 08:10:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFDFE-000ONO-1U;
	Sat, 01 Nov 2025 15:10:24 +0000
Date: Sat, 1 Nov 2025 23:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>
Subject: [linux-nvme:nvme-6.19 21/21] drivers/nvme/common/auth.c:158:13:
 error: redefinition of 'nvme_auth_extract_key'
Message-ID: <202511012300.eAcEQQP5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.19
head:   453ba3089d4570c2be2e230e1e7a287eac4b306b
commit: 453ba3089d4570c2be2e230e1e7a287eac4b306b [21/21] nvme: fixup nvme auth host/target dependency
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251101/202511012300.eAcEQQP5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511012300.eAcEQQP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511012300.eAcEQQP5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/common/auth.c:158:13: error: redefinition of 'nvme_auth_extract_key'
     158 | struct key *nvme_auth_extract_key(struct key *keyring, const u8 *secret,
         |             ^
   include/linux/nvme-auth.h:25:27: note: previous definition is here
      25 | static inline struct key *nvme_auth_extract_key(struct key *keyring,
         |                           ^
   1 error generated.


vim +/nvme_auth_extract_key +158 drivers/nvme/common/auth.c

f50fff73d620cd6 Hannes Reinecke 2022-06-27  157  
e30cd923b3ed107 Hannes Reinecke 2025-05-28 @158  struct key *nvme_auth_extract_key(struct key *keyring, const u8 *secret,
592f87de2971040 Hannes Reinecke 2025-05-28  159  				  size_t secret_len, bool *generated)
3ebed3749f17679 Mark O'Donovan  2023-10-17  160  {
e30cd923b3ed107 Hannes Reinecke 2025-05-28  161  	struct key *key;
3ebed3749f17679 Mark O'Donovan  2023-10-17  162  
592f87de2971040 Hannes Reinecke 2025-05-28  163  	key = nvme_dhchap_psk_lookup(keyring, secret);
592f87de2971040 Hannes Reinecke 2025-05-28  164  	if (!IS_ERR(key)) {
592f87de2971040 Hannes Reinecke 2025-05-28  165  		*generated = false;
592f87de2971040 Hannes Reinecke 2025-05-28  166  		return key;
592f87de2971040 Hannes Reinecke 2025-05-28  167  	}
e30cd923b3ed107 Hannes Reinecke 2025-05-28  168  	key = nvme_dhchap_psk_refresh(keyring, secret, secret_len);
592f87de2971040 Hannes Reinecke 2025-05-28  169  	if (!IS_ERR(key)) {
592f87de2971040 Hannes Reinecke 2025-05-28  170  		*generated = true;
592f87de2971040 Hannes Reinecke 2025-05-28  171  		pr_debug("generated dhchap key %s\n",
592f87de2971040 Hannes Reinecke 2025-05-28  172  			 key->description);
592f87de2971040 Hannes Reinecke 2025-05-28  173  	}
f50fff73d620cd6 Hannes Reinecke 2022-06-27  174  	return key;
f50fff73d620cd6 Hannes Reinecke 2022-06-27  175  }
f50fff73d620cd6 Hannes Reinecke 2022-06-27  176  EXPORT_SYMBOL_GPL(nvme_auth_extract_key);
f50fff73d620cd6 Hannes Reinecke 2022-06-27  177  

:::::: The code at line 158 was first introduced by commit
:::::: e30cd923b3ed10791cb23e15804b0b74af21e074 nvme-auth: switch to use 'struct key'

:::::: TO: Hannes Reinecke <hare@kernel.org>
:::::: CC: Keith Busch <kbusch@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
