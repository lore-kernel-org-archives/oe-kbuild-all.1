Received: from box.opentheblackbox.net (box.opentheblackbox.net [172.105.151.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3314A36134
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.151.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708349507; cv=none; b=MdR6CJv7uItamD9V3qYMK3eardrfRJh+pAY/cK+VDtar0kJzNP4tJJH1VTGygqiYClRyr6Eq5sUNZpH8t3wCUtiZu8y8JQj9JmLoFCbgm5EwA8eSKccx77JqVKtP2LBjb5RdiO5OD8VBE3L5FcY+/x+uke2K/f+LQPWe2f7GUWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708349507; c=relaxed/simple;
	bh=Q6IOoXmtA8/Id7dViI0wn18vpjI6UeUqwWfe4QmB44o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rntrDSIjVjeHH39TRhpcNlIKcA6rEd5O5VHHufxHgMZfPlHIFCrtZapqoNaxLDJfIiFsxf30FYJqu5n6ihwuYYjiGGXyNgHt46O10EwQIrGHsUSWVCyfAvgu/Pd4ebD5XJS6MSQvKx/2v2/E4rWMeIf0aZp//IkdBczpSUpoPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pgazz.com; spf=pass smtp.mailfrom=pgazz.com; dkim=pass (2048-bit key) header.d=pgazz.com header.i=@pgazz.com header.b=bo6uwId7; arc=none smtp.client-ip=172.105.151.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pgazz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pgazz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pgazz.com header.i=@pgazz.com header.b="bo6uwId7"
Received: from authenticated-user (box.opentheblackbox.net [172.105.151.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.opentheblackbox.net (Postfix) with ESMTPSA id 5E40C3EAE6;
	Mon, 19 Feb 2024 08:21:44 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pgazz.com; s=mail;
	t=1708348904; bh=Q6IOoXmtA8/Id7dViI0wn18vpjI6UeUqwWfe4QmB44o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bo6uwId7KNUudR5tiFSazuqlENyWl7b1ID+k/FqFBZOgYePn1upRK2voBYBS06pPU
	 1JgGuguZAWvhawVt0WK3sBTLaeAEQmJefZ5VHNopJb3No6opOx7oXLfDcI8VLdl7Se
	 mVmND7SZ9Z8bl5Oy6oqfHFumcmpBQ/GeRx5KRj+6gm2VDWO/JcX5FqYC8sXrNgMGS3
	 /ijJbSw8ZLUS5PLA3GTLPF4f3dCR+xWL3AeA5TxcefxzamIZSj7PHc0aGqsgIM3OOD
	 wIDnkbEpBHOhgRjHiAbDeOI1abLEXHmtuU9C8PXy2rdFUhZNiQOG+95Ud/cX7ejjMQ
	 vcYXYik7P7iHg==
Date: Mon, 19 Feb 2024 08:21:42 -0500
From: Paul Gazzillo <paul@pgazz.com>
To: Baoquan He <bhe@redhat.com>
Cc: kernel test robot <lkp@intel.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 82/320] kismet: WARNING: unmet direct
 dependencies detected for CRASH_DUMP when selected by FA_DUMP
Message-ID: <20240219132142.bdusrf3kcbqtv4ff@dev.opentheblackbox.net>
References: <202402171431.MzqHz3g2-lkp@intel.com>
 <ZdL+sSSFghXttSqR@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdL+sSSFghXttSqR@MiWiFi-R3L-srv>

On 02/19/2024, Baoquan He wrote:
> On 02/17/24 at 02:48pm, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   9951769060d8f5eb001acaca67c1439d2cfe1c6b
> > commit: a5af0b602e5ecb379fd2470669654a6abe7e97a2 [82/320] crash: clean up kdump related config items
> > config: powerpc-kismet-CONFIG_CRASH_DUMP-CONFIG_FA_DUMP-0-0 (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/config)
> > reproduce: (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/reproduce)
> 
> When I tried the step 1 of reproducer, I got failure on installing the
> kmax. Is there other ways I can reproduce the issue? Or have you tested
> the latest linux-next/master because there's some udpate about the
> config items change?
> 
> -------
>  # 1. reproduce by kismet
>     # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
>     kismet --linux-ksrc=linux --selectees CONFIG_CRASH_DUMP --selectors CONFIG_FA_DUMP -a=powerpc
> -------
> 

I am able to install on a fairly fresh x86 ubuntu 23.10 installation.
Could you let me know the platform and OS you are building on?

As for changes to config items, I will look into that.
