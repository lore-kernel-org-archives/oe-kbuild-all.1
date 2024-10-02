Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F5D1D0156
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727873902; cv=none; b=QotHdKmkmvjzS7+7J76JZUjY4mp/cJA/PzhhIJYkF+LELnm/ZpHMkp3IU5ZLX+n4BOvGPG5SUN0EmFT9BjJ+GWNfDuiQ4uKo+27wqptZ9o3J8MfmFDIhtB+93yJrcDaj39TQKekoFr+bgy4jJtPDk8UMyK3ESqmglXUr7k6Ftrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727873902; c=relaxed/simple;
	bh=iUr5ekUOIEryz1dQKI6ncLZxwuHeTD41wyXBbrWZwTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NDYPKmA8CcRvyZkryrWV7lepjlaigrsp5SepTyPzFdNsBFVvXYzHFtS97zFm5LMiha/O2XhylIFZ5zqUQe+WpXxedOJpQuVykxfQBPGi4siUNBmVnibP6AYH8TlEX6QkIfedgvOC02wGmup7ytuFM7iEXzIC9Fw1RvX+uemTK1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWNtZfPb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWNtZfPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727873900; x=1759409900;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=iUr5ekUOIEryz1dQKI6ncLZxwuHeTD41wyXBbrWZwTQ=;
  b=TWNtZfPbD38SfsLFqP4AOuikmY579UViyNaN5z0fE6Us12BEdORlBHZH
   BnkNpPRFenKnfRCF/8ZUkhFXt330mf9SDxiWqgLwuZaAEQRfOtcLSSYUF
   9yZ85Pk6cwKYmxMnWV+6haWxx8XPzuj6uggARfDDGkHr0YAVUDFAq5YoK
   X1cq+itG5VHcJSdIp8wAaK70Q7emjqeDItCTJ8rS05Z7lGHxqjwkNX4EW
   +5zYlFkDy+e+rHd2mKWQIgm3trhlPfguLyTXkUA6Yi6JWdFTjfpsclKrL
   cZG7K2trFlLqmxf209AcFvPzYsgYgHLV1km6ZjxmNIDCq6ZS5wvV9hVcH
   Q==;
X-CSE-ConnectionGUID: RqeP8FFIRKC7yDhkE/yi3Q==
X-CSE-MsgGUID: HvmE7bjpRM+rKj/uxDTMHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26909798"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="26909798"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 05:58:20 -0700
X-CSE-ConnectionGUID: ypLcYIksTR6gjPp5G4F0LA==
X-CSE-MsgGUID: 6qoCunAxQ3a5VmuVMg6aQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="78411547"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Oct 2024 05:58:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svyvn-000S2t-2c;
	Wed, 02 Oct 2024 12:58:15 +0000
Date: Wed, 2 Oct 2024 20:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Josua Mayer <josua@solid-run.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: marvell: cn9130-sr-som: fix cp0 mdio0 mdio
 pin numbers
Message-ID: <Zv1DMJsA-sf7gN-k@5b378fdd06de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-cn9130-som-mdio-v1-1-0942be4dc550@solid-run.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] arm64: dts: marvell: cn9130-sr-som: fix cp0 mdio0 mdio pin numbers
Link: https://lore.kernel.org/stable/20241002-cn9130-som-mdio-v1-1-0942be4dc550%40solid-run.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



