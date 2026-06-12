Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF92379C4A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 00:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781308818; cv=none; b=LduuWT6ctw66Otw1LU8VM+JBQcjv+Kbj/PU0X5oCBoxCsbRinmnu1cTstxpnlgPXCK4eQmSwliHym95SpJDssWVLnj0jW2YHB7GPfgebRalkyXS0JNWh8ElgP47UTzAc283VIVuZkfsR80OJusvGXUYBY2NhXBN9JnonmJi3hQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781308818; c=relaxed/simple;
	bh=y+7RZirpY2ycZGndRWUsjJpfLXO3DfIZnzX4kCr0ns4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X6PQib1iSLWKbR4/FBB36cfWMzGDQ5w9/Eacu3P77RYsZvOKd/8AUmJ5GfMVWGYC+l4EdBFDh26mScpM6LBTxev2V11sjtnbdiGdWRaUz7IvkhK2lp1AAYPOE0hNUHMvRxJX5tItylpQvWJBd2yCEi1FyhG5vlC81Q3WBUO4vaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQdb1z6g; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQdb1z6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781308817; x=1812844817;
  h=date:from:to:cc:subject:message-id;
  bh=y+7RZirpY2ycZGndRWUsjJpfLXO3DfIZnzX4kCr0ns4=;
  b=JQdb1z6g0fBTa+GVBNptUGjX57plWnzk/5QnorZW8bCI1DOTEgyIfqpT
   9vh2P8S+EysJAX0FY79mli3ZBuTQTECFX4QSosvJKMt9j9Ut8zFbAUF+7
   N3uxI4Wun7yrjggaMRF0sbjC3P80ut1CGax+Rg+0QX60eTlysWlwNHzNa
   Z9wJnfGM6oULwqxYVkZAYfn6Xw7bhmKCR2erTBC7sEmbgTz8yXjGW7Sqt
   ipPxbgtyaUKluWC4vVErXEASCXhygwcA2btVmQwTzWIj2ts5jMqKJZ4B2
   TlZ6WXfo44fQByNkkZunOeCTTN3n9xjP3O7Y1isrlQn3R+DM+2/dJpTwW
   w==;
X-CSE-ConnectionGUID: 1T+mZd9iRPixI9+dhO1UKg==
X-CSE-MsgGUID: RmI1eTZoTMu9VSsgKltplw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93261291"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="93261291"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 17:00:16 -0700
X-CSE-ConnectionGUID: wOfw7rbjSF22qjB9sPZU2g==
X-CSE-MsgGUID: VV4/js8rQSOIHpcjjAmA/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="251886704"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 12 Jun 2026 17:00:14 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYBnH-000000004N3-2UXr;
	Sat, 13 Jun 2026 00:00:11 +0000
Date: Sat, 13 Jun 2026 01:59:20 +0200
From: kernel test robot <lkp@intel.com>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>,
 Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
 linux-doc@vger.kernel.org
Subject: [robh:for-next 42/47] htmldocs:
 Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2134: WARNING:
 Inline emphasis start-string without end-string. [docutils]
Message-ID: <202606130111.ldC96rqf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   030e2f5b9260c29ce85c21c004714742fa9f8d55
commit: f71f07bee9b56b94f7828cf3082ea19ec590de36 [42/47] of: Factor arguments passed to of_map_id() into a struct
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260613/202606130111.ldC96rqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130111.ldC96rqf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), struct mutex *mutex) __cond_acquires(true# mutex)
   ------------------------------------------------------------------------------------------------^
   Documentation/core-api/kref:328: ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
   --------------------------------------------------------------------------------------------^
>> Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2134: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2260: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
