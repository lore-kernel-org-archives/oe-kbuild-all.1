Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3A5387581
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 09:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442288; cv=none; b=kY/MMHTF6sQwDfqTx9PyGGAjpxaLg59fMOK5HeCEDRIjSIIxEC/E69EequlaNGKejBPa5HTom8Rbwf3A/7cXPcBzYvnresxqcV21d50RQ2gJRn6JboHeeYn3PRLFY6nHaaYXrL66blENrTXbHcdFq61yn7XeP3mlWpkCV936iQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442288; c=relaxed/simple;
	bh=wiZg4QESYaLfSKXmkqAIc0SzRuV0kpN1uIrlXBV7Yu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mtwyR0lTjqIyPZxKU2BgCrPnWPtajBSU1Hg2iZgcLcw+X09AKZF6cFpYQ2bwGsl6wySzXxQU7TFrOwDsjdvQRD2or+XvCLehsIwCMkWbBnSSO8oUed931Ift9ry77tPTBpo3SMvqsXGRySeLGz5mFUJsEKlhYqBAtWcZYT3Kny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uC58ScPd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uC58ScPd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48371119eacso52285935e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Mar 2026 01:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772442285; x=1773047085; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+bEuvjKvnYpY8GTaPhGwnpzsAMFNgIibApkwJ+YvoU=;
        b=uC58ScPdMctO72hbyB4CnpPx9Q1M5e9U6X1AnXSDqtni+5p3psSDDSdZaToqjfwTIZ
         1KG1oe90rdN6WTd2nqBH+P0pjtraRwaYhjztJCFA/YW5nFi1h20V2foWIm4nsQhY28mu
         pbD2sgSBB+cU5xDLB3Jfukzm+uH6TJoFS/Gpjsmn7EN8IbLjuWU3ZNPy2GDMbN7I6sMx
         Diol4/Cy7ekB9qOdwMYP1DgV/qGpg1fTDoE5IPl00Gd5JwO2WzPuLI1TuWbeYqXgl0Ho
         cuXfs16hRVmVi8EyKCaMLDSQHvqIwuEu/fgpuD+lSpnUzEvQl5ifxyHCJERjdgSMZ/It
         AK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442285; x=1773047085;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+bEuvjKvnYpY8GTaPhGwnpzsAMFNgIibApkwJ+YvoU=;
        b=GNhMHqkWZJGiLu2Ns9jM5SdvM84L0fpsvSU5DJ+gAYlcHO+tEX75uSEt8MsQkwzetA
         zLMVbMMRjL2jAQbslqYB6mkl2GLsA6V+YlpjWNRwaYlUlDP8NiyyZuxbKih7md7DULyl
         RSQ5j9TEutpRiYU78uBogTtAuaG+emwYHV+6HaTCoAQK1sua3pxjZYS9FVtl2PpHuXDT
         SLNZCDepy2jl3ti704uXaoT3Uwvoptu4htSf1DcbYD/oaoc6MvHkq7iEd2GIxwOydtLX
         n6UV+7AL7j8kDr6h8tnZzGMT9hCbzP0DZxpQkDQkLofJ1Xd7bmhvjjxAKJXt941Zy9cW
         R5cA==
X-Forwarded-Encrypted: i=1; AJvYcCUps6eUVNVKlaUE742HJxiDeo4m58G2qgbiSjxNS9sHm1tLS5uf9oGlTwGrJj6dTWhodZWxmqw2gt9+DCo6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1CdbqHiojlkp3gMDR8Ewes7ymvsjumoOW/zKDBssJikJ1i+9X
	UzkkEEPw/eSrDVSjy7+PZR/5fboEMiVlzgt6P9MCRfuK6SL+MvPvhJHH4o7LIw8+kWg=
