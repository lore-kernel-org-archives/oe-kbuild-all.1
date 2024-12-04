Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4303C4A1A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 02:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733279820; cv=none; b=dUcphnW/A4qCXiKO9dJlLyRrDeI/7uk+PNu3NBKmAjOHEczJXJMReGVSUb/C/d3DePu896zScqPMdilH96fbYQOhIHmVUet/LWFDRJg+tkG4AJxdlquPg9ffWCFrYsq/u3/hXhoXgEEHm7cC9vRV1h3YPXLtMko0146q6If+W6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733279820; c=relaxed/simple;
	bh=yThAkq8eibTs6BQzTGBL335PJtz65pyzvH4azdC1Y4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=a7ioTImdT1n4pLVT9FdzKOaIZAt1nt9cg4SPuReSeaGNwMAmkuexh9QpWv2ge1jQb8POIhIs8hAXUHGKPYgIoTJbFGw5+r1amtEWYYwlT1Q1JKFTUo9YxQqzkDJsaRPk7Z+oNsujKnmpbho5p6ayECMTc7A/3N/a6CtCjbD/C7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYfWisOS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYfWisOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733279818; x=1764815818;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=yThAkq8eibTs6BQzTGBL335PJtz65pyzvH4azdC1Y4M=;
  b=eYfWisOS/dA7wQqOVAQsL3mRxYym5z5vYH0gy0v7G84q+ZcOBb+FJRYC
   a42qpaXYAACWGNnzQ6UszmA5sgjU5PEcmELDigNlLpou4rUbqHxrPbvuX
   NaBFNIvtxrCtpuIFfNvjPYgvS6s3CRgep1z/qLOdaxIYQemj6/g8LQvgb
   Kj1K1CNcofK7hvmVYKX8JJTWdiqDsN/I6bVSoQkCMRkwzgVs0M0Iq8BY+
   vS5ez+Q2/Vp0lDE7J/Bi3uyCBp32xdxxKwOqmU3ByTFhhzin5FD92odKa
   kN5Vd7HFuV3S/vZIjJ+xWQVTB15YvzMb8Wx27k+ht4ACraPLv589SHXMt
   Q==;
X-CSE-ConnectionGUID: qC3UHoYURKWeJFl+x2JUQQ==
X-CSE-MsgGUID: j0aBPV32TTi6CdXkbzzPiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44188566"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="44188566"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 18:36:58 -0800
X-CSE-ConnectionGUID: 4/hQHBcZTI6ADVAUTSXSHg==
X-CSE-MsgGUID: s2MALBw+SH+xeXPOn9XuQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="93967680"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Dec 2024 18:36:56 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIfG2-0000UH-35;
	Wed, 04 Dec 2024 02:36:54 +0000
Date: Wed, 4 Dec 2024 10:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Haoyu Li <lihaoyu499@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drivers: clk: clk-en7523.c: Initialize num before
 accessing hws in en7523_register_clocks
Message-ID: <Z0_AKFA365ggXzBU@24ad928833eb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203142915.345523-1-lihaoyu499@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] drivers: clk: clk-en7523.c: Initialize num before accessing hws in en7523_register_clocks
Link: https://lore.kernel.org/stable/20241203142915.345523-1-lihaoyu499%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



