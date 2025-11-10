Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9149731282B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762782953; cv=none; b=l7FGKzF+uHfH1RANlrzfH5j/TLECqiYcDBbR/XaQdb/oah4dhYWUrEyqliy4m75/X+gjIZk1UPPpjX/HGZdG1wQRhFVksjG2p8F29qtxwHlhO6+vefHUGAWwNt0ULXRf7fC9lX3brUQR/x9itwSjNfCQxJCuozwEFUI/7SJWYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762782953; c=relaxed/simple;
	bh=gW2ZOdjs69+a5A2fYMNn+Zk5oLIl6pB/BV3i3DzqR/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=pcpRBRSdY8uTMpuL4tCA1qGnrgZh2cN8kf5fwgwMiDxoIs5nJJNQV7FP/fnGKnkF+CadgfN3gZI49VxP/VP0fISo12duKeeffpZSRlY4g2zwZ8GXykU4nryl+Dx111CyKAi8GOJiwIpF6C3oikXwOrUok9SgtjXw0slbVTML53g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChnZ8FUV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChnZ8FUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762782951; x=1794318951;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=gW2ZOdjs69+a5A2fYMNn+Zk5oLIl6pB/BV3i3DzqR/g=;
  b=ChnZ8FUVh9QHi0l+mE9J/OYx/7SxeOJHhaccGHhambP97ZtyEtRFz9T3
   tbfnLNkLuk8H0ZQhteLRSvvvqzhYPXmLTrkplEm0LyIwecGa4m0/uJ3VH
   k+GPvKlOA0VPlJJ+fguFu/863kdUd0+mh4sg4R7xvYTiuqVfa/3YC3nvM
   Am1+KGo9zXWSyK0jQkJ2CQU5bl/0yd4rvCzvJIvq/yrbWMIRZ1mL906ZB
   oJkTmdHXFNgsXd/U5MHjfxSfj+/u6YxZaOJ/zmXK8nYLP8/d9QqzqxErB
   VTGZS7JMXa4CH0Pt9+PWapZqGXPSDcfB8EhI8BSAoLnqnCGqW6gjlEOpW
   Q==;
X-CSE-ConnectionGUID: 47iHn2bKScqmkKYhidtCWA==
X-CSE-MsgGUID: zshmM/CLQBC2c21j4ouhqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64532431"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64532431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 05:55:51 -0800
X-CSE-ConnectionGUID: TdTopsaORKGHoCToYgkMWg==
X-CSE-MsgGUID: 0KECLLQTRW+M2kqFKbnm3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188514733"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Nov 2025 05:55:50 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vISN2-0000Ul-05;
	Mon, 10 Nov 2025 13:55:48 +0000
Date: Mon, 10 Nov 2025 21:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Krutskih <devsec@tpz.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] net: fealnx: fixed possible out of band acces to an array
Message-ID: <aRHuxxHBpRnPmkGO@8d1a9004a541>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110134423.432612-1-devsec@tpz.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] net: fealnx: fixed possible out of band acces to an array
Link: https://lore.kernel.org/stable/20251110134423.432612-1-devsec%40tpz.ru

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



