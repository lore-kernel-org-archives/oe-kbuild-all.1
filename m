Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706E61E1E16
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 04:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164495; cv=none; b=XRxrpzG70Ns+ZcwS4/hrhs9DabfOpF5NCbHPBkLKULbzJxk8M7Cy5NEs+fA9eDeRQhjMjNeVQhICk8dAWgJ/uAkOI4Vhr0QfstK1PypbacQuJMOFsoCJp0f25H0AMiJGGL74VZr2defKJlgIpgvZRK6I8nByuZpQ8khe9PB5vTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164495; c=relaxed/simple;
	bh=GIU0SDqlCBuqLxjLuXHyyp8PjUZ4PDWJZ+svZ8peTXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lg8vM9PIhPg5Xdz8bHHSSrIQUcw4YqyXV/U5LdODGmDsiEK4KYxcnzRWnFpTQHZeOq0Mvc+P2DKNAoDxCfGqoun8wtYnUNkoYeS9GiqsM6wm3OVcRhE3EiQQTSJPt5jWbD/cKJyTOycmrwA3LojjbDHSN0VNLJMFvh6RCzw5HRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqX9R/h7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqX9R/h7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779164493; x=1810700493;
  h=date:from:to:cc:subject:message-id;
  bh=GIU0SDqlCBuqLxjLuXHyyp8PjUZ4PDWJZ+svZ8peTXo=;
  b=QqX9R/h727yc02ICaiEOSUeevKa3PxcFegnDysLSqlOWBG7P9YMVIcGS
   NBrQhmAgR9DGytqOawRiII72IEjffctv8LXlw1PU2W3G15uWFng+5MBw7
   DcSf3JflMpjad07MFMggL000zNXhVrqR5mHD4i+tCe170gVbe6sSf7GXS
   ktvoMAXVwWEOa9tyOhpEehBW5Ra/0YIb9ihLhiT63OnEHZSi2qquNUQv2
   cbh5vIZz7NhGYzzUFvBahTnjhtVL0VRxYfj0lQEZBmobMZh7r9u7j21J/
   DoUM+u2Xm2oHEsMZYcy2NdiYRtbbUwMmMgIWDCmus9xyZUDAfSLJjqser
   A==;
X-CSE-ConnectionGUID: Z2vce8f+QRWfZTPDuIkKNQ==
X-CSE-MsgGUID: +05GFikoQJSKxbxMMN9sXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79749372"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79749372"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 21:21:33 -0700
X-CSE-ConnectionGUID: n6xmW+rhRJ+33AVP9ROfeA==
X-CSE-MsgGUID: R6cA2n/9Qxex3jE8ipoy0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235408925"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 May 2026 21:21:31 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPBxR-000000000R1-0TMH;
	Tue, 19 May 2026 04:21:29 +0000
Date: Tue, 19 May 2026 12:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/ks8995-to-ksz8 4/6]
 net/dsa/tag_ks8995.c:72:17: sparse: sparse: cast to restricted __be16
Message-ID: <202605191225.wLcgU2cP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ks8995-to-ksz8
head:   fea5de171b5ce9847a3c73923483622c99d0a5eb
commit: 12e510a8b6756e4ddff7bb635492bb60b5d3a117 [4/6] net: dsa: tag_ks8995: Add the KS8995 tag handling
config: riscv-randconfig-r131-20260518 (https://download.01.org/0day-ci/archive/20260519/202605191225.wLcgU2cP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191225.wLcgU2cP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191225.wLcgU2cP-lkp@intel.com/

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
