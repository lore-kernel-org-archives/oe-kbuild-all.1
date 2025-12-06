Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E12EC0A4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765037506; cv=none; b=bCWBrluIwbziUtp+3iUTRurOhjZ5W7vbWD0FoQ+Xcl0geDB/ZGPBqq4mG4VfaGdQJw8ULEdLlIZfbirQe+ZtLQ+yjBkA6wprmjWwgMyfClJw/K/rVOIrovFgyV4oWtSZYmnrqAWtlmMci1PuJRTAP7Esl9xG7n/Q5bq/xsxLavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765037506; c=relaxed/simple;
	bh=VtlFU6DpxB+ilpCUjENxdzu0rP4WqJRADqrtgJMaFQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iK7dDOmHpYglww9ts8YZLBpcF4oBNJKycbLknrCELd7HgeAExjGcfQXPBd5dXUA3Qq8uQRUobetGVHG67UIhFgBILkrbMsLbhfWvzavgE+5d38RWEYVdUYN25HUXRXVJTaHwkEjVBNl2E5Gb3JiZ8fgIYz3Oy1fKNlCmEjh8D84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQlK+RYu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQlK+RYu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765037504; x=1796573504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VtlFU6DpxB+ilpCUjENxdzu0rP4WqJRADqrtgJMaFQY=;
  b=lQlK+RYu0oQ/by+VPyt/hHp0mmfGP1A6bc+OAdeoU39H34QV3v+woSbg
   TXLUcHoSktqO/7n9ZnHoFjrmZqf3L88aYbEpyMePU3bBKjlsrIPoIOf7/
   txTxSBkQj4qPKy1nTpuX5oc/XqcDQwk+I5NC6s+X19X2zSOApsr5axePb
   2oF9Ynno/JsEljTW/PuHA12pBch0iMZqiSTibCPlM5YEQhi2sOj6mPrPg
   hUqG2v2W5piK/rhOSnYQSRsgyJPQD/TfQ1MyVhpRYxvKE0uPZuGnaO33b
   /JDwf2pn26e5/5M7rhG2wCG1bea3gwqMQszJq7p6ITOLyyHNAkKXqrXK+
   Q==;
X-CSE-ConnectionGUID: 0WJR17xVRKiQX0mLr8h2nA==
X-CSE-MsgGUID: foS2GZ7XSume6Y9BwYJKZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66934527"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="66934527"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 08:11:43 -0800
X-CSE-ConnectionGUID: JeyRu8v2TBaGVyJWvAzNZw==
X-CSE-MsgGUID: VKrntRIFTGuwImxC+qNQyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="200688386"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 08:11:41 -0800
Date: Sat, 6 Dec 2025 18:11:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Tamir Duberstein <tamird@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] printf: add __printf attribute
Message-ID: <aTRVusbSqh5ZBY-o@smile.fi.intel.com>
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wrote:

> This produces better diagnostics when incorrect inputs are passed.

...

> -static void
> +static void __printf(2, 3)

3?!

I think it should be (2, 0). Yes, the both users call it with "%p..." in format
string, but the second parameter tells compiler to check the variadic
arguments, which are absent here. Changing 'const void *p' to '...' will align
it with the given __printf() attribute, but I don't know if this what we want.

>  test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
>  {
>  	char buf[PLAIN_BUF_SIZE];

-- 
With Best Regards,
Andy Shevchenko


