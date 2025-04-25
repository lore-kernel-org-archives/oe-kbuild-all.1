Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E9D85931
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578327; cv=none; b=NwYgk0JWbmApJKoLNhgEX71hbZO2iaC3TlgHXyUHxKL/U37Hcw4vVQXMQvXE11gAVPGg9wpE9kEkdW3W/ND4A0hTz1J6p/0G4a7nTMsh5Ahg2cGowiWMgEBWvS65F/kEFR0+RZaJJIIl5KNmG8JRTm65tYTJigrGzuyf33g3tAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578327; c=relaxed/simple;
	bh=x1dZ5F2p+gS6/6i/04oJrPZaWxU2/E4CevnFlPspKCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eN7qkzjH4WYzAAO4fSIaawhNMU0JECLMNuFl0F34DskISU5oTIZx6llW34hndvMfqK98/ZWbSm7o9dCByTO/a0YBJo+FUTXV2tHw55nb8Go5lFx5ensclKC9v2FUJ361dfDt2k13Lw949VDLu75MMmBTf0Ig03no7aZ11vSnmMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hk1DnoS6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hk1DnoS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745578326; x=1777114326;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=x1dZ5F2p+gS6/6i/04oJrPZaWxU2/E4CevnFlPspKCo=;
  b=Hk1DnoS62xprxgsRz15hdmms3xkrFk6OmEEbGfw8/Dwz6miV8aiUAyRx
   r73meFXsfQ4ojDbwrqjzr6WawUoQkOv9VjXW+R4fkbiQQqfjyVZjMzFI0
   zXHBGWxUMvbb+50MQkzapHWimgxhX5YxQ/jdKx7YbWCVQ8p+tGGh+A8nM
   2P36JLwEiGEy5mXQLto5vTufMXosAm08hyAYCSm+GVNZ6ZJ7rdjPIwwjb
   yTC6vNljdh/Y6Q0JOfOXFJyKSRqNclvpyzMARuUYcVUERuIjEe3QrjvFt
   +1TSSt4bvc7ixhebMxoveNltX6UUeXgG2pSUQiU5nTWd0lEPqi9Cn/g2x
   w==;
X-CSE-ConnectionGUID: ks74lKi5TAO2buvwkh1J4A==
X-CSE-MsgGUID: KvKg11qeQOm63zpokZkUgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="72607540"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="72607540"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:52:05 -0700
X-CSE-ConnectionGUID: v1FtvTBAT4GyZiBQhOgjZQ==
X-CSE-MsgGUID: qq0Nmq1JTzKHHHhbZBIeoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137708457"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Apr 2025 03:52:05 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Gf3-00055F-2q;
	Fri, 25 Apr 2025 10:52:01 +0000
Date: Fri, 25 Apr 2025 18:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <aAtpLI6afZleU5tu@5d75f5d2dfb3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425104331.3165876-1-dongcheng.yan@intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
Link: https://lore.kernel.org/stable/20250425104331.3165876-1-dongcheng.yan%40intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



