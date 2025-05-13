Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E911C28E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 03:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747107724; cv=none; b=ZdHzZQXen6nqQDgnhHSslIG3XYGkDhzK2UoAAPF7sQpB336Wrr7vM+1pP8u75H1ar5B0sYkfOlmcDLqcSeapj7nP7dT1VhxzXbvgWEDito6Px+aiWt3S6amR1Rf5XmPwwP7CgwIfgp9WVgl3cLKYa3RxlnHrld/Ze1ZI7raSSoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747107724; c=relaxed/simple;
	bh=jygot/8UJK/b18dMHl1cNkgL9ipeKSbNwLmF/2nAL1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P1dX6g/U/IbQrKvgW70xV9tWGJSgzvkHp3iq9Vcr2G1jYhrwm1aCu5qHWlpQY4tRNYpQKxfoFln75MEWXTmsF+Hdhtjr4GeodZ3yvT1rzZvSS1prfnyEOnVSTIQc4D8Iixrd9WyfAOCT/RO+J6K2Ai6p/tKfgVSUVFtLQ/cHBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U67fYTLA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U67fYTLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747107722; x=1778643722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jygot/8UJK/b18dMHl1cNkgL9ipeKSbNwLmF/2nAL1g=;
  b=U67fYTLAk/ymjSTCHb22ulJM4QFT5kEuGfHKdXyftOpZ+y5hQ9N2UyEv
   PQnLTsG3ZkaJUEckXZDyZxXJMZ9x+yefDOuWabXwzDWBXAm5rBRX6HuHN
   2zGzg5TXpy92n9Cdxz6zm4corn05ei0Y4Moga5KX23WNZD6/kKXSCkeLg
   9KsUT6GTq/4AbPEb5FFlm+s9JUFNbB/rLCST/nH0xcxUE50KVPnj0XUAB
   48o1sllxy06duZF1niO2xwuw+IGnTcvN0J3VUgNZ7i3IWp4sPbrAHLzw4
   AjhQlS4+nKVstoaKm46hERpyBPiswevme/foAqLc7SfExUz0bURSAeWFr
   A==;
X-CSE-ConnectionGUID: CrK77F3ZSzmRDdF54BSGZA==
X-CSE-MsgGUID: w/1fIfqaR6+75WunpicJHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49054430"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="49054430"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 20:42:01 -0700
X-CSE-ConnectionGUID: 04R69l9CSyOc8Kx1DMsgaQ==
X-CSE-MsgGUID: NQ153BJDTHWSda0pPTzabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="137415794"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 May 2025 20:42:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEgWk-000Fcl-0L;
	Tue, 13 May 2025 03:41:58 +0000
Date: Tue, 13 May 2025 11:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 187/194] mm/shrinker.c:834: warning:
 Function parameter or struct member 'out' not described in
 'shrinkers_to_text'
Message-ID: <202505131133.cevdwGyc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   a26f34c344d8314acf0c28e20166a4a090dbd298
commit: 78e5e613459733c8cc38dfcccb1e8133ddfbbc63 [187/194] mm: shrinker: Add a .to_text() method for shrinkers
config: arm-randconfig-002-20250513 (https://download.01.org/0day-ci/archive/20250513/202505131133.cevdwGyc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131133.cevdwGyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131133.cevdwGyc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:834: warning: Function parameter or struct member 'out' not described in 'shrinkers_to_text'


vim +834 mm/shrinker.c

   826	
   827	/**
   828	 * shrinkers_to_text - Report on shrinkers with highest usage
   829	 *
   830	 * This reports on the top 10 shrinkers, by object counts, in sorted order:
   831	 * intended to be used for OOM reporting.
   832	 */
   833	void shrinkers_to_text(struct seq_buf *out)
 > 834	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
