Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750519259E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889580; cv=none; b=ShJYrB8lrTE+0Kt2ef42b+6M6c+IPF5MH6C0D9FdnFqU/qPoqg7HKV7HHdXn7DsV0jZUbQLbylcklSHcUVaFJnH2C2h5SafUmzowdpiQgKCJus8HGjeXZdtlDqq/SdoVKhf/X1bwFCW2uL59xg3K0SMpH3t+HhbHSAyb60H93gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889580; c=relaxed/simple;
	bh=0xFaHgwKQ0g9Fqkn9iwF8D/KSZqspbiiZztW1zGtUyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FFnk+SmRa4shoqS+N7WuwDWr1uEoREnwUiNC2Z94SJN8T4BW+7Au2QbK/Rb1rZ4IYyzC0cswg+snpUM8QLT0+QqMpGg1qbcGjFEbQC3L3q6qRW/fUgQYfv2EwSs4BdyyxAxrRuwyWUJhDInrXCoY9cl1Lh0RqM6Tj1DnogNt4WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oaw5qGSh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oaw5qGSh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889579; x=1777425579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0xFaHgwKQ0g9Fqkn9iwF8D/KSZqspbiiZztW1zGtUyg=;
  b=Oaw5qGShivH2S7+HsM4c3PFu5aqHR1LuOZPBis/2OhHWxH8BGS6ycbX6
   47SG651n7xV44Y6daukL/PfXT7OIrmmMihcBCM1V9sirEOjPy5eMu9Y28
   7FUZY8cgxsnAUWLA863DGm5wuKb3r8vYoASYAez4JPPbh3Wyu6riofyqS
   KvQ8IW8LfLV1XGK9oCwUgRNVjoOVsqcej3b2TCUgCNcewvaynHInptcGh
   S8kZjH0WPI4ln7mUhGDoRc6+NaiarTyIjKMU5BoF70KpB+YRFE+aAfsJw
   ce0AVdunSQDFpiEill11RNpvN/9OD5nb/hH92s/aeIOZk3gSuuspobTTy
   A==;
X-CSE-ConnectionGUID: 9aiRpSLPS8Co6kUy+/DPkg==
X-CSE-MsgGUID: LRj+MwvOT766h9IYfkjn7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="50154544"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="50154544"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:35 -0700
X-CSE-ConnectionGUID: 09BRaAY0TuabKCOsz9f0EA==
X-CSE-MsgGUID: YduVPjqqT/axhyP7lgquUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133561615"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2025 18:19:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdE-0000Ef-13;
	Tue, 29 Apr 2025 01:19:32 +0000
Date: Tue, 29 Apr 2025 07:05:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2175/2175]
 crypto/asymmetric_keys/pgp_library.c:189: warning: Function parameter or
 member 'data' not described in 'pgp_parse_packets'
Message-ID: <202504290703.q8lvsdB3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   85cae3bfc6f56b1f497d5521a0caa9b8c299ac01
commit: b78af6579e15dcdff86504da90af77f3e890270e [2175/2175] PGPLIB: Basic packet parser
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250429/202504290703.q8lvsdB3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290703.q8lvsdB3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290703.q8lvsdB3-lkp@intel.com/

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
