Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E08425FA05
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452887; cv=none; b=arLmzGzDgrblQdbph/MgqRocHkpBYuVW0m2wiK/FanmdxCuXMkrg0bD2isQFj4RzmKKyv7pUf1bWxd+tR+wyzx2TzOtW2piwIlkl1QkWCgvbZZQt7/X1jfuxJRFjsTI9dlkE2oLWk8h8199m7oy1TE4OTXESzlvGag2wqmbgVt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452887; c=relaxed/simple;
	bh=mZU3OqyhUORbWddHGeK9rYSBeV5FAZ8hvpNJ34a52Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQMG68Wcbk387gK9txTj8Vq29OlPzJ437woBXkdOgUnZZORNXBK7CZtVypC8nP0QO2JueYvRoCxMj8lUM9QDo2M2XLumnh//z4gAhxh1CClMk4HRo16/XpVs8yFf3Zbhxe+wkZCOnd7Y2Ape7zWcXK6IHGztvj4uPDdBkLfN3o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfHG2H/u; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfHG2H/u"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4837584120eso31100005e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Mar 2026 04:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772452884; x=1773057684; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ed1MErcsumTPtgBTSePgCHuSPW3/P+pGc+oILo8JR6s=;
        b=hfHG2H/u1l+QohjVZZF6gokAFvg7VHx3h8Fn0XgfvE+/peT+MOWS3ODAqinNPlEdM0
         6/7FAwLCEfhtjKCQRJY+yDTC5/rScfxDSGyak6HVDNSeYrh3FfpTi8qtYovBXBmZF2yl
         PRlWcDP8A1y3GO4G8YjkLOBhlKPRXWKfya0oh2DHA3emUwONvFKiTWpJ17j42Rujfky4
         ozoUo+lFNm3DiVuIIzhfUMZ6tLJVaiP2cNkG66pYmygZTqKpu4vtlKS5iOtTpizlsJ3Q
         9wPvmJp7r5bJmUKzZ81s9vEgFLfXd6uXzuFTadN9gKiQS3X4go0+BgO7XDUdhoszza2h
         v7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452884; x=1773057684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed1MErcsumTPtgBTSePgCHuSPW3/P+pGc+oILo8JR6s=;
        b=S+4Z/ccXGMjkjeErG3YqSSf4eEPpkiEgUUhyK5PHV62VRni04zLBMdOTh0VqA6wmMo
         +2H7MDDKlwkKwnqMexlW0PrDVaELbrRiJrv1JO5rNHFV6JcKBR4bcMPm7hzMcUUFy3Wm
         MsnalJgXnPirKSsWKD+8RBMxr8RaMpXXx04Kc2Ri9oVaVaWFjwOKlKnCJgnyYeCdrLyE
         WAbfFU0iBaNER2Gl+dmg6y9QjOwLZerFpo5ooyx4V0rNv9A+47xeYJUBgG+O543okiv2
         AIsINT6O7jB9lO4XGTVgs6pOiE8Aap8HpCVnxZnAUQifhtC1BQV/ouKbrIaEfiyfQ0yl
         1IzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2LCukLb7pZG/CyJbUtqCgOfhZNdWgAwYaUxEWj9hh1SEPn8N7Je6Myeu6OUVFS1tyVVm8/W8gwueW0V1i@lists.linux.dev
X-Gm-Message-State: AOJu0YxbG1SZr9fWN7JCjKacec6Gax6fmXscHORSQMvIEKgxIQ0VXb6g
	waqz32QB+JjNU2ObuLQ1/N3Yu7S8iRq6CU92pHe6CldAtuM6cqbmfpUuFMcf441BPdk=
X-Gm-Gg: ATEYQzzpFdrEgUTZY1lEvw7n4yYzVoLmX79ZDYL85VcXcgTU2hwU4nNfQ8/6PuyvCst
	gA8A3a0LwRU8lOUp5m22wwT3MI4hEnszxSxMTi5Z7lEWE8+l7mJkoRFPf4nJHIwnxB4377V/rJg
	SKInQQvDnM6IWbhHy9hP7aDjYeUru8pgYrhUlZdRWt2YS8jRuC09hrv0V7f0JBLoLZRXu3zLpCD
	FTfUwlm4STxcfBnFcWl33Cis3P/XK/sq+aNlbOH8GGzy6v/5VcfvHWmGaKVwpGS3iKNyXRlhQwP
	cz1CYF/ETUd0aBp8HB2Svu1dIqdE6UfEyeStEZGkf6AW+B1j3TC+r8WntcMBy6pZBEfnDh8u271
	2l84FEKj0A/SkTo37PX5NZ6/piMe8tR78wBSS4zbrBNCZF1Yjv/T925qW3jjeiNbV6is5k9Vakq
	FcxGWnIEKPM9WuirKOb0OS7J/Aj60a
