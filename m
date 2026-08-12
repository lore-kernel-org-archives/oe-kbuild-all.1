Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E25F3624C9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 01:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786496959; cv=none; b=eJ3F1nHEwWQjj6Gx/1rhqz6VWyfkUL1Cx8UjWHMcb6zhpMPkXb0O7VDFvqtbRDYmEWkf5i9uwfKLgXpMmwxsXLq9yfRHTky6nJ8ZMDM7EwI0zTtFHPHMT9qPY+45O0I/mhRNtpf7hEHvjQFCQOSytWjLyQpqKr6gEseBXJ2X+ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786496959; c=relaxed/simple;
	bh=Dp9u+FAc0Nh5OYZ1uzCPrmsbGO5dL6VwEGVF/hnPxS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KDumnO/zf9czOe3k1n580AXSGidiRQ237NWF8oXZtcgF1aTEed0PkYpFBDU0NPrZ/OekDNX09n30fIh2q8ubTLe2b9Ofur86b5D+QAexUiZbpDGckE2XtaGQNBHy9Ncf0o3a2cuqkp+rYytlzqYYP53mWKok8hmxBIqUXiMfVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjReEDdS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjReEDdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786496957; x=1818032957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dp9u+FAc0Nh5OYZ1uzCPrmsbGO5dL6VwEGVF/hnPxS0=;
  b=QjReEDdS25JtwbIjCJaGyWlHZxkAjW98oIprUCQm884tD5PFh3OXV+/o
   dwty6veWr3Liuv8aWRvL0qLWbr3BjoJy54k6JO9FZ4NJonzIrZ5z7SzMz
   Z3MYCZjqBcbNSww/CFoc945YprT5+wr1Uudk3Ay2x8JsTtRcg8iEAzQ9J
   DSy4yUgTXsdHUYOpRxE1IIhCXQFRKpHNqD0IIlV1yDscQeU9djarAITUd
   xbBX9qqElIW+cNDvub6yp5QxqAS0j3gvkaQXnWGXh+LOBbh9HDKtKgF9e
   ZCWcvxQEM+eNb5Q6wE12+K3YwzSVhxJe9ywvkPZu48C1Ir0qRtggQNi06
   Q==;
X-CSE-ConnectionGUID: A/MCP83uQUSXisfyhf51oQ==
X-CSE-MsgGUID: x3kA6k1oR4y1EM+fSjRxqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86162881"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="86162881"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 18:09:14 -0700
X-CSE-ConnectionGUID: z+vckfFgRSeCppblaq6N3w==
X-CSE-MsgGUID: URBrjuN4Q0qPdCTNeqkNPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="262994355"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2026 18:09:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtxSw-00000000PYN-3My6;
	Wed, 12 Aug 2026 01:09:10 +0000
Date: Wed, 12 Aug 2026 09:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 36/64] ERROR:
 modpost: "__floatdisf" [kernel/time/time_test.ko] undefined!
Message-ID: <202608120817.xhF83z72-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   3e8fc6d2f17abed506fb832160ecd7c7e5fdd222
commit: 0e7eee89b53771dd220be34fd7bae2861d74a723 [36/64] timekeeping: time_test: Add a test for auxiliary to monotonic clock conversions
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260812/202608120817.xhF83z72-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608120817.xhF83z72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608120817.xhF83z72-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__floatdisf" [kernel/time/time_test.ko] undefined!
>> ERROR: modpost: "__fixsfdi" [kernel/time/time_test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
