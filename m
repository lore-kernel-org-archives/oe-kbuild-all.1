Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF92946C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 04:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719893849; cv=none; b=tT7r0F16s/6I50eipd8L/U+efEdflcPJoDeynNr4AUAasRXqhvD40B4x6ixuTZsF2yvd4IDi8rWrioOtcymaxYP21VMEmh8IJw1lVLpszBc4uylpjw6e0KvwOktrr2OOf2sa6Zmaes3vP2AMCT65R0fDJOhjp6Ixbl/vE287Q0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719893849; c=relaxed/simple;
	bh=4RBsP+gLp7CEDt736ft2qwpPcaY/in2ja5pZhYfph1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CVQ8c7B7zs/pQMFLQJk55ZJ462AYAL0lHxwkUe+uGZ+sEymLFLmZIZaxyEp8QfSZrvnyJcGyJQafXw7ia7iOuvdQ5NOdTvrn+9sQBh38uklnr6oMLSAWkrpdioRKykaZgBE5U18lvMJQhHT+jkeK8cVaLlWCzqEvLI1Cn43h54E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3+AyBJW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3+AyBJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719893847; x=1751429847;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4RBsP+gLp7CEDt736ft2qwpPcaY/in2ja5pZhYfph1U=;
  b=O3+AyBJWsxTmlAgZu6/E13FON4aFuOmeTr4iMCjfArKYj4bEAajvuEux
   mZqE85pU+0LpLui6XAwEFuD9bSNUAjFuYHkUIg6yiIWuGmJNAj6DQcLQ9
   fPCa6RMwGIiWIogRz7PZcO0CSztogbu1bDX0dCWtcQP/RcTXqMfOyUrjU
   lXG4VK5Y9GzDaqoC6lg6CHVt3G1W14/z5lR/aZ37jpOZU0FBigeeL6SQb
   5NyP6W8n7y5rpQ/wbN34ACRnawVhQbqVr/8qhjFgU5Cxej8tL29Nv3ZO9
   lShH1zYej/Eq+9wj4yJuZdESry5WQBiqe4o8iQ3SHgA7zC5ToR6bj+2aa
   g==;
X-CSE-ConnectionGUID: p7+Vg5laRwibWWk+NBMcDw==
X-CSE-MsgGUID: NPUfePP+RsmCtd3cVdZeBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17186717"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="17186717"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 21:17:26 -0700
X-CSE-ConnectionGUID: VayP5luzQQar7sU/J4MTrg==
X-CSE-MsgGUID: UdNM6wJFT5W//+uYn1WPog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="50207570"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jul 2024 21:17:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOUxG-000Nhc-0U;
	Tue, 02 Jul 2024 04:17:22 +0000
Date: Tue, 2 Jul 2024 12:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-net v1 1/4] igc: Fix
 qbv_config_change_errors logics
Message-ID: <ZoN_NLFz3jyc2j29@6724a33121ae>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702040926.3327530-2-faizal.abdul.rahim@linux.intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [Intel-wired-lan] [PATCH iwl-net v1 1/4] igc: Fix qbv_config_change_errors logics
Link: https://lore.kernel.org/stable/20240702040926.3327530-2-faizal.abdul.rahim%40linux.intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



