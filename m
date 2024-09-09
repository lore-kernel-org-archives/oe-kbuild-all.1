Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E95172BCE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 07:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725868279; cv=none; b=JAam55KJ+3zCKfKspDNEmmlidRKvjPHc80NBw+giQCrxf3Ij+bWc9kXnsIz+bwTUHU9a5ygAtLy2YLiDEMEv6Vt8x33JjD+xGURe0iEsJ3a/dzAcKMQLSXYwxoji9dqqL5VTWOtRL3N5luLYgCpphVaz5471lG2MqIU+Wq+7RgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725868279; c=relaxed/simple;
	bh=4Z9rO7eIPSKXCc1dXfCxwEtxcsJyS2Ot+zKnGm6iGkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=W1aDyWuyjuz9LpSd5YhMaFvjnt1VVClOyazdfyRhqGeqwFc57g57v7sfnyE5tXjdd/ARZh0HJw+xXMRrjal33DEUGqWFXicaERhEV7rIdZaAaljfBj68uoX0KfGabyECZ+wtK8GPv9KUS2/Lpbwhz3uSPKIMXawhoouyac45aPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQzTPGEF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQzTPGEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725868278; x=1757404278;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4Z9rO7eIPSKXCc1dXfCxwEtxcsJyS2Ot+zKnGm6iGkw=;
  b=KQzTPGEFXsebTd9TYDs51LVf5IZSfxPgKPyENrI/29zFAO13zn8WV4Jk
   e6a+8KrJVMGhX1/FL66PNdhHTaTud2opYG4Hx+gI261/fgvaXDLcf6zWc
   jT3ZB8AXbf0Xi7JVrZAgzSLX2xW59pPyXgmniwXEZcTfmgjpfqwtI2pZ0
   pjB8Md6neL1oQ1ZF9gZmTq3j/dj7m2tuDwfSzZwLm6O3i6VlVSv0Df3Y7
   47Po6P2I6J7cJEGXhqMFfLcQy41VHqyjWuTd6YSA7Fg0EI10cOoXWvNqX
   Ql4NbXNWi2t7FEtAmsftQdohE/rZJWtpuR5MBBUL/jrVvL11CQZk1UHih
   Q==;
X-CSE-ConnectionGUID: KIxHiCM7QaK1qNvOx2ht0g==
X-CSE-MsgGUID: 0FYbj7zMRFOHBDOnxtnAHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24654387"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24654387"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 00:50:46 -0700
X-CSE-ConnectionGUID: MLd9rl7JRLCZ1iccLYaHMQ==
X-CSE-MsgGUID: eipR/MCdRdCJZjLgsioTww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66211088"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Sep 2024 00:50:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snZAY-000EUL-10;
	Mon, 09 Sep 2024 07:50:42 +0000
Date: Mon, 9 Sep 2024 15:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6.6 2/4] riscv: dts: starfive: pinfunc: Fix the pins name
 of I2STX1
Message-ID: <Zt6opBhkO4lU4fMn@b20ea791c01f>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8830E9DA269F759D+20240909074645.1161554-2-wangyuli@uniontech.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 6.6 2/4] riscv: dts: starfive: pinfunc: Fix the pins name of I2STX1
Link: https://lore.kernel.org/stable/8830E9DA269F759D%2B20240909074645.1161554-2-wangyuli%40uniontech.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



