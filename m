Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD412A1BF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 02:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733279761; cv=none; b=dqvlMviHDSfbQcvY7YS5d083/OPbB+Tx+vnwlac9u1s+mqCcWAC00k4/0CHxQHuYjLmVnvZU2H4Sg5c9gRP4lBOhgAB+Nu1ScwM+wk38PGFX+8TKjFmoP3QPbuDwLHFDQKhRv03Hz/+RBhSQR5y9GXTme2HxDlTBh03HhXxur0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733279761; c=relaxed/simple;
	bh=EMxVVaiTZDUpskoyKOjfeNr4D6EYM/zt49lKZepsXiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RNnx90BPvrtgBnjqw3MOM7QYhCeQWB4TEvIlu/oWPcddkFzrjJDrKS/pxbpjGbuFBBnR2R86xaknBOFCa/wViOPA8EFSlsaLTeYf8KFXHzzKyRn7GaHw8o1RCgD2ZCPuDURX11N7ytbb3OHYXZ9RJr396J4v+OnwF062Cw5GUEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuxjR4fi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuxjR4fi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733279759; x=1764815759;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=EMxVVaiTZDUpskoyKOjfeNr4D6EYM/zt49lKZepsXiM=;
  b=OuxjR4fiy7ggxWOV33BYNsyc/gtTH0S9myGcgYy0NvRv7rt7u7Tz2rZf
   EWJ1xaWb43OoN/HwGZWv6FhyYieC29df5CvkYUkMmlG4nkblRnlE13gDV
   N6ZHYPWSGrjud0w819cPXC+GHoZ08WCMetA4TuTpBanqXktHaJ3DBuyLV
   Zsheum8u5KOH0yazQrzo5WnDcg0xLGyxwpT1X47aUCvie3N82efSfXNE1
   EjZ+lMUfDJMVSW0k1imk7twfQ3Tiefl7iP2DbyJ099eCJlHHvWX9R/2gF
   +xkhD3uH5ULJVV/ltXau2vKSU8aR50T/VMI1lRIuUckJfeHnGVhrXRA8q
   g==;
X-CSE-ConnectionGUID: 57XfVK3OQL2fPPt+8arzIw==
X-CSE-MsgGUID: OfaGqZuCT5G3/p0x3GIUOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44188445"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="44188445"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 18:35:58 -0800
X-CSE-ConnectionGUID: 8STPW4WZRim4D+41/WdgRg==
X-CSE-MsgGUID: mHEpWgxyTEyFeWa0Ge+HKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="93487670"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Dec 2024 18:35:57 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIfF4-0000Tx-2E;
	Wed, 04 Dec 2024 02:35:54 +0000
Date: Wed, 4 Dec 2024 10:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: Haoyu Li <lihaoyu499@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drivers: gpio: gpio-ljca: Initialize num before
 accessing item in ljca_gpio_config
Message-ID: <Z0-_6IozdnJjOAER@24ad928833eb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203141451.342316-1-lihaoyu499@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] drivers: gpio: gpio-ljca: Initialize num before accessing item in ljca_gpio_config
Link: https://lore.kernel.org/stable/20241203141451.342316-1-lihaoyu499%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



