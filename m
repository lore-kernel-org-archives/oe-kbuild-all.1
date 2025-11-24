Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CA51E572F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764024047; cv=none; b=rOlC3EKwX76UA5Z7WCaXd3wOeTOiZUn+KzBsMrAfLB6ja1LeFoxL+e12Gl5oXUPOsOqXoJ2IYiS1Kb21/fqu7oJ+oDw4rmJxdWo5l5bNpZPt2kTVFagHI4zvbq2GruFAMb7z2iaLVvIwU/fdsMu9Doq4HKqLB5+h4D+3nuINYf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764024047; c=relaxed/simple;
	bh=CxiCEfsEEDX8NlxzDLR7n0nuL+Qib+m0Y6Uc36OuuGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNKWZw8OPQQ5L8081/BZuRwYtV9WtfBuoWjXFHXo47YC1HETxL4hmYAe4//fp7Tp7FVeDJplULbEv0s1B1dPUOhDwiUpdcy6un1Q4IvcHHqhZ7mMaKYJmoTrvNkZj6pYFo6j3zGEOn4tZNi0EAipMU8wwMs0pzCWI6GupAed0ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lY9cLqhu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lY9cLqhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764024046; x=1795560046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CxiCEfsEEDX8NlxzDLR7n0nuL+Qib+m0Y6Uc36OuuGw=;
  b=lY9cLqhuciXs12mMAZvDZVQaaOeHEB10BFAO0/7SkWwSHzoJibXj+u5m
   gWJJ6kVYLqropFkWpN9i5UL3taUeRCJS5IIS79HBWZiQiFra182pJl57O
   xhpZ3DGv3yULGE1KBOBdW5b98FGc4xsdwwRBsR5VO5JahcNdhAHaAqa1q
   mprgOLLGQEJ64z/FsgOhP5A1QM61Likhomxh27zPhDYnWaI5rrOsjcuJs
   xoHERLQEC4gQXFzqm8HhL790QITuj9fleCk+oLuFfZIdCWhHGRV5MDUpO
   vZhehlpXa7bpQPkXFFmZlEoJ8hQpvkYVHypByTaoo80m4K4+yeUxiGLuv
   Q==;
X-CSE-ConnectionGUID: agcJMuo6TfaWyOWO29zbeQ==
X-CSE-MsgGUID: FfTZS+3+QqaylFTlVo78QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77509454"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="77509454"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 14:40:45 -0800
X-CSE-ConnectionGUID: IgB9cQ5jTY+LbaSp780sRA==
X-CSE-MsgGUID: Ql+IPb/gTpa0Qr2No/3Aow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192916832"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Nov 2025 14:40:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNfEg-000000001BL-0rWE;
	Mon, 24 Nov 2025 22:40:42 +0000
Date: Tue, 25 Nov 2025 06:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3316/3316]
 crypto/asymmetric_keys/pgp_library.c:189: warning: Function parameter or
 member 'data' not described in 'pgp_parse_packets'
Message-ID: <202511250630.aTlUN4lt-lkp@intel.com>
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
head:   041fb9446ce5643d6c19a4b5bcbb3068054a42fd
commit: b78af6579e15dcdff86504da90af77f3e890270e [3316/3316] PGPLIB: Basic packet parser
config: x86_64-buildonly-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251125/202511250630.aTlUN4lt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250630.aTlUN4lt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250630.aTlUN4lt-lkp@intel.com/

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
