Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF9733939B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 02:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786587318; cv=none; b=N6sT8I/CFYgFFruC1zqJHgMLkEfuPpssD5DTTPtwh08UFBwSGDiyzU0356syHQKVldr2WLTglfjWyMBJwII+Ouil47O6hhLsTMC4bzUMPlssn4O8Q//9uF/XHauV04PIXJ69TGxU7pq67/SDnsDKLvu6KURcNungEawDFES+83o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786587318; c=relaxed/simple;
	bh=e91iBH/5cG9uISFEKq3liLBxBzbt9ilpsecBRtdOWts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qndgYUW7xndAIAo0mGJ26cg6MQkfSultWQTRU93Pt3wfZ7HwcAr6vFI4yKi76SbQjfn/NTaDqaM8r3DAi/0CXbhmhU2mnmejdbpGHYX4nDCZBeLrQK70k0wGC8AroKb4b1nnjKay9aBd1PKXGg4eokq6WQ+L2+LCwJ7ae/Ed/ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wt756nPO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wt756nPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786587316; x=1818123316;
  h=date:from:to:cc:subject:message-id;
  bh=e91iBH/5cG9uISFEKq3liLBxBzbt9ilpsecBRtdOWts=;
  b=Wt756nPO2tYSHeLtgEjLv1jHPcCTQUYqPIcPlNH9Dy9rRwWAYHYW2M1h
   4Kvw8GiOMUOioAw3uccs/0h77VpXf6au8Cn9vBH8rNwaDpKiyHh1d5rty
   kaiOs3F/jHUySVDOHB6geZTyNDl5Yb5QDPcks6OgLguMzre6OEoOeYxtu
   E+OYjHCZxXjWXHwf2yxszOCcK2t6hZRDApPLJyZ3CAMlKn33aEslPeawo
   zfo9jTyXirc9jpAkYcQTwt2jIf9XFaL9TgpWTiIqb+Kw+vVl/hWHOl1cE
   TyT1XmoOyC0Twy/SpS9sMT66EdRg7NN/T3c8XrB6nAXUCo40E/DerpG55
   w==;
X-CSE-ConnectionGUID: crus6lczSbW8c7OWPVDNMg==
X-CSE-MsgGUID: NAbfmY6ZRRiewnGMl4VX+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87280156"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87280156"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 19:15:15 -0700
X-CSE-ConnectionGUID: GwBLWM7BRW2nlzmiuvbjsg==
X-CSE-MsgGUID: 84IVofFtSDy3jAwUM1gATA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="264389822"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2026 19:15:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuKyN-00000000SUw-09Am;
	Thu, 13 Aug 2026 02:15:11 +0000
Date: Thu, 13 Aug 2026 10:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: Suman Ghosh <sumang@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Ratheesh Kannoth <rkannoth@marvell.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c:3736
 rvu_dbg_npc_exact_drop_cnt() warn: inconsistent indenting
Message-ID: <202608131017.oJxQ2cZN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
commit: 4e527f1e5c155ce28164ba34cad47b635d16f827 octeontx2-af: npc: cn20k: Add new mailboxes for CN20K silicon
date:   6 months ago
config: arm64-randconfig-r071-20260812 (https://download.01.org/0day-ci/archive/20260813/202608131017.oJxQ2cZN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4e527f1e5c15 ("octeontx2-af: npc: cn20k: Add new mailboxes for CN20K silicon")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131017.oJxQ2cZN-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c:3736 rvu_dbg_npc_exact_drop_cnt() warn: inconsistent indenting

Old smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c:1376 parse_cmd_buffer_ctx() warn: variable dereferenced before check 'cmd_buf' (see line 1356)

vim +3736 drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c

  3705	
  3706	static int rvu_dbg_npc_exact_drop_cnt(struct seq_file *s, void *unused)
  3707	{
  3708		struct npc_exact_table *table;
  3709		struct rvu *rvu = s->private;
  3710		struct npc_key_field *field;
  3711		u64 cfg, cam1, off;
  3712		u16 chan, pcifunc;
  3713		int blkaddr, i;
  3714		char *str;
  3715	
  3716		blkaddr = rvu_get_blkaddr(rvu, BLKTYPE_NPC, 0);
  3717		table = rvu->hw->table;
  3718	
  3719		field = &rvu->hw->mcam.rx_key_fields[NPC_CHAN];
  3720	
  3721		seq_puts(s, "\n\t Exact Hit on drop status\n");
  3722		seq_puts(s, "\npcifunc\tmcam_idx\tHits\tchan\tstatus\n");
  3723	
  3724		for (i = 0; i < table->num_drop_rules; i++) {
  3725			pcifunc = rvu_npc_exact_drop_rule_to_pcifunc(rvu, i);
  3726			cfg = rvu_read64(rvu, blkaddr, NPC_AF_MCAMEX_BANKX_CFG(i, 0));
  3727	
  3728			/* channel will be always in keyword 0 */
  3729			cam1 = rvu_read64(rvu, blkaddr,
  3730					  NPC_AF_MCAMEX_BANKX_CAMX_W0(i, 0, 1));
  3731			chan = field->kw_mask[0] & cam1;
  3732	
  3733			str = (cfg & 1) ? "enabled" : "disabled";
  3734			if (is_cn20k(rvu->pdev)) {
  3735				off = NPC_AF_CN20K_MCAMEX_BANKX_STAT_EXT(i, 0);
> 3736			seq_printf(s, "0x%x\t%d\t\t%llu\t0x%x\t%s\n", pcifunc,
  3737				   i, rvu_read64(rvu, blkaddr, off), chan, str);
  3738			} else {
  3739				off = NPC_AF_MATCH_STATX(table->counter_idx[i]);
  3740				seq_printf(s, "0x%x\t%d\t\t%llu\t0x%x\t%s\n", pcifunc,
  3741					   i, rvu_read64(rvu, blkaddr, off),
  3742					   chan, str);
  3743			}
  3744	
  3745		}
  3746	
  3747		return 0;
  3748	}
  3749	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
