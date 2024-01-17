Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0305CB0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 04:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705466214; cv=none; b=qHcKHCGKxYGmK2PwrVt7WiyO/IjzI3ULfgmi/I5R3pSeSpZMmKu2X6EHc8omBdoO97D1E7WiXck22ppS3d3L69CGaCGIlK3hpwZyrNA2WkYWuzxRDdC3ae3TKHViv7vdAYkXJlu9Met+BTlTgHRd4iTtdP0NpDQcthI9rI7kNoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705466214; c=relaxed/simple;
	bh=aIjX8dpGCEm29eh0oZVuJKq4gpbPS8fO3MsvizSauaQ=;
	h=DKIM-Signature:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:Content-Language:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=WazPiA9pgClXLNB2SZLMinLI97ymTqRuDggprMz+7tb0RkGea4cU57CFZ85TaqAJFr4m+4bG/IGModqQ2uNp2Oqmm0YDIirKLVOlsRYQwD70s1CphQMQxPW3FzevGQGcs9mLXv8RMI0+bfGSuSmnpVMVUrPTcixinXvRz6YcoQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RPkbOKAB; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RPkbOKAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705466210;
	bh=aIjX8dpGCEm29eh0oZVuJKq4gpbPS8fO3MsvizSauaQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=RPkbOKABgIVTvqXY6soL/YrP4XYms2tffaKeNOSFTZVcKS42BMqCQFLBWxEB45NyZ
	 IRL38Gap/V/BuPMnKBrpginTF3YEjhKDLqgA/cz0Vbi6ASjW8VeznlQ2wynlrLHsIC
	 +LeObDpCXnC/RJZrB+ydqdX6qRX/9+TM436oFhZkXG0g6Adt3tKikrKSg9T0X+4oEM
	 lpkrjb/mUQenXIY+ZeKTNzPwXzeShy50Bo1t+cwn4iBAkiF0e/g6PxCY4k/5YAi36w
	 G+RTncxr5qFUoABrowpo+DPWjrsQurVy+FusCypqW7U8CfniVATElXK3tpfC3Hd1K5
	 OCLS4uW+2L15g==
Received: from [100.96.234.34] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 65B0037811F1;
	Wed, 17 Jan 2024 04:36:49 +0000 (UTC)
Message-ID: <2252609d-2685-46c2-987c-47686671d25b@collabora.com>
Date: Wed, 17 Jan 2024 09:36:58 +0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 75/86] hugepage-vmemmap.c:141:26: error:
 'MAP_LENGTH' undeclared
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
References: <202401162313.K6z6Sf6q-lkp@intel.com>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <202401162313.K6z6Sf6q-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This has already been fixed by 00bcfcd47a52 ("selftests: mm:
hugepage-vmemmap fails on 64K page size systems")

On 1/16/24 9:00 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   0665259690a91b4df83cc10b92118ee35512369c
> commit: f5f6467271ba989cc602a8160e08eadd45611ea9 [75/86] selftests/mm: hugepage-vmemmap: conform test to TAP format output
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401162313.K6z6Sf6q-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401162313.K6z6Sf6q-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    hugepage-vmemmap.c: In function 'main':
>>> hugepage-vmemmap.c:141:26: error: 'MAP_LENGTH' undeclared (first use in this function)
>      141 |         if (munmap(addr, MAP_LENGTH))
>          |                          ^~~~~~~~~~
>    hugepage-vmemmap.c:141:26: note: each undeclared identifier is reported only once for each function it appears in
> 

-- 
BR,
Muhammad Usama Anjum
