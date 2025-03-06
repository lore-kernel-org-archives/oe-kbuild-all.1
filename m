Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960472E3386
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 08:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741249328; cv=none; b=PwLOAPs0nfXAaFmOdGKEMKomJQDN4rmm31CxqV4hC9EVgyQGsJOWzt7x3SYUXI5gkfaNo0b1cp2Zit5A2PWhgOB8sfgjVISHZ/xCgceJxmHyWSRhWBa6aV92Ig/74jXba4uS3bb2iUtAOHAqqOxtAgYScj7t2sre4wQ43gwViWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741249328; c=relaxed/simple;
	bh=wRMQyk1RPF6H1JA9cDHuOahiqFomEufm+naiuooc8zU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fjwYy2m1glIRIf/XvA3h5gTb5n9CbMYkB+3h4giC9dyW0rEgRaD4ggSWOyhm1ybUlc9kxvy/hftMTPT3p2DUEMvvBoUddLKb+Gt7ZCS9bEGgywLr91InzxPk54z0uDQhXXqsq1isMeT5zeKmgEt5r35MozQ3uA1adcwGAqOappg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNKpdnff; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNKpdnff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741249326; x=1772785326;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=wRMQyk1RPF6H1JA9cDHuOahiqFomEufm+naiuooc8zU=;
  b=iNKpdnffn2q5kNB81QvbDApOJK0uYXX1lwTlu5BcvGts3ZlmXxNNQF8K
   qCT6XWpvcjW3Mo0QribRZXU59XyCWwc7tXX/3LyJoAR2PWopVNmjxE6gf
   EG/PXGANkjsxYxEjMwgGXuhIrEYM4eJ/ZYsJxScexJF03eWtE/1xKRTlN
   SIWFehqAsuZ9HKSz+jo0QIkgsJ/PNNKWr/Ng7+SmAfqX0WUAbWCNV5njw
   UE5AujCYQz2ynUT+ZOe/te1eXN1VHn1qQDswdhDeBk3JBXWtg/hqY0fPJ
   C/hPX33D4dEhdSisu5MDF89mEoToYTZb5UyRCPtQ3sEoQrsa91Z9eqjd0
   g==;
X-CSE-ConnectionGUID: KVWHRh2NTZaHlUBvqxz96w==
X-CSE-MsgGUID: vN3i4JJdQeGUqnjiuOZDBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42381269"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="42381269"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 00:22:05 -0800
X-CSE-ConnectionGUID: AzPwlzR5SoCY6e3bbOtCQQ==
X-CSE-MsgGUID: 2SJR2R1/QWKbXEKUbnClEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119474172"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2025 00:22:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq6UT-000Mkw-2r;
	Thu, 06 Mar 2025 08:22:01 +0000
Date: Thu, 6 Mar 2025 16:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] svc-i3c-master: Fix read from unreadable memory at
 svc_i3c_master_ibi_work()
Message-ID: <Z8la-hy-cIKIUz2C@2dca5eb1bfca>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306081710.247247-1-manjunatha.venkatesh@nxp.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] svc-i3c-master: Fix read from unreadable memory at svc_i3c_master_ibi_work()
Link: https://lore.kernel.org/stable/20250306081710.247247-1-manjunatha.venkatesh%40nxp.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



