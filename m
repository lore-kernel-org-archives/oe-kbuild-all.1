Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1731B1511
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644250; cv=none; b=Ku20iug7q+/32tIdWthIufxaT8JzqHxywVn6NdDom+aB3oNE2njWlnlkckIaLuBkLZfmSFSafoCzW0Y8HdtWkOFy1x5WB3MVHteXj8w3ejUmu0l9nFhtfRPlnPXDNYgPJJW1aZ/QO5c7hgPwXuyGWsOuLRkWMKSkzYmaDTaqG78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644250; c=relaxed/simple;
	bh=QItrFE+2vH5ywOqz4YoUqLUjkZcxMPAa5wns3W0o4yY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IECcEPbXohF57xqI0NRZjkdqrrCjYRGS7/t1+fqVc7FgfoljQlriTsLUP5/l1wZoRIkRqfcuh59xSQ0CE95JgKfOF6Nae+0pKo5sZdwbA+2ORD5jMch4ifQfzzZuEtd0p/SYczTvbsngbeW7H2O+6mFIduX6SbSU2jCQHz4r7XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAAhu5Jt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAAhu5Jt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723644249; x=1755180249;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=QItrFE+2vH5ywOqz4YoUqLUjkZcxMPAa5wns3W0o4yY=;
  b=OAAhu5JtJTri5pvYti/nxUOc4RM6V22ewgmG5Lpj2H4F9uaYFq0Haeu4
   fHiFtnYYOiKjHeSoOrpk0+kxZR+paYx7576dTkGXfvaR6UNzJZ7CJJcSM
   8dGzHbVZpb8Be6HIpVt2LvEyANjbyLOZ+u14xfbCPoWG+2q+fvIi5ew72
   wFcqnRFfGRgHTyy7CeXqFe21vVwysABR19agTh/yiHsDnpSGuHpDy3xRl
   pVBqzj/1eHd09AjBnjd2nqMEOIhCEzCsNQ1ICRHZY/jTdU9riZDDcKcf6
   JX3edf8qA9M8FjaThkpD784LsoxH8JegKlcdkfdowU7cjPEzD4vwaWhMX
   w==;
X-CSE-ConnectionGUID: 505seqT8S7OLYZPd17MpsQ==
X-CSE-MsgGUID: oUo/ELTzQVmrQfaV653ncQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32540352"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="32540352"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:03:57 -0700
X-CSE-ConnectionGUID: t96CtMd7T9SEJimwLf11CQ==
X-CSE-MsgGUID: u4fMMlYcQk28iyRgFHFnpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="59161324"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2024 07:03:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seEbQ-0001ks-2y;
	Wed, 14 Aug 2024 14:03:52 +0000
Date: Wed, 14 Aug 2024 22:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5.15] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Message-ID: <Zry5QzRLpWj-KotY@6301b87c729b>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813113220.1837464-1-ruanjinjie@huawei.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH v5.15] powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.
Link: https://lore.kernel.org/stable/20240813113220.1837464-1-ruanjinjie%40huawei.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



