Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1821A4DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729875021; cv=none; b=mp9avX/LU1e9jPlxx0IGH2Khcn+c1NPhKbIAfhK3+pl33xpYw2Fs0uuB397rKXKXtcblhSGVCKeQTskwBZs4hxY+7Ab8eyr2oDyFdW243dqry/QjnXYlO4aL0lG1o6qvG88B/ms2MCyhJ7x9+G0mYq5v4q3gK1s2XUR93aSBB8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729875021; c=relaxed/simple;
	bh=lWpe7KscOJHjHZ6R0iqD8IH76X4rramUvah6j6tvAdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UYM0AcRHKzZcAQcGoBjgS5o35OKD/SbvUOx4tg7kJs2Yuc2xbz+6tLdct1jIvdRWQ93frWQF5aKzq+S58lwm8LlxVXilnLXaBnlLwqWj9zey6Z24Yf6ZVfP3xjDFYctjIxtff/XwYBIHHR2ZMJhwFgEGPiHJE5JUHLsED2DylhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kv7oJjiR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kv7oJjiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729875020; x=1761411020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lWpe7KscOJHjHZ6R0iqD8IH76X4rramUvah6j6tvAdA=;
  b=kv7oJjiRx4mJwro7SWN4P0Cofz7b6KDE6VdCxpOxxeRZyPizAWnYWbBu
   P1JVYzeTD8oRtjs2fTe8J8V9/Pq6WshxyYfIyGPfqahq9RXDAlonq4R54
   OsD0x1fkdk7Uc1ezVPj4rHF2R1Gs8m8X3c0y+B6V9KLtA+VIyPGoREI69
   /GjqB7n6sknxVwVOP40p2tPHiiopWfJWVlrqshPVmpUeby/PgUaRn5rUq
   wAwdZHSAD3d0ua+4/0xHvpiIpAXRj7+0B3IEDKq4H1MbOmlB52qvfgs3m
   wwl4PyyXIuzgaBhN9NBXytubwHK5nizG7mracuvn/cozC7xRYiLxLAQJA
   Q==;
X-CSE-ConnectionGUID: 90dqRr16Thi9Flz1Rw3MzQ==
X-CSE-MsgGUID: qD0XXITeSku2qLQxR2QecA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="47035008"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="47035008"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 09:50:19 -0700
X-CSE-ConnectionGUID: +DhykwvKS2OOB+CwWnNBMw==
X-CSE-MsgGUID: UOIRow/PQIe8WBJPRd8L3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="85548269"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Oct 2024 09:50:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4NVw-000YdO-12;
	Fri, 25 Oct 2024 16:50:16 +0000
Date: Sat, 26 Oct 2024 00:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mic:landlock-audit 12/22] WARNING: modpost: vmlinux: section
 mismatch in reference: test_init_once+0x4e (section: .text.unlikely) ->
 init_id (section: .init.text)
Message-ID: <202410260031.vg8tZLhd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git landlock-audit
head:   b3b217bbd19f28ca1b2d9f86cd12a7e590d98a39
commit: 6d68ea6cbd868fb93342bfd6aa99ce6a5c33a817 [12/22] landlock: Add unique ID generator
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241026/202410260031.vg8tZLhd-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260031.vg8tZLhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260031.vg8tZLhd-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: test_init_once+0x4e (section: .text.unlikely) -> init_id (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_init_once+0x12c (section: .text.unlikely) -> init_id (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: test_init_max+0x56 (section: .text.unlikely) -> init_id (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: test_init_min+0x4e (section: .text.unlikely) -> init_id (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
