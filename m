Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBCE248F72
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Oct 2025 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759334964; cv=none; b=DvoXFpTNbpEHhEQ22uxWlvEFl+yJiQdNZ5XbAkIJ23jR3a6jbKsa4njJfsgLRGo8VSBHUHa/sgihGlDh3m1MrqrDnLOhY09O8QhgVKF1A4Axi5VeHBOD5jNo5qP+GovUX95Ysd+Hn5itVKmrAjHWqj5Q7a50/nph8NQIBOhgad8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759334964; c=relaxed/simple;
	bh=TCOpqVg4hyJWiDzdHH3FiBbqr9wRHRe+Ef5F7XTdRjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TQTeqhXum6OCaRn7xfUknljSUyZ0vOZQJsrUDDiX+KUSIOflhjW1S0GlbHozRNjE+s8QggDNsa1e0mNBmY972LgK7CaGPgHMMLvR/jkTlL2+u+sTeX+n7/b3Y5tHQDnvuM+knJ0ZxtM8ng2xPopOWMNKPXK+9L616pNKIsGvjCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwkUDOOP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwkUDOOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759334962; x=1790870962;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=TCOpqVg4hyJWiDzdHH3FiBbqr9wRHRe+Ef5F7XTdRjg=;
  b=NwkUDOOPNqQpw3/Adkow5XfvdMKAEUGVJ0IkYJNE8zAn60p5xl1O4Zk8
   Uspdh1aZ2QqMtsFNAsFDMT7qyRkujEukpydLbBoVUe/UinCsXk3BySiaZ
   dcAD3Exh5yF2NH9BhGrE0AA2ji4UTVYpDLvVU89fnIdzgVNwpOTpSyk97
   YQGnS05UC3NDHxoNNmipmHiKHi1qKf+SQMKgNfWYwyvnnqUwwfb0ex6TJ
   pEkUhMPF6X6mSDb68KvvWH5yanxBAYXg4M5xmVgy/2+y2dI2i6Wya1u9g
   Rsbj0IQY8oqS0d5/5JT/7mVJbd5POQTLArCtADrlnrMOFwXHrHnnFyUaq
   w==;
X-CSE-ConnectionGUID: W/3fLzeJRTqf+lfKAiMcBQ==
X-CSE-MsgGUID: Rd2aG5WnR6KqNwMIZYK9tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61651628"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="61651628"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 09:09:21 -0700
X-CSE-ConnectionGUID: M6KPd9ysQQ+dMwhsEahyJA==
X-CSE-MsgGUID: gkl74EAtQK6IBtJlEvYfuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="209542458"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Oct 2025 09:09:19 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3zOH-00039j-07;
	Wed, 01 Oct 2025 16:09:17 +0000
Date: Thu, 2 Oct 2025 00:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] stable: crypto: sha256 - fix crash at kexec
Message-ID: <aN1SFiV-v3YDfxvl@6acc96db341b>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-stable_crash-v1-1-3071c0bd795e@debian.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] stable: crypto: sha256 - fix crash at kexec
Link: https://lore.kernel.org/stable/20251001-stable_crash-v1-1-3071c0bd795e%40debian.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



