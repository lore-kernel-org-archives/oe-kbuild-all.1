Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC414EC62
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 16:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734366018; cv=none; b=nbT5+DnqJKR5IDE0Bz+jGS3yQ5UaXYtYMt9o1odBy/hoVGuiLkYBsL4AznXmmOgPOrYbOOUjkKBSFqLnBdKq6UlvMDWWZG8O+Psc82NtOG9GKkRcuaQSNZx04I1bARFK5IHsYtcSUot8f2ilIJwD180GurZ0LUtTo62xoBe6PyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734366018; c=relaxed/simple;
	bh=uUF9Z9Zs3aHyVRGIrGnr7Be3iHa4q8Hx3fHmD0edP+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SnE9q6P8zWAaMXdjJd9Hi/3bGmhmASiKmpIqNHYmoLfbHcTd8AY+GFlE2H7cyAVxfr8gLTPxQgE1u4ZUlwXGsqaBpmIRRzqf/wFCG3ybLj+xgW9AslwaFitK0TnBDJpxweF6wUbIxHxI1GFVM8fjPd88arqfyEkbPYpD+KVepoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XG+rJw+w; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XG+rJw+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734366016; x=1765902016;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=uUF9Z9Zs3aHyVRGIrGnr7Be3iHa4q8Hx3fHmD0edP+8=;
  b=XG+rJw+wm53v7D4yrd2TQJNDGqmZlOaPdZGBJd2wID2kwt799WS1c3hL
   JSvINClKWXJ+V/U0BlZNcIv8YEhISxarwJIUf6QEh4Cuq7nmbAJFGy30S
   vij7CorbPZcXiZIRC7WKKCNqm6aQCWzVul+GtlRL8/MvS0U7aIVp7XsPj
   +RbG1q9X8pdcnFxWPyh62Fj1MPSIovEm+thxto6ONqTB9KpA4IpIz2qv1
   2uO03WVq8MAuwFEghuSaGGS8E3XO/Ky3H/LwdX9+BOC1m4xlAAgnSUuoR
   bAr8Tt4JqEXZUb3DHNha9b0r0h669dr4ECDuwCTpQ730k763JtS3zE4YK
   A==;
X-CSE-ConnectionGUID: 1hCR9G/6TXadEZ6/gise/A==
X-CSE-MsgGUID: bRJepDi+QxaArgjG5zATGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38437613"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="38437613"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 08:20:15 -0800
X-CSE-ConnectionGUID: pKKHHSDMQTS5bS+SnxgGXg==
X-CSE-MsgGUID: 0Lkc2PbWSX+XAu1vNM47DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="102272663"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Dec 2024 08:20:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNDpM-000EKC-0W;
	Mon, 16 Dec 2024 16:20:12 +0000
Date: Tue, 17 Dec 2024 00:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nikolay Kuratov <kniv@yandex-team.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] tracing/kprobes: Skip symbol counting logic for
 module symbols in create_local_trace_kprobe()
Message-ID: <Z2BTECT-n5x0lW59@39f568f0a533>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216161145.2584246-1-kniv@yandex-team.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3] tracing/kprobes: Skip symbol counting logic for module symbols in create_local_trace_kprobe()
Link: https://lore.kernel.org/stable/20241216161145.2584246-1-kniv%40yandex-team.ru

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



