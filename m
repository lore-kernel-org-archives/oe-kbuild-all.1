Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C375695
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754650020; cv=none; b=s3i0CTlfiYxdez+NPEv2XAeBymfnqfbPIfIe93qHQyHNIBh77XqWg9x57A7N1Uh5LxEPUN5bGQpb89Ekkcy98iKQTKt+hJ8Irxyefb1N7xmngfmbzkL3fgAJD2vH1V4RwPNg3wqiThp5lj5DFiCLRx6C9YFQBgFX+KETdAz/6dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754650020; c=relaxed/simple;
	bh=hpOxHXlkM70IrY3Jy2JtJVHFcKRsGFaiKYWhUV9dIRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fgUQljgC0sYiFfry9tfv+NwXnJ09sNI0qjrWyyM7OiDvEeL8eZde8VbcNWpp7AcfBlxOxAKRaVr8CWZJODPi0iZG6oSqPKf11cy8t6y4uLkNVGXggDXhvhb8heaCBoGGg88K/ObgP4zhbZIJQyTWu2uafH4nvkRrl7/KiLV/90w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiMASrFK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiMASrFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754650018; x=1786186018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hpOxHXlkM70IrY3Jy2JtJVHFcKRsGFaiKYWhUV9dIRQ=;
  b=UiMASrFKR8tYF6w/WyFRlIhV0pRO5Bq94oh/PEy0mkJW7QXJXpUb+F1Z
   6VkMYNZJw/2KZ3GVpIaVcRZOCOEz+m9K4jgsybGFxYGHPJCBGhUpzJCMY
   fNv4a/tWXQEy14myBbdNDeZgt41cnA+U1bf1v+ptlBge5laWDXypSKP0F
   ksmrjSJn7WcJqIuP3puXYvj91wp3ZBFRl+CjZNkvFDlW6/cscj8DdlH+V
   UvhNGPHrxXaqb6m3M+dnnAp9FrvoH7wm8OFb9kTb2g8gJ8UunKoczoNju
   MXOqr8unrfN301Iaq8b2JtP8LmI3Hv8RgDsw8Z6STLbxlG6oGe1piKicB
   g==;
X-CSE-ConnectionGUID: mWw+p9txQAmjUrsnOnaz8Q==
X-CSE-MsgGUID: iTmjvvb+TU+SWfoTRIYAmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68452990"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68452990"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 03:46:57 -0700
X-CSE-ConnectionGUID: b0KfOYNjT/m6XZoh7VreEw==
X-CSE-MsgGUID: k/4HtU/UTz2aq9mFtbvmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169511166"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 08 Aug 2025 03:46:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukKcP-0003ra-21;
	Fri, 08 Aug 2025 10:46:43 +0000
Date: Fri, 8 Aug 2025 18:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2662/2662]
 crypto/asymmetric_keys/pgp_library.c:189: warning: Function parameter or
 member 'data' not described in 'pgp_parse_packets'
Message-ID: <202508081825.fqBn1XgA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9f11838de785067991187f7d0aa9b340abfba381
commit: b78af6579e15dcdff86504da90af77f3e890270e [2662/2662] PGPLIB: Basic packet parser
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250808/202508081825.fqBn1XgA-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081825.fqBn1XgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508081825.fqBn1XgA-lkp@intel.com/

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
