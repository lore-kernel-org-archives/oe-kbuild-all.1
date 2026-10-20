Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455308;
	b=n39zpcLA4Qi3sl+eqDWvZOEVoUFaScX5RMqPs5Mzd9hLJw6pkIUMLLaBysXBE76aLRIm
	 16SxoQrvZJQgJ5Rj7mTd9Y6zekSpyB55+4l+CDk2b2oB9z+uSvliTHgz9mTM/XdcWx0PE
	 GtehEoxCgFufRM1OqRzmTPTDMLtIWSsAMxNaOrHXxVWRNv2Swx+5o7SPyZPfIPMXCGZWp
	 1p68Iy5OOy2aJlURrFfNuHzi1TrjAyUXHHBCFD0LNi/VKTZY33KnDGEbMofKj8DEt/CjB
	 0/ol5NtmdTHk2H5a6BDaDcHAb14o98NdqQ2gzD+RV5c1jNccU73wXuM/4gBYy3F80zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455308;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gMwSCA1tBp+CoRdXQaeDGzMhZAwfBBlOrh8o+TNRmvw=;
	b=xxJGkLyROfOb1F06whUdN+a2QQUz0mHDNnNX9S8UMXCvoDFwmNEZbF9TwlWglWtIHbSw
	 NDHUPVvSUlF+ggM2SoGFtEx9a6YaNp9KAbPFSDhBjtWWsIW+dW6x72GpdAz3ZsxFgJuH+
	 4OpFIrR0OC9E91gKDRcdCqQsQLyLKiWUZ35GhACz63Gf/ky9mm6Sr/7VF57SEOdBT0mn7
	 tOGpSBCBs3JZk+Qdh4tdHKXgIRb9rkTE5/qiwmT0PH00BOsPRZzGfiZkSqVrasZOa1B1I
	 U7ErBzTcSPa/cAf9vwG1OkOoaY17HHro21KfKorDtL9sdGrVe9EHX3dvrjAcT/VybFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0EwbPc7e;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE439606A31D;
	Tue, 20 Oct 2026 00:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE439606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0EwbPc7e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gMwSCA1tBp+CoRdXQaeDGzMhZAwfBBlOrh8o+TNRmvw=; b=0EwbPc7e5QxnJ7BimyxjOucpJt
	vrAWEoMAgQBq9Dh7Vbm3KbJck6d9GETaW+VGtPO09J6Ifuf60sfuFJniP59aqIYLg1qddfuKmjrTh
	WW4b1lvAuMWvaU1S/Za2TwyHZqK0SeR8Sj361fHlTevKW8yNFixA3SAvUhNTFscsh1OiQpQBoAo8R
	KCgKdjmieRCycMoJ/ne/5DMecvnxYgZAegnCqzVN0Qv2QQoXclDW6LOaKr1RJSke0QJd1YoVdniYJ
	nObP0UzXv2fVKwCYca5oVAVzSX/oxJwo0ZfeEjc7vjRi6BGpSX3LJX8GFCwvlyZe3Tjw4JxDQqovV
	U4monPMw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIxVQ-00000008ZPU-2V6d;
	Tue, 20 Oct 2026 00:15:04 +0000
Message-ID: <a9c10b54-be65-4448-8d1d-fde894336484@infradead.org>
Date: Mon, 19 Oct 2026 17:15:02 -0700
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3622/16987] htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
To: kernel test robot <lkp@intel.com>, Waqar Hameed <waqar.hameed@axis.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <202610151025.1g5IgCv2-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202610151025.1g5IgCv2-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[for kernel-doc people]

On 10/15/26 1:11 AM, kernel test robot wrote:
> Hi Waqar,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   d419d682257d813f6cb7a28e42b35d0edf4ad038
> commit: 3f21de6784a654503cc148169d1f59d89971da13 [3622/16987] power: supply: rt9467: Use POWER_SUPPLY_PROP_LOAD_SWITCH
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)

I am using:
$ docutils --version
docutils-3.13 (Docutils 0.23, Python 3.13.16, on linux)
$ python3 --version
Python 3.13.16


> reproduce: (https://download.01.org/0day-ci/archive/20261015/202610151025.1g5IgCv2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610151025.1g5IgCv2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Using alabaster theme


>>> Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline emphasis start-string without end-string. [docutils]
>    Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]

and I only see one of these warnings (rt9467), although the sources
for them are VERY similar.Why would that happen?
Do we need to fix anything?

> vim +1 Documentation/ABI/testing/sysfs-class-power-rt9467
> 
> eedb923279b78cb ChiaEn Wu 2023-01-03 @1  What:		/sys/class/power_supply/rt9467-*/sysoff_enable
> 
> :::::: The code at line 1 was first introduced by commit
> :::::: eedb923279b78cbfe16dd54dade0d73e9977f118 Documentation: power: rt9467: Document exported sysfs entries
> 
> :::::: TO: ChiaEn Wu <chiaen_wu@richtek.com>
> :::::: CC: Sebastian Reichel <sre@kernel.org>

-- 
~Randy

