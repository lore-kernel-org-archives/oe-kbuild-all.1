Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7A41E32D3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 03:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762486871; cv=none; b=OIKJkNGSvn0NUrpwnr0oKqM3ZWkuE0h+CCeWFrRveDo36V3B/Fbgig6Lmhgi7urDpd31l57dssLXLdRPXv/s00mNGgROey8G6tuu2hZ3Yl/8cYHAxneqSbe6+Z6+TOVH/K+jFzmfS4Jhz6yX97m1VjV+F28b7Xv2dYwRf3Wu3BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762486871; c=relaxed/simple;
	bh=s4gDsQXTGLmkO86GK80L1Mh9JJwBgH9BfFIwQ8B9k2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iSchkM7a/s0Q9DSH7FVJXfPdivK37OXvco0MEyiG5nfPHkck/+95psJuCMp2jNSXesouHSpGt5d+bP9XMHhiMyigr0ONdeYy2v4mG5ywlz9jy7R+m3RzAEzTEtckEIiM3UHFZqId9Qw9K+0gJliGlpKlsQ4KCHMJ64pUGqvkv1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDwicLVt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDwicLVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762486870; x=1794022870;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=s4gDsQXTGLmkO86GK80L1Mh9JJwBgH9BfFIwQ8B9k2M=;
  b=PDwicLVtCNWeKDOqPWsO4PH4BjdmQWSb4szWpbBVptjSm6BmBquIII7Q
   59TPwv2g2u17JhwHOPvJzv3LUI8VvrEcM1LyUiAM+b1DqT8ECdjpKBon3
   XWwelFEI4oXwpQ7e8JUn8CJ9OECMvOQJ+IblgAO2amCpf+gu0+s3UhfTu
   I+di0nym1sDhvGHXbj+Vh2HkrD+2v+GGnsLeXEBNmfmGtr52jy5rWmM6W
   iB0bXSiIDJ02a1ZwbfAESUiHtn0Em68h0uxCUpg4xGoWffr6ngq3/ot1M
   Sf9TJl/jXzi3FTToOBmcb86bQM2WrrEdZucj7i6EO6WSO1sawZGxV8iGB
   w==;
X-CSE-ConnectionGUID: l9Su9mnJQI6q/BZmCVnctA==
X-CSE-MsgGUID: F2EwlomeTyuFNF99aUtFyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="52203088"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="52203088"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 19:41:09 -0800
X-CSE-ConnectionGUID: IcqZYJ5ZSXykh/6Za6enVg==
X-CSE-MsgGUID: 3fFEqD7hQGeSAy3/e0nnfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="192200538"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2025 19:41:07 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHDLW-000Ufg-0D;
	Fri, 07 Nov 2025 03:41:06 +0000
Date: Fri, 7 Nov 2025 11:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/2] Bluetooth: qca: Fix delayed hw_error handling due
 to missing wakeup during SSR
Message-ID: <aQ1qS9-MyXH-N5Jx@4b976af397a4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107033924.3707495-2-quic_shuaz@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 1/2] Bluetooth: qca: Fix delayed hw_error handling due to missing wakeup during SSR
Link: https://lore.kernel.org/stable/20251107033924.3707495-2-quic_shuaz%40quicinc.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



