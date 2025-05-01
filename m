Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC56621019C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 21:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746136379; cv=none; b=YgbznOrQoHt0Dwmkt2L4ZTo8oRxzKkEqtU00cPNtjYN1fQYTX7f3ArApV2Ux3IMXNz0PiGJ+POFr8u1eNScI2Ciwu4XFVf9utzlWLwXjhM6aCuOMzj9Gggt8WvEJdJsQXfKUfDoVymR2yC85grEBVZZKYS/kk5YNjh3UDr0BF4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746136379; c=relaxed/simple;
	bh=VbkOg9ZQ/rtWAm/ir3t/AyiWTocO+YSkRf/qEytI6q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msC+R4RTerWZX4otfN1VJvO/INNDJSt29i5MvUhvfv0mj5FQTI2KfB+sQHTFQPkOBwE8FdCLiCKqnd4mvGRAkm5hGcKvtcMrGYmIS444i7JdOWBb7XCU0ys6pEDYPB3vtyDIb1JPdJYpnamdJ9qgRpj0PRBa+TO3D5GhY4LVOr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T+nN0w07; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T+nN0w07"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VbkOg9ZQ/rtWAm/ir3t/AyiWTocO+YSkRf/qEytI6q4=; b=T+nN0w0742Snlvyo7iTirTB9VA
	llhZntmz4v2Fw4EVu6m4/z440ddlq6kMcVDFw0YheEbLCOzyS2E5sjG5pScedq2hE6KaKKektcGYZ
	w76HXOC5d4z9vJMeHCvTGSPTxiOcXAnnZL4hAMbVKChvoavk0WpWGef9LeZuFYyvnbGVnsYZzl18c
	bdgFjHEHKcf2a99gksO1jT91/qQmupQIp1OBFu+lG2TPLcbygkEilf5EWoEiIV/Sq3fzZkTT4rd9p
	pOLLowvKkst5m2nv8VXvgrEl0zPGq4kExN4VCTr9FN75sIvflyIQvL+OVR0VZ59FYlxM3A4U4Pw0K
	r7rkfu8g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAbpW-0000000Amua-3LWC;
	Thu, 01 May 2025 21:52:30 +0000
Date: Thu, 1 May 2025 22:52:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Shivank Garg <shivankg@amd.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 272/272] include/linux/stddef.h:8:14:
 error: called object is not a function or function pointer
Message-ID: <aBPtHlqpEsNxAiOV@casper.infradead.org>
References: <202505020405.YzD9aNCo-lkp@intel.com>
 <20250501141304.beac3e9d892495eea7a4e9cb@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501141304.beac3e9d892495eea7a4e9cb@linux-foundation.org>

On Thu, May 01, 2025 at 02:13:04PM -0700, Andrew Morton wrote:
> Should this new JFS migration code be wrapped in #ifdef CONFIG_MIGRATION?

Yes
