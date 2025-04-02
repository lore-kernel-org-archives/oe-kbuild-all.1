Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988BF1853
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 01:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743558780; cv=none; b=hF3Ea8YGh8UvtO9H2joiGE3al+VXV69iTGSr8pWoMhH9+V1dfGKycUXqBYJciaB1DiqIC9eT2ULqp8bqlNFfmhwLL0PrC11mlk1zOKySVCVC8Lfs1ITjzcndJS6DpDh8zXQ1ZFXopOyr3YGTAo7YpvaV3oButcwbMm8mPZXsS0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743558780; c=relaxed/simple;
	bh=1CLP1Tv/pmtryaeFHoE1xZVwinNuMoeV/dEPY5a++4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IRNqzpXSQkrDdlNbtvE9669ppxN/uVqdxlC4gGI2umwjeWKTSDmqWQ++w+TQtMqzUIXRcwAf8iNEg+zKRxRrbRkJ1B7q7HcBwXKWOATpp/HRp62JJrwBE/LstDnnOERNh+aj2bt2tmMHIB1gM91T9ZaSdFFFrxxK+HJjFLjzxwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQEuOYDk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQEuOYDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743558778; x=1775094778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1CLP1Tv/pmtryaeFHoE1xZVwinNuMoeV/dEPY5a++4g=;
  b=PQEuOYDk53g45BZUj9EQKzdVibHvyWEtMnl/JWY4h5NytxkabbedkVAg
   JWmB624nBhE4bImL/WkDJ+FQTP9qHKhxiCbYqEhl5jda90D5Q9f3/CWYr
   gxLREaiBRcInzV7pVz4dtJC0C2knuUgtNclAY/6xbyogUCeog329mbs14
   WuK2rkvlfHLh9KiGiYfo2L8/2TWwSR+UzTK7Nf1WXVDl2j1MsGSzZeIK2
   v3VkDIbXInS8loxNrtLrRUEO0+BJ0ObfSqTPkOHwuMYxzMr+HDwF3foNW
   WbqpE/bCrlMZzAiUlaUFhUhQR1E5QN0DNOA/O7Yheo7M6tfFTbGtKnY9E
   Q==;
X-CSE-ConnectionGUID: MwoDWVIeRnW2qJa+wOsJRA==
X-CSE-MsgGUID: ySGmXBZgQQOEuZorPwMr/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44797038"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="44797038"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 18:52:58 -0700
X-CSE-ConnectionGUID: N5ktuU3vS1eTBZhgp40pNg==
X-CSE-MsgGUID: Wrvhti0FQNWKkDB96JZYIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="131540959"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Apr 2025 18:52:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tznHj-000AKU-0C;
	Wed, 02 Apr 2025 01:52:55 +0000
Date: Wed, 2 Apr 2025 09:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:keys-graveyard 16/16] security/keys/proc.c:118:38:
 error: use of undeclared identifier 'irqflags'
Message-ID: <202504020906.o1LOt41s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git keys-graveyard
head:   13c6debc9b86b8bec9747d10085092d3149dce3b
commit: 13c6debc9b86b8bec9747d10085092d3149dce3b [16/16] KEYS: Add a list for unreferenced keys
config: hexagon-randconfig-002-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020906.o1LOt41s-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020906.o1LOt41s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020906.o1LOt41s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/keys/proc.c:118:38: error: use of undeclared identifier 'irqflags'
     118 |         spin_lock_irqsave(&key_serial_lock, irqflags);
         |                                             ^
>> security/keys/proc.c:118:38: error: use of undeclared identifier 'irqflags'
   security/keys/proc.c:150:43: error: use of undeclared identifier 'irqflags'
     150 |         spin_unlock_irqrestore(&key_serial_lock, irqflags);
         |                                                  ^
   3 errors generated.


vim +/irqflags +118 security/keys/proc.c

   111	
   112	static void *proc_keys_start(struct seq_file *p, loff_t *_pos)
   113		__acquires(key_serial_lock)
   114	{
   115		key_serial_t pos = *_pos;
   116		struct key *key;
   117	
 > 118		spin_lock_irqsave(&key_serial_lock, irqflags);
   119	
   120		if (*_pos > INT_MAX)
   121			return NULL;
   122		key = find_ge_key(p, pos);
   123		if (!key)
   124			return NULL;
   125		*_pos = key->serial;
   126		return &key->serial_node;
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
