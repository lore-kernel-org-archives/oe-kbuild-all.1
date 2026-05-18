Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8B83E7BC3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100712; cv=none; b=k6nTOPyNIMClikpIrAOMDKlSz7ACe0TRieYlsb5jI0UtN3OZjZ8RVisdYCkGsoDADhN0HXIlwHvUjBnyGFqOl9nd4JEkGUmj+wYeHjGlWckmy6/qN3oEPXTjiTWAZwXUH/c9YLvJ2gU0oH3K20XUpAwh57UQA8ZuyHs6FX6r8BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100712; c=relaxed/simple;
	bh=L8o5Z5oErEje4XN2CnrDUXWZOzHnJR2Z5gjiaTBI8yc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ev+oawVX0DbkSGbmRXJw6W6nqpovkgjpN6gtMwf9QTBWoPcUhCGNddLQouNZ/eb9QBSebxMZ/stjmvWzEPwOl584jSA5tvqlxkBHW8ZymPGW57k1ykn5+Z9Zv8wNP50QTi9Jf7YD2185J5QII7gZUsVXBrkLPl7fGhvzofYExCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8Z4LcmS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8Z4LcmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779100703; x=1810636703;
  h=date:from:to:cc:subject:message-id;
  bh=L8o5Z5oErEje4XN2CnrDUXWZOzHnJR2Z5gjiaTBI8yc=;
  b=A8Z4LcmS31twlnTSQrIpF4TWisOKnz9FVGLAozCYOicG/ymYDQeNQVry
   SsFZdPYIBfDVA7XWmq2GLshKSzJbcXHq/Tjd5dqXea/2t7MCtqsseisfC
   PXWgvYS8GmhnJ4TRfXxfXOOWBpKg3oOYbKoX8lPoA4O0jxFSm7wV0TGN+
   wHXdukmipg1/ue8z15XxVeWrcMD9kLu6mLb7mMbMxdHhvVnbUS8zkFXPh
   B4cKJyVSG/eL8oB5/fp0rWO33fiWH+HFZge8frFLfJazpgECd2lZGsu9p
   em3mNPL6hEYEYIgW0MFCPWop4LlR0uZdZGngPrMjHLVyhg2yk0fuJsK7w
   w==;
X-CSE-ConnectionGUID: Pk+CIMHlTpuf7evT0FFtKQ==
X-CSE-MsgGUID: r18KUlzORj2e94z7IRajeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90258025"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="90258025"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 03:38:19 -0700
X-CSE-ConnectionGUID: JUgSL4x5RWCsM2guu8CL/Q==
X-CSE-MsgGUID: kQRefGg1S6eS7/HpyfTJcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239647625"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 May 2026 03:38:17 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOvMU-000000002cQ-33NX;
	Mon, 18 May 2026 10:38:14 +0000
Date: Mon, 18 May 2026 18:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/ks8995-to-ksz8 4/6]
 net/dsa/tag_ks8995.c:72:17: sparse: sparse: cast to restricted __be16
Message-ID: <202605181817.TpibjwFT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ks8995-to-ksz8
head:   fea5de171b5ce9847a3c73923483622c99d0a5eb
commit: 12e510a8b6756e4ddff7bb635492bb60b5d3a117 [4/6] net: dsa: tag_ks8995: Add the KS8995 tag handling
config: riscv-randconfig-r131-20260518 (https://download.01.org/0day-ci/archive/20260518/202605181817.TpibjwFT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605181817.TpibjwFT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605181817.TpibjwFT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> net/dsa/tag_ks8995.c:72:17: sparse: sparse: cast to restricted __be16
>> net/dsa/tag_ks8995.c:72:17: sparse: sparse: cast to restricted __be16
>> net/dsa/tag_ks8995.c:72:17: sparse: sparse: cast to restricted __be16
>> net/dsa/tag_ks8995.c:72:17: sparse: sparse: cast to restricted __be16

vim +72 net/dsa/tag_ks8995.c

    59	
    60	static struct sk_buff *ks8995_rcv(struct sk_buff *skb, struct net_device *dev)
    61	{
    62		int portmask;
    63		u16 etype;
    64	
    65		/* We are expecting all received packets to have a mangled VLAN
    66		 * TPID, so drop anything else. Because of the non-standard TPID,
    67		 * don't even bother looking for a tag in the hwaccel area.
    68		 *
    69		 * We have to inspect the ethertype directly because skb->protocol
    70		 * will contain garbage.
    71		 */
  > 72		etype = ntohs(*(u16 *)dsa_etype_header_pos_rx(skb));
    73		if ((etype & KS8995M_STPID_STD) != ETH_P_8021Q) {
    74			netdev_info(dev, "%s: dropped ethertype 0x%04x\n",
    75				    __func__, etype);
    76			return NULL;
    77		}
    78		netdev_dbg(dev, "%s: received ethertype %04x\n",
    79			   __func__, etype);
    80	
    81		/* Move the custom DSA+VLAN tag into the hwaccel area and strip
    82		 * it from the skb head
    83		 */
    84		skb = skb_vlan_untag(skb);
    85		if (!skb) {
    86			netdev_err(dev, "%s: unable to untag protocol %04x vlan protocol  %04x\n",
    87				   __func__, ntohs(skb->protocol), ntohs(skb->vlan_proto));
    88			return NULL;
    89		}
    90	
    91		portmask = FIELD_GET(KS8995M_STPID_PORTMASK, etype);
    92		netdev_dbg(dev, "%s: etype %04x portmask %04x (%d)\n",
    93			   __func__, etype, portmask, ilog2(portmask));
    94		skb->dev = dsa_conduit_find_user(dev, 0, ilog2(portmask));
    95		if (!skb->dev)
    96			return NULL;
    97	
    98		/* Preserve the VLAN tag if it contains a non-zero VID which is not
    99		 * identical to 0x001, or PCP, and restore its TPID to the standard
   100		 * value.
   101		 *
   102		 * If this is just an ordinary inbound package the datasheet claims
   103		 * it will "replace null VID with ingress port VID", which means
   104		 * VID set to 1: 0x8101 0001 for port 0 or 0x8102 0001 for port 1.
   105		 * So in the DSA driver we will set the default port VID to 0 so
   106		 * we can properly detect non-VLAN frames.
   107		 */
   108		if (!skb->vlan_tci) {
   109			netdev_dbg(dev, "%s: clear VLAN tag from frame\n", __func__);
   110			__vlan_hwaccel_clear_tag(skb);
   111		} else {
   112			skb->vlan_proto = htons(ETH_P_8021Q);
   113			netdev_dbg(dev, "%s: vlan_tci = 0x%04x VLAN frame\n",
   114				   __func__, skb->vlan_tci);
   115		}
   116	
   117		dsa_default_offload_fwd_mark(skb);
   118	
   119		return skb;
   120	}
   121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
