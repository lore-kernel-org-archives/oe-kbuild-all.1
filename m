Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0551D63D6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744884263; cv=none; b=akGN8CcNRr/KUY6dySf2tY4lFn63SMOHKr41HxcLKJyJ95EikwtJ/SmQKJ5fwo+/QVqZx5skFK9PepTYKb8DbycbibIIWbol8R/9B3/U7a/4ClbQuPvCd/HQibMkykQwXYD0HSA6nKyoNAzz1LW2cIot6IXU+NbNIF52Uzvu/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744884263; c=relaxed/simple;
	bh=1ejl4QUjUvgQwV+ztdp6x40op7FCUexacMfDGZDxHiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbiKUg5fIjKKqvsn5PNCCAQKWBEed7oGbStZD8mjbcqc/0F9uMikoQmt8OBMBqkDEdpKU8CBOWDnrduG5YvClQ7RsLip4OqQk03u7SFy5NisOMKd5Q/nbyQ1t68shPvu+Grk7CAgMOj5WF1ohVuIYLz4ERRvlxQgFOJMxDpYUoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=I7vAR7JL; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="I7vAR7JL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4eDih0+2pqm+KPPPPcNHJ8lMtnAiNQe9UHYGiuPAUq0=; b=I7vAR7JLKgPGbDGYPjYUTHijrg
	ArzaxD7/PefidEpiv0ao9pD1nAX9u9AxEH3cRvDCf9tyU0WGftE+iXJhH2Mif35R6G3Jy0z9rptty
	Ir+cRSE6n9ccsRHtvZ7Px/nF5PcYFteDZNBaKnZfDY6yEWiV/EYZjZsiu1eAk4naS1BhQbskW9PmN
	UGdN63wcQuLWzjkhe1pEsRAr/NTyRLYIZnin5ItYiL0s7WmHmnigmIsiydNyp0K9UcaXzGMV+/l/a
	MLgJer2xkhPr21PcwneAAYNqdGcy04aeSdwR6cVBcGTjo1qs7yHXzSbqrU6/mii4Mw/fN5oTKqu5K
	9hnDgVRw==;
Received: from 179-125-92-204-dinamico.pombonet.net.br ([179.125.92.204] helo=quatroqueijos)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u5M6K-000lF8-79; Thu, 17 Apr 2025 12:04:08 +0200
Date: Thu, 17 Apr 2025 07:04:03 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [char-misc:char-misc-testing 9/9] ERROR: modpost: "init_mknod"
 [drivers/misc/misc_minor_kunit.ko] undefined!
Message-ID: <aADSE4GAAPtnRqOj@quatroqueijos>
References: <202504160338.BjUL3Owb-lkp@intel.com>
 <2025041733-clerical-maybe-f349@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041733-clerical-maybe-f349@gregkh>

On Thu, Apr 17, 2025 at 10:55:52AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Apr 16, 2025 at 03:23:15AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> > head:   9f240f7b8e40bdf35e45fce5c6a5e956db3938ce
> > commit: 9f240f7b8e40bdf35e45fce5c6a5e956db3938ce [9/9] char: misc: add test cases
> > config: riscv-randconfig-002-20250416
> > compiler: riscv32-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build):
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504160338.BjUL3Owb-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > >> ERROR: modpost: "init_mknod" [drivers/misc/misc_minor_kunit.ko] undefined!
> > >> ERROR: modpost: "init_unlink" [drivers/misc/misc_minor_kunit.ko] undefined!
> 
> Thadeu, I'm going to drop both of your patches from my tree now, can you
> fix them up and resend?
> 
> thanks,
> 
> greg k-h

Sure. I will look into those reports and try some randconfigs.

Thanks.
Cascardo.