X-Received: by 2002:a05:600c:458b:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-483c9bdb6a8mr188236115e9.30.1772452883816;
        Mon, 02 Mar 2026 04:01:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm650910665e9.0.2026.03.02.04.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:01:23 -0800 (PST)
Date: Mon, 2 Mar 2026 15:01:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-next 10/16] fs/netfs/write_issue.c:850
 netfs_writeback_single() warn: inconsistent returns '&ictx->wb_lock'.
Message-ID: <aaV8D4RTkIrcn6jd@stanley.mountain>
References: <202603011243.LsWeX4QE-lkp@intel.com>
 <1276684.1772450239@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1276684.1772450239@warthog.procyon.org.uk>

On Mon, Mar 02, 2026 at 11:17:19AM +0000, David Howells wrote:
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> >   	if (!mutex_trylock(&ictx->wb_lock)) {
> >   		if (wbc->sync_mode == WB_SYNC_NONE) {
> >   			netfs_stat(&netfs_n_wb_lock_skip);
> >   			return 0;
> > 
> > Unlock before returning?
> 
> If mutex_trylock() returns false, we don't have the lock.  Note that it's a
> "try" so it's not guaranteed to work.
> 

Oops.  Sorry, that's my bad.  It's the cleanup_free which cause a
problem.

49866ce7ea8d41 David Howells 2024-12-16  773  int netfs_writeback_single(struct address_space *mapping,
49866ce7ea8d41 David Howells 2024-12-16  774  			   struct writeback_control *wbc,
49866ce7ea8d41 David Howells 2024-12-16  775  			   struct iov_iter *iter)
49866ce7ea8d41 David Howells 2024-12-16  776  {
49866ce7ea8d41 David Howells 2024-12-16  777  	struct netfs_io_request *wreq;
49866ce7ea8d41 David Howells 2024-12-16  778  	struct netfs_inode *ictx = netfs_inode(mapping->host);
49866ce7ea8d41 David Howells 2024-12-16  779  	int ret;
49866ce7ea8d41 David Howells 2024-12-16  780  
49866ce7ea8d41 David Howells 2024-12-16  781  	if (!mutex_trylock(&ictx->wb_lock)) {
49866ce7ea8d41 David Howells 2024-12-16  782  		if (wbc->sync_mode == WB_SYNC_NONE) {
49866ce7ea8d41 David Howells 2024-12-16  783  			netfs_stat(&netfs_n_wb_lock_skip);
49866ce7ea8d41 David Howells 2024-12-16  784  			return 0;
49866ce7ea8d41 David Howells 2024-12-16  785  		}
49866ce7ea8d41 David Howells 2024-12-16  786  		netfs_stat(&netfs_n_wb_lock_wait);
49866ce7ea8d41 David Howells 2024-12-16  787  		mutex_lock(&ictx->wb_lock);
49866ce7ea8d41 David Howells 2024-12-16  788  	}
49866ce7ea8d41 David Howells 2024-12-16  789  
49866ce7ea8d41 David Howells 2024-12-16  790  	wreq = netfs_create_write_req(mapping, NULL, 0, NETFS_WRITEBACK_SINGLE);
49866ce7ea8d41 David Howells 2024-12-16  791  	if (IS_ERR(wreq)) {
49866ce7ea8d41 David Howells 2024-12-16  792  		ret = PTR_ERR(wreq);
49866ce7ea8d41 David Howells 2024-12-16  793  		goto couldnt_start;
49866ce7ea8d41 David Howells 2024-12-16  794  	}
4e45977f1ea9ab David Howells 2026-01-07  795  	wreq->len = iov_iter_count(iter);
4e45977f1ea9ab David Howells 2026-01-07  796  
a1cee75a302b7a David Howells 2026-02-28  797  	ret = netfs_extract_iter(iter, wreq->len, INT_MAX, 0, &wreq->dispatch_cursor.bvecq, 0);
a1cee75a302b7a David Howells 2026-02-28  798  	if (ret < 0)
a1cee75a302b7a David Howells 2026-02-28  799  		goto cleanup_free;

Holing the lock.

a1cee75a302b7a David Howells 2026-02-28  800  	if (ret < wreq->len) {
a1cee75a302b7a David Howells 2026-02-28  801  		ret = -EIO;
a1cee75a302b7a David Howells 2026-02-28  802  		goto cleanup_free;

And here.

a1cee75a302b7a David Howells 2026-02-28  803  	}
a1cee75a302b7a David Howells 2026-02-28  804  
a1cee75a302b7a David Howells 2026-02-28  805  	bvecq_pos_attach(&wreq->collect_cursor, &wreq->dispatch_cursor);
a1cee75a302b7a David Howells 2026-02-28  806  
2b1424cd131cfa David Howells 2025-05-19  807  	__set_bit(NETFS_RREQ_OFFLOAD_COLLECTION, &wreq->flags);
20d72b00ca814d David Howells 2025-05-19  808  	trace_netfs_write(wreq, netfs_write_trace_writeback_single);
49866ce7ea8d41 David Howells 2024-12-16  809  	netfs_stat(&netfs_n_wh_writepages);
49866ce7ea8d41 David Howells 2024-12-16  810  
49866ce7ea8d41 David Howells 2024-12-16  811  	if (__test_and_set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags))
49866ce7ea8d41 David Howells 2024-12-16  812  		wreq->netfs_ops->begin_writeback(wreq);
49866ce7ea8d41 David Howells 2024-12-16  813  
4e45977f1ea9ab David Howells 2026-01-07  814  	for (int s = 0; s < NR_IO_STREAMS; s++) {
4e45977f1ea9ab David Howells 2026-01-07  815  		struct netfs_io_subrequest *subreq;
4e45977f1ea9ab David Howells 2026-01-07  816  		struct netfs_io_stream *stream = &wreq->io_streams[s];
49866ce7ea8d41 David Howells 2024-12-16  817  
4e45977f1ea9ab David Howells 2026-01-07  818  		if (!stream->avail)
4e45977f1ea9ab David Howells 2026-01-07  819  			continue;
49866ce7ea8d41 David Howells 2024-12-16  820  
4e45977f1ea9ab David Howells 2026-01-07  821  		netfs_prepare_write(wreq, stream, 0);
4e45977f1ea9ab David Howells 2026-01-07  822  
4e45977f1ea9ab David Howells 2026-01-07  823  		subreq = stream->construct;
4e45977f1ea9ab David Howells 2026-01-07  824  		subreq->len = wreq->len;
4e45977f1ea9ab David Howells 2026-01-07  825  		stream->submit_len = subreq->len;
4e45977f1ea9ab David Howells 2026-01-07  826  
4e45977f1ea9ab David Howells 2026-01-07  827  		netfs_issue_write(wreq, stream);
49866ce7ea8d41 David Howells 2024-12-16  828  	}
49866ce7ea8d41 David Howells 2024-12-16  829  
a1cee75a302b7a David Howells 2026-02-28  830  	wreq->submitted = wreq->len;
49866ce7ea8d41 David Howells 2024-12-16  831  	smp_wmb(); /* Write lists before ALL_QUEUED. */
49866ce7ea8d41 David Howells 2024-12-16  832  	set_bit(NETFS_RREQ_ALL_QUEUED, &wreq->flags);
49866ce7ea8d41 David Howells 2024-12-16  833  
49866ce7ea8d41 David Howells 2024-12-16  834  	mutex_unlock(&ictx->wb_lock);
                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Drops the lock here.

2b1424cd131cfa David Howells 2025-05-19  835  	netfs_wake_collector(wreq);
49866ce7ea8d41 David Howells 2024-12-16  836  
4e45977f1ea9ab David Howells 2026-01-07  837  	/* TODO: Might want to be async here if WB_SYNC_NONE, but then need to
4e45977f1ea9ab David Howells 2026-01-07  838  	 * wait before modifying.
4e45977f1ea9ab David Howells 2026-01-07  839  	 */
4e45977f1ea9ab David Howells 2026-01-07  840  	ret = netfs_wait_for_write(wreq);
4e45977f1ea9ab David Howells 2026-01-07  841  
a1cee75a302b7a David Howells 2026-02-28  842  cleanup_free:

But the goto cleanup_free gotos are still holding the lock.

regards,
dan carpenter

20d72b00ca814d David Howells 2025-05-19  843  	netfs_put_request(wreq, netfs_rreq_trace_put_return);
49866ce7ea8d41 David Howells 2024-12-16  844  	_leave(" = %d", ret);
49866ce7ea8d41 David Howells 2024-12-16  845  	return ret;
49866ce7ea8d41 David Howells 2024-12-16  846  
49866ce7ea8d41 David Howells 2024-12-16  847  couldnt_start:
49866ce7ea8d41 David Howells 2024-12-16  848  	mutex_unlock(&ictx->wb_lock);
49866ce7ea8d41 David Howells 2024-12-16  849  	_leave(" = %d", ret);
49866ce7ea8d41 David Howells 2024-12-16 @850  	return ret;

