Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D3D274B44
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999641; cv=none; b=u8b4cgLgwRBw8RjY0y54kh45otHMoOXcnvV9SNKjUqUPHgpDKlydYqoQw9FfF+KwFj0eDxjpZ76TPLJKJcwngIJw53dc/ExKqTHsuTdqkhjA5euMjAAesRoPXG/u9ALGJueCzSZRaiZV7IE1pGMXuQBsQZqS1tP8wJQ48G2fHgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999641; c=relaxed/simple;
	bh=t7ELEe4w61rM6xWYOTqFrVYxtgRcsdyr476Zu9Kz1pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JqM2N2jiCiQDXTqiTZ+5KlvUPH3LX/IYnQUFnjSVdr3Sa822KSh4UxlRGjp30Puqp/3+EMfUrT2wtl0u6Oe1F3zXndIoz6Qy/lEFnKu/6Ze0wwjWL1URauQzKv0rDMQFJFlnQ7ImB93wkajFP5Crcw8VMZLjMB0qrVSIesmasZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdeMJfqw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdeMJfqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759999639; x=1791535639;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=t7ELEe4w61rM6xWYOTqFrVYxtgRcsdyr476Zu9Kz1pg=;
  b=OdeMJfqwYSte3MXnFZ697cMIv/4U/ww/AD7gSE4DOB3CSblN33IMlU2W
   /vc9lSxm4jw21j/74I/0LI7rtM5plmdijeDKRegxGEBeeamK+caNGK10w
   MY6rzY/XMNw38QxnzC7eRO2IXaw5z47xSJ4rrMt0p83G+fj1rmdqk9aGV
   +AKXjKaD8uWqS7Js4+QeWgFx/3XMYbPAIcLVfqx6FUrecT069SlwM7hld
   Qs1nO5TkeAECtuwQRQsKoUoT6YbFUfd4xZXXJ+cfsvV4JCFA39OsRunnl
   2J+Ti32QtSE7b6fJ51OIk7xKtseVZ6s2ah9P+mp1Z++tcpdTB+dX864S2
   g==;
X-CSE-ConnectionGUID: XEQcsTYOQlOzKSB87R5Uuw==
X-CSE-MsgGUID: IZN46ghITRKbH3x5hyRagQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66030815"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66030815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 01:47:19 -0700
X-CSE-ConnectionGUID: qTkZKg2zQFux2CK7ok5DVA==
X-CSE-MsgGUID: pxoTrjd0Qhm5qid3Dp6n+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="181088639"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Oct 2025 01:47:18 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6mIt-0000LX-2I;
	Thu, 09 Oct 2025 08:47:15 +0000
Date: Thu, 9 Oct 2025 16:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: pip-izony <eeodqql09@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] Bluetooth: bfusb: Fix buffer over-read in rx processing
 loop
Message-ID: <aOd2c2twr_9GHjSA@d0417ff97f04>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007232941.3742133-2-eeodqql09@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] Bluetooth: bfusb: Fix buffer over-read in rx processing loop
Link: https://lore.kernel.org/stable/20251007232941.3742133-2-eeodqql09%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



