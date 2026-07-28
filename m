Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816493C5540
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 07:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222349; cv=none; b=M3pqQrZ8d9RNy1a6DetEl0sRgKFPSJfnRYUMMWK0EQ4DaePHv4j9/2xVtbn6Omm57iuOfIxnLWKwoiGUGFho1u4YDNgUXoA4lEEdUzqUJWdsQOONc4ZUjrK+GIqqJOd27i5rsmTNWeO4gccvg4I9EESx1Mc9O6dpuzT7Fv1m09Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222349; c=relaxed/simple;
	bh=B5EFN+No89Iv6/JSld8GP7+wjbFnUwDr14qjG+Hj2Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uJewqwqXenY7/iphHWiUX5Q1tKYMSaObS17NXG3LUVyNMORqlSCjO344YFGIn5dW4PiFcLIwGuSdgwUCuICBYwP5PCrbPCg+oWzi70cURfCWc71i1lkKBD6YkJ9arrPJhZsNV2w05nvT4oCB/dwIpZzaz03TMLTUaa2ig+ItjhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DeQ6e3HW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeQ6e3HW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785222346; x=1816758346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B5EFN+No89Iv6/JSld8GP7+wjbFnUwDr14qjG+Hj2Ow=;
  b=DeQ6e3HW/SDkgtVMmM22WvrViMYkUMG+qpfvDx3Kpu7vEM64kUbnJyo/
   zpEds/1XU/iKjM3TVTE123au//oW7rKN6hEOWS8Rp+esX/6u8lV+yzHNa
   DFE5tID03wC5rAk/f+sB1LEfpMw0t2277EybqMRHClje3gSEuHT6p/6XW
   jbySdYK/CFwQibnccT2jPd4eeQHkH+VrFsts4KW6VwqOsc8U2+z03bVwg
   9SYUgloPYRIJqEb2JrqJmINKERv1BCMDfsIgTyoGlrJnbC90yRuQNWKl8
   vRQB8U2pScoHg+FKYexDECyLupoKsf/vhsnII3jI6btb8450Hj/hf4OMw
   A==;
X-CSE-ConnectionGUID: TPz9BFVASwqFXPAW3iuxjA==
X-CSE-MsgGUID: LjtAluWMQHqTs6t9Ty4TYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89691548"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="89691548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 00:05:42 -0700
X-CSE-ConnectionGUID: a0QiyWpbSMCDS55ps/W9xQ==
X-CSE-MsgGUID: l6kATC+pTp273HiB4qIF/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="289580884"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2026 00:05:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wobsf-000000001v0-3LXK;
	Tue, 28 Jul 2026 07:05:37 +0000
Date: Tue, 28 Jul 2026 09:04:50 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 70/130] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202607280840.2FSJwD9y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   3d8eb1c72ad9937912307a2d4f3de812b572b9b3
commit: b3c8f8b4509d1bf92e5421480bedd0ade293d382 [70/130] zx29 qspi driver
reproduce: (https://download.01.org/0day-ci/archive/20260728/202607280840.2FSJwD9y-lkp@intel.com/reproduce)

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
