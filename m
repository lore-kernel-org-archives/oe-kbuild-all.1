Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44EDBA45
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 00:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771632099; cv=none; b=n04NHWSBVgUIYfxb+iV78oP862+bL/QHK5EVkjF6r7JkO5oi6JWTzPYMzNShMw5CmOT+JiOKRnLJqKkjD8j5cOdH7eMXfYIKFD4x9lAyuNnJMYSKmsRrWaYcBadvRKEpbNDdIkib7bQvRrW9U6NiC08ryGY83HyZFEhqbP3I+Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771632099; c=relaxed/simple;
	bh=dzC5hxwSLtvFOhPGC2Aj//2dRD6bpwOTGeskvCi4RYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f1DGqM+J7wtFXNZZqs7ZQcaB3Nmp2QWtMjFXRs9JMUFBXEi1fCc7HKTVKS0lClZ6iG46SrnswCzQA5inAxl0EYq38/dlIMpY/cQP/+21CWBCS/LD9cByWCyQ9SpBp0xi4YSIITdGW4lb/X9cILm93dtrE55665cVqMGsXy1U9+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPp9yC5L; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPp9yC5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771632097; x=1803168097;
  h=date:from:to:cc:subject:message-id;
  bh=dzC5hxwSLtvFOhPGC2Aj//2dRD6bpwOTGeskvCi4RYE=;
  b=nPp9yC5L9D5Twa9MC8JF18O/tDsYG3dBJQOK/7n1yjFbcFjX5hDNjHbA
   SAjp0goSnSVhJRIVUtnmKOsxzeNJAnTR3ceSlcVBM4os8lBenNSHUCOkB
   48C1eywTVsLIfuMcg5nLgnCfYFpNtYT+HOBE0IffDJQAxlS8KrMdzFXX/
   tfaqGQ5y0R/j+zP08v8vxfCYv23p4brDma+xOt2PLT6I9sz+MMmzCtoi5
   BfpZC1x7w0zVTpHdGfK99ll5mfbCQzM0CkgPYPEwhc+G+clt6JoXjmYpN
   i9ptZdcglFwakFEcJxsB6IdjQp6h3RVykALwRaUwzu6l1F9kQZtZVYt9q
   w==;
X-CSE-ConnectionGUID: wkel5GgiQAGChbaSPZHMmg==
X-CSE-MsgGUID: D+vneu6aRZGcHNtoIBZ4wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90311697"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="90311697"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 16:01:36 -0800
X-CSE-ConnectionGUID: 0FTsDUzlQa+Hr89Lcb7S2g==
X-CSE-MsgGUID: JBS6zsBeTHiFhmhC7lWRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="214095782"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Feb 2026 16:01:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtaRA-000000014ZY-38aB;
	Sat, 21 Feb 2026 00:01:32 +0000
Date: Sat, 21 Feb 2026 08:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 14/14] fs/nfsd/export.c:385:17:
 error: 'ret' undeclared; did you mean 'net'?
Message-ID: <202602210711.sMv9AxlS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   abe0e15ab9e913e4fb8b26466f8a2a4089ceba44
commit: abe0e15ab9e913e4fb8b26466f8a2a4089ceba44 [14/14] nfsd: implement nfsd_nl_svc_export_get_reqs_dumpit()
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20260221/202602210711.sMv9AxlS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210711.sMv9AxlS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210711.sMv9AxlS-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/export.c: In function 'nfsd_nl_svc_export_get_reqs_dumpit':
>> fs/nfsd/export.c:385:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     385 |                 ret = -ENODEV;
         |                 ^~~
         |                 net
   fs/nfsd/export.c:385:17: note: each undeclared identifier is reported only once for each function it appears in
>> fs/nfsd/export.c:386:17: error: label 'out_unlock' used but not defined
     386 |                 goto out_unlock;
         |                 ^~~~


vim +385 fs/nfsd/export.c

   378	
   379	int nfsd_nl_svc_export_get_reqs_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
   380	{
   381		struct nfsd_net *nn;
   382	
   383		nn = net_generic(sock_net(skb->sk), nfsd_net_id);
   384		if (!nn->nfsd_serv) {
 > 385			ret = -ENODEV;
 > 386			goto out_unlock;
   387		}
   388	
   389		return 0;
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
