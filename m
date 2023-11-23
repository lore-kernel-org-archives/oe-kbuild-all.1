Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679FE2375F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mH+8HYHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700740282; x=1732276282;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=c3bcXnDOVlFpX+Ph2RovZJ6+TK7ouwTaIB2jo3XHN/U=;
  b=mH+8HYHNHntMvj9I8uQc7/TquMSgEx4Rau+NcoHwUPjq86abIyPkj/HL
   S1MENEOVeiO4thr8SPNo8c8bZ13A417+C2nYdx+EEWDrb4A9k2NI4qpwz
   /M3dDmxAwzKBVMCkLYmyI8r+xH/4S0vvxCx7Ntlq7wkUZh9QSsrsKxGF2
   eTDKIhZ6Ti0bLDbKzRUjj74QGWc8+RkHCImhQf/9hsjsOVg4Vzu8xPkyk
   DldknV7vS8SvS3QC3p8WVge4xuMxZbQ4FaT7YnT4VV30xalVn7J+uOND6
   rc3SxG59d2PKUxxZwuKCmpLhKyE7PoRdG8Io3Vdshy3VaXfNWRqOhHuy1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="10929852"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="10929852"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 03:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="15632384"
Received: from mstrobel-mobl.ger.corp.intel.com ([10.252.40.70])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 03:51:18 -0800
Date: Thu, 23 Nov 2023 13:51:15 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: SungHwan Jung <onenowy@gmail.com>
cc: lkp@intel.com, Hans de Goede <hdegoede@redhat.com>, jdelvare@suse.com, 
    jlee@suse.com, linux-hwmon@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux@roeck-us.net, 
    oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org
Subject: Re: Re: [PATCH v2 2/2] platform/x86: acer-wmi: add fan speed monitoring
 for Predator PHN16-71
In-Reply-To: <20231123055323.417287-1-onenowy@gmail.com>
Message-ID: <24bf6134-4111-87bc-1e4d-a84b2fb67443@linux.intel.com>
References: <202311230750.psygl1ot-lkp@intel.com> <20231123055323.417287-1-onenowy@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Nov 2023, SungHwan Jung wrote:

> It is caused by dependency on hwmon. Setting both hwmon and acer-wmi as
> module (or in-kernel) in config fixes this error.

Then you should add
	depends on HWMON
into the Kconfig in the next version of this patch.

-- 
 i.

