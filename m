Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2304084B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 22:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710885899; cv=none; b=QLsTqCQ9KdmtK3AZC+0/mKz5TXLDM7a6SU+aJnBtmgw/rnQouEhHvKyy1os55zVCJrocqKUidlFK9HvBTi3VVdp+0JCtfBnfgtUgQVG8mszu8zJwcZ4Ci7AsMSnFJ10YsE9i5gduxZnk85NO8FCgjaZjj8IB/QS9AI7swf4H+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710885899; c=relaxed/simple;
	bh=fxXLTRF/BohWR4oY48AjQawpKzfyLLTa9ui167t9EaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3g5FbapIhtBQ10tbQCDOimQTfSub1Ll5sXJ8vVFtF/ybJXbksgPQv5RHfabGjZYQvdkLgKj7yhfBYvrG+byz6IBupMcWv2X+02WE/Ehlg8AjsglNn9W2LfOfD/VlwNr73QrV2w/ajbzWifO0ajEICY1AMZwoE9ooZDroURAsTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1yULk7k; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1yULk7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710885898; x=1742421898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fxXLTRF/BohWR4oY48AjQawpKzfyLLTa9ui167t9EaE=;
  b=U1yULk7kPvDMlvVnX4d4GGxrbNjYluemC15GuKkwKtZhLY2BHJq06U/9
   Q4H8pEXB10kdeV38vimC7wmcksCmH0u15QEjWC1gremXiDeUH47OE4dQs
   wskklEE9jhus5Y5bZ4f+x/zIn8ZD4aP49PdneLaYMlTshTv5fBeE19KU9
   Ezw8yTItIY5bVPjejltcBUpNIRO5yw/GA5Id9VXyAxcsNtuvwLmXdu1nz
   QWZKWnhWgCzD9S47hhB5VE6OXjuqQLi3wyiwxvwZ8pWKBNJGeqSfKp3qW
   9ByP3m7EFSXnYbWVa5+kAORHERuTz2J0XG82zWcl1cL7nz+0hokUm4Cpr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="16334290"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="16334290"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 15:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="13845211"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Mar 2024 15:04:49 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmhZf-000I7T-1U;
	Tue, 19 Mar 2024 22:04:47 +0000
Date: Wed, 20 Mar 2024 06:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>
Subject: [gmprice:sys_move_phys_pages_2024_3_14 2/3] <stdin>:1600:2: warning:
 #warning syscall move_phys_pages not implemented
Message-ID: <202403200541.iqjj742w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux sys_move_phys_pages_2024_3_14
head:   18bc4aaa72396bf7409348958ba2bb3fad2d88c1
commit: 2727276faa0c537ef9df039aea1d6e7cb264e0db [2/3] mm/migrate: Create move_phys_pages syscall
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240320/202403200541.iqjj742w-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403200541.iqjj742w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403200541.iqjj742w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1600:2: warning: #warning syscall move_phys_pages not implemented [-Wcpp]
--
>> <stdin>:1600:2: warning: #warning syscall move_phys_pages not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
