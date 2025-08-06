Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD5528FABC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 15:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754492829; cv=none; b=EIXkGtGiDXqlGhWc4XU7FzVLRFBOeZphZzuYkgZjrDv5ZVmkxunWO7fPlsQE7BijhaKsNoRnKFH7Byq+oZrihJzPon5XoX2rX+odsc1DeG+5Zr8ojOkmRi9RHgaVA4VJvy2q17X+M/mi8McS7VuHDjbZrtObjqLSTEymg4utD5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754492829; c=relaxed/simple;
	bh=nutjFReopkSI71nnEce01nT3jxKuZw56oNPD1MJocgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V7Zmcp+vc1w3TnNoWI7t3XKU0vBnK0hSDAUQo7IcXERd1YhXl/xZ9a611qfW+NJ3A4BkisMvnGbtANWrK3vhZIv6D56s34Dz2Q1rRXnv/nZiNgosNe95ndSQIrCV8VqPyVSKeX0fTZeOL+gKxFW5wK6ZhdIHNrWwPeCPF79BnBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsRH13go; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsRH13go"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754492827; x=1786028827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nutjFReopkSI71nnEce01nT3jxKuZw56oNPD1MJocgM=;
  b=KsRH13goUb0iGdIeNA0LqljJADesPtiJXAfSl8wSdZgbC2591QXPNEfU
   JXdD0NeeGOqNqDOr3PVrA87+VgXyR0Q1fz5X9vkfwj9kF9yzKB7faaQMX
   x7Q+Ck9wb6dhRmImeaVnCkQanzIHT6Wc4iD8qMlzjdBajS7v1GNYCEutd
   rTlWqwGo3UTNcTEQz9Up7Qh+w5FHOgm3m6Yooj28rqCOd/Wd0PlwI6isF
   hIaD34nu3P/5ROh0yxVmL54rYdeBsSW1ZjIuxGf+C62/0WEDO0BygaQza
   gLNEanNLR7UXxXK0JfehSU6E4hnhRDrPskoc+5+iszDMzb+PuhBCF+FzA
   Q==;
X-CSE-ConnectionGUID: MkXMwcwtTUWgz8CEafhhbA==
X-CSE-MsgGUID: eBczdM5ETe2Ran8SLOotiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56680445"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56680445"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 08:07:07 -0700
X-CSE-ConnectionGUID: mEMgFFh7S6q8/PuvyLzR5A==
X-CSE-MsgGUID: TpBnf4TOT+6BS+8J6iP/2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="169041147"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 06 Aug 2025 08:07:05 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujfjL-0002DT-0E;
	Wed, 06 Aug 2025 15:07:03 +0000
Date: Wed, 6 Aug 2025 17:06:59 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2658/2658]
 crypto/asymmetric_keys/pgp_library.c:189: warning: Function parameter or
 member 'data' not described in 'pgp_parse_packets'
Message-ID: <202508061744.hiwFyKYj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8551213150db5f8eebd27273dae93f6fe258d63a
commit: b78af6579e15dcdff86504da90af77f3e890270e [2658/2658] PGPLIB: Basic packet parser
config: loongarch-randconfig-2005-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061744.hiwFyKYj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061744.hiwFyKYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061744.hiwFyKYj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/asymmetric_keys/pgp_library.c:189: warning: Function parameter or member 'data' not described in 'pgp_parse_packets'
>> crypto/asymmetric_keys/pgp_library.c:189: warning: Function parameter or member 'datalen' not described in 'pgp_parse_packets'
>> crypto/asymmetric_keys/pgp_library.c:189: warning: Excess function parameter '_data' description in 'pgp_parse_packets'
>> crypto/asymmetric_keys/pgp_library.c:189: warning: Excess function parameter '_datalen' description in 'pgp_parse_packets'


vim +189 crypto/asymmetric_keys/pgp_library.c

   178	
   179	/**
   180	 * pgp_parse_packets - Parse a set of PGP packets
   181	 * @_data: Data to be parsed (updated)
   182	 * @_datalen: Amount of data (updated)
   183	 * @ctx: Parsing context
   184	 *
   185	 * Parse a set of PGP packets [RFC 4880: 4].
   186	 */
   187	int pgp_parse_packets(const u8 *data, size_t datalen,
   188			      struct pgp_parse_context *ctx)
 > 189	{
   190		enum pgp_packet_tag type;
   191		ssize_t pktlen;
   192		u8 headerlen;
   193		int ret;
   194	
   195		while (datalen > 2) {
   196			pktlen = pgp_parse_packet_header(&data, &datalen, &type,
   197							 &headerlen);
   198			if (pktlen < 0)
   199				return pktlen;
   200	
   201			if ((ctx->types_of_interest >> type) & 1) {
   202				ret = ctx->process_packet(ctx, type, headerlen,
   203							  data, pktlen);
   204				if (ret < 0)
   205					return ret;
   206			}
   207			data += pktlen;
   208			datalen -= pktlen;
   209		}
   210	
   211		if (datalen != 0) {
   212			pr_debug("Excess octets in packet stream\n");
   213			return -EBADMSG;
   214		}
   215	
   216		return 0;
   217	}
   218	EXPORT_SYMBOL_GPL(pgp_parse_packets);
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
