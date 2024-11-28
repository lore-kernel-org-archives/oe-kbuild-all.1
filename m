Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC84B19EEB4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732799359; cv=none; b=p7yymuBLihcekGPbSIBqyr/xdozkAp/CnFTgMgQH6LEn5ecd8s2pDModdf35kA6aqJmiU5dz4edluPxl/icNGo2uCNNXTN+yl3SreHcgLmAa4mtG2Y4M0BZKNVHYkqeYHe92abGV+ZXoNHHzlNkd3lzPCrZrOQyTOfJlH08OfG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732799359; c=relaxed/simple;
	bh=Xk1LmFLX5Cl0DbFiAm5KSvHGT3yyHRmzLUqdYfSZWRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=queEagpzu8OZV5Tp3TnGUDX0KNEJxQVIM/KxRNWedHg4Ivzc70q/7Uh2M8L1Rqw/88kd+t/DImYPQaXhG4aiyxybB67Ko3XRWy67oT5GFwclbGeRGN9EIJ7uVxuHWv0m1za652m3ponRmg+1w+vY0jUGdeXwaqtzUonXp9vALf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YV+tslAY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YV+tslAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732799357; x=1764335357;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Xk1LmFLX5Cl0DbFiAm5KSvHGT3yyHRmzLUqdYfSZWRA=;
  b=YV+tslAY0/GMAr49fk2ch03j1oZmKvmkW/jcuLFLOVFO9xrbHKlcXOcc
   FabO89JKGym+GgV97ZXuTbJE3SFM0VydgcomFrUWgaLvO+TVU5RvysRYG
   Q7rdiAk0I77EUn66hjE6AMEWO5hINiSoVs1HKBM/S6anpSh72OemC7UlI
   qUHa/mP8+5E5AA5JP1jQE1PoefvTUnNk127EuCLw3KDBw7vbR6UHdrYUQ
   GUoMf+U3qiM/rcBTDj9TEZUEOUUWQN/pGP+jGko/BiHBf7zDs0u0Mzkak
   83UBX/LLQ8X0EAY8m1OmuI+g6K4spp5N577hU0xf1BJzmBkdOzfSAl/m0
   w==;
X-CSE-ConnectionGUID: +Vk9qn07TSG3tulnqxnQtA==
X-CSE-MsgGUID: V7O8NG6CQKayqniwv5Q3JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43519451"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="43519451"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 05:09:17 -0800
X-CSE-ConnectionGUID: qyCBTyI1R9CQbjOQZD9L+A==
X-CSE-MsgGUID: QZU2cjE+TfKz4Iv/iy1uCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92104746"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2024 05:09:15 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGeGf-0009bH-1c;
	Thu, 28 Nov 2024 13:09:13 +0000
Date: Thu, 28 Nov 2024 21:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] regmap: detach regmap from dev on regmap_exit
Message-ID: <Z0hrccgbyS6ZQWqe@137e00dabd5e>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128130554.362486-1-demonsingur@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3] regmap: detach regmap from dev on regmap_exit
Link: https://lore.kernel.org/stable/20241128130554.362486-1-demonsingur%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



