Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2C03FC9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 00:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771635480; cv=none; b=PPnImp6GKXkdtY6cEpdDNdabyk/M3V7stXSzKMca+UxdTxll3ZRV+nxva1aTR+/TacIieCBp6VpcRK0xdqmOjsoMMvY6zbCmM1WSamZMxAfBnXEz1JFVMt33kuxvQijRMIaKTyKOja3CbZC2YHLwSrqsVCh1GnZLUeRwu9oghbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771635480; c=relaxed/simple;
	bh=YOkzz3fKgvlA+XBNN4csBWnlVO4Qf5PP1rnESkNng4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MUzVRdQpbXQ79OyOq/OtM1Iwmra9lPBHy4uJMlSbBXxV7g3HTXKQinZFPcVQzegutkXovKwn8LPKNqKxS9wAYwuofEZXxMGMQEkziEakrjfAPt0J7NxCsIHPKs5lu7rthoiqZfsEz9/qVTSVHK1oH64UrP9UjeoFxDpuldE0pOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtY5RVud; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtY5RVud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771635478; x=1803171478;
  h=date:from:to:cc:subject:message-id;
  bh=YOkzz3fKgvlA+XBNN4csBWnlVO4Qf5PP1rnESkNng4o=;
  b=KtY5RVudBerlQ45XSHjg1lNE8XakSKNo2qKH6F3rLSCmUwbnuxcZLgsN
   sJ09jNaqsIY/xz/GKtPQcLGdKZUkxirlpBos+mXpZFhWTpCmd0cvZdKS9
   0fROsgJTSXNeJ8S4NxTGwax1qwSEDFYd018RLN9VNJMb57JNq9PNj53nE
   oQjyOkRpoZcIVWaQw+YUqZpn+pRHq7j/4k917ireKKRVcox0HLDkPpnXN
   QPl+kqT0AttscoilDKSWX3wj5/+UtdKAk9hS0gjZgJxN81/TBM8CptyK0
   scgvAiE6BlxXrPSvovjSPdGsYR5hlkt3VGWcNYtKSiM2xT0COzyWO6MAr
   Q==;
X-CSE-ConnectionGUID: NMs0NDs8RzGEkt+8D48h1g==
X-CSE-MsgGUID: gyGiSwsLThWCzo3ZMFNYbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72792784"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72792784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 16:57:57 -0800
X-CSE-ConnectionGUID: Ix1U+gkESkyQBZ/W6oKUoQ==
X-CSE-MsgGUID: K9LowVLkTwipYdF2VXLb0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219509518"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 20 Feb 2026 16:57:56 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtbJh-000000004Jp-2wL8;
	Sat, 21 Feb 2026 00:57:53 +0000
Date: Sat, 21 Feb 2026 01:57:07 +0100
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 14/14] fs/nfsd/export.c:385:17:
 error: 'ret' undeclared; did you mean 'net'?
Message-ID: <202602210140.a9ftAf64-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   abe0e15ab9e913e4fb8b26466f8a2a4089ceba44
commit: abe0e15ab9e913e4fb8b26466f8a2a4089ceba44 [14/14] nfsd: implement nfsd_nl_svc_export_get_reqs_dumpit()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260221/202602210140.a9ftAf64-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210140.a9ftAf64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210140.a9ftAf64-lkp@intel.com/

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
