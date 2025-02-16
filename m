Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4011442E8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 20:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739737346; cv=none; b=bVeWkOP+mso0CFJ67UxiXcA6wBuNbnGWQsF4hxIhbab+EVUa6MVPbapGDQCCIjDElmmpBGhItg0I9adhHRC0KwpmiDz53ki/Hn4aFj+YOTxxIhcHFBX0i9hmglhjzrkimGo+IsEKjaDL26CQhWzlRGtw0YbfyXFBwUovAYKPrI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739737346; c=relaxed/simple;
	bh=a5Us3PrQ3IELKZ69K3ExOVYzXJxG1rP3K7AabLpjZiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBfNU4iNov98IISUXACvcsCuH3+7t0vucIQuYyJ50mJhdAM7vgTVRSEDta70yVEx63wwONZZlfydv9qsa9QSKOjS2y8NeLtobgJN/XkyK+jAYm9vLdmN9lzp8S6TC+u+Y98uZ+XSJWt0F4jifMALMh4VpC6ZuLzu1VxFoKZ23KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RD8w1AUF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RD8w1AUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739737345; x=1771273345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a5Us3PrQ3IELKZ69K3ExOVYzXJxG1rP3K7AabLpjZiY=;
  b=RD8w1AUFtZmtoLYiGeM5jk7cgZhKgA9wdf2SrcHdq1s8lNOR+FA4QcFL
   mfS5+TivrINGjia2B7h/+BQfA9Ey/bP/jQ67QWzC0IdHHNPRNUZn2dalD
   Ky1iHAVvWzOhApYcvJTa7bmbMBrEPcdsk+8iM+jc96ai5SyjKo+pRfMI5
   WrnVjpc9PiVJihAZKtouTZF6PKTp0hkTx4XymIq657c/U3E5iM1PL246/
   r1fC6xamD6nM3cDQaYh/J4cmNad188LpkfRPzs+nQVf4gQG0kGI6fvASq
   ZzZcIVLITOTSHjFaoIogYJI50OGvhUu2E383eazZpFL/wN5eTCe7V+++Y
   w==;
X-CSE-ConnectionGUID: DHYWus78ShGwMRhgFrAQgQ==
X-CSE-MsgGUID: rHAtya79RLOoNHgkZgMa1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51832521"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="51832521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 12:22:25 -0800
X-CSE-ConnectionGUID: fbXWpKeeRciwKUMUEHa8dw==
X-CSE-MsgGUID: tGZHl9CvRrKjERQCW2fIHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118095909"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 12:22:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tjl9d-0000000CCrm-42K8;
	Sun, 16 Feb 2025 22:22:17 +0200
Date: Sun, 16 Feb 2025 22:22:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: kernel test robot <lkp@intel.com>, David Gow <davidgow@google.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 3/4] scanf: convert self-test to KUnit
Message-ID: <Z7JI-YtgZzmOtMDK@smile.fi.intel.com>
References: <20250214-scanf-kunit-convert-v8-3-5ea50f95f83c@gmail.com>
 <202502160245.KUrryBJR-lkp@intel.com>
 <CAJ-ks9kkigKG=Nf_mZrA5CA=SUV2sSyY51_rLef42T+ZxCmk1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9kkigKG=Nf_mZrA5CA=SUV2sSyY51_rLef42T+ZxCmk1Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Feb 15, 2025 at 02:52:22PM -0500, Tamir Duberstein wrote:
> On Sat, Feb 15, 2025 at 1:51 PM kernel test robot <lkp@intel.com> wrote:

> I am not able to reproduce these warnings with clang 19.1.7. They also
> don't obviously make sense to me.


Please, when reply, remove boielrplate stuff!
I have just wasted a couple of minutes to understand what's going on in the
message that is 2700 lines of text as the reply to the bot message which was
~700 lines.

-- 
With Best Regards,
Andy Shevchenko


