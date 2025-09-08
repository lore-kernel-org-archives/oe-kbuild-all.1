Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2FA47F4A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 01:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757294026; cv=none; b=Zx3RSDU5vMXMGhVhUxruUNLsLktXXqxPvuKUlzM6V1tDNQU5Kz2nqs7oJMpCYLU2gD7juqydKKPOLmPo5X8aTvd5/82kNGJr/pfOe/pI5+O9ks5MumGo0yHgPxNkz1f/O/F3cw28uGmy3eLSLoabVmc2iCGuhOAIZOFnC0WX5bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757294026; c=relaxed/simple;
	bh=LovxEZUVN0HXeB7/K92XmObqr3XO/FCZttFFM9qe4yg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=U2d5w1+FH9H6tML4fDY/CxPlYgSFuk9Ui+UK69OxzI81CkSnzIcKd8TP/9ZTZpPIBInX0Mv50f/pv1R+/nWc0kijzhvB2OXLuyxh2zr856RJ7GJGawNZPWO3SUAaxKs+pVDezWnwGZJY0jRl5N2qQR1pRl1Fnb2cMrOquYaRj3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEKzgUal; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEKzgUal"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757294025; x=1788830025;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=LovxEZUVN0HXeB7/K92XmObqr3XO/FCZttFFM9qe4yg=;
  b=fEKzgUaluOwkcqQ18Gyayv4bRxKcZmQZd5bU0CPF/iQ5uGs+3u8bAuok
   RcPcmA6ypL175Sd9J1KraPgXytiSzcgnvfPf9OUNOcY6q1QmxQZ9qEzpH
   tOdOBY3mre3AzD1WvXP79fo1twqZ/qx5KylHeRL5GtobqYSCSwI2LitZP
   UHtTT7RrJCWxzSeg8vBRLdy+dDRTq5LzZlUNhLkkGEOMDLzI2Q6dj1dHP
   Ox8lKnotfQUKi62/2qxPs5KI/Mv8Hgz9XXRsHv2MfUYdE9tMOB9engh6k
   Kw8o+Pmoe0ZRuEnra6ciUML79/YkY9zjCBjTqTP8AdyOGbID6y+92b8bv
   w==;
X-CSE-ConnectionGUID: WI2/VpNzS0iWmY4AJO4Wog==
X-CSE-MsgGUID: YlypDyICQLej6s4/TpECYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="77162616"
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="77162616"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 18:13:44 -0700
X-CSE-ConnectionGUID: /17n8mbiQ0OomSVxa6bAGw==
X-CSE-MsgGUID: r0ow5K/wTkywjvWUZby04Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="171926963"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2025 18:13:42 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvQRw-0003N9-0x;
	Mon, 08 Sep 2025 01:13:40 +0000
Date: Mon, 8 Sep 2025 09:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/4] hwmon: (sht21) Documentation cleanup
Message-ID: <aL4tkiW0ukf3FMJo@af736d05e5f8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907-sht2x-v2-1-1c7dc90abf8e@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2 1/4] hwmon: (sht21) Documentation cleanup
Link: https://lore.kernel.org/stable/20250907-sht2x-v2-1-1c7dc90abf8e%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



