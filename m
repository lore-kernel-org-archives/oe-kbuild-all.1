Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B8822A4E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 23:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749855811; cv=none; b=Wq4VX9tuxacHNsf91hyMUHYWyUohIK5nJ+QL5KIcwM23rTU3Fmfq9y3sVh2X1P+fKt6F4Ueu89NgYIsAQQg1cAcypi7Gi+mC9XRs8Wr+lJI3aww/6gHiaqH6MeraRfmV9FTnSLBprZb5sBmvyBM/jDPumBfvsPEGN+uSuriclFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749855811; c=relaxed/simple;
	bh=o9R/sx2f39J8GmkU6AoxxwG2q+QiRnlD3yDtxkYfVkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=F+3KK/DdgUvESqb4sCrh2gCoCZ3CUp3bVTiRoinkeeuudA6ToeBSx/oN13TZ6Xq2nSFYyCIkuKB/ptKw3vIG+mT7GoRH6g3HavLZa+C9/PF2Po4/5fTttwRrBgaeqziAUZvLfprz9ejakxq6FlkQ0EHfHMjrZT2aemgGxqX4kyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DB2T1qG5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DB2T1qG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749855809; x=1781391809;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=o9R/sx2f39J8GmkU6AoxxwG2q+QiRnlD3yDtxkYfVkU=;
  b=DB2T1qG5JVEN6Z9J6CUCBbMy5QWHTPS70vMT7l1iN1M/5AzI1+X8HRxO
   HHHKZnci3Wh32XTO09/NMlpCcNU/STgBLFfP0MUPLXSJVI+Id1aheECGB
   PAVOw+gdz0gFSV+35bZFK9pgvhcAM5NFAvPcfJtNEs3q0Wt4vv3t30EXV
   YWnhfOYWYSEcZ+LxmGHdTxZhxuSP8UaO/CvTn1yPUBHipBs/AAQ23O6d/
   C78zhwslTtEMlHsZobOYrDfLPXXHd7HEDVh5iJN79fMjw2bWTTVxJXLRS
   Pr+HVge2+L4m2MUjNl4Wrk1nACUhcXKXWpewGkpQmpr46MV4Rx/pbrUFI
   A==;
X-CSE-ConnectionGUID: bi39nJnGR66IkGXNUo6Uwg==
X-CSE-MsgGUID: /FTosoiNRh2PoLbncSBhdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51194775"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="51194775"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 16:03:28 -0700
X-CSE-ConnectionGUID: yAhMgi9KSFeiRy48GcNfkw==
X-CSE-MsgGUID: IrWewGDvRe26Y8m+vQjKUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="148485482"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2025 16:03:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQDQi-000D42-2q;
	Fri, 13 Jun 2025 23:03:24 +0000
Date: Sat, 14 Jun 2025 07:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: mhkelley58@gmail.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] Drivers: hv: Select CONFIG_SYSFB only if EFI is
 enabled
Message-ID: <aEyuMCuFsZ981cEr@9978228ff6ac>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613230059.380483-1-mhklinux@outlook.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 1/1] Drivers: hv: Select CONFIG_SYSFB only if EFI is enabled
Link: https://lore.kernel.org/stable/20250613230059.380483-1-mhklinux%40outlook.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



