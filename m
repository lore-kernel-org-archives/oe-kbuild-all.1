Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3698A1F4191
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760526440; cv=none; b=XYaU0RPmx8phXXsSONt1HpW2PbmVruWu2m8e3b7BY6kJ2Uv6XttG5Tgcu+Fr6Za+k2YLgNMAiugXaU7WKWw54XLg6j67CdJmhKDz5gtt7duokreUwtMR9/6MIbGuGFAe9yVFfSzk1nvDhpm1rtCULHIMRz+qb6MSWkSQrJZbROM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760526440; c=relaxed/simple;
	bh=Y5nFKTxbbVkj56KLZ71XtvPF6VV9QcTORMl084Qpxc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=o8AUZ7cJ7ZhPMX2XvvkfkYPXcSKYozgtRfRTkQeqV7u75/RKm+gDDHhbhpNFnc3oohU0N3MVA8w/pMMz8ESmki+byNU4bh3OYu1n1kQ56myOfPUGxsqG3UEc66L5FdVMdZLnE4+7WCrRtZEOyM8kVI1XnhwSNP2/iEG/eMhNDq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Td+6CVGp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Td+6CVGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760526439; x=1792062439;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Y5nFKTxbbVkj56KLZ71XtvPF6VV9QcTORMl084Qpxc8=;
  b=Td+6CVGpnRO6XzyN9psBP5IzdhbtFEeOaFQ/9YByEwrq8IRFXB5Uyi/3
   tdwAxyoHU2QhAxiGKxuNFJeel1Rty2B8+N2lgm9cGnsxNomrwCWo6Wwqs
   1b3PQePx9Fovt4td22p4p2P17kn0xNcaZoIVmo9UQBOG0D/LUPyEOJVIp
   8MJL9Zge2ZU8IWP012Hec1iBdIilZBmoc8GisXfPTTRKb9/yn1htqe35l
   WS2JOORnbrxnGBzF/S1TkAuF1xRuI4xmPxUaF84munISArcSnDP1ri3+v
   oC9isQ9Feo4Se/QlX1E4DUvUfsjErd2RlJI28wRkdq7lT88lklz5kxv7S
   w==;
X-CSE-ConnectionGUID: rTl/qIPjTnWLxfslij59rw==
X-CSE-MsgGUID: K/HAlQXgSHSLYm8A4Wu9lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62793417"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62793417"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:07:19 -0700
X-CSE-ConnectionGUID: ULJ+Eco1RMK2yzfFawHZFQ==
X-CSE-MsgGUID: NssRSdjoQxW9asBI0qr5Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="213089120"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2025 04:07:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8zLf-0003l5-2E;
	Wed, 15 Oct 2025 11:07:15 +0000
Date: Wed, 15 Oct 2025 19:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] firmware: stratix10-svc: fix bug in saving
 controller data
Message-ID: <aO-AN5Eq_ZqAAXJx@87a0c2f242e8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4c4906e48979514e0e365b7785988e79db640b9.1760521142.git.khairul.anuar.romli@altera.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 1/1] firmware: stratix10-svc: fix bug in saving controller data
Link: https://lore.kernel.org/stable/a4c4906e48979514e0e365b7785988e79db640b9.1760521142.git.khairul.anuar.romli%40altera.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



