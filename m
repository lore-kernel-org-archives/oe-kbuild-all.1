Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E03B3A7582
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 21:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560735; cv=none; b=upjduE1u88FQWihtA3fdQKjg7Xl7jltwo+ewx1TrWZ2YME+TztQh9V4tNw5P4qCr3M39twcd+vWkQd+uNoJ7MzLyK5QJI4WMz8hFN0pZBxO3f9njc6qXqOZ9aWCqDG5QyTaNCwr76zQHyEg5xxvkxEIpL3MlRz4oAg2BiS3Xbt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560735; c=relaxed/simple;
	bh=w+I808tWVVKcC7d7lQyp7V/WXLTeiZUOctEZ8NQN9/s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qiuZ4axJX7n+9wGFnyxKeku+F2F35G1dWa8vlBnZywGKYq7VGieM3lWMUi07QW8iMgcZKXGIZ18iw62ezM7bFcxt3tzI84/hYm07agzbliNvJql9qtbjMXOZR9Xi6SJb9IH+X9mxoIII0CSXYC5qoMs6EztJX6Ud+W6q9OAbeH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YH+XWiHs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YH+XWiHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774560734; x=1806096734;
  h=date:from:to:cc:subject:message-id;
  bh=w+I808tWVVKcC7d7lQyp7V/WXLTeiZUOctEZ8NQN9/s=;
  b=YH+XWiHseduuRGUvcoDtV3kDlQQBF34SLK5ZFCZqGsx8T5yB6fe7vpKB
   hxYwZknxbPBvwVeClcuhihgq248oaKkshvffnJJZPHxNsZt3XyPs5o6bg
   dKoGDA4vEqnlLzIBVMLT74GwwtgG0mKag4MlQ8nxyh43U3t7bfS/Da7gY
   oaqiHZU49YITC4FLR0OWXvsqfwNIfZGiDnTPn2mE97m6qG1nW1HzrgfJ9
   359iXkScp3m39gVtWBOLX6K722y3v2w7m+QOkG1RPkQ8dPH033LjqDizN
   um9JCOlqfvI11ZmZsROAb1saKpV0NzbX5yMIQBLqrn3GFyP5sf8hvjY2K
   Q==;
X-CSE-ConnectionGUID: mu4UoxI5TPqRkoOb4vZ4eg==
X-CSE-MsgGUID: RVIMZraDQDisHS4LR2G2gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="93018373"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="93018373"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 14:32:13 -0700
X-CSE-ConnectionGUID: c5I706e2RauX93BSZqdrIQ==
X-CSE-MsgGUID: XReg+vJmTnONmbc/uU1+rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="263036178"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Mar 2026 14:32:11 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5sJE-000000009Od-1UMc;
	Thu, 26 Mar 2026 21:32:08 +0000
Date: Fri, 27 Mar 2026 05:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: {standard input}:384: Error: Invalid operands
Message-ID: <202603270555.zPdpChGv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d813f421930c5b01b9f61043932de02602dd6ae3
commit: a46023d5616ed3ed781e56ca93400eb9490e3646 tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast
date:   8 weeks ago
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260327/202603270555.zPdpChGv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270555.zPdpChGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270555.zPdpChGv-lkp@intel.com/

All errors (new ones prefixed by >>):

   during RTL pass: final
   fs/smb/client/netmisc.c: In function 'map_smb_to_linux_error':
   fs/smb/client/netmisc.c:893:1: internal compiler error: output_operand: operand number missing after %-letter
     893 | }
         | ^
   0x7fdfba8c1d64 __libc_start_main
   	???:0
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
   {standard input}: Assembler messages:
   {standard input}:383: Warning: end of file not at end of a line; newline inserted
>> {standard input}:384: Error: Invalid operands 
--
   during RTL pass: final
   netmisc.c: In function 'map_smb_to_linux_error':
   netmisc.c:893:1: internal compiler error: output_operand: operand number missing after %-letter
     893 | }
         | ^
   0x7f0298cd2d64 __libc_start_main
   	???:0
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
   {standard input}: Assembler messages:
   {standard input}:383: Warning: end of file not at end of a line; newline inserted
>> {standard input}:384: Error: Invalid operands 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
