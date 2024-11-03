Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF0613AD1C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730622802; cv=none; b=jhqB1oZ+bRusjuvZe4zdcH/IlHKjgtiKbbKjvj80SHl9weBDP/BTCbZDYxadQ01tEsZUN+h4d0wRBmtyB8XfLHmVvXJTMDzEf5PiWhRPkdaQGgs1Du7GZyVmCnUK8oDo8pVit7N0Os2FH96AnCLlXYkiB8M39MzJ7gbBjSy3leI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730622802; c=relaxed/simple;
	bh=REbRLl9G2lmdOypXq8T260G3nV9xxhtn1Goin3qpjUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tiC4E5KT2Cs1lrBrGWgSD/u/vK55AKVVqRC2BU9ONh0TV+6ztJVY3i4MmqCUxrGvdjsZwH71QwCqPB0HQAPvfBRO5QBpYHfkxPpSH2R3X3F1bI1rDdmB0qHxjKcOXpRlVrlfYQqUK6aBhx+h6zHmdkrSChVHXebReeDbEjzLMgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfK5G8Ud; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfK5G8Ud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730622800; x=1762158800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=REbRLl9G2lmdOypXq8T260G3nV9xxhtn1Goin3qpjUs=;
  b=BfK5G8UdA/buSlrDbUR7uD66OkO7nL+SqMvInxlUROx86H1e8kSb2+hU
   gQBeJo5F0sucOWBHJR9AKtKr7Ll+D2rih49VGTut98C+awyKkbY7RQH7m
   pMkkSGPrkOjTM9XTgmn7YHvwWHKlAbU/mvYyT+A36KNsMEQJyMoK7V1kV
   lRX7PR0Budan0188gsol7we9mo9lL8EkXsuzX1YnW685MrrSHGQ0ajGIO
   MqE+6D0HH/jgiQz1STldZm9zUxPf4fkMew1rINAb1aUfC9MVqZXSyOiqA
   D8lylboGXD5scwWRY3iWSEQr043M6cFmwaSXkFCJtv3T/bet1XmtHKysH
   Q==;
X-CSE-ConnectionGUID: NIQZmLkyR5KXQUo40k7GeQ==
X-CSE-MsgGUID: UKKBo/H0T3KvAHVcSIlbrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="30445033"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="30445033"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 01:33:19 -0700
X-CSE-ConnectionGUID: Q9fgUNtKQjebMe7KjsUS+g==
X-CSE-MsgGUID: wRGHKtd4SxSraivKVc5jUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="87953813"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Nov 2024 01:33:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7W2v-000jod-00;
	Sun, 03 Nov 2024 08:33:17 +0000
Date: Sun, 3 Nov 2024 16:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 7/7] vmlinux.o: warning: objtool:
 relocate_range+0x2f6: unreachable instruction
Message-ID: <202411031619.LJkD5bVc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug
head:   323ac978117ad1c540de0414282f8aad6c1f10a5
commit: 323ac978117ad1c540de0414282f8aad6c1f10a5 [7/7] [DO NOT MERGE] x86/kexec: enable DEBUG
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241103/202411031619.LJkD5bVc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031619.LJkD5bVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031619.LJkD5bVc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: relocate_range+0x2f6: unreachable instruction
   vmlinux.o: warning: objtool: relocate_range+0x305: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
