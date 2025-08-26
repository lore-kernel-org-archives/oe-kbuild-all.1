Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F10338F2B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756210802; cv=none; b=GpejroghbEOdosrhY1MpNgxsAk7tGCsVKwiFo2fAlFo7GguWhc5jwDfvj3Sr0bmkQ4M6U8TRntSTZ+ogesG3MySr/vhw4bxkxbMrxaWFwhW/CFL+ltMr2v0oSoLA/Qfg7pXi9SCIWjIZsGua5W7GDNTd4EialZa8iw+2/qRISZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756210802; c=relaxed/simple;
	bh=6aREw1bHCV9KrJzMBj4OMKwm1bgr3aDUSaapGbfEHdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=gh+Aa7KXnWQxTsYwl3UZK0YPMw5sgwLwnwN8ua6JVbu4qHEHelhtpubRoODOvJ6LxGQIr0/k8uN2STZcKHGa73l7lfdGDSzfzAnB1cSfG1jVf3gq30Bn+qBkj6cFTiZa6lEMo8z/OxPDZr3H/QFFjyFYwyeFkuHY4ZlQTCiEzO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wq5JCVMW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wq5JCVMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756210795; x=1787746795;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=6aREw1bHCV9KrJzMBj4OMKwm1bgr3aDUSaapGbfEHdk=;
  b=Wq5JCVMW6cMg7PdMfdt+zRidVeHT63eKK6CUM1V+mQ9zd9k9kzEtR9yT
   99LVDcj2Mh6OHz86y4KPA6XOZjE/ycvG9iVxyMxn4bezFiotGHIvCLpMb
   EgWDVTExxpQyGuaGpjZIMfzx+IvslO58U9Rp/IuiOzEPkId4kAnzQXNVK
   7ByMVj5cdvQ/ZfLM27AOgeQZYOJrhet48HWn+tWvl5TWymnusxVGmWXCR
   ZbbtmF+3XnS2W8Ol2oTGIKs9z66qRREnGlYc/WISj5uiJPSigQk9Z721W
   dTprBQnZq4IGBDFk7lj8ECRmBE4d8JJEvY4eRFVX5OnEpUDYTrVhHCzbc
   Q==;
X-CSE-ConnectionGUID: AyBJyYkrQAW+WkWW9//ntw==
X-CSE-MsgGUID: qGlfi+1uSrqGzn2BZWyxCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58384227"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58384227"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 05:19:52 -0700
X-CSE-ConnectionGUID: soED8o4ERKeydM1ye2sWAw==
X-CSE-MsgGUID: yzbwzEmRSD2gzsmwyj73zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="173872456"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Aug 2025 05:19:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqse1-000PIp-0p;
	Tue, 26 Aug 2025 12:19:28 +0000
Date: Tue, 26 Aug 2025 20:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Maes <oscmaes92@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net v2 2/2] selftests: net: add test for destination in
 broadcast packets
Message-ID: <aK2mREroGgOwN4rp@0d8035a08681>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826121750.8451-2-oscmaes92@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net v2 2/2] selftests: net: add test for destination in broadcast packets
Link: https://lore.kernel.org/stable/20250826121750.8451-2-oscmaes92%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



