Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A121D185E7F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 07:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455138; cv=none; b=FbpwM/K80APxKvcOdRy1FS2xjO33hAFUXhiMAOQDgpJJCST7hU6ZLC81ZsQtPA/ypYTsMBcy6DiJITMamHUA8cDs58Wwkp9JFsqL2b/vVACvq9HQUormj2r6lU5/1L39+N5dsWV6KcskygMoWJrYjCPEfT6HA1DtEtn2/rGovsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455138; c=relaxed/simple;
	bh=2j85195SkW93iZ/rCf62ZapKH836hXlL2BvYZexyalk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=D0Ift90xOTEzJchC39jXR6MsW2pfRFI00w3DXpBgSPobdrjxaQH2dphpIMmbGeMCsSGBsLvQb3PBNBXKLzFtWZ+lcdHL+NW3muIVIGWt2jNutjOaW/fz57kogmXq28FanlbuFBdMU0cdWRXTT/FjVjLlwgymZBx2FgJS/TK0xbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwb4vRxs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwb4vRxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749455137; x=1780991137;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=2j85195SkW93iZ/rCf62ZapKH836hXlL2BvYZexyalk=;
  b=lwb4vRxsDPwFFJDIIn7imHZwYibAZQDQHFIMrkm16P2sw9ftsMHjXFMY
   bz/wcmtjfuQXRSqdM9/Mt1dxAG+IIS8de1RvVEEJl4qA//HxVNQHWvBKm
   GzjggMcrlJeT+RFVpJ8KH8G8bpyBjf0F03Plzrh/LspNesefb9YkZ+sPK
   Ib7dP75I+s7/lP+3dIuadC9WVtgpvLWs96xc4YWticfbnHVddxeZCwFuA
   bC8XEWjhPn/k/8qsUm0hqkf2W3qM62oEMa3h+2y8nwUb1D6vKtB64x10H
   oXSl/rl1Rs5bA+ZVwsPhZer8018UCkUugHppvKxnH5FdyHqKZbbOfDnD/
   Q==;
X-CSE-ConnectionGUID: KxVWi2QERpCQ5ytAo0oxlA==
X-CSE-MsgGUID: UPE8DqZERJqAnLe/qbkolA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="68972604"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="68972604"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 00:45:36 -0700
X-CSE-ConnectionGUID: m69kYEVSQ+OcDemevERvBg==
X-CSE-MsgGUID: /N9p1xgwTRWvZG1P8WYasw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146322979"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jun 2025 00:45:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOXCG-0006rd-2q;
	Mon, 09 Jun 2025 07:45:32 +0000
Date: Mon, 9 Jun 2025 15:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 2/4] serial: 8250: avoid potential PSLVERR issue
Message-ID: <aEaQ__Dc5PSA5dQ9@902657ab729a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609074348.54899-2-cuiyunhui@bytedance.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v8 2/4] serial: 8250: avoid potential PSLVERR issue
Link: https://lore.kernel.org/stable/20250609074348.54899-2-cuiyunhui%40bytedance.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



