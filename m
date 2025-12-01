Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF8A2C08AD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 14:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764599220; cv=none; b=Q/E9Bwpcy4wc4CvPEfEtThiXO18tfTf5iWva/hYcUvYCd4w/PJI1VWDKfGE3wwhacVe2h2IeMtdXHNTex5VQc1dKT3UC1xSHA3lTrewEE0b7PLH7sO/ylqGxOYGb7EFP8Bx7b9NiMIqXS7Z2WImFeaMf7Ah7H5pK9AUjw5O709g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764599220; c=relaxed/simple;
	bh=869hKQcMxNRD+jvLK5tRtILK7sKwSNewDbx2AN3sxV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Z5kr1xFq7+EMOw/aMthrxEUTdVD76r8KK+cC6bDd0PGyZ+ZW/1zT2vxJYY7HgZ1LRJr8WqCT7uHYkmIl3e321uQmM4qScFbBYWfqutRO+h/rBmRIKHoyGILT8/HcG9xTcKSYKBa+JVCpOfdt8u4jOsDJl+i93zpgiC3zYH8K7uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miqo+XqM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miqo+XqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764599219; x=1796135219;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=869hKQcMxNRD+jvLK5tRtILK7sKwSNewDbx2AN3sxV8=;
  b=miqo+XqMwFV32kdyvqZkPJfgJvgyG6gj2vStCWBiUBogQO806YI0Nv0G
   x2Mvny3so9Th7AsJQt7urP2LzvbYD9Hm8la14SgfA2wUiLK60QxQTgKHz
   Jh3Na/tdb42MwkXML+coXSlPgzGE43sBS42rvW7wfnUHCYXLTusuxQrVt
   XnjEYLjM6/P0jpUhRYTtDzSK/vqmu/hpDD+VP1A4PGxCEzfYOPzNQ9A2V
   id+vZuv4YF6hk9n4rKeoTNIj2NJrRsitIFVvua4BH5mz+p3DpHlhWq9l+
   qSxmYLe8iJmYlmlN7hYMIHQEPTaPYfYeoBe8W39Iz9RkMUQWzyI1aYeC6
   g==;
X-CSE-ConnectionGUID: UNQ9V8LDRP6hnSQROaQ7Nw==
X-CSE-MsgGUID: BBsxq1ePT6GE+icgAeFXRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70152252"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="70152252"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 06:26:59 -0800
X-CSE-ConnectionGUID: lhQOIxaZTTy1NbJfT+HT3g==
X-CSE-MsgGUID: oQ+9Vy7aSZ+DiWT11bsClw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="199025837"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2025 06:26:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ4rf-000000008p7-2XN5;
	Mon, 01 Dec 2025 14:26:55 +0000
Date: Mon, 1 Dec 2025 22:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Fernand Sieber <sieberf@amazon.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] KVM: x86/pmu: Do not accidentally create BTS events
Message-ID: <aS2lgKv0B5c9Av0l@656a63d76ae5>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201142359.344741-1-sieberf@amazon.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] KVM: x86/pmu: Do not accidentally create BTS events
Link: https://lore.kernel.org/stable/20251201142359.344741-1-sieberf%40amazon.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



