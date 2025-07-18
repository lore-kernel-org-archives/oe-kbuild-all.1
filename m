Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686A51C860E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 08:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752827741; cv=none; b=qEJAmu/DKcYBPnqkOLWP1Dr14cqGd2848msRrKzSEntWugH2a2poEiRFi4x33QKbO2Bwv4ozX2N85bGDljecIDy+V76YWmYpfcp7Nia1sX4p5V2a3VH3lZdTf8dripFELrl234IxWdJIz3A6Lhb5B8SAwMtW+UnvNS6U2OIehtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752827741; c=relaxed/simple;
	bh=TWsknORm3ZLeHfMxdHLg3cJ0/9KGjglk6P5ewhVgjZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XLU7V5nCxKpuGhpTpbb5N3Pnj+0uM/b3g2XtXZaZ+Qa8ceG8JvpvznebdkVwZoYD5ZijGI0xbzqmCjY/8BdNfQWVHm8vdkeG/VnNObKI0h/wH+pv/7VYpbU5kZhdAaXko+/JgPkrac+LSiszstKE+374hbzeMFl7wutZw2HYlq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nL1JbOgd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nL1JbOgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752827740; x=1784363740;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=TWsknORm3ZLeHfMxdHLg3cJ0/9KGjglk6P5ewhVgjZ0=;
  b=nL1JbOgd9bg+ozzKQBPB8jTT3nfk5yPrtt5Y++/vlRSF5h97iBZD+TR4
   nTWltj0eXkx+lSbGu9x/bAb273PtjSLTkK5vaMDZh2uhG9kwMbz7SvB/s
   2I8sgvqJI090fiTafrp9QbYFmk9cA7+Lyow9DpgilK71E49KTRi8LtJ1f
   4vPNnKOSZ23gMmrD8ckLoMyGEW1APv1S1ZQdQki9EI88c1xUai5ZfEol0
   zdCsAm3cJlT/649HgoRPF9Kp2Ru/feOFjyfBTqg/RJOm3Ftaf7Ybq9bei
   kb9uIIA49TsRq6cJlrkHofZbV+p/8egif50Z8hTTSFTYj7KXqdMNvEsyS
   Q==;
X-CSE-ConnectionGUID: 3F0FC0a5RgCxgfgIgzd4pw==
X-CSE-MsgGUID: Ir9ldiBHQmi26Q+ILVBhPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="66566330"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="66566330"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 01:35:40 -0700
X-CSE-ConnectionGUID: f5Fa1VqLTlS8RFlvr4vT1A==
X-CSE-MsgGUID: jCoibxkvTU2AogCR9HR76Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="158573617"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jul 2025 01:35:39 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucgZ6-000ERz-2Z;
	Fri, 18 Jul 2025 08:35:36 +0000
Date: Fri, 18 Jul 2025 16:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/4] arm64: defconfig: Enable UFS support for MediaTek
 Genio 1200 EVK UFS board
Message-ID: <aHoHKqXboY5WIXGy@c1a0ab53bc35>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718083202.654568-4-macpaul.lin@mediatek.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 4/4] arm64: defconfig: Enable UFS support for MediaTek Genio 1200 EVK UFS board
Link: https://lore.kernel.org/stable/20250718083202.654568-4-macpaul.lin%40mediatek.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



