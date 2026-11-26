Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795727946;
	b=FaSvLtrAuED/FRsK3xhi60tKN44FLJK+CWOGM1ybGaSA/4B04Qh2FLQShZL7yMy4IEMA
	 XgXMYe+2+JyAXXAgLislddvhV8qJq5P8kvjnq1ZA242YpiFYshMfDnPi8yXY5gjDTXTeo
	 RbGQcH6Wgb5EFNiUcfz5vm7K9Jsnv/hLco20L61sedISa1F7ZlVaYR8s+eYEhsPAQzhlq
	 Mdp7J4TpFzhNq9QgsX0D+o75MnQJZpjvxTMC8/jWa6qmpCFUjwWuo6suXHfbVzEG+4fWq
	 X7awEyNS0+DZrxlx8+0+lbZDrli59vQcP9YnjroO3HJzosQHtWOeBsOe5pr6qtpWTsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795727946;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=hbf3r1YKsZ/rjefB5uXr2cqpRkWSrPfPVGnHGGV85+c=;
	b=UZw442YtdS6V1judLVPozlPITQYHyH3YpvSX4mOna6buE+Y0W2Dt7QLuEsRvUC81p8HH
	 XM5GLSUoD8EhURXmKmzgOALHIE6wWbPG8cuWzBKXrbPlP5U3l/nCqEwM/kOMNpdOZB4Oh
	 GhbiY/D/yUXG8h5UFuaISXqmKHVIXItpDlbclg6IcV0usx1iHSyEhFnn7ji224OWLyq9+
	 3G4Z6sYYN+hfu/oIOoGUbMxMoTfmo1+/sFMdpMdE1Z3BH8jy7agmhmMO//VPZedimlxc/
	 VkQuzqfBJ7ntrQH16dCHaFbbPfbzEyOJhyFrTNaXZjjNsviPjOdJ/2TnBBdh4tpe3ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ooo2OGXb;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A03606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 21:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A03606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ooo2OGXb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795727946; x=1827263946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2RZbJfHsu6ZR0HQLJSFs5ivZXLia6F66ZMZjV64PAc=;
  b=Ooo2OGXbfb6XLSrtXl7VN8EjO5MJ+6ZA5KbP9NLwUaUYNo7Ri5jEj+o0
   dxt7x4DIoQ7jBBcMQb0qrxcd3MMB4yVWpnTsms7leAESn2crZQghpu3IV
   K/DxtrL/U5yToGr930eGCYLX1WoDQCq3VtlYD5Q8KJoxxHZeT8iyA/TOS
   0ZzMl0ZoWBkHSWCSTrBe54w0uwRRHpfGH3kGM9hbrFfGbN3oaGMuAr8yH
   cr2y4BlPfkOf3Jom6hIMiXBTbXhAh0PlaqhIgtgczgWUPI+NcfXyEL6rM
   8ZTRylTc1aPOsjAw9FDUjZc2vTfZwJ84GGWgwcoaE9gQ87tQouHio9jBv
   w==;
X-CSE-ConnectionGUID: TkttpxV3QxSUB3abDH8i9w==
X-CSE-MsgGUID: LPiEZEFETSibogTjVIf1LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4551777"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4551777"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 13:19:06 -0800
X-CSE-ConnectionGUID: lKZYX4NsStKT9y+TMiVP4A==
X-CSE-MsgGUID: s2YYOgtgS8arGVlCNaMjDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12282141"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2026 13:19:03 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWgrs-000000000CA-2sBW;
	Thu, 26 Nov 2026 21:19:00 +0000
Date: Thu, 26 Nov 2026 22:18:28 +0100
From: kernel test robot <lkp@intel.com>
To: "Maxime =?utf-8?Q?B=C3=A9lair"?= <maxime.belair@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 John Johansen <john.johansen@canonical.com>
Subject: security/apparmor/policy_unpack.c:1814:2-8: WARNING: NULL
 check before some freeing functions is not needed.
