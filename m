Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDB450256
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 23:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707435675; cv=none; b=KstnWABbzT2SbhX5CxCERbA8TlBgjNjC4iHzdm4c1iajXB+YHs0X5GkcTUX4PNzR7b3foNj1sm8P866VVkvlhEmwHfUEigOAM0Zx1t+x7BKm5cb5kjYdCuWL5MyO5I0nEDYklZkm0WyX5hk4e83Nvw8BUV+H16+pgI1d9zLzrhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707435675; c=relaxed/simple;
	bh=hKTqmvrOB7w0VCGhi9z36HneQOE6CnwZzk8LP77mrWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=D9ozv+WcFOlRx3SMM1ILIS4gfV+iWYZPzyjhgh0krOVDksiuC9VNl400nPXovEDG9fnSXZpLuqf5G7XThuJa+jy7l9TyAZOL1U37hzwugOMxR78zVZB4/CrIyaZiSUZgt9iT9H4nqalg1AnPUx4ijWuUjiShsJv/R1SzD0M+AUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dawJIegt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dawJIegt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707435673; x=1738971673;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=hKTqmvrOB7w0VCGhi9z36HneQOE6CnwZzk8LP77mrWw=;
  b=dawJIegtbUjZp+fXjhLTfzGX9PCoGcrNT6VR72+Y71J6HWUYVNWXwjmh
   OjCmPDLyHZ4+o8wJOiM8Ke2xQupy+aYeci0MmYRY7UUukz+TpOdsRbYb1
   GPJ/HKMgPHTNcEz7usW7RFqEQIf2T/8Mjy17xYITB+OtQXGHS7iL6B7z9
   v6TeYkNlsRFTTJMMiOH/voxcw31k+mhW2CndZVSId9gLgQ2GD5HoVJAqk
   ytaQsOH9Wf22EGUGXPh3igRlI4Sps4+JGs75LBMd54fytv6EJLWstUd2+
   FKCO9nGKGQ+3eM7Qo5dNJdmhuu5oR/lzCJEpNU7z99HPAZ62KgJAP95E6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1228194"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1228194"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 15:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="910537215"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="910537215"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2024 15:41:04 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYE0s-0004D6-03;
	Thu, 08 Feb 2024 23:41:02 +0000
Date: Fri, 9 Feb 2024 07:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Catherine Hoang <catherine.hoang@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6.6 01/21] MAINTAINERS: add Catherine as xfs maintainer
 for 6.6.y
Message-ID: <ZcVmV-vL9CK8gpl7@2fb80f39de5f>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208232054.15778-2-catherine.hoang@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 6.6 01/21] MAINTAINERS: add Catherine as xfs maintainer for 6.6.y
Link: https://lore.kernel.org/stable/20240208232054.15778-2-catherine.hoang%40oracle.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



