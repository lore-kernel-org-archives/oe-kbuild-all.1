Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2507238397
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jul 2024 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719828508; cv=none; b=qPyY29AHPtU5dHPMVhM/1613HBZvUgff00vN672CeNq7BoQlDbV+9RATIpaMda3CmKcHPJTMJ/NsR0I3Phl7e+M+8nLYJki9x9YV/j/5dlpHadEmLzvzOfE6Z5a9kI7+hes47Zu8xc46sbVaOyqRtwCWz4iqyzf2oNDs+VSwjWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719828508; c=relaxed/simple;
	bh=8rL2IL0W+mPK592C6mWYFGjuJzfcAOvCVkO2vpkdCpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NB/2qwZgzVHKHV2S7XeJ1uuoZsAW3vvBAnnENqzcCEkwt68faBNYielkdZqMmnWEtwyFD6MuJg2hNmoQWHi4Qw6kiyurTzmVcsLzxEwi7ZQdR5l0SIcgqxIy3UNzD8VWZKlkkoB63xNW3gQ53gMarZEN3hlhxFFwLzY2ATUp8w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvErfF31; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvErfF31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719828506; x=1751364506;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=8rL2IL0W+mPK592C6mWYFGjuJzfcAOvCVkO2vpkdCpI=;
  b=SvErfF314fA4zth99NsfjdYwREzD3f8/zWTiiBp+UEI67XQ7kJNqAb4Q
   RrKVxygFoZmI9/pJp7DcmUbePxUbjg3oj0mN/6zKaa+F1bi5gveZfwWH/
   NfetN2YDIBJiyobVRBDe3vgh9ypgHwRcLWLVwbEnihLLoE/U27dLq2tPQ
   D9h1wJwloVGuG9cwbMWMqW8/oO8DOm4iN7tzrOJ9jT+6lCzqGoZgBOTNZ
   UkJtoG+2RdqklzrdqX4RxxQ68N5riJYC0OMdpCJiZvKfcLa4vwEhrjcKk
   Kv6/S+BgdH/slBcc9lqytopVeCKzNQSkAoNl8j1hnQgGb08chsH9fZK0B
   Q==;
X-CSE-ConnectionGUID: Zo3cndM/Q8yHpiBNL4Wv5g==
X-CSE-MsgGUID: CIBrGsduRT6U/m7plbmu+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="34488789"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="34488789"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 03:08:25 -0700
X-CSE-ConnectionGUID: JbpYq9/TQJKQsXKfBYrS2Q==
X-CSE-MsgGUID: 95VrGyT3Tuuh7uxDgoThVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="46134359"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jul 2024 03:08:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sODxN-000MiC-27;
	Mon, 01 Jul 2024 10:08:21 +0000
Date: Mon, 1 Jul 2024 18:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-net v1 1/1] igc: Fix packet still
 tx after gate close by reducing i226 MAC retry buffer
Message-ID: <ZoJ_6HxxmeoDh0HS@6724a33121ae>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701100058.3301229-1-faizal.abdul.rahim@linux.intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [Intel-wired-lan] [PATCH iwl-net v1 1/1] igc: Fix packet still tx after gate close by reducing i226 MAC retry buffer
Link: https://lore.kernel.org/stable/20240701100058.3301229-1-faizal.abdul.rahim%40linux.intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



