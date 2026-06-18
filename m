Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93B2C21D0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781804368; cv=none; b=GHdynw9YOzGWFfg9nv+yM6oOfv/w9D4aKfWXct9XX7XTtqfJja+2f6+UAACJIm4DiLliUPntBlVvI5o6iiAmDiZJJ+wIhja5bbT04iKZmYmBqAq77807VUJ2LLHISGOLh9CpMg+mlSHwand7Bu1xK0i/Pc5ri9v+qsW0AggEG00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781804368; c=relaxed/simple;
	bh=lexNcpPG6Zv5/4xg/XPOUj+UHqnHdY0gNovWWXZqDo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZdpOucgK/TZQQTp2CZ1VVXDb+HtYpA6G7fPOy0tVWs//V4nZuX6QVBvwuN+lBdj0wifZHiiUQolOX54Tk35LmVnfofItv5FbZCEmmMC7OTkPPptcSVMdptze4jKWvvPTz9YBDRdgb+IvBcmNQXZmxPw5sLXubwUbeQAgio670vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pk3dYBcE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pk3dYBcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781804367; x=1813340367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lexNcpPG6Zv5/4xg/XPOUj+UHqnHdY0gNovWWXZqDo8=;
  b=Pk3dYBcEtHJ5iFfwnyY9QBkhNdPo9bG6ShwPy0KiBe7chyePbQ+CbZia
   H2zqX0LoINxSyeMIpOp9cK/vEgjYtkY+J4Rhg3TLAlFvv8cjF5qdeXhQC
   s4WWmOtl/1TshYMBggbWf0vIZmFToOmtLTiDMypIWA4kVThW9NZY67v6T
   O1i3puSKqp+cPixblzDFBImIl5C54Ko/Rl5pahdHUsJIOisi+gtZHFLKk
   +dUEG0EPVlcXk1YOqMt6tsXU4+TI94FDZuQblV2NFHdIZ7WcxnGdiU0Q0
   kd4kpNo1Sv4tKbYG+jaf4S7BFKmD2Awug1xRbZ+UkpJqlm4iPfFns2q1t
   A==;
X-CSE-ConnectionGUID: q9sgPYPRSJqeOY8oOey7dw==
X-CSE-MsgGUID: 8eXbEYrNTcOfS5RoXaGH3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81635841"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="81635841"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 10:39:25 -0700
X-CSE-ConnectionGUID: /OPPb/YdSsi/ytVZqm/iLg==
X-CSE-MsgGUID: 3FGCYod9SReFjTLVYuQKUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="272125424"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jun 2026 10:39:24 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waGi1-000000005ZR-3nBc;
	Thu, 18 Jun 2026 17:39:21 +0000
Date: Thu, 18 Jun 2026 19:38:26 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 69/121] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202606181949.gXMYALNk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   9c0dea96595ed07b9d3948c7bd1a5dc915573121
commit: 412031528a775a2630dc7a0b13acf7e31b07defc [69/121] zx29 qspi driver
reproduce: (https://download.01.org/0day-ci/archive/20260618/202606181949.gXMYALNk-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#427: FILE: drivers/spi/spi-zx.c:300:
+		switch (op->addr.buswidth * op->addr.nbytes) {
+			case 1: ctrl2 |= (ADDR_BYTE_WIDTH_8 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			case 2: ctrl2 |= (ADDR_BYTE_WIDTH_16 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			case 3: ctrl2 |= (ADDR_BYTE_WIDTH_24 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			case 4: ctrl2 |= (ADDR_BYTE_WIDTH_32 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			default:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
