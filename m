Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21FF1ACEC8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735667903; cv=none; b=Hj8+pCxQr6kYcb1mlz/d53tAqvZfA9kIaFVf4HyfTLnvnBjBe9ZoKtCV0VCMxb6xCZCi/Gh7BJB41RDUPJY3f8ZBIo+UtO8wKhSfBMLy6tWzHfm7tI0OV5wExJfSndUSVar634fjlUD67qGHvlT2SI61Gc68OmwYXVoUQZBPJ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735667903; c=relaxed/simple;
	bh=Q6+yyFraDauOXZ0FXFgBVgXPogeG1pFMpD7h/BqXHiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dwMpqSgGB2xezHwfcfB29xTJl+C4XV6C642S7b6peWtzdOqT/GMaN14xuOljDwz10hjGVW6kXiq7wkMKPEUul0mO5l5Mgpj7nR+RbcuI257wyM0ldC365xiDTkcuHqS5SRlPQMAcNLfPdTPenFsTRsURMXoxPAVchqhUTMSEu8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/oJqdqC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/oJqdqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735667902; x=1767203902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q6+yyFraDauOXZ0FXFgBVgXPogeG1pFMpD7h/BqXHiQ=;
  b=d/oJqdqCsRpmflijG6KaPb3pUwbD/WNRbz3VNUcpBUPknxOrJVcRjTG5
   I3xlw8GeVr7c7ZHFNwSUAPtwRiBM1IiAoQvyrQsk9//v9fjLLuq2mq/oW
   8msvs6/zGx31dDYUJc27ZhiziNPy1SOA2Kt+eul0W34pCXK+J5yuewn4C
   ABbhLNg6WorsMxoUI4X4OHGRMv5V/duiaW5Y7gRA6xH8C/BVfDAJUPpH6
   SaX8M4X1ZNPJ9H7ioMGP5OYOMju1eK0pyqd6L3grLQ1zVAMija5fCU0RZ
   Y6i7QNT9uGv9M5Om9qCIIZvjyDEUq1IpUvJ/kJ92ElC1pD5UJWBolRu5P
   w==;
X-CSE-ConnectionGUID: 0tIsHWVqRZuv7H+JIQkFOw==
X-CSE-MsgGUID: g44Db9iuSqy+aiTpKdMBPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="23535989"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="23535989"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 09:58:21 -0800
X-CSE-ConnectionGUID: d8BeTERfQ+KtEGWL/VHOEQ==
X-CSE-MsgGUID: c/qicvrCR9qF0iCip5p+ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="100954805"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Dec 2024 09:58:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSgVW-0007MR-1o;
	Tue, 31 Dec 2024 17:58:18 +0000
Date: Wed, 1 Jan 2025 01:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2602/2602] net/hsr/hsr_forward.o: warning:
 objtool: prp_get_untagged_frame()+0x1dd: unreachable instruction
Message-ID: <202501010119.xxXDeQJq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   55bf638d3d29c53ddd64ed89efda8b70b47ccbbc
commit: 98b75211ec31dd66ead850cc7a7c1928805bf3ac [2602/2602] net: hsr: avoid possible NULL deref in skb_clone()
config: x86_64-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20250101/202501010119.xxXDeQJq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501010119.xxXDeQJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501010119.xxXDeQJq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/hsr/hsr_forward.o: warning: objtool: prp_get_untagged_frame()+0x1dd: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
