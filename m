Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51169957
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 08:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710231029; cv=none; b=r4hZaDf1/uJpg0VM4ENQfqDlc3svMvCX+l4f8xLxtMVKKV3PCnfjdBw3kQnKC1GADgZPzPMK0a784cp4TjmgAhMczsrvV4tB85biDR6Uql8XFUhH6I2NVup46CelKdYC2co+4MzeuR7BevuT6pcn7ODIyaLd3H1D68VaqEmQsds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710231029; c=relaxed/simple;
	bh=oW/HrpoLBXf/jhc+4ddDnipl+pTJ2hoa77acbQ0MBAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9bBBB7iS/f6rheqJ2dXAbM0uN/zczLhgOCsiRm5S24fzDn9eXFHatIU/IWFHC6zQXgi9K/TVFOcSkbmUWKU52x+xpLBVcgioXdBWcPTSM9BpH4U/DlVZnC6yJT3VpyCPeA02ARn4o/LIEHko5GibxNpGNPBp9HQWfI4J3HpmPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQdkIWD3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQdkIWD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710231028; x=1741767028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oW/HrpoLBXf/jhc+4ddDnipl+pTJ2hoa77acbQ0MBAY=;
  b=hQdkIWD3mzdgoFO7karhJoWbMhFpU8ECz0AeT+gZkvb3nJgKNpgSj7+O
   QmP4spedFMVa26odvO/B+4ti/pqUDojS48ZfjsXo5DDshrCNoGnng3QTL
   Hg9AAqCb7CcSBAhWUeKSJl1dZfJZeJfnVxa8/bAa4600IyH4yMy6t9hfg
   W5XrAnJDmBI5Gtpx3IOXOLhfKq6C5sEunmBEs2nM+1srmNuGcnt6P4GCn
   YT5X/JTb/I/6IEaQDvaFR3m6QRfGaO5GXPwpIHr+bp1AxxxocOqAe09m9
   obTvUM/GEPEzpNaXYhwggyh39GayPM8pGtJs5/Zwv9xskO0fVfebkZUyL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15563794"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="15563794"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 01:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="11380343"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Mar 2024 01:10:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjxDK-0009xf-1s;
	Tue, 12 Mar 2024 08:10:22 +0000
Date: Tue, 12 Mar 2024 16:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Snowberg <eric.snowberg@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 8/8] clavis: Introduce new LSM called clavis
Message-ID: <202403121605.UrOqJnRQ-lkp@intel.com>
References: <20240311161111.3268190-9-eric.snowberg@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311161111.3268190-9-eric.snowberg@oracle.com>

Hi Eric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on edc6670233a333ccfd1ec0548f068bd121d209c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Snowberg/certs-Introduce-ability-to-link-to-a-system-key/20240312-002925
base:   edc6670233a333ccfd1ec0548f068bd121d209c8
patch link:    https://lore.kernel.org/r/20240311161111.3268190-9-eric.snowberg%40oracle.com
patch subject: [PATCH RFC 8/8] clavis: Introduce new LSM called clavis
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240312/202403121605.UrOqJnRQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121605.UrOqJnRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121605.UrOqJnRQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/security.c:5327: warning: Function parameter or struct member 'sig' not described in 'security_key_verify_signature'
>> security/security.c:5327: warning: Excess function parameter 'public_key_signature' description in 'security_key_verify_signature'


vim +5327 security/security.c

  5317	
  5318	/**
  5319	 * security_key_verify_signature - verify signature
  5320	 * @key: key
  5321	 * @public_key_signature: signature
  5322	 *
  5323	 * See wheather signature verification is allowed based on the ACL for
  5324	 * key usage.
  5325	 */
  5326	int security_key_verify_signature(const struct key *key, const struct public_key_signature *sig)
> 5327	{
  5328		return call_int_hook(key_verify_signature, key, sig);
  5329	}
  5330	#endif	/* CONFIG_KEYS */
  5331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
