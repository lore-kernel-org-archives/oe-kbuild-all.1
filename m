Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2442765CE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 06:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756102349; cv=none; b=MjTLVFs6QnH26yP914eGgEYHwbj4O0vxxAJOsaBK3hL5Kyv/63DXoyZfrVzveltprzSOYd/lVf2D2O6VXXCj1JnC59D9jFoBpQTM5EuDfG1UtQuX1vyaEbDGcybE8enNBXPHLqpwgkU89phS2ERVKimM+GhsvS7qHmtx+dTZ/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756102349; c=relaxed/simple;
	bh=yzERzkgSZN+ssuVKYJtPpXzBNs7h7s0Z1YZmrDPLu84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oEBDXsVpTZqYz31u6FU+cRQ/vaNvxvt4lviq22h0ONznULcfoGfjl7UBQoGh9I5FqcTYlFw9BcUdu2t5IhA7erELe0QaQYY0cmNu4YyySwo/pZij2CdEnCesoNFiuhkHc+yEFM1I9hGu6/t6CHEkO0zdmKKQkWl6HmMnwpMeS28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEB2MfiR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEB2MfiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756102348; x=1787638348;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=yzERzkgSZN+ssuVKYJtPpXzBNs7h7s0Z1YZmrDPLu84=;
  b=XEB2MfiRfMmDxVCokqXpwsovsLFIzch0vLqRoBWLYta9FXlG+8LdHKKk
   AHK/gPhfL/EE8d0c27L7MM6S1DxvAZ80cn7dpc5kGSqpdxamUEX8a+Q3O
   toADThR5ZsU+JcRCvEuwS/697JPSl2XIrSR+i47vGIZpLb9bv0NVvSRy6
   ElKAwZYJK17ZhK6+trb4UYbEFRKIR9JFoi4u2UuBVkOIzIVnHHf29HQca
   zHyRehLt1VpaN925Sn919woSS7/9BglrxwZ3tJ7DbjKtevK3rgMcU6E1M
   9CFQnQ/Q4hTzMagpwibHDS3KkUu30cB6RNSmv/CMHpRVsKO45y92BuBB5
   g==;
X-CSE-ConnectionGUID: HaLDLaMXRKGVWDTaZudEKQ==
X-CSE-MsgGUID: RhRoCDFkSlivn9HIe/cNEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58234440"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58234440"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 23:12:25 -0700
X-CSE-ConnectionGUID: s9ziHGjuT2GMfl/WnMIlOw==
X-CSE-MsgGUID: Ke9PdxVSQd2mh4QBl1D0GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168418069"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Aug 2025 23:12:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqQRK-000NPH-0J;
	Mon, 25 Aug 2025 06:12:22 +0000
Date: Mon, 25 Aug 2025 14:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Maes <oscmaes92@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net 1/2] net: ipv4: fix regression in local-broadcast
 routes
Message-ID: <aKv-ldyAwo59fwaD@13ae35437deb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825060918.4799-1-oscmaes92@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net 1/2] net: ipv4: fix regression in local-broadcast routes
Link: https://lore.kernel.org/stable/20250825060918.4799-1-oscmaes92%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



