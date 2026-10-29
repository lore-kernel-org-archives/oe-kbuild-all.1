Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275946;
	b=SkhcjfZ77Czy6SUjhxkZD3CgIr8H0UeXk3/Nj+6NMTv39wuyZrEZWCmCUrn9IkCLBkli
	 So/njNm3QsVwTHjlv1WQRRyznuADRbD1H8Q70ymwtVaW5kD50tv0w6qJ3L2P2HCZZ7IhJ
	 TUdHPzB7QJOxoLYRZalcecgrlwMdDJDEH2Vb+erMvOaJTUiiDN3iu1pO+txcqi5FM4muL
	 JmPAimditcqIHMlfV5tAm0HXnG+Onsq2NsQrSSYbwouOTpVJjeyozyD9Ug/BcXGqGga1T
	 4cOMmK+1ZE73ay01783s0Qc911SYcTUF1TFpOkNYenp4uV3r+2hlPzK+AfKGBNBXGjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275946;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YeKP/mx9Y1SzI4SBw40DyIyFHV7jhZM9ZR9OchFrjeU=;
	b=NHgSIp5VLlgweOPlxvXb6SHRdeyLO5jWnFhXbnyqfaNz5e0PPkoglOzEu+cg2hAuxmfQ
	 tU2JzywsyaqkznJSPk7gTG8kt3fQcn1aY9GARD2YLN01zEf5AVdVOMRLKpYnRHpo2pKLs
	 vB+MUu0KNCCmVBcDHJAIPCrG0x/CQgMRFLxHLV8JWYJiV+6EHs0MbiGy94btanHvnhEHU
	 Ca5APKnK6kjUZA9UA+k1Ai4mLZilK3e77ylOcizwm5S0Ua6Ua77CtPvV19g/w9wjafGVu
	 +/TV6A3bhlmgDLS7h4/w+yFdbgfmbAdHk7vDbMV8PVLOHTF8rwetX2hI4H6dONJifXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W81drkan;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F9A606A31D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 12:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F9A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W81drkan
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793275945; x=1824811945;
  h=date:from:to:cc:subject:message-id;
  bh=DipbPASF0CgBbzINXWMr9xFrVFvLJNf1x/ZKWI+KkMg=;
  b=W81drkan+XQgM2+6uUWoBV6SnUKSDLhGNWo1HeDnasFTeYtzfROs98CU
   yVLwE6JuKZp6fR/BfkBSq5K7sD4mq5PEy/4JQfYfb06iHupRLfvO/t/XH
   xnmnYF1bLl5D+2/Cu3IyMsufiNnom4P8+VujV4eEbZgbMQCriVFfbJXw8
   FSS40EtdtLrbC1Fa4QXHViRdkFR7o5JHJ6+Y84BHNxg7yuzb6uuUgjIpu
   UKhp+WHzaKmpd0ryasWIAEQeKdqJJYvUV2S5U+A9OuXnNkbFdj1NoVzF6
   rhHt+af3amLV+m0EDlNRPF12rW0wlm63NkIZWVk3Hpj58EU07/syiQT1T
   g==;
X-CSE-ConnectionGUID: RnOAIFINQKy7XM0ui/JKcg==
X-CSE-MsgGUID: 4Tg+a/XWSR+zI4TaqObVDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1900546"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1900546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:12:23 -0700
X-CSE-ConnectionGUID: 48BOMm5wTIOrtAfrZGl1vw==
X-CSE-MsgGUID: 6cA/iKzNQCikHjwleKxEvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5085153"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2026 05:12:21 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMOzT-000000005Et-1AfM;
	Thu, 29 Oct 2026 12:12:19 +0000
Date: Thu, 29 Oct 2026 13:11:53 +0100
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:dense_ulong 61/80] lib/maple_tree.c:2443:47: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202610291348.aEQzm9l2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git dense_ulong
head:   05d6e5c4cab7c4912959bf9ea5f797e6bc55eca5
commit: 9559a25306a2b87205eb83d584989b64f82a5cfc [61/80] maple_tree: Add ENODE_NULL support
config: microblaze-randconfig-r2310-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291348.aEQzm9l2-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291348.aEQzm9l2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291348.aEQzm9l2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:2443:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct maple_enode const *node @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:2443:47: sparse:     expected struct maple_enode const *node
   lib/maple_tree.c:2443:47: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:4763:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct maple_enode const *node @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:4763:25: sparse:     expected struct maple_enode const *node
   lib/maple_tree.c:4763:25: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:4763:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct maple_enode const *node @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:4763:25: sparse:     expected struct maple_enode const *node
   lib/maple_tree.c:4763:25: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:4812:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct maple_enode const *node @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:4812:25: sparse:     expected struct maple_enode const *node
   lib/maple_tree.c:4812:25: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:4812:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct maple_enode const *node @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:4812:25: sparse:     expected struct maple_enode const *node
   lib/maple_tree.c:4812:25: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:4763:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct maple_enode const *node @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:4763:25: sparse:     expected struct maple_enode const *node
   lib/maple_tree.c:4763:25: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:4812:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct maple_enode const *node @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:4812:25: sparse:     expected struct maple_enode const *node
   lib/maple_tree.c:4812:25: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:4763:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct maple_enode const *node @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:4763:25: sparse:     expected struct maple_enode const *node
   lib/maple_tree.c:4763:25: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:4812:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct maple_enode const *node @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:4812:25: sparse:     expected struct maple_enode const *node
   lib/maple_tree.c:4812:25: sparse:     got void [noderef] __rcu *

vim +2443 lib/maple_tree.c

  2415	
  2416	/*
  2417	 * ma_has_null() - Is there a NULL entry in @node, or below it?
  2418	 * @node: The maple node
  2419	 * @type: The maple node type
  2420	 * @min: The first index of the node
  2421	 * @max: The last index of the node
  2422	 *
  2423	 * A leaf is scanned; an internal node asks its children's NULL bits.
  2424	 */
  2425	static bool ma_has_null(struct maple_node *node, enum maple_type type,
  2426				u64 min, u64 max)
  2427	{
  2428		void __rcu **slots = ma_slots(node, type);
  2429		unsigned char i, end;
  2430	
  2431		if (ma_is_dense(type))
  2432			end = max - min;
  2433		else
  2434			end = ma_data_end(node, type, max);
  2435	
  2436		if (ma_is_leaf(type)) {
  2437			for (i = 0; i <= end; i++) {
  2438				if (!slots[i])
  2439					return true;
  2440			}
  2441		} else {
  2442			for (i = 0; i <= end; i++) {
> 2443				if (mte_has_null(slots[i]))
  2444					return true;
  2445			}
  2446		}
  2447	
  2448		return false;
  2449	}
  2450	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
