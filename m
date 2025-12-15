Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399E2314A8E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765795458; cv=none; b=mFfU7GlEQh8HJohqB83YPK7K1X3mJ0MkKTjUP9xapYihcarI0NSbyW8DnAW4KNwRZJMtbnE63ECkiEP+kFFKaxU7jA7KJ9SRB5lK4mady7lOH4qsiDTpbkm3UgUsHpn504WGXgT2vJhLkgak9O8kEdUnqP4gliC2EMhUVGVF/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765795458; c=relaxed/simple;
	bh=5VCpsFBhYZjRqLdOUTJeSj9xiu7RwW4lXKpkshqDwUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VRxLtLiS4CdMFUp6EkrG7HX80jsVOAk7KNC2UkbSIQtKY264JxhtBl+qrWHqpD0LsPVuvc+Q+JscKpHv0n3AfOIiNkbWNq4ZICDO1S34l3vUEp26vrXQRXev8MMeXd7TBq9TENnvG5m2aFFuYDh8OFZXAFYZIq7SaC3EOGCESPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QG1LC3xA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QG1LC3xA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765795457; x=1797331457;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=5VCpsFBhYZjRqLdOUTJeSj9xiu7RwW4lXKpkshqDwUA=;
  b=QG1LC3xATz/ngSDGJOsMjChnzXKHLiWTl8VzmvDYsy+ZODRp3CRSpCgn
   yjoGaVCEO3q6WCoiT3DS4aMSC8/TKAWwmVI0usDudToJ4NlnbA83EdT6P
   3OaFWh4v0carFPS1v/GzAhjfeTp7GNoz9+z2IaIBKiuvPhoHB/Y3dJdsH
   sF/V+UW48fDqOjrl5aH03HQkaA8k/A5gDuKEvl8lqn61oQhBCiF5DpvE8
   uJqsXjjjoCsBPQvDoyIBRsw8thHwTkjnwDGpiNrnYNDgBHGkTsEhaDhZl
   txfIAeyR/c1XDe+ry4fvmCP5kAUny8QOc7UKMMUq5KwH2iQvYejYWvnGf
   A==;
X-CSE-ConnectionGUID: ZRaS5HSkQOGaVlnmAu5PIQ==
X-CSE-MsgGUID: c7Uat4BkTtaJuWG6y/K2WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67763138"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67763138"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 02:44:15 -0800
X-CSE-ConnectionGUID: sTOBZH1mS3yCEIJUSwq9kA==
X-CSE-MsgGUID: YxI+CpwoTCap0rBxsoGAjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197580835"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2025 02:44:13 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV631-000000000CD-0Jnl;
	Mon, 15 Dec 2025 10:43:51 +0000
Date: Mon, 15 Dec 2025 18:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenz Bauer <lmb@isovalent.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] virtio: console: fix lost wakeup when device is written
 and polled
Message-ID: <aT_mJshz2YRNsHsH@73f44f95d416>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-virtio-console-lost-wakeup-v1-1-79a5c57815e7@isovalent.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] virtio: console: fix lost wakeup when device is written and polled
Link: https://lore.kernel.org/stable/20251215-virtio-console-lost-wakeup-v1-1-79a5c57815e7%40isovalent.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



