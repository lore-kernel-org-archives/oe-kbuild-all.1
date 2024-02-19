Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC94C381CB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708355592; cv=none; b=ev74VNH0QgysZ2vzR0nWAZjihjPkrznJ/SanH8+VSU/qqk0BCsNLLpF67HlGZXLltYO8RB3YBo89WoDmXxmO9STPHozhCHIVOuHeEDsj9zNvbJ1q4HNIYNR1YWhL/ifgerVHmL7Zfjyy9PFdRPfSxaMx1W6wTXBsrmrmRP85NnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708355592; c=relaxed/simple;
	bh=xdM9FCrZ73SRoFvZVc8zVVolhkEXidSMeKK+ksRLJ1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=s6tEyVkk3c/c75Yh87R1p0FMsvE4yvjKoEE22DEh9g6rBhNOtT7FKDbKQygbpxkrLMhtYy8UlqkHgucRsy6WCNjDRurK2bKOwz756lHny5ebD2iL2b6TerNkSK5fTCtutyRctBQ7gV7nYeZyv96+rZiYMfiAsQohb9VgLFHymuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgIJXjDn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgIJXjDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708355590; x=1739891590;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=xdM9FCrZ73SRoFvZVc8zVVolhkEXidSMeKK+ksRLJ1o=;
  b=kgIJXjDnSO47ua5jiRTCCcjlYv4MKpad4S2ceYGssQ8ukm0hgO7Bnv5D
   YRU2UehyB6iUNJUoyoL6QxWhb5zulG7PEkH1Gq4NLv3HBZ9P7gjnf4d+A
   jP/ierSDSfnc3eIwa5wLOq+0BSayfGy6NjVzZtspMwmyMps5N88QrNLYG
   l1jr7I0n+sdzN2STKT1wy5N+2HZoPSKWUOKxDh40aGbEnGsaatjUrJwOZ
   RDtgHzr6lgJ1dYNOcg50M1MmVABem2S8fqI+o6x2S26fNmYlZVmYI1uBy
   00b4wKZrfhRuJBbflIkZQ0VHSbzekKVs3ad7xdMfveGgS5kk90urzfz7Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2567281"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2567281"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 07:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="42011520"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Feb 2024 07:13:09 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rc5Jq-0003sM-2T;
	Mon, 19 Feb 2024 15:12:39 +0000
Date: Mon, 19 Feb 2024 23:11:37 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/3] arm64: dts: hi3798cv200: add GICH, GICV register
 space and irq
Message-ID: <ZdNvqZiRZLYMuHqe@c528657181df>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219-cache-v3-2-a33c57534ae9@outlook.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 2/3] arm64: dts: hi3798cv200: add GICH, GICV register space and irq
Link: https://lore.kernel.org/stable/20240219-cache-v3-2-a33c57534ae9%40outlook.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



