Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E729BDBD;
	Thu, 12 Feb 2026 22:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770935370; cv=none; b=l3Qz3Exoh44wchbQMFXchh6yqsD2zRxtCY9W8efsRRa+eN3fd2uBFH23oclrwyj+36mxeNHQ3VXvD1VkYQ3LBqb3VLtMxVIdGRxIAJ5jkpsTmCsjxeeRtDJlZYsAvAJNI9JWR1Sf7Jf4ZWNWDyXLy7gYWus1AbgTE61jUOmZoEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770935370; c=relaxed/simple;
	bh=NyMetNcIdsdKshuHQD0P1Xos83ptYZcuAd7WS68k234=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrH/Oxggl3uNkTTwntQVGHbfbKWXUSQoNKzxqPkwoIHgYGRZ+jMdKmTQ6n8ph/OVJY5/5J+fIgqplyZQeliYpDqDfOdi2V1Tc4xEf87Up5cjixkUKhaxqOKM6HIQtB2l8NdoEEQbrLiZwC4XrYJJJZL/dX6sqfRZr5UWbBoWmiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ellf+3OH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ellf+3OH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=L/eIEdErcn+dbwwox8AYHcTsqA7MvgeotAeW9lh+S9Q=; b=ellf+3OHU5PhVjuwINEb0OjwMC
	qC8nMUSrUu5EtdnORTNpZdXP3it5qDoRu+JsGG6TEuWGUj1ycAVKzyKXZabsckOz4zacwH3ktpHm7
	u23aLMo3xX9QKsrG0NapUyAgVRAkDWWYaUBfKjZ0Pv1cgrjbTcdHNufYPJi4iZEOoF3lmwL+hVgBJ
	ALkCO27gIYfRwFmf7yaeRsQzUSYiIA1tEAGNcaCxzDlAjuTZUwYFzlc1129UcTd5eSvhPR7KCdguH
	cDkmMhSWpMfIfmK6MuHfqgL3yNJZM4fgh+PyVSaFzs2D+vnetbk9lCOV9yGkGCvsf8L2bJ3/3ga7w
	FMWxf1pg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqfBZ-00000002hZk-0tqQ;
	Thu, 12 Feb 2026 22:29:21 +0000
Message-ID: <1f066897-5777-40e9-bd34-516dc8d8a250@infradead.org>
Date: Thu, 12 Feb 2026 14:29:20 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 11762/11841] Warning:
 drivers/video/backlight/cgbc_bl.c:29 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
To: kernel test robot <lkp@intel.com>, Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 linux-doc@vger.kernel.org, Petri Karhula <petri.karhula@novatron.fi>
References: <202602130608.bwks5uv5-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202602130608.bwks5uv5-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[adding Petri]


On 2/12/26 2:24 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   af98e93c5c39e6d0b87b42f0a32dd3066f795718
> commit: ce9699c49d159103f86f2be6c37457d50f9cceda [11762/11841] Merge branch 'for-backlight-next' of https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260213/202602130608.bwks5uv5-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130608.bwks5uv5-lkp@intel.com/reproduce)

commit:
Author: Petri Karhula <petri.karhula@novatron.fi>
Date:   Fri Dec 5 12:19:47 2025 +0000
    backlight: Add Congatec Board Controller (CGBC) backlight support

> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602130608.bwks5uv5-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Warning: drivers/video/backlight/cgbc_bl.c:29 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
>     * CGBC backlight driver data
> 

-- 
~Randy

