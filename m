Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44FB80C0A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726506385; cv=none; b=oyNi3/FXwDKItlwDiCitXR/Zuh9Q45gRBQodJb0lxkBlOMRb7bXnxMmC26mgVgSG/5Jc5NGv4UwDv7hCsvOeSlMHGKKiCeYZ/lJaT+l7oSllBhA/oQZrvOiBAWn3nG/ZIaBP8Y3SphtPpArNHLfyP0w9uJWbLBX9y3gz37xZVzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726506385; c=relaxed/simple;
	bh=U1mnWBtQb1ZiV8mOJDscZ1Y99BEJlPHKsHVdbhnUbyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qRPTRAivRrmTesoMVf8kYzGy+0JNCIfFHK6BVwi4uBLDfmLXblPaZ1XdiKiobNrg4lLV4+7LuZD3JxItGUPtX1gyy5UiX4Ux38LiG22T2z8oK8RLMwjgWct5zoOyZpyGs9FmVKtCydvjqEjC5NzmuucSg55HXgVsV2lmAt311eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBeka3HI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBeka3HI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726506384; x=1758042384;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=U1mnWBtQb1ZiV8mOJDscZ1Y99BEJlPHKsHVdbhnUbyo=;
  b=OBeka3HI5tjmn5Ptkid1QIMJ+d+s25147lYivxCd3WnFtI2d4Nlod7dv
   +EwtXVE5N45Woh4a6eiznGvHiuXsuhSaxlHaAS29d7Azq452VQX1M8bb6
   asonozrGybu3kZ4MYle2psfIMJb0wbJK/wekiG0hEzJiwHuO8WpUObkKz
   S13QQCCpV644BsD6nfhIPY5W+4KjAHDgIib7ymv31XZMrmBsBPm9emEIK
   KRSJkeqyvCgYSjhzpXslzhH8n3b8EKcMw9TaBqs4ZdMiDFjXWTApxvDOq
   Kb+NqQNhqNZoX4WLcbr1fxp+bvdOGeo+DS5dpca1t8nbmbJmHYfDFHN8U
   A==;
X-CSE-ConnectionGUID: vzWXa6SGS8i6RZSMCT0Tiw==
X-CSE-MsgGUID: dY2L0L3kTfGOwfmvybwGPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="35921802"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="35921802"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 10:06:23 -0700
X-CSE-ConnectionGUID: CNEUFBB5SE2gX2fh0PtF3A==
X-CSE-MsgGUID: qtt89Hp0QN+ANUV+3TZIDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68802990"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Sep 2024 10:06:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqFB2-000AKU-1y;
	Mon, 16 Sep 2024 17:06:16 +0000
Date: Tue, 17 Sep 2024 01:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] RDMA/irdma: fix error message in irdma_modify_qp_roce()
Message-ID: <ZuhlX8eeJhpKLU9h@3bb1e60d1c37>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916165817.14691-1-v.shevtsov@maxima.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] RDMA/irdma: fix error message in irdma_modify_qp_roce()
Link: https://lore.kernel.org/stable/20240916165817.14691-1-v.shevtsov%40maxima.ru

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



