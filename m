Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAD04B1E7A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 00:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747440044; cv=none; b=uYMqtAzpMNH1F5D8uyEkuBZNmSO1fGXjPZPByjPCY9VnFgxO7BQWNtR5RPFAEH2jzBuu2U48LDU4G8pqLOMC5lq6GsV1xasixXYusRbBPC+tee5bJKNbMoXpc5cBRtKicREtPQRXz7Clh9uhF4+K815vPRra3WGyx48NmUVokCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747440044; c=relaxed/simple;
	bh=9tw4MfudjKnpiqwmPcods5XpkbREKqLBsvfX5UK4pns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KlV1cmd3KSV5TO3MNbIEhiZhLcpe0gf8yqo9xM24K4vtIf2ZtJfgsTOECIfuDAemHmwF7JB2oTSgzuDHUG1w59b43YD1n7NTGYS0RikbqXkWVVcHWJhVoBpUWqp6zUpfABDPFADXxfxM83Pj/3tPzKXUGeOZkCbUDEZHtbaXEAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiFO8vao; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiFO8vao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747440041; x=1778976041;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=9tw4MfudjKnpiqwmPcods5XpkbREKqLBsvfX5UK4pns=;
  b=CiFO8vao7S9jMvK/wUEPgGm+gKbUQr8OwQP6Ke3/yw3MgQs91uMu7ERH
   096Vh1Bcq7kCJrqx/F78CMqUdmj+PE0/AszXRh85aRpOwYMbS+1XsVyq+
   Omd9X1OVCw9LkhfN5TrX8OUwQdvAYNXo0i2yNlA2aOYdZBRDrE8wisAqo
   qF6cY5vOmp9n/xzUP7aAbDe7QKFTbgPZ7SanonQQ0zwTkinRfkfIr4pRb
   LNyq9Lh749HhyOchsUSRLE3UmD2zM3Mr2nHlpL1agkm1Ifg/d8dMgv/7O
   FuTnukTY+GUp5JBArjFwo1SxIMR+iZtvttRx/mtIKzHOBHGfi7KgkBxf+
   w==;
X-CSE-ConnectionGUID: O2olxb8BT0SnOLr9SgRB+A==
X-CSE-MsgGUID: 7VPQQ1RGSsinxIohNCLOUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49531090"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49531090"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 17:00:41 -0700
X-CSE-ConnectionGUID: fqMCVoNPQdW/YeCvP1PEDA==
X-CSE-MsgGUID: 7nGddxJpTvWi5CiYIVo3Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="143705384"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2025 17:00:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG4yk-000Jnf-0y;
	Sat, 17 May 2025 00:00:38 +0000
Date: Sat, 17 May 2025 08:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: mhkelley58@gmail.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] Drivers: hv: Always select CONFIG_SYSFB for Hyper-V
 guests
Message-ID: <aCfRnBTuKB19578m@8c81029db2be>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516235820.15356-1-mhklinux@outlook.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 1/1] Drivers: hv: Always select CONFIG_SYSFB for Hyper-V guests
Link: https://lore.kernel.org/stable/20250516235820.15356-1-mhklinux%40outlook.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



