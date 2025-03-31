Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71301CAA80
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407436; cv=none; b=bYBpdXCvM2yJAyLo3PM9+gdq+7vP85DyyNSzviVFWBZ5ECuxnF2MOCKUEKdZ8eTjBRo3tzYzr1laK/B5OjvMciU9OaH9nCbvTkoDHFbgxzwSKNeRt/cig88taGEDXhHs7PKbU1SrZWG9MR49vd82MalPKbiYrAhaz8uVuB2+lNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407436; c=relaxed/simple;
	bh=Ay+DBSn09gRJRUD/1eVGW53zGuJbkj0V+TZ3+r1UmbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UwclbDEzB9NdOhTOGUMAX4SLWcABhgF5jCKdyT+mgDDcNi1pUdAlAeKluMcvne4Hu6mS4+Fq0GORm0GmrAKMqmMAYoc5D2XO/fHpPC2NA9/+fi+9QMHICnkG/iZij8gG8N3orEW12WAhMghAXoajk89Jx3gbJPOTY4QNsmBHUwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqOQnQX6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqOQnQX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743407435; x=1774943435;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Ay+DBSn09gRJRUD/1eVGW53zGuJbkj0V+TZ3+r1UmbQ=;
  b=UqOQnQX6p93ktXaQjv+rGNmdMiwWLawToK4Qh3fjxUFshzzhMjZmsA0b
   LQys+lIik13O0SXf2FZJPi0d7n0/d+2hAd4oCbFXi1HQglmZTq7fu+GIF
   NT6QrRymNMITDOzwGwo3qG8lzZzsp+RwF3qpwY9N9POBnCoaTXitmsWLl
   h9+mM4S21diYOr5GUZnCKqW++l+Oo/jCvzfjUoBY2ZZGOcbwoEg1EKg8u
   38PuaaeZblVFHRxnUdwZc7x5eRhn23QoHD/QEc3Y89qX+EO2YtTmZzfGQ
   XlBo7OhtvNZ/U0rMcQiJKJ/uKX2yOFybe6840zEGuGntY57S36BmO4mX0
   A==;
X-CSE-ConnectionGUID: DXGSDKhkR/ekuxUhEgTmLA==
X-CSE-MsgGUID: hiVmL/ETTdaOiPirgMHt8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="56056396"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="56056396"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:50:34 -0700
X-CSE-ConnectionGUID: oF+ScC03RhqPF51IdCKQTg==
X-CSE-MsgGUID: FwhYG3dbRdSVNvUjjtgXpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="130860498"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2025 00:50:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz9uf-00097a-3B;
	Mon, 31 Mar 2025 07:50:29 +0000
Date: Mon, 31 Mar 2025 15:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
Message-ID: <Z-pJLLzjbfkTez38@42be267012b8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331074420.3443748-1-christianshewitt@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
Link: https://lore.kernel.org/stable/20250331074420.3443748-1-christianshewitt%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



