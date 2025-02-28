Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ED426AA83
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745540; cv=none; b=qbeBomnL1pDaLlXE6Sge8JOC0isj8vM4N7LjTcYjQdFMwisotXjycE7uNQdAiWlA9ytV8MBCdhVugbMczEqf7vxniQ+Dj2cY36xBYf5BW6KjudN4uuhgPsOkKpawzGmrGKLRNLNQ8mjVuri8HIEY05Meafra4MXDKOSkYSsZs4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745540; c=relaxed/simple;
	bh=XqM5WqihnbemKDDciIHF4nQMqthqgTkWOa0BRrNtGzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsDmdya0TvGD9Ra7q+4ozj/EcU2pkYePDk9dDJ8HOaoRV/sgP6+I2os6CgiJgCWsKy9uLuGtB3cH+QrsO/cDUsARLFJctP5jzOioEVGT+Kp3z/W9Qv3XN4kWT41hN6wvd+/kfTqtsP81F3LWsZ16HA9Wjw8fbmcDiNXtxLvV2VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCrODEEp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCrODEEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740745539; x=1772281539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XqM5WqihnbemKDDciIHF4nQMqthqgTkWOa0BRrNtGzY=;
  b=HCrODEEpukxH999pBA9q1To3k5K6xCTq32SPzO4TckyzC/blt4v7UOLQ
   lIi/IL8HaYaic+Y8TnSq29bIDCIMY8WusPfLBigM0H1PgJen5SBGuyWah
   nR8kAs8+s/0FkSQEO9JG9u/5IBxfPE/emKs2swRf7YxZEwSZZBVOJ1bnk
   G6w7frwNXISrgpomFI8Lid5A4vEG2kObYUgjG8qbjMC1RObAESXp0pJHz
   t1tm1fjTaK3SwvvLwso+hjDRmUtTdznTDfJfDLkbv7qSLHY9x0rrkHfkx
   Dcbf7fW34MZqA7Bqx6Dypbv5qs8hF7/BM/wDBtDPKP+RTnR8CRyehqgCU
   A==;
X-CSE-ConnectionGUID: TgRJchmwSR2HmunHF7txgw==
X-CSE-MsgGUID: uFH+jXGnSbSdKPBOJMKPNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53082759"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="53082759"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:25:38 -0800
X-CSE-ConnectionGUID: +vEAD0khTHaoviOwOBaRTA==
X-CSE-MsgGUID: NHIA2YbBRnSkulEVCiO8IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="122337530"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:25:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnzQo-0000000FwW8-3xEu;
	Fri, 28 Feb 2025 14:25:30 +0200
Date: Fri, 28 Feb 2025 14:25:30 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: kernel test robot <lkp@intel.com>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Kerem Karabay <kekrby@gmail.com>,
	Atharva Tiwari <evepolonium@gmail.com>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z8GrOhRRsCvD_UtB@smile.fi.intel.com>
References: <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <202502280028.1Y9QMcR0-lkp@intel.com>
 <PN3PR01MB9597926E81D2787F2210B84CB8CD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597926E81D2787F2210B84CB8CD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 27, 2025 at 05:28:33PM +0000, Aditya Garg wrote:
> > On 27 Feb 2025, at 10:24 PM, kernel test robot <lkp@intel.com> wrote:
> > ﻿Hi Aditya,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on linus/master]
> > [also build test WARNING on v6.14-rc4 next-20250227]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> 
> A version 7 of this patch has already been submitted, not sure why kernel test robot tested version 4

Because you are too fast to send a new versions. Whenever patch appears in ML
it is seconds/minutes to trigger a bot build, which takes hours. I recommend
spend more time on thinking and discussing, than issuing versions like from
a machine gun.

-- 
With Best Regards,
Andy Shevchenko


