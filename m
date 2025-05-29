Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4987421CFE0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 12:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748520571; cv=none; b=AZFdSra6KzExLlN113smTofUtjFoqaCIt1/UCDk7dtuLSWSFl/QRaxJKGrzP9lDrKys7ObHvcAtDH0haBI5xkrxhNvBY95ZMGfWUfhNX9TAEhB7iXMWhqk78uT4ZbdP5T4vTrmerwOcsFatWHuJVJgzOLH4cxDT1rsy6BtjudQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748520571; c=relaxed/simple;
	bh=5cvDfSXhHIamQ7tSa+65sZaWKHUC01MCO2D9mf/Ewtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpaeaqaU9rbGVUMZlU9MP2LpIR+3dGMG6FI8LA42xMoAxWxVy3HkuqIrbuUlLexPvUIEdDeTC4naxH6Vup48+jqrLZTo3sG1SACsK6XLa5aJHvvlMESI3scP1+5hKuoT/wSfQvhTNVzlTB0W+eynBWi433560inQ33Xi0WBuREM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TX8wg/ww; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TX8wg/ww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748520569; x=1780056569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5cvDfSXhHIamQ7tSa+65sZaWKHUC01MCO2D9mf/Ewtg=;
  b=TX8wg/wwo19XSac9+p6RUG91Zy1E4KFRELi/YMn6+T/adn1OG/eo2Y/2
   Okxb6ggkW89gEyBcz7tkcTp3Cvol3h++VL7sof0JVtG/kT9Hjl9KnWZ6V
   WtVvDo9NoPDft2JcMV2FBXrgTKmKk+HcBNpCwcH3x4aRAF19v5tFhIHBJ
   Ib3i3h+qt6brN63Kqs/+jZEN7B6OSixOX8LIejVZb/0hEcB0BIf8HxNme
   b+i9eb8SpAToJ6Q8A5ITvOUGrQfFQ7jcw61qpsWJx8AKLwr1P91ZyNcLY
   D5OkiXePwJKQ64l2/bKTF9yl/rKh7Qwv721pRCWUp+X8tzHHGIiCC1lc1
   w==;
X-CSE-ConnectionGUID: uNVSYQNaQ1i31h5FH0CBHA==
X-CSE-MsgGUID: V7RxCN98Tn6MCR2Pbjf/6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38201686"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="38201686"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 05:09:28 -0700
X-CSE-ConnectionGUID: P0KBWOvITqaEobngESDWGA==
X-CSE-MsgGUID: tMdyY/dUR6ixjH+0x7Bhvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="148407858"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 29 May 2025 05:09:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 618C514B; Thu, 29 May 2025 15:09:23 +0300 (EEST)
Date: Thu, 29 May 2025 15:09:23 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-kernel@vger.kernel.org, Hongyu Ning <hongyu.ning@linux.intel.com>, 
	stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>, 
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] mm: Fix vmstat after removing NR_BOUNCE
Message-ID: <ap5vclnyogdb2dkqelbf3shtkj535npy6eceuybf5rdm3tl6eg@4pnaui2auwpu>
References: <20250529103832.2937460-1-kirill.shutemov@linux.intel.com>
 <202505291930.NDyeQ06g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505291930.NDyeQ06g-lkp@intel.com>

On Thu, May 29, 2025 at 07:59:40PM +0800, kernel test robot wrote:
> Hi Kirill,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kirill-A-Shutemov/mm-Fix-vmstat-after-removing-NR_BOUNCE/20250529-184044
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything

Wrong base. Use Linus' tree instead.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
