Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3920E009
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739364655; cv=none; b=fZ9wLY+jQmcrf+gpuYayBnUZeKyrMHScru1Z0Sv/Gd7AlEOd/HPndyETX1mDDCG82V49tkOBRpbyPNPKef3bcs7upFah3aOMo67Y6sO0713FHMDzls3Vwn0YMNLmPPdDlxgKEmBoAVNoQGuzaEeHk4bSpamxcGUedkMMhKcMMKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739364655; c=relaxed/simple;
	bh=Pgk//nDMo7FMZG8BzPQaJt0b4UJPww+RrERA2MiMrsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=o8utOjGfI0CcyQRo6GpRXPic0E1HRpOfwCuvJHryDAW02qmsfnX8Qd4S4b7zr++6I6U1MLGEtM/fu4/AJwWsg0FLB8tl/pLeCZFoYkJTGVw1IHty8h+GaVHnB/tNMl2xmI8YGtDBVAw7OjIhNabBbIkgXFk8Rzw0SGG9yFcBz9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzTVj9I5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzTVj9I5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739364654; x=1770900654;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Pgk//nDMo7FMZG8BzPQaJt0b4UJPww+RrERA2MiMrsM=;
  b=bzTVj9I5A3o11N3rj8koZ/Yl8wqB/3Ucwh4ijJIf/oDaWjE/9HjuRhSV
   7lBXuegEWlnbiOhf8W/DaTffM12rBWf+bTR04fUcJPZreAQzGQ1Ub5uPr
   1LmVAdtY30QrfcxjqL3NDQckOHzRmFnAGvVHgKhC8U6GQoIHBKdaRXije
   VT46bd4Yrw986UeprO6ilHHu9Yh7xE0wRA4M6RTJMIjO7XFITeDwX5tNQ
   PQxzGroz+gGeMXI72kUeUv6AuXk1ec3Ac2QeWif33aWwcanuU2qFM7U+L
   gVqQe6x8yQAKY+sIek2V9gj9bXRYhK3AS/JosFIi5z/FQFQoWOhhtlShO
   g==;
X-CSE-ConnectionGUID: FeyGjOkNQtiiDax1P/Ak3Q==
X-CSE-MsgGUID: nUI5oSwMT26eGmrj/6f5vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="65374369"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="65374369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 04:50:52 -0800
X-CSE-ConnectionGUID: 4Lj7gAQgT12VxqUPUZ/EpA==
X-CSE-MsgGUID: y7uq42PqSyq/v9SNFBu+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113720153"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Feb 2025 04:50:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiCCW-0015cF-1g;
	Wed, 12 Feb 2025 12:50:48 +0000
Date: Wed, 12 Feb 2025 20:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net] drop_monitor: fix incorrect initialization order
Message-ID: <Z6yY8LAeUa8s2H4G@daa8e4f1ba6f>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212124653.297647-1-Ilia.Gavrilov@infotecs.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net] drop_monitor: fix incorrect initialization order
Link: https://lore.kernel.org/stable/20250212124653.297647-1-Ilia.Gavrilov%40infotecs.ru

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



