Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D11F0E28
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737410220; cv=none; b=rJ4gDh6OP0Ol7Thc/z6XSQ5rIdt/JFpAV/YkX2UAEHKF8Z1w48Ny2WcpUdlkwQEL+wX4KtbPhekuy0+yR7J/Dezj9ZlrCQ4KdytkDYNDBz7x6km3dUGZ6SH02/kPh/mHbzOu3R7K6kVJts+Ry/J3jCiHp4waeZlljFrzLDxBG6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737410220; c=relaxed/simple;
	bh=+EFqRv2B6bqOUlGn1H//PxFNhb+WsAIIPmOfXe+iHC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3e+EFyeQ2/EVwU1sPTh/1536A6xZZidng2C2LAKoJkUo3HRv5O8WcqG1v4a0kN1pYceyOkz5xatdJxOz4x561ID/6Tn/2q7VlV1E90hbUK1fPM8OizFQRDeTAgJO0TJF06jnyXvUpTpgczsR5A/vmaKa4KV1FgMowWHwemDwic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRRUpCKG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRRUpCKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737410218; x=1768946218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+EFqRv2B6bqOUlGn1H//PxFNhb+WsAIIPmOfXe+iHC8=;
  b=fRRUpCKGDIbLz09/ETXMPd5weP9cXTRgo9xY612Z/B29ltJbWQUIs+hr
   gN/h5BcZsP9fak3ToiMXA+ETqoU0sRKoyHDisRzw9IT3y8CG5NzJHf+QP
   NAxDNYICF2A0aL9xW8D/NX+Hkt6aODM7PZsRsT3os6rbEZ4wUbLaq42Ev
   A+8elXtNE5CZNzcQCNCVqrKCDp49eAz/tefh2XAVebdY7CeDF+ua842os
   3ZigRZIP2ZTAFJEgYHxqM+7QBTA9B+ghAsB/btPuljuVZUmHaZKDs4fuk
   F/nzvQqR6QwSmzmAWjMIFNa8whLjW9HZ7Fa29AYe/DLzHJvl7Ljssi8w2
   A==;
X-CSE-ConnectionGUID: pnZE6nx2TxWh4Mjq72OQdg==
X-CSE-MsgGUID: jpmA6g/lTX6CHp0WHyS++w==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="40629211"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="40629211"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 13:56:58 -0800
X-CSE-ConnectionGUID: laPeCXdRQ/G3Fm2+VJSATA==
X-CSE-MsgGUID: ZjP2SWxcQoqHHk8fpcJepg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="111612110"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2025 13:56:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZzlL-000XGZ-2v;
	Mon, 20 Jan 2025 21:56:51 +0000
Date: Tue, 21 Jan 2025 05:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
Message-ID: <202501210513.GCec6kts-lkp@intel.com>
References: <20250110074458.3624094-3-christianshewitt@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110074458.3624094-3-christianshewitt@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13 next-20250120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hewitt/Revert-drm-meson-vclk-fix-calculation-of-59-94-fractional-rates/20250110-154701
base:   linus/master
patch link:    https://lore.kernel.org/r/20250110074458.3624094-3-christianshewitt%40gmail.com
patch subject: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
config: arm-randconfig-r072-20250118 (https://download.01.org/0day-ci/archive/20250121/202501210513.GCec6kts-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210513.GCec6kts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210513.GCec6kts-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/gpib/fmh_gpib/fmh_gpib.o
>> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/meson/meson-drm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
