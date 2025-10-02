Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE61C2E0935
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759404541; cv=none; b=t/FHyA48o4kpjD5nRrA1O91E2iW8HyUkENjshX+YrY2bbGqlcJ+kJT7Dz50sgxY8Y/nHsIwxawZ35ewTj0svEHfwZVo0U1ZB4HMeoq5TA1KexeRJTgogd7XSAhsoqJ2WzKN8CPhY/6XrERLFsj/VpyV9nAodNpa3QwISHwqkE/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759404541; c=relaxed/simple;
	bh=z+7y5OyBPN8GP8m7nmTr8rMsKf0oT3sBrHE2R1LhcEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qh/m68DIO9IFhdpETtfFeEZgtSXAxl3z97jEKgosCYMQtNTfBlrdEIzhgEVCGX4KMSsl30zkNlxX8gJSKGnp2bUDLjPjWn+k47xo3dZh80SWvWSi/9p2jqCJS5OVMCdysb868uAr//6futXpzY16YsIJB+EUCVIxz08y/h7/ntY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2700Fna; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2700Fna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759404539; x=1790940539;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=z+7y5OyBPN8GP8m7nmTr8rMsKf0oT3sBrHE2R1LhcEk=;
  b=f2700FnaqDioGYuwGXN6xOUwDoHubicWPeBW2oJSn0TpMO2GMeQoP6lz
   tEyuitEj+zOMoHVAjTjLAXMrM6MCJjP2q8oqAXFvML/oAymUvZmjKcdVA
   xHBQWj7vBDuspoP9BWMrPxgS0z+9BWO6uG7uf+X0tmjbOgDRV9mrEqsDa
   YNNU+qgkeq/OQOCyyupYW4QYTa8RhlcWfEvY2RK3i+iDbOgOdF4jZzQdK
   nikjJWXhOdv2WOi2P8+UknZrTk/10DmjKR91RDZ7CRO/CERxDSDyR8JCG
   Ejgkkl6k7aivvIbwuhG6e6H81WndGpFgRFWeyzfo83rhzUs+TF4heaUH1
   A==;
X-CSE-ConnectionGUID: R3ar0GtGSfWNh46UkWmcDQ==
X-CSE-MsgGUID: mVv+2pDZSviQQuqC9oNRnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61646008"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61646008"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 04:28:58 -0700
X-CSE-ConnectionGUID: cYC8P1G5SzWAMUicdD4vAA==
X-CSE-MsgGUID: 1JFQQQoZQlajpKs9vkzxHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="183432205"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Oct 2025 04:28:57 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4HUU-0003lt-2w;
	Thu, 02 Oct 2025 11:28:54 +0000
Date: Thu, 2 Oct 2025 19:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] stable: crypto: sha256 - fix crash at kexec
Message-ID: <aN5h0Yi9jTNxffMM@7173c95510e7>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-stable_crash-v2-1-836adf233521@debian.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] stable: crypto: sha256 - fix crash at kexec
Link: https://lore.kernel.org/stable/20251002-stable_crash-v2-1-836adf233521%40debian.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



