Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E728273F9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 15:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764515701; cv=none; b=I4Qmy9phV772tUiZaUQILH9kzpd77t0/KANew86TQK6Fr2XUBinOlFj0X26dVcMYZ5MxVu8xdaU9/meoqcmsGr/zT051B9KthQeelTrURGqZdkgNK+8fo+LetlsM4NXXTN95f7AZhCNpywDZutmVibvzML3+Cz/QpNRGKT1Ipfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764515701; c=relaxed/simple;
	bh=xs7djllhX3HB01eo/QrRaa5TNNqDHxbNUmtgL1UzCJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=o1QptNilbFEmXsjcuOJj7aa1cO5kQoHfPnSP8zfLfZ7eTUWxreS4558kjBzsXTxx828kzaMVqy2UgpratUmCgH9Nq6EeLSGyv5quIhG6EdoJVXeNRMPQdpoIUpiwucIaCQusW/nsXq6ykBIRIjlSEXykmjx1UR4PBRxnaLFusHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGdM5pUb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGdM5pUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764515700; x=1796051700;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=xs7djllhX3HB01eo/QrRaa5TNNqDHxbNUmtgL1UzCJc=;
  b=oGdM5pUb4++EIUdzEv0ZL/LoRYc1jvJ4U6LqXO84IZ6EqFAbj/YyGV0k
   sl8GEn7SKrHMZzAXdT5dDgmk0BYADf4mGoyQAB2Oa50HZstscbtBFLBOF
   5KJLBexjydpWXD3ab6IGajpmCJIT/IN90FQA0eAfTvtAK0qqdlEfcnrOw
   FUupaq6insrDopvrm09Dc9pGgkZooMqoHJZ0U8dlnUoBt1jI7w+9/wLfQ
   bqQ2S6TAoPBWSuWe2s16ioL49gcl+9t8ssIvImrO1l4Ai1l94OTjvl1vm
   AhrtEXkUGQgCxKExmuly8axSNtKviYG+IDqDA34ETopts7ieiXgM+Ohql
   g==;
X-CSE-ConnectionGUID: gDgPAR6pQBarphQ1rXR/FA==
X-CSE-MsgGUID: iHLflmjcQGS0pNqdhoj/zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70324882"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="70324882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 07:14:59 -0800
X-CSE-ConnectionGUID: nJOVCqjXQ92f2KTFEQwY9A==
X-CSE-MsgGUID: JnFP2muQSNyH7zbz1WFC7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="224560864"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Nov 2025 07:14:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPj8a-0000000081Z-0Rug;
	Sun, 30 Nov 2025 15:14:56 +0000
Date: Sun, 30 Nov 2025 23:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 6/7] PCI: endpoint: pci-epf-vntb: Switch
 vpci_scan_bus() to use pci_scan_root_bus()
Message-ID: <aSxfPMInBUE2pbEQ@73cdb724bd1e>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130151100.2591822-7-den@valinux.co.jp>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 6/7] PCI: endpoint: pci-epf-vntb: Switch vpci_scan_bus() to use pci_scan_root_bus()
Link: https://lore.kernel.org/stable/20251130151100.2591822-7-den%40valinux.co.jp

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



