Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FCC3019D6;
	Tue, 29 Sep 2026 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647731; cv=none; b=pkd9/uTAtyz1CZCQ3d9Ds4qJqqnNJ4w67k/zn9wtRvq/H+EGgwlfGrJk/pmgdJO68APNnXVxDv5c/LS6AApsdsx8rgB3Q/julBrzgY487MpHA7/qIWlSxUCKQXUDG01q9WhhQ0DZJ492YdQxO3ooT4ecAU6lVrd9Ao8k0VHzzDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647731; c=relaxed/simple;
	bh=delfwU9l6L0VwLZE9nQVYZ2E3WYeql8bBRRzxaU4QxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOzKK7msv660LyG+d/2jVNYt+R2NXJm+WPETVQO5PfJDCdbxKa7XQ44Rr1dmLqjErBuYc/A0+jm2xeZaC56fWDZD+5qkFAFs9OxI0ghE7RECqpNFr2pNe7QOYoqOmuez49+0B/nppBn0VRYjvvpqrPen9TV+7E1unWWx8cOo5oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LPOMiNOU; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LPOMiNOU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=MMdGfEjbI33TRWxRJ6WwqYmmQ8/gC0cXsG61yFN+vLg=; b=LPOMiNOUiA6JnJmGjWxA0BBkz1
	ZF3fr7YrtoHwZFNzitbdX7tWaWVzh/2HkZ72mjQANpcD+s1IlWvhEKlMnPvwRhS0k8ieAdmCKx7Z6
	xL7lPNmAmUrWE9Yjan1Hr1R4XZfD0fHNp3rcjc+mHg1HTj3N0278gb0QYEvQqijVuOFMXSt2wH1cp
	XC0RI+pM8+Vx7sieVu2I0JoTQbtf0FyKGmpbihYePauG9pQYFzlqAA2oA6KVnItVh4t9vH1Is0hR7
	O9LohFWhbipu0Dp+dBY7NtNLZ4VigmtVxXk20j8sbneWAUdZkKZJTnK/270c8a/xuXJ4PK330a+8r
	CITORQkA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNGv-0000000269h-1cjm;
	Tue, 29 Sep 2026 02:08:45 +0000
Message-ID: <64a056b9-ad40-4c09-b2f4-ce686ebce86c@infradead.org>
Date: Mon, 28 Sep 2026 19:08:44 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 9482/11456] htmldocs:
 Documentation/filesystems/api-summary:20: ./fs/dcache.c:2010: WARNING: Block
 quote ends without a blank line; unexpected unindent. [docutils]
To: kernel test robot <lkp@intel.com>, NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-doc@vger.kernel.org
References: <202609290155.PQiaOalK-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202609290155.PQiaOalK-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/28/26 4:07 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6375e61c01e93e35ee7acd336a689ac1fae4b509
> commit: 33d76519f0ccb55b975a399f2a9a9c8933fa89d7 [9482/11456] VFS: add d_duplicate()
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260929/202609290155.PQiaOalK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609290155.PQiaOalK-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Ring Design
>    ----------- [docutils]
>    Documentation/filesystems/api-summary:20: ./fs/dcache.c:2009: ERROR: Unexpected indentation. [docutils]
>>> Documentation/filesystems/api-summary:20: ./fs/dcache.c:2010: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>    WARNING: ./include/linux/jbd2.h:523 struct member 'h_invalid' not described in 'jbd2_journal_handle'
>    WARNING: ./include/linux/jbd2.h:523 struct member 'h_invalid' not described in 'jbd2_journal_handle'
>    WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:732 struct member 'power_module' not described in 'amdgpu_display_manager'
>    WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:732 struct member 'hdmi_frl_status_polling_wq' not described in 'amdgpu_display_manager'
>    WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:732 struct member 'hdmi_frl_status_polling_delay_ms' not described in 'amdgpu_display_manager'

I have already sent a patch for this:
https://lore.kernel.org/linux-fsdevel/20260928211000.1539250-1-rdunlap@infradead.org/


-- 
~Randy

