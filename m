Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7670327A12
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516360; cv=none; b=axkLc9dmFlGU1XPYQMnrlsEKGf7og50qlNJuPviO5/6oaADd+pMiRbCld/X7FMzBtLMYaNpCwjgrpYUQi2KMhaqlm2WTfHdbz5j3DeVrjIqfh7XFf9jr8I4J8NF1O4PTy4aR75kPyMz/7Aq6XIVYWXoBbqui2yoc4BleVliRJhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516360; c=relaxed/simple;
	bh=i+W9XBDNiNauWFra8m5tnO4evGE80GW9FRlAsKhJjSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQ1sqOijXwThy3RT0n/rpT9E6WE4zStLgUmewX6ffywV23yvdo3rpK6dAyI4yPKYzv4wyD8CCvVq+WUTFqbePSN4D26UoaZKCRlfiole/LVLGkVUoa5Mvi3wOk6+mbRUpym923gyoUCoSwMxHBOtXj0XYH+9Sx/D7czLfxVDhBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=YYYKTX11; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="YYYKTX11"
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id DB9D240ED4BA;
	Wed, 10 Sep 2025 10:59:17 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1757516351; x=
	1759330752; bh=i+W9XBDNiNauWFra8m5tnO4evGE80GW9FRlAsKhJjSE=; b=Y
	YYKTX1120skmF4K5iqoDxDVBHg32oNKfvR+B6aztF9Tnt/Oo/+9OWd27bdo9O2Kk
	wQVfELlds76JUm75Ov/8Wi+PklFnciue9eEKuEbzYelZZLucyKC6N5/z118QD63x
	rKeSyLC5LNyRGK50EPXer5xQ2Hqud6UljqAo6OZl/I=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id W3HZiSeVnRVE; Wed, 10 Sep 2025 10:59:11 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 73F8C40E2F43;
	Wed, 10 Sep 2025 10:59:11 -0400 (EDT)
Date: Wed, 10 Sep 2025 10:59:10 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
Message-ID: <aMGSPj6VKMDO8dkn@ada.csh.rit.edu>
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu>
 <202509092305.ncd9mzaZ-lkp@intel.com>
 <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
 <CAMuHMdVpdk5JaqXf6LkSWQvZ7FnfyLdMWOJX+7n0=PZ-udH-WA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVpdk5JaqXf6LkSWQvZ7FnfyLdMWOJX+7n0=PZ-udH-WA@mail.gmail.com>

On Wed, Sep 10, 2025 at 04:55:05PM +0200, Geert Uytterhoeven wrote:
> Please don't.  The m68k version is wrong.  I will send a patch to fix it.
Even better. Thanks!
