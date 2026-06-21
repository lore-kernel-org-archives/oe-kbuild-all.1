Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E968EEBA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jun 2026 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782042645; cv=none; b=eN1JBe9fQmLSQgFzqYLmG8xs2VyI4z+nYSW3a20viESKWrScEf3TzUyAc1JVAgcepdteuNyji7Itb0MgfJjtQvB/EmE05PXHedhoAbEfDLIxoqJrdaAuTqqpAD/td4kAITcQWC1m36Cuee2I/8VeB4w/X8qky5x8711ZVYZgzto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782042645; c=relaxed/simple;
	bh=HqpD4gmpNCdxcn75FpeXbUT0Nu40qzkgYZlzbGWXc6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gjOW3bxTpoVWSD+p+jkAZAysv2tCWpbwNiKBUJN/lI/wXkhnfajbFmLsfUOgSNRKFkcSqiPv2JTnFXO+lNPE4Tf8hlUnqOkCiKUSag2e2KaJfXEmealws8FkKVfDDyRKfjBfDAbiCM8A2dRCXvQzEVGMNa/K5y659K+Ufe32M08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=McIkgvq4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="McIkgvq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782042644; x=1813578644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HqpD4gmpNCdxcn75FpeXbUT0Nu40qzkgYZlzbGWXc6o=;
  b=McIkgvq4+esp33O85f9GmPQCq0B6fcgaV7lWlhhY74MKldPWmsxs8rVN
   SA9OPzQNlG9hH9OgrpUdYZ9X8leAWXlrpLVm1nNK84YhqR6PvFNSc5IDc
   V09mzSzom6nDSFIHvlPwRIuKnQlG1nRwLANsXM9qf484rXyfdw9RVuBc+
   AR6kXE5c8XICPXRczuR9vyWvSD+xM8Bv3JCrCjcr2/l034O2g+FRz+Hwj
   a96/gmKWC6IAv4Np+ib0Rb8zcJ3uSp8N0wGxDOk3dYm/kkKVKg8nJIVJq
   X/FnDDXQKP5qQTaXv6LotW5EHjh+P3ebCZAnEE+C+3FfP9wcF2HKjDdfQ
   A==;
X-CSE-ConnectionGUID: KhrfplE1SqCwCkYBPiB1Ag==
X-CSE-MsgGUID: QmnA6lnXRUWAwxMLGa5lqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="81903361"
X-IronPort-AV: E=Sophos;i="6.24,216,1774335600"; 
   d="scan'208";a="81903361"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 04:50:44 -0700
X-CSE-ConnectionGUID: MhQ2W6VqQNiArNPZTp86BQ==
X-CSE-MsgGUID: h2/tyURPS42x80gwYrHnMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,216,1774335600"; 
   d="scan'208";a="248103606"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 21 Jun 2026 04:50:42 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbGhE-000000005sB-1oZ9;
	Sun, 21 Jun 2026 11:50:40 +0000
Date: Sun, 21 Jun 2026 13:50:07 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 70/119] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202606211308.0TKJsAA3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   4f1281c64572b5ea9bda9f7cd213d6b4375a4387
commit: 679817917e82e5c1fc5cddd6add8729171bcfc4e [70/119] zx29 qspi driver
reproduce: (https://download.01.org/0day-ci/archive/20260621/202606211308.0TKJsAA3-lkp@intel.com/reproduce)

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
