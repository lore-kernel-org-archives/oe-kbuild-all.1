Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2045F4B44A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 23:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688411; cv=none; b=NCrmlsOlBIXuhFmSL4IpRgTNngrzmAoGz7Xlz9O7a8CgTUQ3zXx/VpRpoUTYrMdRKwVL26jA9xhHqbQSt6IybWYqbuuZNlwOAuFaYUrOL5nbd7MzzueJRkeSeT/oAAW+j9M6Tr668q2CWO9qnjInmWyZKpS1OUc7HEM9o8MA+xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688411; c=relaxed/simple;
	bh=b/d6phYbIju+JJckbL7UZssBDTxWxcT1uRT7liZuiDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g4bIKiV/W3ebbygsYSl4r9q+RZ1FcNI8S2M34MldxAvQ94+Ioe9g/poIfBFej3tp+jmUEY8VCl/wy0o2amqDxyl6YeAxJvWtcEaQuvC/cnbv0Ggrtu+Vz7yIQxY5X9wN6uZ/Djt98ce1SE7KbELKJDFsgbqtWhvUmbJe6zNDBhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsUXBN+W; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsUXBN+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789688408; x=1821224408;
  h=date:from:to:cc:subject:message-id;
  bh=b/d6phYbIju+JJckbL7UZssBDTxWxcT1uRT7liZuiDM=;
  b=UsUXBN+Wxs5fHXiyMJhYv4kqSYs8k6zypPzUSMgFDsw8GRuaxJRkYbG+
   19qjV1SNEoczkgnRu7x4V21mr+S6sTeMP5bWJuG/ZOODxE+Cz6dW1yMgR
   twu1Ih8nZivuzxrqIojOQpTuZ+wP4INsLjS69UacKVyYHCh3UUdoqbKy/
   B2lNme0UUWFj9zYMlsMOsTpBeBPo1vnpeTFBrFi+jR43xYnmoCMyPYTXe
   kxCtB0pR4vOEnBIVEVbzDQUx0F9kLrH8WYmr6x2BIKj8sGekhMCIsWsZB
   ftbFv9VTlwnNb6usdEtT6mvFiWnXRl49I0uaIrKEyjR6ei/Nik05nRHBl
   w==;
X-CSE-ConnectionGUID: 8G121OgyTSqfDbWk+55juQ==
X-CSE-MsgGUID: Lb17TT2CS6WZiGUDt+ESGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89298391"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89298391"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 16:40:08 -0700
X-CSE-ConnectionGUID: 4c1I9Z+zRdWvc6v8/gMHbQ==
X-CSE-MsgGUID: sPMln0jSTeKEo4Mxx2EiCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2509660"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 17 Sep 2026 16:40:06 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Lhz-000000000pZ-3TPI;
	Thu, 17 Sep 2026 23:40:03 +0000
Date: Fri, 18 Sep 2026 01:39:26 +0200
From: kernel test robot <lkp@intel.com>
To: Rafal Ostrowski <rafal.ostrowski@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [drm-amdgpu:drm-amdgpu-next 6/114] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202609180154.fjSucqJd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   cf48bd0a46279f4607956cb17c71bda96ee802e3
commit: 8728be7e2305ac1b88cd5d9dc9c18909dc528ea5 [6/114] drm/amd/display: Refactor RMCM into a separate module
reproduce: (https://download.01.org/0day-ci/archive/20260918/202609180154.fjSucqJd-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#860: FILE: drivers/gpu/drm/amd/display/dc/hwss/dcn42/dcn42_hwseq.c:556:
+	 * Expectation is either option is used consistently.
+	*/

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1089: FILE: drivers/gpu/drm/amd/display/dc/hwss/dcn60/dcn60_hwseq.c:107:
+	 * Expectation is either option is used consistently.
+	*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
