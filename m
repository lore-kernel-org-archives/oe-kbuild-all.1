Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9596A32AAB2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653272; cv=none; b=i+3hMWedTHif/SYthqpl4JJqrwdp0U6JD8Q0+/IH5IuF3BMMzP894+Z7VDILqItMRA2vN42vJUYO/UYjS73VK7zGOUyrXxdrTeAMZy1DtO5JNf6Ns4/Lw1WREWL8HjWrABm9Q/DIE/CbFwwHNTKibBX46VCdlA0406uHOTUKQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653272; c=relaxed/simple;
	bh=PehspMcLAoFMZQxu5wPiKU3Ol7Zzwh8uNmoG+rjBQio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JSoRb22El9ag3UQa74fJyF5Gt7t4n7EgCFF8xV9JOtnAYl+WLOegLOgD99XDZWqrTemM5sDbHhHfG5UJVDEQ6DOxl9uaGbK7yyGzkwCABmS3OU3N+8Q4WiMfwxVtlY/VckJRUyb93NKoRn+nedqNGTOYldc0iVUt4LApv/UKOug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+zjG+aY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+zjG+aY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761653270; x=1793189270;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=PehspMcLAoFMZQxu5wPiKU3Ol7Zzwh8uNmoG+rjBQio=;
  b=W+zjG+aYGhGDg6mmoXNvu6B4AnNlpVoo09KVjug9NB2PoPBmTWuAZDdO
   rCzMTLAAyA+2Q7yNmuylsw5W1zPORwj3H3x2iv0RyUDffRUWfiLtT3qIw
   x06DWL92dcZlFudgetZ8AXtouFki7AFMw6EJaVTarQth7M+rg6J0ODDYk
   xQ5ILS33mUGSu8xoRE/34rJggTqMn+N/4kq96cgRqf9XeKTPYXMCPVIUK
   kI7LYUAkHwDAUA73AyeGuhuCl0Q4b2HXN3Zd61MHnMoFdJmb0ajNeh8UP
   ukmv94kBXZSkn7IGWFzhLqic3kZa49GEiE6A/Mjpd2Y0CkR6oL0xkVgTF
   g==;
X-CSE-ConnectionGUID: s5KW2sjDQOSGPwEaWj20/w==
X-CSE-MsgGUID: OQMjBUkJSOSRhb8Ibs2Qcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63657526"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63657526"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 05:07:49 -0700
X-CSE-ConnectionGUID: Ly3QFMFwQ52sg4PUZ2+pXw==
X-CSE-MsgGUID: 4kbVJ9PVSLOw5axH/7iSig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="184507000"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2025 05:07:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDiUE-000J6r-22;
	Tue, 28 Oct 2025 12:07:40 +0000
Date: Tue, 28 Oct 2025 20:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1] Bluetooth: btusb: add default nvm file
Message-ID: <aQCx72Qf1CgVC6kP@fb33b90f3739>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028120550.2225434-1-quic_shuaz@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v1] Bluetooth: btusb: add default nvm file
Link: https://lore.kernel.org/stable/20251028120550.2225434-1-quic_shuaz%40quicinc.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



