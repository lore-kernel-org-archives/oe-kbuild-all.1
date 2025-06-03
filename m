Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356332C327E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748942841; cv=none; b=d+o6e9z5Q9bekUX9+KZhGRbIMLbaAmh9xTkJkH20LmnCIEKwwXxdQn5Tjdb9urLs9ucrVz4ROe9Jy+LlKITOyMLTul2eXRBHSGDOI+U5ALE9cffw3yY7Ew9w02w+nAN6S1fh0MsMprHZekgsxGwtDFTv/YGf79KsSRHScs3FHWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748942841; c=relaxed/simple;
	bh=MroKZKJdSmejGKHKMa7piD9P2JWTv9ja8+WsgjsBK0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ju3Cnk/vdMXpiRlsc7UHC2ZJkEsz7N5D3OLM7VvPioV/BiJshiZwsEo42dcur7nrtTC5NSO0yML2cnQxAH5QSWbqX0IN4NfIPH2k9llT/D86Cbqj4rVhtdkUSZv/YDb4/U3aEBV9fnrq+BFjfxQshBpxB8UrTw8LRyPIhFp8IuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=n/BaFwwB; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="n/BaFwwB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9391923DB71;
	Tue,  3 Jun 2025 11:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1748942289; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lQMj6aDXiO42WEuC1jm+xaWEBndbBPZBmlHAOdAyQcQ=;
	b=n/BaFwwBAjvHeMJpR+m/EjI05W+dAxg1fuYQKyyPMUfXvI+K2NHmH/JWSxL+cXGLttt5UX
	IbAWbzA9KVlTU2h+9i07cqYeG65D9iGe321gHNEgAL6WkwWZDwv52nDnga45EsVByPjjTF
	hL2UjcJh2H8oK0W3K3ZhxuWFShyvCozyZ8XmZyyhTH7Qh32NIGpqN+lauWKFoJ7p3zAcvD
	q7LZkiMK3IelmbKAHABD3y6U8h5MAr2epMcS1Qh2kVvana8SpSilNssNoOkcopRyqf6wz/
	9p115htPtlLeqs7QkdPcx28rkLbgBAsxsMn+iylBya2bCH8503kGBNjHu18ZOg==
Message-ID: <c106f7f9-a46a-4251-851c-14d657d6f4c2@cjdns.fr>
Date: Tue, 3 Jun 2025 11:18:05 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [linux-next:master 13411/13629] kismet: WARNING: unmet direct
 dependencies detected for SERIAL_8250 when selected by ECONET
To: kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <202505270309.E7vPrW5P-lkp@intel.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <202505270309.E7vPrW5P-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 26/05/2025 21:42, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   3be1a7a31fbda82f3604b6c31e4f390110de1b46
> commit: 79ee1d20e37cd553cc961962fca8107e69a0c293 [13411/13629] mips: econet: Fix incorrect Kconfig dependencies
> config: mips-kismet-CONFIG_SERIAL_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20250527/202505270309.E7vPrW5P-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250527/202505270309.E7vPrW5P-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505270309.E7vPrW5P-lkp@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for SERIAL_8250 when selected by ECONET
>     WARNING: unmet direct dependencies detected for SERIAL_8250
>       Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
>       Selected by [y]:
>       - ECONET [=y]
>     
>     WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
>       Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
>       Selected by [y]:
>       - ECONET [=y]
>
I think I'm going to leave this alone for now because I see that 
specifically

selecting things like TTY is not a normal to platforms in /arch/mips.


That said, I'm new here and I do always appreciate best practices guidance.


Thanks,

Caleb

