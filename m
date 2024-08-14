Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232221B1511
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644360; cv=none; b=fuLhBddTXN0ynKzdnPSBtI/9AzlK+G4pt2G7/bcjUAgJzIEYwi3gUGAxNA2kRhstjyDJsNbXEiQsVB092N6gwDiamo9dh8hEf0RJMGMlUPxEJM/MnY9cWESF7iH5EblD9cmqWy3BFPOO6ov87FF/KgJVwYwyeriKiYeuioiGQFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644360; c=relaxed/simple;
	bh=zEUKT3ZjNTIOlq6erpe5rvFGrB+ezUYVGpwer0LfC54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kVE3nF8LjZiqKx+qXBNJaVuUWQ6kR4KTjevWPMttQC7Cd3DtA1w2eC7b8p6T06shaAA7gZNlCCgGGGAHXbgC21O38jFsGgPYYROMGFvRhLn9u16aVt5REm1Tfg+rjVJpoaXmjJSg6TQRtOzDZaMoPgHGWPDXJKhgSpsvNLL/EMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXMeyD3/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXMeyD3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723644359; x=1755180359;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=zEUKT3ZjNTIOlq6erpe5rvFGrB+ezUYVGpwer0LfC54=;
  b=kXMeyD3/hEflAyU0x8BCHvCbi5dq0KARrodWg0wMDQ8ky1eXX7TTCg0n
   +0i1zzEn3m8E3Pka4aIzHsrkSOpDMZQfLzeuDVa81WYnQs0rVdrl7gVJw
   k01+IAv673efHeUP6Xlnrqx+nYu5m2UVb0XUj4GCm6G2uO4bWhwaYgkgp
   sqdNy35kQVfMPF1fzjOKyPg9Tzrd2U53jOvsfPTsYgA/DyuuY6LXvsxSG
   O37YBNuTzfgXH51AkOT1EP6R6NkWmxU8XFj0DpUZfSnmbcRk40HZ9vUj7
   yIUZTLtVHVbpVMV8PZIRFXkFJNVpj8UyqaMdIxU1/thPPbtdaYaHDtNKk
   Q==;
X-CSE-ConnectionGUID: ggjI9leIQ+ueElhFkPVVFQ==
X-CSE-MsgGUID: +sv9dC4lS/i21THEy8TsQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22031356"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="22031356"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:05:58 -0700
X-CSE-ConnectionGUID: jjsOCGW5Qh29n6eo+uGy+Q==
X-CSE-MsgGUID: E8W8k+2xQ1Ob3CHGzfIrlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="59026995"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Aug 2024 07:05:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seEdP-0001rm-1p;
	Wed, 14 Aug 2024 14:05:55 +0000
Date: Wed, 14 Aug 2024 22:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] EDAC/igen6: Fix conversion of system address to
 physical memory address
Message-ID: <Zry5pxjUMZrXtkXB@6301b87c729b>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814061011.43545-1-qiuxu.zhuo@intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 1/1] EDAC/igen6: Fix conversion of system address to physical memory address
Link: https://lore.kernel.org/stable/20240814061011.43545-1-qiuxu.zhuo%40intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



