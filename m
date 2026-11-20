Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165547;
	b=IDzbeYXl7kpyVyy0h2hlZNcdtWfz4FlmK6GPjZgRuXWgfgOLMunqDclZPB9AqwdY5v3h
	 hosSa/jNFRZC/Z8KAo7o1Gp4ivbM6KX9oerRK96bVy+4ks24iIqgPNZJwmGKrjWSllBpG
	 RQ9ETs99e8QJmiGbl5o7VOW2G5EiyHgLv/hjONfOmCDj5OvuISPb97N6YD85ZiaCzIRnf
	 jUI/MEChfv9pWIyU3AioMrUwVPJzsPMuYFO0KfJE/nAoAIEnbtMXcGMFAMGmivdGp3Tbq
	 QqCbJQHk8gfxPlxWSoaRRusX+gJZ06tNiax40AqvdMP+9V0M3ve0H6eCGEZye68f2vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165547;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=DEEgUoL5DK1DT+/ApEeFqZO8zx4boI0YZBbr2DM6hpw=;
	b=o0rphK5jQc5WdsPRuspeDx/3zixdV90l/2xMeeXvmXq/i51+vXpwicQIdX5/dM7rGn4P
	 Y6736PozG18fsci9rL6SlRKRAs2SUhGbSjnLLsBROqB2IG3/egNIy04KF7cTCv/Au0dUo
	 Hwzl6tOjSfGDken7wvKbqN7a+LHWPZ+f75/weXpTe4KjM8lkFqMl3U2irLfeBKDm2bn83
	 e8kduwbN+WV8lIpMlcxIfg0egdE+MjGAr4kMuxLA5UoUqrBWyKcRYmFB1Zlgad9Tsalnv
	 XjioLgTUBKGpDm6fTkRbNmF0PR5yWk4YwOY3+axmCm/Ba0gmb51NoNxcbfhai/Gz09g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XRMXToCR;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE089606A320
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 09:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE089606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XRMXToCR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795165547; x=1826701547;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tB95xnwFwtd7GfeLOYjSaWCffbpfyqEtOlbuZzMQw6o=;
  b=XRMXToCR3rcYjnJwWWfMWYmQCBWe2t25/CIKybreA/0zUUtMhXpMIhim
   zSawSd72MixcjjSxUHsXXMu/qYc08nQqMl8x+Pn+dyindF4bIsCagSL77
   ANXN9SSW8xZq3nftGLbQ8wSBvNK9Y8X3ctIoR5vv5kzDVoD9MHiT9NbAY
   1IbGEOeB+nkgotF/x7zFiUliF/vO1u48jPWmD+7R7nvLhlGkxi7Dek+Tm
   2yMyoG/gauPC2aGicWqSgnwW5Q0IZApRDgtlyo9DP9mADvnbftK6kyIIC
   7sNmUU2kiAbj95HuRu83fqcoPs8wEgu83zbKM5PQ4sIWX+alhmH2wc0Zp
   Q==;
X-CSE-ConnectionGUID: aAwyy8z4Rt2z7amRHINy2g==
X-CSE-MsgGUID: Gh2UXcGjRSWSmvC3R1QQTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4038632"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4038632"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:05:45 -0800
X-CSE-ConnectionGUID: 7YrqIflWQ2Gw32Ia3F11UQ==
X-CSE-MsgGUID: tHSf9/s8R0Cti41ZwWxurQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10559336"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:05:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Nov 2026 11:05:39 +0200 (EET)
To: Ava <ava@oven.ninja>
cc: oe-kbuild-all@lists.linux.dev, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 45/49] Warning:
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter
 'dest' not described in 'strscpy_attr'
In-Reply-To: <20261119202348.sU1Eppmh-lkp@intel.com>
Message-ID: <77d22cea-50db-9fb7-9471-09c011508ebe@linux.intel.com>
References: <20261119202348.sU1Eppmh-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Nov 2026, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
> head:   518e9d2eeaa5a8568951269a47be2182f4674efa
> commit: a2b19337b0da259ba22226440eaa56518ae0571d [45/49] platform/x86: dell-wmi-sysman: replace deprecated strlcpy with strscpy
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261119/20261119202348.sU1Eppmh-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119202348.sU1Eppmh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/20261119202348.sU1Eppmh-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'dest' not described in 'strscpy_attr'
> >> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'src' not described in 'strscpy_attr'
> >> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'size' not described in 'strscpy_attr'
> >> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'dest' not described in 'strscpy_attr'
> >> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'src' not described in 'strscpy_attr'
> >> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'size' not described in 'strscpy_attr'

Hi,

I've dropped this patch from the review-ilpo-next. Please fix the 
kerneldoc problem and send again.

I also noticed another problem while looking at the commit. You need to 
use your name in the Signed-off-by tag, think it similar as signing a 
contract or so. For more information, see:

  Documentation/process/submitting-patches.rst

-- 
 i.

