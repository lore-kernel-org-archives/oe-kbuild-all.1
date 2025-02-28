Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FA11EF361
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755249; cv=none; b=Nv2WEW1UZ4duzcPx1xJlLFkNmZuUvHurAfAli/GMPgMiJGI8SGiJKKf270SkOQlOeYN6pmXOhPfTeStG3YqFhul5Qq/NlX0d2UWjgSVJaetRCrsEhPb6ZgLLM8NbzoiW2bthntKG3DBAsnwuwwf09obOXkjdrOS9TtZ2BG1o5b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755249; c=relaxed/simple;
	bh=df4Ax/TuQpGc6YbWG7Fa71aQXsOy689HPK/vkpu5uzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Les/YhKLyBOeihbqSd2qZnGT4AQvb0gnMuIfmviCyot+ETz3xKJ0WbRRh26WaIIHHOFg25SpX5YtOffzzOZS1iiWmYl5rgpK2nL3LXdyfjybbJOAdY1Dle4lXycFl8CIW3drzif765jCg6hu2Jwj2tKSSzq24H6tTiLSrNSf9Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izG1ENr3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izG1ENr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740755248; x=1772291248;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=df4Ax/TuQpGc6YbWG7Fa71aQXsOy689HPK/vkpu5uzA=;
  b=izG1ENr3R8kBwbHadJeKM36QQkqrRFnZqP3rVjmVPgCtHAdKugR0xIfW
   fjyIKhVrTE9GS6gj9cF+SW3++0SnarPx2GkwQ8fYYXvzUjtsEHHtvyh9c
   aiy7+rBHQJ0dACTp1JOtA3r7sv/fSLxuXo8WRqmHSJ3QObck7IwCrDd7e
   ItWZvwFIYAHfI/BiAgmBGc9iiIYsSIasvB5n0j8daFJb/THDU18F3kaPO
   dO3tfnpvs/tbrlKlIQlTikHL+n71w3Az7fcLUuPBwKPAPVfWxY4gvCgUc
   vZvw7bJOXBLMCg8S/motriyBMwAVv7K+TIhgfpx3ugZljQBqCDyqogXcZ
   g==;
X-CSE-ConnectionGUID: 49mmS5tZTYaRprCd+AfUUA==
X-CSE-MsgGUID: WXwxpKCpRkKzsssCwpnKIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45338219"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="45338219"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 07:07:27 -0800
X-CSE-ConnectionGUID: Q1BE9rz4RiSQtPsfG3LcEw==
X-CSE-MsgGUID: R2y67zIeTWuc0IAhC48GrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117387966"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Feb 2025 07:07:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to1x9-000F4s-1I;
	Fri, 28 Feb 2025 15:07:11 +0000
Date: Fri, 28 Feb 2025 23:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 net-next] dpll: Add an assertion to check
 freq_supported_num
Message-ID: <Z8HQ7T_Hw1PBIy7W@35aa5361d0a8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228150210.34404-1-jiashengjiangcool@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v4 net-next] dpll: Add an assertion to check freq_supported_num
Link: https://lore.kernel.org/stable/20250228150210.34404-1-jiashengjiangcool%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