Message-ID: <20261126221434.SFIqjXah-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9437ee8b6cf607e883b36e44bd755968daaebd48
commit: 17b5758bf35c7a113363cd7a350b7e6a251b80f4 apparmor: Initial support for compressed policies
date:   5 months ago
config: arm-randconfig-r2108-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126221434.SFIqjXah-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 17b5758bf35c ("apparmor: Initial support for compressed policies")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126221434.SFIqjXah-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> security/apparmor/policy_unpack.c:1814:2-8: WARNING: NULL check before some freeing functions is not needed.

vim +1814 security/apparmor/policy_unpack.c

  1715	
  1716	/**
  1717	 * aa_unpack - unpack packed binary profile(s) data loaded from user space
  1718	 * @udata: user data copied to kmem  (NOT NULL)
  1719	 * @lh: list to place unpacked profiles in a aa_repl_ws
  1720	 * @ns: Returns namespace profile is in if specified else NULL (NOT NULL)
  1721	 * @compressed_data: The userspace-provided compressed data. May be NULL
  1722	 * @compressed_size: If compressed_data is not NULL, the compressed data size
  1723	 *
  1724	 * Unpack user data and return refcounted allocated profile(s) stored in
  1725	 * @lh in order of discovery, with the list chain stored in base.list
  1726	 * or error
  1727	 *
  1728	 * Returns: profile(s) on @lh else error pointer if fails to unpack
  1729	 */
  1730	int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
  1731		      const char **ns, char *compressed_data, size_t compressed_size)
  1732	{
  1733		struct aa_load_ent *tmp, *ent;
  1734		struct aa_profile *profile = NULL;
  1735		char *ns_name = NULL;
  1736		int error = 0;
  1737		struct aa_ext e = {
  1738			.start = udata->data,
  1739			.end = udata->data + udata->size,
  1740			.pos = udata->data,
  1741		};
  1742	
  1743		*ns = NULL;
  1744		while (e.pos < e.end) {
  1745			void *start;
  1746			error = verify_header(&e, e.pos == e.start, ns);
  1747			if (error)
  1748				goto fail;
  1749	
  1750			start = e.pos;
  1751			profile = unpack_profile(&e, &ns_name);
  1752			if (IS_ERR(profile)) {
  1753				error = PTR_ERR(profile);
  1754				goto fail;
  1755			}
  1756	
  1757			error = verify_profile(profile);
  1758			if (error)
  1759				goto fail_profile;
  1760	
  1761			if (aa_g_hash_policy)
  1762				error = aa_calc_profile_hash(profile, e.version, start,
  1763							     e.pos - start);
  1764			if (error)
  1765				goto fail_profile;
  1766	
  1767			ent = aa_load_ent_alloc();
  1768			if (!ent) {
  1769				error = -ENOMEM;
  1770				goto fail_profile;
  1771			}
  1772	
  1773			ent->new = profile;
  1774			ent->ns_name = ns_name;
  1775			ns_name = NULL;
  1776			list_add_tail(&ent->list, lh);
  1777		}
  1778		udata->abi = e.version & K_ABI_MASK;
  1779		if (aa_g_hash_policy) {
  1780			udata->hash = aa_calc_hash(udata->data, udata->size);
  1781			if (IS_ERR(udata->hash)) {
  1782				error = PTR_ERR(udata->hash);
  1783				udata->hash = NULL;
  1784				goto fail;
  1785			}
  1786		}
  1787	
  1788		if (aa_g_export_binary) {
  1789			/* Do we have userspace-compressed data? */
  1790			if (compressed_data) {
  1791				kvfree(udata->data);
  1792				udata->data = compressed_data;
  1793				udata->compressed_size = compressed_size;
  1794				compressed_data = NULL; /* consumed */
  1795	
  1796			} else
  1797				error = compress_loaddata(udata);
  1798	
  1799			if (error)
  1800				goto fail;
  1801		} else if (compressed_data) {
  1802			kvfree(compressed_data);
  1803			compressed_data = NULL;
  1804		}
  1805	
  1806		return 0;
  1807	
  1808	fail_profile:
  1809		kfree(ns_name);
  1810		aa_put_profile(profile);
  1811	
  1812	fail:
  1813		if (compressed_data)
> 1814			kvfree(compressed_data);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
