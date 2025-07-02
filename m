Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC321E7C19
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 06:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438879; cv=none; b=LCtI6YhzhDZtf2jSr8xyu7ws03UYtgTFh8f8nooEP2DEKyyjkeBZpUVtCi8qrDUxC1KfmZtFAsd0ECT+i/xt5/TrzRA0HNrqxpBxWQ3masBaB7Q2BUSyrE6oAbIkiF6Nd8A6cfGLfhv23Ej6ojw1GGXSm+a+Kjyl2k+JclPSx9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438879; c=relaxed/simple;
	bh=gdeWcc5ZnTICXIQlEhUIR2i3ELkYAnKqTpq42gov/mI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oZHuERkDqEmneXA3/ceRIT6MVDhhsEgMV/isQGXqSuA+QUDQmjnH7WTYk0WEcWvUOBvR23NSxZXAfb/rVKgSbX9x2wFcFm79P9HUxyFc3GHlW0mM8OYj6O62DiK2w7qXBMhD0QAleD5Yakhb965bMkBmrVKdxqhJb98qK6G8+bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSI/MBBt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSI/MBBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751438878; x=1782974878;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=gdeWcc5ZnTICXIQlEhUIR2i3ELkYAnKqTpq42gov/mI=;
  b=aSI/MBBtYBLQ5P/4LDu6/Qb2wYpQ96A29Uiewx/k9If0qapUjU/hU9v9
   dsbKdyvP1GjKOpxB0LZTWIL1zSJZ+eb/8kRaMb5Hi6Fsi4iJCRlLKCRR/
   7H4FOB9ITcJyvlyYmHpxJcl7Qkp59WfuznI4YrQX/0lPNyF4M51ifELzv
   imWwQCSWWnqYd2ixn8IpXSKFIqoYxcJ/yYZTzr8PyrqJSqWohokhQ/qxh
   Tddpn2ZU7MULi1J7oNKVsZtD33D82rd1QrzbNwUt/RR/lzYblcO8rrW0k
   uRYPKou4/RqxRluVF+HOhD9+jadxBLh0yk9pxahNQK+wWm9bEZJ0IRx+5
   Q==;
X-CSE-ConnectionGUID: ynGUVQH6QfCnjZcosraBJg==
X-CSE-MsgGUID: SJJvnZTEQoWU+Emn6f2XFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57397240"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="57397240"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 23:47:57 -0700
X-CSE-ConnectionGUID: WMHlYBCsTlWOhGH5CeNg6Q==
X-CSE-MsgGUID: 3s08hZc5RyGRGzi1FWhYdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154148907"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jul 2025 23:47:56 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWrG6-0000H9-18;
	Wed, 02 Jul 2025 06:47:54 +0000
Date: Wed, 2 Jul 2025 14:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] mtd: rawnand: atmel: Fix dma_mapping_error() address
Message-ID: <aGTWFFVb1vQpB7p6@08871597274f>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702064515.18145-2-fourier.thomas@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] mtd: rawnand: atmel: Fix dma_mapping_error() address
Link: https://lore.kernel.org/stable/20250702064515.18145-2-fourier.thomas%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



