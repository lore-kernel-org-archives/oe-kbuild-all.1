Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A0D3876A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785998454; cv=none; b=ORuE7JMC6Q5OaO5nZyTYrrEurWoUXC8tz+SvoKzeg9mBwhWgbsxM9p4pawftxv18ZX0hcB4x/4eZ5t0R5rD59AOaxZRqXG2ZOIo3mEHJ6jiPltU+qQHqvcXCgMAjH5Rj0izfs1KcmT2EBZ7VUxRWSUaCETVUSO0qCnT64WW/6A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785998454; c=relaxed/simple;
	bh=qkCjj7mcpP4Y2TsgfPXcPDc16KzQezmK5eHCBiVfnFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLRpxpz5EUdizoXbAIYfIDYDlPmWeva5DR8MYb19KI5p7Y5rQZYV2YsTcAlRnkN+RdMYUbr0rIIfS96GHZoqh2lVGyXclUv4+I74hPaitughJILJFpm03sU69HVmlMTGP0j2G2rP6d8ygtWyyrdG8fKslZcF6nBS9gfTIy81KEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d41AA7jv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d41AA7jv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785998452; x=1817534452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qkCjj7mcpP4Y2TsgfPXcPDc16KzQezmK5eHCBiVfnFM=;
  b=d41AA7jv4A5BwKCwlKWpN5spOEQjLspqMnbYMY266atWDFsSXR1lCPfZ
   QgfeXrlVSri7BlwKsZf6K3e/tXT+FahcYS3QdD9jIP2OGmVZZqWTLy+K6
   ZRSa0F2uBv4kzM/6mkKkBH87Csjpgv8H/Zc5bCfDrnbjAdV8+Ix8Zlnse
   f2xODqLPsMOqJVvwUHr2yaEalsRb3SK0fViv8QDfBw1KiEZgQ8q7vF+4y
   9+C8c1G+XdZRJi59LVoYbsLa4pegY36YEvG1p/HQjpMb2Fttw1w6Y99by
   4/yrUXVmJ3NVdE7wVr9H2jfqjlx4UUk61oggWKgupCVTdUczZ47Lc5+rE
   w==;
X-CSE-ConnectionGUID: dcIsyGZ+Snyo0QnNSd2Mwg==
X-CSE-MsgGUID: xXEgTOs5RRKzDYrCvfJTYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97179599"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97179599"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 23:40:51 -0700
X-CSE-ConnectionGUID: HwfjBCH3QLanPtnA/dfFPw==
X-CSE-MsgGUID: gd9oRsngQamDsW/lWktNlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="265496883"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Aug 2026 23:40:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrrma-00000000EQn-11Qn;
	Thu, 06 Aug 2026 06:40:48 +0000
Date: Thu, 6 Aug 2026 14:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Tigran Mkrtchyan <tigran.mkrtchyan@desy.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] nfs4: inject process namespace into COMPOUND tag
Message-ID: <202608061449.3hOd5Rkm-lkp@intel.com>
References: <20260626151029.1516839-1-tigran.mkrtchyan@desy.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626151029.1516839-1-tigran.mkrtchyan@desy.de>

Hi Tigran,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v7.2-rc6 next-20260805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tigran-Mkrtchyan/nfs4-inject-process-namespace-into-COMPOUND-tag/20260806-105541
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20260626151029.1516839-1-tigran.mkrtchyan%40desy.de
patch subject: [PATCH] [RFC] nfs4: inject process namespace into COMPOUND tag
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260806/202608061449.3hOd5Rkm-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061449.3hOd5Rkm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061449.3hOd5Rkm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/nfs/nfs4xdr.c: In function 'encode_compound_hdr':
>> fs/nfs/nfs4xdr.c:1039:21: error: 'taks' undeclared (first use in this function); did you mean 'task'?
    1039 |                 if (taks->tk_ns_inum != 0) {
         |                     ^~~~
         |                     task
   fs/nfs/nfs4xdr.c:1039:21: note: each undeclared identifier is reported only once for each function it appears in
>> fs/nfs/nfs4xdr.c:1037:34: warning: unused variable 'task' [-Wunused-variable]
    1037 |                 struct rpc_task *task = req->rq_task;
         |                                  ^~~~


vim +1039 fs/nfs/nfs4xdr.c

  1027	
  1028	static void encode_compound_hdr(struct xdr_stream *xdr,
  1029					struct rpc_rqst *req,
  1030					struct compound_hdr *hdr)
  1031	{
  1032		__be32 *p;
  1033	
  1034		/* Inject namespace info into compound tag if not already set */
  1035		if (hdr->taglen == 0 && req->rq_task != NULL) {
  1036			/* Use namespace info captured at task creation time */
> 1037			struct rpc_task *task = req->rq_task;
  1038	
> 1039			if (taks->tk_ns_inum != 0) {
  1040				char ns_tag[NFS4_MAXTAGLEN + 1];
  1041	
  1042				hdr->taglen = snprintf(ns_tag, sizeof(ns_tag), "ns:%u", taks->tk_ns_inum);
  1043				if (hdr->taglen > NFS4_MAXTAGLEN) {
  1044					hdr->taglen = NFS4_MAXTAGLEN;
  1045					ns_tag[NFS4_MAXTAGLEN] = '\0';
  1046				}
  1047				hdr->tag = ns_tag;
  1048			}
  1049		}
  1050	
  1051		/* initialize running count of expected bytes in reply.
  1052		 * NOTE: the replied tag SHOULD be the same is the one sent,
  1053		 * but this is not required as a MUST for the server to do so. */
  1054		hdr->replen = 3 + hdr->taglen;
  1055	
  1056		WARN_ON_ONCE(hdr->taglen > NFS4_MAXTAGLEN);
  1057		encode_string(xdr, hdr->taglen, hdr->tag);
  1058		p = reserve_space(xdr, 8);
  1059		*p++ = cpu_to_be32(hdr->minorversion);
  1060		hdr->nops_p = p;
  1061		*p = cpu_to_be32(hdr->nops);
  1062	}
  1063	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
