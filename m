Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8AE2F56
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719351620; cv=none; b=rIw/3HTPpFLcNQ5ZkoOY+13sFkMY2unIKOres7Y1qgzpZeCKFpYhKJQgCAbW1e1YcIBVNbsx3lCpODMuCDuZ4F9uPxFbXq9TXmdGT/7h1kJOV4lB7NU1sNr6VMh2yzE5qn4c8KjeE+dcx36VqUB93r4gc5gQESIIXYAlq05eHXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719351620; c=relaxed/simple;
	bh=XqqbhHu0As3TmOFbHOqc32DmXfUxQXERY8y321zHwWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtbNBr1WzoqE1npP/Vy5tIcRqqu7Yc1CdpUqziGeTyERmiugExm4yId/tLpO5oDLQfszW3u0RoDp7HdCJnHAWL+bor4kojHimQvNsBfO5kkfEri1Bo8+gBU0jtIYvbJjxejINnNMYmwq2XbeGQwtj5bM3yIR+LZT0AvKDLBRQSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T56ziFdO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T56ziFdO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719351619; x=1750887619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XqqbhHu0As3TmOFbHOqc32DmXfUxQXERY8y321zHwWg=;
  b=T56ziFdOVcXPR3LlHTz0P5T9KixSZJlNbsfvE7ZlI1Aaws07nsnjc3mr
   13p0MkkrwCQVOMYXzW0vHkOhNHuhoT8uQc3tN39pNDdwZhvr4s8+jdzjy
   tdS2gcTyI+OJATrckWyxzrt/Mbz583HtXoBWWFp00jwfxmneqWUufYGM+
   1Lt7V0oPMaLUSahzD+VcmiepGC2xOCQCzK8LF65ZfpAmfqqhu5RX4+j7v
   vvXUYwEIJPRdwZWk76U2IAeMAbaEn0vTJLs/jTUxzMZX/eYWsJkUzqEp0
   5S1ZAobNcgacnZOlgRuafavyxec3tIdaP7kQ1rT9ZoFV466x1QLEECXCH
   w==;
X-CSE-ConnectionGUID: 2/AW82URRymc/zQTn7ulDA==
X-CSE-MsgGUID: IfgiyabVR9Cjxj5EpK8hug==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="12245738"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="12245738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 14:40:18 -0700
X-CSE-ConnectionGUID: HmHbYMUPQuWknLSycCwy+w==
X-CSE-MsgGUID: BNaOfl+GSAmJYO3iLhaKfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="43651005"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jun 2024 14:40:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMDtf-000EkL-1T;
	Tue, 25 Jun 2024 21:40:15 +0000
Date: Wed, 26 Jun 2024 05:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next-6.10-rebase 26/35] zcrx.c:undefined reference to
 `tcp_recvmsg'
Message-ID: <202406260543.KiyB6kQB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next-6.10-rebase
head:   1bc9807cd5e670cbc5f1a650daf7470d33fb94d7
commit: f9ab1c1cb8fd3a6c38b23531928b8e1ff43c60e9 [26/35] io_uring: add io_recvzc request
config: xtensa-randconfig-002-20240625 (https://download.01.org/0day-ci/archive/20240626/202406260543.KiyB6kQB-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260543.KiyB6kQB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260543.KiyB6kQB-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   xtensa-linux-ld: io_uring/zcrx.o: in function `io_shutdown_zcrx_ifqs':
>> zcrx.c:(.text+0xd08): undefined reference to `tcp_recvmsg'
>> xtensa-linux-ld: zcrx.c:(.text+0xd10): undefined reference to `tcp_read_sock'
   xtensa-linux-ld: zcrx.c:(.text+0xd57): undefined reference to `tcp_read_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