X-Gm-Gg: ATEYQzyRiRNynePBhSZCfXgGbxsa3zCLrC76pIkHU4zDUcnpHv0JtCP/5D9Ao8VWJF5
	F3x5vYS7wTtDXUdihARCICs03bOsPFps+xcTqyavMbeWz9Rion26LmVCZDl5gp2gFXstzOGPRWv
	kzf0xgz7eKWAEx0znXcHJIbeDX4VcsJMQ2ifBA3gaveDjEzhAHz5Cj++dCg8LUpUPiA3PqfZTqJ
	cwgpxWJx+OrUshDfkgif7dAhctX3BX2G4TjXDJq2Eus0yYazEGvL8zl3XtIBNPBvooG8USFKe4w
	BkiIlYS0ZxXjzzUkHwOxKH7uyQlyCsnNOuow549bpm9keU8r72k2REnl4xu0MXTpXkwNKiXV5S9
	qOkCvN5OyyEWb70tqqJniROnR5IUzAeILpj/wAhzAKEqkZPg138mKFZY34Mbgxhre7dPnOuQkyT
	FYWyATmnSZq2TRXhKcl8Jn4PqysA6c
X-Received: by 2002:a05:600c:46d5:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-483c9bb7c16mr190306005e9.3.1772442285409;
        Mon, 02 Mar 2026 01:04:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfbb6d16sm182125425e9.5.2026.03.02.01.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:04:43 -0800 (PST)
Date: Mon, 2 Mar 2026 12:04:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 10/16] fs/netfs/write_issue.c:850
 netfs_writeback_single() warn: inconsistent returns '&ictx->wb_lock'.
Message-ID: <202603011243.LsWeX4QE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   64a2722c2705a6c6f46b7214477a4a0a2106c1b6
commit: a1cee75a302b7af9ddd2449d38863fb935066e80 [10/16] netfs: Switch to using bvecq rather than folio_queue and rolling_buffer
config: x86_64-randconfig-r073-20260301 (https://download.01.org/0day-ci/archive/20260301/202603011243.LsWeX4QE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603011243.LsWeX4QE-lkp@intel.com/

smatch warnings:
fs/netfs/write_issue.c:850 netfs_writeback_single() warn: inconsistent returns '&ictx->wb_lock'.

vim +850 fs/netfs/write_issue.c

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

Unlock before returning?

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
a1cee75a302b7a David Howells 2026-02-28  800  	if (ret < wreq->len) {
a1cee75a302b7a David Howells 2026-02-28  801  		ret = -EIO;
a1cee75a302b7a David Howells 2026-02-28  802  		goto cleanup_free;
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
2b1424cd131cfa David Howells 2025-05-19  835  	netfs_wake_collector(wreq);
49866ce7ea8d41 David Howells 2024-12-16  836  
4e45977f1ea9ab David Howells 2026-01-07  837  	/* TODO: Might want to be async here if WB_SYNC_NONE, but then need to
4e45977f1ea9ab David Howells 2026-01-07  838  	 * wait before modifying.
4e45977f1ea9ab David Howells 2026-01-07  839  	 */
4e45977f1ea9ab David Howells 2026-01-07  840  	ret = netfs_wait_for_write(wreq);
4e45977f1ea9ab David Howells 2026-01-07  841  
a1cee75a302b7a David Howells 2026-02-28  842  cleanup_free:
20d72b00ca814d David Howells 2025-05-19  843  	netfs_put_request(wreq, netfs_rreq_trace_put_return);
49866ce7ea8d41 David Howells 2024-12-16  844  	_leave(" = %d", ret);
49866ce7ea8d41 David Howells 2024-12-16  845  	return ret;
49866ce7ea8d41 David Howells 2024-12-16  846  
49866ce7ea8d41 David Howells 2024-12-16  847  couldnt_start:
49866ce7ea8d41 David Howells 2024-12-16  848  	mutex_unlock(&ictx->wb_lock);
49866ce7ea8d41 David Howells 2024-12-16  849  	_leave(" = %d", ret);
49866ce7ea8d41 David Howells 2024-12-16 @850  	return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

