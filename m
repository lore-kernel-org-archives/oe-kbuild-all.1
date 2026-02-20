Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B3B275B18
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 02:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771555140; cv=none; b=bwvc6qZXxa2uDoY5dKEiiJ6zBEbtbKdCSRr42tWj1Yx7y8WgqQUVQ5j7cmz3+7gEkfhaoECZ+luK+sq3YJvqRm0MQ0MXcv57vfos4SoZhTD7pfdDvqyM9RIzFFvbGc/mddU2PnrkMS8dq+sJPnrl5FeeEAwbL43biksTeS5Ej6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771555140; c=relaxed/simple;
	bh=TCnyP47D1GZGvr7HdXv4hqDkI3rX3/L/bIsY9PrDRD0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FbiF1DzdCYSf9flBij2u2ro7v5EpOpthiOzkl4mrvEvrxRmwsal71DnVMfOb2GcYqzfDi9F5dtOMZx50uEOGd5mOAlgh9+QlXjxgGsekswI9TUWWQIeMzz5+xy2LyaQ9am5T23mQo/OVuCFACPLeEFTvFhbHpHagInsP3csXwZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClayKxXW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClayKxXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771555139; x=1803091139;
  h=date:from:to:cc:subject:message-id;
  bh=TCnyP47D1GZGvr7HdXv4hqDkI3rX3/L/bIsY9PrDRD0=;
  b=ClayKxXW4rYWRlyXb7+LevPuR/Q5XFzEyC70Dg3nFWuvBDb1rUYOjlkG
   IEB45L71wnsXSKpsYp3EHWKKl1KDKYmg4vqlcAXc2hOlGX2Hx0ROTViLG
   aYEY/tn+Bm1rrRpkPmWDkigTUcVvysvRXsgHmt96IcBp3/1icj1bXlxFv
   hWdnd8PY4pZiSRzqmB9Y5sn3athT6guFrtRlO6lF09uAjcMTBJzKlRcVQ
   RDcO8KsZlbXppRGPeWqS8UXjXUHs4pJAwOVXNREtireJi7WAcLtcbexAB
   2p0JC8IqBbCvUwihDPpZmj8ihru2aAgnAT6yp9K8r4rnatBvrvpk2jDYy
   A==;
X-CSE-ConnectionGUID: SwekDVwDQQOTkmRHYJe8ag==
X-CSE-MsgGUID: jNVsDXJwT9CSn0xkXUeJbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72713465"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72713465"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 18:38:58 -0800
X-CSE-ConnectionGUID: 5LPIC+F9Sx+F2zAxsJK/iw==
X-CSE-MsgGUID: aO97d9W8Qi65SLiHSSh84w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="212892909"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2026 18:38:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtGPu-000000013lE-3jnp;
	Fri, 20 Feb 2026 02:38:54 +0000
Date: Fri, 20 Feb 2026 10:38:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 9/18] <stdin>:1633:2: warning: #warning
 syscall rootns_kill not implemented
Message-ID: <202602201003.17jZazOH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   bbfe3fc31c861befc0d2aa15a02e672b2e248cd6
commit: 57ebf30b62f5b37783c8a398d65b499db3ace7ca [9/18] rootns: Implement rootns_kill()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602201003.17jZazOH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201003.17jZazOH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201003.17jZazOH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1627:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
   <stdin>:1630:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]
>> <stdin>:1633:2: warning: #warning syscall rootns_kill not implemented [-Wcpp]
--
   <stdin>:1627:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
   <stdin>:1630:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]
>> <stdin>:1633:2: warning: #warning syscall rootns_kill not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
