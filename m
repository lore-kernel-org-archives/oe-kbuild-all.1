Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AAC207E13
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523106; cv=none; b=KhVdhiPQCHPPCAx0Xl0m08ZDdTFtn6g8pRg5BuVu21DD0SMfZXUkYuTgaVFApeUJo2fUac0W41sRAJqh9N3dE5HdSgrXtAPGlRyVN5iJg4vOsQ/8EiU3pZP6CPB3Hk3uEsABKL3c73EVDG+ke+mLyuXYgZKvn8+vwP68JrP0q7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523106; c=relaxed/simple;
	bh=+YP0iLYaQDBqPZpkGOy6Cp50BxgNTyf6FaLOCF05fS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UnYB00ghP9jQCmiqYiX/00TWgYRYzfCgkpjcssn5Jf24Tr8rf6doZICFt+q1wpZmfalXI8sBCgkTr3hVmWGX8LLduzGrAFalBreMPptTPpxcfAQJI4zlA9WMGZEfX5mhAZpmk9cTEeuKP3VoL9bnjW9YtMObBDxmb3ibK51wTI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvvH7AJ0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvvH7AJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739523105; x=1771059105;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=+YP0iLYaQDBqPZpkGOy6Cp50BxgNTyf6FaLOCF05fS4=;
  b=lvvH7AJ0Lf83CoY0wuaY75ZYo3Y5oOTEaIWBwtTSQBy6E4qGB0Au4/TU
   N4nitWfCzvRiPJ7QT3TT1r1w+/OfoGS2NYketFzRCgnBd9tGM4kY8xgOW
   xTGIPdOgHt4ge/TGtTPXprj9Nkx2AoBGm8nbgVXunM2f/6BMAu5+vmGpI
   A6D2llT9A8om9KxoSws5mg6DndhxYw3CsooQIvlJEVn0h0d0Aix7Q7zQR
   yCqx2l4bQwvjh0lhi9kYYbUr/xLqdgcl5KZ+MqIBJXbtfXCXFvlIY/iZd
   stR2f0y1pk7whVZppY4ssTdnSjpLJ2qN8oN9ggB0RnhrS5pJdE6Uhwxhj
   w==;
X-CSE-ConnectionGUID: UhaBOX96QiObhwo4LIqQGA==
X-CSE-MsgGUID: tugKyTj9R4WcdT8yIhzmqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51239990"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="51239990"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 00:51:44 -0800
X-CSE-ConnectionGUID: TVwmUxywR8aWmzpB2yQTnQ==
X-CSE-MsgGUID: CGTdao5MQlS6/z407H9HTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117532044"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Feb 2025 00:51:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tirQC-0019I3-2M;
	Fri, 14 Feb 2025 08:51:40 +0000
Date: Fri, 14 Feb 2025 16:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt6359: fix dtbs_check error
 for RTC and regulators
Message-ID: <Z68EEQQH7QFyhuid@4f51b8f948e0>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214084954.1181435-1-macpaul.lin@mediatek.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3] arm64: dts: mediatek: mt6359: fix dtbs_check error for RTC and regulators
Link: https://lore.kernel.org/stable/20250214084954.1181435-1-macpaul.lin%40mediatek.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



